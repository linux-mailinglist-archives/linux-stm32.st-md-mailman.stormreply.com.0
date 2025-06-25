Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C4AE7F7A
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17EE4C3F92F;
	Wed, 25 Jun 2025 10:33:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1119C3F930
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:52 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so8462605e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847632; x=1751452432;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o6ZfGeAkXZ73Y1KWGs+ss+amnyN2DFHuOZR9Jo0dyjk=;
 b=dpCoXjRH3ZH3ykkJ92qboTYCVVKsQ3l939JvDqsfR0n86OhJiew+XTUtt5GzeUQeHD
 NUXgKKZfwCktZcRTa4NxeqpFV6KMcbF9FdkUJuChcQ5e49zV6PyFkTDA3d0ShqdWiBG2
 w9g9iJuhU2gdgwo4OeytiKw4J5Ove8GhCS3p9WwZeutgEMTtBIS2L23EquzdA4l6Ge0X
 Z+ut2pXJW4Omg0N/lVLwWAGqCijUenWYs/wl1yHni3pzyfduLvUHxj0HDisZM2lB87qv
 VXkqD0/gz/rY08dxsH+5uZI+3ha800XzB8rqXeE1cD1p9ssNYK0SEpvVBO4SI1FnJfBv
 1t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847632; x=1751452432;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6ZfGeAkXZ73Y1KWGs+ss+amnyN2DFHuOZR9Jo0dyjk=;
 b=RegrHEwJtRIxApRbj+ao5xUQX3VMv94h6Z+QtOtQcTDiwdqB9EVTQR8ZQ21J6SmIXy
 fKn3jBdBPZGW8E0+3wuPZBavvzlgJgnt2WoIMi/K+LFQqUYOXIy5uqPlv3gRaHIVTWAi
 Fu7JI5U+LBC/VYV1/Kw55AGcujvgGwryQeJ2phoqXjmDy1jW9kJN0IFbRuDjbpnJUvo2
 ekTZ6OiTtCK1U+JcDjB+w6ZDvP9dOPr1fpk4jivDR3ZiosyXROeNCgSFQ5za1Qq1lZIn
 5zYxlSzntgn4q9+/qJm8ZCYkzkfkh4cAWq9j+bE43MWaNkvaVKHnAscHCZLk+Davlrti
 2D1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTcXPZrwC4EbW/2F94N8igb3EdfTOITIg/h4GrloMdi0yTmUvFYtqX3+i1NR2QZrTjfptR4rxBSuE9Dg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxqWofPLysZ/U0nUu3JmOXKSBBCuD6cDiC/HoWR6GpmL574MLpC
 uzkcVLDJgJVUFnt+JIHSEUQOeZa5TLduMIMzryvpFEwmMpa3yeOsW8Qq8AD+94xC+Bw=
X-Gm-Gg: ASbGncspaxukS6m+rQXPuZ2qnxIO7oXCBPWCv1vSjELeGJfAsTKeN9jVidYabgKNpAl
 QT3i0Ks2zR37Nz53qe5hCIgIPvGXKZVo9zBUlzBDaUXK/CawFt29ACnRGChL3NP74UG368yBP4W
 LACeGeP0EAK37haZFFemhEVijBfeNPrYXB0dE4RrWP74A2pyGpU18OfgxvClvY0hVjiG/r0YXKE
 Tf3LuSMenvN0mZG8AAWiOXY8EaYrBqBprOB8tlHWFKOtiyXzR4bxO83FI6H9Pow640u4VbY8CyW
 /42pJZnp7Sr32Pgd5efYQ+7Ds6vPHPe/FxgN3DQxhkvUtj8KuKfNjKT1K8gjkdYLfrw=
X-Google-Smtp-Source: AGHT+IGGcN7WUw8zzW4bU1XVR3qpO9sgtito9/eGMkKkDd29OeHegSc8qveoQUTN22kyvswbIXCBvg==
X-Received: by 2002:a05:600c:4443:b0:451:edc8:7806 with SMTP id
 5b1f17b1804b1-45381af21fdmr18915265e9.32.1750847632081; 
 Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:34 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-11-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UPda8VLJo3OBoIL/W0Ct/orzjZK2QuSKpe06Y6G7WUo=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhb0ICioo+hAcr5UWIJINtVh6Z8N/KKejk5v7M1jOjhd43zG
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoW9CAAAoJEBGnLqAUcddydWIP/1eE
 oAzYegzqMKV/tKdTsVzHqG8LAUBTYy84VakX8ZVlCBMOxbOsqhsV9zsazPR8Up7wrITUsChfuxM
 cwrvui0/hpZ7ORdDbpBzEeoH00USXn8aecQGgCDgEYHHFo9JT9qlFjni0J/EyDHxO1JrQzfuCAR
 AILY81G6ibxRYHjZJX2OSyLo2mvUDArUHYDF9JglLbCDUSRBEPD1Mdf9fVqDzTKVwu7mvX/tRrM
 97xQAAawd2ZCERvP/NXtVvGXt0AG02D2ADMi4EmswH1vMdqbl0PaSEUt6eIK4XbjXPck3OFwpju
 Kn30+92qMYfPstHocKD3IKjIhx+tDmkFyvxoMmaITqWSuLaph9yNeyZ/Zf1risZLckcYed2DthQ
 o+zOyM0bGYCXSWlQC+qwNuUvEcvC/8J3cjpCmcoKQHJBlZP9KAR32qoxDJRePob3kfrqL01CCWf
 mMfiUIf7nBJ6gDCiYFkf5dNtJ+iWYTcwhYbuNTCwVzJGNWfypYncBMpqyrBFKd9+jB35i0BUydO
 xPW/5f3ASSR8yBBVO+zk9LwuoTxw6vUlF76Go6Tp7eRs6ugeiNUJFj9XVquFifCUsm6RNTsaQz6
 IsM0MdJekXnvMTkmwguqfs6dcCqdDtFcujyJ4LtJOoqPAa1z5qYV9wfb3nWM/INEUfs5i5C7agn
 jNnJO
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 11/12] gpio: tangier: use new GPIO line value
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
 drivers/gpio/gpio-tangier.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
index a415e6d361731e809d137a92b6c4658b447c26bd..ce17b98e0623ea6c0c2146430da38833dfd16cbe 100644
--- a/drivers/gpio/gpio-tangier.c
+++ b/drivers/gpio/gpio-tangier.c
@@ -90,7 +90,7 @@ static int tng_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(readl(gplr) & BIT(shift));
 }
 
-static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct tng_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *reg;
@@ -101,6 +101,8 @@ static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	writel(BIT(shift), reg);
+
+	return 0;
 }
 
 static int tng_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -428,7 +430,7 @@ int devm_tng_gpio_probe(struct device *dev, struct tng_gpio *gpio)
 	gpio->chip.direction_input = tng_gpio_direction_input;
 	gpio->chip.direction_output = tng_gpio_direction_output;
 	gpio->chip.get = tng_gpio_get;
-	gpio->chip.set = tng_gpio_set;
+	gpio->chip.set_rv = tng_gpio_set;
 	gpio->chip.get_direction = tng_gpio_get_direction;
 	gpio->chip.set_config = tng_gpio_set_config;
 	gpio->chip.base = info->base;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
