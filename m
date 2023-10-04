Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC557B8562
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 18:36:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A41CEC6C831;
	Wed,  4 Oct 2023 16:36:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB80CC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 16:36:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394AavuA022614; Wed, 4 Oct 2023 18:35:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=dyiz+tj
 fiV2jpQFO28ugDVDITHWqIXX0qTTS/2IIaYg=; b=CDOyv5d4QUbM1WjCWwIJXBD
 DSi4ZgqWpzaHg8dky77xXIM/V1dxFE6Jwa6DFlsf8LcOOIwfAVhCHwPOsNlx9I7L
 TuaYZSCKn67PUjxIlwGj7tZL29EJHgOp6U9ua4zuw7xE/YJe27Mjbi1OHnzAVG/r
 LBHaRISHLXr0XugucynvryAD+zF6kGZIFAiW8Ga01/x0OcN77OC9dg8PrPF3VOE7
 hjNeZ28jaAwLYAbkBU7AFsBiCkD3k2H0PaLldo99UoDJJXkofkfFr9Qh8OgYuxH/
 4qgROhfdwVmzxVGzEaH5Ftegw3sUULVosX+eMrBB68dAZAtidXa58c/Oln4JAkA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tggx36fju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 18:35:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D065100053;
 Wed,  4 Oct 2023 18:35:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0528A281EB6;
 Wed,  4 Oct 2023 18:35:55 +0200 (CEST)
Received: from localhost (10.252.26.61) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 18:35:54 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@st.com>
Date: Wed, 4 Oct 2023 18:35:28 +0200
Message-ID: <20231004163531.2864160-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.26.61]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_08,2023-10-02_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] dmaengine: stm32-mdma: abort resume if no
	ongoing transfer
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

chan->desc can be null, if transfer is terminated when resume is called,
leading to a NULL pointer when retrieving the hwdesc.
To avoid this case, check that chan->desc is not null and channel is
disabled (transfer previously paused or terminated).

Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: stable@vger.kernel.org
---
 drivers/dma/stm32-mdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 0de234022c6d..cc6f4b00091f 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1236,6 +1236,10 @@ static int stm32_mdma_resume(struct dma_chan *c)
 	unsigned long flags;
 	u32 status, reg;
 
+	/* Transfer can be terminated */
+	if (!chan->desc || (stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id)) & STM32_MDMA_CCR_EN))
+		return -EPERM;
+
 	hwdesc = chan->desc->node[chan->curr_hwdesc].hwdesc;
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
