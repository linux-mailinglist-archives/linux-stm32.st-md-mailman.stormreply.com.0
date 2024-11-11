Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 001379C45B6
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 20:19:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B494AC78F67;
	Mon, 11 Nov 2024 19:19:38 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E075C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 19:19:38 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7b147a2ff04so373879985a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 11:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731352777; x=1731957577;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VQMnATqh+SGGYH0r7raKXS0Fsq0x/ZjmMKT6ggo6pts=;
 b=kX7EKqcDuzfziA5tcdlpwtIJzvl01QxxPAJ325pZ9QOpRzZXsw1cdeSbmmRFAKibVP
 GUeVkA5/qL3846Qfx/5WFwVJ8Hwy33mTpANfgnbn2Rex8G8H5nRMu0cKBZGWhECjFEyT
 CCTiIYT/xqMKKModbC5tNA70KclGFDIPaW3bT3BKzl1GI2b3+1O5Uggjj5Mpoo2JmCxR
 eJQderT8AiHHT3bzqB98fYc0IAgQ1TMdnfCAXUZRC/YFmzAG8Z3Fr4dvlagjDMaVG1dw
 70NT7fLHpEhnxr13x0CLf14pXajYJiIdbXgDZkHZtdVPdY+5cLZ15YZNX3RvQz5Ah1Rj
 lDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731352777; x=1731957577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQMnATqh+SGGYH0r7raKXS0Fsq0x/ZjmMKT6ggo6pts=;
 b=AYTLRuJQyT4141EA6ikTs/PdqYiOv++PAZ4ZiDT26LbHzHB6Mfw1EyV/vKwvtsyKH8
 9koPI0bgdJwj6bv93CRm7JWJh/qua3iKR4cMlE/qK3f/5o2Z6wBgRboB1qjK64Fj6gPZ
 jr7d1ePi16QoB9YWQFTh1LUFva2fEn4QNnMHjlkGIQj9TCq9TsAx36NjEpGZUak/ywe9
 VObFthG6NDvzMDyL20ji8SJ9xPymJXTTc5/TJMd1jPdfTSYhW1Eisxq+EVK122xM/hXi
 loN9YS6eRKxaeZUfbw9gqLtzH1O/ihme94txteFj4ZWbl/0Q876A6lDc1l/dgQgntJBR
 v6jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbORZGdQAKNM3IHdUIvf+UTKmR09gdb/JtdY1kFRdw1KStYWJE8f8sAfK5QxZ76RsNMrrsJa6TCaL6aw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGzFC/Waq+sSdZn1GuSIaf1I1nh4JZs/zu3eaw0KgEguIQH2fD
 kNt2uu8WtIEX43GlY1QzgNuTboOKevV+qNTCM+opNWoy6aWG2jnO
X-Google-Smtp-Source: AGHT+IEcOVSl3jFobC5PUujK1odI1lKT7irYGmOBBfsWM2du/Qe8Rbme5AUeOm0Ku5j48EPEYBDbjA==
X-Received: by 2002:a05:620a:1787:b0:7b1:49a4:d1e2 with SMTP id
 af79cd13be357-7b331f2e94amr1783569085a.54.1731352776900; 
 Mon, 11 Nov 2024 11:19:36 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32acb30d0sm524995885a.94.2024.11.11.11.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 11:19:36 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: jic23@kernel.org
Date: Mon, 11 Nov 2024 19:19:34 +0000
Message-Id: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] iio: trigger: stm32-timer-trigger: Add
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

v2 -> v3:

1. Simplify code with cleanup helpers.

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 64 +++++++++++++----------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..9fb4f7eefa86 100644
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
@@ -492,21 +495,25 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		return -EINVAL;
 
 	case IIO_CHAN_INFO_ENABLE:
-		mutex_lock(&priv->lock);
-		if (val) {
-			if (!priv->enabled) {
-				priv->enabled = true;
-				clk_enable(priv->clk);
-			}
-			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
-		} else {
-			regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
-			if (priv->enabled) {
-				priv->enabled = false;
-				clk_disable(priv->clk);
+
+		scoped_guard(mutex, &priv->lock) {
+			if (val) {
+				if (!priv->enabled) {
+					priv->enabled = true;
+					ret = clk_enable(priv->clk);
+					if (ret)
+						return ret;
+				}
+				regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
+			} else {
+				regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
+				if (priv->enabled) {
+					priv->enabled = false;
+					clk_disable(priv->clk);
+				}
 			}
 		}
-		mutex_unlock(&priv->lock);
+		
 		return 0;
 	}
 
@@ -601,7 +608,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -609,12 +616,15 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
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
