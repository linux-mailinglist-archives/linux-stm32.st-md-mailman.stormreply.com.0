Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69452D86B
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 17:44:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CC38C65041;
	Thu, 19 May 2022 15:44:53 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3C12C65044
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:44:50 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW1012194;
 Thu, 19 May 2022 10:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zovcG00Qw1epnEygXfoI+fXk8bpqiR5gNT0dl14iD4Y=;
 b=lWc/v8rbG6DU3/oen1cs99BZePFwWmNoSiUWQBhylY48FwvXVumaQtWAySXEUo/z6McS
 /n19a4Tn3t4SUfM5OhrzHXKcibSXa7p9DDnH2u9Se/Isfe/g2s+mK76dJc6G5Vf5e6iS
 zF629G9KrsUm46guTqiSNvL6wa5uR5omvc4xNLdwyC3NFY5daFs52w0/yP9oA7HZiBtc
 D49Q6eP0VNpzEg/inh1XB5k9w6wq+/x7e+f64q7vaLP8T1b9P1li8VRLv4mWKMcNZ2Jo
 /zDNcy1p0llemEEQ76/yGfJx3sHNbeZ4Mww6EIMds3wJTVA5TR18Q4gAx0fvAp86DpWN CQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A5A56475;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 19 May 2022 16:42:40 +0100
Message-ID: <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 0Qtm8D2_cnb-mytSm_FVWYGxhUPRu7so
X-Proofpoint-ORIG-GUID: 0Qtm8D2_cnb-mytSm_FVWYGxhUPRu7so
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
Subject: [Linux-stm32] [PATCH 18/56] ASoC: rockchip: Update to use
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
 sound/soc/rockchip/rockchip_i2s.c     | 8 ++++----
 sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 4ce5d25793875..0a66c7df323dc 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -199,13 +199,13 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 
 	pm_runtime_get_sync(cpu_dai->dev);
 	mask = I2S_CKR_MSS_MASK;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* Set source clock in Master mode */
 		val = I2S_CKR_MSS_MASTER;
 		i2s->is_master_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		val = I2S_CKR_MSS_SLAVE;
 		i2s->is_master_mode = false;
 		break;
@@ -486,7 +486,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
 	.hw_params = rockchip_i2s_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_set_sysclk,
-	.set_fmt = rockchip_i2s_set_fmt,
+	.set_fmt_new = rockchip_i2s_set_fmt,
 	.trigger = rockchip_i2s_trigger,
 };
 
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 98700e75b82a1..c90afccdae362 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -411,12 +411,12 @@ static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
 	}
 
 	mask = I2S_CKR_MSS_MASK;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val = I2S_CKR_MSS_MASTER;
 		i2s_tdm->is_master_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		val = I2S_CKR_MSS_SLAVE;
 		i2s_tdm->is_master_mode = false;
 		break;
@@ -1113,7 +1113,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 	.hw_params = rockchip_i2s_tdm_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
-	.set_fmt = rockchip_i2s_tdm_set_fmt,
+	.set_fmt_new = rockchip_i2s_tdm_set_fmt,
 	.set_tdm_slot = rockchip_dai_tdm_slot,
 	.trigger = rockchip_i2s_tdm_trigger,
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
