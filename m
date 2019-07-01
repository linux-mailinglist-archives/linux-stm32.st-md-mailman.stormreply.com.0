Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDA449DF1
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 12:03:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC7BBC9FC69
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 10:03:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 809A6C9FC68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 10:03:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IA1k9d030829; Tue, 18 Jun 2019 12:02:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Z42l/er6av5f1snpxyojUBAWUdIxDz7JA7iDhJQHpuU=;
 b=eUVMYnKoUvAm+F86HXEetOou9H/SsPwQcTj1OD9rJ6Z65p176NxdFstUI/E5T3yJYVcY
 VEPVkRDix8zqfuR3UdNA3cR09jyOcs2ZR5e/M++sE+car9/c6z+ZTBKq72S7LmmZQDj9
 pW9Pjx45EDcmya/baNQ8peZc0CfDCv+N3GH5qjTCMZiQnSk0RcYn5ma8885BU81wmzuT
 r+iRX5mmBHNpS7a2WRSOX1z5/xzs+44WPLFKjFFTEouT63Nb+vVgfCM7f6lcK4XA9kJc
 PhbwntXbx9WnZE3YAIL3kcPA2d+2gl4Cz3mmpQoMqx+7/WW3/UW7pL57S1HFzVY8tuzk 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t68n3nv0a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 12:02:43 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A81223A;
 Tue, 18 Jun 2019 10:02:42 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F25F25DD;
 Tue, 18 Jun 2019 10:02:42 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun
 2019 12:02:42 +0200
Received: from localhost (10.201.23.31) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 12:02:42
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>
Date: Tue, 18 Jun 2019 12:02:25 +0200
Message-ID: <1560852146-3393-5-git-send-email-erwan.leray@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560852146-3393-1-git-send-email-erwan.leray@st.com>
References: <1560852146-3393-1-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.31]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_05:, , signatures=0
Cc: linux-kernel@vger.kernel.org, Erwan Le Ray <erwan.leray@st.com>,
 linux-serial@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] serial: stm32: add support of RX FIFO
	threshold
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

Adds the support of RX FIFO threshold in order to improve the RX FIFO
management.
This is done by enabling fifo threshold interrupt, instead of relying
on rx empty/fifo not full irq. That basically generates one irq/char
currently. With this patch:
- RXCFG is set to half fifo size (e.g. 16/2 = 8 data for a 16 data depth
  FIFO)
- irq rate may be reduced by up to 1/RXCFG,  e.g. 1 over 8 with current
  RXCFG setting.
- Receiver timeout is used to gather chars when FIFO threshold isn't
  reached.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 397d86d..4083145 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -550,6 +550,9 @@ static void stm32_throttle(struct uart_port *port)
 
 	spin_lock_irqsave(&port->lock, flags);
 	stm32_clr_bits(port, ofs->cr1, stm32_port->cr1_irq);
+	if (stm32_port->cr3_irq)
+		stm32_clr_bits(port, ofs->cr3, stm32_port->cr3_irq);
+
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -562,6 +565,9 @@ static void stm32_unthrottle(struct uart_port *port)
 
 	spin_lock_irqsave(&port->lock, flags);
 	stm32_set_bits(port, ofs->cr1, stm32_port->cr1_irq);
+	if (stm32_port->cr3_irq)
+		stm32_set_bits(port, ofs->cr3, stm32_port->cr3_irq);
+
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -572,6 +578,9 @@ static void stm32_stop_rx(struct uart_port *port)
 	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 
 	stm32_clr_bits(port, ofs->cr1, stm32_port->cr1_irq);
+	if (stm32_port->cr3_irq)
+		stm32_clr_bits(port, ofs->cr3, stm32_port->cr3_irq);
+
 }
 
 /* Handle breaks - ignored by us */
