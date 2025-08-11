Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D7B20CD1
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 17:02:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C5EFC32E92;
	Mon, 11 Aug 2025 15:02:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 240B4C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 15:02:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so40896945e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924528; x=1755529328;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
 b=Cm22pqN9oUZ/mU5ncDZlYg0yqiMX5pouJAATo8eZSvtjKOevrJR0bAHwY5xTxrHWOt
 BOJv7Yx68rIogr7GUl+sxGaxC2jmsbiBdaPm3ULYrXmjD3eyFivWjwTARUk2L7bwmq26
 ZbVAXrQ73sOjVnX/lF/O7nskPWMmqS/hcttqJ/yJ7hMY3AoYxa/OafhXiQHrnP9tyOl4
 Og99P9QUVzkNr4VsQ2USNTELTrzSt5cP+NmANkB0vEGHnrKiDku+zFpGKopQwGSciSEm
 1jx9wriZazqf5xjJ+wDdlCyjQ+tnb97MhAV3tUw9oF0mjL22uTp54VyFQAbWz46EIi6v
 WXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754924528; x=1755529328;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
 b=ET0zWoB5xiKQAUqg9UhBLx07EXLXiDpnZCaqwpKOE44t+bwPeJgNqB9b20JOj/gfMx
 BMTmn7wtFrO2xX3kYwNSeg5ue7IlaQf2dvPs2zMFpFX1+Ue92e0bQmgdckxPEryuraz1
 9/SGXhGVZJ3IIGClxis6zzTVISPKNeaJVidU28OzCibMrhZ3rzwdxgIl+tsjAQSqziq1
 ONzLU/97HA2o1aq1uSIIvGlIHk8XtNyxvdMN9D2YHJo0FZRyMoGESYkmjsNCfOPvu9Xf
 7if9awixDR0Ekj6QLtyyoIGiHoSTUZ/cnY9TwNgMSlo6JRYLobC6by9mqf/4JYEKytS/
 ePpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZxclSHwVK+Kijf0kSctMPgDt97WJq9HuFqn6ebWPjGrW4zPk1/BLzt5bVgfScLug9w0tiiDzW5ggj9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yybi9G5w9qN/3Dsr1vqwZCtlHgU/+LrymrW8XD/r9C+F2+kHVCv
 6nU5dnk6pLY0r0VTMyAKmvOKhlkjgf2jbtNz8ljjknmOJzbBL79VPqqccoZ5M2V07ak=
X-Gm-Gg: ASbGncsMQDzJwl7r7wQcIqD0YrDRAnYWVRoscl0bCqVP13yfnsuomXg3q4sr+VqcFBi
 Y12Nx2BaQvzdhTTzmjVsHsbVMp+rTi7GCPohY6zt1+WQW7VV5/bn6IMS2V8NrLb+cD+h2lpUmsm
 aXwdNpWx8TiVozaD0iiMaSAL+TKTn0VyzzPr7NdVlhdPs4dy7e8gp60E17rh3WJ0Tqt60U+J4N5
 qnkDW1GpKfEjfeSUuAiIrIAugVtBlw7k8OVIPWrWgf+qPwG38cdo/BkCHUPlt8I3Kg4Y3Au0/B3
 v/s6FI3k/t+zwUD7fEcvGjHNeYxSMuIns2PYwxQLBAikQyPR1aut6LtrLq/TvCTrCuu5TtGeuHa
 5UA0mCoxgK2wSHSxQ
X-Google-Smtp-Source: AGHT+IF+THEVCFuwYQu8m6VAawSu2em0TIQUS3g6fESwp8AcQJ26VNGTNiQ2rv1tKPajap4Wv9a2Ng==
X-Received: by 2002:a05:600c:1c2a:b0:459:d8c2:80b2 with SMTP id
 5b1f17b1804b1-459f4f3dc83mr97971385e9.7.1754924528440; 
 Mon, 11 Aug 2025 08:02:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:02:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:00 +0200
