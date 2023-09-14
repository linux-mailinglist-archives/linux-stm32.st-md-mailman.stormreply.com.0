Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD647A0CF3
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 20:39:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50766C6A5EF;
	Thu, 14 Sep 2023 18:39:08 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 469BFC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 18:39:07 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1694716746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKeNVbVjwksjd/VmSoAQYxVaHBv/5OG3sedFCpkRsng=;
 b=Zok7KIO1sf2sQrUBxCpReXcwNgovJJo3TQk9Va9ngMmNG3AryHhetikJI0GCmiS+5HryWM
 AQHRLPaFun5eJ+1hJABISNGyFPW2fywbBD7kfDu3ve3eTRBPmNoqKRqO3OAWanzuGraGk5
 9bGD1E29Dfc/2gwzF1I2fyHss5YgnYj8SKem1Pj/SBu7hP7Zg96e19xdHVz+vobiJbb7Bw
 VwFXMtIbnnB4ROptIVv0X+93m71RN4tqVNHSBSdqPq1h73JiN2aMmBfhsQ+sdplfVWA+df
 vz/jdhf3G3YrtGlW4K4ySs6U9U1ncrkzc+y+SH2Yx2xLPu/osSaFASFu0J3OIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1694716746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKeNVbVjwksjd/VmSoAQYxVaHBv/5OG3sedFCpkRsng=;
 b=o/uWRXq66VfgPaYRNsiMb5R1jUXjAc5caA9+Borc2nbah4BDfr9H2FCygUY0QSd0kIIvbX
 gzCljlqN20TtNfAg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 14 Sep 2023 20:44:21 +0206
Message-Id: <20230914183831.587273-65-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Petr Mladek <pmladek@suse.com>,
 linux-serial@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH tty v1 64/74] serial: stm32: Use port lock
	wrappers
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

From: Thomas Gleixner <tglx@linutronix.de>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

To avoid adding this functionality to all UART drivers, wrap the
spin_[un]lock*() invocations for uart_port::lock into helper functions
which just contain the spin_[un]lock*() invocations for now. In a
subsequent step these helpers will gain the console synchronization
mechanisms.

Converted with coccinelle. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/tty/serial/stm32-usart.c | 38 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 5e9cf0c48813..8c51ec9433d6 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -537,7 +537,7 @@ static void stm32_usart_rx_dma_complete(void *arg)
 	unsigned int size;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 	size = stm32_usart_receive_chars(port, false);
 	uart_unlock_and_check_sysrq_irqrestore(port, flags);
 	if (size)
@@ -643,9 +643,9 @@ static void stm32_usart_tx_dma_complete(void *arg)
 	stm32_usart_tx_dma_terminate(stm32port);
 
 	/* Let's see if we have pending data to send */
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 	stm32_usart_transmit_chars(port);
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static void stm32_usart_tx_interrupt_enable(struct uart_port *port)
@@ -889,7 +889,7 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 	if (!stm32_port->throttled) {
 		if (((sr & USART_SR_RXNE) && !stm32_usart_rx_dma_started(stm32_port)) ||
 		    ((sr & USART_SR_ERR_MASK) && stm32_usart_rx_dma_started(stm32_port))) {
-			spin_lock(&port->lock);
+			uart_port_lock(port);
 			size = stm32_usart_receive_chars(port, false);
 			uart_unlock_and_check_sysrq(port);
 			if (size)
@@ -898,14 +898,14 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 	}
 
 	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
-		spin_lock(&port->lock);
+		uart_port_lock(port);
 		stm32_usart_transmit_chars(port);
-		spin_unlock(&port->lock);
+		uart_port_unlock(port);
 	}
 
 	/* Receiver timeout irq for DMA RX */
 	if (stm32_usart_rx_dma_started(stm32_port) && !stm32_port->throttled) {
-		spin_lock(&port->lock);
+		uart_port_lock(port);
 		size = stm32_usart_receive_chars(port, false);
 		uart_unlock_and_check_sysrq(port);
 		if (size)
@@ -993,7 +993,7 @@ static void stm32_usart_throttle(struct uart_port *port)
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	/*
 	 * Pause DMA transfer, so the RX data gets queued into the FIFO.
@@ -1006,7 +1006,7 @@ static void stm32_usart_throttle(struct uart_port *port)
 		stm32_usart_clr_bits(port, ofs->cr3, stm32_port->cr3_irq);
 
 	stm32_port->throttled = true;
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 /* Unthrottle the remote, the input buffer can now accept data. */
@@ -1016,7 +1016,7 @@ static void stm32_usart_unthrottle(struct uart_port *port)
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 	stm32_usart_set_bits(port, ofs->cr1, stm32_port->cr1_irq);
 	if (stm32_port->cr3_irq)
 		stm32_usart_set_bits(port, ofs->cr3, stm32_port->cr3_irq);
@@ -1030,7 +1030,7 @@ static void stm32_usart_unthrottle(struct uart_port *port)
 	if (stm32_port->rx_ch)
 		stm32_usart_rx_dma_start_or_resume(port);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 /* Receive stop */
@@ -1158,7 +1158,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
 
 	baud = uart_get_baud_rate(port, termios, old, 0, port->uartclk / 8);
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	ret = readl_relaxed_poll_timeout_atomic(port->membase + ofs->isr,
 						isr,
@@ -1349,7 +1349,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
 	writel_relaxed(cr1, port->membase + ofs->cr1);
 
 	stm32_usart_set_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 
 	/* Handle modem control interrupts */
 	if (UART_ENABLE_MS(port, termios->c_cflag))
@@ -1399,9 +1399,9 @@ static void stm32_usart_pm(struct uart_port *port, unsigned int state,
 		pm_runtime_get_sync(port->dev);
 		break;
 	case UART_PM_STATE_OFF:
-		spin_lock_irqsave(&port->lock, flags);
+		uart_port_lock_irqsave(port, &flags);
 		stm32_usart_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
-		spin_unlock_irqrestore(&port->lock, flags);
+		uart_port_unlock_irqrestore(port, flags);
 		pm_runtime_put_sync(port->dev);
 		break;
 	}
@@ -1884,9 +1884,9 @@ static void stm32_usart_console_write(struct console *co, const char *s,
 	int locked = 1;
 
 	if (oops_in_progress)
-		locked = spin_trylock_irqsave(&port->lock, flags);
+		locked = uart_port_trylock_irqsave(port, &flags);
 	else
-		spin_lock_irqsave(&port->lock, flags);
+		uart_port_lock_irqsave(port, &flags);
 
 	/* Save and disable interrupts, enable the transmitter */
 	old_cr1 = readl_relaxed(port->membase + ofs->cr1);
@@ -1900,7 +1900,7 @@ static void stm32_usart_console_write(struct console *co, const char *s,
 	writel_relaxed(old_cr1, port->membase + ofs->cr1);
 
 	if (locked)
-		spin_unlock_irqrestore(&port->lock, flags);
+		uart_port_unlock_irqrestore(port, flags);
 }
 
 static int stm32_usart_console_setup(struct console *co, char *options)
@@ -2035,7 +2035,7 @@ static int __maybe_unused stm32_usart_serial_en_wakeup(struct uart_port *port,
 		 * low-power mode.
 		 */
 		if (stm32_port->rx_ch) {
-			spin_lock_irqsave(&port->lock, flags);
+			uart_port_lock_irqsave(port, &flags);
 			/* Poll data from DMA RX buffer if any */
 			if (!stm32_usart_rx_dma_pause(stm32_port))
 				size += stm32_usart_receive_chars(port, true);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
