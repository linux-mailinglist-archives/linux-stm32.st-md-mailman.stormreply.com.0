Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECB875014
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Mar 2024 14:35:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60028C6DD94;
	Thu,  7 Mar 2024 13:35:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F9D8C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Mar 2024 13:35:16 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4279Ya15007106; Thu, 7 Mar 2024 14:35:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=ElfAaGaHRlTpUHfuhu7chh+EcaBsNYx6kELVdLzTaZI=; b=0h
 +P8tzjmaQAP6ZQE/TbjNxBauUHHWc7Ncle9h89wN40Vk/jRhtGWVSq3xLzL/RIsd
 +2s2kbuDEUOSDxrYVA6nlMLD6jtdxGsNApo77mZIvsewdCOWbud1C9EWVbikk8dC
 EhpOwQhJd8F/kiq8aKiZ15gcGo9ofDsPrV4bEix/4wp+abxAYNBNA8PuuzOa1HOF
 zLpRYKtAzLNOPf/tasDG5lLxg1jyGkYj9gEg9cYtZpOcSjNWUqEWm2RPTpWzczNf
 ibrYKeP8GPL7+ASGxE+oXSW8jITfkaaOnF1IHDmtvHHw7td7MyN7K1YtbaEhQS3i
 jRllMwbVuvbpAB3gkYQw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wmej5dtv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2024 14:35:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 26C1E40048;
 Thu,  7 Mar 2024 14:35:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2C7327A500;
 Thu,  7 Mar 2024 14:34:39 +0100 (CET)
Received: from localhost (10.201.22.191) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Mar
 2024 14:34:39 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Thu, 7 Mar 2024 14:33:01 +0100
Message-ID: <20240307133306.383045-6-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307133306.383045-1-fabrice.gasnier@foss.st.com>
References: <20240307133306.383045-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.191]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_08,2024-03-06_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 05/10] counter: stm32-timer-cnt: add
	counter prescaler extension
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

There's a prescaler in between the selected input signal used for
counting (CK_PSC), and the counter input (CK_CNT).
So add the "prescaler" extension to the counter.

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v4:
- Add William's Reviewed-by tag
Changes in v3:
- New patch split from "counter: stm32-timer-cnt: introduce clock signal"
---
 drivers/counter/stm32-timer-cnt.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 65b447b42e75..b969d550e90a 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -220,11 +220,40 @@ static int stm32_count_enable_write(struct counter_device *counter,
 	return 0;
 }
 
+static int stm32_count_prescaler_read(struct counter_device *counter,
+				      struct counter_count *count, u64 *prescaler)
+{
+	struct stm32_timer_cnt *const priv = counter_priv(counter);
+	u32 psc;
+
+	regmap_read(priv->regmap, TIM_PSC, &psc);
+
+	*prescaler = psc + 1;
+
+	return 0;
+}
+
+static int stm32_count_prescaler_write(struct counter_device *counter,
+				       struct counter_count *count, u64 prescaler)
+{
+	struct stm32_timer_cnt *const priv = counter_priv(counter);
+	u32 psc;
+
+	if (!prescaler || prescaler > MAX_TIM_PSC + 1)
+		return -ERANGE;
+
+	psc = prescaler - 1;
+
+	return regmap_write(priv->regmap, TIM_PSC, psc);
+}
+
 static struct counter_comp stm32_count_ext[] = {
 	COUNTER_COMP_DIRECTION(stm32_count_direction_read),
 	COUNTER_COMP_ENABLE(stm32_count_enable_read, stm32_count_enable_write),
 	COUNTER_COMP_CEILING(stm32_count_ceiling_read,
 			     stm32_count_ceiling_write),
+	COUNTER_COMP_COUNT_U64("prescaler", stm32_count_prescaler_read,
+			       stm32_count_prescaler_write),
 };
 
 static const enum counter_synapse_action stm32_clock_synapse_actions[] = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
