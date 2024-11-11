Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56C9C4909
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 23:23:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1B32C78F6C;
	Mon, 11 Nov 2024 22:23:20 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D0EAC78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 22:23:14 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7b152a923a3so343737485a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 14:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731363793; x=1731968593;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xKJrUNekn+fLC6kP93590FUWGJ6YXqoOuHlp1oOaerI=;
 b=DCd/k+JKgsU9EdfQRFYc3Ua6mhn8J5kyx/A1HYOiPkj9tV5xXGODltsPRDRgTyln/0
 ItiBnOhAFp9dSjKntFhYAKFvfb9gClhwVzVBRpDvoaa3FBO79xvJxbWL8FvrDh/xzFRO
 mAHU0jHTobFiZAq/GaNMjzs4XhiKEalaNAbTdvGTttKiUuZkz5mh1PKlBxTT3V3cSxzG
 iUYJ9v/wpSRd6q2DQW65gWqbWmst2IvoYR5x0cqvNsNTu4og9AM7AFMk6C0Vp0u6FGAE
 DIvuKj0EujhfjjKQdRBR3ui8zjSVWkGVfSHeUbw1BOB20tMp2UxY1FX1ESV0zaj5wGJs
 bQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731363793; x=1731968593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKJrUNekn+fLC6kP93590FUWGJ6YXqoOuHlp1oOaerI=;
 b=YhlkAKw3hCl7JhOVWZlrqxWbsJaBaSK9j24jh5bBSGGjzuhZ6Il5Zkq0FYSTAM7Vmg
 RPSNKgx7y3cH4bUZg+IZtn3ESEEBYrCvALYkXq8iusyifHMbfWHLBcAM71toUOLmx3Ba
 WLkq1nYe5HJjn4tcq9rDAc2SJpywcoJTIi2DiDRBZs+j7EQAOaZ0XNnFmfifu2f8+NgW
 rih+0IYXVR5D6qrJ3TsLI3nT9TaDLEzxXOklUBEKuMqCV5/udKPddCO9SkoyqtWmAcnK
 f4I3cQ+69N+Mrtz1x7Wc6DBGC1d+G/vGLh+bM/44T6pCsYwzSUVn15JnBoFGfeCLOi7j
 4Rxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwTY+li+JlgyRbOdOGZuUkhRNXJ2/WHd+9fBQ41TqLHgp5rASy+6z9ibOWLxjC5N6VHhe35tPSChZGHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw868WgGng29OZF74v9CrI7eX3SaJ7ntRFqOkQyB3CKPfjxZadt
 KPDr2pZHL+N3ymp6odROtySybnl4AQkVRwWCRX5fI4o23Ion3IKQ
X-Google-Smtp-Source: AGHT+IGFThbZRbYxwToYYeuVu+7TuIAwrVPuAA2eieBL7N+tsgVpKFWjBEQC2tvJmKh1er5auG0BMA==
X-Received: by 2002:a05:620a:1aaa:b0:7ac:b118:a732 with SMTP id
 af79cd13be357-7b331dd2fb1mr2162857285a.32.1731363793253; 
 Mon, 11 Nov 2024 14:23:13 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32ac2dc06sm535599885a.12.2024.11.11.14.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 14:23:13 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: dlechner@baylibre.com
Date: Mon, 11 Nov 2024 22:23:10 +0000
Message-Id: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, u.kleine-koenig@baylibre.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: [Linux-stm32] [PATCH v4] iio: trigger: stm32-timer-trigger: Add
	check for clk_enable()
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v3 -> v4:

1. Place braces around the case body.

v2 -> v3:

1. Simplify code with cleanup helpers.

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 45 ++++++++++++++---------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..d599d50fbb3b 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -119,7 +119,7 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 			     unsigned int frequency)
 {
 	unsigned long long prd, div;
-	int prescaler = 0;
+	int prescaler = 0, ret;
 	u32 ccer;
 
 	/* Period and prescaler values depends of clock rate */
@@ -150,10 +150,12 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	if (ccer & TIM_CCER_CCXE)
 		return -EBUSY;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (!priv->enabled) {
 		priv->enabled = true;
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
 	}
 
 	regmap_write(priv->regmap, TIM_PSC, prescaler);
@@ -173,7 +175,6 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 
 	/* Enable controller */
 	regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -307,7 +308,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
 	struct iio_trigger *trig = to_iio_trigger(dev);
 	u32 mask, shift, master_mode_max;
-	int i;
+	int i, ret;
 
 	if (stm32_timer_is_trgo2_name(trig->name)) {
 		mask = TIM_CR2_MMS2;
@@ -322,15 +323,16 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	for (i = 0; i <= master_mode_max; i++) {
 		if (!strncmp(master_mode_table[i], buf,
 			     strlen(master_mode_table[i]))) {
-			mutex_lock(&priv->lock);
+			guard(mutex)(&priv->lock);
 			if (!priv->enabled) {
 				/* Clock should be enabled first */
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret)
+					return ret;
 			}
 			regmap_update_bits(priv->regmap, TIM_CR2, mask,
 					   i << shift);
-			mutex_unlock(&priv->lock);
 			return len;
 		}
 	}
@@ -482,6 +484,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				   int val, int val2, long mask)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -491,12 +494,14 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		/* fixed scale */
 		return -EINVAL;
 
-	case IIO_CHAN_INFO_ENABLE:
-		mutex_lock(&priv->lock);
+	case IIO_CHAN_INFO_ENABLE: {
+		guard(mutex)(&priv->lock);
 		if (val) {
 			if (!priv->enabled) {
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret)
+					return ret;
 			}
 			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
 		} else {
@@ -506,9 +511,10 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				clk_disable(priv->clk);
 			}
 		}
-		mutex_unlock(&priv->lock);
+
 		return 0;
 	}
+	}
 
 	return -EINVAL;
 }
@@ -601,7 +607,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -609,12 +615,15 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 * Triggered mode sets CEN bit automatically by hardware. So, first
 	 * enable counter clock, so it can use it. Keeps it in sync with CEN.
 	 */
-	mutex_lock(&priv->lock);
-	if (sms == 6 && !priv->enabled) {
-		clk_enable(priv->clk);
-		priv->enabled = true;
+	scoped_guard(mutex, &priv->lock) {
+		if (sms == 6 && !priv->enabled) {
+			ret = clk_enable(priv->clk);
+			if (ret)
+				return ret;
+
+			priv->enabled = true;
+		}
 	}
-	mutex_unlock(&priv->lock);
 
 	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
