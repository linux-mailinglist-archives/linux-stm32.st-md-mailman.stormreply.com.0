Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA833BB8BF
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 10:19:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2329AC57B60;
	Mon,  5 Jul 2021 08:19:48 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA765C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 08:19:45 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 67-20020a17090a0fc9b02901725ed49016so8438089pjz.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jul 2021 01:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLjqZWQe/YbRhTdSUAIfqvZl6++obXP7V1QPjhbJF6E=;
 b=OuwD8OQhTm0+i0QMnu9LTr5hAe4C6oSyIhDZLdZuLDAMvMtZbqrTU2LefLISiPTMnp
 dJbjtszD7slUcbFPSjvetjP3J1rs+VuAlJdM2mX9VFEQ8tk+vOvzy0JBY082JCBGJWc4
 AXVaEBsWCyFMGXBD38+bddCcslBcLKFbwiR6H0x2tz6ptGrtITmb/Iq/HtkVBz2uUmok
 e09Rt3alkgsYXZX0w+NpYtmcRS6hUSsgnhCQS0RkxHRMWwvIeCEMYvMQGrnm5H2rtMpj
 4ybOxIwiex0klgyhz18VGTxfJbwjyxKnqjiQ490zf3FcJ7JO0fOaYPhaZKkyxT8qRf9d
 xdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLjqZWQe/YbRhTdSUAIfqvZl6++obXP7V1QPjhbJF6E=;
 b=BQOX4T00uOBzbIcabWIvwNq+l2W5N5W8K5NXI+COGY2xD5oE+nMT+32sYm0Z9vDPsT
 odfwtNFQAcDmqzc1Zuc4GAamU/WCGwIg/2m1Cu+whXWTxZ4OFHMesPWZP5DwXbHWVBri
 gjmjtpBr2RuNEVhcYYtkbhZ3r8KC822KFWkIPC/xhoADDhMklJxaFpN0+wj+cjQ+NbRj
 A4a9mUsO6nUNorgZeb7Yt18bKgpFRQHdakvLGpPXvD5BTTuoTnc/2Jt+2YhwPCsWdCG4
 m9v2C6t+BWHcqYIbmP6Fo5/fNkcHji9SM+TRNir/H2o5T6biUugLl797sI7icEcDvJAH
 6Fpg==
X-Gm-Message-State: AOAM533tFG3u/ZszrDIzw3VRrS8ygrTwSUSFJxrVw0b1LFxrujVk803N
 cE6ddqf1OXEa5WTgmLO3/CM=
X-Google-Smtp-Source: ABdhPJz8fepR79/o5GzN1WXH3GHz3xhtG4k+lNswucdHFmkYsrTU1HodxTdFOjUpqWSYnGgr7dFcsQ==
X-Received: by 2002:a17:90a:c484:: with SMTP id
 j4mr11159190pjt.218.1625473184433; 
 Mon, 05 Jul 2021 01:19:44 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y11sm12209986pfo.160.2021.07.05.01.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:19:44 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  5 Jul 2021 17:18:52 +0900
Message-Id: <65d237358e9e50ab10b8bc74202eddd2bbb8050a.1625471640.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v12 04/17] counter: Rename
	counter_signal_value to counter_signal_level
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

