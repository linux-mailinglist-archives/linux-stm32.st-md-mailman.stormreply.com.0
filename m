Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03A319E0E
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:16:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 117D5C57B5E;
	Fri, 12 Feb 2021 12:16:08 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71BBAC57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:16:06 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id f17so5131019qkl.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KZvkUbC0jaPZc3fK3Llp2xZbvyDRW9s72WklMpp5HMc=;
 b=k+DvrR/i5f5H+MFBcZ32t4Cyd2BSGqHDZsGQA90WNIsEkivE8KSvN7PuZy8jlba3d4
 AETSBwZgKxx1RWP82usZHjayWUnTsrQUy9qFLovJhy9TRZFOHdRbJ7wRMSkyufq4vMW+
 VzTV/1tTxkuK34av9rl22JT2bs8Zc1CJi2AHlqCwNqu+jh+50KjKaoc2ewOmURD71uC2
 GAiZttTdIdDxFw7dB0nOqVn+rvtEbs8LGuvi8nJlsaFrVen74B3WuUrY5BdefvBDKp3w
 lMJxOBCuVgSm2yWUyQUe87bwhEm2AfbpL5XGiLOi03LhIs1YHvCnbtGHqZCORXKSuDb+
 VAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KZvkUbC0jaPZc3fK3Llp2xZbvyDRW9s72WklMpp5HMc=;
 b=ZaU5T+uefb8zCGTEfAAcvIqqcaWpQyuOuvKgsVSzLNUseS8ZaThyTlt1nmiAcp7U4R
 YdBDjKiDCpu0N+S+FUl4IYsaUTnozYW+pPClYk4lCzOhW0y2vfxy7izBO1Fz99LerJo/
 RWAF/feGWnxya7ahtNhDGm9qui/dOIDMn/1OkPBOiRvtn5oqsCI2J+5w1SnRQ6l7T1mG
 pi3yyBQaMAULCxQEqeEDUrur83yI7Vfjuz8QY1K47jxOkwoH5P4c81791ImJYeUEETT4
 pej/z1mfB6zerBymaJSlB0GO89TSR23utawP60L3SN1tY/469fRQ+xO4yF/IP8BSizp/
 jZVA==
X-Gm-Message-State: AOAM533fMTDJwhLwSYh/GS4jLCnABeC+hOJmn9T2HfYr3Er2OmRTyj7x
 H0SmR+RYxzC0Kc5c4l3tNFc=
X-Google-Smtp-Source: ABdhPJxTvJ8G+zm+TB+EKp/mQWmTij02Pwwew5/FJ0ETSrftYDklmUd500bFqy9sERQYLTrvFqRKRQ==
X-Received: by 2002:ae9:e110:: with SMTP id g16mr2400877qkm.19.1613132165387; 
 Fri, 12 Feb 2021 04:16:05 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:16:04 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:45 +0900
Message-Id: <d2e72eac404ca5b7c99d8a642f2c07ebb2eb240a.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 21/22] counter: 104-quad-8: Replace mutex
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
index 41fdbd228be3..2b47f9991acc 100644
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
+ * @lock:		synchronization lock to prevent I/O race conditions
  * @counter:		instance of the counter_device
  * @fck_prescaler:	array of filter clock prescaler configurations
  * @preset:		array of preset values
