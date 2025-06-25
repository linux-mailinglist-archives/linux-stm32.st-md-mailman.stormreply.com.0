Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFFAE7F75
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6A38C3F92E;
	Wed, 25 Jun 2025 10:33:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DC59C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4537fdec33bso9367135e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847627; x=1751452427;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=;
 b=UDUcoBDu0q8+2ZBJc1vvKD7K4QaxaaNI3tTf8GFXp0ZK7vnnnpSM/2q3nMt+cfw/W7
 /v1bKgaATCxz8wFigoLGPkupBj9tFYb6EqiG3cstQgMN4Hh+xt6KYbzC/8x3hqqepgra
 3gaO11b3gHPqOSxjvo2Eq7XEug0l8VYiNdsR/RbjEcJMbN4l/DGWSg7Mwg0P8WkRjPXi
 LxatNVX6Dw48SvrwZk6ni6cSeCWsmKLktWBCBjNC0jpIGDsuoZ/1fqreESKe1nymfUvR
 n8nlKErrWZ+dPyIkULMguyDRmh0d63E+SYoO9slSiQO//5cmmRYGTspRlXW/oQ5VbzUd
 8tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847627; x=1751452427;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=;
 b=LBO0HMKOw6uojnLZl9RVyWaLwQTUYegQgkTYwIekzNFBZ/kW6knhKXMrtR4SCaKAqg
 UdXAdrGkuN9EnTE1fXyWPANZy4Upun2uCcUsih4n01TPFo6QB5+CFtT1TiXYvkXXc9hX
 B+DYWxvqP2qbpfMBMb9nQrzTBWa94xT4DflOWFmbQFiI0QXou92UQcDYbBNu4/T2OlRP
 VSMoBwwvJBKx0xfH0zUagP1gLBpB0YWLQEsQr4cFLtt8KPhh2KinsfwgorGNxA7xcdhX
 NCrU6LaQfrsoQUbvbYWSI4/CXQVhAMBC29Zv834cUoNcuTSn4gdFXctoRneocBB22FCI
 lkMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX35MXPLmD1h5iXz7g8BlZrcIU0rV96pcIIMbgTNEGW07AvlZzSe+Bqxp5+netZcoVFr2Z2GaGEVXEhfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPt9cYMGNRENlgzwT600KN5KXkIQz52SRuEFf/gq3SMneDBtOX
 TBAVn6j5YTRCr19FuhKFBIk3tbXJF2i94l1QLyhnYbEzLe3UDzdjQusynzH8u4SxUT0=
X-Gm-Gg: ASbGncvk5PJEwaDmojIzgKyKGiTTVpwTgOocjw7Fblf9KEQP/QFQDq+UL1sIwOxGRLN
 vfQY/qkwE7LgxjvMxTkO07DYRpawaLCQfSlOR5D5PZPEYT8v/mvyp2vf5Nk4Rz2wFbuyWkGQu/K
 DP0UNetxaTr2b6CwsYU6ca+mG3bm4MnsnXk7ZyncTvt2/l2Rpk4SHDrBbJHqY6Okqg7rUMQVAup
 TviDXOZLFWVXUTdApADerxMsPrACVGfbp1Ncjy0mKag61Omf2W0fAFHKJRdZekcbP2WKhGWY3E0
 nnhvUlU70ob+QWbgSmYfp7XB1e+Z/sOVle/CXmP3tb+qpm8oP4h3g3fv
X-Google-Smtp-Source: AGHT+IELePDfCHlBYQA947q59vgnMIBS0qmkpmIXczdAGAGH53ivPNqjGgKeUUibjSMbaCpIrdAsng==
X-Received: by 2002:a05:600c:a302:b0:43c:fda5:41e9 with SMTP id
 5b1f17b1804b1-453821b0a2amr16718975e9.31.1750847627484; 
 Wed, 25 Jun 2025 03:33:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:30 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-7-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VMUhzabI6TJSSEFS1lhCE2pMbGfsNwLrSf77JeJz6/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/PT5QyhI466mXWQVK5eZlhAG2qptU0Jkjk
 YBlIjzP9muJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 cmjfD/95UQq01tmrRM1DzYdnerQeB3FFvKTQyd2fjDFNLy9dtXqfSNiftQA7k79L0u6uDb4TdYS
 zi+7vE56uklzOxkqrdBlFLv1eviupQLOy0Lo1o8B97QDAW8bfdlWushg08bvClpa4i4S4RN3zrF
 HMSuPvKlhrGDXidpLumdsrLg5XGbkqyAgAF/q32+Bl/OfGwv6000fdWfoydiq7JXLHqObRe7lLt
 wE0GbE/H4Yg/tSKKRd8ddQgS5zbAvXCKNo7KwXlTqwRg2t1E0c8kOpTf/OdftZ9/3dCfQI0ptMb
 lxwLYLcofM4g3TqBdVzbd1SK4EAG8zl7gMfAMlgbb1XlD502kJ9t0eBGlf2mjBsHdXZLKx1w0w2
 4BS/nXvbFE8KEBYIXWVF8WeAs9XJuUkCDCAOTCu89w+x5npYmQRlHaAsS8PqW2NsCKu/9MGBnX0
 x+0WdyPAA8tIxz4FCcsis54cIhLEiNSaCvxWBgdSDMFCu0H6Zvtl9UH0fCdldLPheqqb7cU6PQL
 QEq13Ow1loF3vWheP8IdWLLxQCfq/+gufdsNv8wP4Azdw4wH7kaT7W4nbGUReg+D4nXT6H1Spt4
 QxwERElhaH1l0gwnAEQt7yxu1L25+NykUVwAdwaOCMXFGdE/ffigUG71qFAxkCLEtCL0aOiiugx
 BB64jdkmLzfuudg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 07/12] gpio: sprd: use new GPIO line value
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
 drivers/gpio/gpio-sprd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index c117c11bfb29a84d814706e383faa19afe513e93..bbd5bf51c0882704a9ead35d9fbc7d4b9bceec50 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -108,10 +108,12 @@ static int sprd_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return sprd_gpio_read(chip, offset, SPRD_GPIO_DATA);
 }
 
-static void sprd_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			  int value)
+static int sprd_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			 int value)
 {
 	sprd_gpio_update(chip, offset, SPRD_GPIO_DATA, value);
+
+	return 0;
 }
 
 static void sprd_gpio_irq_mask(struct irq_data *data)
@@ -243,7 +245,7 @@ static int sprd_gpio_probe(struct platform_device *pdev)
 	sprd_gpio->chip.request = sprd_gpio_request;
 	sprd_gpio->chip.free = sprd_gpio_free;
 	sprd_gpio->chip.get = sprd_gpio_get;
-	sprd_gpio->chip.set = sprd_gpio_set;
+	sprd_gpio->chip.set_rv = sprd_gpio_set;
 	sprd_gpio->chip.direction_input = sprd_gpio_direction_input;
 	sprd_gpio->chip.direction_output = sprd_gpio_direction_output;
 

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
