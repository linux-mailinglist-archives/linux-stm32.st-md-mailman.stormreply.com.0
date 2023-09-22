Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A377AB3DA
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 16:40:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E33A5C6C834;
	Fri, 22 Sep 2023 14:40:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 658D2C6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 14:40:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38M9kSaU014836; Fri, 22 Sep 2023 16:39:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=zdlAGz2FQiBBGeAWxNhwr+O+Dy8TEyK7FmQMy9byDuA=; b=bK
 gj1Zahqf8hBJpfgVavnicKOHRaLLvhg55NvUXT7TTQJet1/seiV57yPBL7pq3SNp
 SwBiiO+PaOkMMy3Jhn5L8q/NT9YJELNuSZie6wRd/hqFOiRU+CekeWgUAkGvfN6P
 cgrZqt4LXUnrBcSPuz2Mj+lgSgwDkXgetS5yfdzmv+9KkOKKpHRfObSzPWewu6l1
 b69tYBOloDOeq9KnNaNlypjtBz/Jn3njt2t3j2KZstb/mHzKAIJwjKGDGl2mSk+Q
 Ez6lmdr4k3v2YtrKYrYLh7U93LGYpwDkcDqFeTjyqFtsHNwwZMl1vc2xMm+WN1R2
 PgcKioFQfHNWZbk9gSmw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t8tt03wg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 16:39:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BA7410005C;
 Fri, 22 Sep 2023 16:39:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F4222235F24;
 Fri, 22 Sep 2023 16:39:45 +0200 (CEST)
Received: from localhost (10.252.14.82) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 16:39:45 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Fri, 22 Sep 2023 16:39:18 +0200
Message-ID: <20230922143920.3144249-5-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
References: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.14.82]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_13,2023-09-21_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/6] counter: stm32-timer-cnt: introduce
	clock signal
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

Introduce the internal clock signal, used to count when in simple rising
function. Define signal ids, to improve readability. Also add the
"frequency" attribute for the clock signal, and "prescaler" for the
counter.

Whit this patch, signal action reports consistent state when "increase"
function is used, and the counting frequency:
$ echo increase > function
$ grep -H "" signal*_action
signal0_action:rising edge
signal1_action:none
signal2_action:none
$ echo 1 > enable
$ cat count
25425
$ cat count
44439
$ cat ../signal0/frequency
208877930

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/counter/stm32-timer-cnt.c | 84 ++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 668e9d1061d3..11c66876b213 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -21,6 +21,10 @@
 #define TIM_CCER_MASK	(TIM_CCER_CC1P | TIM_CCER_CC1NP | \
 			 TIM_CCER_CC2P | TIM_CCER_CC2NP)
 
+#define STM32_CLOCK_SIG		0
+#define STM32_CH1_SIG		1
+#define STM32_CH2_SIG		2
+
 struct stm32_timer_regs {
 	u32 cr1;
 	u32 cnt;
@@ -216,11 +220,44 @@ static int stm32_count_enable_write(struct counter_device *counter,
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
+};
+
+static const enum counter_synapse_action stm32_clock_synapse_actions[] = {
+	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 };
 
 static const enum counter_synapse_action stm32_synapse_actions[] = {
@@ -243,25 +280,31 @@ static int stm32_action_read(struct counter_device *counter,
 	switch (function) {
 	case COUNTER_FUNCTION_INCREASE:
 		/* counts on internal clock when CEN=1 */
-		*action = COUNTER_SYNAPSE_ACTION_NONE;
+		if (synapse->signal->id == STM32_CLOCK_SIG)
+			*action = COUNTER_SYNAPSE_ACTION_RISING_EDGE;
+		else
+			*action = COUNTER_SYNAPSE_ACTION_NONE;
 		return 0;
 	case COUNTER_FUNCTION_QUADRATURE_X2_A:
 		/* counts up/down on TI1FP1 edge depending on TI2FP2 level */
-		if (synapse->signal->id == count->synapses[0].signal->id)
+		if (synapse->signal->id == STM32_CH1_SIG)
 			*action = COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
 		else
 			*action = COUNTER_SYNAPSE_ACTION_NONE;
 		return 0;
 	case COUNTER_FUNCTION_QUADRATURE_X2_B:
 		/* counts up/down on TI2FP2 edge depending on TI1FP1 level */
-		if (synapse->signal->id == count->synapses[1].signal->id)
+		if (synapse->signal->id == STM32_CH2_SIG)
 			*action = COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
 		else
 			*action = COUNTER_SYNAPSE_ACTION_NONE;
 		return 0;
 	case COUNTER_FUNCTION_QUADRATURE_X4:
 		/* counts up/down on both TI1FP1 and TI2FP2 edges */
-		*action = COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
+		if (synapse->signal->id == STM32_CH1_SIG || synapse->signal->id == STM32_CH2_SIG)
+			*action = COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
+		else
+			*action = COUNTER_SYNAPSE_ACTION_NONE;
 		return 0;
 	default:
 		return -EINVAL;
@@ -276,27 +319,52 @@ static const struct counter_ops stm32_timer_cnt_ops = {
 	.action_read = stm32_action_read,
 };
 
+static int stm32_count_clk_get_freq(struct counter_device *counter,
+				    struct counter_signal *signal, u64 *freq)
+{
+	struct stm32_timer_cnt *const priv = counter_priv(counter);
+
+	*freq = clk_get_rate(priv->clk);
+
+	return 0;
+}
+
+static struct counter_comp stm32_count_clock_ext[] = {
+	COUNTER_COMP_SIGNAL_U64("frequency", stm32_count_clk_get_freq, NULL),
+};
+
 static struct counter_signal stm32_signals[] = {
 	{
-		.id = 0,
+		.id = STM32_CLOCK_SIG,
+		.name = "Clock Signal",
+		.ext = stm32_count_clock_ext,
+		.num_ext = ARRAY_SIZE(stm32_count_clock_ext),
+	},
+	{
+		.id = STM32_CH1_SIG,
 		.name = "Channel 1"
 	},
 	{
-		.id = 1,
+		.id = STM32_CH2_SIG,
 		.name = "Channel 2"
 	}
 };
 
 static struct counter_synapse stm32_count_synapses[] = {
+	{
+		.actions_list = stm32_clock_synapse_actions,
+		.num_actions = ARRAY_SIZE(stm32_clock_synapse_actions),
+		.signal = &stm32_signals[STM32_CLOCK_SIG]
+	},
 	{
 		.actions_list = stm32_synapse_actions,
 		.num_actions = ARRAY_SIZE(stm32_synapse_actions),
-		.signal = &stm32_signals[0]
+		.signal = &stm32_signals[STM32_CH1_SIG]
 	},
 	{
 		.actions_list = stm32_synapse_actions,
 		.num_actions = ARRAY_SIZE(stm32_synapse_actions),
-		.signal = &stm32_signals[1]
+		.signal = &stm32_signals[STM32_CH2_SIG]
 	}
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
