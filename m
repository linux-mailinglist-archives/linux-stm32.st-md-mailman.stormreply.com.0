Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210EAD4AE9
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 08:14:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A574C3087B;
	Wed, 11 Jun 2025 06:14:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7419EC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:14:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a4ef05f631so24943f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749622467; x=1750227267;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TEB3joLDGNQ10Dxn2W6U+Wspv7QV9CHlEFicTB8VL5c=;
 b=c0X3gs+YH8c2FpRD2nlMQGMvtVGkK/B9lmf1izF5CuvRZFSoyDp6nkU0aVS85mg+EE
 CWVNcy9XEbTVZdYL6lMarO9QKcdwyqoA0ZtdItBCQfQ/nlcMq3S0SJGETQ1EPswfP0Vq
 ZPdhHp1txMYle83UCu/NPlyT+mF+gvS6I1q7XD+HhLSJ4nFU/SfELR8YO/ucOJ/iTYsv
 k1I1afi+RDMRI8yaUypjMuSMC+SLQwozsOmZ2iA7kq07n8gZyswr8xqAwwidMewcfIWf
 yqn3qqLoaj7h/Yw6MoXdlJoFIkvPW+/BDuSlrM7dT3JJ/Jkf/7rtq7e/n8PYmm7Uwgpk
 6utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749622467; x=1750227267;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEB3joLDGNQ10Dxn2W6U+Wspv7QV9CHlEFicTB8VL5c=;
 b=JU1Z9/Xvh9LWPehgtc0pLs23+DUlJ5bQlMN28oChEkRPQnUvwpyCzhDYtKFTUja2fr
 OROYXdR/ARUrr5NUZ2FbKsh0hEH+4FlXCN9b2d90OXf4L7inVrqpNkU8gltYZQWW1f6g
 XiKdkTn8Zz/h5k2QFWK82+TIBskpZGonho6j3hPFrxgWaxl6FS/mXWOPkmzlBgM9i725
 N5jxuYph8pwZ5e9yGPtSgIr6ufWIsa0rm7Pq13pYzp58Ljfs5VHQVkzqyZUjQi2ie6Xj
 qdPdLekYOhRRW7QMwtlmCZfk6YEqKZ24xOPbZZzsGtofMlV+QaY6nyxk/VU597fCgsXT
 WA5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVWav7K1gu84oYacak27XA3hop+U3bOXv8rtDu/AE9fYXDK2bs7m3FCys3muV7vznnpax+GAUeyrMN+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjAgUR8nVn0Ar+j8OHb9LYKL3wdpsnI2bsHf8gKRC1QzFCZxNL
 QwKV412jMpkwh/h31iSFDkyPx5DUrdxdqpaj8qPfp8hkDIO11S3HbOtM6QdJxJ+2Bbg=
X-Gm-Gg: ASbGnctotyVa3RT/T4LT8LOYjKQ4VjDs3THAOdJPcIe8WkVVFzblEi6SFzpuoBzY6ZO
 8MNZt+d8PB/2bQH+OFW3E/z6DGcImxatsv5ZFkbUafX/tovSfg1o0qSe91vMHC4sbJJ+kuODYow
 /DYM97i+R8Z8ooQri05fy1GMtsDCIZ2RMTj1bUwBDzB6d4GMo68SFCcBBWaJe1477vDHl27rU34
 E+K9DdVi04ZDLo8aBJZmU5Iq8nhAk/xD6NYHg5jl8jpUc6LTnPFV2M9gojPeZHjh2rLh54GWFzJ
 Gp+Tx4WbpHUexZlAF8dlYXMdzYs+gjRoP+xQgrQFTbUGHoqc1YQa4QFv935IA1s4mFUL6rZfX43
 FrqDql2A=
