Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCA557B5E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 14:54:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B8C9C640F2;
	Thu, 23 Jun 2022 12:54:32 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 210BBC640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 12:54:27 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlrB011978;
 Thu, 23 Jun 2022 07:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8Jk9hCbOsuYwm0RYQaJwiZ5tuQRLpnFj2YNVDn9mPS8=;
 b=ZlKISOSd0aU6kpUJEuTl5VPzpA35D6xmjUEqHY6eymuduuCI0CIJfJcGFdgAhoRSmpcc
 7pRKTYfPGDo9a0AVq0Wfep7+xvIvhqkaodjxZpoguHq+JLRsJLoYk2Y0rMLRsxP/u8gg
 wkXBTFsSZET+HXNY786tWLZW09W2g4GNx3b6QCn3b7ObIar7mPdZKu2NGH7udgAU9bjk
 Z8WOyGJQyH7LTqJ9Qsoh5Dro9dpyhhmm84cJHmvffcb+s+tvFfkgrMmQ2J2Svwo2ooe0
 QXj0lzsDZ29fLJecV00w7iZ/cAXAeHgcmPcrM/rv+PJ0wjjVW5NODcKAl4GG7NLs3rab 3g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 93FAE475;
 Thu, 23 Jun 2022 12:52:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 23 Jun 2022 13:51:24 +0100
Message-ID: <20220623125250.2355471-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: O_5n4ZiN7VIqKmZ3Nm0eqpWkhLP5Ce19
X-Proofpoint-ORIG-GUID: O_5n4ZiN7VIqKmZ3Nm0eqpWkhLP5Ce19
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
Subject: [Linux-stm32] [PATCH v2 10/96] ASoC: sh: Migrate to new style
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
 sound/soc/sh/hac.c       |  3 ++-
 sound/soc/sh/rcar/core.c | 11 ++++++-----
 sound/soc/sh/rz-ssi.c    |  9 +++++----
 sound/soc/sh/siu_pcm.c   | 17 +++++++++--------
 sound/soc/sh/ssi.c       |  3 ++-
 5 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sh/hac.c b/sound/soc/sh/hac.c
index 475fc984f8c51..46d145cbaf297 100644
--- a/sound/soc/sh/hac.c
+++ b/sound/soc/sh/hac.c
@@ -307,7 +307,8 @@ static struct snd_soc_dai_driver sh4_hac_dai[] = {
 };
 
 static const struct snd_soc_component_driver sh4_hac_component = {
-	.name		= "sh4-hac",
+	.name			= "sh4-hac",
+	.legacy_dai_naming	= 1,
 };
 
 static int hac_soc_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index a4180dc5a59ba..4973f94a21446 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1813,11 +1813,12 @@ int rsnd_kctrl_new(struct rsnd_mod *mod,
  *		snd_soc_component
  */
 static const struct snd_soc_component_driver rsnd_soc_component = {
-	.name		= "rsnd",
-	.probe		= rsnd_debugfs_probe,
-	.hw_params	= rsnd_hw_params,
-	.hw_free	= rsnd_hw_free,
-	.pointer	= rsnd_pointer,
+	.name			= "rsnd",
+	.probe			= rsnd_debugfs_probe,
+	.hw_params		= rsnd_hw_params,
+	.hw_free		= rsnd_hw_free,
+	.pointer		= rsnd_pointer,
+	.legacy_dai_naming	= 1,
 };
 
 static int rsnd_rdai_continuance_probe(struct rsnd_priv *priv,
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index beaf1a8d6da10..0d0594a0e4f6c 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -906,10 +906,11 @@ static struct snd_soc_dai_driver rz_ssi_soc_dai[] = {
 };
 
 static const struct snd_soc_component_driver rz_ssi_soc_component = {
-	.name		= "rz-ssi",
-	.open		= rz_ssi_pcm_open,
-	.pointer	= rz_ssi_pcm_pointer,
-	.pcm_construct	= rz_ssi_pcm_new,
+	.name			= "rz-ssi",
+	.open			= rz_ssi_pcm_open,
+	.pointer		= rz_ssi_pcm_pointer,
+	.pcm_construct		= rz_ssi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 static int rz_ssi_probe(struct platform_device *pdev)
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index 0a8a3c314a73d..f15ff36e79345 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -540,13 +540,14 @@ static void siu_pcm_free(struct snd_soc_component *component,
 }
 
 const struct snd_soc_component_driver siu_component = {
-	.name		= DRV_NAME,
-	.open		= siu_pcm_open,
-	.close		= siu_pcm_close,
-	.prepare	= siu_pcm_prepare,
-	.trigger	= siu_pcm_trigger,
-	.pointer	= siu_pcm_pointer_dma,
-	.pcm_construct	= siu_pcm_new,
-	.pcm_destruct	= siu_pcm_free,
+	.name			= DRV_NAME,
+	.open			= siu_pcm_open,
+	.close			= siu_pcm_close,
+	.prepare		= siu_pcm_prepare,
+	.trigger		= siu_pcm_trigger,
+	.pointer		= siu_pcm_pointer_dma,
+	.pcm_construct		= siu_pcm_new,
+	.pcm_destruct		= siu_pcm_free,
+	.legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(siu_component);
diff --git a/sound/soc/sh/ssi.c b/sound/soc/sh/ssi.c
index bf7a3c69920a6..96cf523c22734 100644
--- a/sound/soc/sh/ssi.c
+++ b/sound/soc/sh/ssi.c
@@ -377,7 +377,8 @@ static struct snd_soc_dai_driver sh4_ssi_dai[] = {
 };
 
 static const struct snd_soc_component_driver sh4_ssi_component = {
-	.name		= "sh4-ssi",
+	.name			= "sh4-ssi",
+	.legacy_dai_naming	= 1,
 };
 
 static int sh4_soc_dai_probe(struct platform_device *pdev)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
