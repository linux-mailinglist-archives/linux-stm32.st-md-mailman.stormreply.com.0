Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF019557C0D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 14:56:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97FF7C640EC;
	Thu, 23 Jun 2022 12:56:23 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE129C640E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 12:56:21 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6FQeP013924;
 Thu, 23 Jun 2022 07:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=qB9TzZptXxMq27rHMq4lEOjBC7xijNuixvv7m2asfGg=;
 b=Myc8DuBGzmBY6PpimVDg7JowJlqUVUbNYCOVJGXqGrHsTUl1GuXbhREl6GiBovxy2QzX
 +dbvWGoE1jE2FzyuhltULwUWKgIcNZK+ozXHdC/OCXqMl+wBORdeh1+ezs4OxW/xrakL
 AOml0A5pcIfXaMGJRCkzB+dQHoU7WugW26ZyI3Bc5Whnsj10T8dGXFNKftXw6ijT7nXp
 xH68wnGZKeA6Q1c9Ez3iut60O8TYKIvqBtD7DMFvt73MfXDpI+hszSPTDoDaAdU/jr3A
 pbA3RqvdiShnMMhOjUcSbg6lwX/hWb5QYvv1NMfwbT9C3iZquUtvbNHi7moNOS1IQ0zs KQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 31B9511D3;
 Thu, 23 Jun 2022 12:52:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 23 Jun 2022 13:51:41 +0100
Message-ID: <20220623125250.2355471-28-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 5W9aCtwCMCd5hLlYtQKTcTXDoaBqX75h
X-Proofpoint-ORIG-GUID: 5W9aCtwCMCd5hLlYtQKTcTXDoaBqX75h
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
Subject: [Linux-stm32] [PATCH v2 27/96] ASoC: au1x: Migrate to new style
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

Changes since v1:
 - Fix typo in ac97c.c legacy_dai_name -> legacy_dai_naming

 sound/soc/au1x/ac97c.c    | 3 ++-
 sound/soc/au1x/i2sc.c     | 3 ++-
 sound/soc/au1x/psc-ac97.c | 3 ++-
 sound/soc/au1x/psc-i2s.c  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index 3b1700e665f52..b18512ca25781 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -223,7 +223,8 @@ static struct snd_soc_dai_driver au1xac97c_dai_driver = {
 };
 
 static const struct snd_soc_component_driver au1xac97c_component = {
-	.name		= "au1xac97c",
+	.name			= "au1xac97c",
+	.legacy_dai_naming	= 1,
 };
 
 static int au1xac97c_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 45bb7851e75d7..b15c8baa9ee45 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -227,7 +227,8 @@ static struct snd_soc_dai_driver au1xi2s_dai_driver = {
 };
 
 static const struct snd_soc_component_driver au1xi2s_component = {
-	.name		= "au1xi2s",
+	.name			= "au1xi2s",
+	.legacy_dai_naming	= 1,
 };
 
 static int au1xi2s_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 05eb36991f147..b536394b9ca08 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -356,7 +356,8 @@ static const struct snd_soc_dai_driver au1xpsc_ac97_dai_template = {
 };
 
 static const struct snd_soc_component_driver au1xpsc_ac97_component = {
-	.name		= "au1xpsc-ac97",
+	.name			= "au1xpsc-ac97",
+	.legacy_dai_naming	= 1,
 };
 
 static int au1xpsc_ac97_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 530a072d74274..79b5ae4e494cb 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -286,7 +286,8 @@ static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
 };
 
 static const struct snd_soc_component_driver au1xpsc_i2s_component = {
-	.name		= "au1xpsc-i2s",
+	.name			= "au1xpsc-i2s",
+	.legacy_dai_naming	= 1,
 };
 
 static int au1xpsc_i2s_drvprobe(struct platform_device *pdev)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
