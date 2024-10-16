Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD84E9A0A3E
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 14:43:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AF75C78037;
	Wed, 16 Oct 2024 12:43:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10AB2C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:43:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAbVYW018447;
 Wed, 16 Oct 2024 14:42:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SpHHpfjWYDyEBkQxP7SYNJ+CCTu5C3HJbtAasNlzTiE=; b=mXAy5qPFBplwXvun
 UaoYDu7gmw4G4J0nBn7H5IVzicdjnbk5Kta4nUG8PmCPgJmdrEGZupndLbnKmIiX
 RuI2zS+PtEVpSuS8n4nkDOQCfGp4qUHBSlF8k/3bKci9NPqKbcKMzWNHecE2u4Ow
 Ku+C3fONJj5hHR9V6I3KhLn72ADVS2z9OcHtPkxt6eilvZx8UYVHA80q2QA0hf4p
 bGYfa4/J9RcVrqfkSvenNwgupmJFApx8iA8fsbh9I7HZ5MrgxyydM22CLG7ZOBhj
 2Rda7t0ROq37b4SVWCdP2IqVd2O/dgt7kEOfw/Ra5x+6krBFKUvBKbWx58c2dr+6
 37u8gQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42a8mv9uvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 14:42:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6A18040044;
 Wed, 16 Oct 2024 14:41:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9349123CB3E;
 Wed, 16 Oct 2024 14:40:22 +0200 (CEST)
Received: from localhost (10.252.17.239) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 14:40:22 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 16 Oct 2024 14:39:55 +0200
MIME-Version: 1.0
Message-ID: <20241016-dma3-mp25-updates-v3-3-8311fe6f228d@foss.st.com>
References: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
In-Reply-To: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.17.239]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/9] dmaengine: stm32-dma3: refactor HW
 linked-list to optimize memory accesses
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

Current behavior splits the buffer/sg in n * STM32_DMA3_MAX_BLOCK_SIZE + 1
for the remainder without optimization.

New behavior splits the buffer/sg in n * STM32_DMA3_MAX_BLOCK_SIZE + 1 for
(x * chan->max_burst) + 1 for the remainder.
Depending on channel FIFO size, optimal double-word (word if only 8-byte
FIFO size) bursts can be programmed before managing the very last remainder
with lower data width.
In case of _prep_slave_sg, and depending on the channel Transfer Complete
event configuration, the user is warned about the refactored linked-list,
not having the same items count than the initial sg_list. This warning is
shown only if the configuration is successful.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index f793eecd2c27ca17cedd5cabbaa1b1beca202039..1d961f5935f935e3855467318cdcde6e6173e43c 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1126,6 +1126,25 @@ static void stm32_dma3_free_chan_resources(struct dma_chan *c)
 	chan->config_set = 0;
 }
 
+static u32 stm32_dma3_get_ll_count(struct stm32_dma3_chan *chan, size_t len)
+{
+	u32 count;
+
+	count = len / STM32_DMA3_MAX_BLOCK_SIZE;
+	len -= (len / STM32_DMA3_MAX_BLOCK_SIZE) * STM32_DMA3_MAX_BLOCK_SIZE;
+
+	if (len >= chan->max_burst) {
+		count += 1; /* len < STM32_DMA3_MAX_BLOCK_SIZE here, so it fits in one item */
+		len -= (len / chan->max_burst) * chan->max_burst;
+	}
+
+	/* Unaligned remainder fits in one extra item */
+	if (len > 0)
+		count += 1;
+
+	return count;
+}
+
 static void stm32_dma3_init_chan_config_for_memcpy(struct stm32_dma3_chan *chan,
 						   dma_addr_t dst, dma_addr_t src)
 {
@@ -1161,7 +1180,7 @@ static struct dma_async_tx_descriptor *stm32_dma3_prep_dma_memcpy(struct dma_cha
 	size_t next_size, offset;
 	u32 count, i, ctr1, ctr2;
 
-	count = DIV_ROUND_UP(len, STM32_DMA3_MAX_BLOCK_SIZE);
+	count = stm32_dma3_get_ll_count(chan, len);
 
 	swdesc = stm32_dma3_chan_desc_alloc(chan, count);
 	if (!swdesc)
@@ -1177,6 +1196,9 @@ static struct dma_async_tx_descriptor *stm32_dma3_prep_dma_memcpy(struct dma_cha
 		remaining = len - offset;
 		next_size = min_t(size_t, remaining, STM32_DMA3_MAX_BLOCK_SIZE);
 
+		if (next_size < STM32_DMA3_MAX_BLOCK_SIZE && next_size >= chan->max_burst)
+			next_size = chan->max_burst * (remaining / chan->max_burst);
+
 		ret = stm32_dma3_chan_prep_hw(chan, DMA_MEM_TO_MEM, &swdesc->ccr, &ctr1, &ctr2,
 					      src + offset, dst + offset, next_size);
 		if (ret)
@@ -1215,12 +1237,9 @@ static struct dma_async_tx_descriptor *stm32_dma3_prep_slave_sg(struct dma_chan
 	u32 i, j, count, ctr1, ctr2;
 	int ret;
 
-	count = sg_len;
-	for_each_sg(sgl, sg, sg_len, i) {
-		len = sg_dma_len(sg);
-		if (len > STM32_DMA3_MAX_BLOCK_SIZE)
-			count += DIV_ROUND_UP(len, STM32_DMA3_MAX_BLOCK_SIZE) - 1;
-	}
+	count = 0;
+	for_each_sg(sgl, sg, sg_len, i)
+		count += stm32_dma3_get_ll_count(chan, sg_dma_len(sg));
 
 	swdesc = stm32_dma3_chan_desc_alloc(chan, count);
 	if (!swdesc)
@@ -1237,6 +1256,9 @@ static struct dma_async_tx_descriptor *stm32_dma3_prep_slave_sg(struct dma_chan
 		do {
 			size_t chunk = min_t(size_t, len, STM32_DMA3_MAX_BLOCK_SIZE);
 
+			if (chunk < STM32_DMA3_MAX_BLOCK_SIZE && chunk >= chan->max_burst)
+				chunk = chan->max_burst * (len / chan->max_burst);
+
 			if (dir == DMA_MEM_TO_DEV) {
 				src = sg_addr;
 				dst = dev_addr;
@@ -1269,6 +1291,10 @@ static struct dma_async_tx_descriptor *stm32_dma3_prep_slave_sg(struct dma_chan
 		} while (len);
 	}
 
+	if (count != sg_len && chan->tcem != CTR2_TCEM_CHANNEL)
+		dev_warn(chan2dev(chan), "Linked-list refactored, %d items instead of %d\n",
+			 count, sg_len);
+
 	/* Enable Error interrupts */
 	swdesc->ccr |= CCR_USEIE | CCR_ULEIE | CCR_DTEIE;
 	/* Enable Transfer state interrupts */

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
