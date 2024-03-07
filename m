Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C9875015
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Mar 2024 14:35:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C354C6DD96;
	Thu,  7 Mar 2024 13:35:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C0D7C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Mar 2024 13:35:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4279vKUL030012; Thu, 7 Mar 2024 14:35:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=b3XSIJTaaxtWqB8xdRUlG+Rl9a7/6rNgDWZPJrrBm8Y=; b=bn
 OUkcyTyA29idWHTORzyz5CrsvHiYTvtAksB8n/wkjlCZ1vfDpIN/DWfhUMWG/uGx
 /vXAZ2zc1swbM/qtDZyLYYY78r3RR6sFs8Sk78atK/Un0DpoZsCDat72SmIQsOoq
 vfke4NPESSvIDSQe8fLwRjHKsjQQhwduLKahN3jm3gIagwksYGW2yRLHPAB8PODE
 hAdKZvF4iRtphQFAuEgEujAnw578rBMzxz0ywcUnKZj9uArjowJulhym5/AdtSjt
 xptvYCOGGySVortJTypIOGg4XYySDbr3uIzesOzv3+8cfIirliCmc9pMAwYnyhYy
 bV5GQhV74XFE+PIpzXJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wktdmgh43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2024 14:35:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51AD140049;
 Thu,  7 Mar 2024 14:35:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B069027A504;
 Thu,  7 Mar 2024 14:34:40 +0100 (CET)
Received: from localhost (10.201.22.191) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Mar
 2024 14:34:40 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Thu, 7 Mar 2024 14:33:03 +0100
Message-ID: <20240307133306.383045-8-fabrice.gasnier@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v5 07/10] counter: stm32-timer-cnt: introduce
	channels
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

Simply add channels 3 and 4 that can be used for capture. Statically
add them, despite some timers doesn't have them. Rather rely on
stm32_action_read that will report "none" action for these currently.

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v4:
- Add William's Reviewed-by tag
Changes in v3:
- New patch split from:
  "counter: stm32-timer-cnt: populate capture channels and check encoder"
---
 drivers/counter/stm32-timer-cnt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 17f87ace450d..f63d0c3e3f22 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -25,6 +25,8 @@
 #define STM32_CH1_SIG		0
 #define STM32_CH2_SIG		1
 #define STM32_CLOCK_SIG		2
+#define STM32_CH3_SIG		3
+#define STM32_CH4_SIG		4
 
 struct stm32_timer_regs {
 	u32 cr1;
@@ -365,6 +367,14 @@ static struct counter_signal stm32_signals[] = {
 		.ext = stm32_count_clock_ext,
 		.num_ext = ARRAY_SIZE(stm32_count_clock_ext),
 	},
+	{
+		.id = STM32_CH3_SIG,
+		.name = "Channel 3"
+	},
+	{
+		.id = STM32_CH4_SIG,
+		.name = "Channel 4"
+	},
 };
 
 static struct counter_synapse stm32_count_synapses[] = {
@@ -383,6 +393,16 @@ static struct counter_synapse stm32_count_synapses[] = {
 		.num_actions = ARRAY_SIZE(stm32_clock_synapse_actions),
 		.signal = &stm32_signals[STM32_CLOCK_SIG]
 	},
+	{
+		.actions_list = stm32_synapse_actions,
+		.num_actions = ARRAY_SIZE(stm32_synapse_actions),
+		.signal = &stm32_signals[STM32_CH3_SIG]
+	},
+	{
+		.actions_list = stm32_synapse_actions,
+		.num_actions = ARRAY_SIZE(stm32_synapse_actions),
+		.signal = &stm32_signals[STM32_CH4_SIG]
+	},
 };
 
 static struct counter_count stm32_counts = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