MIME-Version: 1.0
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-1-a84c5da2be20@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TAuKojjyD6nAKERqSGd5+r/u4OVzV5ZEvxmxS/gEado=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXshqBLlfnYFEFYK7uY0jFJFrmHe39l05Pcs
 k4vccla8yeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7AAKCRARpy6gFHHX
 cg7AD/9pgOoPP+pShNjLjROnRjG6ynKjPXowGdW0ABn5sAkUvwA1fgSz4BPTxcdOu2W+Mj2vZHY
 XAcoX6QuhsYKer2Ij7zEVCFDSd2+udUclQR6z/1sd9VJkcvIU/Cxmh6o9S7S0eDGNlXT12iVKcH
 M/EkMJ1nvsruX4Gt7mIphpAl++6vvrv1+745OgmVHhYKFicEpzEly2P+jLkiVq0tISzg986/vRM
 xFCBolAsRNun3fiE99GiiaYkwrse9aR+2q5bpAwjohDzgbwv7ePgGXUzf3KRK6d9zHvxvqa7e12
 mO1pIUTCB+/Omb/OzwjvQUMJO/mPYXkjGI1HfCz1gUZvJgCVyU64A4HjqjN0eneS0mZCRO2jbpO
 /Rhq++1FNkVt7HV086RTI0wGxd2K39LvS3fGyOnmmCc4LIpwL2edcBYSL+hEpZHA6JnTJLGGiMN
 atUmuiciLUCWrgWjBsmur3+KrCq38mMzE2A4bifdCDU78T41+OZ6jq+hvXNGpfE+TG2htol6EjV
 0U2MhDMYKV0jSaBCcphL9S+4OBxXL5+APecu01nQ+aNi7mmSNo7JzdDRQGVXvXCd0pq25kpcZiN
 mVTFPFtmbX3ShdoJ3x9oS/g9h9rgCONYNuSoHzUQZdGFjsaxJE0IFwgrNrOHSNgUIG7b27lX5wn
 kWen1t/i4XapRRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] pinctrl: stm32: use new generic GPIO chip
	API
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
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index e91442eb566bb21f7691fa14fcf684957eb6549b..dea49b9aabf2aebbaaa3cb33c8add9926972ed9f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -6,6 +6,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -45,7 +46,7 @@ struct stm32_hdp {
 	void __iomem *base;
 	struct clk *clk;
 	struct pinctrl_dev *pctl_dev;
-	struct gpio_chip gpio_chip;
+	struct gpio_generic_chip gpio_chip;
 	u32 mux_conf;
 	u32 gposet_conf;
 	const char * const *func_name;
@@ -603,6 +604,7 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
 
 static int stm32_hdp_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct stm32_hdp *hdp;
 	u8 version;
@@ -635,21 +637,25 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable pinctrl\n");
 
-	hdp->gpio_chip.get_direction = stm32_hdp_gpio_get_direction;
-	hdp->gpio_chip.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
-	hdp->gpio_chip.can_sleep     = true;
-	hdp->gpio_chip.names	     = stm32_hdp_pins_group;
+	hdp->gpio_chip.gc.get_direction = stm32_hdp_gpio_get_direction;
+	hdp->gpio_chip.gc.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
+	hdp->gpio_chip.gc.can_sleep     = true;
+	hdp->gpio_chip.gc.names	     = stm32_hdp_pins_group;
 
-	err = bgpio_init(&hdp->gpio_chip, dev, 4,
-			 hdp->base + HDP_GPOVAL,
-			 hdp->base + HDP_GPOSET,
-			 hdp->base + HDP_GPOCLR,
-			 NULL, NULL, BGPIOF_NO_INPUT);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = hdp->base + HDP_GPOVAL,
+		.set = hdp->base + HDP_GPOSET,
+		.clr = hdp->base + HDP_GPOCLR,
+		.flags = BGPIOF_NO_INPUT,
+	};
+
+	err = gpio_generic_chip_init(&hdp->gpio_chip, &config);
 	if (err)
-		return dev_err_probe(dev, err, "Failed to init bgpio\n");
+		return dev_err_probe(dev, err, "Failed to init the generic GPIO chip\n");
 
-
-	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip, hdp);
+	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip.gc, hdp);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to add gpiochip\n");
 

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
