Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23484286238
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 17:36:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCC79C3FAD7;
	Wed,  7 Oct 2020 15:36:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85F15C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 15:36:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097FWFoq023619; Wed, 7 Oct 2020 17:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FPikfaz/iiTGQi5nWBHbRB8G4mXCShpRHE2r00v/p/k=;
 b=vGjCrBwSR4FcoKznqjDzzOSVKUXfCHvk188gSI2CKZoS/eSEydLL+fYhyprRyLFLLuVD
 c77/MrC2p9Hc2VGH6lhSl6Z7/EAdXko/TNMJjutwOBxoGGvmGAwl47vvrdcH0/wYtTXT
 XEhFcgVJ1A6vCeJC4pqU4k9SiHL+K/GR/x1g2C7SN3+hQyg7qmEwHFWWnM3O1TDjSs6X
 AV432KRVOXrg/vrKf/F4CeXZF3hmFmoucPD8AnYZRfLj/TECMSwaF9k5U06sQySwbsaZ
 vyzbyrjPIDRcLEVxCbcToT4i3dThv1zUWpvlVYubEdih3wAfR2JZBpoqiAyOajw8bXiV qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjwfh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 17:35:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE8CA100034;
 Wed,  7 Oct 2020 17:35:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB1C22B8A24;
 Wed,  7 Oct 2020 17:35:14 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 17:35:14
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Wed, 7 Oct 2020 17:34:58 +0200
Message-ID: <20201007153459.22155-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201007153459.22155-1-olivier.moysan@st.com>
References: <20201007153459.22155-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_09:2020-10-06,
 2020-10-07 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ASoC: stm32: dfsdm: change rate limits
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

The DFSDM can support a larger rate range than currently
supported in driver.
Increase rate upper limit to 48kHz and allow all rates
in the range 8kHz to 48kHz.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_adfsdm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index ec27c13af04f..c4031988f981 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -47,9 +47,6 @@ static const struct snd_pcm_hardware stm32_adfsdm_pcm_hw = {
 		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_PAUSE,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
 
-	.rate_min = 8000,
-	.rate_max = 32000,
-
 	.channels_min = 1,
 	.channels_max = 1,
 
@@ -143,8 +140,9 @@ static const struct snd_soc_dai_driver stm32_adfsdm_dai = {
 		    .channels_max = 1,
 		    .formats = SNDRV_PCM_FMTBIT_S16_LE |
 			       SNDRV_PCM_FMTBIT_S32_LE,
-		    .rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
-			      SNDRV_PCM_RATE_32000),
+		    .rates = SNDRV_PCM_RATE_CONTINUOUS,
+		    .rate_min = 8000,
+		    .rate_max = 48000,
 		    },
 	.ops = &stm32_adfsdm_dai_ops,
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
