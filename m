Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E253C58694E
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92355C64103;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from luna (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 [86.15.83.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D34CC03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 21:24:37 +0000 (UTC)
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oEdep-001ttl-2D;
 Thu, 21 Jul 2022 22:24:31 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 21 Jul 2022 22:24:30 +0100
Message-Id: <20220721212430.453192-1-ben-linux@fluff.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:11 +0000
Cc: gregkh@linuxfoundation.org, Ben Dooks <ben-linux@fluff.org>,
 jirislaby@kernel.org, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH] serial: stm32: make info structs static to
	avoid sparse warnings
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

The info structs are local only to the stm32-usart.c driver and are
triggering sparse warnings about being undecalred. Move these into
the main driver code and make them static to avoid the following
warnings:

drivers/tty/serial/stm32-usart.h:42:25: warning: symbol 'stm32f4_info' was not declared. Should it be static?
drivers/tty/serial/stm32-usart.h:63:25: warning: symbol 'stm32f7_info' was not declared. Should it be static?
drivers/tty/serial/stm32-usart.h:85:25: warning: symbol 'stm32h7_info' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/tty/serial/stm32-usart.c | 69 ++++++++++++++++++++++++++++++++
 drivers/tty/serial/stm32-usart.h | 68 -------------------------------
 2 files changed, 69 insertions(+), 68 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 0973b03eeeaa..01f1ab2c18c0 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -35,6 +35,75 @@
 #include "serial_mctrl_gpio.h"
 #include "stm32-usart.h"
 
+
+/* Register offsets */
+static struct stm32_usart_info stm32f4_info = {
+	.ofs = {
+		.isr	= 0x00,
+		.rdr	= 0x04,
+		.tdr	= 0x04,
+		.brr	= 0x08,
+		.cr1	= 0x0c,
+		.cr2	= 0x10,
+		.cr3	= 0x14,
+		.gtpr	= 0x18,
+		.rtor	= UNDEF_REG,
+		.rqr	= UNDEF_REG,
+		.icr	= UNDEF_REG,
+	},
+	.cfg = {
+		.uart_enable_bit = 13,
+		.has_7bits_data = false,
+		.fifosize = 1,
+	}
+};
+
+static struct stm32_usart_info stm32f7_info = {
+	.ofs = {
+		.cr1	= 0x00,
+		.cr2	= 0x04,
+		.cr3	= 0x08,
+		.brr	= 0x0c,
+		.gtpr	= 0x10,
+		.rtor	= 0x14,
+		.rqr	= 0x18,
+		.isr	= 0x1c,
+		.icr	= 0x20,
+		.rdr	= 0x24,
+		.tdr	= 0x28,
+	},
+	.cfg = {
+		.uart_enable_bit = 0,
+		.has_7bits_data = true,
+		.has_swap = true,
+		.fifosize = 1,
+	}
+};
+
+static struct stm32_usart_info stm32h7_info = {
+	.ofs = {
+		.cr1	= 0x00,
+		.cr2	= 0x04,
+		.cr3	= 0x08,
+		.brr	= 0x0c,
+		.gtpr	= 0x10,
+		.rtor	= 0x14,
+		.rqr	= 0x18,
+		.isr	= 0x1c,
+		.icr	= 0x20,
+		.rdr	= 0x24,
+		.tdr	= 0x28,
+	},
+	.cfg = {
+		.uart_enable_bit = 0,
+		.has_7bits_data = true,
+		.has_swap = true,
+		.has_wakeup = true,
+		.has_fifo = true,
+		.fifosize = 16,
+	}
+};
+
 static void stm32_usart_stop_tx(struct uart_port *port);
 static void stm32_usart_transmit_chars(struct uart_port *port);
 static void __maybe_unused stm32_usart_console_putchar(struct uart_port *port, unsigned char ch);
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index ee69c203b926..0ec41a732c88 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -38,74 +38,6 @@ struct stm32_usart_info {
 
 #define UNDEF_REG 0xff
 
-/* Register offsets */
-struct stm32_usart_info stm32f4_info = {
-	.ofs = {
-		.isr	= 0x00,
-		.rdr	= 0x04,
-		.tdr	= 0x04,
-		.brr	= 0x08,
-		.cr1	= 0x0c,
-		.cr2	= 0x10,
-		.cr3	= 0x14,
-		.gtpr	= 0x18,
-		.rtor	= UNDEF_REG,
-		.rqr	= UNDEF_REG,
-		.icr	= UNDEF_REG,
-	},
-	.cfg = {
-		.uart_enable_bit = 13,
-		.has_7bits_data = false,
-		.fifosize = 1,
-	}
-};
-
-struct stm32_usart_info stm32f7_info = {
-	.ofs = {
-		.cr1	= 0x00,
-		.cr2	= 0x04,
-		.cr3	= 0x08,
-		.brr	= 0x0c,
-		.gtpr	= 0x10,
-		.rtor	= 0x14,
-		.rqr	= 0x18,
-		.isr	= 0x1c,
-		.icr	= 0x20,
-		.rdr	= 0x24,
-		.tdr	= 0x28,
-	},
-	.cfg = {
-		.uart_enable_bit = 0,
-		.has_7bits_data = true,
-		.has_swap = true,
-		.fifosize = 1,
-	}
-};
-
-struct stm32_usart_info stm32h7_info = {
-	.ofs = {
-		.cr1	= 0x00,
-		.cr2	= 0x04,
-		.cr3	= 0x08,
-		.brr	= 0x0c,
-		.gtpr	= 0x10,
-		.rtor	= 0x14,
-		.rqr	= 0x18,
-		.isr	= 0x1c,
-		.icr	= 0x20,
-		.rdr	= 0x24,
-		.tdr	= 0x28,
-	},
-	.cfg = {
-		.uart_enable_bit = 0,
-		.has_7bits_data = true,
-		.has_swap = true,
-		.has_wakeup = true,
-		.has_fifo = true,
-		.fifosize = 16,
-	}
-};
-
 /* USART_SR (F4) / USART_ISR (F7) */
 #define USART_SR_PE		BIT(0)
 #define USART_SR_FE		BIT(1)
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
