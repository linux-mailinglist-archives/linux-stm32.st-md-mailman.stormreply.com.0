Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7C585BF7
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jul 2022 22:07:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FDF7C03FDB;
	Sat, 30 Jul 2022 20:07:51 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00507C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jul 2022 20:07:49 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id HskUod8n5AeI9HskUoZ6S9; Sat, 30 Jul 2022 22:07:49 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 30 Jul 2022 22:07:49 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sat, 30 Jul 2022 22:07:45 +0200
Message-Id: <2d8c24359b2daa32ce0597a2949b7b2bebaf23de.1659211633.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Simplify code and
	save a few bytes of memory
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

STM32_DMAMUX_MAX_DMA_REQUESTS is small (i.e. 32) and when the 'dma_inuse'
bitmap is allocated, there is already a check that 'dma_req' is <= this
limit.

So, there is no good reason to dynamically allocate this bitmap. This
just waste some memory and some cycles.

Use DECLARE_BITMAP with the maximum bitmap size instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/stm32-dmamux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index eee0c5aa5fb5..212c332f14f9 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -39,7 +39,7 @@ struct stm32_dmamux_data {
 	u32 dma_requests; /* Number of DMA requests connected to DMAMUX */
 	u32 dmamux_requests; /* Number of DMA requests routed toward DMAs */
 	spinlock_t lock; /* Protects register access */
-	unsigned long *dma_inuse; /* Used DMA channel */
+	DECLARE_BITMAP(dma_inuse, STM32_DMAMUX_MAX_DMA_REQUESTS); /* Used DMA channel */
 	u32 ccr[STM32_DMAMUX_MAX_DMA_REQUESTS]; /* Used to backup CCR register
 						 * in suspend
 						 */
@@ -229,12 +229,6 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 
 	stm32_dmamux->dma_requests = dma_req;
 	stm32_dmamux->dma_reqs[0] = count;
-	stm32_dmamux->dma_inuse = devm_kcalloc(&pdev->dev,
-					       BITS_TO_LONGS(dma_req),
-					       sizeof(unsigned long),
-					       GFP_KERNEL);
-	if (!stm32_dmamux->dma_inuse)
-		return -ENOMEM;
 
 	if (device_property_read_u32(&pdev->dev, "dma-requests",
 				     &stm32_dmamux->dmamux_requests)) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
