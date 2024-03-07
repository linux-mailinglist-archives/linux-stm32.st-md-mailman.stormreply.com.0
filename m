Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0FA875007
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Mar 2024 14:34:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18C36C6DD9B;
	Thu,  7 Mar 2024 13:34:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06B8EC6DD95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Mar 2024 13:34:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4279x8Iq028743; Thu, 7 Mar 2024 14:33:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=+7nWDb9ZWuayfFkASgiJUL4avZyU6WuY7zpZjhvk6Uc=; b=7M
 buGdCAh064QV5UxtSemkeKktdj715YEDnP34hOnWxuoPvR1bizyMPFs2c6Ah6Xxg
 91un5/jB2VcXrWMHXUBo7hX9mQdGxfBj55AfIevjRG8PFNtS+Zwm80BUYWMwwKSv
 BCc1bDnu/Ssj4zLPBDUZkxHrxeWVQFiq5lviRxCY4N0yljtblgSD1lVTTr5B4Kqu
 weYNMKCptPNhsCQC+p3wxWJ2sycvb6IhLz3Bzz34XrnHHiM/IXfksq7AUh4WdcpH
 pmjCovExiSWh4Y6lytkcUsc9ntVKGxOQbYtQX3Fy6HhIU7WQA7+c2SN8hCNXkRQo
 PhX+XAIsLe5mGbDXlk5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wn87tt1c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2024 14:33:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 241F24002D;
 Thu,  7 Mar 2024 14:33:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FE0527A504;
 Thu,  7 Mar 2024 14:33:30 +0100 (CET)
Received: from localhost (10.201.22.191) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Mar
 2024 14:33:27 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Thu, 7 Mar 2024 14:32:59 +0100
Message-ID: <20240307133306.383045-4-fabrice.gasnier@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v5 03/10] counter: stm32-timer-cnt: adopt
	signal definitions
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

Adopt signals definitions to ease later signals additions.
There are no intended functional changes here.

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v4:
- Add William's Reviewed-by tag
Changes in v3:
 New patch split from "counter: stm32-timer-cnt: introduce clock signal"
---
 drivers/counter/stm32-timer-cnt.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 668e9d1061d3..c34747d7857e 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -21,6 +21,9 @@
 #define TIM_CCER_MASK	(TIM_CCER_CC1P | TIM_CCER_CC1NP | \
 			 TIM_CCER_CC2P | TIM_CCER_CC2NP)
 
+#define STM32_CH1_SIG		0
+#define STM32_CH2_SIG		1
+
 struct stm32_timer_regs {
 	u32 cr1;
 	u32 cnt;
@@ -247,14 +250,14 @@ static int stm32_action_read(struct counter_device *counter,
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
@@ -278,11 +281,11 @@ static const struct counter_ops stm32_timer_cnt_ops = {
 
 static struct counter_signal stm32_signals[] = {
 	{
-		.id = 0,
+		.id = STM32_CH1_SIG,
 		.name = "Channel 1"
 	},
 	{
-		.id = 1,
+		.id = STM32_CH2_SIG,
 		.name = "Channel 2"
 	}
 };
@@ -291,12 +294,12 @@ static struct counter_synapse stm32_count_synapses[] = {
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
