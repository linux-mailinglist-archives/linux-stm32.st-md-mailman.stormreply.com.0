Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B693557BEF
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 14:55:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5AC8C640ED;
	Thu, 23 Jun 2022 12:55:39 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD963C640E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 12:55:38 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6FQeS013924;
 Thu, 23 Jun 2022 07:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=sAu3pH6/6lU/XyXTN91/1WuCwzQ/mNc+bW7Bo0i0LcU=;
 b=e5pW6kTgadxBfVjgB+WLozMyvQm+QgqTbNVLiEAF5NO7iy6+VeNfy8GXGDshMTsB5qIG
 7NVSyrkreBiGGNtNjDw5XDPPisMSCKM6Q7oFAUdckU9dLs6cZJG+LaCGX/Z9ek5gX8tq
 jW6xVDhdjphWKEbAh+tR1+9Z91kW7rl+OofX3wRvs2P4M2ogGq4k6uVvzkHaKlW8Kx9P
 MrHopxddztVJSSkCNpw79dwFo6bDkDt33c9eX+6vkgoXWied2bGIH1dCnpU4shr4FSbG
 715cucK4Pea88b04cm6r0xXzogfFwc9koX3DNm6WZIu+DKha/XMljiInAJXf0bUZYmhr YA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4x-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:55 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6858A11D3;
 Thu, 23 Jun 2022 12:52:55 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 23 Jun 2022 13:52:06 +0100
Message-ID: <20220623125250.2355471-53-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: VQEw18QrbBwkdqgg7ilMzg33g8OLPaLL
X-Proofpoint-ORIG-GUID: VQEw18QrbBwkdqgg7ilMzg33g8OLPaLL
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 frattaroli.nicolas@gmail.com, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, daniel@ffwll.ch,
 shawnguo@kernel.org, daniel@zonque.org
Subject: [Linux-stm32] [PATCH v2 52/96] ASoC: max*: Remove now redundant
	non_legacy_dai_naming flag
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

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/max98088.c  | 1 -
 sound/soc/codecs/max98090.c  | 1 -
 sound/soc/codecs/max98095.c  | 1 -
 sound/soc/codecs/max98357a.c | 1 -
 sound/soc/codecs/max98371.c  | 1 -
 sound/soc/codecs/max98373.c  | 2 --
 sound/soc/codecs/max98390.c  | 1 -
 sound/soc/codecs/max98396.c  | 2 --
 sound/soc/codecs/max9850.c   | 1 -
 sound/soc/codecs/max98520.c  | 1 -
 sound/soc/codecs/max9860.c   | 1 -
 sound/soc/codecs/max9867.c   | 1 -
 sound/soc/codecs/max98925.c  | 1 -
 sound/soc/codecs/max98926.c  | 1 -
 sound/soc/codecs/max98927.c  | 1 -
 15 files changed, 17 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 5ef2e1279ee71..08e5c606ff27d 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1734,7 +1734,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98088 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id max98088_i2c_id[] = {
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 72471cdb22292..142083b13ac3b 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2519,7 +2519,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98090 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98090_regmap = {
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index 7bca99fa61b54..44aa58fcc23f8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -2103,7 +2103,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98095 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id max98095_i2c_id[] = {
diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 9188127638848..2a2b286f1747f 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -93,7 +93,6 @@ static const struct snd_soc_component_driver max98357a_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops max98357a_dai_ops = {
diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index 800f2bca6a0f1..bac9d1bcf60ae 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -351,7 +351,6 @@ static const struct snd_soc_component_driver max98371_component = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98371_regmap = {
diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 1517c47afbf14..f90a6a7ba83b8 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -437,7 +437,6 @@ const struct snd_soc_component_driver soc_codec_dev_max98373 = {
 	.num_dapm_routes	= ARRAY_SIZE(max98373_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(soc_codec_dev_max98373);
 
@@ -462,7 +461,6 @@ const struct snd_soc_component_driver soc_codec_dev_max98373_sdw = {
 	.num_dapm_routes	= ARRAY_SIZE(max98373_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(soc_codec_dev_max98373_sdw);
 
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index d83f81d9ff4ea..5c08166a8dc62 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -983,7 +983,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98390 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98390_regmap = {
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 56eb62bb041f9..225effede9d25 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1453,7 +1453,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98396 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_max98397 = {
@@ -1467,7 +1466,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98397 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98396_regmap = {
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 9ca6fc254883c..a6733396b0cad 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -296,7 +296,6 @@ static const struct snd_soc_component_driver soc_component_dev_max9850 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int max9850_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index f0f085ecab550..5edd6f90f8a7b 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -657,7 +657,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98520 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98520_regmap = {
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index a1d0179e12c76..771b3dcd6cc32 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -537,7 +537,6 @@ static const struct snd_soc_component_driver max9860_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(max9860_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #ifdef CONFIG_PM
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index eb628b7e84f55..6d2941a9dbd6e 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -589,7 +589,6 @@ static const struct snd_soc_component_driver max9867_component = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static bool max9867_volatile_register(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 63849ebcfd354..c24d9f2c8874d 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -544,7 +544,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98925 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98925_regmap = {
diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 56e0a87c7112f..bffd56e240e9a 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -496,7 +496,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98926 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98926_regmap = {
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index b7cff76d7b5b9..9cce7c0f01424 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -832,7 +832,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98927 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98927_regmap = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
