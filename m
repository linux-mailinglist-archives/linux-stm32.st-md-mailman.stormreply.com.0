Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA15AE7F78
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA230C3F93D;
	Wed, 25 Jun 2025 10:33:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66E79C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so432257f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847630; x=1751452430;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
 b=pXbeujwWbpRHQDWls7xFNfTEyq7qgAyjQ2nzVMfy7hNyjuBGrmzdKIknHa0nA/Hn2Y
 jNNVi2EvN9+APvbxJNR9dw/VTwS2DyvVoRuEzx50+Abbxme7RESr9kUg6wzVfRVaYP1V
 I4H0wppjePM+oTx3oO2XuE3drmfMjrIy2wTPH2akW/rsfgAzQTrY09w2H1mD7JL+PPsL
 H0Q0eEdilZqcfOQ7Sgl1GajJmEFCG7/ujs4IVml0tlQnzM7D9tPTeVS7phQ+k+oJRyss
 YgX7PR7ltjn0hdqNLxj+TSGaJyRioGya5i6eS+RIQEMzjZ8u7aXfWF2mi5yOcNzdxrKP
 mvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847630; x=1751452430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
 b=PRBy6xlQ+JvwGloyX2UQePFr0ZxBlN+QgjYp8VObjUplhSgh6AIUkPIupfWOXTnExK
 v/yib3xIweENp7Dg3XihVEYtswNe0mxDuF/HrZhovy0lZptfoZ8WoTO9bXtcnIIp7KPD
 C6dGbmOmy8jkFbQwtGCmKMzs3HOnxWMatC4fpxayKy3y9BcAHHcqAPunolYAZnaz4WJy
 IM8zAyVO9JwcfghZe/E9qhEHelDf72MObOFgPtYVoo3+OPs28vS5uNyyHa4H7ZrQqw67
 1Y9SmIS/trSqpW41weOfGiT8GAP9aFp+MY9mHRRuImhMgFJlxz1GzX9/6muEYlFcDTCF
 8dEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Sd3YYLQXDsFO5Bw45wa3Fkrwi5Ke3ItnSkjN1Hho4g0vLcbMkBANhwCLYzPE7QubOm4MCa3Ylrm1+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkixL1Xlgros7tdzFleXlZWnzaQmvrB4bHpEQWgXgwt9tpQtvZ
 0rY1bSyB4MhpfCKKe3PHj0VblOmUZK56wEDoo4O1NuW0hMJ3bXuP+rnPy7VapM8babs=
X-Gm-Gg: ASbGncuVqQwFawyTcW9D6TSD1BD7NBKjNwbiCbyPxQSz/YY6+cXdzrc+Y3sgG88zW4l
 ylVspsLrOowce/kfIrT+wzgH3h8Zdg6tZ3CKuEXmeUqoIhE2yVsDkxoZ7iyLF8qpBQoCLw0oxIF
 /QduKGwEl12yRQQ7iHl/CAkoG9iEft0bKKsLYXIK2pPjFTcjsxbK9PL7ZOmdZfF+dKZ/6P5EzyE
 VlTzpOXk4w+0IDDfY3sSa6eNcE+pSea1aITawXN9gYgJYiKL5rox4IKNbb/eN9Jb86iDudFA703
 2qxCPH+afRNlfzVPF+sN5EvKUZqDIvgXUziQnVOVjdj8kDK3irVMh4h1
X-Google-Smtp-Source: AGHT+IEwM2t1XefxZU8DghVTXKK8wSS63f829kSWALD3RIefh4AeNCC3TbqP+9rqackkafREvW4tyw==
X-Received: by 2002:a05:6000:4024:b0:3a6:d7e6:f281 with SMTP id
 ffacd0b85a97d-3a6e7206d4fmr6033940f8f.22.1750847629787; 
 Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:32 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-9-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iM77eXflH98tEqykW1k+5Ww0CPuJn4LOyCx2J1hnDc4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CAekDrQa+N2Lkq1WXdL06pphPPFEQKtl/A0
 icei1YT42+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 ckF3D/94LKQv+DwKv8kgiajCz0+LVB02vWQFLuawtrrCD3lT3mQR99okl12W8v4bFRqrQgkZbh6
 Mwxo9HqCfHrH9G1wPF88tIC0mVzVRDUcaMkkI/b4FaH2V+0uGdss9BLmJOKb1w4yxHpo1s6ud4Y
 nFa0ZFobojyWKWFqWgnrLBkO6Ee/kCKcHLOWs07yKRQSDbkiyhWoVo25QrzuqAUbBe5SZitOElx
 RP9QH+MV5jiCBF1T5PELubMo9gHJaztZHMs3/J/Cv2sgOu6GNRiU5PknjkdXY9Yr3ViaiGNVoq7
 KzUxVZLCCPxGNwMAtpYoCs8OazkrmTFJgeDdd8FaN+AUMRpzElDe5gMLKbxG4ywUxzqBDToLP9y
 ZBvBSYsWfXt7NVRv8ar/BcFa5+wl2NZu6mFOiME3DM19NoL++9oa2pQAWqa2l1pADddWStrecGL
 fjYRJasuaMjmEYDKKb9nnY7P+EqE9fMlUtwzCvldqXYcMGu6vfuiePHGLGUhvB76UPmHagMWnzu
 gdyb6iE/IAa2qwFBcjxH2dgglrcOhusiGNqea293LnB6a4b2QeAT87hOs9fiH7zhoAByf0Vuly5
 yFmAioTpLemDCiO4jMgJuQy02PedULImyNIjLmPw8V7RS2UW42vPkdfq9THCKWegBxq+langWnB
 lWhe1Qpcgf94OAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 09/12] gpio: stp-xway: use new GPIO line value
 setter callbacks
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-stp-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 5a6406d1f03aa75e82423f7c5740fdb3df42dd4b..fdda8de6ca366662aec1fccb475f0698fb478ef5 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -113,7 +113,7 @@ static int xway_stp_get(struct gpio_chip *gc, unsigned int gpio)
  *
  * Set the shadow value and call ltq_ebu_apply.
  */
-static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int xway_stp_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct xway_stp *chip = gpiochip_get_data(gc);
 
@@ -124,6 +124,8 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
 	xway_stp_w32(chip->virt, chip->shadow, XWAY_STP_CPU0);
 	if (!chip->reserved)
 		xway_stp_w32_mask(chip->virt, 0, XWAY_STP_CON_SWU, XWAY_STP_CON0);
+
+	return 0;
 }
 
 /**
@@ -136,9 +138,7 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
  */
 static int xway_stp_dir_out(struct gpio_chip *gc, unsigned gpio, int val)
 {
-	xway_stp_set(gc, gpio, val);
-
-	return 0;
+	return xway_stp_set(gc, gpio, val);
 }
 
 /**
@@ -249,7 +249,7 @@ static int xway_stp_probe(struct platform_device *pdev)
 	chip->gc.label = "stp-xway";
 	chip->gc.direction_output = xway_stp_dir_out;
 	chip->gc.get = xway_stp_get;
-	chip->gc.set = xway_stp_set;
+	chip->gc.set_rv = xway_stp_set;
 	chip->gc.request = xway_stp_request;
 	chip->gc.base = -1;
 	chip->gc.owner = THIS_MODULE;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
