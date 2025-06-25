Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD6AE7F6B
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 737DBC30883;
	Wed, 25 Jun 2025 10:33:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C92E4C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so51299615e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847619; x=1751452419;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BY+Lz6lKMiwYrbR7KuHJ26zaicwVAsUkFljRs2T1XQE=;
 b=19PPctsNgBPvFJthalUCjdk+ll5Oj2NAAIGdVJXdlL3twqnpsb2p1wkoW6T8cbV9VU
 O2Qlv3kxQ3sLnC8VEO/eFdHOY4XcdYybgR2vL9dg574MsK7mWQcv7/+zFq1PVUF1sxRW
 v+OSB80FxuQ+x/HT69a575uolOF6yNCp4ZBzd9e8RrEXIrOh+FVMWuS/Cx0GkpVc8ZCh
 5w6Arx0bYdfVMQqh+6UbjAy2Lbo/yCvc9zxn6Y5UDt53sQaMrSJuVCXeaK6wmx5EesQA
 cZ1paxpq0+jNN3WoSUy6ByHl0FeTPwnE0svAYusqOWxsKG/bFPuOaq9xvFBcb3x+U+e7
 XAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847619; x=1751452419;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BY+Lz6lKMiwYrbR7KuHJ26zaicwVAsUkFljRs2T1XQE=;
 b=w/YTtq6WrE7dScsAHebJIvOAEOcqMaAIlPZtscGwk9d1iNvkIeoVa/b+hu6LlEKYKT
 jYZwuNQgYXMLbhhbCS5h5ad2J6dRI1Fn1/p4FZjAbI8Cm4L98/H+DIRMfId+amRAZZA0
 IA77Teuk0JGa6XS7yFGa/vBMrCSM8kMlWlkewnF0s0BpajyGhkm3WmX66MbY21y8e8ar
 sH+UliyYPZZ7V58HQHngHmDtOFcnN0e57MZvME+CPfclsSq+iyr8bgDv8JH7a+E1l706
 m22vQe6KFLlFuETzw0skAWLNK2NG3aZYWmKbgwXLIfMsleplHKhFzSedh1WmF2g4uRf1
 F6Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm1NP/+EfRhPwT2Jgtv9OrdTfMbQRyIo34CN/6nIazgK5eqeoxHQdWv9o3d586oo53xIhzJnXTZN/F6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywo0aFKV+dZmFOYnqcHbaS7t4FX9SVKmtr0pGQM9YuLgwp0S2xU
 NwLqekkuW7aywTwmtElus5q2x0Js2UzD2cLyAvT6pNwib233E5xXNrHIGSt0TRKSTYk=
X-Gm-Gg: ASbGnct+RfUqyczy/vDM+Aep9BLSBWx2fkKaXelvc6NVx7dN829GpIwQEyFJB1C2lE+
 to+v9DOUSJacQD1jLESjXu4mC5+PVj1q5rs2wW6RqoeUPg2DlM/OJgZhqx2jC1y44OGHVAs9Ipj
 dGzF0296ldIGxY6hYofG8fAeAjlcuc9+eLfFn6NIMTURnpmn6mYRV5JqNhdqC0IRVwZ8GzG2rSx
 2co7utzZVkH7+a0UzDVoBAi962l84E+GZWIqgI0Eg6UsUAj41ieF0opUNWUXUTBiaTxuBQRkS5B
 K5y2AUmdcRJlEWTh7XfVWdUM24xMTT20zIzDxx9yPPmXZ/qAmcbazGq2
X-Google-Smtp-Source: AGHT+IH5n3V2Wm0P6CUxi1gveb6IoGY767ZKTPjsevskpMmy1m5PrdgebUCMcoB8UkSLHfSDVjT+Rg==
X-Received: by 2002:a05:600c:4513:b0:43c:f6c6:578c with SMTP id
 5b1f17b1804b1-45381abd384mr23901585e9.15.1750847619098; 
 Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:24 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-1-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OsKwI/13W1loEUCyUkai3/g1YYcKJASkK3JSsvIY/ec=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+9KzJ70ZY+HOhiE4zfGY1VbgsiKidRlYmK
 Rv3Gzq8LI2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 coFpD/96Zq597g3aZF9Cd8f0q6z9n1kK7v0Gd/AF1oaMMmqa2jvOdxjxS46OrtOECQVVOyuQ95t
 f7XeyYeGiRy18XEWjZ/0Uuw9OmpXhmjr+pxJE0xgvpMdSdB8cR1UiHRZyeiRPCuQ0lnkRx2Z3RO
 WuCDT4rXFYkiwkXXncVox+JetZFiI1TMVTZtKIXXH7bLPembV88ZHrP7cWAa4WSEL6rJg5UUq+r
 LppO5ug+0t6xsRwuaJmcQPx4UxMZmXhPF88VklWn8VagD45ej5ypqtnGBzSj44t1eogzEDGTMTe
 Zy0yyjYw6Jcd0fZE6Vh/dcNZFx1gHvwxHwFlhg3GtcWI0quHZdD2nQBBA6zVFeI73okPfaiON97
 DOnHi0E8m4d1mDRVSJtw+Ct7AbPkTJJhyUQKxnKvUPnDSBpsAi1FWgdu9UA+o4bMAy1/CiqZaT0
 BubNZ3V5K/sSLUCdVY4c9fpxJH0lsrGmLG1KqYn67nB1LR81iT85PSRvA2fsptCGUH4dbnh7d+3
 jecoaH+kkmqYURLUmE3znM4Z8q5+60nvqU5SAj+M9AiLSAMMNj59Z8wDPE1K4r4hrOR9yjrdwwZ
 jk93GzPN+Xo67157cGFkbmMSGgD2gvq83xOMW3ChasZQfvwXittXuovyJArX7alaEWz8hoHIXGX
 xjhSKJU/QASErwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 01/12] gpio: sama5d2-piobu: use new GPIO line
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
 drivers/gpio/gpio-sama5d2-piobu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index d770a6f3d846640d8ab4c9ae387635118b82cf51..c31244cf5e89108b5a21ff6ff58569dbef4bf972 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -169,15 +169,15 @@ static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
 /*
  * sama5d2_piobu_set() - gpiochip set
  */
-static void sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
-			      int value)
+static int sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
+			     int value)
 {
 	if (!value)
 		value = PIOBU_LOW;
 	else
 		value = PIOBU_HIGH;
 
-	sama5d2_piobu_write_value(chip, pin, PIOBU_SOD, value);
+	return sama5d2_piobu_write_value(chip, pin, PIOBU_SOD, value);
 }
 
 static int sama5d2_piobu_probe(struct platform_device *pdev)
@@ -196,7 +196,7 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 	piobu->chip.direction_input = sama5d2_piobu_direction_input;
 	piobu->chip.direction_output = sama5d2_piobu_direction_output;
 	piobu->chip.get = sama5d2_piobu_get;
-	piobu->chip.set = sama5d2_piobu_set;
+	piobu->chip.set_rv = sama5d2_piobu_set;
 	piobu->chip.base = -1;
 	piobu->chip.ngpio = PIOBU_NUM;
 	piobu->chip.can_sleep = 0;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
