Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCDB20CD2
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 17:02:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C30DC32EA8;
	Mon, 11 Aug 2025 15:02:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6455C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:02:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-459e794b331so27052785e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924530; x=1755529330;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
 b=uL5u6WcS4ylxs4W461GzoeePf5gqrN0Nf4KGEnL8I5/DieCmYe+4Mv+AfOQrdkdSdq
 wQJqqVvnfPzOJiZ4SUvPkOpuFRsfDfENuGzU+4Wow3rXhteFEVXh3tcFAHfW8RGlrKtc
 uCs5Vs23Mr/sO+bLEVvY5acuipAcuxMcHWuVIBfl4bkSGBBPtjmcDpfgLfC5E7obDdp2
 K9yWc4nUWgOs2oYlD3l0HfhBwXyysEIX/Uc8/+uOfTbr0eX1x+5wc1ZX1CTdea9M1Ym1
 A1bOo9MFUo9CdasxiElbDOyWeLiAwcf2I/B6DNF/SdiECMpfG2e5zZ7g38SP7NzK4iHQ
 PF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754924530; x=1755529330;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
 b=RRvAPPACANObv4u8f8HZjOukLvN37gib5rGnnPYGsVS11RN7NToGNKERZBhfk40M+g
 RlnNdm1CFfavXMl+K8TA5bUR9ZdjbSneslCbrEJf4LHf6z/dCM5kQOKughRu5gZM7yPv
 Wzuqo1MPm/+eZF0HTQb95FyTYmKueTRRnmCZXTc7nC3mPVS3nxjTvswKdOwmut4s/nwH
 EkwWUtfEcEP4TYGHflzkGO24JDjc2OVZiT1wMnTjKY3vt2DOCISscV2JLDqjHKlSzCkS
 g7njwqk/blfVABhr5Ed5Dm8iye5DFFioGvrXQruWPvw01LfQDhonahhFaxyneS1pO7Q9
 geKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhSedGsf5OkNDEOoMJlvB0iXqXBZCMo3//8d7L4noY1Ivq93TAxeewq6B6UfVBpz33BSYAUdgHTRlR2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzZDPt/5LPoRO1kIkU+hKmPuzixX5KUletCaVgXXNbOlN6iGzUG
 oKvGynrRUTTyVgO0WlV333eYLd8LccaXQAduRU6GzRBIkQJ2Ep65i2QukMXLKrGc510=
X-Gm-Gg: ASbGnctJLLxXNgUMVjDm8eQF4NTst32ekwknB5vZtrltaYaSbc6qn7fFE4y0CBL8s3m
 mpKRr3ZagJ0GnlstKuT90RYIsBGkUgZ8h/g0NEw8OoqWhD3eHfpRh/ics9Q17rCiaaGA7nRWOAR
 xw4FLIAINdHAdC1pIRTVOa4gzUTbjmKi9khhXjDlv1PFiBTmynkqQ6wzfZ6rK5hnMYNguh/fHjT
 D1ILwPAd8FEhoJYI9jktpSmr72vrxFbVu2NksXVv847qJK5L+i8Un5U/L1nG0nfcNdCnFgkh85S
 g1Xhja7kvGzC1LOtcniEDzWKqUMhuaDjsZ/JENv861XYFWVSaqFHt+AJEmIETJziL/kKY9lpYql
 BJaZrGcv6f9NJF+/c
X-Google-Smtp-Source: AGHT+IGuRkJqXSehCHbSdsJW5I33/Fn2ULOWbTPFQOZm6vceKVH1dj+vd6G7mjfXDQfCQnwSEMY/9Q==
X-Received: by 2002:a05:600c:6286:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-459f5687c58mr137162945e9.30.1754924529892; 
 Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:01 +0200
