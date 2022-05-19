Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1EC52D834
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 17:44:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48226C0D2B8;
	Thu, 19 May 2022 15:44:16 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F5A6C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:44:15 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW2012194;
 Thu, 19 May 2022 10:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/QY3h2RCbCwHcApY9YRI7DieyncVTw6JbGJgrn5x/bU=;
 b=KTcGyBlLxmRDmhcEZ3fE9GzroOM2KVEu0JrJUu5IFW5ltKEPOaqxshtY76UaaX8PQZ3l
 WbLVKrUHxVJNHJfNXFPOnrB0rRE1XZI4QbljpZS0T09/DwyOl9zR0bt6gA7H2a2Znso8
 xCNgEJoxdk1ZH9SxOPfT3l+6gsL9L1g7I4D6MoRKAQzJiuis93KyPyKjOie3PKpf4f2E
 KzJ8iMppphuXVuj8yWrAFHtgx6/c8gFyv3bKHFx60hrOruU4TjNXSwZevOILgCRYofC0
 xKKzKVhMQqoGU5U5jfda09/16sJBjonI+gZFDn/pXx9uUTugpd2zVfb8L7PvSGb71XzE xQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E2B42475;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 19 May 2022 16:42:43 +0100
Message-ID: <20220519154318.2153729-22-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 7fC3h8QDsLVtbT0YM97J4_FJvvmLjrmG
X-Proofpoint-ORIG-GUID: 7fC3h8QDsLVtbT0YM97J4_FJvvmLjrmG
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
Subject: [Linux-stm32] [PATCH 21/56] ASoC: stm: Update to use set_fmt_new
	callback
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
 sound/soc/stm/stm32_i2s.c     | 10 +++++-----
 sound/soc/stm/stm32_sai_sub.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index ac5dff4d1677a..30c04f96ef1d6 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -593,16 +593,16 @@ static int stm32_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	}
 
 	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->ms_flg = I2S_MS_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->ms_flg = I2S_MS_MASTER;
 		break;
 	default:
 		dev_err(cpu_dai->dev, "Unsupported mode %#x\n",
-			fmt & SND_SOC_DAIFMT_MASTER_MASK);
+			fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 		return -EINVAL;
 	}
 
@@ -954,7 +954,7 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 
 static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
 	.set_sysclk	= stm32_i2s_set_sysclk,
-	.set_fmt	= stm32_i2s_set_dai_fmt,
+	.set_fmt_new	= stm32_i2s_set_dai_fmt,
 	.startup	= stm32_i2s_startup,
 	.hw_params	= stm32_i2s_hw_params,
 	.trigger	= stm32_i2s_trigger,
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index dd636af81c9bd..9f169b93fa740 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -719,18 +719,18 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	stm32_sai_sub_reg_up(sai, STM_SAI_FRCR_REGX, frcr_mask, frcr);
 
 	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is master */
 		cr1 |= SAI_XCR1_SLAVE;
 		sai->master = false;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		sai->master = true;
 		break;
 	default:
 		dev_err(cpu_dai->dev, "Unsupported mode %#x\n",
-			fmt & SND_SOC_DAIFMT_MASTER_MASK);
+			fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 		return -EINVAL;
 	}
 
@@ -1225,7 +1225,7 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 	.set_sysclk	= stm32_sai_set_sysclk,
-	.set_fmt	= stm32_sai_set_dai_fmt,
+	.set_fmt_new	= stm32_sai_set_dai_fmt,
 	.set_tdm_slot	= stm32_sai_set_dai_tdm_slot,
 	.startup	= stm32_sai_startup,
 	.hw_params	= stm32_sai_hw_params,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
