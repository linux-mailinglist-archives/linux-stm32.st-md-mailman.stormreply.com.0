Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C11A9A602
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 690A8C78F70;
	Thu, 24 Apr 2025 08:35:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA298C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:46 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so557328f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483746; x=1746088546;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=;
 b=BGBg0m+PzNUi+0s+bWqqeewFx+Sk+H0Baod2dVGHmRJ9g3gn1G89Cf8VR2uHFCB20F
 unmNH93BN7TBcwl7FYCi6O0GVzibbnZhcg9mTNT1AtepTMHaKCr7fbEU9rGFwB3aM/NF
 s6Vpg83Bx5131buhjG6Pu82NeI787t3OjDlUPsMHkVrxR65rNKnRXyQWmtVyjPeBGTVr
 mO86eA4y9sf/hPmkgrZJViEfMZRKh3a5amPLkLMAwkCGzTvmf3f9PPHy/864M5cN+Isl
 r3u2IwdFGIbAC7cGTZqpBYucpA7QZYt0mdF2VORpEjuMqGm2UC+EVdd3VKJa14VIttlo
 FYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483746; x=1746088546;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=;
 b=m1dEVU/HY57Bk2Qhi/hiF8b/AsYhlSzfkTYbx0BDHWxFPUMB7DUU5YaLUoOXzN8Kkd
 ZHKaTv3Zu4yrLrguEBV/QcxWq3Oqf635Mn/Ym2VT1QnjiElIg8yTiPfwY545nHoPLkjV
 tNDf/m3+cqNMH2aKC6wvdIVZLETGnZzeWieFXgdbJrpnjGJx0vdklm9QJowASyUrItWE
 UJ8pn3H0y4bFk+ajHlDtiqq/RmzGJlrkAcstUJPbOERHRNqrmiKbecf4VNBlVjJ2AN28
 FcgvdoF9dmKOT8/kSVtH169g2/A/EEc3S4Sl3DBsXF0MOLh+V8AYaX3IWl6RBsm+VXGd
 d9yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoxHunsW8tlDjjVOMUTGnzgtFHXesISd8bBmTs0nmkkYih3xwzZWQd0C8rWvY3Y9LT5RS7uFcKwtcroQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx38WWi/HycEFBwgu4En8+Nmw8CVK7H+qQ+GkqDw5e3X4AvqXFa
 /yLLU5aEr1z1tGtSJbJbhmu9DS6RDyDHouIlhaAKiEu0m6TzRA9/l3GCyCUNDio=
X-Gm-Gg: ASbGncu476Cox444o2GQREAu18w5azi1CZANOE7Nf5BpufwyAtLab2/pakFVbmzogRe
 cnodYXfUHUjG7Ncfxwb3IyXWBVoeXva/925lzjAA2ePKNOqookKV0DlMCCxsp+SsynwNQzkLjse
 KuITSSHbb/knz9YC3Tb+AOO+ph3gBTH0iuTYaT+FqNEa4UGEZLOrmp0GCQr62WovloEmCkUPMvL
 nbB2HAg2cp+RVWIk1Ip7t1u76g9aQX50kv+iapQvepwus20ezZ/t6XQ3zgRDKyHB4mhvUvy4vB2
 Or/cRvn99+G4R4KQNu1L8kFfnM/DnmyYC0Sn0y3jqSig
