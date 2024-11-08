Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A7B9C2642
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2024 21:09:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF522C6DD94;
	Fri,  8 Nov 2024 20:09:12 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C683CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 20:09:05 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-460af1a1154so15930481cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Nov 2024 12:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096544; x=1731701344;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NI6P3TUYrkoyoEc/tfD3lrh0bzVj5BXDH9t+6MLHSl4=;
 b=E7SruvnLJHrhi2qJVv0j1oSD9zaSkC7yFhgcBFpfNkR/N/bGw2OZKwW5kjhj0Z704i
 eSQ3nRMmmg4iYd55ktoEURAL0bpl3fQ3lk17tBcnCs7nn5W1BAB4kNun6/cWD0LwvZPM
 fHZGnesuevcQSJ8rBKpAZw/OIOqpqIt22YHGNl2gW3Jfx0MNyWmJxY+fhIsex0UEOKFg
 xjpvTnB7qNFEX5hqq307IQe9sJTKfqqFr1EnZNQqan8U6oXsLuNU9U+acW7R0wrsYbzH
 urx6f9Gdc8OxKfYVogvBkW0wm5wp99jMJHb9o6l0CiKF296uwlbnxyYOKCg0nd6QlDj7
 TRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096544; x=1731701344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NI6P3TUYrkoyoEc/tfD3lrh0bzVj5BXDH9t+6MLHSl4=;
 b=aKG8p9aGBr+v0QuXHkWTvabvSm2leBnTpHSBYN7c29UzFeus04qN7IuksQE6szHXIx
 jQENnR23Rq+PH59xBgIeH/Pe2nv9HeKm9rUmrK67482at1TyTS7k4LoD1MijoooM4cEc
 pQNvUCXQbTWhVJu7HP7ZOtE/ftTerwZH9+qfaaekcVOlglsRx8h1Ja3+sI5X95ZfoOeU
 FkCCLF5WuUtKlrF8495lWmS0IRhnwPSMxvyXMI/6ysMK3xDSBx6OGXcVrw6sHjjlAIAA
 GTQRJyOcXrUYqAmCap5xeMIrjQGiJv7Zx4p1zPVwO0x68jxPS2EJdy1I6rvVBpLVePdQ
 iMOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA6ExOfft8veAZozr3cpZ1DsO659e1oBTD6qaGK8dnKDEqwyGZOE7rd9Y8vtFGNvj2qoKxR7rmkuj6eQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyK+d1JbIICud+j4drpY88bxFk39uIgdwBi7lAblRH1AN7IFCfV
 U5lOyF6x/YKwUUwIv8/YG80xCYoa3b4pew7wiD5s1+XUUBo0lgBL
X-Google-Smtp-Source: AGHT+IE82TZXwTUiZGRTAp/L5/S3ZlnP1aQ28alBcXNmIEDpLw5fXICy0ok9tKG1jh+N+mTRfrzA/A==
X-Received: by 2002:ac8:5a91:0:b0:458:23fc:f345 with SMTP id
 d75a77b69052e-463093ecfdamr48531501cf.38.1731096544010; 
 Fri, 08 Nov 2024 12:09:04 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ff47c162sm24151271cf.53.2024.11.08.12.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:09:03 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com,
 benjamin.gaignard@linaro.org, lee@kernel.org
Date: Fri,  8 Nov 2024 20:09:00 +0000
Message-Id: <20241108200900.44727-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] iio: trigger: stm32-timer-trigger: Add
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

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..e1e077122f73 100644
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
@@ -153,7 +153,11 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	mutex_lock(&priv->lock);
 	if (!priv->enabled) {
 		priv->enabled = true;
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return ret;
+		}
 	}
 
 	regmap_write(priv->regmap, TIM_PSC, prescaler);
@@ -307,7 +311,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
 	struct iio_trigger *trig = to_iio_trigger(dev);
 	u32 mask, shift, master_mode_max;
-	int i;
+	int i, ret;
 
 	if (stm32_timer_is_trgo2_name(trig->name)) {
 		mask = TIM_CR2_MMS2;
@@ -326,7 +330,11 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 			if (!priv->enabled) {
 				/* Clock should be enabled first */
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return ret;
+				}
 			}
 			regmap_update_bits(priv->regmap, TIM_CR2, mask,
 					   i << shift);
@@ -482,6 +490,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				   int val, int val2, long mask)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -496,7 +505,11 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		if (val) {
 			if (!priv->enabled) {
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return ret;
+				}
 			}
 			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
 		} else {
@@ -601,7 +614,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -611,7 +624,12 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 */
 	mutex_lock(&priv->lock);
 	if (sms == 6 && !priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return ret;
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
