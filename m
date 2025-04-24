Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF501A9A605
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE8F3C78F68;
	Thu, 24 Apr 2025 08:35:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82951C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so451723f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483750; x=1746088550;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=;
 b=2gqD1LDYJJueoxu6cRmpVcuGlE+dwhkiewMn/QJD39QJ+Xy/1cyEmDmcqzh2WAnw8y
 ZQJ8CRF8MB47gF4x9B/xW92jAewswMC+MBNZVgbxSHNl9mcmGIgeRj20W0z7xmY+DykT
 EqUPieAyiqiMM1Zm5lFwN0EfLSLpSwOGcZ2uHEN8E417rfOkpsfCXV0NahHIWlmzyfWC
 xHKpBokZH4rTbQTLBin1CBysQ4GwFHg71M22/cno8oz7OsAeq9dKIUbRgoqo5bi3kdCY
 tBjpp63TlpJZMOFP+F5G97AqPoBZ2H++rDu5xeIt+g+KY4IYYYERnnRBP1lBMtNN1PIQ
 cUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483750; x=1746088550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=;
 b=KIJYymnxjeCEgRW132VOTQSKbixgGtalvzMEwBHRj6Ijeh/K/M7cCvHXpyK3NHVlT2
 KIadEzmURqIzq5H0NjbaH4sL/lXDZsQWqMSrDCYo8nac8b8vORjNr/1FRPkME5uSRwy7
 EB+rH37yRDwaqfEH/n6YN1BO69p+JnTybrgpC4wMEomTpwuXe+tqDpkR+Em/Et558L0p
 M6tfndHrXjjZCdPGT0bMeg/jQHhAdRFYXL1WirB9p6r2Xk3/t9PoIl9tNMbCbiU0KdES
 SOeuZkwOp7T/U27xZtFQtKKiSS8YvJFceG6sA3OmiKgipGPtm9uDWCogKdlrVSIvej0k
 PCAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEuOxryy2pgLygN+BUoH2ATQeWphFBIJCI49tpylQ48zT5NIWOwCtKVIRXDFkI0sBWpWbuUs6Qj05WWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOCCHUB6Y0xUAdaX6CiL7VwD6+AR3gN/h5Y36+6VZbPjFJ70OM
 C3NgQWzTrZnQizxzXQQuhNaF/AVGkypRbahLb8+rS3DaAMeydI3WrH2HGCVpctU=
X-Gm-Gg: ASbGncvZqRGSccVxgq5UmmAOMKbblZg82FZYybCms9/qqhXnO+BYJ/pa01qR1cFbuwb
 sfLMZWQ4EMoqk3hFX2qqs2A2e0WmszXZpXJ13lea13frrl4+zBwku+BVOJ7Ioss+NO1u4Fb8rWX
 MJIIHz0sixyd2N2+RmR3UPz0Wwjo3Di2/Bw+DC8t4n+m5BOFR4RZ0tCqoMNpJykOuRqRxyelQ81
 45d5SKRq4pgEZD3oxdLbYDDuPOm1ep3PKKJGPuBV0NUr3UVNtUue3i3XjQokt7ZOGFyYAsfJSuB
 AMb3mRpytlQRreMurEdf2idrEzv8UJ3luA==
X-Google-Smtp-Source: AGHT+IEsWzX9QhjOfL10bahhvABCZZd6/bNw9ibC716v4NWqAwsMmmJhcU6LjMO+0JhmAyeRMjtJnw==
X-Received: by 2002:a5d:64c7:0:b0:391:4389:f36a with SMTP id
 ffacd0b85a97d-3a06cfaf773mr1144784f8f.48.1745483749924; 
 Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:28 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-5-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AUxJDyiCjGLivQstc+QVCLPEZx1XbvG4rMuoF9PwOpA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbJ94gWt6uen8xm8HSBtLyBXeG+3LKxm5Ag
 6RCSTsSwR6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 csj9D/0UiFkS9Foeto0KsdJ24lw9fG4urXmVGhvgv6seCM1EF6eDkw6PCKi4GBqQSeq1yabajRg
 DJXMHRA2AfiRzQqGNnP+t0bEm8pKAY8qKJDpI9ThBQQldJkCol2eNZiexSOlIp+HB5u70AcZKJG
 qzk+58HlR9pOEUN4kaRpkfYa6HeEQH9adnDnZuTt0IzDBPPWb3fefH6xfO79VUAhbX17E3ibf8w
 Zh+ugo2z+8aopq+4jxhsFaY/KgyoW4cURWjpX1D4fFt9WO2EJvHFAZ94pCGsBCDNkKFZDq2PKfl
 VeM1bBsgYFnn4dOFhLSMUbzeN/aEnRIePjyQpJXjmW3l383Ii6unpjfYe5r8UGQ2agPamvsXk79
 XL+90Ned6wgRaRoItB6reFmzOlTkFWVuhDpYtFw76WlTHXdRyuRcHIeWW5GTCbR6T2rwtazHM86
 hTAJY0qL5kAqiwBym23NK2AyHgfDiQo6fLLXkD0L0lDFqeViTNAC6a6ijPeWzs+O6wwM7z9CZCq
 jjCiefFTzSCKU9C2IN3eaizpunc2bYNq4i3MgnxktLJTsxHsi/WGrNlEZxasOkPIOphKYHzXYsx
 n6S2A6WN7t2UBoUeNEArpG8J57u8CB6stqeMrr95xzc0vVgiX+Jxvez4AOXCcBDYLfmDSXTsOwB
 ehvgs5t3m2Tkw1w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/12] pinctrl: stm32: use new GPIO line value
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cc0b4d1d7cff..ba49d48c3a1d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -228,11 +228,14 @@ static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(bank->base + STM32_GPIO_IDR) & BIT(offset));
 }
 
-static void stm32_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int stm32_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__stm32_gpio_set(bank, offset, value);
+
+	return 0;
 }
 
 static int stm32_gpio_direction_output(struct gpio_chip *chip,
@@ -308,7 +311,7 @@ static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
 	.free			= pinctrl_gpio_free,
 	.get			= stm32_gpio_get,
-	.set			= stm32_gpio_set,
+	.set_rv			= stm32_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
 	.to_irq			= stm32_gpio_to_irq,

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