X-Google-Smtp-Source: AGHT+IGKArwmT43Jp39W/IH9DrAfebUf487r6XRBJJfTxXZ7wZrfvcgLM2/UusAKtEurR1Oql+1dkg==
X-Received: by 2002:a5d:64ca:0:b0:3a4:d30a:7633 with SMTP id
 ffacd0b85a97d-3a558a219bfmr553112f8f.15.1749622466767; 
 Tue, 10 Jun 2025 23:14:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 23:14:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:37 +0200
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-5-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3815;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MUWLp3Nt5eChdJhKGynTZdb05flOTAfJJ85UEeTcZlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6iwlO2tQ/UpCj0vvsGMdn11hh5s2rcGYP+x
 QO7DZiy+8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeogAKCRDBN2bmhouD
 1xQ9EACNGt2WyM5b4AkDlzKbhuD6nAbgGjDViCR7KZyPgUO70TNbTmXSywc0SAXADggMLD36i9B
 /MyCOvxlkIQRYFBsGI5cjokf97+vpM45r3Ey8O0/VpJGYomDjOu9O8synMz+BccVLyNGtbrDIPY
 FgdWz/Z/vUq7vkSM6yT/yFMW652cUeZafnSLEFe4xPvyy3ib1Wevr5rm4tmM0hAQQhicljGiDVu
 QBQGPXd8y7HM/fXUA0S2wuyzWGG541W/oI75yde3jV9XqvGpRYQfyLdoQ4x9Uo5qe6Ao9aeNHgF
 Szpcr5DTsQIjtCvy+ObGvzDHXLF9TlEyAoyqS1b7NtI/FKFaJpL/0VDCDSqYYgqRHTSeRGvCfTH
 a4vfnXy21HJ2vCvNd5Py45HkrKi8ku/uWOQeeWlPAARoGdEgR8ZKbDxzX7bXKoIpDGLrS8jrkvs
 x1TX5MnTnEQ2FZvO/Ex0rqguCfQoZXWDxhg3TW/ChFXjQR3kWtxA146wVDmfCLjwPy+NIqHcRgg
 IVaaFfTXPbGGJRU1M8m/RGL3g62rPoFv/bWdPLFktxqifMdLnFY2a6SHq0m5eoqpYdX0wVV/iP9
 5PKUq9+nUx1UtfJIOma14ebdxYJa8wgkyllbcdXsD8JhnbaQ9h1CK4gOjI4AK5pP5TJOfxtwVkz
 JeKCJJV2+52S1Dg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 05/17] pinctrl: aspeed: Constify static
	'pinctrl_desc'
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

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 774f8d05142f2d90c238f8e6661eca4685601db7..cb295856dda1244f2205305cf4c505d4ea4a326f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2653,7 +2653,7 @@ static const struct pinconf_ops aspeed_g4_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g4_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g4_pinctrl_desc = {
 	.name = "aspeed-g4-pinctrl",
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 5bb8fd0d1e41bda799119a67887ccbc277e0f9f4..792089628362a1ed1c3eccd4e46c41a3ac7a79f6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2845,7 +2845,7 @@ static const struct pinconf_ops aspeed_g5_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g5_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g5_pinctrl_desc = {
 	.name = "aspeed-g5-pinctrl",
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5a7cd0a8868764dc5e3dc70f325c25ba29d50a64..51a63cf92023f7dc7a27466331c77bb5dcbaa9bb 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2763,7 +2763,7 @@ static const struct pinconf_ops aspeed_g6_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g6_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.name = "aspeed-g6-pinctrl",
 	.pins = aspeed_g6_pins,
 	.npins = ARRAY_SIZE(aspeed_g6_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c6ee46ac7a096ce693639d88d387b089ffe5239..7e0ebf11af163c90184231686b1e0d9920755d76 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -441,7 +441,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-			 struct pinctrl_desc *pdesc,
+			 const struct pinctrl_desc *pdesc,
 			 struct aspeed_pinctrl_data *pdata)
 {
 	struct device *parent;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4dcde3bc29c825cbc6be954dae9a654a310b4cd8..28f3bde25081b2c8099977129acdcdfb3e4b1dd5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -102,7 +102,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned int offset);
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-		struct pinctrl_desc *pdesc,
+		const struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
 int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		unsigned long *config);

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
