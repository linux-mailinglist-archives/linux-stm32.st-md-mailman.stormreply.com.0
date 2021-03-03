Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2932B996
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 18:50:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0F77C57B64;
	Wed,  3 Mar 2021 17:50:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61902C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 17:50:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123Hf1lb021617; Wed, 3 Mar 2021 18:50:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=tZbRr9XduT63pSmgY3cChQ8LE10buNg7X9yGMbcw3f0=;
 b=ardA4KVhqVSHNapkXWguss+YzAkKTJ4/Si+Qc2uto69LpMN6basP6lmXe8s4A800i5AZ
 KCY79sh54JtHXmf435C+bAngY1OW3lIYZwA+/UV7wkjHOZ5vFVUl58LR/lPjIDATw7Sn
 X9vfKXIEuUtaJqVKKnHOS2qT0z/G6SwkEdGdfCM+iR211dYdkRluAv+zJWSt6KN3WBGs
 nRI/X23kiWS68z5Lf4SiI6pBewG14hPbobmLu96UDaKSecyVRWakG25PFZHzOYy9t+Jx
 XLtA4Hb0ZKDiIpQSXYYLgirztJpQaQDoQ3eaVBZHyBdKlRH5U+HgfSQpdyH0KWJao5A9 mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 370xehy4vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 18:50:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA66F10002A;
 Wed,  3 Mar 2021 18:50:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5B9225D036;
 Wed,  3 Mar 2021 18:50:19 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar 2021 18:50:19
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <vilhelm.gray@gmail.com>, <jic23@kernel.org>
Date: Wed, 3 Mar 2021 18:49:49 +0100
Message-ID: <1614793789-10346-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
Cc: mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
	miss-alignment with reload register
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

Ceiling value may be miss-aligned with what's actually configured into the
ARR register. This is seen after probe as currently the ARR value is zero,
whereas ceiling value is set to the maximum. So:
- reading ceiling reports zero
- in case the counter gets enabled without any prior configuration,
  it won't count.
- in case the function gets set by the user 1st, (priv->ceiling) is used.

Fix it by getting rid of the cached "priv->ceiling" variable. Rather use
the ARR register value directly by using regmap read or write when needed.
There should be no drawback on performance as priv->ceiling isn't used in
performance critical path.
There's also no point in writing ARR while setting function (sms), so
it can be safely removed.

Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")

Suggested-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Note: this applies on top of:
- "counter: stm32-timer-cnt: fix ceiling write max value"
---
 drivers/counter/stm32-timer-cnt.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 2295be3..75bc401 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -31,7 +31,6 @@ struct stm32_timer_cnt {
 	struct counter_device counter;
 	struct regmap *regmap;
 	struct clk *clk;
-	u32 ceiling;
 	u32 max_arr;
 	bool enabled;
 	struct stm32_timer_regs bak;
@@ -75,8 +74,10 @@ static int stm32_count_write(struct counter_device *counter,
 			     const unsigned long val)
 {
 	struct stm32_timer_cnt *const priv = counter->priv;
+	u32 ceiling;
 
-	if (val > priv->ceiling)
+	regmap_read(priv->regmap, TIM_ARR, &ceiling);
+	if (val > ceiling)
 		return -EINVAL;
 
 	return regmap_write(priv->regmap, TIM_CNT, val);
@@ -138,10 +139,6 @@ static int stm32_count_function_set(struct counter_device *counter,
 
 	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN, 0);
 
-	/* TIMx_ARR register shouldn't be buffered (ARPE=0) */
-	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
-	regmap_write(priv->regmap, TIM_ARR, priv->ceiling);
-
 	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
 
 	/* Make sure that registers are updated */
@@ -199,7 +196,6 @@ static ssize_t stm32_count_ceiling_write(struct counter_device *counter,
 	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
 	regmap_write(priv->regmap, TIM_ARR, ceiling);
 
-	priv->ceiling = ceiling;
 	return len;
 }
 
@@ -374,7 +370,6 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 
 	priv->regmap = ddata->regmap;
 	priv->clk = ddata->clk;
-	priv->ceiling = ddata->max_arr;
 	priv->max_arr = ddata->max_arr;
 
 	priv->counter.name = dev_name(dev);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
