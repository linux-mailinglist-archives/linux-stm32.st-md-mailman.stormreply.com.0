Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C152D83D
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 17:44:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE44CC640EA;
	Thu, 19 May 2022 15:44:19 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88F91C0D2BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:44:16 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11u002261;
 Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AjjqMicnhPoZqT6UYhPvoYkn3XWnwuGY9ExR1ybyO/8=;
 b=NK96uTLoDF75ZrvxXTw7p6hi4vOr0sdLWBCFb7xG2WQmM7XY+OSWKOGylt80CwFHEW0E
 vFhM7kYvrRxtFCW7nLM2xduTcKUBmqHh4lQr8sV/uUkgXbFgGEfe+1xcxQfVQOFwvqf5
 A3pODWEL7GZnc8tJxO1yIoPrWM2qx0A+NkP7QDSgAyQ44vklOyxds0962e9L+amBschB
 JVN5JmUiThHA6OHIZ85kQQCP4n9hf8oh1h9ejwTkDE6OFAmENLWwJLW+EJStVYBoKQjB
 DA7lPaF2/RSeC7+BYerdro+mM77ha8x4GHdwnkNK4ugcjsHnlIdFQhBfyMpWDB8diSJ/ wA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA87A476;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 19 May 2022 16:42:41 +0100
Message-ID: <20220519154318.2153729-20-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 579zJA1j8qpgk8t0NR1Uq8E4v_eh2bkG
X-Proofpoint-ORIG-GUID: 579zJA1j8qpgk8t0NR1Uq8E4v_eh2bkG
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
Subject: [Linux-stm32] [PATCH 19/56] ASoC: samsung: Update to use
	set_fmt_new callback
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

As part of updating the core to directly tell drivers if they are clock
provider or consumer update these CPU side drivers to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/samsung/i2s.c         | 8 ++++----
 sound/soc/samsung/pcm.c         | 6 +++---
 sound/soc/samsung/s3c-i2s-v2.c  | 8 ++++----
 sound/soc/samsung/s3c24xx-i2s.c | 8 ++++----
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 70c827162be4d..9ed275ebd744e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -671,11 +671,11 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		tmp |= mod_slave;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		/*
 		 * Set default source clock in Master mode, only when the
 		 * CLK_I2S_RCLK_SRC clock is not exposed so we ensure any
@@ -1107,7 +1107,7 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
 	.trigger = i2s_trigger,
 	.hw_params = i2s_hw_params,
-	.set_fmt = i2s_set_fmt,
+	.set_fmt_new = i2s_set_fmt,
 	.set_clkdiv = i2s_set_clkdiv,
 	.set_sysclk = i2s_set_sysclk,
 	.startup = i2s_startup,
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 4c4dfde0568fe..818172d8832d2 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -340,8 +340,8 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		goto exit;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* Nothing to do, Master by default */
 		break;
 	default:
@@ -437,7 +437,7 @@ static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.set_clkdiv	= s3c_pcm_set_clkdiv,
 	.trigger	= s3c_pcm_trigger,
 	.hw_params	= s3c_pcm_hw_params,
-	.set_fmt	= s3c_pcm_set_fmt,
+	.set_fmt_new	= s3c_pcm_set_fmt,
 };
 
 static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index de66cc422e6ea..9c8a0697849d7 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -252,12 +252,12 @@ static int s3c2412_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	iismod = readl(i2s->regs + S3C2412_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->master = 0;
 		iismod |= S3C2412_IISMOD_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->master = 1;
 		iismod &= ~S3C2412_IISMOD_SLAVE;
 		break;
@@ -666,7 +666,7 @@ int s3c_i2sv2_register_component(struct device *dev, int id,
 	ops->trigger = s3c2412_i2s_trigger;
 	if (!ops->hw_params)
 		ops->hw_params = s3c_i2sv2_hw_params;
-	ops->set_fmt = s3c2412_i2s_set_fmt;
+	ops->set_fmt_new = s3c2412_i2s_set_fmt;
 	ops->set_clkdiv = s3c2412_i2s_set_clkdiv;
 	ops->set_sysclk = s3c_i2sv2_set_sysclk;
 
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 0f46304eaa4f3..6226b3b585e54 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -169,11 +169,11 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_CFC:
 		iismod |= S3C2410_IISMOD_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		iismod &= ~S3C2410_IISMOD_SLAVE;
 		break;
 	default:
@@ -394,7 +394,7 @@ static int s3c24xx_i2s_resume(struct snd_soc_component *component)
 static const struct snd_soc_dai_ops s3c24xx_i2s_dai_ops = {
 	.trigger	= s3c24xx_i2s_trigger,
 	.hw_params	= s3c24xx_i2s_hw_params,
-	.set_fmt	= s3c24xx_i2s_set_fmt,
+	.set_fmt_new	= s3c24xx_i2s_set_fmt,
 	.set_clkdiv	= s3c24xx_i2s_set_clkdiv,
 	.set_sysclk	= s3c24xx_i2s_set_sysclk,
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
