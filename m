Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9E7B8563
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 18:36:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1FF1C6C833;
	Wed,  4 Oct 2023 16:36:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDF30C6C832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 16:36:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 394GFwTE024386; Wed, 4 Oct 2023 18:35:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6b81mFUL95HARJf/aHfZjVghFKXm4nR1+fC+ZW/mq+w=; b=Fp
 lrx3wMcHU4WBL3o8JlVEPApMSfVMqnOlUBJ00GaHJAdbB6pZAs8rNmEH3FHMRJ7X
 wwy6eIQEfAUrqBKfGMjC1/1TLFn8eLSAaY+wbUabmNHaU7Pwdne6GMJW+O7sHIBj
 biSYUMEBWhDTjKR/rdrnp9PrwfTgmysuktGEuioJOe+TB/7/SvRKfNSIf1MxQt9h
 FqLd43eHR20pND2y1cswMA9OI0CiLgDB+9xw5M1lIaKfdBw6lY6k6JSQoJr1iqg6
 FuaUnw8VjJmUd4K+szbtERw+F4lzsUmx5QEMRJUPfFi/YxFw8GxMgmOtQJbn+aQX
 qL3MjSIqj52gPq9f2GxA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3te8t528dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 18:35:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 093F7100053;
 Wed,  4 Oct 2023 18:35:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00492281EB6;
 Wed,  4 Oct 2023 18:35:55 +0200 (CEST)
Received: from localhost (10.252.26.61) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 18:35:55 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 4 Oct 2023 18:35:29 +0200
Message-ID: <20231004163531.2864160-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231004163531.2864160-1-amelie.delaunay@foss.st.com>
References: <20231004163531.2864160-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.26.61]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_08,2023-10-02_01,2023-05-22_02
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] dmaengine: stm32-mdma: use Link Address
	Register to compute residue
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

Current implementation relies on curr_hwdesc index. But to keep this index
up to date, Block Transfer interrupt (BTIE) has to be enabled.
If it is not, curr_hwdesc is not updated, and then residue is not reliable.
Rely on Link Address Register instead. And disable BTIE interrupt
in stm32_mdma_setup_xfer() because it is no more needed in case of
_prep_slave_sg() to maintain curr_hwdesc up to date.
It avoids extra interrupts and also ensures a reliable residue. These
improvements are required for STM32 DCMI camera capture use case, which
need STM32 DMA and MDMA chaining for good performance.

Fixes: 696874322771 ("dmaengine: stm32-mdma: add support to be triggered by STM32 DMA")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: stable@vger.kernel.org
---
 drivers/dma/stm32-mdma.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index cc6f4b00091f..da73e13b8c9d 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -777,8 +777,6 @@ static int stm32_mdma_setup_xfer(struct stm32_mdma_chan *chan,
 	/* Enable interrupts */
 	ccr &= ~STM32_MDMA_CCR_IRQ_MASK;
 	ccr |= STM32_MDMA_CCR_TEIE | STM32_MDMA_CCR_CTCIE;
-	if (sg_len > 1)
-		ccr |= STM32_MDMA_CCR_BTIE;
 	desc->ccr = ccr;
 
 	return 0;
@@ -1324,12 +1322,21 @@ static size_t stm32_mdma_desc_residue(struct stm32_mdma_chan *chan,
 {
 	struct stm32_mdma_device *dmadev = stm32_mdma_get_dev(chan);
 	struct stm32_mdma_hwdesc *hwdesc;
-	u32 cbndtr, residue, modulo, burst_size;
+	u32 cisr, clar, cbndtr, residue, modulo, burst_size;
 	int i;
 
+	cisr = stm32_mdma_read(dmadev, STM32_MDMA_CISR(chan->id));
+
 	residue = 0;
-	for (i = curr_hwdesc + 1; i < desc->count; i++) {
+	/* Get the next hw descriptor to process from current transfer */
+	clar = stm32_mdma_read(dmadev, STM32_MDMA_CLAR(chan->id));
+	for (i = desc->count - 1; i >= 0; i--) {
 		hwdesc = desc->node[i].hwdesc;
+
+		if (hwdesc->clar == clar)
+			break;/* Current transfer found, stop cumulating */
+
+		/* Cumulate residue of unprocessed hw descriptors */
 		residue += STM32_MDMA_CBNDTR_BNDT(hwdesc->cbndtr);
 	}
 	cbndtr = stm32_mdma_read(dmadev, STM32_MDMA_CBNDTR(chan->id));
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
