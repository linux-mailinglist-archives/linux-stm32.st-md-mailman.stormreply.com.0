Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1083D117503
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2019 19:59:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA48DC36B0B;
	Mon,  9 Dec 2019 18:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E379C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2019 18:59:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 706BA11D4;
 Mon,  9 Dec 2019 10:59:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E354C3F6CF;
 Mon,  9 Dec 2019 10:59:17 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20191203141627.29471-1-olivier.moysan@st.com>
Message-Id: <applied-20191203141627.29471-1-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, apatard@mandriva.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: cs42l51: add dac mux widget in codec
	routes" to the asoc tree
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

   ASoC: cs42l51: add dac mux widget in codec routes

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From abe3b6727b653307c27870a2d4ecbf9de4e914a5 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Tue, 3 Dec 2019 15:16:27 +0100
Subject: [PATCH] ASoC: cs42l51: add dac mux widget in codec routes

Add "DAC mux" DAPM widget in CS42l51 audio codec routes,
to support DAC mux control and to remove error trace
"DAC Mux has no paths" at widget creation.
Note: ADC path of DAC mux is not routed in this patch.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20191203141627.29471-1-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l51.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 55408c8fcb4e..e47758e4fb36 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -214,12 +214,10 @@ static const struct snd_soc_dapm_widget cs42l51_dapm_widgets[] = {
 	SND_SOC_DAPM_ADC_E("Right ADC", "Right HiFi Capture",
 		CS42L51_POWER_CTL1, 2, 1,
 		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_DAC_E("Left DAC", "Left HiFi Playback",
-		CS42L51_POWER_CTL1, 5, 1,
-		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_DAC_E("Right DAC", "Right HiFi Playback",
-		CS42L51_POWER_CTL1, 6, 1,
-		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_DAC_E("Left DAC", NULL, CS42L51_POWER_CTL1, 5, 1,
+			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_DAC_E("Right DAC", NULL, CS42L51_POWER_CTL1, 6, 1,
+			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
 
 	/* analog/mic */
 	SND_SOC_DAPM_INPUT("AIN1L"),
@@ -255,6 +253,12 @@ static const struct snd_soc_dapm_route cs42l51_routes[] = {
 	{"HPL", NULL, "Left DAC"},
 	{"HPR", NULL, "Right DAC"},
 
+	{"Right DAC", NULL, "DAC Mux"},
+	{"Left DAC", NULL, "DAC Mux"},
+
+	{"DAC Mux", "Direct PCM", "Playback"},
+	{"DAC Mux", "DSP PCM", "Playback"},
+
 	{"Left ADC", NULL, "Left PGA"},
 	{"Right ADC", NULL, "Right PGA"},
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
