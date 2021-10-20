Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605D434E87
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Oct 2021 17:04:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C257AC5C859;
	Wed, 20 Oct 2021 15:04:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F4C3C5C854
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 15:03:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KD3e7L009481; 
 Wed, 20 Oct 2021 17:03:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=VgNN4lYkgAjQBY6zs4BxlgI9Yl9IfFb5xKJg4XO1+OA=;
 b=QnbtXrMkuWfIGAx20zTFNdHwGNgyFbRmYEJ3of/jI+DR7GVj430gKYQutHv4TcvgPO6M
 RfqupEzVr5YJDKWAN9JV42r0h1OUNIOX3i8ShiYRi0n76oT1cxrO4UafcuinT0ze2VZl
 xSUxCLVHQtbfyuaBtoXdukAuMQY0oNZFNqH2zyxTH2htAViby250Z9eLYSP/eKv0r6ye
 1hUCuHpEpxsm2q92H9dfZmIYcChfMFp6KVJmpW1OFFTMUsYKnFLRW/LTmyjY1qTe+ljC
 MFdeGtd3YvbIUzTf+n+rUOV1voWvuPPupxUNG8tYu7mR5alfa2voOS7aFdZ6KGDNKzkN YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3btknp8ps5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:03:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09481100034;
 Wed, 20 Oct 2021 17:03:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0126A22A6E8;
 Wed, 20 Oct 2021 17:03:51 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 20 Oct 2021 17:03:50
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 20 Oct 2021 17:03:30 +0200
Message-ID: <20211020150332.10214-2-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211020150332.10214-1-erwan.leray@foss.st.com>
References: <20211020150332.10214-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] serial: stm32: re-introduce an irq flag
	condition in usart_receive_chars
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

Re-introduce an irq flag condition in usart_receive_chars.
This condition has been deleted by commit 75f4e830fa9c ("serial: do not
restore interrupt state in sysrq helper").
This code was present to handle threaded case, and has been removed
because it is no more needed in this case. Nevertheless an irq safe lock
is still needed in some cases, when DMA should be stopped to receive errors
or breaks in PIO mode.
This patch is a precursor to the complete rework or stm32 serial driver
DMA implementation.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 8f032e77b954..848e063db2ae 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -209,19 +209,22 @@ static unsigned long stm32_usart_get_char(struct uart_port *port, u32 *sr,
 	return c;
 }
 
-static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
+static void stm32_usart_receive_chars(struct uart_port *port, bool irqflag)
 {
 	struct tty_port *tport = &port->state->port;
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
-	unsigned long c;
+	unsigned long c, flags;
 	u32 sr;
 	char flag;
 
-	spin_lock(&port->lock);
+	if (irqflag)
+		spin_lock_irqsave(&port->lock, flags);
+	else
+		spin_lock(&port->lock);
 
 	while (stm32_usart_pending_rx(port, &sr, &stm32_port->last_res,
-				      threaded)) {
+				      irqflag)) {
 		sr |= USART_SR_DUMMY_RX;
 		flag = TTY_NORMAL;
 
@@ -275,7 +278,10 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
 		uart_insert_char(port, sr, USART_SR_ORE, c, flag);
 	}
 
-	uart_unlock_and_check_sysrq(port);
+	if (irqflag)
+		uart_unlock_and_check_sysrq_irqrestore(port, irqflag);
+	else
+		uart_unlock_and_check_sysrq(port);
 
 	tty_flip_buffer_push(tport);
 }
@@ -496,10 +502,9 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
-	struct stm32_port *stm32_port = to_stm32_port(port);
 
-	if (stm32_port->rx_ch)
-		stm32_usart_receive_chars(port, true);
+	/* Receiver timeout irq for DMA RX */
+	stm32_usart_receive_chars(port, false);
 
 	return IRQ_HANDLED;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
