Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2319D341AD6
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:03:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E13FFC58D5B;
	Fri, 19 Mar 2021 11:03:50 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26311C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:03:47 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so4666556pjg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bnr3nxKzCXX2teamhMKHsrHLZQg+RvaFqb+8NBtz+g0=;
 b=ONQ1EfmCsggbuatwu2Al09Qw7DWmqPTUz7i0LUvxTsFGIFMOJdbmi//5T8vxftN8Kk
 8In2A/ACRd6XPfR5KtxECyKP83RrUcmyPq+vTvy+KTg5jH6o97dJIGbD/+sBrO1ee155
 7tq+/kWGsn3nf9yode7H0HdmhdQofZ6x5+S11RiCMkQ7CtGEofijW2+VKBulZRts7SfA
 0UZ8IGPTgLkemK5mmoymPvOPdEoWh1D9yinumlc+1kJH07CekzeyGq28bB64c4isa5IC
 DNKs7wvWYn2j7gnThtTqUNMwWaX0lMuMVJ9dkZnrvCY3O5ZlNx3VcqnvIaMM9+mc7JnC
 6aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bnr3nxKzCXX2teamhMKHsrHLZQg+RvaFqb+8NBtz+g0=;
 b=SjKeU54/ASDkstbtWCjaFFIvOBm6BF9fv+pbu3UphP3YSX357u0LSP/rxjNNJVdd//
 36UwPE5kmLP5Xn0keKcNFmQWWnCorvkSvKU+9VI3JFmqY/f/+knEM6N3I7Tm2XmTRAei
 JKB4hpv+8fE6fhq0zxTaMXkqIfqB7sXMwWS0ui+u/HDIMQv0F+fULTDhNoZSGmQotwX1
 drlPFD/zsv4UvIeUTYtPblUBcceR0SoKjME8fCR5UWUJ1LZohfhebWwiCP5PMbGMYI7i
 2WYphn/vSY+arBN3lN9DWWTet+UMR5L6apH5Fty6pV1lEpwm8gv8kGZIoRnq0TL59azs
 drXw==
X-Gm-Message-State: AOAM5330bNAmzmLcC4nEXCdP9XT0EE1/HCV6ZVCOk5jbB6MSn+wcA+b0
 S4ONNac32uI1HZzRKGIb6/8=
X-Google-Smtp-Source: ABdhPJyciwuVESkzQty0MYJJFuLzCsQIKej8/IdadGHDuZY3dD+ZvyUk7yb/PbMZ10THXAT/ceUUrA==
X-Received: by 2002:a17:90b:1007:: with SMTP id
 gm7mr9266147pjb.17.1616151825686; 
 Fri, 19 Mar 2021 04:03:45 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:03:45 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:51 +0900
Message-Id: <52016584522ed9b733cd52057f6974c274e34003.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 32/33] counter: 104-quad-8: Replace mutex
	with spinlock
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

This patch replaces the mutex I/O lock with a spinlock. This is in
preparation for a subsequent patch adding IRQ support for 104-QUAD-8
devices; we can't sleep in an interrupt context, so we'll need to use a
spinlock instead.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 90 +++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 37 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index eb7d63769f4c..d46b8101f207 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
+#include <linux/spinlock.h>
 
 #define QUAD8_EXTENT 32
 
