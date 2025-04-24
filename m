Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BDA9A603
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77B99C7803A;
	Thu, 24 Apr 2025 08:35:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 145E9C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:48 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso423878f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483747; x=1746088547;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=;
 b=IPR5BAHaNRTbjmYS9MoFVrkuTuqwiMgaGRoR8xn4CP3gm5CndBIB8EGOAISwhBPHf1
 OqHoyDUQJQKRLF92NTxMaihufJr6cU3nIyTLxL8odlqbLUm21VQkFZbP2+lwAVqSUXeQ
 puQxj4taycKQvuM/IrdY6isyasJJHmIPjNirxydMF7zJOhVEDXzJiSpyA6uRIIN2zRxR
 vy2nYcmPY8m0K+4lLn6o9AS+r12WFxnjgD4vQV2+h6uZ66MsBUVof/PQWFhlEIKBu34j
 z0WGSiHqZUCMGTTp4QjZ4O6JAOWZMBWIeIyO3ejXBZ5TxaLM4UHGL2manVr5Rm4Mzp+I
 dc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483747; x=1746088547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=;
 b=BWX9vS6EyEa+AdUCMgF4KodQ2b4so9JNpkBQXqEba0meCkonr/iL5IFLmQDDYR259m
 Dy2mQb6ld3MDpHdrNGmvL4DPpRord9dKMqs8AmTRNxuw/VBpVGOI4QtZfXzBUvSQEL3G
 IY34BurZp/EOYL4zmIJd8eMoEao/Q8K491QAF+M/MzybWLfCQ6K/nC6Jhu3+Jb1adR5j
 OPRlpxtVw3hEyB4K8/OMEN/A2W009JHPzhGNnXvpfV5j3vorW+8rU1+zwlkW+8EtR/4n
 fHilEmOyqPSv/BsyLv1aIDWNH+LqQQ6PnleHCiqUV8os06xVEHVbFt/8pAnHzLNLzDPo
 34BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfQ8w6qWtri4WLImybA/d+00FiLtpWfrjNa52oy958BrZB5lF8cTiEbH15rDYvhGtC4mFdqRtlvNgMKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/tdBtNTaX6nh4csyWJdNfOYkvIt21gn/hiIa9wYytN1Sq6Kft
 7I6bWqmtRYXp/6mJrKyyW97Kel/V5Esd/3x71uh9oaHeBc336bLYyKfmubJabpc=
X-Gm-Gg: ASbGncsj626ADOHyFVs0svdWbFzST0W9hlUmv1rl8b0g/wGhLDvE+uW1M867cA5RrmQ
 aKF92UqGw9OT1jd7zLRrO8Jt3PBFyHUe0hZru2GYiGChpraUCNGJZD1TEca8L8z2ojZvOv63pV2
 Q2M/Mx/REqPAUOA+p8BV/1W8PwsivtesXC4HYupBKoJbprbb9orUL7au5MPKt+k33CvPNz4gp4F
 7ND3dNMv2GXorUuS8QvWdsqqSG0Vfi4w6ieSyMGZyvHyA+RSHv+SGpslHeEt1EhbeNoLe4WVnpQ
 234N0vqIztoA/OKdHqggVbkOxDVqc4TF2A==
X-Google-Smtp-Source: AGHT+IFa84choTa1mcCVuQGvjjgEmdRH9HlvyIG+7lrhNevStMTJlm/OytKRYpi+e4zX9vxoz/GHOQ==
X-Received: by 2002:a05:6000:40de:b0:391:9b2:f48d with SMTP id
 ffacd0b85a97d-3a06cf62a28mr1355792f8f.33.1745483747375; 
 Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:26 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-3-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=goHZgmT9yJTYnSgX1qwQQpFML/4BhFXlFKBeDD9aKZQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbdnAxPhaJKaJSps/EzFiEC45gufsQ1Alt4
 qq09XNXIk+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 cpC1EACk2t+HP6KYD9aJArx7fiGflDxgI1WbKJ6Fu14huQEvp7PuA5rPYehuFCH1Gk1QDZiNYCb
 hIqrsmivpsIMWt+466di/ih3PbJOoGk4rjDVWe2Qf0sqY2SSyk0oYMixfztP1SI70MxCaZAZCLG
 n7XU0j057krrx++3YTvqGY/wnGgasSZa+2xJrVPjtXCUskF7RzNG9UwabQwmLqR8bDl5s4OhV3F
 3tRo+1yN0XGFQ8j6AaSdu6FNQb6oINHNc51H1E7lINc6F8spGhgrPT5nm19hEt9+dv1AbIdyz30
 ttnBRghwa8jedtnbv7JtAgxm+xLqAUP1sRY9LmzRwIyiLPRA4stunNuD6uwOACJ+/vpVNT+h4C9
 kyZR3CgLau/uY40HKqBG8k83ViWJUOjusAidOeRoRBpxFSIXmMS9lP5jvdCW4mAmJoriymxiqrw
 a2APMc8TgoRAfpGJrXESk3Aj7DtBi2C0zeGD3qy9AVg65EJGerWP4D3+k37dDmU0qg/mw/ko3hh
 UTJ5C5+MiWj3lpqSlJrjKy2i+M0aq/dhVoeVdOG14BHS5bxsGyvl4D9LXYKos209SoLTEAWYVNR
 uYrXEShrPRGrtwapj/uZelp+xH24b9FTbitop+uLfFc4Si5GX8BfmJMnx7Wa24U0daHwd82lz8D
 KvP3120WxRcM19A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/12] pinctrl: stmfx: use new GPIO line value
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
 drivers/pinctrl/pinctrl-stmfx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index aae01120dc52..f4fdcaa043e6 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -115,14 +115,14 @@ static int stmfx_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return ret ? ret : !!(value & mask);
 }
 
-static void stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
 	u32 reg = value ? STMFX_REG_GPO_SET : STMFX_REG_GPO_CLR;
 	u32 mask = get_mask(offset);
 
-	regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
-			  mask, mask);
+	return regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
+				 mask, mask);
 }
 
 static int stmfx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -161,8 +161,11 @@ static int stmfx_gpio_direction_output(struct gpio_chip *gc,
 	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
 	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
 	u32 mask = get_mask(offset);
+	int ret;
 
-	stmfx_gpio_set(gc, offset, value);
+	ret = stmfx_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	return regmap_write_bits(pctl->stmfx->map, reg, mask, mask);
 }
@@ -694,7 +697,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.direction_input = stmfx_gpio_direction_input;
 	pctl->gpio_chip.direction_output = stmfx_gpio_direction_output;
 	pctl->gpio_chip.get = stmfx_gpio_get;
-	pctl->gpio_chip.set = stmfx_gpio_set;
+	pctl->gpio_chip.set_rv = stmfx_gpio_set;
 	pctl->gpio_chip.set_config = gpiochip_generic_config;
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
