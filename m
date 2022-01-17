Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4074904A7
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jan 2022 10:17:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 242A6C5C83D;
	Mon, 17 Jan 2022 09:17:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DB69C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 09:17:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20H7cUn3026280;
 Mon, 17 Jan 2022 10:17:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=fH92PNsO8X+nTytDGMeCCrtRCxn6Df2D+woMj6i38/M=;
 b=Y6nMLSn8xL02wxIcny9f/TIZ3XKn2amtQWcAqZ7e72RfRczkHgL5c2rzJLlzEpIgeyGu
 Cgw0chsa8xx5fvuAcOOcxOuabNw/obuZIj3/HsuYwr3NHmfClY47ea2Ib4ejFDR5u+98
 t6NvwR0XLhOhH29Bzlsl9oOJEXd72EkIwNy34ATZtKD2tihk12d7pP6MqG4Vw5iti353
 xN9Gm7L7k9VDf+GjUDjrho8EHFQ1aMSG+XT1ZhdTJKdoUc7AC5k/cQFNqa0w8UJJf6gw
 aXkNyRcxGGFfwvGuBxyfVQYXb2RrFtwm2NyCvCbvM8zrp0sGj4fIvC+E6Aa7A5toRjaa OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmnse3p58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 10:17:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 686AF100038;
 Mon, 17 Jan 2022 10:17:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6006F20F6D3;
 Mon, 17 Jan 2022 10:17:43 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 10:17:42
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 17 Jan 2022 10:17:40 +0100
Message-ID: <20220117091740.11064-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_03,2022-01-14_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dma: set dma_device
	max_sg_burst
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

Some stm32-dma consumers [1] rather use dma_get_slave_caps() to get
max_sg_burst of their DMA channel as dma_get_max_seg_size() is specific to
the DMA controller.
All stm32-dma channels have the same features so, don't need to implement
device_caps ops. Let dma_get_slave_caps() relies on dma_device
configuration.
That's why this patch sets dma_device max_sg_burst to the maximum segment
size, which is the maximum of data items that can be transferred without
software intervention.

[1] https://lore.kernel.org/lkml/20220110103739.118426-1-alain.volmat@foss.st.com/
    "media: stm32: dcmi: create a dma scatterlist based on DMA max_sg_burst value"

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 83a37a6955a3..d2365fab1b7a 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -1389,6 +1389,7 @@ static int stm32_dma_probe(struct platform_device *pdev)
 	dd->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 	dd->copy_align = DMAENGINE_ALIGN_32_BYTES;
 	dd->max_burst = STM32_DMA_MAX_BURST;
+	dd->max_sg_burst = STM32_DMA_ALIGNED_MAX_DATA_ITEMS;
 	dd->descriptor_reuse = true;
 	dd->dev = &pdev->dev;
 	INIT_LIST_HEAD(&dd->channels);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
