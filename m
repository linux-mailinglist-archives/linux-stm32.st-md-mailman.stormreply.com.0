Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5CB3BB8B8
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 10:19:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9133DC57B60;
	Mon,  5 Jul 2021 08:19:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE347C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 08:19:35 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id o4so6779894plg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jul 2021 01:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oiCsS1CJNDnSbfaf+2PAtZwF9aGCmVSPvg8D4KNEluQ=;
 b=F4Gf3sV/W5W5Bt0EzmzTvOGkXw10z3AwAcIBONxPcKBFmAKkvr4LTCUfiTU3FnYU8o
 dTkxSjfbrjb3zpMaTZWMuWhNwiZEX2ZyY9xBixTkkZ3d+36sttRbbqdnCqWAIAAkjrsA
 3A62qOdDcssrr4H5Br3DzY3UxtHUQIZ+fcixdsf2PRpV5LcxjItoCJs5tBC08w+DEoXg
 fmve+j2A3zC6ZZTTuKsMnkpON9RI7AKv86vIqjLj8O+rnnbvq4nqGKSJooZpbpi0KaJH
 +sgoDaU5XTP6kOHFgH73mcqRE/oG3yi6ru/MAD+e5WmmVJYDFBf4pixaNAvlKpZtYbyw
 ilCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oiCsS1CJNDnSbfaf+2PAtZwF9aGCmVSPvg8D4KNEluQ=;
 b=mrLExJNwTyZVW26RtlDRMzuR3JRLkrNgMNkkT379hJ8Ae+n3aqmrgNHn+oDs9EkSRk
 hpPmpGQ0OSCmCplP7WOH+05HM6h8TlPRSf4Uq5TmfHCaqSlncwNkL6f7zFXBpmZw5q3L
 y817gPHle0p6fdi9rMzuN9X0Raz7Bhr2ktZcUvAiptQGuzHyfFONtko5Fcevp63NJQgC
 iz51AhlUbOaqu9pvFR8eU+r85A04czstJt9F+MD7cec9pajOsPFVzlDjMch8kVpHCmse
 nIBCRxLtBce+QgPTw4uXVZ5+O/s0eV0S+aVkjRTYg3qBiIePsgAazEZL7VWbzu5TfC3J
 oxKA==
X-Gm-Message-State: AOAM5307VGLPFAlGZynRjok/4GGPR+byqvT86T0ccwOcUEVbl2iNiRMP
 xDfUTsSQIXohkx75cJOCZpI=
X-Google-Smtp-Source: ABdhPJwkg672vlNRqbslq6k5QcThAP27W9SxBUN1xmZn4nn/XNXqnfLd9RSLPC0Y8JYs58FO+sghnQ==
X-Received: by 2002:a17:90a:c28a:: with SMTP id
 f10mr14607732pjt.15.1625473174589; 
 Mon, 05 Jul 2021 01:19:34 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y11sm12209986pfo.160.2021.07.05.01.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:19:34 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  5 Jul 2021 17:18:50 +0900
Message-Id: <6d4bfe6d7acfbeaf09a6c7d6324b0cbf8e23f35a.1625471640.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1625471640.git.vilhelm.gray@gmail.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v12 02/17] counter: Return error code on
	invalid modes
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

Only a select set of modes (function, action, etc.) are valid for a
given device configuration. This patch ensures that invalid modes result
in a return -EINVAL. Such a situation should never occur in reality, but
it's good to define a default switch cases for the sake of making the
intent of the code clear.

Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: David Lechner <david@lechnology.com>
Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c            | 20 ++++++++++++------
 drivers/counter/microchip-tcb-capture.c |  6 ++++++
 drivers/counter/stm32-lptimer-cnt.c     | 10 +++++----
 drivers/counter/ti-eqep.c               | 27 +++++++++++++++----------
 4 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 81f9642777fb..b358b2b2b883 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -273,6 +273,10 @@ static int quad8_function_set(struct counter_device *counter,
 			*scale = 2;
 			mode_cfg |= QUAD8_CMR_QUADRATURE_X4;
 			break;
+		default:
+			/* should never reach this path */
+			mutex_unlock(&priv->lock);
+			return -EINVAL;
 		}
 	}
 
