Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47DAE7F73
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B99BCC3F92E;
	Wed, 25 Jun 2025 10:33:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC68C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-453634d8609so10660485e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847626; x=1751452426;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
 b=w7AbaVZWkuZ0Go1Q7ahfDgr9bdATC6dJqVvJYyJNbrIKUjYuGmhzTQx3cbx2odG8Rs
 VD3BfWMh3JYJ0oEcgI873aAxEY+9bzcJWOHxVn0w7woPfleskplXAg4VcC+kENan+KFb
 8f/mHLcsFcRXkGJX8YIKN1OqETSexP1oSEfkzXRFuRUnRU0iGtGYGzyyolcUzXc6XZP9
 nbdoJoI+oHn8IfOeRUlYT8onl1GdI3/fOaHHc2Xs63c3boBMDblpcpCo0Fx5nJ+H4Iyu
 PWU6ryOJJS8YpgtrN57tsH2NTSUVjZdYMn4dz/ozyuS7UP0tbf2Q8gOwfNuOH4DDZVtU
 DsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847626; x=1751452426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
 b=dMLprFlRmx3z8qZBglfAGurBB7NurRgD4f8Q6aspAQDrcW/RavdUXCwf+ejfitapzn
 bnwUNFDmG04+7x+F+xAhtkyHxZDymWGMwwSGN6ECx52+lPjaJnbTPIsiC9RQekNczWjh
 mek+ZHdjGq2NTXN5IJCkG/V/0UjTTYZNYYSt8jYGtbht+X1bQbNlCbnwbyKHJHtlXz/Y
 wBGKkbuzb4ikR/hgIpBlRFuFZ2apmFEnsPd2npt+kbUnv4xvJiDaolVX6S/wig0Zlc4z
 4Xrwps899JFnIBijDjVgleC/jY6frys7U9CR//TTjMZ6fRvFf2rXp0C8ZBGIj/tFisaQ
 U0lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZCkrVD18CGhS/sM6hXXUVjVGJN7OfTfshBKbI/gxqb6Ypq3TcbQ+8gt9VYObe1ZevXFmhT6JiyXZO6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzW6q1JVXpcZZWmpn7uGPv08fFfvq1qiL625vyLa4ll0LIdm6Tu
 RS4W3CVOMA0L5L7CwafPNg4Epn2I9vDh8nkh/+PvwVMwNTx3ea/s4FsWfH/+QUR/eKw=
X-Gm-Gg: ASbGncvqUR5SlJJk6Q7GI2kzFJ1SdowYeOaJPO+9KYYHC7O3lGFk7REpdcqvn74GnqI
 OIUIcUZacmxEIsG/yt/YpNzoUQse/ijdm+VWHU8mvrDi7zQ4monzThBX9rHPPN1yjmJyRbs6qpk
 osnZubu1TT6pX1rDtOfytyH7XcLzcgQOmUSqJ9jh/0U/dIHyamNwoxY4cEuzqd3O1HW9NRESyQ6
 Rkq/3OrtzHN8612YApN0e+KoTsP6xkTosuKrX3zlDam7kSneMtu7o+FiNj3o4VhChvpaRORGE4o
 6Qup3moH3JAeSwdRRYlQ+nESFxL/zj4dKENpqze3nNfC5hACvnfdRmei
X-Google-Smtp-Source: AGHT+IGJBQOkw6eJT7V+Tc/6OJa3rfu5ZRr5gF6yKyzRI/QtnAOx+SjmcHMjXnKIxCo+GCFyhzPYEw==
X-Received: by 2002:a05:600c:c04b:10b0:43b:c0fa:f9dd with SMTP id
 5b1f17b1804b1-4538269fd07mr10337845e9.25.1750847626370; 
 Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:29 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-6-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vMdNPd5jRPkJ9QwKPdJC9QQNnWlRPg8OHEfjS70PZL8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/CBkqsRRCcLd0UFu9RXVYmSHO9jQsckaJE
 pp2PCUKjOGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 ctwSD/9Mp/zVOVvyZVeHYqyme3BxhbzcR9pcx5ATfalyilg7HNmKg/32h7u72xZD3I1wE5lhqu7
 w1czMVrQqd7UfT4/BpolTbZNq9c4D3ZR6dAUhktF/cx5bXVfMauk7BkwSn/SJ585lE4Rgj7ZYes
 0IFjVz8KTIXc/AA23Ck60F7M//fVSTCpR1IWgTGE1a9T/V9chKJksSUZ5JBQZ1ipj4wfDSEQzhf
 1lFx4i72i4HLleD2elpfccU1Z0Cor3a0tMywrN+NIfQfzrEG+7Y7qHyaxkLWDEar4rv7Vc+o0V0
 jy1ZuwHHuNu4SKKem9Lj4cKuaTkMACootTDGvZUNhooPVv0m2fGdM3yp+5i6jR0GGwXBt9mwBfu
 QxawwHxMpmWMlppx0csAhOiLpiVq+BSklp/hxYTLzJJl0D5g699IYJyJNdZtHYm5tE+jpt5pT5J
 DHx9ueCiReim7jnqdaBEvDJcE8BjSaO3VjKA5GfwRzcoJ7qxZdVKxg8K6dHxTXxop8RnO1nd74z
 g2tQcIMknTnWHIgH6qp0O919ogwx8HRPwKJ765jHeAi13F7btqMOI3SivTQSSRwVxBhG/3zGbp+
 YQhLXkbn8Z1A2YZoc4REvxRZeJ3E4dSx3HuNv92T8bO1c9MPNpwQRjNICxgXuDOuXAGDFcdwZ9M
 etbIQJG4192v+3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 06/12] gpio: spear-spics: use new GPIO line
 value setter callbacks
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
 drivers/gpio/gpio-spear-spics.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 964b7dcb30b7a5bccda964a637f7fec97fe02aa4..55f0e8afa29143649e868a02edc19d920e10c31c 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -51,7 +51,8 @@ struct spear_spics {
 	struct gpio_chip	chip;
 };
 
-static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static int spics_set_value(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
@@ -68,13 +69,14 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	tmp &= ~(0x1 << spics->cs_value_bit);
 	tmp |= value << spics->cs_value_bit;
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
+
+	return 0;
 }
 
 static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
-	spics_set_value(chip, offset, value);
-	return 0;
+	return spics_set_value(chip, offset, value);
 }
 
 static int spics_request(struct gpio_chip *chip, unsigned offset)
@@ -138,7 +140,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.request = spics_request;
 	spics->chip.free = spics_free;
 	spics->chip.direction_output = spics_direction_output;
-	spics->chip.set = spics_set_value;
+	spics->chip.set_rv = spics_set_value;
 	spics->chip.label = dev_name(&pdev->dev);
 	spics->chip.parent = &pdev->dev;
 	spics->chip.owner = THIS_MODULE;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