@@ -600,8 +609,9 @@ static int stm32_startup(struct uart_port *port)
 
 	if (stm32_port->fifoen) {
 		val = readl_relaxed(port->membase + ofs->cr3);
-		val &= ~USART_CR3_TXFTCFG_MASK;
+		val &= ~(USART_CR3_TXFTCFG_MASK | USART_CR3_RXFTCFG_MASK);
 		val |= USART_CR3_TXFTCFG_HALF << USART_CR3_TXFTCFG_SHIFT;
+		val |= USART_CR3_RXFTCFG_HALF << USART_CR3_RXFTCFG_SHIFT;
 		writel_relaxed(val, port->membase + ofs->cr3);
 	}
 
@@ -693,7 +703,7 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 		cr1 |= USART_CR1_FIFOEN;
 	cr2 = 0;
 	cr3 = readl_relaxed(port->membase + ofs->cr3);
-	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTCFG | USART_CR3_RXFTIE
+	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTCFG_MASK | USART_CR3_RXFTIE
 		| USART_CR3_TXFTCFG_MASK;
 
 	if (cflag & CSTOPB)
@@ -733,8 +743,14 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 		stm32_port->cr1_irq = USART_CR1_RTOIE;
 		writel_relaxed(bits, port->membase + ofs->rtor);
 		cr2 |= USART_CR2_RTOEN;
+		/* Not using dma, enable fifo threshold irq */
+		if (!stm32_port->rx_ch)
+			stm32_port->cr3_irq =  USART_CR3_RXFTIE;
 	}
 
+	cr1 |= stm32_port->cr1_irq;
+	cr3 |= stm32_port->cr3_irq;
+
 	if (cflag & PARODD)
 		cr1 |= USART_CR1_PS;
 
@@ -976,6 +992,7 @@ static struct stm32_port *stm32_of_get_stm32_port(struct platform_device *pdev)
 							"st,hw-flow-ctrl");
 	stm32_ports[id].port.line = id;
 	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
+	stm32_ports[id].cr3_irq = 0;
 	stm32_ports[id].last_res = RX_BUF_L;
 	return &stm32_ports[id];
 }
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index a598446..a175c10 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -210,7 +210,8 @@ struct stm32_usart_info stm32h7_info = {
 #define USART_CR3_WUFIE		BIT(22)		/* H7 */
 #define USART_CR3_TXFTIE	BIT(23)		/* H7 */
 #define USART_CR3_TCBGTIE	BIT(24)		/* H7 */
-#define USART_CR3_RXFTCFG	GENMASK(27, 25)	/* H7 */
+#define USART_CR3_RXFTCFG_MASK	GENMASK(27, 25)	/* H7 */
+#define USART_CR3_RXFTCFG_SHIFT	25		/* H7 */
 #define USART_CR3_RXFTIE	BIT(28)		/* H7 */
 #define USART_CR3_TXFTCFG_MASK	GENMASK(31, 29)	/* H7 */
 #define USART_CR3_TXFTCFG_SHIFT	29		/* H7 */
@@ -218,6 +219,9 @@ struct stm32_usart_info stm32h7_info = {
 /* TX FIFO threashold set to half of its depth */
 #define USART_CR3_TXFTCFG_HALF	0x2
 
+/* RX FIFO threashold set to half of its depth */
+#define USART_CR3_RXFTCFG_HALF	0x2
+
 /* USART_GTPR */
 #define USART_GTPR_PSC_MASK	GENMASK(7, 0)
 #define USART_GTPR_GT_MASK	GENMASK(15, 8)
@@ -263,6 +267,7 @@ struct stm32_port {
 	dma_addr_t tx_dma_buf;   /* dma tx buffer bus address */
 	unsigned char *tx_buf;   /* dma tx buffer cpu address */
 	u32 cr1_irq;		 /* USART_CR1_RXNEIE or RTOIE */
+	u32 cr3_irq;		 /* USART_CR3_RXFTIE */
 	int last_res;
 	bool tx_dma_busy;	 /* dma tx busy               */
 	bool hw_flow_control;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
