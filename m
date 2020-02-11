Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA815939F
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 16:49:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4904FC36B0C;
	Tue, 11 Feb 2020 15:49:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0121C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 15:49:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B86139F;
 Tue, 11 Feb 2020 07:49:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F4663F68E;
 Tue, 11 Feb 2020 07:49:33 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20200203100814.22944-6-olivier.moysan@st.com>
Message-Id: <applied-20200203100814.22944-6-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: Etienne Carriere <etienne.carriere@st.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: stm32: spdifrx: improve error
	management on probe deferral" to the asoc tree
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

The patch

   ASoC: stm32: spdifrx: improve error management on probe deferral

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From d49bd5ed24163a1a1c81d40e84295731ddd17b1c Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:13 +0100
Subject: [PATCH] ASoC: stm32: spdifrx: improve error management on probe
 deferral

Do not print an error trace when deferring probe for SPDIFRX driver.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20200203100814.22944-6-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_spdifrx.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 9f80ddf34443..49766afdae61 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -406,7 +406,9 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 
 	spdifrx->ctrl_chan = dma_request_chan(dev, "rx-ctrl");
 	if (IS_ERR(spdifrx->ctrl_chan)) {
-		dev_err(dev, "dma_request_slave_channel failed\n");
+		if (PTR_ERR(spdifrx->ctrl_chan) != -EPROBE_DEFER)
+			dev_err(dev, "dma_request_slave_channel error %ld\n",
+				PTR_ERR(spdifrx->ctrl_chan));
 		return PTR_ERR(spdifrx->ctrl_chan);
 	}
 
@@ -929,7 +931,9 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 
 	spdifrx->kclk = devm_clk_get(&pdev->dev, "kclk");
 	if (IS_ERR(spdifrx->kclk)) {
-		dev_err(&pdev->dev, "Could not get kclk\n");
+		if (PTR_ERR(spdifrx->kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get kclk: %ld\n",
+				PTR_ERR(spdifrx->kclk));
 		return PTR_ERR(spdifrx->kclk);
 	}
 
@@ -967,7 +971,9 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 						    spdifrx->base,
 						    spdifrx->regmap_conf);
 	if (IS_ERR(spdifrx->regmap)) {
-		dev_err(&pdev->dev, "Regmap init failed\n");
+		if (PTR_ERR(spdifrx->regmap) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Regmap init error %ld\n",
+				PTR_ERR(spdifrx->regmap));
 		return PTR_ERR(spdifrx->regmap);
 	}
 
@@ -1003,7 +1009,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	pcm_config = &stm32_spdifrx_pcm_config;
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
 	if (ret) {
-		dev_err(&pdev->dev, "PCM DMA register returned %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
 		goto error;
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
