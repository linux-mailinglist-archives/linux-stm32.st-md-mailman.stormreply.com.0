Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E04FDAA5224
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 18:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F227C78032;
	Wed, 30 Apr 2025 16:55:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6010DC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 16:55:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCTNne004579;
 Wed, 30 Apr 2025 18:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 iKq3Hl0BrIcuMMTCUIpmWVs6NCKyQQcOHdChQ0yRkYc=; b=eMYfExz/m4143DkQ
 BKXwK1tP2QdWw06akhjwl+6K6BisWJZaY2k7gFM8yttwy0kRfYZQVkIbI5u1ZnV5
 Shf8jMi3fOEYuMBAlkC3PfkqXpk2JsiOBR8Y1V8pCtGQKmaJJvJHfyO/iyrVXzyX
 7VEZ9Gx3d+Jps9z7uP4WlO20VfS11DNy4dstDzTnTWEbZkjuKL41Rek+LuRDeBEH
 L4iFMXLHVnFwvVoX1VblH1hEExiBz7zVJb3x9cdnekm0KsWv7SyvmvdlrhvINpOw
 lrsXYXFsjwaDSuA4qqIyHl4QSfBXaFVmfq4KlIYwpMhOR9GINl84Uo85Fq2cXEGH
 etSydw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tf483u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 18:55:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C38C74004C;
 Wed, 30 Apr 2025 18:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 362E6A47ACC;
 Wed, 30 Apr 2025 18:53:31 +0200 (CEST)
Received: from localhost (10.252.20.195) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 18:53:30 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 30 Apr 2025 18:52:09 +0200
Message-ID: <20250430165210.321273-3-olivier.moysan@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 2/2] ASoC: stm32: sai: add a check on minimal
	kernel frequency
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

On MP2 SoCs SAI kernel clock rate is managed through
stm32_sai_set_parent_rate() function.
If the kernel clock rate was set previously to a low frequency, this
frequency may be too low to support the newly requested audio stream rate.
However the stm32_sai_rate_accurate() will only check accuracy against
the maximum kernel clock rate. The function will return leaving the kernel
clock rate unchanged.
Add a check on minimal frequency requirement, to avoid this.

Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 4d018b4bc3f0..bf5299ba11c3 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -447,7 +447,10 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	 * return immediately.
 	 */
 	sai_curr_rate = clk_get_rate(sai->sai_ck);
-	if (stm32_sai_rate_accurate(sai_ck_max_rate, sai_curr_rate))
+	dev_dbg(&pdev->dev, "kernel clock rate: min [%u], max [%u], current [%u]",
+		sai_ck_min_rate, sai_ck_max_rate, sai_curr_rate);
+	if (stm32_sai_rate_accurate(sai_ck_max_rate, sai_curr_rate) &&
+	    sai_curr_rate >= sai_ck_min_rate)
 		return 0;
 
 	/*
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
