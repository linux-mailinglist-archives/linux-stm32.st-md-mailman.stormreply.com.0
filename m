Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1162C1B127B
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 19:02:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD3F0C36B0C;
	Mon, 20 Apr 2020 17:02:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 249F1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 17:02:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.46.94.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60C5D221F4;
 Mon, 20 Apr 2020 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587402151;
 bh=plMzlobQNccyl97bdN7R33bGIDUnUZmwwqOwhihDlNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SQoDVIQpN/VZy7sDK1aZIiMW9C0CDN9KdUol7rsq1Ba1n7p0dX8xxuWNbXmLsRxwu
 huLrKf/jlWP46Vm1R0rOK539k1YpaL60iApYRnV8TgECCfppSF4vkCfNXZE0Fve6n6
 cXHum4o73j41QL2N0V73y4yGVM+3DqG6AqPsHBX8=
From: mani@kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon, 20 Apr 2020 22:32:04 +0530
Message-Id: <20200420170204.24541-3-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420170204.24541-1-mani@kernel.org>
References: <20200420170204.24541-1-mani@kernel.org>
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/2] tty: serial: Add modem control gpio
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/tty/serial/Kconfig       |  1 +
 drivers/tty/serial/stm32-usart.c | 53 ++++++++++++++++++++++++++++++--
 drivers/tty/serial/stm32-usart.h |  1 +
 3 files changed, 53 insertions(+), 2 deletions(-)

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
index 5e93e8d40f59..17c2f3276888 100644
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
+	unsigned int ret;
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
@@ -960,10 +988,31 @@ static int stm32_init_port(struct stm32_port *stm32port,
 
 	stm32port->port.uartclk = clk_get_rate(stm32port->clk);
 	if (!stm32port->port.uartclk) {
-		clk_disable_unprepare(stm32port->clk);
 		ret = -EINVAL;
+		goto err_clk;
+	}
+
+	stm32port->gpios = mctrl_gpio_init(&stm32port->port, 0);
+	if (IS_ERR(stm32port->gpios)) {
+		ret = PTR_ERR(stm32port->gpios);
+		goto err_clk;
 	}
 
+	/* Both CTS/RTS gpios and "st,hw-flow-ctrl" should not be specified */
+	if (stm32port->hw_flow_control) {
+		if (mctrl_gpio_to_gpiod(stm32port->gpios, UART_GPIO_CTS) ||
+		    mctrl_gpio_to_gpiod(stm32port->gpios, UART_GPIO_RTS)) {
+			dev_err(&pdev->dev, "Conflicting RTS/CTS config\n");
+			ret = -EINVAL;
+			goto err_clk;
+		}
+	}
+
+	return ret;
+
+err_clk:
+	clk_disable_unprepare(stm32port->clk);
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
