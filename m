Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A8557C0E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 14:56:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5524C640EF;
	Thu, 23 Jun 2022 12:56:23 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 848BDC640E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 12:56:22 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N5mxl3032604;
 Thu, 23 Jun 2022 07:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=A965WNpWYSDhf9ldMo6HdYu7YQa1FzA7GWkgiub9ZVc=;
 b=lZrg0fLeKcjSlEddZRwEHE6vt9yOt9whU1TnWxyQJ9rx5chpbQyHTNnCbR9pHMG/72Nl
 31ONDR3VFhCYSvr8bmU5x8ykuR5uX0+3qkDsZDbz3/LQDUcrFOJ1GTdZami+QObpm8RU
 AXi3Z2TJK5Q42QlsGKAOFau5Noa5dFQSW1/n8ZvD5JjsfUUN6l6tnA4XLv3m1lM+2dD9
 x+LMqiKGDOGeTw+gBbQo9AoZNfO5lXvBAeKsBp0AoRubkeH8+BeSdP2am+PfvOIfF94j
 ChKUtZXfLFQeq3Z/sOB623yfecX97+q+AVcE5WGWic3zutGOfwkkHUAflWzZbeIXGf94 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:58 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0AA2111D3;
 Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 23 Jun 2022 13:51:29 +0100
Message-ID: <20220623125250.2355471-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ZkIw7JjuYXjXMU4pvUvvigumQtaTVjt8
X-Proofpoint-ORIG-GUID: ZkIw7JjuYXjXMU4pvUvvigumQtaTVjt8
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
Subject: [Linux-stm32] [PATCH v2 15/96] ASoC: Intel: Migrate to new style
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
 sound/soc/intel/keembay/kmb_platform.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index d10881fedc8bb..b4893365d01d5 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -388,15 +388,17 @@ static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver kmb_component = {
-	.name		= "kmb",
-	.pcm_construct	= kmb_platform_pcm_new,
-	.open		= kmb_pcm_open,
-	.trigger	= kmb_pcm_trigger,
-	.pointer	= kmb_pcm_pointer,
+	.name			= "kmb",
+	.pcm_construct		= kmb_platform_pcm_new,
+	.open			= kmb_pcm_open,
+	.trigger		= kmb_pcm_trigger,
+	.pointer		= kmb_pcm_pointer,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver kmb_component_dma = {
-	.name		= "kmb",
+	.name			= "kmb",
+	.legacy_dai_naming	= 1,
 };
 
 static int kmb_probe(struct snd_soc_dai *cpu_dai)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
