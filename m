Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D301A5627
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Apr 2020 01:14:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AFA2C36B0B;
	Sat, 11 Apr 2020 23:14:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42D07C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2020 23:14:43 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E12D821744;
 Sat, 11 Apr 2020 23:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646881;
 bh=r3rcW8UxOIXGqFfRKnVQDFiF74TQaFMEpm5Of950k9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m2a/CkCfcougFMj3zlEWB0nk9XLTZ2fkLxZZ1UZ+xrlgCv+vVPjlGBn6iRQ7ZkR+v
 EaYxsz7Oj599EM0bleqbEs2/WizvXP5JzMS+CXJp4kkQfi6JWwYwLszfq4pbAuFhH6
 mW6nAZwGD3BSrGD3WhcowmJ4GXiQ3wGSOwfy/eNc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 11 Apr 2020 19:14:10 -0400
Message-Id: <20200411231413.26911-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411231413.26911-1-sashal@kernel.org>
References: <20200411231413.26911-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Etienne Carriere <etienne.carriere@st.com>, Sasha Levin <sashal@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.9 23/26] dmaengine: stm32-dma: use
	reset controller only at probe time
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

From: Etienne Carriere <etienne.carriere@st.com>

[ Upstream commit 8cf1e0fc50fcc25021567bb2755580504c57c83a ]

Remove reset controller reference from device instance since it is
used only at probe time.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Link: https://lore.kernel.org/r/20200129153628.29329-3-amelie.delaunay@st.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/stm32-dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index ae3f60be7759e..f0f82f466ec62 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -176,7 +176,6 @@ struct stm32_dma_device {
 	struct dma_device ddev;
 	void __iomem *base;
 	struct clk *clk;
-	struct reset_control *rst;
 	bool mem2mem;
 	struct stm32_dma_chan chan[STM32_DMA_MAX_CHANNELS];
 };
@@ -1006,6 +1005,7 @@ static int stm32_dma_probe(struct platform_device *pdev)
 	struct dma_device *dd;
 	const struct of_device_id *match;
 	struct resource *res;
+	struct reset_control *rst;
 	int i, ret;
 
 	match = of_match_device(stm32_dma_of_match, &pdev->dev);
@@ -1034,11 +1034,11 @@ static int stm32_dma_probe(struct platform_device *pdev)
 	dmadev->mem2mem = of_property_read_bool(pdev->dev.of_node,
 						"st,mem2mem");
 
-	dmadev->rst = devm_reset_control_get(&pdev->dev, NULL);
-	if (!IS_ERR(dmadev->rst)) {
-		reset_control_assert(dmadev->rst);
+	rst = devm_reset_control_get(&pdev->dev, NULL);
+	if (!IS_ERR(rst)) {
+		reset_control_assert(rst);
 		udelay(2);
-		reset_control_deassert(dmadev->rst);
+		reset_control_deassert(rst);
 	}
 
 	dma_cap_set(DMA_SLAVE, dd->cap_mask);
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
