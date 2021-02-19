Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E631FE35
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 18:48:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F26CAC57B69;
	Fri, 19 Feb 2021 17:48:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB72BC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 17:47:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JHkUH3018180; Fri, 19 Feb 2021 18:47:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=zy1EbYrt/cGzcvtGhzDvwy8smSDarjqQyjUb30S6vmo=;
 b=egPhgpKW1d2P7T+AFixcdA9HGKykKqTX6L6PvygwdeGMnOYPAnlFWH1uy2TiCtv85sc0
 O8VxmQI9zn9z8rObrtdFJx2h5S2ajLg70OZdVLGSFnhvaW73LEgCxTRqvjaZfdchgDaO
 G5WBMBxwL4D2mdrAuVBx09RxRTXRbxizpMiwjnCP5U7jkmhTGWeQmx5lSD8l19KyMz1A
 lGjFUnpJnHD+0UUxeOKLVwOvp2As8KHhmtOjeNUhKe3kTGaEiT2YerDHzJfNghxq17Oa
 VhciBTqe1MFoBXAt+kN7sGXGmSUnzFuw9iJPNFrqNPJPRpEZT1FZ9GV6GLQfMJqsBnZG HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p707551p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 18:47:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A280010002A;
 Fri, 19 Feb 2021 18:47:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9612925F3FD;
 Fri, 19 Feb 2021 18:47:52 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 18:47:52
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 19 Feb 2021 18:47:36 +0100
Message-ID: <20210219174736.1022-14-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219174736.1022-1-erwan.leray@foss.st.com>
References: <20210219174736.1022-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_08:2021-02-18,
 2021-02-19 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 13/13] serial: stm32: add support for
	"flush_buffer" ops
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

Add the support for "flush_buffer" ops in order to flush any write buffers,
reset any DMA state and stop any ongoing DMA transfers when the
port->state->xmit circular buffer is cleared.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 114408f3892a..92836068e5ec 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -597,6 +597,19 @@ static void stm32_usart_start_tx(struct uart_port *port)
 	stm32_usart_transmit_chars(port);
 }
 
+/* Flush the transmit buffer. */
+static void stm32_usart_flush_buffer(struct uart_port *port)
+{
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+
+	if (stm32_port->tx_ch) {
+		dmaengine_terminate_async(stm32_port->tx_ch);
+		stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAT);
+		stm32_port->tx_dma_busy = false;
+	}
+}
+
 /* Throttle the remote when input buffer is about to overflow. */
 static void stm32_usart_throttle(struct uart_port *port)
 {
@@ -992,6 +1005,7 @@ static const struct uart_ops stm32_uart_ops = {
 	.break_ctl	= stm32_usart_break_ctl,
 	.startup	= stm32_usart_startup,
 	.shutdown	= stm32_usart_shutdown,
+	.flush_buffer	= stm32_usart_flush_buffer,
 	.set_termios	= stm32_usart_set_termios,
 	.pm		= stm32_usart_pm,
 	.type		= stm32_usart_type,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
