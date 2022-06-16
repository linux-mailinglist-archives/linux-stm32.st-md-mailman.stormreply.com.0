Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B0054E385
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 16:35:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7F5BC5F1ED;
	Thu, 16 Jun 2022 14:35:25 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99ADBC5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 14:35:24 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G8o9fY009500;
 Thu, 16 Jun 2022 09:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=QP+ZBUYAIdt6LRCHim/xoQUoHPNHrMxphXy99QAQmFo=;
 b=W7sD76ijL9djsTr6abct6t6eYBCgX3k7+AWRKQfipU6uE5UY7hBQbcDB+jW1dFjPalKq
 dx91m8fYrim8XadX5hAui+ITJmYe84DxF47r7sBQZqzyhAuqEGYLXFVTJg+iCoa5HOOS
 WZxkKP1kji1VWHA25GyMsnkLBJJ5SIJoE0/pWOjt1LSb5eL+cCvmmEOj1vgQ2Prfs7F3
 kjiQJZD/12wQJPZwWn6bpMzLUFOGDU0GIJhDYusAND/q46lIVXCSu3CZ5TeDFjDrprN0
 u8jetXplIR+COOr9H96kHQCJm+8//e50jGT6Q65gbGXXV5IJKJ/i+lx4bRl6p3muRiQM Kg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3u-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:36 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6D60E11D4;
 Thu, 16 Jun 2022 14:34:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 16 Jun 2022 15:34:14 +0100
Message-ID: <20220616143429.1324494-82-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: MIJ5E7-CTCdKno97jBsHKYzCP_lVa-eW
X-Proofpoint-GUID: MIJ5E7-CTCdKno97jBsHKYzCP_lVa-eW
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
Subject: [Linux-stm32] [PATCH 81/96] ASoC: Intel: avs: Remove now redundant
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
 sound/soc/intel/avs/pcm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 668f533578a69..f21b0cdd32063 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -846,7 +846,6 @@ static const struct snd_soc_component_driver avs_component_driver = {
 	.pcm_construct		= avs_component_construct,
 	.module_get_upon_open	= 1, /* increment refcount when a pcm is opened */
 	.topology_name_prefix	= "intel/avs",
-	.non_legacy_dai_naming	= true,
 };
 
 static int avs_soc_component_register(struct device *dev, const char *name,
@@ -1172,7 +1171,6 @@ static const struct snd_soc_component_driver avs_hda_component_driver = {
 	.remove_order		= SND_SOC_COMP_ORDER_EARLY,
 	.module_get_upon_open	= 1,
 	.topology_name_prefix	= "intel/avs",
-	.non_legacy_dai_naming	= true,
 };
 
 int avs_hda_platform_register(struct avs_dev *adev, const char *name)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
