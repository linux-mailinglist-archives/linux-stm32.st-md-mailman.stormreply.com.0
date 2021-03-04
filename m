Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 596AF32D78A
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 17:23:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CA0DC57B76;
	Thu,  4 Mar 2021 16:23:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A84FC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 16:23:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124GC7TP025852; Thu, 4 Mar 2021 17:23:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=LrqFGFtIPN4XqFcQ/wjY4R2i5IBBzhaHbJZTJX35zLk=;
 b=UC3R/FNqME7OLcHDWzlmUVtky/k8J95GmDFQk2irgywlObBeGL6kLQD9rCHbx65X2CtD
 Noj4m+9UGObsDuVm/kko+3U+44qiYPTpdveptXog8PBSXEwZTgYqtuK6L5UkVNjuBjat
 V5aJAI5p7wQEFmwtVQ5DHMoG7nruWTeY7/nWgWhZjfUPyTuUrKRTlhy7z0mdkSCSQrdB
 ZMq35If1YkGvambqXKgMFn5iWjvVVO95L1UuoFwlvHNFta+cpJQeNLEAV6ya2PqSQaUx
 Dm48B+Eco7xYhITgOxvzsgu4EwLfgp7312ceGtV1KZUbU3XGQbD0Ciogi3sihEUNRxC6 Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfdygh3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 17:23:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC42510002A;
 Thu,  4 Mar 2021 17:23:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CED0920741B;
 Thu,  4 Mar 2021 17:23:14 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 17:23:14
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 4 Mar 2021 17:22:59 +0100
Message-ID: <20210304162308.8984-5-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304162308.8984-1-erwan.leray@foss.st.com>
References: <20210304162308.8984-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_05:2021-03-03,
 2021-03-04 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 04/13] serial: stm32: fix TX and RX FIFO
	thresholds
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

TX and RX FIFO thresholds may be cleared after suspend/resume, depending
on the low power mode.

Those configurations (done in startup) are not effective for UART console,
as:
- the reference manual indicates that FIFOEN bit can only be written when
  the USART is disabled (UE=0)
- a set_termios (where UE is set) is requested firstly for console
  enabling, before the startup.

Fixes: 84872dc448fe ("serial: stm32: add RX and TX FIFO flush")
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index eae54b8cf5e2..223cec70c57c 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -649,19 +649,8 @@ static int stm32_usart_startup(struct uart_port *port)
 	if (ofs->rqr != UNDEF_REG)
 		stm32_usart_set_bits(port, ofs->rqr, USART_RQR_RXFRQ);
 
-	/* Tx and RX FIFO configuration */
-	if (stm32_port->fifoen) {
-		val = readl_relaxed(port->membase + ofs->cr3);
-		val &= ~(USART_CR3_TXFTCFG_MASK | USART_CR3_RXFTCFG_MASK);
-		val |= USART_CR3_TXFTCFG_HALF << USART_CR3_TXFTCFG_SHIFT;
-		val |= USART_CR3_RXFTCFG_HALF << USART_CR3_RXFTCFG_SHIFT;
-		writel_relaxed(val, port->membase + ofs->cr3);
-	}
-
-	/* RX FIFO enabling */
+	/* RX enabling */
 	val = stm32_port->cr1_irq | USART_CR1_RE | BIT(cfg->uart_enable_bit);
-	if (stm32_port->fifoen)
-		val |= USART_CR1_FIFOEN;
 	stm32_usart_set_bits(port, ofs->cr1, val);
 
 	return 0;
@@ -770,9 +759,15 @@ static void stm32_usart_set_termios(struct uart_port *port,
 	if (stm32_port->fifoen)
 		cr1 |= USART_CR1_FIFOEN;
 	cr2 = 0;
+
+	/* Tx and RX FIFO configuration */
 	cr3 = readl_relaxed(port->membase + ofs->cr3);
-	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTCFG_MASK | USART_CR3_RXFTIE
-		| USART_CR3_TXFTCFG_MASK;
+	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTIE;
+	if (stm32_port->fifoen) {
+		cr3 &= ~(USART_CR3_TXFTCFG_MASK | USART_CR3_RXFTCFG_MASK);
+		cr3 |= USART_CR3_TXFTCFG_HALF << USART_CR3_TXFTCFG_SHIFT;
+		cr3 |= USART_CR3_RXFTCFG_HALF << USART_CR3_RXFTCFG_SHIFT;
+	}
 
 	if (cflag & CSTOPB)
 		cr2 |= USART_CR2_STOP_2B;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
