Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A82A54E3E3
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 16:35:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ADB9C6505D;
	Thu, 16 Jun 2022 14:35:50 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C23A3C65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 14:35:44 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CJ027888;
 Thu, 16 Jun 2022 09:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=dUxxZ4yDTMkaufibeeycQHK/CLz3N70DLkPSTZOUSSI=;
 b=UxhFowYfPDYtlLYcxm2l9Q+YA2DqEfYtyqriGac+ymVrGdiJebNtrhOnjzF2og5OMCO2
 ekb11C6KfKpfaLnsWtlHHRcEw9b6HRMbParU3NWIQs/59U7jZcYQ/56hr1D4r7uSfcj3
 KapDHvouTMHDWqrak23CPkM89aA5edEqqb5DvtZgV3hG9zRpt0kEtgpGYkRgv/lMLjfq
 bjUwymjoMSa67l07JAWT7AFxDSB9tdowqksxV79alwElvnUwZh1eQ2T7EfxdJIn58oaq
 vtbX8XMSIKO71q1852AjnWz5NhkrpeeCBYBcaU13R1Rj79BA6xEN3Q4WtvQKyInrkYCM xQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B14E211DA;
 Thu, 16 Jun 2022 14:34:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 16 Jun 2022 15:33:40 +0100
Message-ID: <20220616143429.1324494-48-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: j191FL3lqD6UqhBAE1_0aqZ-pE3_jUCs
X-Proofpoint-ORIG-GUID: j191FL3lqD6UqhBAE1_0aqZ-pE3_jUCs
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, daniel@ffwll.ch,
 shawnguo@kernel.org, daniel@zonque.org
Subject: [Linux-stm32] [PATCH 47/96] ASoC: ak*: Remove now redundant
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
 sound/soc/codecs/ak4104.c | 1 -
 sound/soc/codecs/ak4118.c | 1 -
 sound/soc/codecs/ak4375.c | 1 -
 sound/soc/codecs/ak4458.c | 2 --
 sound/soc/codecs/ak4535.c | 1 -
 sound/soc/codecs/ak4554.c | 1 -
 sound/soc/codecs/ak4613.c | 1 -
 sound/soc/codecs/ak4641.c | 1 -
 sound/soc/codecs/ak4642.c | 1 -
 sound/soc/codecs/ak4671.c | 1 -
 sound/soc/codecs/ak5386.c | 1 -
 sound/soc/codecs/ak5558.c | 2 --
 12 files changed, 14 deletions(-)

diff --git a/sound/soc/codecs/ak4104.c b/sound/soc/codecs/ak4104.c
index dc4747c77a7a1..ce99f30b4613a 100644
--- a/sound/soc/codecs/ak4104.c
+++ b/sound/soc/codecs/ak4104.c
@@ -248,7 +248,6 @@ static const struct snd_soc_component_driver soc_component_device_ak4104 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4104_regmap = {
diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index 5c4a78c16733b..b6d9a10bdccdc 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -342,7 +342,6 @@ static const struct snd_soc_component_driver soc_component_drv_ak4118 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4118_regmap = {
diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index 9a7b662016b9e..1ed004ba7cd23 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -473,7 +473,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4375 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4375_regmap = {
diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index baa9ff5d0ce50..ea33cc83c86c2 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -725,7 +725,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4497 = {
@@ -740,7 +739,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4497 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4458_regmap = {
diff --git a/sound/soc/codecs/ak4535.c b/sound/soc/codecs/ak4535.c
index cc803e730c6ec..8c8c93eea7048 100644
--- a/sound/soc/codecs/ak4535.c
+++ b/sound/soc/codecs/ak4535.c
@@ -402,7 +402,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4535 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ak4535_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/ak4554.c b/sound/soc/codecs/ak4554.c
index 8e60e2b56ad6d..b9607de5a1912 100644
--- a/sound/soc/codecs/ak4554.c
+++ b/sound/soc/codecs/ak4554.c
@@ -67,7 +67,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4554 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ak4554_soc_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index d29d5e0db168e..f75c19ef35511 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -827,7 +827,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4613 = {
 	.num_dapm_routes	= ARRAY_SIZE(ak4613_intercon),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void ak4613_parse_of(struct ak4613_priv *priv,
diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
index d8d9cc712d679..88851e94b0452 100644
--- a/sound/soc/codecs/ak4641.c
+++ b/sound/soc/codecs/ak4641.c
@@ -535,7 +535,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4641 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4641_regmap = {
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 3c20ff5595eb4..914d5b1969f8c 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -559,7 +559,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4642 = {
 	.num_dapm_routes	= ARRAY_SIZE(ak4642_intercon),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4642_regmap = {
diff --git a/sound/soc/codecs/ak4671.c b/sound/soc/codecs/ak4671.c
index 60edcbe560141..cd76765f8cc08 100644
--- a/sound/soc/codecs/ak4671.c
+++ b/sound/soc/codecs/ak4671.c
@@ -616,7 +616,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4671 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4671_regmap = {
diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index c76bfff246028..0c5e00679c7d8 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -77,7 +77,6 @@ static const struct snd_soc_component_driver soc_component_ak5386 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ak5386_set_dai_fmt(struct snd_soc_dai *codec_dai,
diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index c94cfde3e4a86..887d2c04d647a 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -393,7 +393,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak5558 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_ak5552 = {
@@ -408,7 +407,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak5552 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak5558_regmap = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