@@ -28,6 +29,7 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
 
 /**
  * struct quad8 - device private data structure
+ * @lock:		lock to prevent clobbering device states during R/W ops
  * @counter:		instance of the counter_device
  * @fck_prescaler:	array of filter clock prescaler configurations
  * @preset:		array of preset values
@@ -42,7 +44,7 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
  * @base:		base port address of the device
  */
 struct quad8 {
-	struct mutex lock;
+	spinlock_t lock;
 	struct counter_device counter;
 	unsigned int fck_prescaler[QUAD8_NUM_COUNTERS];
 	unsigned int preset[QUAD8_NUM_COUNTERS];
@@ -123,6 +125,7 @@ static int quad8_count_read(struct counter_device *counter,
 	unsigned int flags;
 	unsigned int borrow;
 	unsigned int carry;
+	unsigned long irqflags;
 	int i;
 
 	flags = inb(base_offset + 1);
@@ -132,7 +135,7 @@ static int quad8_count_read(struct counter_device *counter,
 	/* Borrow XOR Carry effectively doubles count range */
 	*val = (unsigned long)(borrow ^ carry) << 24;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Reset Byte Pointer; transfer Counter to Output Latch */
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP | QUAD8_RLD_CNTR_OUT,
@@ -141,7 +144,7 @@ static int quad8_count_read(struct counter_device *counter,
 	for (i = 0; i < 3; i++)
 		*val |= (unsigned long)inb(base_offset) << (8 * i);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -151,13 +154,14 @@ static int quad8_count_write(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const int base_offset = priv->base + 2 * count->id;
+	unsigned long irqflags;
 	int i;
 
 	/* Only 24-bit values are supported */
 	if (val > 0xFFFFFF)
 		return -ERANGE;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Reset Byte Pointer */
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP, base_offset + 1);
@@ -182,7 +186,7 @@ static int quad8_count_write(struct counter_device *counter,
 	/* Reset Error flag */
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_E, base_offset + 1);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -200,8 +204,9 @@ static int quad8_function_read(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const int id = count->id;
+	unsigned long irqflags;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	if (priv->quadrature_mode[id])
 		switch (priv->quadrature_scale[id]) {
@@ -218,7 +223,7 @@ static int quad8_function_read(struct counter_device *counter,
 	else
 		*function = COUNTER_FUNCTION_PULSE_DIRECTION;
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -233,10 +238,11 @@ static int quad8_function_write(struct counter_device *counter,
 	unsigned int *const scale = priv->quadrature_scale + id;
 	unsigned int *const synchronous_mode = priv->synchronous_mode + id;
 	const int base_offset = priv->base + 2 * id + 1;
+	unsigned long irqflags;
 	unsigned int mode_cfg;
 	unsigned int idr_cfg;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	mode_cfg = priv->count_mode[id] << 1;
 	idr_cfg = priv->index_polarity[id] << 1;
@@ -271,7 +277,7 @@ static int quad8_function_write(struct counter_device *counter,
 			break;
 		default:
 			/* should never reach this path */
-			mutex_unlock(&priv->lock);
+			spin_unlock_irqrestore(&priv->lock, irqflags);
 			return -EINVAL;
 		}
 	}
@@ -279,7 +285,7 @@ static int quad8_function_write(struct counter_device *counter,
 	/* Load mode configuration to Counter Mode Register */
 	outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -405,9 +411,10 @@ static int quad8_index_polarity_set(struct counter_device *counter,
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id - 16;
 	const int base_offset = priv->base + 2 * channel_id + 1;
+	unsigned long irqflags;
 	unsigned int idr_cfg = index_polarity << 1;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	idr_cfg |= priv->synchronous_mode[channel_id];
 
@@ -416,7 +423,7 @@ static int quad8_index_polarity_set(struct counter_device *counter,
 	/* Load Index Control configuration to Index Control Register */
 	outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -445,15 +452,16 @@ static int quad8_synchronous_mode_set(struct counter_device *counter,
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id - 16;
 	const int base_offset = priv->base + 2 * channel_id + 1;
+	unsigned long irqflags;
 	unsigned int idr_cfg = synchronous_mode;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	idr_cfg |= priv->index_polarity[channel_id] << 1;
 
 	/* Index function must be non-synchronous in non-quadrature mode */
 	if (synchronous_mode && !priv->quadrature_mode[channel_id]) {
-		mutex_unlock(&priv->lock);
+		spin_unlock_irqrestore(&priv->lock, irqflags);
 		return -EINVAL;
 	}
 
@@ -462,7 +470,7 @@ static int quad8_synchronous_mode_set(struct counter_device *counter,
 	/* Load Index Control configuration to Index Control Register */
 	outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -509,6 +517,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
 	unsigned int count_mode;
 	unsigned int mode_cfg;
 	const int base_offset = priv->base + 2 * count->id + 1;
+	unsigned long irqflags;
 
 	/* Map Generic Counter count mode to 104-QUAD-8 count mode */
 	switch (cnt_mode) {
@@ -529,7 +538,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
 		return -EINVAL;
 	}
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->count_mode[count->id] = count_mode;
 
@@ -543,7 +552,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
 	/* Load mode configuration to Counter Mode Register */
 	outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -563,9 +572,10 @@ static int quad8_count_enable_write(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const int base_offset = priv->base + 2 * count->id;
+	unsigned long irqflags;
 	unsigned int ior_cfg;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->ab_enable[count->id] = enable;
 
@@ -574,7 +584,7 @@ static int quad8_count_enable_write(struct counter_device *counter,
 	/* Load I/O control configuration */
 	outb(QUAD8_CTR_IOR | ior_cfg, base_offset + 1);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -625,16 +635,17 @@ static int quad8_count_preset_write(struct counter_device *counter,
 				    struct counter_count *count, u64 preset)
 {
 	struct quad8 *const priv = counter->priv;
+	unsigned long irqflags;
 
 	/* Only 24-bit values are supported */
 	if (preset > 0xFFFFFF)
 		return -ERANGE;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	quad8_preset_register_set(priv, count->id, preset);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -643,8 +654,9 @@ static int quad8_count_ceiling_read(struct counter_device *counter,
 				    struct counter_count *count, u64 *ceiling)
 {
 	struct quad8 *const priv = counter->priv;
+	unsigned long irqflags;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Range Limit and Modulo-N count modes use preset value as ceiling */
 	switch (priv->count_mode[count->id]) {
@@ -658,7 +670,7 @@ static int quad8_count_ceiling_read(struct counter_device *counter,
 		break;
 	}
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -667,23 +679,24 @@ static int quad8_count_ceiling_write(struct counter_device *counter,
 				     struct counter_count *count, u64 ceiling)
 {
 	struct quad8 *const priv = counter->priv;
+	unsigned long irqflags;
 
 	/* Only 24-bit values are supported */
 	if (ceiling > 0xFFFFFF)
 		return -ERANGE;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Range Limit and Modulo-N count modes use preset value as ceiling */
 	switch (priv->count_mode[count->id]) {
 	case 1:
 	case 3:
-		mutex_unlock(&priv->lock);
+		spin_unlock_irqrestore(&priv->lock, irqflags);
 		quad8_preset_register_set(priv, count->id, ceiling);
 		return 0;
 	}
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return -EINVAL;
 }
@@ -705,12 +718,13 @@ static int quad8_count_preset_enable_write(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const int base_offset = priv->base + 2 * count->id + 1;
+	unsigned long irqflags;
 	unsigned int ior_cfg;
 
 	/* Preset enable is active low in Input/Output Control register */
 	preset_enable = !preset_enable;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->preset_enable[count->id] = preset_enable;
 
@@ -719,7 +733,7 @@ static int quad8_count_preset_enable_write(struct counter_device *counter,
 	/* Load I/O control configuration to Input / Output Control Register */
 	outb(QUAD8_CTR_IOR | ior_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -730,22 +744,23 @@ static int quad8_signal_cable_fault_read(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id / 2;
+	unsigned long irqflags;
 	bool disabled;
 	unsigned int status;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	disabled = !(priv->cable_fault_enable & BIT(channel_id));
 
 	if (disabled) {
-		mutex_unlock(&priv->lock);
+		spin_unlock_irqrestore(&priv->lock, irqflags);
 		return -EINVAL;
 	}
 
 	/* Logic 0 = cable fault */
 	status = inb(priv->base + QUAD8_DIFF_ENCODER_CABLE_STATUS);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	/* Mask respective channel and invert logic */
 	*cable_fault = !(status & BIT(channel_id));
@@ -771,9 +786,10 @@ static int quad8_signal_cable_fault_enable_write(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id / 2;
+	unsigned long irqflags;
 	unsigned int cable_fault_enable;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	if (enable)
 		priv->cable_fault_enable |= BIT(channel_id);
@@ -785,7 +801,7 @@ static int quad8_signal_cable_fault_enable_write(struct counter_device *counter,
 
 	outb(cable_fault_enable, priv->base + QUAD8_DIFF_ENCODER_CABLE_STATUS);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -808,8 +824,9 @@ static int quad8_signal_fck_prescaler_write(struct counter_device *counter,
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id / 2;
 	const int base_offset = priv->base + 2 * channel_id;
+	unsigned long irqflags;
 
-	mutex_lock(&priv->lock);
+	spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->fck_prescaler[channel_id] = prescaler;
 
@@ -821,7 +838,7 @@ static int quad8_signal_fck_prescaler_write(struct counter_device *counter,
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP | QUAD8_RLD_PRESET_PSC,
 	     base_offset + 1);
 
-	mutex_unlock(&priv->lock);
+	spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -990,8 +1007,7 @@ static int quad8_probe(struct device *dev, unsigned int id)
 	priv->counter.priv = priv;
 	priv->base = base[id];
 
-	/* Initialize mutex */
-	mutex_init(&priv->lock);
+	spin_lock_init(&priv->lock);
 
 	/* Reset all counters and disable interrupt function */
 	outb(QUAD8_CHAN_OP_RESET_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
