Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406122D837
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jul 2020 16:50:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D92AEC36B27;
	Sat, 25 Jul 2020 14:50:05 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 747C5C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jul 2020 14:50:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BDTWF4GC3z1qs03;
 Sat, 25 Jul 2020 16:50:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BDTWF3T2cz1qr5G;
 Sat, 25 Jul 2020 16:50:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id r5q1MyADoMcV; Sat, 25 Jul 2020 16:50:00 +0200 (CEST)
X-Auth-Info: UU9uXTc+bnB6IxSZRb7MZKChlEBkzB6qeQAsbGeSug8=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 25 Jul 2020 16:50:00 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-serial@vger.kernel.org
Date: Sat, 25 Jul 2020 16:49:47 +0200
Message-Id: <20200725144947.537007-1-marex@denx.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V2] serial: stm32: Add RS485 RTS GPIO control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

While the STM32 does support RS485 drive-enable control within the
UART IP itself, some systems have the drive-enable line connected
to a pin which cannot be pinmuxed as RTS. Add support for toggling
the RTS GPIO line using the modem control GPIOs to provide at least
some sort of emulation.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: Use mctrl_gpio_set() instead of stm32_set_mctrl()
---
 drivers/tty/serial/stm32-usart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index d1c5e536a167..143300a80090 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -129,9 +129,13 @@ static int stm32_config_rs485(struct uart_port *port,
 		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
 			cr3 &= ~USART_CR3_DEP;
 			rs485conf->flags &= ~SER_RS485_RTS_AFTER_SEND;
+			mctrl_gpio_set(stm32_port->gpios,
+					stm32_port->port.mctrl & ~TIOCM_RTS);
 		} else {
 			cr3 |= USART_CR3_DEP;
 			rs485conf->flags |= SER_RS485_RTS_AFTER_SEND;
+			mctrl_gpio_set(stm32_port->gpios,
+					stm32_port->port.mctrl | TIOCM_RTS);
 		}
 
 		writel_relaxed(cr3, port->membase + ofs->cr3);
@@ -847,9 +851,13 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
 			cr3 &= ~USART_CR3_DEP;
 			rs485conf->flags &= ~SER_RS485_RTS_AFTER_SEND;
+			mctrl_gpio_set(stm32_port->gpios,
+					stm32_port->port.mctrl & ~TIOCM_RTS);
 		} else {
 			cr3 |= USART_CR3_DEP;
 			rs485conf->flags |= SER_RS485_RTS_AFTER_SEND;
+			mctrl_gpio_set(stm32_port->gpios,
+					stm32_port->port.mctrl | TIOCM_RTS);
 		}
 
 	} else {
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
