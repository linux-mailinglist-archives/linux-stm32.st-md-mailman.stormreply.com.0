Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1A6773D87
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 18:19:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75AE7C6B473;
	Tue,  8 Aug 2023 16:19:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F28EC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 16:19:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378Co9R4027282; Tue, 8 Aug 2023 18:19:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=H3iC7kCgn+jbf9xv4NCtbx4bJ9rUCRO56BhrTEOCRhU=; b=MB
 SgjUvlWPvgQxIboHlBK5HGAWdKlZw3u8XgZVfyyTb8eICfY2jZHmvGCOLLh+bqy2
 Njd7zEW76KOBbvMzTp46nbhZAIgTFac69wxvL1/a49GWABde67uKFvBZjmP750Uq
 EGGaNLE/XqY1WKBn6+SnY1sdkO+r5J9GvPiG4vSMdzGDGWL0Jl2yTGKej98dKSy8
 B0DtCaVARcdckFPNgNOW2q145Szo18SSgOEkEzFZRdzsmcbAPRGl2zfOrpiUewsB
 8rgE99f3ixtXJb5Z+nFGkBrunEMi7PWBlm8L7DUPE2yjSfCRWExSxLC/wVH9TPhG
 L1YPMjbBE+FM5TPitBSA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sbp2d958j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Aug 2023 18:19:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42442100063;
 Tue,  8 Aug 2023 18:19:39 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37CD9235F2C;
 Tue,  8 Aug 2023 18:19:39 +0200 (CEST)
Received: from localhost (10.201.20.168) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 8 Aug
 2023 18:19:38 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 8 Aug 2023 18:19:02 +0200
Message-ID: <20230808161906.178996-3-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808161906.178996-1-valentin.caron@foss.st.com>
References: <20230808161906.178996-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_15,2023-08-08_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/6] serial: stm32: use DMAT as a
	configuration bit
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

DMAT is a configuration bit so it should be set at the startup of uart
port and not when a DMA transfer begins.

This patch move set of DMAT into set_termios and remove DMAT reset except
in shutdown.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/tty/serial/stm32-usart.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 2f9672ba4ed3..a1585aa1ceb0 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -510,10 +510,8 @@ static void stm32_usart_tx_dma_complete(void *arg)
 {
 	struct uart_port *port = arg;
 	struct stm32_port *stm32port = to_stm32_port(port);
-	const struct stm32_usart_offsets *ofs = &stm32port->info->ofs;
 	unsigned long flags;
 
-	stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAT);
 	stm32_usart_tx_dma_terminate(stm32port);
 
 	/* Let's see if we have pending data to send */
@@ -602,7 +600,6 @@ static void stm32_usart_transmit_chars_pio(struct uart_port *port)
 static void stm32_usart_transmit_chars_dma(struct uart_port *port)
 {
 	struct stm32_port *stm32port = to_stm32_port(port);
-	const struct stm32_usart_offsets *ofs = &stm32port->info->ofs;
 	struct circ_buf *xmit = &port->state->xmit;
 	struct dma_async_tx_descriptor *desc = NULL;
 	unsigned int count;
@@ -667,8 +664,6 @@ static void stm32_usart_transmit_chars_dma(struct uart_port *port)
 	/* Issue pending DMA TX requests */
 	dma_async_issue_pending(stm32port->tx_ch);
 
-	stm32_usart_set_bits(port, ofs->cr3, USART_CR3_DMAT);
-
 	uart_xmit_advance(port, count);
 
 	return;
@@ -1270,6 +1265,9 @@ static void stm32_usart_set_termios(struct uart_port *port,
 		cr3 |= USART_CR3_DDRE;
 	}
 
+	if (stm32_port->tx_ch)
+		cr3 |= USART_CR3_DMAT;
+
 	if (rs485conf->flags & SER_RS485_ENABLED) {
 		stm32_usart_config_reg_rs485(&cr1, &cr3,
 					     rs485conf->delay_rts_before_send,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
