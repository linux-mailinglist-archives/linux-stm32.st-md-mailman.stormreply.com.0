Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A051BDD2
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 13:14:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6945C628B4;
	Thu,  5 May 2022 11:14:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C516C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 11:14:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458jfPJ026488;
 Thu, 5 May 2022 13:14:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=UArImUFvNKHacRXvpNLIfvx/nkVFBIIqhhzgSK6NXF4=;
 b=5IRlKor8ZjjyO7jPOoWNeQxrFFiEWJJ4P9jR24GMV0SoAm7yfPG1j2rSJ0U3FkTeVGhw
 Vg7Tzbfy1JTouyk5xepPPDLEeKcowDbC5imapeiUgjZkMlAHg8nVpvC9gAO2dvfE/fHX
 TGDR11xfRjhV15PcbkKrBtZWIJaWMpT+lmlOJ5x9CuLM5NSqeE1SKiLzMbdFRlFdTbjI
 kipIFoFd06nYhhYInyNkOnfqwui6b2JnD6MYR/8/ohaH0gEfS3RGHsWhq9wZutARN2XK
 Qsa7D7Cn+EGokduU9AKphXHNDWQXO8H2jl68obN1COcwp9CwZVepFT8NnWDcao2PWB+Q eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt893etq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 13:14:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E28C710002A;
 Thu,  5 May 2022 13:14:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC82921A200;
 Thu,  5 May 2022 13:14:39 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 5 May 2022 13:14:39
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 5 May 2022 13:14:33 +0200
Message-ID: <20220505111434.37274-4-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505111434.37274-1-amelie.delaunay@foss.st.com>
References: <20220505111434.37274-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] dmaengine: stm32-dma: rename pm ops
	before dma pause/resume introduction
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

dmaengine framework offers device_pause and device_resume ops to pause an
on-going transfer and resume it later.
To avoid any misunderstanding with system sleep pm ops, rename pm ops into
stm32_dma_pm_suspend and stm32_dma_pm_resume.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index eecd13795943..0b35c5178501 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -1486,7 +1486,7 @@ static int stm32_dma_runtime_resume(struct device *dev)
 #endif
 
 #ifdef CONFIG_PM_SLEEP
-static int stm32_dma_suspend(struct device *dev)
+static int stm32_dma_pm_suspend(struct device *dev)
 {
 	struct stm32_dma_device *dmadev = dev_get_drvdata(dev);
 	int id, ret, scr;
@@ -1510,14 +1510,14 @@ static int stm32_dma_suspend(struct device *dev)
 	return 0;
 }
 
-static int stm32_dma_resume(struct device *dev)
+static int stm32_dma_pm_resume(struct device *dev)
 {
 	return pm_runtime_force_resume(dev);
 }
 #endif
 
 static const struct dev_pm_ops stm32_dma_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stm32_dma_suspend, stm32_dma_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(stm32_dma_pm_suspend, stm32_dma_pm_resume)
 	SET_RUNTIME_PM_OPS(stm32_dma_runtime_suspend,
 			   stm32_dma_runtime_resume, NULL)
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
