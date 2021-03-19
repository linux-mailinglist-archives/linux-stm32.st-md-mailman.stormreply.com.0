Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA2342502
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 19:43:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 350BDC58D59;
	Fri, 19 Mar 2021 18:43:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49CCAC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 18:43:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12JIg7O8015435; Fri, 19 Mar 2021 19:43:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Lhe2dKb2oNi2zMaIbN0NnP1EknPttO88R2+FBSn6/CU=;
 b=AhIIwwBtev4zODbdzIqydQiJvSs19vgSVfkds5OeeB4sBFCMRlBGHuSZOK4hQYuLkGxK
 rUUDtdk8EHYEbNeCxN9UqZ3W5nNH73ffUKCocGG31pUa4EZrlBO3KMEP00h33+KRpBFc
 cMbjvCuEZy5yk5K/irghsjS8axOFitKH6UpUsjEO4VI/SBUT2Hy9wTtQSgVfLd8IGLSC
 ejxBcGS9HfAmVASDFgR97+C63c0zj5I29Wfvpa1HntbQKwRo+pWI7cl5VkD8dSG+C+Mj
 IfabMlG+8NO/u/CWEXUbA+ZUsm5MUMBNVS3tdtHblUnGAcQSH9M9ah/cPsdGLHWMydPM jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37a8prk02h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 19:43:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C33C100034;
 Fri, 19 Mar 2021 19:43:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 293362721FC;
 Fri, 19 Mar 2021 19:43:25 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Mar 2021 19:43:24
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
 <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 19 Mar 2021 19:42:50 +0100
Message-ID: <20210319184253.5841-3-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319184253.5841-1-erwan.leray@foss.st.com>
References: <20210319184253.5841-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-19_10:2021-03-19,
 2021-03-19 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/5] serial: stm32: clean wakeup handling in
	serial_suspend
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

Remove useless call to stm32_usart_serial_en_wakeup() routine in suspend
callback. When called with "false" argument, this routine is clearing UESM
and WUFIE bits if usart is not wakeup source. Those bits are already
cleared in set_termios(), and then in serial_resume() callback when usart
is wakeup source.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 11656b6b7c0f..cc054f07bd83 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1536,8 +1536,6 @@ static int __maybe_unused stm32_usart_serial_suspend(struct device *dev)
 
 	if (device_may_wakeup(dev) || device_wakeup_path(dev))
 		stm32_usart_serial_en_wakeup(port, true);
-	else
-		stm32_usart_serial_en_wakeup(port, false);
 
 	/*
 	 * When "no_console_suspend" is enabled, keep the pinctrl default state
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
