Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B74FCDCD4E
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2019 20:07:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A71FC36B0B;
	Fri, 18 Oct 2019 18:07:08 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB3FFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kIdn4VulEh9KHSu4X43j6W5Pl8dnzX5CpSEuHNMmqZg=; b=WjwNhdAgMXyf
 f/FpHLUkv9G0+RYaluq+UfZ74TKDku8p3GcVgmeDSuHf+HaJTuXfnFgJHPx9fLV5vwYYdOA0mDbXC
 An0OrN8jGzCDLrpDYYQiHfZgoMOeRPov+MKLyAN4SwFfRe2vbPKQOhxCXCIzXgyv8NSADueQtIhib
 PbwmU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeS-0004FY-Lf; Fri, 18 Oct 2019 18:07:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1F8F92743259; Fri, 18 Oct 2019 19:07:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20191018082040.31022-1-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20191018180700.1F8F92743259@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:07:00 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: stm32: sai: fix sysclk management on
	shutdown" to the asoc tree
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

   ASoC: stm32: sai: fix sysclk management on shutdown

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 9b7a7f921689d6c254e5acd670be631ebd82d54d Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Fri, 18 Oct 2019 10:20:40 +0200
Subject: [PATCH] ASoC: stm32: sai: fix sysclk management on shutdown

The commit below, adds a call to sysclk callback on shutdown.
This introduces a regression in stm32 SAI driver, as some clock
services are called twice, leading to unbalanced calls.
Move processing related to mclk from shutdown to sysclk callback.
When requested frequency is 0, assume shutdown and release mclk.

Fixes: 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to sysclk when shutdown")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20191018082040.31022-1-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index d7501f88aaa6..a4060813bc74 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -505,10 +505,20 @@ static int stm32_sai_set_sysclk(struct snd_soc_dai *cpu_dai,
 	if (dir == SND_SOC_CLOCK_OUT && sai->sai_mclk) {
 		ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
 					 SAI_XCR1_NODIV,
-					 (unsigned int)~SAI_XCR1_NODIV);
+					 freq ? 0 : SAI_XCR1_NODIV);
 		if (ret < 0)
 			return ret;
 
+		/* Assume shutdown if requested frequency is 0Hz */
+		if (!freq) {
+			/* Release mclk rate only if rate was actually set */
+			if (sai->mclk_rate) {
+				clk_rate_exclusive_put(sai->sai_mclk);
+				sai->mclk_rate = 0;
+			}
+			return 0;
+		}
+
 		/* If master clock is used, set parent clock now */
 		ret = stm32_sai_set_parent_clock(sai, freq);
 		if (ret)
@@ -1093,15 +1103,6 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
 
-	regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, SAI_XCR1_NODIV,
-			   SAI_XCR1_NODIV);
-
-	/* Release mclk rate only if rate was actually set */
-	if (sai->mclk_rate) {
-		clk_rate_exclusive_put(sai->sai_mclk);
-		sai->mclk_rate = 0;
-	}
-
 	clk_disable_unprepare(sai->sai_ck);
 
 	spin_lock_irqsave(&sai->irq_lock, flags);
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
