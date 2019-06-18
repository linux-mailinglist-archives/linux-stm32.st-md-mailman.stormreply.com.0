Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA249DED
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 12:02:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCCE8C9FC67
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 10:02:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ED5EC9FC68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 10:02:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I9uvpM016668; Tue, 18 Jun 2019 12:02:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wHb4WREE9/72Kxb6pYtsF+ktYoPpYJcruLTaSIRla4U=;
 b=KBQCWkrNtt8+AWhcR+YEpAXq2SxF0TeMxxVyrWxk/5GMaSb3y89Oc7RKKWmjM6X2/KMR
 x67URoYaSyoNdBJPZ4063PC9z3F3ypHBmHQdLKghBz8QZ7yTenEAV5oSSf14Awo7E0xR
 heoNSpb+qOl5xKsopOpvQAe90zrXTjP6ZhTEH4E1y9zL/epJa2ZML1FHGV7VTM+6FE3+
 prLDsylzCV9XrGI6BqovmQVgG1ywX9K05vpgqi1VHyEr7dXsV/t1CZfdHA5/pgG89ByL
 KNSo4mmT/APZqI/1rVzw/emsXweEr0sRTzSLJ2PYSxwa8krZc7G8H8G/dIbIWGsfN0XY Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4qjhyq1t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 12:02:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1573E31;
 Tue, 18 Jun 2019 10:02:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E590425D7;
 Tue, 18 Jun 2019 10:02:34 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun
 2019 12:02:35 +0200
Received: from localhost (10.201.23.31) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 12:02:33
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>
Date: Tue, 18 Jun 2019 12:02:22 +0200
Message-ID: <1560852146-3393-2-git-send-email-erwan.leray@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560852146-3393-1-git-send-email-erwan.leray@st.com>
References: <1560852146-3393-1-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.31]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_05:, , signatures=0
Cc: linux-kernel@vger.kernel.org, Erwan Le Ray <erwan.leray@st.com>,
 linux-serial@vger.kernel.org, Gerald Baeza <gerald.baeza@st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] serial: stm32: add support of timeout
	interrupt for RX
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

Add support of RX timeout interrupts to limit the number of interrupts.
RX timeout is a number of bits (baud clock cycles) without
transmission seen in the receiver. One character  is used as an arbitrary
RX timeout value.
If parity is enabled, the number of bits has to include parity bit.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 9c2b04e..e1cfb1e 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -437,6 +437,10 @@ static irqreturn_t stm32_interrupt(int irq, void *ptr)
 
 	sr = readl_relaxed(port->membase + ofs->isr);
 
+	if ((sr & USART_SR_RTOF) && ofs->icr != UNDEF_REG)
+		writel_relaxed(USART_ICR_RTOCF,
+			       port->membase + ofs->icr);
+
 	if ((sr & USART_SR_WUF) && (ofs->icr != UNDEF_REG))
 		writel_relaxed(USART_ICR_WUCF,
 			       port->membase + ofs->icr);
@@ -523,7 +527,7 @@ static void stm32_throttle(struct uart_port *port)
 	unsigned long flags;
 
 	spin_lock_irqsave(&port->lock, flags);
-	stm32_clr_bits(port, ofs->cr1, USART_CR1_RXNEIE);
+	stm32_clr_bits(port, ofs->cr1, stm32_port->cr1_irq);
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -535,7 +539,7 @@ static void stm32_unthrottle(struct uart_port *port)
 	unsigned long flags;
 
 	spin_lock_irqsave(&port->lock, flags);
-	stm32_set_bits(port, ofs->cr1, USART_CR1_RXNEIE);
+	stm32_set_bits(port, ofs->cr1, stm32_port->cr1_irq);
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -545,7 +549,7 @@ static void stm32_stop_rx(struct uart_port *port)
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 
-	stm32_clr_bits(port, ofs->cr1, USART_CR1_RXNEIE);
+	stm32_clr_bits(port, ofs->cr1, stm32_port->cr1_irq);
 }
 
 /* Handle breaks - ignored by us */
@@ -567,7 +571,7 @@ static int stm32_startup(struct uart_port *port)
 	if (ret)
 		return ret;
 
-	val = USART_CR1_RXNEIE | USART_CR1_TE | USART_CR1_RE;
+	val = stm32_port->cr1_irq | USART_CR1_TE | USART_CR1_RE;
 	if (stm32_port->fifoen)
 		val |= USART_CR1_FIFOEN;
 	stm32_set_bits(port, ofs->cr1, val);
@@ -583,7 +587,8 @@ static void stm32_shutdown(struct uart_port *port)
 	u32 val, isr;
 	int ret;
 
-	val = USART_CR1_TXEIE | USART_CR1_RXNEIE | USART_CR1_TE | USART_CR1_RE;
+	val = USART_CR1_TXEIE | USART_CR1_TE;
+	val |= stm32_port->cr1_irq | USART_CR1_RE;
 	val |= BIT(cfg->uart_enable_bit);
 	if (stm32_port->fifoen)
 		val |= USART_CR1_FIFOEN;
@@ -653,7 +658,7 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 	/* Stop serial port and reset value */
 	writel_relaxed(0, port->membase + ofs->cr1);
 
-	cr1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_RXNEIE;
+	cr1 = USART_CR1_TE | USART_CR1_RE;
 
 	if (stm32_port->fifoen)
 		cr1 |= USART_CR1_FIFOEN;
@@ -686,6 +691,19 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 		dev_dbg(port->dev, "Unsupported data bits config: %u bits\n"
 			, bits);
 
+	if (ofs->rtor != UNDEF_REG && (stm32_port->rx_ch ||
+				       stm32_port->fifoen)) {
+		if (cflag & CSTOPB)
+			bits = bits + 3; /* 1 start bit + 2 stop bits */
+		else
+			bits = bits + 2; /* 1 start bit + 1 stop bit */
+
+		/* RX timeout irq to occur after last stop bit + bits */
+		stm32_port->cr1_irq = USART_CR1_RTOIE;
+		writel_relaxed(bits, port->membase + ofs->rtor);
+		cr2 |= USART_CR2_RTOEN;
+	}
+
 	if (cflag & PARODD)
 		cr1 |= USART_CR1_PS;
 
@@ -925,6 +943,7 @@ static struct stm32_port *stm32_of_get_stm32_port(struct platform_device *pdev)
 	stm32_ports[id].hw_flow_control = of_property_read_bool(np,
 							"st,hw-flow-ctrl");
 	stm32_ports[id].port.line = id;
+	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
 	stm32_ports[id].last_res = RX_BUF_L;
 	return &stm32_ports[id];
 }
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index 30d2433..fcd01fe 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -249,6 +249,7 @@ struct stm32_port {
 	struct dma_chan *tx_ch;  /* dma tx channel            */
 	dma_addr_t tx_dma_buf;   /* dma tx buffer bus address */
 	unsigned char *tx_buf;   /* dma tx buffer cpu address */
+	u32 cr1_irq;		 /* USART_CR1_RXNEIE or RTOIE */
 	int last_res;
 	bool tx_dma_busy;	 /* dma tx busy               */
 	bool hw_flow_control;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