Signal values will always be levels so let's be explicit it about it to
make the intent of the code clear.

Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c            |  5 +++--
 drivers/counter/counter.c               | 12 ++++++------
 drivers/counter/interrupt-cnt.c         |  4 ++--
 drivers/counter/microchip-tcb-capture.c |  4 ++--
 include/linux/counter.h                 | 12 ++++++------
 5 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index d54efdb8d393..b4dd07cf51eb 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -97,7 +97,8 @@ struct quad8 {
 #define QUAD8_CMR_QUADRATURE_X4 0x18
 
 static int quad8_signal_read(struct counter_device *counter,
-	struct counter_signal *signal, enum counter_signal_value *val)
+			     struct counter_signal *signal,
+			     enum counter_signal_level *level)
 {
 	const struct quad8 *const priv = counter->priv;
 	unsigned int state;
@@ -109,7 +110,7 @@ static int quad8_signal_read(struct counter_device *counter,
 	state = inb(priv->base + QUAD8_REG_INDEX_INPUT_LEVELS)
 		& BIT(signal->id - 16);
 
-	*val = (state) ? COUNTER_SIGNAL_HIGH : COUNTER_SIGNAL_LOW;
+	*level = (state) ? COUNTER_SIGNAL_LEVEL_HIGH : COUNTER_SIGNAL_LEVEL_LOW;
 
 	return 0;
 }
diff --git a/drivers/counter/counter.c b/drivers/counter/counter.c
index 6a683d086008..cb92673552b5 100644
--- a/drivers/counter/counter.c
+++ b/drivers/counter/counter.c
@@ -289,9 +289,9 @@ struct counter_signal_unit {
 	struct counter_signal *signal;
 };
 
-static const char *const counter_signal_value_str[] = {
-	[COUNTER_SIGNAL_LOW] = "low",
-	[COUNTER_SIGNAL_HIGH] = "high"
+static const char *const counter_signal_level_str[] = {
+	[COUNTER_SIGNAL_LEVEL_LOW] = "low",
+	[COUNTER_SIGNAL_LEVEL_HIGH] = "high"
 };
 
 static ssize_t counter_signal_show(struct device *dev,
@@ -302,13 +302,13 @@ static ssize_t counter_signal_show(struct device *dev,
 	const struct counter_signal_unit *const component = devattr->component;
 	struct counter_signal *const signal = component->signal;
 	int err;
-	enum counter_signal_value val;
+	enum counter_signal_level level;
 
-	err = counter->ops->signal_read(counter, signal, &val);
+	err = counter->ops->signal_read(counter, signal, &level);
 	if (err)
 		return err;
 
-	return sprintf(buf, "%s\n", counter_signal_value_str[val]);
+	return sprintf(buf, "%s\n", counter_signal_level_str[level]);
 }
 
 struct counter_name_unit {
diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index 66cac4900327..d06367bef8f0 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -130,7 +130,7 @@ static int interrupt_cnt_function_get(struct counter_device *counter,
 
 static int interrupt_cnt_signal_read(struct counter_device *counter,
 				     struct counter_signal *signal,
-				     enum counter_signal_value *val)
+				     enum counter_signal_level *level)
 {
 	struct interrupt_cnt_priv *priv = counter->priv;
 	int ret;
@@ -142,7 +142,7 @@ static int interrupt_cnt_signal_read(struct counter_device *counter,
 	if (ret < 0)
 		return ret;
 
-	*val = ret ? COUNTER_SIGNAL_HIGH : COUNTER_SIGNAL_LOW;
+	*level = ret ? COUNTER_SIGNAL_LEVEL_HIGH : COUNTER_SIGNAL_LEVEL_LOW;
 
 	return 0;
 }
diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 0c9a61962911..6be3adf74114 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -158,7 +158,7 @@ static int mchp_tc_count_function_set(struct counter_device *counter,
 
 static int mchp_tc_count_signal_read(struct counter_device *counter,
 				     struct counter_signal *signal,
-				     enum counter_signal_value *val)
+				     enum counter_signal_level *lvl)
 {
 	struct mchp_tc_data *const priv = counter->priv;
 	bool sigstatus;
@@ -171,7 +171,7 @@ static int mchp_tc_count_signal_read(struct counter_device *counter,
 	else
 		sigstatus = (sr & ATMEL_TC_MTIOA);
 
-	*val = sigstatus ? COUNTER_SIGNAL_HIGH : COUNTER_SIGNAL_LOW;
+	*lvl = sigstatus ? COUNTER_SIGNAL_LEVEL_HIGH : COUNTER_SIGNAL_LEVEL_LOW;
 
 	return 0;
 }
diff --git a/include/linux/counter.h b/include/linux/counter.h
index 9dbd5df4cd34..79f5dcaf6ba0 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -290,16 +290,16 @@ struct counter_device_state {
 	const struct attribute_group **groups;
 };
 
-enum counter_signal_value {
-	COUNTER_SIGNAL_LOW = 0,
-	COUNTER_SIGNAL_HIGH
+enum counter_signal_level {
+	COUNTER_SIGNAL_LEVEL_LOW,
+	COUNTER_SIGNAL_LEVEL_HIGH,
 };
 
 /**
  * struct counter_ops - Callbacks from driver
  * @signal_read:	optional read callback for Signal attribute. The read
- *			value of the respective Signal should be passed back via
- *			the val parameter.
+ *			level of the respective Signal should be passed back via
+ *			the level parameter.
  * @count_read:		optional read callback for Count attribute. The read
  *			value of the respective Count should be passed back via
  *			the val parameter.
@@ -324,7 +324,7 @@ enum counter_signal_value {
 struct counter_ops {
 	int (*signal_read)(struct counter_device *counter,
 			   struct counter_signal *signal,
-			   enum counter_signal_value *val);
+			   enum counter_signal_level *level);
 	int (*count_read)(struct counter_device *counter,
 			  struct counter_count *count, unsigned long *val);
 	int (*count_write)(struct counter_device *counter,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
