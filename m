Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF19BD5E5
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 20:32:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66CFFC71292;
	Tue,  5 Nov 2024 19:32:29 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51690C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 19:32:22 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7b1505ef7e3so346330185a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2024 11:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730835141; x=1731439941;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mlpXLUDiuAj4Ax3s/8PaCa808KyyiZFwFmndcMeabmA=;
 b=ZnpaIl1+LcB6IzDksxNwW7ApgZxQEQZ+zcbfGRKQ9ShAOFDLi5cBquoQxXPjP0Nhkh
 QTy/ytkzDg+aywg5xGckxLrCF5Uo2OSjU2/muJbmfCchrUD4Cb6pWgV3qdCvEcjKeVMU
 WEvajLO30ykeUXg1WoNqY+Ci+rzcaFm9J+hKT/nFXnBpQK0md10UvZrP9iB/cpWv4YsN
 dosHmzPvjV8slVuRKmgrj7BmIgv2vKdCO+1ygyaeGXgEz+JubPWj933R6BpQh///uvIm
 cAkq8o3u8izAV80WGqKKDQE9cW1TgjuNkbecvc+hem/VwUO2jngBjnXvySqq0VYpfaAJ
 r8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730835141; x=1731439941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mlpXLUDiuAj4Ax3s/8PaCa808KyyiZFwFmndcMeabmA=;
 b=T9+LCrjHV4gS0t4CGfO90GKXAGc893CqE0jll176lt6tPcVFrr3vtUuofhCIah+asl
 KQSBeK1+bjEE+gLTbFguLF8FwO5HJ3sysgH2VUnYB6AyFXHABMeVi5Dv3ZbebBqj007c
 DXXTdxyf/gU5J/aM+GQ9r7QznCmyQZwpwDRh4iW4xjoRj6dJd93AV9LzqYJur5xYUGxR
 3ugx270k26wFUzqg2Ja07dJORZCnGykAtE9x31YkqamTuSmoYLtwJduMaqn8Cd7JrPcm
 GvQ0VrwTccmdquX31h/DlOo0LHaf/3imBoxeUAY4hJ4CFkaU7qh1QG9OkfEvIFnULtWt
 XCYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSbSf32bsnpwJWlkIAdCKIe+nLyq4Thf/9uCt1MMZgcth8qK5KPbNyDkjHop/l8Z0Od9eiDdkF0M8G7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDpHE4YcdCFfJf1weGwbfnc+WPtgTa4Wm/5kXd8Yen+keYG0l4
 eOoBh/Bl8WcEEAEkv5WwDx3uq2p593MIrzx/r48DUgG02CnkzdT/
X-Google-Smtp-Source: AGHT+IHmPYcPWfZhwOxujigyXrVRSB8kRoNxKABpVBwVCQzAOZBWznyCKjCQL89t1FiTLIwjVZF9zw==
X-Received: by 2002:a05:620a:14e:b0:7ac:ae32:286a with SMTP id
 af79cd13be357-7b193f041d5mr4080201485a.34.1730835141086; 
 Tue, 05 Nov 2024 11:32:21 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b2f3a9b991sm553343285a.127.2024.11.05.11.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:32:20 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com,
 benjamin.gaignard@linaro.org, lee@kernel.org
Date: Tue,  5 Nov 2024 19:32:12 +0000
Message-Id: <20241105193212.2082-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] iio: trigger: stm32-timer-trigger: Add check
	for clk_enable()
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

Fixes: 3192ade7b6f6 ("iio: trigger: stm32-timer: enable clock when in master mode")
Fixes: 90938ca432e6 ("iio: trigger: stm32-timer: add enable attribute")
Fixes: 93fbe91b5521 ("iio: Add STM32 timer trigger driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/iio/trigger/stm32-timer-trigger.c | 40 +++++++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..0d5bb808c61d 100644
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
@@ -153,7 +153,13 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	mutex_lock(&priv->lock);
 	if (!priv->enabled) {
 		priv->enabled = true;
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return dev_err_probe(priv->dev, ret,
+					     "failed to enable clock: %d\n",
+					     ret);
+		}
 	}
 
 	regmap_write(priv->regmap, TIM_PSC, prescaler);
@@ -307,7 +313,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
 	struct iio_trigger *trig = to_iio_trigger(dev);
 	u32 mask, shift, master_mode_max;
-	int i;
+	int i, ret;
 
 	if (stm32_timer_is_trgo2_name(trig->name)) {
 		mask = TIM_CR2_MMS2;
@@ -326,7 +332,13 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 			if (!priv->enabled) {
 				/* Clock should be enabled first */
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return dev_err_probe(priv->dev, ret,
+							     "failed to enable clock: %d\n",
+							     ret);
+				}
 			}
 			regmap_update_bits(priv->regmap, TIM_CR2, mask,
 					   i << shift);
@@ -482,6 +494,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				   int val, int val2, long mask)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -496,7 +509,13 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		if (val) {
 			if (!priv->enabled) {
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return dev_err_probe(priv->dev, ret,
+							     "failed to enable clock: %d\n",
+							     ret);
+				}
 			}
 			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
 		} else {
@@ -601,7 +620,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -611,7 +630,14 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 */
 	mutex_lock(&priv->lock);
 	if (sms == 6 && !priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return dev_err_probe(priv->dev, ret,
+					     "failed to enable clock: %d\n",
+					     ret);
+		}
+
 		priv->enabled = true;
 	}
 	mutex_unlock(&priv->lock);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
