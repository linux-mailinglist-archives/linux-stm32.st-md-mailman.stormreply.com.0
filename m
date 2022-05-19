Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24852D853
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 17:44:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D54AC64105;
	Thu, 19 May 2022 15:44:30 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C848EC640E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:44:26 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11w002261;
 Thu, 19 May 2022 10:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=M2IDrEb5l2+llrK3AWp4NytfJMdMlvgjjqfAQyTGOFY=;
 b=Hvf/VWWuJTxL/QeMVXtUWD9CdqbYQldrSJlKQnKSCLiMvKOM4CQOLMTKR5TkUxS18vej
 3gK7LDtO28l91Fa4owOa/Xh2fxF1/3OqFCrjS9vQVeej0K+ACQudoK6BWiPWSdDZTBUF
 V2X73VOv26SQiGDJKeuSxP4JXBJgvlD/0GXIgGQ3x/3h4Tj0Y1IkX4oJSxkzRLiZeSwQ
 rGl5AoHf1kBBSpyRO2PrSKmaCeG1SQvrO1bZnCt6Bxz2Pmd//glzWxbYUhgCcCB+ECKJ
 s3oqpa3VEQPF2AP0GfIYaaxfciBzN4CEoOcQdk7bHcq7Kb6Xe3oMKJpa8HmdZmmp0YUd Jg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6425711D1;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 19 May 2022 16:42:50 +0100
Message-ID: <20220519154318.2153729-29-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
X-Proofpoint-ORIG-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
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
Subject: [Linux-stm32] [PATCH 28/56] ASoC: core: Always send the CPU DAI a
	direct clock specifier
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

All CPU drivers are now updated to accept a direct indication of
whether they are clock provider or consumer, rather than being told
if the CODEC is clock provider. As such update the core to always
pass this direct indication rather than only if the new set_fmt_new
callback is defined. Note this makes no difference to the CODEC
side of the DAI link as it was already being directly told if it
was clock provider under the old system.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 90f4265bea501..227540851dedf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1214,7 +1214,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	unsigned int inv_dai_fmt;
 	unsigned int i;
 	int ret;
 
@@ -1227,19 +1226,11 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 	}
 
-	/*
-	 * Flip the polarity for the "CPU" end of a CODEC<->CODEC link
-	 */
-	inv_dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
+	/* Flip the polarity for the "CPU" end of link */
+	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		unsigned int fmt = dai_fmt;
-
-		if (cpu_dai->driver->ops->set_fmt_new ||
-		    snd_soc_component_is_codec(cpu_dai->component))
-			fmt = inv_dai_fmt;
-
-		ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