X-Google-Smtp-Source: AGHT+IFSD6M5XIauG5i+d/G86hFhT7OFRGq6PzYxSsoMAu4S54uAZ/T5Wwmoogoet09ubvq4IMvYRA==
X-Received: by 2002:a05:6000:40d9:b0:39c:1257:ccb0 with SMTP id
 ffacd0b85a97d-3a06cfc5660mr1453719f8f.59.1745483746115; 
 Thu, 24 Apr 2025 01:35:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:25 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MgZVjd8Gr19iJhQk6NvM15O47jgqGqaBw/RcQkb1G5I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbYYgK3T3LpUSxYaTlg1RQUUtOaeq8+GZ/u
 B4TY1aYiK6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 cvwwD/40PM8MvPIIjKYdoBuWnigqXm5J9mOEAwo0IpSBLk+1NrZtxCDfCUtfG8qnkKxEdr1VqG4
 6mrNRSEHCZifkUpZsd9j1/qqvkSUckanWm+w39DVs4zsSka65n9Bs7dnA1+SGrLrp+/n9+P9MtA
 lM34+iNO1T+9KusL6PqVvKAu6DGfaqw0bjecp2sfpta2zPtHwxq5lXFxGkHaVkPW3j242bQVJMo
 OxU8NDepqb+WL0fZbMQ5rqRKhws/pmHzh0pc5fdiELlPOWlqNBOETuyxmgi82zYE16/chG6xgPg
 216JJsncREoy4zCWFVBbrBbv9L02v3bDLnPh1zhIKESQaoINtG8bkwtev6qRPVd+uStU/2JCH1h
 f/3D4RxLWdmhByFfRbHoUjmxn3VBuJUSKbeUzyaGHvZVssXog9TpvfZNQRiD8Nkuywe92KjurAL
 x4uNTJbbQg2fqiGNI/E4uyxLmL6I36TMhM4sdLblDwJOg+3+tre10Bw+4Q4tLTdpFA8bKBEGGIy
 Dt7XbALdrhuOWIk+0uCG26vCYBKMQ1+0mx1U0lFdEYq41NBloLCpS8vfdFqZJHUAvS1fmmQxdhM
 YEp5REgnyY8mU7MnN+hxKUIp8gS/se+notLxKNO4OGMY/MQYx0CS6yrgP/3P85WACR2SXZyoMLs
 4yNJiAOsNG12c6A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/12] pinctrl: axp209: use new GPIO line
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
 drivers/pinctrl/pinctrl-axp209.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index 2b4805e74eed..28ff846d263a 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -192,34 +192,31 @@ static int axp20x_gpio_get_direction(struct gpio_chip *chip,
 static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offset,
 			      int value)
 {
-	chip->set(chip, offset, value);
-
-	return 0;
+	return chip->set_rv(chip, offset, value);
 }
 
-static void axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct axp20x_pctl *pctl = gpiochip_get_data(chip);
 	int reg;
 
 	/* AXP209 has GPIO3 status sharing the settings register */
 	if (offset == 3) {
-		regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
-				   AXP20X_GPIO3_FUNCTIONS,
-				   value ? AXP20X_GPIO3_FUNCTION_OUT_HIGH :
-				   AXP20X_GPIO3_FUNCTION_OUT_LOW);
-		return;
+		return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
+					  AXP20X_GPIO3_FUNCTIONS,
+					  value ?
+						AXP20X_GPIO3_FUNCTION_OUT_HIGH :
+						AXP20X_GPIO3_FUNCTION_OUT_LOW);
 	}
 
 	reg = axp20x_gpio_get_reg(offset);
 	if (reg < 0)
-		return;
+		return reg;
 
-	regmap_update_bits(pctl->regmap, reg,
-			   AXP20X_GPIO_FUNCTIONS,
-			   value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
-			   AXP20X_GPIO_FUNCTION_OUT_LOW);
+	return regmap_update_bits(pctl->regmap, reg, AXP20X_GPIO_FUNCTIONS,
+				  value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
+					  AXP20X_GPIO_FUNCTION_OUT_LOW);
 }
 
 static int axp20x_pmx_set(struct pinctrl_dev *pctldev, unsigned int offset,
@@ -468,7 +465,7 @@ static int axp20x_pctl_probe(struct platform_device *pdev)
 	pctl->chip.owner		= THIS_MODULE;
 	pctl->chip.get			= axp20x_gpio_get;
 	pctl->chip.get_direction	= axp20x_gpio_get_direction;
-	pctl->chip.set			= axp20x_gpio_set;
+	pctl->chip.set_rv		= axp20x_gpio_set;
 	pctl->chip.direction_input	= pinctrl_gpio_direction_input;
 	pctl->chip.direction_output	= axp20x_gpio_output;
 

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
