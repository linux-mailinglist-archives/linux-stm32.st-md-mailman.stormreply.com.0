Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B31ACF32
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 19:58:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE39CC36B0C;
	Thu, 16 Apr 2020 17:58:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2759C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 17:58:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.50.106.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AC7D221EB;
 Thu, 16 Apr 2020 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587059906;
 bh=1RrAUoUNggxa9GfCCTH+HfaKDyL/+0j2ab5DCtyFe+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QfrIJdmjWHjFODLKeI9+YaknavJzKrn9muaHwW4JGvVW1mcruZrwZPnzAAqmOBtld
 hJvlNz3kQRjS2UldMkVlrWfcTjHwGPdpAHnSoR+yg9gDyVuFDSzYquuY5BqDds0Xz5
 JDWp39XK3g0myUet9HF7kkVbm/iejns806TWqdgI=
From: mani@kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Thu, 16 Apr 2020 23:27:28 +0530
Message-Id: <20200416175729.5550-2-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416175729.5550-1-mani@kernel.org>
References: <20200416175729.5550-1-mani@kernel.org>
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] tty: serial: Add modem control gpio
	support for STM32 UART
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Manivannan Sadhasivam <mani@kernel.org>

STM32 UART controllers have the built in modem control support using
dedicated gpios which can be enabled using 'st,hw-flow-ctrl' flag in DT.
But there might be cases where the board design need to use different
gpios for modem control.

For supporting such cases, this commit adds modem control gpio support
to STM32 UART controller using mctrl_gpio driver.

Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/tty/serial/Kconfig       |  1 +
 drivers/tty/serial/stm32-usart.c | 43 +++++++++++++++++++++++++++++++-
 drivers/tty/serial/stm32-usart.h |  1 +
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 0aea76cd67ff..e7a6f2130684 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1462,6 +1462,7 @@ config SERIAL_STM32
 	tristate "STMicroelectronics STM32 serial port support"
 	select SERIAL_CORE
 	depends on ARCH_STM32 || COMPILE_TEST
+	select SERIAL_MCTRL_GPIO if GPIOLIB
 	help
 	  This driver is for the on-chip Serial Controller on
 	  STMicroelectronics STM32 MCUs.
diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 5e93e8d40f59..026982259714 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -31,6 +31,7 @@
 #include <linux/tty_flip.h>
 #include <linux/tty.h>
 
+#include "serial_mctrl_gpio.h"
 #include "stm32-usart.h"
 
 static void stm32_stop_tx(struct uart_port *port);
@@ -510,12 +511,29 @@ static void stm32_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		stm32_set_bits(port, ofs->cr3, USART_CR3_RTSE);
 	else
 		stm32_clr_bits(port, ofs->cr3, USART_CR3_RTSE);
+
+	mctrl_gpio_set(stm32_port->gpios, mctrl);
 }
 
 static unsigned int stm32_get_mctrl(struct uart_port *port)
 {
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	int ret;
+
 	/* This routine is used to get signals of: DCD, DSR, RI, and CTS */
-	return TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
+	ret = TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
+
+	return mctrl_gpio_get(stm32_port->gpios, &ret);
+}
+
+static void stm32_enable_ms(struct uart_port *port)
+{
+	mctrl_gpio_enable_ms(to_stm32_port(port)->gpios);
+}
+
+static void stm32_disable_ms(struct uart_port *port)
+{
+	mctrl_gpio_disable_ms(to_stm32_port(port)->gpios);
 }
 
 /* Transmit stop */
@@ -626,6 +644,9 @@ static void stm32_shutdown(struct uart_port *port)
 	u32 val, isr;
 	int ret;
 
+	/* Disable modem control interrupts */
+	stm32_disable_ms(port);
+
 	val = USART_CR1_TXEIE | USART_CR1_TE;
 	val |= stm32_port->cr1_irq | USART_CR1_RE;
 	val |= BIT(cfg->uart_enable_bit);
@@ -764,6 +785,12 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 		cr3 |= USART_CR3_CTSE | USART_CR3_RTSE;
 	}
 
+	/* Handle modem control interrupts */
+	if (UART_ENABLE_MS(port, termios->c_cflag))
+		stm32_enable_ms(port);
+	else
+		stm32_disable_ms(port);
+
 	usartdiv = DIV_ROUND_CLOSEST(port->uartclk, baud);
 
 	/*
@@ -898,6 +925,7 @@ static const struct uart_ops stm32_uart_ops = {
 	.throttle	= stm32_throttle,
 	.unthrottle	= stm32_unthrottle,
 	.stop_rx	= stm32_stop_rx,
+	.enable_ms	= stm32_enable_ms,
 	.break_ctl	= stm32_break_ctl,
 	.startup	= stm32_startup,
 	.shutdown	= stm32_shutdown,
@@ -964,6 +992,19 @@ static int stm32_init_port(struct stm32_port *stm32port,
 		ret = -EINVAL;
 	}
 
+	stm32port->gpios = mctrl_gpio_init(&stm32port->port, 0);
+	if (IS_ERR(stm32port->gpios))
+		return PTR_ERR(stm32port->gpios);
+
+	/* Both CTS/RTS gpios and "st,hw-flow-ctrl" should not be specified */
+	if (stm32port->hw_flow_control) {
+		if (mctrl_gpio_to_gpiod(stm32port->gpios, UART_GPIO_CTS) ||
+		    mctrl_gpio_to_gpiod(stm32port->gpios, UART_GPIO_RTS)) {
+			dev_err(&pdev->dev, "Conflicting RTS/CTS config\n");
+			return -EINVAL;
+		}
+	}
+
 	return ret;
 }
 
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index db8bf0d4982d..d4c916e78d40 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -274,6 +274,7 @@ struct stm32_port {
 	bool fifoen;
 	int wakeirq;
 	int rdr_mask;		/* receive data register mask */
+	struct mctrl_gpios *gpios; /* modem control gpios */
 };
 
 static struct stm32_port stm32_ports[STM32_MAX_PORTS];
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
