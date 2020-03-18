Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08718A72E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2020 22:41:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09805C36B0B;
	Wed, 18 Mar 2020 21:41:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93A32C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 21:41:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E5AFFEC;
 Wed, 18 Mar 2020 14:41:57 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 965A73F67D;
 Wed, 18 Mar 2020 14:41:56 -0700 (PDT)
Date: Wed, 18 Mar 2020 21:41:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20200318144125.9163-3-olivier.moysan@st.com>
Message-Id: <applied-20200318144125.9163-3-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: stm32: spdifrx: manage rebind issue"
	to the asoc tree
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

   ASoC: stm32: spdifrx: manage rebind issue

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 794df9448edb55978e50372f083aeedade1b2844 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Wed, 18 Mar 2020 15:41:24 +0100
Subject: [PATCH] ASoC: stm32: spdifrx: manage rebind issue

The commit e894efef9ac7 ("ASoC: core: add support to card rebind")
allows to rebind the sound card after a rebind of one of its component.
With this commit, the sound card is actually rebound,
but may be no more functional.

Corrections:
- Call snd_dmaengine_pcm_register() before snd_soc_register_component().
- Call snd_dmaengine_pcm_unregister() and snd_soc_unregister_component()
explicitly from SPDFIRX driver.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20200318144125.9163-3-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_spdifrx.c | 62 ++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 49766afdae61..ae7a0f46a6fb 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -944,6 +944,22 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 	return 0;
 }
 
+static int stm32_spdifrx_remove(struct platform_device *pdev)
+{
+	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
+
+	if (spdifrx->ctrl_chan)
+		dma_release_channel(spdifrx->ctrl_chan);
+
+	if (spdifrx->dmab)
+		snd_dma_free_pages(spdifrx->dmab);
+
+	snd_dmaengine_pcm_unregister(&pdev->dev);
+	snd_soc_unregister_component(&pdev->dev);
+
+	return 0;
+}
+
 static int stm32_spdifrx_probe(struct platform_device *pdev)
 {
 	struct stm32_spdifrx_data *spdifrx;
@@ -995,25 +1011,27 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	udelay(2);
 	reset_control_deassert(rst);
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &stm32_spdifrx_component,
-					      stm32_spdifrx_dai,
-					      ARRAY_SIZE(stm32_spdifrx_dai));
-	if (ret)
-		return ret;
-
-	ret = stm32_spdifrx_dma_ctrl_register(&pdev->dev, spdifrx);
-	if (ret)
-		goto error;
-
 	pcm_config = &stm32_spdifrx_pcm_config;
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
+	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
-		goto error;
+		return ret;
 	}
 
+	ret = snd_soc_register_component(&pdev->dev,
+					 &stm32_spdifrx_component,
+					 stm32_spdifrx_dai,
+					 ARRAY_SIZE(stm32_spdifrx_dai));
+	if (ret) {
+		snd_dmaengine_pcm_unregister(&pdev->dev);
+		return ret;
+	}
+
+	ret = stm32_spdifrx_dma_ctrl_register(&pdev->dev, spdifrx);
+	if (ret)
+		goto error;
+
 	ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_IDR, &idr);
 	if (ret)
 		goto error;
@@ -1029,27 +1047,11 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	return ret;
 
 error:
-	if (!IS_ERR(spdifrx->ctrl_chan))
-		dma_release_channel(spdifrx->ctrl_chan);
-	if (spdifrx->dmab)
-		snd_dma_free_pages(spdifrx->dmab);
+	stm32_spdifrx_remove(pdev);
 
 	return ret;
 }
 
-static int stm32_spdifrx_remove(struct platform_device *pdev)
-{
-	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
-
-	if (spdifrx->ctrl_chan)
-		dma_release_channel(spdifrx->ctrl_chan);
-
-	if (spdifrx->dmab)
-		snd_dma_free_pages(spdifrx->dmab);
-
-	return 0;
-}
-
 MODULE_DEVICE_TABLE(of, stm32_spdifrx_ids);
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
