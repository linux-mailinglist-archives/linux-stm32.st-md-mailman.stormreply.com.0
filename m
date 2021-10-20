Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F83E434E88
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Oct 2021 17:04:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9C94C5C85C;
	Wed, 20 Oct 2021 15:04:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8344EC5C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 15:03:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KD3Twi008021; 
 Wed, 20 Oct 2021 17:03:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=JtIR+oBYy0unpZqp/ZI74GRw2a+uR2l8SS7NVOH8cVc=;
 b=IxwvK7uUj8PkF/HN9XCVbCmtKWgCfa77G5Ns2PEc15wjWiDWnedZ17u5fENhgd9MILrc
 7oTBCllYkxhT5IMoqGfQP9ON9RSSo0MXu8ZRQ+gBEcGwDy8NyHNaPxcQvKUY8pZWhbyw
 tumioTgIyjR8rGGWGR0yD0ld+WjuIGK46NBrFQ/lUksgkLkZG4wFVHvuzDjNTyoUTEb2
 YUUBG6apHsqmhXgqODtx8hKvFZmAzqVq23asT4SM/KZ1pqZh1aumyy3oSHiZAWxs/jcR
 yjqyHsts++jTuPKQuuNLBAUdq9Tku2fv5P62yzVpVcEAHqtWfUmDGSXBKDSORZvatncF eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3btknp8psb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:03:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D66AB100034;
 Wed, 20 Oct 2021 17:03:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE3B222A6E8;
 Wed, 20 Oct 2021 17:03:52 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 20 Oct 2021 17:03:52
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 20 Oct 2021 17:03:32 +0200
Message-ID: <20211020150332.10214-4-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211020150332.10214-1-erwan.leray@foss.st.com>
References: <20211020150332.10214-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] serial: stm32: update throttle and
	unthrottle ops for dma mode
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

Disable DMA request line (if enabled) to switch in PIO mode in throttle
ops, so the RX data gets queues into the FIFO. The hardware flow control
is triggered when the RX FIFO is full.

Switch back to DMA mode (re-enable DMA request line) in unthrottle ops.
Hardware flow control is stopped when FIFO is not full anymore.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index cfdda35499e6..7fd192e1e15d 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -577,9 +577,12 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 	 * rx errors in dma mode has to be handled ASAP to avoid overrun as the DMA request
 	 * line has been masked by HW and rx data are stacking in FIFO.
 	 */
-	if (((sr & USART_SR_RXNE) && !stm32_usart_rx_dma_enabled(port)) ||
-	    ((sr & USART_SR_ERR_MASK) && stm32_usart_rx_dma_enabled(port)))
-		stm32_usart_receive_chars(port, false);
+	if (!stm32_port->throttled) {
+		if (((sr & USART_SR_RXNE) && !stm32_usart_rx_dma_enabled(port)) ||
+		    ((sr & USART_SR_ERR_MASK) && stm32_usart_rx_dma_enabled(port))) {
+			stm32_usart_receive_chars(port, false);
+		}
+	}
 
 	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
 		spin_lock(&port->lock);
@@ -596,9 +599,11 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
+	struct stm32_port *stm32_port = to_stm32_port(port);
 
 	/* Receiver timeout irq for DMA RX */
-	stm32_usart_receive_chars(port, false);
+	if (!stm32_port->throttled)
+		stm32_usart_receive_chars(port, false);
 
 	return IRQ_HANDLED;
 }
@@ -711,10 +716,19 @@ static void stm32_usart_throttle(struct uart_port *port)
 	unsigned long flags;
 
 	spin_lock_irqsave(&port->lock, flags);
+
+	/*
+	 * Disable DMA request line if enabled, so the RX data gets queued into the FIFO.
+	 * Hardware flow control is triggered when RX FIFO is full.
+	 */
+	if (stm32_usart_rx_dma_enabled(port))
+		stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAR);
+
 	stm32_usart_clr_bits(port, ofs->cr1, stm32_port->cr1_irq);
 	if (stm32_port->cr3_irq)
 		stm32_usart_clr_bits(port, ofs->cr3, stm32_port->cr3_irq);
 
+	stm32_port->throttled = true;
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -730,6 +744,14 @@ static void stm32_usart_unthrottle(struct uart_port *port)
 	if (stm32_port->cr3_irq)
 		stm32_usart_set_bits(port, ofs->cr3, stm32_port->cr3_irq);
 
+	/*
+	 * Switch back to DMA mode (re-enable DMA request line).
+	 * Hardware flow control is stopped when FIFO is not full any more.
+	 */
+	if (stm32_port->rx_ch)
+		stm32_usart_set_bits(port, ofs->cr3, USART_CR3_DMAR);
+
+	stm32_port->throttled = false;
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -775,6 +797,13 @@ static int stm32_usart_startup(struct uart_port *port)
 	if (ofs->rqr != UNDEF_REG)
 		writel_relaxed(USART_RQR_RXFRQ, port->membase + ofs->rqr);
 
+	/*
+	 * DMA request line not re-enabled at resume when port is throttled.
+	 * It will be re-enabled by unthrottle ops.
+	 */
+	if (!stm32_port->throttled)
+		stm32_usart_set_bits(port, ofs->cr3, USART_CR3_DMAR);
+
 	/* RX enabling */
 	val = stm32_port->cr1_irq | USART_CR1_RE | BIT(cfg->uart_enable_bit);
 	stm32_usart_set_bits(port, ofs->cr1, val);
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index 53bcd032fce7..e23916bfbb60 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -265,6 +265,7 @@ struct stm32_port {
 	u32 cr3_irq;		 /* USART_CR3_RXFTIE */
 	int last_res;
 	bool tx_dma_busy;	 /* dma tx busy               */
+	bool throttled;		 /* port throttled            */
 	bool hw_flow_control;
 	bool swap;		 /* swap RX & TX pins */
 	bool fifoen;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
