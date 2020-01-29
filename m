Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1D14CD82
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2020 16:36:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B24E4C36B11;
	Wed, 29 Jan 2020 15:36:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EEAAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 15:36:52 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFNBY9019444; Wed, 29 Jan 2020 16:36:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wgw0wJHxD0KqntR0Tj8TO+wUsOBJhHj4e4NzjycWHY0=;
 b=DnNqfCFPPQOr0IV5DnGJH2VN3Olbe6oSMkOAWI+gSpdh1nP60QH26H7a8sFhzOptAXOU
 j7GOsZE7S6GdLcpwcY/9TOi+EZGkGnKY6EfwUBJpyTXDW+sovjABpkKBrXHGoICXj+yw
 U9vJ1fnl/qVKTsXLsVh0G/3HSE2iFYbfwqDKzmlxEfR1RQCV42t1fi1fBmu9wHHzKmgT
 HvXuXa23hPeO2LOZ6YTHq9fkjFnV1Jh6GBFew5yAj4GjqXtNvGejnGMHiwd14Txk7JYL
 rXzHcjXe5Ojv2yc7A4+uvz1q1fwq72vzHWR5BsQrUsgA77QAhxq2a8nxoacqAecW9DPT GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcay3vb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 16:36:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A580A10002A;
 Wed, 29 Jan 2020 16:36:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 986FD2BC7C2;
 Wed, 29 Jan 2020 16:36:37 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Jan 2020 16:36:37
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Wed, 29 Jan 2020 16:36:25 +0100
Message-ID: <20200129153628.29329-6-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129153628.29329-1-amelie.delaunay@st.com>
References: <20200129153628.29329-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/8] dmaengine: stm32-dma: use
	dma_set_max_seg_size to set the sg limit
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

This patch adds dma_set_max_seg_size to define sg dma constraint.
This constraint may be taken into account by client to scatter/gather
its buffer.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 25f7281932bd..b7e18cfcd439 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -1323,6 +1323,8 @@ static int stm32_dma_probe(struct platform_device *pdev)
 		reset_control_deassert(rst);
 	}
 
+	dma_set_max_seg_size(&pdev->dev, STM32_DMA_ALIGNED_MAX_DATA_ITEMS);
+
 	dma_cap_set(DMA_SLAVE, dd->cap_mask);
 	dma_cap_set(DMA_PRIVATE, dd->cap_mask);
 	dma_cap_set(DMA_CYCLIC, dd->cap_mask);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
