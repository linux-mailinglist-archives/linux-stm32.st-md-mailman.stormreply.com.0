Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025152D859
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 17:44:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 299EEC6504A;
	Thu, 19 May 2022 15:44:32 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E32ECC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:44:29 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW4012194;
 Thu, 19 May 2022 10:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZaKUpotIvoQjdFwP7QMhM/HkrShRS0CkfsVa54u1syg=;
 b=YN6ej9i/DaUwKi4WVG4klAJ0DdYoE0b40D8lRgZJMZc2zTEq2FwNM0+SSGGSeY78MXrs
 xZYuob90IvQK5lULl8v8UGVckZ7Wbqw0h/+8XoTFp5Nw2LMZ6orPZXXDMovQvzU0qeVQ
 EPOaxx/Os2qccEm1P/DFcRrQpWQTI7mVIjOR5/hrFSXQFhbFwHjv3JGf4gelj5QMkDC6
 6jFze3jVZv4dalMqOsyYTg7D1tlE5N84WGkPCXftFgdArtLslD6hJYckZdcOsz9e6nx4
 Z5uIXpLgZj7w4haQRz3pJxb+gZ7m7ekVdW8LArtMcau4vowehKMH1Z3xBgyLq/aXxcsJ /w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1636F11D1;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 19 May 2022 16:42:46 +0100
Message-ID: <20220519154318.2153729-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: q0UNWcUb84d3WFxs6NgPjsPFwNx8_Vjq
X-Proofpoint-ORIG-GUID: q0UNWcUb84d3WFxs6NgPjsPFwNx8_Vjq
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
Subject: [Linux-stm32] [PATCH 24/56] ASoC: test-component: Update to use
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
provider or consumer update this CPU side driver to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/generic/test-component.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 5da4725d9e16c..3a992a6eba9bb 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -66,7 +66,7 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int format = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 	unsigned int clock  = fmt & SND_SOC_DAIFMT_CLOCK_MASK;
 	unsigned int inv    = fmt & SND_SOC_DAIFMT_INV_MASK;
-	unsigned int master = fmt & SND_SOC_DAIFMT_MASTER_MASK;
+	unsigned int master = fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 	char *str;
 
 	dev_info(dai->dev, "name   : %s", dai->name);
@@ -105,16 +105,16 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	str = "unknown";
 	switch (master) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
 		str = "clk provider, frame provider";
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
 		str = "clk consumer, frame provider";
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BP_FC:
 		str = "clk provider, frame consumer";
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BC_FC:
 		str = "clk consumer, frame consumer";
 		break;
 	}
@@ -192,10 +192,10 @@ static int test_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 static u64 test_dai_formats =
 	/*
 	 * Select below from Sound Card, not auto
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFP
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFP
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFC
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFC
+	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FP
+	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FP
+	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FC
+	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FC
 	 */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
@@ -210,7 +210,7 @@ static u64 test_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
 
 static const struct snd_soc_dai_ops test_ops = {
-	.set_fmt		= test_dai_set_fmt,
+	.set_fmt_new		= test_dai_set_fmt,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
 	.auto_selectable_formats	= &test_dai_formats,
@@ -221,7 +221,7 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.set_sysclk		= test_dai_set_sysclk,
 	.set_pll		= test_dai_set_pll,
 	.set_clkdiv		= test_dai_set_clkdiv,
-	.set_fmt		= test_dai_set_fmt,
+	.set_fmt_new		= test_dai_set_fmt,
 	.mute_stream		= test_dai_mute_stream,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
