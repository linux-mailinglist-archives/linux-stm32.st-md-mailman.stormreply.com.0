Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D17B20CD5
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 17:02:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E745DC32E8F;
	Mon, 11 Aug 2025 15:02:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 015B9C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:02:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so26170195e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924535; x=1755529335;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
 b=gzBnkx8dBFp4imzARhAJhucUrQRO3xtXswAljBtYy1JSbXuXeJpOFruP35TFGDppDW
 jiL7DQlBXiN60haW1m/t1FpeOhCKxkU4JQGfrz0ni/vi6/CblC8m7rbfqK1SiqlOB6Gz
 Pudx3uTm1j8G9hPHXDMCc0QeoFXD3JVOOHmVcu5tEvC29tC7tFMG9hEozbR1kZSzvLaU
 yRxmaotDlkmwQgN9BdB0fHgOAaGfG5Osk5rRG2zgBxTehXdQTSG7gJ3KnJv1y1FpOj/P
 zo2WlZeO3S1qVC0UpaKK67L1Igi/N3w4BFr80rN0VAqyM8Js3z6vPMrvAZ6VJYpJuy4g
 jTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754924535; x=1755529335;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
 b=cFcKpRI08k+uCaVe7HvyDNsRpLGeEtGkIGsvlkb+54dpsEzi44YjGUvdg3Up0eScs+
 Qhkmqpb2oY41wZQhtHEbWME72pCiW8J7EgsYrnZpx8c7FOTzOoGHX6+cbUqCrLOW5uEU
 eQNUqX9vDwBFmpW4t2e4+Ac+YbhRe72gy15gaZ4sBrIGdvkyKiXaHTo12ZvN/QPQP4Ic
 Al+/RKcUqh69b9N6L4u/jYSTbePlaaQx4bkjJdG+SvZv65knSvqSkBHUGGiNabGFElUs
 EGnKJhT7D/zUEFMY+OFPA5GEG19RRC7KdoEqFqngi8EApSSpACgK3x6kBe5Ovl+PgW32
 kllA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEuCQ+ZsEM3QAWDDE07hCuVk0EgSXy5teMOX74NLH3GPAnamFJVS5PTrLCBP80VUSjCFq65rYSJYHtmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKtwAgW/wv8PuuEsmdtSM8DvWXNd4PUDWzhXS63DPQDBhbjN04
 VRH+wP2j1eZeB+Q2Bn4d4serCuvRVSjiZ0vWMl5iq9RwK8a4XAacARfh3VO0XlKDkEQ=
X-Gm-Gg: ASbGncs2vWkOCji4lqlUpxOmFnTqD3jirkDVbI3yILhlN4LIvG9HGsO5sHkv0os7HmE
 1JbXPJqzOpqeqStlJQOCCyc82/mGsHGmM3wYmoNMLq1lkm3JEIERyikTu0/Uhb37dae5AimGAJB
 tQ/CrIkELFL00YPHWo0rltz8BOO0PkICVS01dE7iUP4QWI6iYcbxaXaKANLXE/kPqKheGkxDaFs
 YayhCDx2Fg3PomerPbZF3N4PjNeDEexyByXhGMOr3AMA9QKY+jmCSXxAQxYa8YCGji/uemB3GOW
 CiKZ0NrKTKkTMFlae9yHIHoqe+YRyZLveb7Qnp3j+4G7aTC6cKQsyPkQIZDK1Qf3LuE6Wfatb47
 lfqLgifh9cOXGrHuW
X-Google-Smtp-Source: AGHT+IFiSDH4dTGzeIV+hH7h6pQJ8LcJq0Po1XDJ2GeMsEQEPO5rZY2CszDqq2FuZ2ThQvFn+PGHwg==
X-Received: by 2002:a05:600c:35c3:b0:456:1a69:94fd with SMTP id
 5b1f17b1804b1-45a10b3a3edmr905615e9.0.1754924535221; 
 Mon, 11 Aug 2025 08:02:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:04 +0200
