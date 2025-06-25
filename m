Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F29FBAE7F6F
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97209C3087B;
	Wed, 25 Jun 2025 10:33:45 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB7C3C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:43 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so72349185e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847623; x=1751452423;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
 b=gN4Rnvi1usboWdDdxj5jdhYO57f0lNPrhNW6Wi3+oz33xFxw1MbV0ZK9XJ/Av/7JtH
 3kyaSzOYdKAZPAiekynLoFGOhVW0xDaLwSLZ8/D+CbZxb1hQNnjH1zO0fr56wogpHd0O
 hHw8+GlGv5SG4XG/Auf0RHxEN89K/OV11dRlQ/luSd8Div8nsC/gSnipkO8IBVfK398a
 +o4KRo08G3R3h/zEYllZgYUmEbfH6xUSVhoX+XwPowcuDhcwwxaC+KNGHSfolxGfQZDG
 r30tguU+JU0E8KqQ10n6QQqoPJBrT5djjGTeOdSL3WL0UTJEctdkvEEUk1Qf4v/cZ5OE
 0d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847623; x=1751452423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
 b=E4qReeK35WcZhRKlGxtExYrWsLLLXg3GV6fG0SppJYivg2xZH147P76KWFA1So7XY5
 lCKYc/RvKEGJBUNgQrCoKAFx5WeMi3x0P9RfOtDZg3p6lMhp/j48Cy+lDvGI8bAcpxHn
 WFujT6nGntyCkb+DXrKsovYzOegH48TF0gruP0fzX1cCMunxpqnCnjkzqYlG8xNQe5wn
 Q2au64ZiDyJUwMADUV9hqnibP1PbB1qNthQOSZFBuzNUmi0QfZdBEI9wNs90g4E9ZK0C
 gvEWfw4KVx5Rdb84z1B3rJzBfGMJy4i/eQovUGvaJ7GoDHhZGelTrMERTRb68eQ30cpq
 X9VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCVpXsKKaBkvqD9aj+DZDwxNVp5npUC6yGH+Gm5XRQAV0AMmxdMUDDEmKTdqjjJ548c9SpFehcRZER+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoyjZ10Ob/ayaP85PYJm2r/ibXVa+om7N1pPxwLOoGlNjkxtsQ
 CzjLXK1WuLg2kmeiGVJ+r8zl9xopUwY5/bV0oTXAwqjkPOhB1VC1CteLuZIDlZHHv2SzLO5c03O
 r02xNyK4=
X-Gm-Gg: ASbGncthfvND2Ej4oA3MJtdDA/GVXMvpAPQ/0DlZwXxuZuVPQJnq56BYNc+8eMxlx7X
 ilFmZrxu97HXcqjwAFjW5oa/sVgPeMaLi+vMgUP95dn3c3U4cpzqekO1HvA3ADHL60jKnNvqYA5
 DOSuN86qiHNp7CgPTjq/1+M+716YpGqDTWkzUD6hnkSf/HipYX+3cYn+V9d9vjggBRkEVV7GUqH
 w/Q9RluOwcG7rAxQbBkd7MN26AF0ubnYprZqgr8wJVw43P639GHScRoBufYU4QWyZjgr8PwOuqb
 kG12m8iNQopjlFQGXdFCSpWFqlfef4sZQ2pHVRsTPTcozfaWrbmInPrX
X-Google-Smtp-Source: AGHT+IExdKWHy0zZaVYCrqx+BP7uJ368HB9lkEt9PPvj6/TYCB40ZTHcV1Ct7Y5lmkJLBkvOCbR3KA==
X-Received: by 2002:a05:600c:4689:b0:450:30e4:bdf6 with SMTP id
 5b1f17b1804b1-453837b27admr15033695e9.19.1750847623364; 
 Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:27 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJcwe6Hr5XvIVx8G6ghZMJiYUF0XZL199iB3coJfAfk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+PQpCwI9SoOycpwUWmzmglijqLdeB/U5Eg
 kE1VEMdyMKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 cuFFEADfNeOln1AAQDWFM9wsl7uEhDwfsbG71W4/R7OgBczrNFkK+UtKviXp2HJ9O01kv/hOWs7
 6EHhIBxDrY3pFDdCE+Wy+NSeUrjAmu+c6e318/1GLlFKuByq4RPXekslFzg6vFxqLpDcBZj90CU
 c1wUFWCZZtASvlEycZTrptz7iDoRsiWrrPfWbca1szxTMpwerPyUpMF0VrP36xurC6WQxW/1h4V
 Cq8YmYy3rwSH1f4uuM/kkAJe3bLS34cD0HuZjVpU5B/y4k5lwv57dve6LYSEU4Fy4eXI41eQwW2
 +Gpch2bEFZmJlkUth7pHVoLmFsvZQPMhWgw0A6jegQII82k8eM45CJRXZArNUsMPuJDlXur4HF+
 rBIwKFgRSKQzG7HhSE+xwKGkmdqCXc1C1Wn83SO0y+V3uvW91HAwGZZQOnG8CjBVdxdOcsh2pAx
 bealDn8ZLONkKw/5Z8zYQEtxUIP1bWTLUPoftc6X7gWjyZG8OX4vs8KCXh1isM5o+f7usuQNiYa
 vO4UW8hil77mCfWWx4yzX6r87ZS36V6WZqYWVgLkaCiN8/d4JG21eaKqPcLxX3E/veTMsMy/RTy
 4ZXlQq5YztpHNAInC0FbcAuM54PMNKASc4AGGwTpKZaAiFtsMzwBpcZ+uKxpP0+H7/IBsqKPnbb
 bsgrz1crt8iUXww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 04/12] gpio: siox: use new GPIO line value
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
 drivers/gpio/gpio-siox.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 051bc99bdfb2aa3c8a382f773c5892fed6e0a8b3..95355dda621b40124f4702432565b7381c4e6686 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -160,8 +160,8 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void gpio_siox_set(struct gpio_chip *chip,
-			  unsigned int offset, int value)
+static int gpio_siox_set(struct gpio_chip *chip,
+			 unsigned int offset, int value)
 {
 	struct gpio_siox_ddata *ddata = gpiochip_get_data(chip);
 	u8 mask = 1 << (19 - offset);
@@ -174,6 +174,8 @@ static void gpio_siox_set(struct gpio_chip *chip,
 		ddata->setdata[0] &= ~mask;
 
 	mutex_unlock(&ddata->lock);
+
+	return 0;
 }
 
 static int gpio_siox_direction_input(struct gpio_chip *chip,
@@ -191,8 +193,7 @@ static int gpio_siox_direction_output(struct gpio_chip *chip,
 	if (offset < 12)
 		return -EINVAL;
 
-	gpio_siox_set(chip, offset, value);
-	return 0;
+	return gpio_siox_set(chip, offset, value);
 }
 
 static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -236,7 +237,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 	gc->get = gpio_siox_get;
-	gc->set = gpio_siox_set;
+	gc->set_rv = gpio_siox_set;
 	gc->direction_input = gpio_siox_direction_input;
 	gc->direction_output = gpio_siox_direction_output;
 	gc->get_direction = gpio_siox_get_direction;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
