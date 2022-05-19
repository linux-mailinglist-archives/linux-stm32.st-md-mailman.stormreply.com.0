Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD6E52D836
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 17:44:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F60BC0D2BF;
	Thu, 19 May 2022 15:44:19 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99522C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:44:15 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtab024228;
 Thu, 19 May 2022 10:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=emFWkhbKLVsY07EOxiGd6bRhil5YXk3bYL2bmY5jBhs=;
 b=gE7ASeZMhHcJqs5B7NPSes7hj5CyprtFA2EKL8SbShKqYtFabOCjJF7lHKhcfgMUPId6
 H5i5uuPx0JpJd6dw/vMuYJ+ycfQdTOSeTcUCpx+ZuPweP8ubw1xH/HQQC37a0o+4gLx0
 fmHIihOvrpnz60EkaRyDiWbmh8WzfP82quKCUXDQX+9ituAlqgSramhvSb+2sjA24+z/
 /+KxTsJxKeUDCdhzA1XWFYzN6sOx6Hde58g5TSNOnX/zY2nRBMIDoxDU5xbO3i8DyeWo
 bRwfWm722KdAMsBkUjmhOkZSurVQfRgJhxECR6BjHDc9bNdtsxML3x7OofG/TG9f2T/4 QQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B4557475;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 19 May 2022 16:42:27 +0100
Message-ID: <20220519154318.2153729-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ajhifK472w28_I4WDVyEuSohJoIsbKCp
X-Proofpoint-ORIG-GUID: ajhifK472w28_I4WDVyEuSohJoIsbKCp
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
Subject: [Linux-stm32] [PATCH 05/56] ASoC: bcm: Update to use set_fmt_new
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
 sound/soc/bcm/bcm2835-i2s.c | 22 +++++++++++-----------
 sound/soc/bcm/cygnus-ssp.c  |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index e3fc4bee8cfdc..aa7d8e081f89a 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -133,8 +133,8 @@ static void bcm2835_i2s_start_clock(struct bcm2835_i2s_dev *dev)
 		return;
 
 	switch (provider) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		clk_prepare_enable(dev->clk);
 		dev->clk_prepared = true;
 		break;
@@ -385,12 +385,12 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* Check if CPU is bit clock provider */
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		bit_clock_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BC_FC:
 		bit_clock_provider = false;
 		break;
 	default:
@@ -399,12 +399,12 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* Check if CPU is frame sync provider */
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BC_FP:
 		frame_sync_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FC:
+	case SND_SOC_DAIFMT_BC_FC:
 		frame_sync_provider = false;
 		break;
 	default:
@@ -743,7 +743,7 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.prepare	= bcm2835_i2s_prepare,
 	.trigger	= bcm2835_i2s_trigger,
 	.hw_params	= bcm2835_i2s_hw_params,
-	.set_fmt	= bcm2835_i2s_set_dai_fmt,
+	.set_fmt_new	= bcm2835_i2s_set_dai_fmt,
 	.set_bclk_ratio	= bcm2835_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
 };
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 9698f4531c90f..257f3657bcd6e 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -849,11 +849,11 @@ static int cygnus_ssp_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	ssp_newcfg = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		ssp_newcfg |= BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 1;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		ssp_newcfg &= ~BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 0;
 		break;
@@ -1148,7 +1148,7 @@ static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.shutdown	= cygnus_ssp_shutdown,
 	.trigger	= cygnus_ssp_trigger,
 	.hw_params	= cygnus_ssp_hw_params,
-	.set_fmt	= cygnus_ssp_set_fmt,
+	.set_fmt_new	= cygnus_ssp_set_fmt,
 	.set_sysclk	= cygnus_ssp_set_sysclk,
 	.set_tdm_slot	= cygnus_set_dai_tdm_slot,
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
