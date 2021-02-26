Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3132325B4D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 02:29:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A42BC57B59;
	Fri, 26 Feb 2021 01:29:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76250C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 01:29:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id p5so4415676plo.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 17:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmwUKf+hUjG27sz2bJqruSzlU36nwLMx6Yr1Y6X8O/s=;
 b=MUdlHZntR8igfGXzxHRYarSsJ1VNGC47LvAonEOY8JSg3/voXJcOe3iDjmLmjdWvLD
 KMQxxUFn4AJKArwdElca1UiZ4WmORYgbm4q+yfMsgHRSIO/XwZ6smKLQ+zbl2qx/x19k
 tYcVIoLCSGkXu9Qn9ocH+OsddRAXQ3WYhrfkyCfjTpuXv8iAo1cJyB/vJd+Xl8PR4car
 gL7ieHzLY58KcoC3VYLAyBHw2rL+aRQ8W1z2YFBTExa1mEZSpZIgZF8o4uKKFHVT/l2o
 JpDztCwRXGCdtsE0AbIfVd6QVjZlomLGclNvkjnxs5FAvR4eowQO5epx2bYWE5rywPnL
 D1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmwUKf+hUjG27sz2bJqruSzlU36nwLMx6Yr1Y6X8O/s=;
 b=bV+KEe88b0jReli/yEWi2vjGv4fkScBFGmc+uHtDkRCYlmJK+EppIHMLt3RPL1yg69
 Kxja1azqTATc+siD700Am/90hgCS08MVC6sygSD7X62U8kSzLQqvTIa9wmRpIWyDRAjz
 /gM4LoiL8KHP0YQa+v9x+7vkEQJHQA6cMnblIOT9HR2ppwYzqIdMSc6iMRnq/yJy5POc
 uBo/Tbne4Kxc6f8bNXYRNjEv9ZJQvhqhfNL9L1AXScGLBBT2EdhKycBnRSj+Z75SasdF
 RDPSNv/BED/11HpR0337vEYYjIl7mQ4XXwmNMJZdIKYhaefgu7OE72T3fldeK1n4vN+V
 bTOA==
X-Gm-Message-State: AOAM530CVKcG0se9UkTrnKlkADtStoDRykM7pNBRvQ0U0SvBjYedC9Ga
 hF9HGYdjbDOoV5UmVoE16Pc=
X-Google-Smtp-Source: ABdhPJzDOcY0htBukhNsAGlPVzopVjSgvQVb9Vo/MdNoJwT2X1CB9g6ODBTdELCMsls/NK6rrrmQ3w==
X-Received: by 2002:a17:902:e54f:b029:e2:8f59:6fe0 with SMTP id
 n15-20020a170902e54fb02900e28f596fe0mr618450plf.76.1614302985633; 
 Thu, 25 Feb 2021 17:29:45 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id c6sm7773242pfc.94.2021.02.25.17.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 17:29:44 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 26 Feb 2021 10:29:31 +0900
Message-Id: <20210226012931.161429-1-vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Cc: alexandre.torgue@st.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 benjamin.gaignard@st.com
Subject: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: Report count
	function when SLAVE_MODE_DISABLED
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

When in SLAVE_MODE_DISABLED mode, the count still increases if the
counter is enabled because an internal clock is used. This patch fixes
the stm32_count_function_get() and stm32_count_function_set() functions
to properly handle this behavior.

Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v2:
 - Support an explicit 0 case for function_get()/function_set()

 drivers/counter/stm32-timer-cnt.c | 39 ++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index ef2a974a2f10..cd50dc12bd02 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -44,13 +44,14 @@ struct stm32_timer_cnt {
  * @STM32_COUNT_ENCODER_MODE_3: counts on both TI1FP1 and TI2FP2 edges
  */
 enum stm32_count_function {
-	STM32_COUNT_SLAVE_MODE_DISABLED = -1,
+	STM32_COUNT_SLAVE_MODE_DISABLED,
 	STM32_COUNT_ENCODER_MODE_1,
 	STM32_COUNT_ENCODER_MODE_2,
 	STM32_COUNT_ENCODER_MODE_3,
 };
 
 static enum counter_count_function stm32_count_functions[] = {
+	[STM32_COUNT_SLAVE_MODE_DISABLED] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[STM32_COUNT_ENCODER_MODE_1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
 	[STM32_COUNT_ENCODER_MODE_2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_B,
 	[STM32_COUNT_ENCODER_MODE_3] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
@@ -90,6 +91,9 @@ static int stm32_count_function_get(struct counter_device *counter,
 	regmap_read(priv->regmap, TIM_SMCR, &smcr);
 
 	switch (smcr & TIM_SMCR_SMS) {
+	case 0:
+		*function = STM32_COUNT_SLAVE_MODE_DISABLED;
+		return 0;
 	case 1:
 		*function = STM32_COUNT_ENCODER_MODE_1;
 		return 0;
@@ -99,9 +103,9 @@ static int stm32_count_function_get(struct counter_device *counter,
 	case 3:
 		*function = STM32_COUNT_ENCODER_MODE_3;
 		return 0;
+	default:
+		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static int stm32_count_function_set(struct counter_device *counter,
@@ -112,6 +116,9 @@ static int stm32_count_function_set(struct counter_device *counter,
 	u32 cr1, sms;
 
 	switch (function) {
+	case STM32_COUNT_SLAVE_MODE_DISABLED:
+		sms = 0;
+		break;
 	case STM32_COUNT_ENCODER_MODE_1:
 		sms = 1;
 		break;
@@ -122,8 +129,7 @@ static int stm32_count_function_set(struct counter_device *counter,
 		sms = 3;
 		break;
 	default:
-		sms = 0;
-		break;
+		return -EINVAL;
 	}
 
 	/* Store enable status */
@@ -274,31 +280,36 @@ static int stm32_action_get(struct counter_device *counter,
 	size_t function;
 	int err;
 
-	/* Default action mode (e.g. STM32_COUNT_SLAVE_MODE_DISABLED) */
-	*action = STM32_SYNAPSE_ACTION_NONE;
-
 	err = stm32_count_function_get(counter, count, &function);
 	if (err)
-		return 0;
+		return err;
 
 	switch (function) {
+	case STM32_COUNT_SLAVE_MODE_DISABLED:
+		/* counts on internal clock when CEN=1 */
+		*action = STM32_SYNAPSE_ACTION_NONE;
+		return 0;
 	case STM32_COUNT_ENCODER_MODE_1:
 		/* counts up/down on TI1FP1 edge depending on TI2FP2 level */
 		if (synapse->signal->id == count->synapses[0].signal->id)
 			*action = STM32_SYNAPSE_ACTION_BOTH_EDGES;
-		break;
+		else
+			*action = STM32_SYNAPSE_ACTION_NONE;
+		return 0;
 	case STM32_COUNT_ENCODER_MODE_2:
 		/* counts up/down on TI2FP2 edge depending on TI1FP1 level */
 		if (synapse->signal->id == count->synapses[1].signal->id)
 			*action = STM32_SYNAPSE_ACTION_BOTH_EDGES;
-		break;
+		else
+			*action = STM32_SYNAPSE_ACTION_NONE;
+		return 0;
 	case STM32_COUNT_ENCODER_MODE_3:
 		/* counts up/down on both TI1FP1 and TI2FP2 edges */
 		*action = STM32_SYNAPSE_ACTION_BOTH_EDGES;
-		break;
+		return 0;
+	default:
+		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static const struct counter_ops stm32_timer_cnt_ops = {
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