MIME-Version: 1.0
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-2-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8Yc3Q+1qQoLBEOdwvJ5ov1cATZZZnKh5I0syYOGIftg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXt7zodHeDBKguKwa7IUu7mcb1ZhND7UMYHE
 Y3heyY/C7KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ctoEEACcZAO8D6d3VypQQR63kLzYUCVUIk8a+J2FDJHx39O6IWus2qEipgONFpBz4wzudLzRqo5
 uTDCIgtDBb4+xJv641uKV8GWW3kJDVL/zaEWQ1Cf2Nf+yZvVNDEpUvV/VHI1d5FW0zgB7aatJkD
 kIfjKQcNA9wAf3mrbhjOWyi8dGvn5t3h1GxP+h1zpkki5kt4wDiJiXKnh++Ff4Ms9vMsQHUAVi6
 Fag9N8dquoInaui2BKJA/kw8qg7mJUwafO9F+/3tIV7qtJ95GeT2HIF/UXJkfF4TmmkN89PxnHc
 97wGuk/NY91jcfhI3KJj/hX34dOLANgeSYSH7c+Tpl03qrvmhQMA3LYu9Saa3UeO38Zj6Dx/3zg
 RazSoMS1zXdV+ejLnGNXLXtUtNXfk4H3DYEaDL7AlIHaaFLk1Lz1TZK0Wld7XemwDSyeif5/wY0
 6jl7HI/GWCSq/YKqrUqtnKVbK6TX8vHIEWYhS11f9U6maRkQTH2dYj8xa24n85cmVEtwKYsFv1R
 WO7dmB3Fh6fEzDpmTeE4q5VclBBN7g0ryWyWTw3Tqz/jegXUkYHK+3E9ygCq2v9KPTWGDjbsETw
 sFh/2j2L3ozuxpUBA9WEzEKEfGXqVs89vl0sjRB3eXyg2Do+3VVbsLLwztT5sfHuJ7xhq5Rh8kP
 4qhIiw2vIrQy7EQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/5] pinctrl: equilibrium: use new generic
	GPIO chip API
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 26 ++++++++++++++++----------
 drivers/pinctrl/pinctrl-equilibrium.h |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d7f9233b2da0fb26e482170629424..210044185679384d03278e200d8f7723324487cd 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 Intel Corporation */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -179,7 +180,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *gc;
 
-	gc = &gctrl->chip;
+	gc = &gctrl->chip.gc;
 	gc->label = gctrl->name;
 	gc->fwnode = gctrl->fwnode;
 	gc->request = gpiochip_generic_request;
@@ -191,7 +192,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 		return 0;
 	}
 
-	girq = &gctrl->chip.irq;
+	girq = &gctrl->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &eqbr_irq_chip);
 	girq->parent_handler = eqbr_irq_handler;
 	girq->num_parents = 1;
@@ -208,6 +209,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 
 static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = drvdata->dev;
 	struct eqbr_gpio_ctrl *gctrl;
 	struct device_node *np;
@@ -239,12 +241,16 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		raw_spin_lock_init(&gctrl->lock);
 
-		ret = bgpio_init(&gctrl->chip, dev, gctrl->bank->nr_pins / 8,
-				 gctrl->membase + GPIO_IN,
-				 gctrl->membase + GPIO_OUTSET,
-				 gctrl->membase + GPIO_OUTCLR,
-				 gctrl->membase + GPIO_DIR,
-				 NULL, 0);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = gctrl->bank->nr_pins / 8,
+			.dat = gctrl->membase + GPIO_IN,
+			.set = gctrl->membase + GPIO_OUTSET,
+			.clr = gctrl->membase + GPIO_OUTCLR,
+			.dirout = gctrl->membase + GPIO_DIR,
+		};
+
+		ret = gpio_generic_chip_init(&gctrl->chip, &config);
 		if (ret) {
 			dev_err(dev, "unable to init generic GPIO\n");
 			return ret;
@@ -254,7 +260,7 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		if (ret)
 			return ret;
 
-		ret = devm_gpiochip_add_data(dev, &gctrl->chip, gctrl);
+		ret = devm_gpiochip_add_data(dev, &gctrl->chip.gc, gctrl);
 		if (ret)
 			return ret;
 	}
@@ -499,7 +505,7 @@ static int eqbr_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 					bank->pin_base, pin);
 				return -ENODEV;
 			}
-			gc = &gctrl->chip;
+			gc = &gctrl->chip.gc;
 			gc->direction_output(gc, offset, 0);
 			continue;
 		default:
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index b4d149bde39d8dd08a962bb05ccf026364dd9f68..b56124d7fe9132c875d2768b0af8b939f1a4fbf8 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -96,7 +96,7 @@ struct fwnode_handle;
  * @lock: spin lock to protect gpio register write.
  */
 struct eqbr_gpio_ctrl {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	struct fwnode_handle	*fwnode;
 	struct eqbr_pin_bank	*bank;
 	void __iomem		*membase;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
