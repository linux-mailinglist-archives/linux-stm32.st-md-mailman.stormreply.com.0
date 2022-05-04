Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C351A48D
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 17:53:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61605C628B4;
	Wed,  4 May 2022 15:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CABDC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 15:53:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244EghZO001510;
 Wed, 4 May 2022 17:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Q6KyqjPjjOTk3BmOK5hia+7CtTxIiidvABdtdvOQnNs=;
 b=ETmzha3D6ASiP/NoeMi/nftDnWTbYvh2iiVwr0qAy5McMFVYJKYkQ8MBAp/n0FKF5CxM
 yiC0AZiF+FdCvJadRFA3mNzZCon0LDLvFaN+KXocO42XevRNqRC8Y4VB7XVeUq2Q80XQ
 3GVU9RHA5dYZ8wiX/iwqRZKDN6jJDqmotnvJQCoY+nwRoNjRLqjIUqySnzJ0sDOy9zos
 +YrXtfmFeVwxPJlDJ/SLvmszBSgzAswJnkM7iOPY2y+UjBuVZszyYHV3i7DNx7X6Mqlx
 JsIrLugWW/Z6y/QmEDrvPamAIWIiqDUlguumlk5VH8T/z8uGdOt3TthvAIxBlOJ6SCtl DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0gecfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 17:53:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A99210002A;
 Wed,  4 May 2022 17:53:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63AFE22A6E3;
 Wed,  4 May 2022 17:53:38 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May 2022 17:53:37
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 4 May 2022 17:53:20 +0200
Message-ID: <20220504155322.121431-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
References: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_02,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] dmaengine: stm32-mdma: remove GISR1
	register
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

GISR1 was described in a not up-to-date documentation when the stm32-mdma
driver has been developed. This register has not been added in reference
manual of STM32 SoC with MDMA, which have only 32 MDMA channels.
So remove it from stm32-mdma driver.

Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-mdma.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 95e5831e490a..57f0eb8a18fc 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -34,7 +34,6 @@
 #include "virt-dma.h"
 
 #define STM32_MDMA_GISR0		0x0000 /* MDMA Int Status Reg 1 */
-#define STM32_MDMA_GISR1		0x0004 /* MDMA Int Status Reg 2 */
 
 /* MDMA Channel x interrupt/status register */
 #define STM32_MDMA_CISR(x)		(0x40 + 0x40 * (x)) /* x = 0..62 */
@@ -169,7 +168,7 @@
 
 #define STM32_MDMA_MAX_BUF_LEN		128
 #define STM32_MDMA_MAX_BLOCK_LEN	65536
-#define STM32_MDMA_MAX_CHANNELS		63
+#define STM32_MDMA_MAX_CHANNELS		32
 #define STM32_MDMA_MAX_REQUESTS		256
 #define STM32_MDMA_MAX_BURST		128
 #define STM32_MDMA_VERY_HIGH_PRIORITY	0x3
@@ -1324,21 +1323,11 @@ static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
 
 	/* Find out which channel generates the interrupt */
 	status = readl_relaxed(dmadev->base + STM32_MDMA_GISR0);
-	if (status) {
-		id = __ffs(status);
-	} else {
-		status = readl_relaxed(dmadev->base + STM32_MDMA_GISR1);
-		if (!status) {
-			dev_dbg(mdma2dev(dmadev), "spurious it\n");
-			return IRQ_NONE;
-		}
-		id = __ffs(status);
-		/*
-		 * As GISR0 provides status for channel id from 0 to 31,
-		 * so GISR1 provides status for channel id from 32 to 62
-		 */
-		id += 32;
+	if (!status) {
+		dev_dbg(mdma2dev(dmadev), "spurious it\n");
+		return IRQ_NONE;
 	}
+	id = __ffs(status);
 
 	chan = &dmadev->chan[id];
 	if (!chan) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
