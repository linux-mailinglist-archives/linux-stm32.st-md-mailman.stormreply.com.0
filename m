Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A115939E
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 16:49:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AEDAC36B0B;
	Tue, 11 Feb 2020 15:49:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85803C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 15:49:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D8712FC;
 Tue, 11 Feb 2020 07:49:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38E9F3F68E;
 Tue, 11 Feb 2020 07:49:31 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20200203100814.22944-7-olivier.moysan@st.com>
Message-Id: <applied-20200203100814.22944-7-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: Etienne Carriere <etienne.carriere@st.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: stm32: i2s: improve error management
	on probe deferral" to the asoc tree
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

   ASoC: stm32: i2s: improve error management on probe deferral

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

From 04dd656e8d506c12f5e97a24089b2991f5f00984 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:14 +0100
Subject: [PATCH] ASoC: stm32: i2s: improve error management on probe deferral

Do not print an error trace when deferring probe for I2S driver.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20200203100814.22944-7-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_i2s.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index cdcc00d9a67e..2478405727c3 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -831,25 +831,33 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	/* Get clocks */
 	i2s->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(i2s->pclk)) {
-		dev_err(&pdev->dev, "Could not get pclk\n");
+		if (PTR_ERR(i2s->pclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get pclk: %ld\n",
+				PTR_ERR(i2s->pclk));
 		return PTR_ERR(i2s->pclk);
 	}
 
 	i2s->i2sclk = devm_clk_get(&pdev->dev, "i2sclk");
 	if (IS_ERR(i2s->i2sclk)) {
-		dev_err(&pdev->dev, "Could not get i2sclk\n");
+		if (PTR_ERR(i2s->i2sclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get i2sclk: %ld\n",
+				PTR_ERR(i2s->i2sclk));
 		return PTR_ERR(i2s->i2sclk);
 	}
 
 	i2s->x8kclk = devm_clk_get(&pdev->dev, "x8k");
 	if (IS_ERR(i2s->x8kclk)) {
-		dev_err(&pdev->dev, "missing x8k parent clock\n");
+		if (PTR_ERR(i2s->x8kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get x8k parent clock: %ld\n",
+				PTR_ERR(i2s->x8kclk));
 		return PTR_ERR(i2s->x8kclk);
 	}
 
 	i2s->x11kclk = devm_clk_get(&pdev->dev, "x11k");
 	if (IS_ERR(i2s->x11kclk)) {
-		dev_err(&pdev->dev, "missing x11k parent clock\n");
+		if (PTR_ERR(i2s->x11kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get x11k parent clock: %ld\n",
+				PTR_ERR(i2s->x11kclk));
 		return PTR_ERR(i2s->x11kclk);
 	}
 
@@ -907,7 +915,9 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 	i2s->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "pclk",
 						i2s->base, i2s->regmap_conf);
 	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
+		if (PTR_ERR(i2s->regmap) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Regmap init error %ld\n",
+				PTR_ERR(i2s->regmap));
 		return PTR_ERR(i2s->regmap);
 	}
 
@@ -918,8 +928,11 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
 					      &stm32_i2s_pcm_config, 0);
-	if (ret)
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
 		return ret;
+	}
 
 	/* Set SPI/I2S in i2s mode */
 	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
