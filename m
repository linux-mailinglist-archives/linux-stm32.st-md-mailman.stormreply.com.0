Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A250A49DEA
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 12:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99D1CC9FC67
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 10:02:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 818BAC9FC66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 10:02:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I9ug4W007561; Tue, 18 Jun 2019 12:02:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=h01JWVwcjqILFh4YSO7W65sajs6sEQaVQ79mN3RX8qQ=;
 b=QLNmM8Ym6XwFgwWEWHrCnihEcWc1VtywI4qxDJ1y07gq6pLzS6LqMBnyj+bx4Bz4vXzd
 /TauvCyjVPOhiJO1QvGhcOV9gNzPdMDgl/GxNPp4z5LOLi4df/L7Z1FttIduxDTgwc/5
 +rvAI7NUxvqoGC+yZ9akFbW1Mqqn3IAsKFMW42TK/ijPpv/W9zYZW5UtN1QbZr82blPr
 ecRstm6j6+unZ/8cvQeAe/NkKYJVT5fy9fmxLvP5GitcPz3ZfWMEkMcjagxZRRWcyzpD
 xQop4ni9R2rTwxlJiJRvhUxq6sRrqRYCZYrkiR7qtt/S4V3reILsXQ6wTStX/5lhAhy1 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4nt883jd-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 12:02:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A74438;
 Tue, 18 Jun 2019 10:02:36 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59DB025D7;
 Tue, 18 Jun 2019 10:02:36 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun
 2019 12:02:36 +0200
Received: from localhost (10.201.23.31) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 12:02:35
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>
Date: Tue, 18 Jun 2019 12:02:23 +0200
Message-ID: <1560852146-3393-3-git-send-email-erwan.leray@st.com>
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
Subject: [Linux-stm32] [PATCH 2/5] serial: stm32: update PIO transmission
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

Improves PIO transmission:
- Replaces the FIFO filling per character by a filling per blocks of
  characters, which provides better performances
- Replaces the active waiting loop by TX empty interrupt dynamic handling.
  TXE interrupt is now enabled when data has to be sent (ie when
  uart_circ is not empty), and inhibited when there is no more data to
  send (ie when uart_circ is empty).

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index e1cfb1e..8316e19 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -303,27 +303,26 @@ static void stm32_transmit_chars_pio(struct uart_port *port)
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 	struct circ_buf *xmit = &port->state->xmit;
-	unsigned int isr;
-	int ret;
 
 	if (stm32_port->tx_dma_busy) {
 		stm32_clr_bits(port, ofs->cr3, USART_CR3_DMAT);
 		stm32_port->tx_dma_busy = false;
 	}
 
-	ret = readl_relaxed_poll_timeout_atomic(port->membase + ofs->isr,
-						isr,
-						(isr & USART_SR_TXE),
-						10, 100000);
-
-	if (ret)
-		dev_err(port->dev, "tx empty not set\n");
-
-	stm32_set_bits(port, ofs->cr1, USART_CR1_TXEIE);
+	while (!uart_circ_empty(xmit)) {
+		/* Check that TDR is empty before filling FIFO */
+		if (!(readl_relaxed(port->membase + ofs->isr) & USART_SR_TXE))
+			break;
+		writel_relaxed(xmit->buf[xmit->tail], port->membase + ofs->tdr);
+		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
+		port->icount.tx++;
+	}
 
-	writel_relaxed(xmit->buf[xmit->tail], port->membase + ofs->tdr);
-	xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
-	port->icount.tx++;
+	/* rely on TXE irq (mask or unmask) for sending remaining data */
+	if (uart_circ_empty(xmit))
+		stm32_clr_bits(port, ofs->cr1, USART_CR1_TXEIE);
+	else
+		stm32_set_bits(port, ofs->cr1, USART_CR1_TXEIE);
 }
 
 static void stm32_transmit_chars_dma(struct uart_port *port)
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
