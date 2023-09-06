Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 072AD794014
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Sep 2023 17:16:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B28DCC6B468;
	Wed,  6 Sep 2023 15:16:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F5EAC6B467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Sep 2023 15:16:23 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 386CgI3w026357; Wed, 6 Sep 2023 17:16:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=Z0CZeNx
 wjeI025UreE1uBB8uYQm45Th0i5a1aX/7Erw=; b=jd1j/DRUNovYZ5BnqeP8J55
 JfcveR1/GOMgPgPdJOdaHw8GOn7xE1FV6e8OFrv29+WPmaGCkb1F1DKih1FbXOlh
 6Xrfyn242h+9c9H+HgVOXQWIGS3ILsl9MWscubGXwzj0hNXrv5MhL6rCLX6zkcee
 PcnmEa7WqVmMwh69uNdMnKVzKBktTTzVr72eWWxBflPqlRzn6oFj5dLbjkpOFTrg
 iOYql+gE4NTcHC7Wk8T2SKMVIJoZHwwDtVLijSRTq6k5EWXZs3uLDMtn1mUyP2T+
 9rNqG6c5jSSMFyZQpIertu47Yav/npqmvrsXgNV9OrghKlc6cQz7kIubH/s9aRg=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3svem0qr76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 17:16:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86571100057;
 Wed,  6 Sep 2023 17:16:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7012225E50D;
 Wed,  6 Sep 2023 17:16:07 +0200 (CEST)
Received: from localhost (10.201.20.136) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 6 Sep
 2023 17:16:07 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>
Date: Wed, 6 Sep 2023 17:15:47 +0200
Message-ID: <20230906151547.840302-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.136]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] serial: stm32: add support for break control
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

From: Erwan Le Ray <erwan.leray@foss.st.com>

Add support for break control to the stm32 serial driver.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/tty/serial/stm32-usart.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 5e9cf0c48813..d03ec69d79fc 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1047,9 +1047,20 @@ static void stm32_usart_stop_rx(struct uart_port *port)
 		stm32_usart_clr_bits(port, ofs->cr3, stm32_port->cr3_irq);
 }
 
-/* Handle breaks - ignored by us */
 static void stm32_usart_break_ctl(struct uart_port *port, int break_state)
 {
+	struct stm32_port *stm32_port = to_stm32_port(port);
+	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	if (break_state)
+		stm32_usart_set_bits(port, ofs->rqr, USART_RQR_SBKRQ);
+	else
+		stm32_usart_clr_bits(port, ofs->rqr, USART_RQR_SBKRQ);
+
+	spin_unlock_irqrestore(&port->lock, flags);
 }
 
 static int stm32_usart_startup(struct uart_port *port)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
