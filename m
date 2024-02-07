Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191A84C8E5
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 11:46:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED814C6DD93;
	Wed,  7 Feb 2024 10:46:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1172AC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 10:46:24 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4176FQnZ003091; Wed, 7 Feb 2024 11:46:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=PIc5fr4
 3l23sf01s2fsMtu9PxKCMeqeCBi0nksf6Bds=; b=bVW5X8A7Obp8CGLSsz7WyBu
 kXC3XvjBa2ggJ63H1GVCUnIcvfTspUTDb0VJ8FaNlUYIQKd4XZxYFapca+pB6jyw
 YlCkuKXgnni4D7RHUUjOrzFHSpJ2I6ioMgShTCUcUvP0tds4yvEF24VFog55M9s+
 JoIr8ioX6q/CDcUevO29NdoHWMXuIweh511oEy3hV13SxGYJloRNz/AN2RxeyktJ
 +A85TU2Q/7XK0B9ir28liEE1ynMfa8gj60c96ybXOcna20KHm6FDFAlRsPehgUVF
 t7Sj9fpT58VPI9Ht0AoLYGE2MBFW5wx1vPedZNLkYPsvYKMpupL5wkrApDw1rbw=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w1yx45j5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 11:46:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1E1D100058;
 Wed,  7 Feb 2024 11:46:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBD4922D181;
 Wed,  7 Feb 2024 11:46:15 +0100 (CET)
Received: from localhost (10.252.26.183) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 7 Feb
 2024 11:46:15 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>
Date: Wed, 7 Feb 2024 11:46:04 +0100
Message-ID: <20240207104604.174843-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.26.183]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_04,2024-01-31_01,2023-05-22_02
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: fix PM support for stm32mp257
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

The driver for stm32mp257 is missing the suspend callback in
struct dev_pm_ops.

Add the callback, using the common stm32_pinctrl_suspend()
function.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Fixes: 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
---
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 73f091cd827e..23aebd4695e9 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -2562,7 +2562,7 @@ static const struct of_device_id stm32mp257_pctrl_match[] = {
 };
 
 static const struct dev_pm_ops stm32_pinctrl_dev_pm_ops = {
-	 SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, stm32_pinctrl_resume)
+	 SET_LATE_SYSTEM_SLEEP_PM_OPS(stm32_pinctrl_suspend, stm32_pinctrl_resume)
 };
 
 static struct platform_driver stm32mp257_pinctrl_driver = {

base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
