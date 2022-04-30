Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7675C515F38
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Apr 2022 18:28:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22520C628A2;
	Sat, 30 Apr 2022 16:28:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1B99C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Apr 2022 16:28:52 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4D7A383F2D;
 Sat, 30 Apr 2022 18:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651336132;
 bh=JmDInSOXheK1ST8VzCj2CYGxACMZ2cUAFHrTw3Swcqk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dtPVAD3Ac8FPzPkiAt4woV91RVg8hOL7I/cUHRUI4dymXyOgYgOFTDKJ71ruZ99De
 3EXpZaEZQ73T/pPIREwf0TbWAPfNlx6K3pqpkjpBz5Jj7GIZpnzfcpztYKfJKqDd/U
 43m+++3lNQzXJgAPWzBl41IbZPJgFZUgfu75Lj0dSkYsHtryjMQnVmJ8IAy+8/JurK
 WzLRLJDPg+MAHCmOpQMhLQT075VOEkJhkpmPpdIpRK2VIwz/fvoSx2qVk6gcOMHUOg
 scF/L61d3RgdTWxPQbN+7qmgl3WvCq/Vb3n0XRzmaGKcMk76bcz92blVa5gj9LFAz1
 ejsqmGS4P1eDA==
From: Marek Vasut <marex@denx.de>
To: linux-serial@vger.kernel.org
Date: Sat, 30 Apr 2022 18:28:45 +0200
Message-Id: <20220430162845.244655-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220430162845.244655-1-marex@denx.de>
References: <20220430162845.244655-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] serial: stm32: Use TC interrupt to
	deassert GPIO RTS in RS485 mode
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

In case the RS485 mode is emulated using GPIO RTS, use the TC interrupt
to deassert the GPIO RTS, otherwise the GPIO RTS stays asserted after a
transmission ended and the RS485 cannot work.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Erwan Le Ray <erwan.leray@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jean Philippe Romain <jean-philippe.romain@foss.st.com>
Cc: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-serial@vger.kernel.org
---
 drivers/tty/serial/stm32-usart.c | 42 ++++++++++++++++++++++++++++++--
 drivers/tty/serial/stm32-usart.h |  1 +
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 224f359c6051e..764415b8e8f03 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -417,6 +417,14 @@ static void stm32_usart_tx_interrupt_enable(struct uart_port *port)
 		stm32_usart_set_bits(port, ofs->cr1, USART_CR1_TXEIE);
 }
 
+static void stm32_usart_tc_interrupt_enable(struct uart_port *port)
+{
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+
+	stm32_usart_set_bits(port, ofs->cr1, USART_CR1_TCIE);
+}
+
 static void stm32_usart_rx_dma_complete(void *arg)
 {
 	struct uart_port *port = arg;
@@ -442,6 +450,14 @@ static void stm32_usart_tx_interrupt_disable(struct uart_port *port)
 		stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_TXEIE);
 }
 
+static void stm32_usart_tc_interrupt_disable(struct uart_port *port)
+{
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+
+	stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_TCIE);
+}
+
 static void stm32_usart_rs485_rts_enable(struct uart_port *port)
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
@@ -585,6 +601,13 @@ static void stm32_usart_transmit_chars(struct uart_port *port)
 	u32 isr;
 	int ret;
 
+	if (!stm32_port->hw_flow_control &&
+	    port->rs485.flags & SER_RS485_ENABLED) {
+		stm32_port->txdone = false;
+		stm32_usart_tc_interrupt_disable(port);
+		stm32_usart_rs485_rts_enable(port);
+	}
+
 	if (port->x_char) {
 		if (stm32_usart_tx_dma_started(stm32_port) &&
 		    stm32_usart_tx_dma_enabled(stm32_port))
@@ -625,8 +648,14 @@ static void stm32_usart_transmit_chars(struct uart_port *port)
 	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 
-	if (uart_circ_empty(xmit))
+	if (uart_circ_empty(xmit)) {
 		stm32_usart_tx_interrupt_disable(port);
+		if (!stm32_port->hw_flow_control &&
+		    port->rs485.flags & SER_RS485_ENABLED) {
+			stm32_port->txdone = true;
+			stm32_usart_tc_interrupt_enable(port);
+		}
+	}
 }
 
 static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
@@ -640,6 +669,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 
 	sr = readl_relaxed(port->membase + ofs->isr);
 
+	if (!stm32_port->hw_flow_control &&
+	    port->rs485.flags & SER_RS485_ENABLED &&
+	    (sr & USART_SR_TC)) {
+		stm32_usart_tc_interrupt_disable(port);
+		stm32_usart_rs485_rts_disable(port);
+	}
+
 	if ((sr & USART_SR_RTOF) && ofs->icr != UNDEF_REG)
 		writel_relaxed(USART_ICR_RTOCF,
 			       port->membase + ofs->icr);
@@ -763,8 +799,10 @@ static void stm32_usart_start_tx(struct uart_port *port)
 {
 	struct circ_buf *xmit = &port->state->xmit;
 
-	if (uart_circ_empty(xmit) && !port->x_char)
+	if (uart_circ_empty(xmit) && !port->x_char) {
+		stm32_usart_rs485_rts_disable(port);
 		return;
+	}
 
 	stm32_usart_rs485_rts_enable(port);
 
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index d734c4a5fd24c..ee69c203b926d 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -271,6 +271,7 @@ struct stm32_port {
 	bool hw_flow_control;
 	bool swap;		 /* swap RX & TX pins */
 	bool fifoen;
+	bool txdone;
 	int rxftcfg;		/* RX FIFO threshold CFG      */
 	int txftcfg;		/* TX FIFO threshold CFG      */
 	bool wakeup_src;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
