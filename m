Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 552DCA9A610
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:36:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16A7DC78F70;
	Thu, 24 Apr 2025 08:36:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11B6AC78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso1272071f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483757; x=1746088557;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=;
 b=UEK8YfiaD+9vr5FemTI4LnuZjeL7jC7SkLSGk/9P8UVEBEZTodBnJMrw5yRlRgJHaM
 LAn6A4OvI/zn8UiT5W9O+Hzxc1DYtRnjR3OswEoNKa2lP11rzcGIBuijmAvjlX/FCtgV
 kAr4sN/stXML7h1SF99JPPdVLCwi7Rco63O8PfJOibtziy14XHeZzrl/u8HJKHSn0oaQ
 fOyEGnseK53EHTqPYs/e2U9ZdLDdPqo8u4s3lt9VJkBTCyKP9bW4ur6k0XFT53zFABn8
 t/XpYnr3uFF4rIPOslbSnkuWnRfMf2ZYVaI74ZTo1SUESC5qCC1iT3H+7M21OVeqyt7a
 J1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483757; x=1746088557;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=;
 b=N18kHMEpWAnPtJF9uEjDOtXUqUjqhCA0kmjx9s4WrVq1nxCgHE2vcYX8T8gWFnNtiW
 pysF0rSZydfsGiksM4dX4A4uaJVYvW4G/1pmZVP2W/B0VdSOFl0eG3XWgR5oMXNIk22U
 vZ510rfJCRNcs+NbnK7O5EKasfpO+Yp+4E1qe5ZcNYo+FXAMZYLV7LrUwrXTCzBVF806
 hUyUCq+QQ4+RRKtTSOG2HSDaV7GgP6K+EqTlahbx25JCAS95dvIgxYnytTtx4ByEdMbl
 1WfzWeRf6ubPnjbgpXZoV9+Cy4QxXUvjpgvH7m7H6FWgYyaTr0jGlFX98LQeQneEREvT
 BBfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkuLYFksLmT5dY5L8IDpRH8zvZZX0HJIzDgeCdDlU/dBqL01NtfiBYknU4ZTDAWn2bCUqvVxod1chCbA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUo1ktFxpOar0u2Y3743IbZYwGgHLYaiARusDg3f2nDYRENUIG
 +0ruHm8E2wj8f577KcasurBSnWXqB5Q9TdpUX/9LG50lD3wRNwvusyebJnuIih8=
X-Gm-Gg: ASbGncuNdLk25KYWlzM5DHlwX9czojzADkQmwSpHLrZZmG4PwQRtNPvVq8F6LO63CpI
 M27iXxvI5iTaL9mVG7d2wmwxNfxnxoppL4EZ7mGAhVvgnng7MVWek5qPvE+FJI7BdNEz7D+ysBd
 z6CPtZWOhHqqjYws/CeiyZw+3eBd9h4H9eHZZI+MHrMAUrmf3BiE7MtJXXu7EDNSqjEWs979AsS
 KXS8CGalhOcvzmzmpgqVhq+vzU2HmomS8k7GWAssikWy4YgkImMTv8Beax8Z/fpLAP+sIE/LmaI
 d9xnV1qV3F+9UHbDVfp7aL1BbazFK+uL9w==
X-Google-Smtp-Source: AGHT+IENaOXvdDwYvVzyNmm1O+wEFBO9qUA8eUmPoY2h2uvx0EEvGioW8nnYHrKcqYKrpStPrZphsQ==
X-Received: by 2002:a5d:5f45:0:b0:391:b93:c971 with SMTP id
 ffacd0b85a97d-3a06d6ccbf1mr1169019f8f.20.1745483757511; 
 Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:33 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-10-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=W0QsCqlj8k41jahpfTRdRwpb75wjwAEccTgd/iB3NSg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffdShQB6dZ7am+8Zlg1v1xnScSWHPJ4AYGjK
 IuNEJ72zDqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33QAKCRARpy6gFHHX
 cuhZEADgECrorArfyzL2QuJa6yQe9bYHLOnsa/SLqp+XLhf+MogYfB88ZBg52BGEy/260WhH3Ar
 TlDxqbNf7xbsDCEMp1QlhFb4S9VgmBKrttwkTGhgoD+3LRdby7tIt4OwKO0GaTXYE3EygwT/Iq4
 hrU6Se3dlBrraDvvMiQVItwNzzCJ5SvOHi8lE1jFQth6AVN9W6GZd7je8AWawFv9Wg+i96C71/A
 LL6g8qzLyWM1U7sLiXvQrnWtJb8cpWGNMce6jMz26KrCpwkGpSbuzMq3e2dUk1tv1p+UY0MPwi/
 vfA73gllbSX9IPwu2Av/fHUnl4unuBzzo0wEISM+lyZ8KnlWAqlrdIlHQErUpPBID7F5cyZvpih
 1BvJFjIXMf9xEMQTYWcV4ACfgEUhp6bG2VvvMX4L2/j/ZocIsseaEAYNaPIG+I0ZtApOV5Ne6+U
 5E3cMbN5dXT7ekyY/sIH2McA4ysuJK0KPhIYnYQTPu3McsIx5MqljY49PQMhiw+qVV+O4EfYUat
 IOA3xFTiPvKuoi5huSr1QFG7EpE85vSMix6o50VA4BcT/jlgxeoo7ufpgZmYtUTnM8aPSLgVucZ
 ReV5VoN8II+I+BwyBlmEBfbL8iiEwXA0A/4funmEKDVAplmX/KfHafRvfXnO/2PdS7n7YpqLW0L
 IeczklCyXpDVPJg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/12] pinctrl: armada-37xx: use new GPIO line
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
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 335744ac8310..18419920c33d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -424,15 +424,12 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	mask = BIT(offset);
 
 	ret = regmap_update_bits(info->regmap, reg, mask, mask);
-
 	if (ret)
 		return ret;
 
 	reg = OUTPUT_VAL;
 	val = value ? mask : 0;
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -449,8 +446,8 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return (val & mask) != 0;
 }
 
-static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				 int value)
+static int armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				int value)
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_VAL;
@@ -460,7 +457,7 @@ static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	mask = BIT(offset);
 	val = value ? mask : 0;
 
-	regmap_update_bits(info->regmap, reg, mask, val);
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -513,7 +510,7 @@ static const struct pinmux_ops armada_37xx_pmx_ops = {
 static const struct gpio_chip armada_37xx_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = armada_37xx_gpio_set,
+	.set_rv = armada_37xx_gpio_set,
 	.get = armada_37xx_gpio_get,
 	.get_direction	= armada_37xx_gpio_get_direction,
 	.direction_input = armada_37xx_gpio_direction_input,

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
