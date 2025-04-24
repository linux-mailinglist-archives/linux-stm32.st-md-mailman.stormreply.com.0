Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D43CCA9A604
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E28EC7803A;
	Thu, 24 Apr 2025 08:35:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30274C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so905835f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483749; x=1746088549;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=;
 b=mioVVGrkK0JY11qxe+LJWpD6VgM91hnT9BopP3R8K/Ja+f2c4a9E57FzmuSRChT3ok
 EOnJL4LrWTSqj8rmr17ebEEvfaRNVWev+RSICG0VKqNTQkxtU/sK2QVaTzpAK2epG9ih
 MAjSQ2NJskLz65PCpw7SynkT5sP1Z2TYJ+iVKwU2hJuLUuJ7Vu+2ljRWhvbgLANV3dfG
 W68zZDqLS8FOv2Tz6/evvWssoD5ZxBSUnmEACSdwCSnceTPSZ2KVTegBE70hD3yHS5sw
 oaUoepsfXj0Y7w4aAe0TNoaN2A5sceDm+0u9ImGDSZxUseV2wynvrCU5U3FAh1t6ieJf
 OkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483749; x=1746088549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=;
 b=ugZCG9RGKah2CjlsBaNyAkw/qTloM/mplx5SruX3z0mGvpDaD/QblyVRJXlu+gkSHq
 p9bEmFf7oHEfMRykfjaE3h2BtByKxbgAFOu1bnSRZtPDs3Xh3lw8o6QUV0508LzBIsS+
 M8JpNiCx57siL3bt07QmNWTWw0jN7oBeWsA3A4UJM+sJJTAMbM8WSFwFGkA1XhWa7MTf
 YKPNV8yavU2zuWzOdHHVW5kpuR08LdFZ8i1BqHntrvJH4bVkwa2zMByJE0n+PzxHHVlK
 prByDnBACXNz3pAyYD7/6o0iiulWH/50Z1rHfD4B654nb0P+Vj/aMUQUkg/SHq9P3xK5
 JxFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDsEbVVNZtxtazxwX5Nou+ox71OJgyrGqzhQsTOp8oAjDn1yGrstBL+7dP0ViHIsxsBbttdjQiBs/zWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyvw8yCjUqww/ZQPGrRfat4ACsLjBYusIkRqtOvgDVicruk/vur
 MChY7CIgLwnXn7uC3mswVfvzvFFBFW2R5y+Bg10LBHsP2UCvlngz7+9usjQFeYU=
X-Gm-Gg: ASbGncvrPO5gkDqosQlIjHR3EBc1Ha3Hu/C47j89uDt3pxXu3AiBTuwWWoKHFl0oPWM
 s13HlFDMKVSxrQ4bd88Rf/9f5G578rAqyr10aqXb4U8s/dhRAhhT8T2GO6TvcHS9o17LYNYys5/
 szF5Pa65Se7Pqx/1MqGsLnKCArsm3TOf+gYDOJUKYlR7bRrihAw2ehZ7ytmazlr+YJNMhuD1whF
 lWLhZYdIG3i7RkCI9Emp4qSTlu9qnmfXulRKLikYmrulUdbCmvhEmXkid6e7zX17EiQ0deIUCaj
 j4SR4FhdQUJi+ynfbkeFQHMDLxgcCGKy6g==
X-Google-Smtp-Source: AGHT+IFrT2ryKEI3Ak4fYWyfabnfpp9zOPWj4dcFDB84T+QE4vp8znh03ePvPXvInmYkhFQ+6kA3Rg==
X-Received: by 2002:a5d:64a4:0:b0:39c:12f2:2f86 with SMTP id
 ffacd0b85a97d-3a06cf4ebe9mr1139766f8f.8.1745483748680; 
 Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:27 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ksmfNK84GDabb7cwbZBiry3j0gjxGVa4nXCuGXvLQ78=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbDmQjLh72fMV3yjWxABGClwjTKpZiO6lYE
 y+xV5eR9zyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 ck42D/9i5222ivEDPuYJfJramTA21Dz/Si68PgQJKw8MP+/dYK04nS1HRUrhy2s/f5d8l3IQEyk
 SUw/nOJGPKcElQSgK5wfrcMdUf7QTLJdRhNCw8QSOsu8zgxG8mnO+kDL73zSCj6UrZYmSzbhsQr
 pLOonJY5NYn594guZmHYpKLwBRDzKanJB7jvdjlw0gfszSTVxk/hzhG8hUUCM/bfQZHPvJyefFV
 FQWRoGvs+4NzTr9vn6xCSUlbAFUGj2Hw/cBz3FfnpjjVnJobvJq6q524MdE7u0OO8X036gIDGan
 xzcN7fRgoRrCbXwXa+LdihYAqRJf6pbYHO06I8Vwr5qdHcoqzVxfF9LmTzJNsfRDxxLrCM6cT1b
 FntYtKNgMc1nEQbTRPPydtniG4qQtDZFcqj4J987kdEUq13zTzmnlHQwWOdxPYYR9VZ2THuI9Ko
 MI8jq3GiGSDkzR4kaJE3UKV+F5xJUGt3WHBDLWuJdOXqyQhfPQCIia6p964VATg0i0vjN5SlAY0
 Qc9XtlyHZLnVy4JPaB5SFmuulMcufAUongkqc0xwxfysH14nptwQOJE3fGE8gSpOgw/sMxJA59O
 47YrddaVzPY6+L7+huekZiruLx/0uoSG7JOMh5rxj8TEAQoIYDan1o14/46KQbYbsl45o04l1dT
 liTVfyVG+QGKJ9w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/12] pinctrl: owl: use new GPIO line value
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
 drivers/pinctrl/actions/pinctrl-owl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index d49b77dcfcff..86f3d5c69e36 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -598,7 +598,7 @@ static int owl_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct owl_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct owl_gpio_port *port;
@@ -607,13 +607,15 @@ static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 	port = owl_gpio_get_port(pctrl, &offset);
 	if (WARN_ON(port == NULL))
-		return;
+		return -ENODEV;
 
 	gpio_base = pctrl->base + port->offset;
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	owl_gpio_update_reg(gpio_base + port->dat, offset, value);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int owl_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -960,7 +962,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 	pctrl->chip.direction_input  = owl_gpio_direction_input;
 	pctrl->chip.direction_output = owl_gpio_direction_output;
 	pctrl->chip.get = owl_gpio_get;
-	pctrl->chip.set = owl_gpio_set;
+	pctrl->chip.set_rv = owl_gpio_set;
 	pctrl->chip.request = owl_gpio_request;
 	pctrl->chip.free = owl_gpio_free;
 

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
