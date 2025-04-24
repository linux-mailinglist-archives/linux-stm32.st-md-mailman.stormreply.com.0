Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 152F6A9A60A
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF2C2C78F74;
	Thu, 24 Apr 2025 08:35:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5701BC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:53 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so674193f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483753; x=1746088553;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=;
 b=lDNan2HJFiB6yNba0WXy3R0nZlxdxs/0gxDUeHcp5DLufhb0y9f8LdZ4nH2kVjRnIp
 GzwCWZxcPNzbGaaz5DlKR7NJIPIY+wTl9bmCI7cTKKIN0AhcagDI4MHsCrwONHxuaZ7X
 9Xg82lW6a241QdDqagz8zRtO/pVVkW2S8tOcBjk2LPql0cTOElUmR53ifXRhcg6zNeSp
 evIzDW60w6l+5hsmVdd4tVYbQ5Kq6EjmOqPT/7lDYXOs9mkMVzrnT0rS2OpIBON8F/31
 KCIRBqQPgkAQZAdfz9YHPAAkq0MG0+1QAl18RueaSDpU0Sm8pVp93z9c7WVDW/QWz3bO
 E9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483753; x=1746088553;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=;
 b=GiyHcBTGW9cWzHq7+O0Nd2iHBPHFrF0+G0703Vlbj+DQ0UjArat48QmTUwRTiYLfch
 lR+M9L8EKcofUvq1jfbTkRF/XpeltKXwrYAVhXyrtrZECF2qBybEClxQN+jItN9AanyN
 nS9RKE2DOufSWOqRZ2z3fEr7Wnp9IbF4w/QcTvQhOIegbDKwSzcKmY21wNd2eTCMo0CC
 oDE3ihTgt7sTGzOSC9dG9SoLSWur5Z9I/QR/IlO2Sh06S/cR5dbK5bTuROGkcyUqIxpQ
 ci8E5FMsHn0xdev5ULnGCerpWq0Bc67b7L/tOg0K0iu/UtON1USpjqaKvk9/1434QQSG
 RewQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHJXGCesOYp6ODTyPUhhgEPWKpY8igZvhr9+FyIb38c1rJ14hYfGaUiAo1UuamaAEC71DMDY30PJCBoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxgYMqK0GQup7j63T2KWBLwpDF9NN/u5H0m7mDC2a47qNkkKxCu
 PEsplHC6gpwIfCR1ywO6jIRmbpQCD0hajvs3JNJeR8W+S1mWcnxC0MhCXrEHBlU=
X-Gm-Gg: ASbGncuzrp9fxbShtaG/wA5V0ItM3MVTgYsPzD49H98tScfs3D8EGFLUvgJTgoAIpvn
 2hmyyFGWhV1p9VSF5ceC6YPcVEokmgP2Jr+Bq9REGw0az2FIBMVwrO8giHZHOTOrDeoE6LWLLg9
 C4Q3LVvMVfPYzwUoG/EA5qd/EjBfvKX2aCuRCdNObC5dPHAToeL/GTMzVJNAR7c/UD4J7RqBa0w
 PSPeWkblfXCR9YPIF+03IZB2g8CHbXoELZxmppFpy97Ulwkz7HJCVVvojKCaLoAOYxirhzECKRp
 HGby6Is5odcUslfK7cEfPBCrSzMgXMxDLQ==
X-Google-Smtp-Source: AGHT+IG3o1AaNixTqoPOuTrDe4rgeHySd5Wl85X8/9jI990OIrHcrjGyGtt6SlYJ5x6wKjhdeetSOw==
X-Received: by 2002:a5d:6da2:0:b0:39e:cbde:8889 with SMTP id
 ffacd0b85a97d-3a06cf4b8b1mr1481072f8f.6.1745483752816; 
 Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:30 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-7-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hcMZFoYnI5hp40Tp/W2N8GmsL+thERqAp1Vv3XxYVkU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcYmgESeviEGOC5kHsGWpr6OnT8URHaFb3d
 S3spkaFecqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 clPXD/9J5MN41zDFuquWy4Q6I9uR28p6IAtPRR7LXz/y6HhRCZs0LiWF/a9Sp531rqlTtvTqIVW
 /jA+xhxcVsKGb1W9fkqBRjICm2Ro/34KgxGJHlAGa5wi4Vq91hNc35+VMd6FGA4b0ebusHqdncD
 hYR8+ONdpy7mHPSADm8ug9QuRpbU9ky8cTjhHh8jeqte3aiuHmSqbSmIhpOBSYhR4dfGErwJNLO
 jEiuhnPpjfz3zljaEzY1fOlKYEFP8/pAPybaVYYoKJr3wgwTbBA15A7YuZfbP8rFhh2/KZWMQQ+
 uXhHsAZ1AQC5oK6kC8WXp32lW4yifh/SOlhzrWpfYxWuYChMUvtajzoVHFm1z1BrEJSdzbk8vRN
 p9cyMn5hIFnEjKLIeO7uPhGHDoO6TF17grr7KtAZmGXyBIn8YjGxOneARfBuAAeQLSJZd0UZwLJ
 cZCsOL20W4CWvm9QEpN/1pqEeDhmKbfeLcLzp6L+7rXYY7svai881XdGofNDKcPcNeb1V/duhU2
 80cdHROxrw73r++hg/wNu/mmN2vphTUl8itNAfqGeeX2O2xYuR4sOjiSQdDl630ZSkaX+yNSj45
 jbMZ31t07JG4dRdHKbDYchFFKBRNmcdFGW3pLEvQbRONExRLMzgRerFYuekH06n73jTmA7sOosx
 cr77n7M0nryK/Gw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/12] pinctrl: microchip-sgpio: use new GPIO
 line value setter callbacks
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
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index a60db93b61b1..88c2f14cfc6b 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -555,10 +555,10 @@ static int microchip_sgpio_get_direction(struct gpio_chip *gc, unsigned int gpio
 	return bank->is_input ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
-static void microchip_sgpio_set_value(struct gpio_chip *gc,
-				unsigned int gpio, int value)
+static int microchip_sgpio_set_value(struct gpio_chip *gc, unsigned int gpio,
+				     int value)
 {
-	microchip_sgpio_direction_output(gc, gpio, value);
+	return microchip_sgpio_direction_output(gc, gpio, value);
 }
 
 static int microchip_sgpio_get_value(struct gpio_chip *gc, unsigned int gpio)
@@ -858,7 +858,7 @@ static int microchip_sgpio_register_bank(struct device *dev,
 	gc->direction_input	= microchip_sgpio_direction_input;
 	gc->direction_output	= microchip_sgpio_direction_output;
 	gc->get			= microchip_sgpio_get_value;
-	gc->set			= microchip_sgpio_set_value;
+	gc->set_rv		= microchip_sgpio_set_value;
 	gc->request		= gpiochip_generic_request;
 	gc->free		= gpiochip_generic_free;
 	gc->of_xlate		= microchip_sgpio_of_xlate;

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
