Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7852D84D
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 17:44:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1EDBC64107;
	Thu, 19 May 2022 15:44:29 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80A30C640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:44:23 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k127002261;
 Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=O1k08BLLSrWLN8bDTTYO6I9etCPuXwIsP0TRdmjUUh8=;
 b=lnkQKKHHuHjFy2bWDCn0K8JZyA+GsPfpvFgZ8fqdM3BOiG35hdgPqaNpjQdsSrkj7Yf6
 lLQfqfot2Htp2f4p2B5VtLD7M31mLzMxKDe0gK3iWoZA/8zc2ES0NKcd/kZ+d4CGyhp0
 vbglizWFVHzMOLJ8ncPuvYJGW6mS0fkaRV7tbgzqEpAZEyrPvld/OPJju8LzLbO6DQEU
 P+EpLEuGVy8l14E3a7Fdh8Z4Kq4hPmOGRNUmJSwU7O72KAe7t+YBxeA5nCo3d8JDsVKM
 ttTS+KvBrQlEwv5NLq3EpoiNmjPkXY4/jN9gB1hOvjQQJegSUx9dCkbYs1V/iU8U2/Wq Fg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 10C0511DA;
 Thu, 19 May 2022 15:43:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 19 May 2022 16:42:59 +0100
Message-ID: <20220519154318.2153729-38-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: zERY7-qXw1jE8CwXTYUsZQAsiyaYzUHL
X-Proofpoint-ORIG-GUID: zERY7-qXw1jE8CwXTYUsZQAsiyaYzUHL
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
Subject: [Linux-stm32] [PATCH 37/56] ASoC: img: Rename set_fmt_new back to
	set_fmt
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

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/img/img-i2s-in.c  | 2 +-
 sound/soc/img/img-i2s-out.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 79e733bc0ae69..97cab6d95b169 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -373,7 +373,7 @@ static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
 	.trigger = img_i2s_in_trigger,
 	.hw_params = img_i2s_in_hw_params,
-	.set_fmt_new = img_i2s_in_set_fmt
+	.set_fmt = img_i2s_in_set_fmt
 };
 
 static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index d92539603d6cb..9ec6fc528e2b4 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -381,7 +381,7 @@ static int img_i2s_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
 	.trigger = img_i2s_out_trigger,
 	.hw_params = img_i2s_out_hw_params,
-	.set_fmt_new = img_i2s_out_set_fmt
+	.set_fmt = img_i2s_out_set_fmt
 };
 
 static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
