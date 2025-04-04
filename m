Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC34A7BBF5
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 13:57:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 601F3C7A826;
	Fri,  4 Apr 2025 11:57:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12686C7A826
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 11:57:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-391324ef4a0so191521f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743767822; x=1744372622;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
 b=r0faIFl2ESVqAmN6VII1swHuIsnwOoIIT3g2QoUu0aGjz0r+zZciSlStd2J5gFlRXf
 QvuT2QMmWgiczFgj94HX/bPvj7ki/daDrr3TUnC+lp9HnXsFu6b1OD0Gp9TwDqLrATVt
 4aZ8POoakIzfx0flt/abPpsRbbjkXwlSPmiIU9FgCszVyYaZSUM6oL2hu+IZTyYxbKhq
 GLJJuRhc8p3VB3iZClDJ64WuJQtejzvUOvW3xPIpyawBI2XgLWi0Uhk8fVtsBDUcV3uV
 GOjD4YQ9qipmedDGtCkKWlEqiHQ4ogcT2mtxqm/BKRHwjXvtJbxkRHcBdE9Ywp8couZ9
 Fbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743767822; x=1744372622;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
 b=kEhIhZel8QSFBUsG/n3QJ5O7Nu+TWsoxsnK8ZKRdYUGHFIRqAXUTQqkcH/d6Ph9g/1
 CkjoMNyaoFl7lJLrsgNtLusG94MphaxN8um3oo61IZpii2zLNkMJXVm9k46UaDoCdiGI
 8mHtQ6hS7kFLEQzO+UmbCUpuPPmhbxw1DAbyk77R0H8tRxa9b+67/U1bae/JGeQ4skdV
 ds1UuHV8tAB245mRFC10BqwbdZjxAmYMEB9s2zqEBZitrdehdY08TLdRzlR7nMZj4kkK
 yi+Ex4soSJdmA+ceXptUl/1fp0c3+sf9E69jTsvH8eT3iGNKXyrqMnz2oX2WFR+zbip/
 EGqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Ji+krIdgRCotVfwfjudgBU6axxufTxPQlkhf9yNQAYcPgz0Gqs8TFvXuMGErW3YCsap7BUnMNHIc/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/ygowDA6ckJ/+UPKCCMmPYPWEcT/af4k9ST8W65Oywh6TY2oO
 qFCtt6Klh5PnnmVPTINveONd8IK+1XMkcK3ang10USn+qTvxOTjAQR+3vu5K+c4Tb/faPixY76Y
 A
X-Gm-Gg: ASbGncu8lL/YVa1yGbit5qbWL3rePexWjL+xCUZPz53qAJwTlb3bwdzdaEy702JTbXA
 HrmHMJpbV4J6h3gGfdY0d2zCPcqo4QpxBoG1LJthu7gaf6G3Dv4XLRjNuCBrw1OTnPXGPwm19/e
 rsJ44xEG1p+Rca3XFXR1y6usBmRL4YwNOKaUcSr57qW5ejzJjM320I5TtFpPWOnrOB/wXyzO1zG
 Bde06HWUJWO3IwF3tz0+qvWq53/Xc7FOFEhlmZvhS6wXdySnaDWHnHtPZyQrvg45QWhLEe9Rv/g
 2njNO4YXEOR+mA+l6dqj7+IQOKGBZYJCSgj5uOBGficZHravbofgGvoismxx9KXtwK24oE2jhA=
 =
X-Google-Smtp-Source: AGHT+IFxuBP0nmnZWUjwXivSZyFM5R5EOm7OqMfFckNVWAgHA5LCnGmvvIDCOlE0EShLntnYXKvpnQ==
X-Received: by 2002:a05:600c:348b:b0:439:8c80:6aee with SMTP id
 5b1f17b1804b1-43ecf9c2b5emr11378355e9.4.1743767821387; 
 Fri, 04 Apr 2025 04:57:01 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 04:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:57 +0200
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
X-Mailer: b4 0.14.2
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] clk: meson: Do not enable by default
 during compile testing
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

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/meson/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..ff003dc5ab20d904c91fc34c701ba499a11d0b63 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -55,7 +55,7 @@ config COMMON_CLK_MESON_CPU_DYNDIV
 config COMMON_CLK_MESON8B
 	bool "Meson8 SoC Clock controller support"
 	depends on ARM
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
@@ -70,7 +70,7 @@ config COMMON_CLK_MESON8B
 config COMMON_CLK_GXBB
 	tristate "GXBB and GXL SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
@@ -86,7 +86,7 @@ config COMMON_CLK_GXBB
 config COMMON_CLK_AXG
 	tristate "AXG SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -136,7 +136,7 @@ config COMMON_CLK_A1_PERIPHERALS
 config COMMON_CLK_C3_PLL
 	tristate "Amlogic C3 PLL clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -149,7 +149,7 @@ config COMMON_CLK_C3_PLL
 config COMMON_CLK_C3_PERIPHERALS
 	tristate "Amlogic C3 peripherals clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -163,7 +163,7 @@ config COMMON_CLK_C3_PERIPHERALS
 config COMMON_CLK_G12A
 	tristate "G12 and SM1 SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -181,7 +181,7 @@ config COMMON_CLK_G12A
 config COMMON_CLK_S4_PLL
 	tristate "S4 SoC PLL clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
@@ -194,7 +194,7 @@ config COMMON_CLK_S4_PLL
 config COMMON_CLK_S4_PERIPHERALS
 	tristate "S4 SoC peripherals clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