@@ -349,7 +353,7 @@ static int quad8_action_get(struct counter_device *counter,
 	case QUAD8_COUNT_FUNCTION_PULSE_DIRECTION:
 		if (synapse->signal->id == signal_a_id)
 			*action = QUAD8_SYNAPSE_ACTION_RISING_EDGE;
-		break;
+		return 0;
 	case QUAD8_COUNT_FUNCTION_QUADRATURE_X1:
 		if (synapse->signal->id == signal_a_id) {
 			quad8_direction_get(counter, count, &direction);
@@ -359,17 +363,18 @@ static int quad8_action_get(struct counter_device *counter,
 			else
 				*action = QUAD8_SYNAPSE_ACTION_FALLING_EDGE;
 		}
-		break;
+		return 0;
 	case QUAD8_COUNT_FUNCTION_QUADRATURE_X2:
 		if (synapse->signal->id == signal_a_id)
 			*action = QUAD8_SYNAPSE_ACTION_BOTH_EDGES;
-		break;
+		return 0;
 	case QUAD8_COUNT_FUNCTION_QUADRATURE_X4:
 		*action = QUAD8_SYNAPSE_ACTION_BOTH_EDGES;
-		break;
+		return 0;
+	default:
+		/* should never reach this path */
+		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static const struct counter_ops quad8_ops = {
@@ -529,6 +534,9 @@ static int quad8_count_mode_set(struct counter_device *counter,
 	case COUNTER_COUNT_MODE_MODULO_N:
 		cnt_mode = 3;
 		break;
+	default:
+		/* should never reach this path */
+		return -EINVAL;
 	}
 
 	mutex_lock(&priv->lock);
diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 51b8af80f98b..0c9a61962911 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -133,6 +133,9 @@ static int mchp_tc_count_function_set(struct counter_device *counter,
 		bmr |= ATMEL_TC_QDEN | ATMEL_TC_POSEN;
 		cmr |= ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_ABETRG | ATMEL_TC_XC0;
 		break;
+	default:
+		/* should never reach this path */
+		return -EINVAL;
 	}
 
 	regmap_write(priv->regmap, ATMEL_TC_BMR, bmr);
@@ -226,6 +229,9 @@ static int mchp_tc_count_action_set(struct counter_device *counter,
 	case MCHP_TC_SYNAPSE_ACTION_BOTH_EDGE:
 		edge = ATMEL_TC_ETRGEDG_BOTH;
 		break;
+	default:
+		/* should never reach this path */
+		return -EINVAL;
 	}
 
 	return regmap_write_bits(priv->regmap,
diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index c19d998df5ba..78f383b77bd2 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -206,9 +206,10 @@ static int stm32_lptim_cnt_function_set(struct counter_device *counter,
 		priv->quadrature_mode = 1;
 		priv->polarity = STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES;
 		return 0;
+	default:
+		/* should never reach this path */
+		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static ssize_t stm32_lptim_cnt_enable_read(struct counter_device *counter,
@@ -326,9 +327,10 @@ static int stm32_lptim_cnt_action_get(struct counter_device *counter,
 	case STM32_LPTIM_ENCODER_BOTH_EDGE:
 		*action = priv->polarity;
 		return 0;
+	default:
+		/* should never reach this path */
+		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static int stm32_lptim_cnt_action_set(struct counter_device *counter,
diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
index 65df9ef5b5bc..c303eb17c111 100644
--- a/drivers/counter/ti-eqep.c
+++ b/drivers/counter/ti-eqep.c
@@ -157,7 +157,7 @@ static int ti_eqep_action_get(struct counter_device *counter,
 		 * QEPA and QEPB trigger QCLK.
 		 */
 		*action = TI_EQEP_SYNAPSE_ACTION_BOTH_EDGES;
-		break;
+		return 0;
 	case TI_EQEP_COUNT_FUNC_DIR_COUNT:
 		/* In direction-count mode only rising edge of QEPA is counted
 		 * and QEPB gives direction.
@@ -165,12 +165,14 @@ static int ti_eqep_action_get(struct counter_device *counter,
 		switch (synapse->signal->id) {
 		case TI_EQEP_SIGNAL_QEPA:
 			*action = TI_EQEP_SYNAPSE_ACTION_RISING_EDGE;
-			break;
-		default:
+			return 0;
+		case TI_EQEP_SIGNAL_QEPB:
 			*action = TI_EQEP_SYNAPSE_ACTION_NONE;
-			break;
+			return 0;
+		default:
+			/* should never reach this path */
+			return -EINVAL;
 		}
-		break;
 	case TI_EQEP_COUNT_FUNC_UP_COUNT:
 	case TI_EQEP_COUNT_FUNC_DOWN_COUNT:
 		/* In up/down-count modes only QEPA is counted and QEPB is not
@@ -186,15 +188,18 @@ static int ti_eqep_action_get(struct counter_device *counter,
 				*action = TI_EQEP_SYNAPSE_ACTION_BOTH_EDGES;
 			else
 				*action = TI_EQEP_SYNAPSE_ACTION_RISING_EDGE;
-			break;
-		default:
+			return 0;
+		case TI_EQEP_SIGNAL_QEPB:
 			*action = TI_EQEP_SYNAPSE_ACTION_NONE;
-			break;
+			return 0;
+		default:
+			/* should never reach this path */
+			return -EINVAL;
 		}
-		break;
+	default:
+		/* should never reach this path */
+		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static const struct counter_ops ti_eqep_counter_ops = {
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
