Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 627847B8421
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 17:50:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0496EC6C831;
	Wed,  4 Oct 2023 15:50:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56499C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 15:50:42 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394ABEsL026844; Wed, 4 Oct 2023 17:50:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=lRZ6+TZ
 OKkUcJ4/oh5Hwp1GtRYeC8Duvo8t9N5cheIQ=; b=P4uF5FhLgV/f1VC0L/NGThz
 HeGNmrO6bY1DEm6xbv3+EuofO6XLYTFWeXGhD1KtCarTYV45eRRZhuVqmrxj4G+1
 BeYuKQDO/hLspRUHPEq/x0gFioKPX0aSQPFRFbMYXnUvAsicTEw5mj61ItxyfUlv
 9BXFyMKwRx3yrVTTimUO6xD6JPqw0i0A5q8Y5qIFSD+RhyimQKi+lgoFSGx01BEu
 U4AyJiQiVYWIXpajvfdoheCNl04XmEf+SE2tdFNETTjPZw7FZvkOJnQCMBf8dwHE
 jBNlB/V6KB3wmGKhohe6CBIqy8NhzaUp6hE48SPthMtj84ngC8HjagYN0fDtPig=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tew80qfcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 17:50:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF481100053;
 Wed,  4 Oct 2023 17:50:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7CFC26028D;
 Wed,  4 Oct 2023 17:50:28 +0200 (CEST)
Received: from localhost (10.252.26.61) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 17:50:28 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 4 Oct 2023 17:50:23 +0200
Message-ID: <20231004155024.2609531-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.26.61]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_07,2023-10-02_01,2023-05-22_02
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dmaengine: stm32-dma: fix
	stm32_dma_prep_slave_sg in case of MDMA chaining
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

Current Target (CT) have to be reset when starting an MDMA chaining use
case, as Double Buffer mode is activated. It ensures the DMA will start
processing the first memory target (pointed with SxM0AR).

Fixes: 723795173ce1 ("dmaengine: stm32-dma: add support to trigger STM32 MDMA")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: stable@vger.kernel.org
---
 drivers/dma/stm32-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 5c36811aa134..7427acc82259 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -1113,8 +1113,10 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
 		chan->chan_reg.dma_scr &= ~STM32_DMA_SCR_PFCTRL;
 
 	/* Activate Double Buffer Mode if DMA triggers STM32 MDMA and more than 1 sg */
-	if (chan->trig_mdma && sg_len > 1)
+	if (chan->trig_mdma && sg_len > 1) {
 		chan->chan_reg.dma_scr |= STM32_DMA_SCR_DBM;
+		chan->chan_reg.dma_scr &= ~STM32_DMA_SCR_CT;
+	}
 
 	for_each_sg(sgl, sg, sg_len, i) {
 		ret = stm32_dma_set_xfer_param(chan, direction, &buswidth,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
