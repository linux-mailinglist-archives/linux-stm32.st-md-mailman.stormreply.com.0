Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA8A49DEC
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 12:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD417C9FC6B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 10:02:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD542C9FC68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 10:02:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IA1kqT030835; Tue, 18 Jun 2019 12:02:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ZNwrI9/E19QXLogxcwXLV+/wtFzsSvuPA6hnm0JPcRM=;
 b=pKMdFCu6z9l+iNvnnuFWzm/ITOJ4O7pD3VwiAG1XRPj/EB74vBLEw9mGVCi62jp2V5X5
 RjADxoXBtw/U9b/GCXEAfxfHiMYwkJXGI5Gn6qLPyYbpQc+I0Qo6stg4MqxSDer2tBN5
 L4mqGeMTarLq8Kl/+5adGTt4SDB9/1dBIKMgdYNmSS870lUw+A8L2npVXeztPIxUIRmp
 1cAEHe/3YSBft1VMmwYslw9wRl3BTvDm25TYlOGgdzrrYZGmU9CmzZs6zsFXvgM4Ec9x
 TIpUF7DcIxoi1jwFxLdZ1vc8OlxFpsDDMs5FplvHeTTLvb5lpfNAHiRdaXy4EmSC+oy3 HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t68n3nv0e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 12:02:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C84553A;
 Tue, 18 Jun 2019 10:02:43 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A704725DD;
 Tue, 18 Jun 2019 10:02:43 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun
 2019 12:02:43 +0200
Received: from localhost (10.201.23.31) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 12:02:43
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>
Date: Tue, 18 Jun 2019 12:02:26 +0200
Message-ID: <1560852146-3393-6-git-send-email-erwan.leray@st.com>
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
Subject: [Linux-stm32] [PATCH 5/5] serial: stm32: add RX and TX FIFO flush
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

Adds a flush of RX and TX FIFOs, and fixes some errors:
- adds RX FIFO flush in startup fonction
- removes the useless transmitter enabling in startup fonction
  (e.g. receiver only, see Documentation/serial/driver)
- configures FIFO threshold before enabling it, rather than after
- flushes both TX and RX in set_termios function

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 4083145..21dc380 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -602,11 +602,11 @@ static int stm32_startup(struct uart_port *port)
 	if (ret)
 		return ret;
 
-	val = stm32_port->cr1_irq | USART_CR1_TE | USART_CR1_RE;
-	if (stm32_port->fifoen)
-		val |= USART_CR1_FIFOEN;
-	stm32_set_bits(port, ofs->cr1, val);
+	/* RX FIFO Flush */
+	if (ofs->rqr != UNDEF_REG)
+		stm32_set_bits(port, ofs->rqr, USART_RQR_RXFRQ);
 
+	/* Tx and RX FIFO configuration */
 	if (stm32_port->fifoen) {
 		val = readl_relaxed(port->membase + ofs->cr3);
 		val &= ~(USART_CR3_TXFTCFG_MASK | USART_CR3_RXFTCFG_MASK);
@@ -615,6 +615,12 @@ static int stm32_startup(struct uart_port *port)
 		writel_relaxed(val, port->membase + ofs->cr3);
 	}
 
+	/* RX FIFO enabling */
+	val = stm32_port->cr1_irq | USART_CR1_RE;
+	if (stm32_port->fifoen)
+		val |= USART_CR1_FIFOEN;
+	stm32_set_bits(port, ofs->cr1, val);
+
 	return 0;
 }
 
@@ -697,8 +703,12 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 	/* Stop serial port and reset value */
 	writel_relaxed(0, port->membase + ofs->cr1);
 
-	cr1 = USART_CR1_TE | USART_CR1_RE;
+	/* flush RX & TX FIFO */
+	if (ofs->rqr != UNDEF_REG)
+		stm32_set_bits(port, ofs->rqr,
+			       USART_RQR_TXFRQ | USART_RQR_RXFRQ);
 
+	cr1 = USART_CR1_TE | USART_CR1_RE;
 	if (stm32_port->fifoen)
 		cr1 |= USART_CR1_FIFOEN;
 	cr2 = 0;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
