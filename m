Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1709D6BB1
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Nov 2024 23:02:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E59BBC78F69;
	Sat, 23 Nov 2024 22:02:00 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4844CC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2024 22:01:53 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6d413def36cso25705036d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2024 14:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732399312; x=1733004112;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sTXm56p8RBq1M4ykDPiGEs2Y+aiYwh8JuLxWApDmdM4=;
 b=VZdf74w/qwOsxgny2oZz/Ht7ls+aIhBeGG2heHZz+ecmTrUHlzAJaQP1TNnyeUsk/k
 iNfrMqRUm4ntz72McyWefO/W8es7cejrhrgYXzyWEZGljY+veCecDZ6v2wcvPLcyDVSB
 MvCl8A13+J1foPd0WkTNHMP0Mv4mua7qJlk3Pni3z68dLlW+nT41hx3lrMQm4XolqFmP
 dRyo2nSZXJ/qUb3dgr8+zrnHtU/SIaek4UGHb5/HAdkFgdJRB2UhPQFQsoHu8Bub1J4P
 M0sXl9hZIfMYd/hOYxTzfJZxTlsDDW+CdxOAOwfTLPuZ8QN70bLyZDpjbnA2Qj387yPr
 rM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732399312; x=1733004112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTXm56p8RBq1M4ykDPiGEs2Y+aiYwh8JuLxWApDmdM4=;
 b=wv0ogM0D+IYN/ZI0rxpmcciZ7qr4TwjCWqn1JVVBwXNfDkvg3lPedxcEsVFCX4tljv
 61qc32exMqCFNx7kYR4IavoH4UjvdLOiJzp28/Psn7PVkF1OTuGXHS7/ydWLulWd+Ud7
 v6GAeIlIllLi/APdcUgQ9ipN6HBZ+B8+hQFpY2vkYNgsznROiD9QEu6gNQW5TTdlt7tA
 sv8l+zakWIppxAuf9hdW1N5mOgGLo8wFxpohl4WAVK51VoypBhuD0gCNrUVWZjwMbk4m
 U9+nad/GKVOq7ZbbwODqr5nFbOIL/pZs9lv4207swq/WoFCRDs3AQWgGCqV/PfGt44zA
 fHIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGED3m+V6GBS9HOiXc89XRfJ8giEgtcGYOYKl/EOZQs3IFoy6zFxZ9eRszoRoMgc7J1WSLBaAAizvfbQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1siB2k+AuqgoABgC/uLiwew1gJF/DjWD8kalbH+wjwOkItNq9
 y9AjGdO/oBeyvlA1BhkalEvWkHrYCk4+rSoTRBG7Ijy7MZ+nyzJy
X-Gm-Gg: ASbGncsLhGLULu+u/BgVM4RZO7CJ1UVU+MFTFu1Mpdsf2/Jcb1VODfY/ZCa6THZumKZ
 gB2/M4yJeLI/OVto1pO/la+NpCVcDKrrIfsEc7X4/VuApaIZjWuWYW+9rMAgVYCDZDgQNVC717s
 TECsIPEMNwzlHPS5AmSZygF/tANBuu+gIdiLGbWSH7QT5mBlhKbyDcnQoqTkmkR7UkUrXiynrQD
 zTYsVPGoA6+uWdAyq9ZTuDKFBeqfFDCqO1neevvBqieD5+a/cLSIT72/i70o3Aw1W4R/Ure
X-Google-Smtp-Source: AGHT+IHwaDfV1oVZjshMQqgput4KO/RhIrIMFQsBtq4zu1BHrnOtGbjeB/uPQuJ2P/Cp8Ar7T0Qjug==
X-Received: by 2002:a05:6214:19ef:b0:6d4:20fa:83f1 with SMTP id
 6a1803df08f44-6d45134d114mr137061356d6.37.1732399312180; 
 Sat, 23 Nov 2024 14:01:52 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d451b4a0a5sm25789426d6.106.2024.11.23.14.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 14:01:51 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: jic23@kernel.org
Date: Sat, 23 Nov 2024 22:01:49 +0000
Message-Id: <20241123220149.30655-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 fabrice.gasnier@st.com, linux-iio@vger.kernel.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 u.kleine-koenig@baylibre.com, mcoquelin.stm32@gmail.com, dlechner@baylibre.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5] iio: trigger: stm32-timer-trigger: Add
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

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v4 -> v5:

1. Add a default in the switch.

v3 -> v4:

1. Place braces around the case body.

v2 -> v3:

1. Use guard() to simplify the resulting code.

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 49 ++++++++++++++---------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..67528ec7d0a5 100644
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
@@ -506,11 +511,12 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				clk_disable(priv->clk);
 			}
 		}
-		mutex_unlock(&priv->lock);
+
 		return 0;
 	}
-
-	return -EINVAL;
+	default:
+		return -EINVAL;
+	}
 }
 
 static int stm32_counter_validate_trigger(struct iio_dev *indio_dev,
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
