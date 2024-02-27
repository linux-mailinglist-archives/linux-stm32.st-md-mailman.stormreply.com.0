Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92803869DF9
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 18:40:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C93DC6DD67;
	Tue, 27 Feb 2024 17:40:15 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0457EC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 17:40:13 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RBi70e025166; Tue, 27 Feb 2024 18:40:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=oK3u5VA04nVMBTkalarhGWM8df4YU9kjhwAaKc3RoBs=; b=eD
 9ZphYgfJ9gBTwl6j6MwI0mcx9Bwa8VTiBCbjxphWa9jJN3C7YTCKWYWJ0P8aChdP
 sXw3y8qS+0z8E8RemiFi/aBHQX2jbDRKAVsRGX11+7jsxco8I4lYultM/TK7HLjx
 2rLP995uKHmxbFJZ2E3BDvHfFej5aysaHaQtQbcN4F96g3Zmsvbw0sSuk5jJnC/U
 in0/Ew0ZP8ZHo9BYlFDKJIkMlfgzzDJjwY3EzZeJ9ewYZso09iXysMkYi+P6Ykmb
 EKcXmiBqiLND0IYcvYNIKDtFn90wQ1DadTnI/JRW2fznZy3DayIgk9bnlYWLGFV8
 QLyknZK5xwCDW8fTwCVA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4bscdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 18:40:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E35AB4002D;
 Tue, 27 Feb 2024 18:39:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29A682AD133;
 Tue, 27 Feb 2024 18:39:33 +0100 (CET)
Received: from localhost (10.252.26.109) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 27 Feb
 2024 18:39:30 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Tue, 27 Feb 2024 18:38:01 +0100
Message-ID: <20240227173803.53906-10-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.26.109]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_05,2024-02-27_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 09/11] counter: stm32-timer-cnt: probe
	number of channels from registers
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

Probe the number of capture compare channels, by writing CCER register bits
and read them back. Take care to restore the register original value.

This is a precursor patch to support capture channels.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v4:
- directly use dev struct in stm32_timer_cnt_detect_channels routine.
Changes in v3:
- New patch split from:
  "counter: stm32-timer-cnt: populate capture channels and check encoder"
---
 drivers/counter/stm32-timer-cnt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 66039d1b3642..710437d3b33f 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -42,6 +42,7 @@ struct stm32_timer_cnt {
 	bool enabled;
 	struct stm32_timer_regs bak;
 	bool has_encoder;
+	unsigned int nchannels;
 };
 
 static const enum counter_function stm32_count_functions[] = {
@@ -416,6 +417,20 @@ static struct counter_count stm32_counts = {
 	.num_ext = ARRAY_SIZE(stm32_count_ext)
 };
 
+static void stm32_timer_cnt_detect_channels(struct device *dev,
+					    struct stm32_timer_cnt *priv)
+{
+	u32 ccer, ccer_backup;
+
+	regmap_read(priv->regmap, TIM_CCER, &ccer_backup);
+	regmap_set_bits(priv->regmap, TIM_CCER, TIM_CCER_CCXE);
+	regmap_read(priv->regmap, TIM_CCER, &ccer);
+	regmap_write(priv->regmap, TIM_CCER, ccer_backup);
+	priv->nchannels = hweight32(ccer & TIM_CCER_CCXE);
+
+	dev_dbg(dev, "has %d cc channels\n", priv->nchannels);
+}
+
 /* encoder supported on TIM1 TIM2 TIM3 TIM4 TIM5 TIM8 */
 #define STM32_TIM_ENCODER_SUPPORTED	(BIT(0) | BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(7))
 
@@ -484,6 +499,8 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	stm32_timer_cnt_detect_channels(dev, priv);
+
 	counter->name = dev_name(dev);
 	counter->parent = dev;
 	counter->ops = &stm32_timer_cnt_ops;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