@@ -42,7 +44,7 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
  * @base:		base port address of the device
  */
 struct quad8 {
-	struct mutex lock;
+	raw_spinlock_t lock;
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
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Reset Byte Pointer; transfer Counter to Output Latch */
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP | QUAD8_RLD_CNTR_OUT,
@@ -141,7 +144,7 @@ static int quad8_count_read(struct counter_device *counter,
 	for (i = 0; i < 3; i++)
 		*val |= (unsigned long)inb(base_offset) << (8 * i);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
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
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Reset Byte Pointer */
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP, base_offset + 1);
@@ -182,7 +186,7 @@ static int quad8_count_write(struct counter_device *counter,
 	/* Reset Error flag */
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_E, base_offset + 1);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -200,8 +204,9 @@ static int quad8_function_read(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const int id = count->id;
+	unsigned long irqflags;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	if (priv->quadrature_mode[id])
 		switch (priv->quadrature_scale[id]) {
@@ -218,7 +223,7 @@ static int quad8_function_read(struct counter_device *counter,
 	else
 		*function = COUNTER_FUNCTION_PULSE_DIRECTION;
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
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
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	mode_cfg = priv->count_mode[id] << 1;
 	idr_cfg = priv->index_polarity[id] << 1;
@@ -271,7 +277,7 @@ static int quad8_function_write(struct counter_device *counter,
 			break;
 		default:
 			/* should never reach this path */
-			mutex_unlock(&priv->lock);
+			raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 			return -EINVAL;
 		}
 	}
@@ -279,7 +285,7 @@ static int quad8_function_write(struct counter_device *counter,
 	/* Load mode configuration to Counter Mode Register */
 	outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -407,9 +413,10 @@ static int quad8_index_polarity_set(struct counter_device *counter,
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id - 16;
 	const int base_offset = priv->base + 2 * channel_id + 1;
+	unsigned long irqflags;
 	unsigned int idr_cfg = index_polarity << 1;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	idr_cfg |= priv->synchronous_mode[channel_id];
 
@@ -418,7 +425,7 @@ static int quad8_index_polarity_set(struct counter_device *counter,
 	/* Load Index Control configuration to Index Control Register */
 	outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -447,15 +454,16 @@ static int quad8_synchronous_mode_set(struct counter_device *counter,
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id - 16;
 	const int base_offset = priv->base + 2 * channel_id + 1;
+	unsigned long irqflags;
 	unsigned int idr_cfg = synchronous_mode;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	idr_cfg |= priv->index_polarity[channel_id] << 1;
 
 	/* Index function must be non-synchronous in non-quadrature mode */
 	if (synchronous_mode && !priv->quadrature_mode[channel_id]) {
-		mutex_unlock(&priv->lock);
+		raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 		return -EINVAL;
 	}
 
@@ -464,7 +472,7 @@ static int quad8_synchronous_mode_set(struct counter_device *counter,
 	/* Load Index Control configuration to Index Control Register */
 	outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -511,6 +519,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
 	unsigned int count_mode;
 	unsigned int mode_cfg;
 	const int base_offset = priv->base + 2 * count->id + 1;
+	unsigned long irqflags;
 
 	/* Map Generic Counter count mode to 104-QUAD-8 count mode */
 	switch (cnt_mode) {
@@ -531,7 +540,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
 		return -EINVAL;
 	}
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->count_mode[count->id] = count_mode;
 
@@ -545,7 +554,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
 	/* Load mode configuration to Counter Mode Register */
 	outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -565,9 +574,10 @@ static int quad8_count_enable_write(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const int base_offset = priv->base + 2 * count->id;
+	unsigned long irqflags;
 	unsigned int ior_cfg;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->ab_enable[count->id] = enable;
 
@@ -576,7 +586,7 @@ static int quad8_count_enable_write(struct counter_device *counter,
 	/* Load I/O control configuration */
 	outb(QUAD8_CTR_IOR | ior_cfg, base_offset + 1);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -627,16 +637,17 @@ static int quad8_count_preset_write(struct counter_device *counter,
 				    struct counter_count *count, u64 preset)
 {
 	struct quad8 *const priv = counter->priv;
+	unsigned long irqflags;
 
 	/* Only 24-bit values are supported */
 	if (preset > 0xFFFFFF)
 		return -ERANGE;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	quad8_preset_register_set(priv, count->id, preset);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -645,8 +656,9 @@ static int quad8_count_ceiling_read(struct counter_device *counter,
 				    struct counter_count *count, u64 *ceiling)
 {
 	struct quad8 *const priv = counter->priv;
+	unsigned long irqflags;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Range Limit and Modulo-N count modes use preset value as ceiling */
 	switch (priv->count_mode[count->id]) {
@@ -660,7 +672,7 @@ static int quad8_count_ceiling_read(struct counter_device *counter,
 		break;
 	}
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -669,23 +681,24 @@ static int quad8_count_ceiling_write(struct counter_device *counter,
 				     struct counter_count *count, u64 ceiling)
 {
 	struct quad8 *const priv = counter->priv;
+	unsigned long irqflags;
 
 	/* Only 24-bit values are supported */
 	if (ceiling > 0xFFFFFF)
 		return -ERANGE;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	/* Range Limit and Modulo-N count modes use preset value as ceiling */
 	switch (priv->count_mode[count->id]) {
 	case 1:
 	case 3:
-		mutex_unlock(&priv->lock);
+		raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 		quad8_preset_register_set(priv, count->id, ceiling);
 		return 0;
 	}
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return -EINVAL;
 }
@@ -707,12 +720,13 @@ static int quad8_count_preset_enable_write(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const int base_offset = priv->base + 2 * count->id + 1;
+	unsigned long irqflags;
 	unsigned int ior_cfg;
 
 	/* Preset enable is active low in Input/Output Control register */
 	preset_enable = !preset_enable;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->preset_enable[count->id] = preset_enable;
 
@@ -721,7 +735,7 @@ static int quad8_count_preset_enable_write(struct counter_device *counter,
 	/* Load I/O control configuration to Input / Output Control Register */
 	outb(QUAD8_CTR_IOR | ior_cfg, base_offset);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -732,22 +746,23 @@ static int quad8_signal_cable_fault_read(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id / 2;
+	unsigned long irqflags;
 	bool disabled;
 	unsigned int status;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	disabled = !(priv->cable_fault_enable & BIT(channel_id));
 
 	if (disabled) {
-		mutex_unlock(&priv->lock);
+		raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 		return -EINVAL;
 	}
 
 	/* Logic 0 = cable fault */
 	status = inb(priv->base + QUAD8_DIFF_ENCODER_CABLE_STATUS);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	/* Mask respective channel and invert logic */
 	*cable_fault = !(status & BIT(channel_id));
@@ -773,9 +788,10 @@ static int quad8_signal_cable_fault_enable_write(struct counter_device *counter,
 {
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id / 2;
+	unsigned long irqflags;
 	unsigned int cable_fault_enable;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	if (enable)
 		priv->cable_fault_enable |= BIT(channel_id);
@@ -787,7 +803,7 @@ static int quad8_signal_cable_fault_enable_write(struct counter_device *counter,
 
 	outb(cable_fault_enable, priv->base + QUAD8_DIFF_ENCODER_CABLE_STATUS);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -810,8 +826,9 @@ static int quad8_signal_fck_prescaler_write(struct counter_device *counter,
 	struct quad8 *const priv = counter->priv;
 	const size_t channel_id = signal->id / 2;
 	const int base_offset = priv->base + 2 * channel_id;
+	unsigned long irqflags;
 
-	mutex_lock(&priv->lock);
+	raw_spin_lock_irqsave(&priv->lock, irqflags);
 
 	priv->fck_prescaler[channel_id] = prescaler;
 
@@ -823,7 +840,7 @@ static int quad8_signal_fck_prescaler_write(struct counter_device *counter,
 	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP | QUAD8_RLD_PRESET_PSC,
 	     base_offset + 1);
 
-	mutex_unlock(&priv->lock);
+	raw_spin_unlock_irqrestore(&priv->lock, irqflags);
 
 	return 0;
 }
@@ -992,8 +1009,7 @@ static int quad8_probe(struct device *dev, unsigned int id)
 	priv->counter.priv = priv;
 	priv->base = base[id];
 
-	/* Initialize mutex */
-	mutex_init(&priv->lock);
+	raw_spin_lock_init(&priv->lock);
 
 	/* Reset all counters and disable interrupt function */
 	outb(QUAD8_CHAN_OP_RESET_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
