Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8125255DCC
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 17:26:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0047C32E90;
	Fri, 28 Aug 2020 15:26:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10803C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 15:26:49 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B8DD2098B;
 Fri, 28 Aug 2020 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598628407;
 bh=83QJ4zEIz76mA1hS6M2smn2fhAmAbrBZQN+yfkylPbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oL0AYrgbGu8lpCoD+SZXyeWLzrYoWg7v/KutvpK1olNrIBLOgkaDpTjjy+BeyYFun
 uIlswo8htLt/exM0xJafr+bdhtVTre59sbtia2Ptc+DGhqhfTquwgqGlXXIBRA/AOX
 DdlQBSCXa5XXmmVi/ltkxtD93Y/31p5S2RKx8Dkc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Nicholas Graumann <nick.graumann@gmail.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Aug 2020 17:26:36 +0200
Message-Id: <20200828152637.16903-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828152637.16903-1-krzk@kernel.org>
References: <20200828152637.16903-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 2/3] dmaengine: stm32: Simplify with
	dev_err_probe()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/dma/stm32-dma.c    | 8 ++------
 drivers/dma/stm32-dmamux.c | 9 +++------
 drivers/dma/stm32-mdma.c   | 9 +++------
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 96ad1b3d24c6..d0055d2f0b9a 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -1311,12 +1311,8 @@ static int stm32_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(dmadev->base);
 
 	dmadev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dmadev->clk)) {
-		ret = PTR_ERR(dmadev->clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Can't get clock\n");
-		return ret;
-	}
+	if (IS_ERR(dmadev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dmadev->clk), "Can't get clock\n");
 
 	ret = clk_prepare_enable(dmadev->clk);
 	if (ret < 0) {
diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index 12f7637e13a1..a10ccd964376 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -252,12 +252,9 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 	spin_lock_init(&stm32_dmamux->lock);
 
 	stm32_dmamux->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(stm32_dmamux->clk)) {
-		ret = PTR_ERR(stm32_dmamux->clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Missing clock controller\n");
-		return ret;
-	}
+	if (IS_ERR(stm32_dmamux->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(stm32_dmamux->clk),
+				     "Missing clock controller\n");
 
 	ret = clk_prepare_enable(stm32_dmamux->clk);
 	if (ret < 0) {
diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 5469563703d1..08cfbfab837b 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1580,12 +1580,9 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 		return PTR_ERR(dmadev->base);
 
 	dmadev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dmadev->clk)) {
-		ret = PTR_ERR(dmadev->clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Missing clock controller\n");
-		return ret;
-	}
+	if (IS_ERR(dmadev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dmadev->clk),
+				     "Missing clock controller\n");
 
 	ret = clk_prepare_enable(dmadev->clk);
 	if (ret < 0) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
