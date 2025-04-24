Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 987E4A9A601
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A559C7803A;
	Thu, 24 Apr 2025 08:35:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 776B7C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:45 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so370019f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483745; x=1746088545;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=;
 b=h/3/ZPty9ILVDUD5nTqTU8tIbuSdNuVIqVG8FgGSI/moFKumOZx0W0iuy4DeUrkJ1S
 L27y+QYen/wIrLme/XgfR2hpa58f41NHqNb80kz9LCcN3zEs9ayx5lxjf2Rx1hvo9Dy0
 RKCTAZIv8S6Z0N/vW70IqqrX/gugunGVRGlYZo9zenq9TgqE35ro+38EbbGmJdihJNLL
 kob6DIaozUL5MQ7/2983ZVZvtqoB+A9az6L/BuvH3MrtpFpBslFcJvwKjRZ552JCTI9v
 +AHkKA78xxiFtH5yD+fhcEJSXNVcZ0z2L42t3IdS/DB0MS+KfLGMJAkz5/gvZogYfD9J
 +qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483745; x=1746088545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=;
 b=fg+U7vsZJBdLk8kiBbPONgFteyKak6dmM0VYKFwv0iFnUPD0SnfJOkBCNAIzrMrJhS
 XyIUJUp2wvI5ouMTcrQnVG/smf7Rshacw0hgQzV+bILEZdkJydwhUgK3K6uN+PxwMNVc
 zNg/0fgtnLKp+6uY6j0BBFbfvo/g2Lpw3K3Lt6jGiG4Dvx1Qzt5nnyvuX8VZ2TIE4xQm
 7KoIpX/Qn7afav1LINxc/zadNDBVyU9onbHJfJoVfb7On2ZoaRTDv4bH951xPCj927RZ
 yvaO9qGyr+vGo+pG3tD72ecJXjxj9Ppsg/z6ccO1uIqLZZPBbWEnsZbyUGMTxrHkFg7c
 fQlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1u69qpf5RaI5wPn4ycMDE0sm6GVl0nmQG6iV1tcG/5xU4+QvOLn76tC2xISVyrc009cedPki6u+9krw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy19QmSpGU+xlgvI6gzSZyF4WadwE/MlLMHXfuHwYrieWEw9opl
 F9qEqfhsn3dKofBqQxe5oIRlgIr8Q8VRG+nDBvMwTYT2MwiGiNoKa/TrDQFDWhA=
X-Gm-Gg: ASbGnct2JYn2y05TZUUlaVHfYsbUwgpWW+qy5HixF1HE3aB8I6Jsdd05a5hsTh9X7hn
 Cgiuj1gyR/VN1fCfd00S3xu2folVKAOu0T6NBeTJjMbzphhOwLJqnI0VCwivH8qJ6cU7uYlQs20
 bpgZpqtdv4wg689NhFCNQ9MrQZ14RVjUBSKFSD9aJOtVTP9DzotY6ta8GtXVdxtH7twrkyakPPk
 NdHXvu4hm5foTgmwGJlXxhmugRy+vMb3S0j/pwveZ7neIY6BpQ8sbXrW1Q0mYbzvOcrbslZqt8q
 Fgd+lvKU0GckAmeX1sdDedB75/VYX0WIAQ==
X-Google-Smtp-Source: AGHT+IFDVvKbqbQCc57anrhr3bH0NS/6VL2EdsqMYXAYy4mnb5bctdCFuHC/meZO5Slm/+f4y8xO+Q==
X-Received: by 2002:a5d:6dac:0:b0:394:d0c3:da5e with SMTP id
 ffacd0b85a97d-3a06cfa827cmr1289003f8f.47.1745483744837; 
 Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:24 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-1-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NXF8n4jsfSDUE1BwCGs8Wk+0RRESis4p2gxPAXy7zJ8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffaXhDusyvG2co2zg72Y3EMPUiJTRQhwls9L
 A4IcRn6OQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32gAKCRARpy6gFHHX
 cuVND/9nSgA0+zQ9BeJQXZoMGuPOSsTcd5ft47Rz+PFTWcCHc4gR74Yyz1JYlyFirhQukhrZAI9
 ayiFXnxz+DRmalcR1GNyRp4UmxjfYI1wfEW3L8y5MnQcO1xGJbk18AH+8RIGEJK5bRuv4fHUVrQ
 hV5ZOjao4hJlEt7td9YYxtgh4dx3OQtkph4SzY4kYggtKJNyiEdBhUt3yKo5X4vJsScfQFScAeZ
 9tBfdkSdQ7PY44zhvoxhHgelLEHGgOf7F4cXgDFND3fCFTV0jF9HvcFlkuW61NnQMA4hhPQSpes
 MUwQAS6ZnOwGhcqGhL/dWY0wHaDY/ywabZ2WxmMvLXd0rkXASERgtzoNx1/nzEm4XUa281iA9i+
 NeYK2GMkjsvHx5mn3iDvcOm56nmHsYYA+B3+lORaYVlfkBGZi7KWn9k6AMFlrRiGjlDI/DsTXMk
 L7kUkgUM2YFu/OzEVuRGfn6PsJaNRMPRd3j2oXyPU2Cy9/FdtR9PYoDUPawCqcNCW3PMrdBK3az
 aDqqARtQvzIv83kZ+SO2+LaxV71ruxStTfiG0t21+jh44hTZ8WLJ6Ouy7Nl0j2EGifuRrliEQRT
 YuPhpehkhllAQkPp0iKlVgp1BZIXa6TuItEJTbieLsPUNSHwLC6xaIXRprIiBc8Zg1V6/wlbzte
 W6EmpFQxkbAr0NA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 01/12] pinctrl: amd: use new GPIO line value
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
 drivers/pinctrl/pinctrl-amd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1d7fdcdec4c8..9ab3a7fc3bdd 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -101,7 +101,8 @@ static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(pin_reg & BIT(PIN_STS_OFF));
 }
 
-static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static int amd_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+			      int value)
 {
 	u32 pin_reg;
 	unsigned long flags;
@@ -115,6 +116,8 @@ static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
 		pin_reg &= ~BIT(OUTPUT_VALUE_OFF);
 	writel(pin_reg, gpio_dev->base + offset * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
 }
 
 static int amd_gpio_set_debounce(struct amd_gpio *gpio_dev, unsigned int offset,
@@ -1128,7 +1131,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->gc.direction_input	= amd_gpio_direction_input;
 	gpio_dev->gc.direction_output	= amd_gpio_direction_output;
 	gpio_dev->gc.get			= amd_gpio_get_value;
-	gpio_dev->gc.set			= amd_gpio_set_value;
+	gpio_dev->gc.set_rv			= amd_gpio_set_value;
 	gpio_dev->gc.set_config		= amd_gpio_set_config;
 	gpio_dev->gc.dbg_show		= amd_gpio_dbg_show;
 

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
