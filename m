Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB4AA5225
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 18:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 981CCC78F98;
	Wed, 30 Apr 2025 16:55:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C2EFC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 16:55:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCgokD017061;
 Wed, 30 Apr 2025 18:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vpyb+c9mE+Q+2Mh2tz1ExittWKkMDszFfcq8RuscDGI=; b=4zoqto9UJncUOg75
 9z2dpfdzXwjTwUtgbx5g+D/oHwmZR+OoCcV7CvNGUAtuM4Kz1ZxYf9fDE9r0klZv
 qoz7orVwMJbwyPBBJWXePQiSOub9SY/8AILGNkN5cAZZaDgNKjQkn1MtMactH1PZ
 lIUCjIpDukcjdZXzluY3Fgd6n6jNxywtz6UAFvDWZBCsxUXVKl4V6aiVpeM6pR4O
 5t9WT1SMSWyCMadALu1xveazPI3v2BR7Njr7mtX3UQgt2G/Kr/U9WtUc1BI0P4p3
 9bODKuCCMAQ3oZ6+I+owWWU/mihkysKCYePfSYGu82xD1H3jHgr0f/YmJZ4IHZxR
 VpF54g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tnm8e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 18:55:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A812A4004A;
 Wed, 30 Apr 2025 18:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1992DA47AC0;
 Wed, 30 Apr 2025 18:53:30 +0200 (CEST)
Received: from localhost (10.252.20.195) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 18:53:29 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 30 Apr 2025 18:52:08 +0200
Message-ID: <20250430165210.321273-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430165210.321273-1-olivier.moysan@foss.st.com>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.20.195]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ASoC: stm32: sai: skip useless iterations
	on kernel rate loop
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

the frequency of the kernel clock must be greater than or equal to the
bitclock rate. When searching for a convenient kernel clock rate in
stm32_sai_set_parent_rate() function, it is useless to continue the loop
below bitclock rate, as it will result in a invalid kernel clock rate.
Change the loop output condition.

Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index e8c1abf1ae0a..4d018b4bc3f0 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -409,11 +409,11 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 				     unsigned int rate)
 {
 	struct platform_device *pdev = sai->pdev;
-	unsigned int sai_ck_rate, sai_ck_max_rate, sai_curr_rate, sai_new_rate;
+	unsigned int sai_ck_rate, sai_ck_max_rate, sai_ck_min_rate, sai_curr_rate, sai_new_rate;
 	int div, ret;
 
 	/*
-	 * Set maximum expected kernel clock frequency
+	 * Set minimum and maximum expected kernel clock frequency
 	 * - mclk on or spdif:
 	 *   f_sai_ck = MCKDIV * mclk-fs * fs
 	 *   Here typical 256 ratio is assumed for mclk-fs
@@ -423,13 +423,16 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	 *   Set constraint MCKDIV * FRL <= 256, to ensure MCKDIV is in available range
 	 *   f_sai_ck = sai_ck_max_rate * pow_of_two(FRL) / 256
 	 */
+	sai_ck_min_rate = rate * 256;
 	if (!(rate % SAI_RATE_11K))
 		sai_ck_max_rate = SAI_MAX_SAMPLE_RATE_11K * 256;
 	else
 		sai_ck_max_rate = SAI_MAX_SAMPLE_RATE_8K * 256;
 
-	if (!sai->sai_mclk && !STM_SAI_PROTOCOL_IS_SPDIF(sai))
+	if (!sai->sai_mclk && !STM_SAI_PROTOCOL_IS_SPDIF(sai)) {
+		sai_ck_min_rate = rate * sai->fs_length;
 		sai_ck_max_rate /= DIV_ROUND_CLOSEST(256, roundup_pow_of_two(sai->fs_length));
+	}
 
 	/*
 	 * Request exclusivity, as the clock is shared by SAI sub-blocks and by
@@ -472,7 +475,7 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 		/* Try a lower frequency */
 		div++;
 		sai_ck_rate = sai_ck_max_rate / div;
-	} while (sai_ck_rate > rate);
+	} while (sai_ck_rate >= sai_ck_min_rate);
 
 	/* No accurate rate found */
 	dev_err(&pdev->dev, "Failed to find an accurate rate");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
