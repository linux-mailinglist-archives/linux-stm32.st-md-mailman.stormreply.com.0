Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07900DBFC6
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2019 10:22:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFBF0C36B0B;
	Fri, 18 Oct 2019 08:22:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28918C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 08:22:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9I8GwCa004597; Fri, 18 Oct 2019 10:21:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=gSYSCXccs9DhicnJdZYsTLDwYosR5Ljw+yyIPovM2yU=;
 b=gWp0QO/xNev/cjQnwT7BcMX/uzKloJS6XRgjcniJ+d3Kf4TDpJwo/1oMtmJdh2db94wR
 T1i83m6RhCV6RzWz8POl7f/yGb/+3Iq+6qLMwizKUBnZTVtvCa+HGH1naGOIHuU/5E4V
 8BnDrs56NL4LC+//b/RXy9m9m7qxlG1hfksZsucmB9wptNE70mE0/JA0A0ppNtX/ryNy
 mh3OIgYSP8hlGKUvr/NweNThwU2lAHIgxzqqP+7aye6yw5Cj1JiRVdwdGjfxT9w1WLqA
 XVqQaX1Nj3iv2KgLGuk6M1iGQ6THYUuFi6XPP2HK1nzW5efBL8qanNyTJiUrkyYDBU/C Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3ya8y4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2019 10:21:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EC42100034;
 Fri, 18 Oct 2019 10:21:08 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F12E2B894D;
 Fri, 18 Oct 2019 10:21:08 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 18 Oct
 2019 10:21:08 +0200
Received: from localhost (10.201.21.218) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 18 Oct 2019 10:21:07
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Fri, 18 Oct 2019 10:20:40 +0200
Message-ID: <20191018082040.31022-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.218]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-18_02:2019-10-17,2019-10-18 signatures=0
Subject: [Linux-stm32] [PATCH] ASoC: stm32: sai: fix sysclk management on
	shutdown
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

The commit below, adds a call to sysclk callback on shutdown.
This introduces a regression in stm32 SAI driver, as some clock
services are called twice, leading to unbalanced calls.
Move processing related to mclk from shutdown to sysclk callback.
When requested frequency is 0, assume shutdown and release mclk.

Fixes: 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to sysclk when shutdown")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index d7501f88aaa6..a4060813bc74 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -505,10 +505,20 @@ static int stm32_sai_set_sysclk(struct snd_soc_dai *cpu_dai,
 	if (dir == SND_SOC_CLOCK_OUT && sai->sai_mclk) {
 		ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
 					 SAI_XCR1_NODIV,
-					 (unsigned int)~SAI_XCR1_NODIV);
+					 freq ? 0 : SAI_XCR1_NODIV);
 		if (ret < 0)
 			return ret;
 
+		/* Assume shutdown if requested frequency is 0Hz */
+		if (!freq) {
+			/* Release mclk rate only if rate was actually set */
+			if (sai->mclk_rate) {
+				clk_rate_exclusive_put(sai->sai_mclk);
+				sai->mclk_rate = 0;
+			}
+			return 0;
+		}
+
 		/* If master clock is used, set parent clock now */
 		ret = stm32_sai_set_parent_clock(sai, freq);
 		if (ret)
@@ -1093,15 +1103,6 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
 
-	regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, SAI_XCR1_NODIV,
-			   SAI_XCR1_NODIV);
-
-	/* Release mclk rate only if rate was actually set */
-	if (sai->mclk_rate) {
-		clk_rate_exclusive_put(sai->sai_mclk);
-		sai->mclk_rate = 0;
-	}
-
 	clk_disable_unprepare(sai->sai_ck);
 
 	spin_lock_irqsave(&sai->irq_lock, flags);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
