Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6ADAC6737
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:41:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF1E6C36B30;
	Wed, 28 May 2025 10:41:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F55CC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:41:48 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-44069f5f3aaso5069375e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428908; x=1749033708;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
 b=jp311UrPtKX9tPEtu+spiIbyF187Ed603ci/UzW6xssMUe7OqTWzLF285J2G9y2kPF
 04TjEdrquuoMdzVOh4pp9e4mnQ8r8g5VhUEOnWtI7zogbpje2AMfovALlTQoBevGSYTf
 ehwRXjoD3m9yG57zJUG+fRr3ic5cx5rf4VaqKh+QHEzakUive5MklGk+Te4R6gTRRJWx
 60CWvuvcxrHJGxF6Xx12skvrIpzfy4zg5zA5wNeEymGOIWMy4mNasC0QzwZoWYb3SWmC
 Oeu5+24UVR12WU4e9ulMoO3a/wU0ozZU71D+hTWnvLvBjKeHGfQCTY50MnVXnBZ9/QFd
 1Jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428908; x=1749033708;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
 b=jPi/CxpNQWhCB/R+a58IRjlXzdkb1axJG07znf5pGlI7AQ64y2QoeygHhvpxq4VTdE
 /9m23GcX2rfGU/Sr5meM7ADKJoywp7y/FPB/Vvn6eGITAkPHmMY+8C66Vf/jEc99GqGI
 b470SSOx96Bjo7VnY+iToqpOM4RgUKUiOq9EuawYigoptyxQaOELYo3b+2E4V7fFs9Od
 oXdl9R8jqu8RGivsC+5OaqFLr9pd+tAV91QxJIJkc5K8A5PfQB9t0yYGbrAT9Y1UjXex
 WuW7lWfEYt+65mAOtTalF0B7yUERIH/B3BwkgI/dAeO9AjiUw4m80HFU3rSY3lsLWBuT
 I2/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7hVXxPtlPQuKfx/25whNDRjqH+Qdx9fNg8kxPwmkUbLFRd21t7TckJ5agNfrGqtTPh2kp8R6orP6LVw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHwNUkzchVPE/BdU3xCk9XOJkYWD+0MDpcZQFhqq95YaQBbTCb
 CdfUuRBrnq0bqJtrzP9rCKcXxd+Uvj5sWci5jRK0BfexnMOXOI0Ph164uSHBkbZq580=
X-Gm-Gg: ASbGncuBli0wils4EDwQaQRH0UH8OMSiaO8y7I5oPv9Dz+JlyVQkruge3yozLZWcuJK
 LAJRS1jmEdcm23hSL0FJtMGWEHQ9zsHa/SNsAYOMPyyszvy2qTpqT0Lpkd/twWFLUKvIW4CWuDS
 9N66kr8NU9PZnjI83olRGHMY3LbPjJTQIYU+A8Q2gB9kR7yiuHi/syWj+CDh+TUiYzW5ZQYUDps
 44Ip6MRLl9TEhrTDmIxgmwEtSlfoBzqrqJzlNsIPN86I2Mq0lBEMj7zzzloswumU3wrRCI9T2HH
 eR9VyVEhX0h+mxeMjIh6BfJ+0DNCBVJkF5s9fd4FEOKoDr1TsucMnYjv0mRq0De8LCb5Sb4=
X-Google-Smtp-Source: AGHT+IE/LJaHWTe9SYlHoYiKsnsZsaOAKKUrQJlJHOckCVYd00NuFwaRx6BpFbRuXnZ9itlqpT5fMg==
X-Received: by 2002:a05:600c:c0c3:10b0:439:94f8:fc7b with SMTP id
 5b1f17b1804b1-44c90f4ccb1mr34271245e9.0.1748428907943; 
 Wed, 28 May 2025 03:41:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:41:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:01 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3756;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bPCkHXtxmRdHSBbvdS8jXvx5ZcbYrMBVxN7TAPQmEWo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhN3yUYNRVGlDm5GKvUjHRKmpO0NkcKTivqS
 rQ9YFsZsAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTQAKCRDBN2bmhouD
 15PsD/wN1dSXzevKC2HHXVm7rrp8PsHK6/O5ksoH/BLBd4VXwlPyIgGgkZ8jbISY8fCS0s7jAvE
 JbaDoYx6YKMIDEZRd/TdeBOLU2GWPzSgWvdOYA4LPr5cATQfbPRHhZIyCpk6FC4PPnfW8vfFrYy
 LKqeFzOpOHKIxR7MrchXNRqtxM+664l1K8Tb3XnT6+ojdbePdy7aXcAe3l7OG76wwg7sTwksB9A
 XcirEY5EnVp9kjB0/fwjQn3HwmrmC5zVzpgyqLm0uNEeDVJmu3CY/KxoGLqtzBfo+0xfopGAmAC
 fZ5m5O68s0ez/Xt46UgSW5XjyxlPGZkkQFz7Ba3qhVhc7GJsBR2ivHY8liIYf+UypZN3cDDN42N
 MyixdpJwa5XFsJnT+SiJ14/2t6Vu20ObUTXCfeto3WTYA6uIFk3QEktZFxNV/MQtBjA7SW59alS
 UdvaEjwa5LNRjWATKwCsWjkKNjj2zvgXhPO/kWHSySyYkAqHCAMtzWuRpLirzgARamkkw7eWkSD
 XXllk4esE/ckh1ZPaVSD4+yZ74jjdqWrNQSmFdzA6C+EA6M3BHIKo/NcQJg6NPBSnex2IGipA08
 KABgrW8+YQC/zSQ7VoZ6RwXHfcNuIMQ0ri/JoENVnFPqdN5ZVSijqUw1jZoLhXuA5LwDkWd248s
 5NOQtmWzYeMwnKA==
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
Subject: [Linux-stm32] [PATCH 05/17] pinctrl: aspeed: Constify static
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