MIME-Version: 1.0
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-5-a84c5da2be20@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuIHwRskLSRbzwrVaTM8WNQE9cJKBQppwXKNoQVeoEY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXtHEGmnbFBea5WN4RyVzy/ytLzLC9kh6vxq
 DDy5vP9Yv6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ch1FEACHNtA8UzYfZDTsRXPIaEfNVsIe/A7suWXcUxzJAJ4wCZsAylvzKkr4JN0hxegkQstolf7
 cqpnmT7yqQ1Qk6wcPN9hZ1SSYHmIrwvaf3mTmEloQV38NDiIm7IGi5WF2anqrWdsXNN3Fqw/Z03
 JdjyJUJ5kL/NyHTWt2wSuJS5hnvdvWygpCfSyzgVrSoOrLyFbcGlnT8I7BNO6P5D84sFm2wi7Jm
 mxORKa6aTz2hN16G9QVmbIatahVLcdG/fcDo/fqSdRfrFH54Sxws3Z1yVZiKcrsVWTD8E0xcIfi
 ah2zKGomVba+cXUDEYljd/xpKApsmMZRcMI7JjiZFjYoOXOGWQk/y66BEo7xGO5cm2Ek7E1c3vb
 cKltTFPFOiJa2IZQm5w2yvy6lA08elwimHnGHoWhZVIzJN/i3zKfcAYeYcM3+Wzv09D9vZIDGa4
 c2jq8H6LaAp67sWaKXv+xE4ZtQpaIDrhcTNQE3EvPDga8ATKWdhmZRx3sX9eaKFUiSdAskTrsxq
 Dr99n5NoKjTUCBXAsZpDkai4eXAliRMhl1omn+dBC7Yu2SOBy23wHHP91AJIGRlZt2CTyMq+9/z
 rvhkL4YUd2ZQIdIRTAOUqWRH/1+EHDZOjJGT66N8dJzDfMyUk55wkaiNTKtvBxo3NxRUbinLL7M
 rPWbiSQMV59HkEA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/5] pinctrl: wpcm450: use new generic GPIO
	chip API
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
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 44 ++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279..4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -11,6 +11,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
@@ -47,7 +48,7 @@ struct wpcm450_pinctrl;
 struct wpcm450_bank;
 
 struct wpcm450_gpio {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	struct wpcm450_pinctrl	*pctrl;
 	const struct wpcm450_bank *bank;
 };
@@ -184,11 +185,12 @@ static void wpcm450_gpio_irq_unmask(struct irq_data *d)
 }
 
 /*
- * This is an implementation of the gpio_chip->get() function, for use in
- * wpcm450_gpio_fix_evpol. Unfortunately, we can't use the bgpio-provided
- * implementation there, because it would require taking gpio_chip->bgpio_lock,
- * which is a spin lock, but wpcm450_gpio_fix_evpol must work in contexts where
- * a raw spin lock is held.
+ * FIXME: This is an implementation of the gpio_chip->get() function, for use
+ * in wpcm450_gpio_fix_evpol(). It was implemented back when gpio-mmio used a
+ * regular spinlock internally, while wpcm450_gpio_fix_evpol() needed to work
+ * in contexts with a raw spinlock held. Since then, the gpio generic chip has
+ * been switched to using a raw spinlock so this should be converted to using
+ * the locking interfaces provided in linux/gpio/gneneric.h.
  */
 static int wpcm450_gpio_get(struct wpcm450_gpio *gpio, int offset)
 {
@@ -329,7 +331,7 @@ static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
 	for_each_set_bit(bit, &pending, 32) {
 		int offset = wpcm450_irq_bitnum_to_gpio(gpio, bit);
 
-		generic_handle_domain_irq(gpio->gc.irq.domain, offset);
+		generic_handle_domain_irq(gpio->chip.gc.irq.domain, offset);
 	}
 	chained_irq_exit(chip, desc);
 }
@@ -1012,7 +1014,7 @@ static int wpcm450_gpio_add_pin_ranges(struct gpio_chip *chip)
 	struct wpcm450_gpio *gpio = gpiochip_get_data(chip);
 	const struct wpcm450_bank *bank = gpio->bank;
 
-	return gpiochip_add_pin_range(&gpio->gc, dev_name(gpio->pctrl->dev),
+	return gpiochip_add_pin_range(&gpio->chip.gc, dev_name(gpio->pctrl->dev),
 				      0, bank->base, bank->length);
 }
 
@@ -1029,6 +1031,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 				     "Resource fail for GPIO controller\n");
 
 	for_each_gpiochip_node(dev, child) {
+		struct gpio_generic_chip_config config;
 		void __iomem *dat = NULL;
 		void __iomem *set = NULL;
 		void __iomem *dirout = NULL;
@@ -1060,17 +1063,26 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		} else {
 			flags = BGPIOF_NO_OUTPUT;
 		}
-		ret = bgpio_init(&gpio->gc, dev, 4,
-				 dat, set, NULL, dirout, NULL, flags);
+
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 4,
+			.dat = dat,
+			.set = set,
+			.dirout = dirout,
+			.flags = flags,
+		};
+
+		ret = gpio_generic_chip_init(&gpio->chip, &config);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "GPIO initialization failed\n");
 
-		gpio->gc.ngpio = bank->length;
-		gpio->gc.set_config = wpcm450_gpio_set_config;
-		gpio->gc.fwnode = child;
-		gpio->gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
+		gpio->chip.gc.ngpio = bank->length;
+		gpio->chip.gc.set_config = wpcm450_gpio_set_config;
+		gpio->chip.gc.fwnode = child;
+		gpio->chip.gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
 
-		girq = &gpio->gc.irq;
+		girq = &gpio->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
 		girq->parent_handler = wpcm450_gpio_irqhandler;
 		girq->parents = devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
@@ -1094,7 +1106,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			girq->num_parents++;
 		}
 
-		ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+		ret = devm_gpiochip_add_data(dev, &gpio->chip.gc, gpio);
 		if (ret)
 			return dev_err_probe(dev, ret, "Failed to add GPIO chip\n");
 	}

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
