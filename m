Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB0254E3F6
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 16:36:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04376C65E62;
	Thu, 16 Jun 2022 14:36:01 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 721C7C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 14:35:50 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CB027888;
 Thu, 16 Jun 2022 09:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Jgy4HYvWutWIwNsNORzLVRecig1c5kbslPS86+xHyEg=;
 b=mgSUGDdDdpekTdlEAUpg7wE+LP369Rc3nUTdx/i78NvLL0khdeqZUXymwvnMr/ndg+Y2
 7dM5ha1U1u7v6YOuu7TE17NbtXDOPMIWYYoZFYvW+FAG5dmq5ubNNVGNnMY+oslWNoZO
 ZXdJIind7Vu0pQbk+niy0Nx3sWc+t2yG+6UxyZbdw+fJxiClb9PrVs4YN5HiqA5vayRE
 ugGeyCj2wiCFoQ+qcLJj7dURgtkp7Pgtc3K9WiGxRPbeyRWAeIXAT+0ezNobqDQbvHMA
 S55H5hYo32oL2nZoGifMM0BrTe/JgTks27bX1MtYOhVCKBpuYgD8kmmQx6C13BgS3xa8 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2D276468;
 Thu, 16 Jun 2022 14:34:31 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 16 Jun 2022 15:33:09 +0100
Message-ID: <20220616143429.1324494-17-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: UFBxm3IHq5fcn3nVljfzcgJ60t0r2xj7
X-Proofpoint-ORIG-GUID: UFBxm3IHq5fcn3nVljfzcgJ60t0r2xj7
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
Subject: [Linux-stm32] [PATCH 16/96] ASoC: meson: Migrate to new style
	legacy DAI naming flag
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/meson/axg-frddr.c    | 3 +++
 sound/soc/meson/axg-pdm.c      | 4 +++-
 sound/soc/meson/axg-spdifin.c  | 1 +
 sound/soc/meson/axg-spdifout.c | 1 +
 sound/soc/meson/axg-toddr.c    | 3 +++
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 37f4bb3469b5c..61f9d417fd608 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -161,6 +161,7 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data axg_frddr_match_data = {
@@ -286,6 +287,7 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data g12a_frddr_match_data = {
@@ -356,6 +358,7 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data sm1_frddr_match_data = {
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index 672e43a9729dc..88ac58272f95b 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -457,7 +457,9 @@ static struct snd_soc_dai_driver axg_pdm_dai_drv = {
 	.remove		= axg_pdm_dai_remove,
 };
 
-static const struct snd_soc_component_driver axg_pdm_component_drv = {};
+static const struct snd_soc_component_driver axg_pdm_component_drv = {
+	.legacy_dai_naming = 1,
+};
 
 static const struct regmap_config axg_pdm_regmap_cfg = {
 	.reg_bits	= 32,
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index 4ba44e0d65d9f..e2cc4c4be7586 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -390,6 +390,7 @@ static const struct snd_kcontrol_new axg_spdifin_controls[] = {
 static const struct snd_soc_component_driver axg_spdifin_component_drv = {
 	.controls		= axg_spdifin_controls,
 	.num_controls		= ARRAY_SIZE(axg_spdifin_controls),
+	.legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config axg_spdifin_regmap_cfg = {
diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index 3960d082e1436..e8a12f15f3b4a 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -383,6 +383,7 @@ static const struct snd_soc_component_driver axg_spdifout_component_drv = {
 	.dapm_routes		= axg_spdifout_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(axg_spdifout_dapm_routes),
 	.set_bias_level		= axg_spdifout_set_bias_level,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config axg_spdifout_regmap_cfg = {
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index d6adf7edea41f..e9208e74e9659 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -182,6 +182,7 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data axg_toddr_match_data = {
@@ -242,6 +243,7 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data g12a_toddr_match_data = {
@@ -312,6 +314,7 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data sm1_toddr_match_data = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
