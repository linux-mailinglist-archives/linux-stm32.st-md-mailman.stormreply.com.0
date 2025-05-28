Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 047EAAC672D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:41:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4BF3C36B30;
	Wed, 28 May 2025 10:41:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3F2CC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:41:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-442cd12d28cso4688045e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428898; x=1749033698;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
 b=EyrY1Ko0S+nodpnuuiH4CRkH3TBsjNpoE2Q7KDoa0FIQFXEDkQg9gQYJDZLliLFXKL
 S5ZC8+y2r4i1Fo1PIkWdP24l52ZNHYwi7GEgOtB9wM0lHmT7QYgWzymb4Lk7Ljgu3EVu
 stE4Dw73mwvPelKrlIvK4qyYcbGe4eHpS20Wjvm9NYT+hMAtH44WF2inIqCwQe+q/PNC
 9thC+3SyslE5QhfGvaxqYhRBa2kGfxqzynQp/cRlN0oqj1c9SUGxqpYyE+avEhe8tw2X
 Qth5MUEmHfusiLe2kHpN9U7a9DODagKFjCAiRvemkhz0MVtACgdcYo/IS8XqHR/pzMWO
 vuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428898; x=1749033698;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
 b=wWUT6GFzrxiZgqC7/qVjdueryFSFI4/OydmQSYC/mqYzrt8R9xSOED5AO2S54Jiun3
 KomrWjGB8Lquq92TIC/at6QhamnJY3eQLglLG3EtAGS7+oo2naN2KTAmg5/HXSFM7u3B
 G4i6ullYXRguxEfdeF/yBQePZuKpdAXM4AUGd6WKj/Juj9Ep0y4LiclHkzuohwFM2D8g
 Qen+FVK9RMBA1JKMAVvFsrFBb5nuUuqxOAP7MjSVCq2Yya6OPdL2dw80/BQT3PpbGWCS
 INqTwHuFSq0cZy6miXYjEqpl38VX5mDhEID8uOfHlYN3VbbqSoSlOQqiy4rBvOZ5HkPr
 UHSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaOMtfrWgDFA5i4ko/CJUS6kMDrsjPIjVuVHpMruQ214TyKF7YyZIGu9jRXp5W613fFamTsrp5I4bCsg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRrkSH93viAubQkbLLU12yYcWnGGU1lKqB0Pzz7uwapQwWWoJj
 7LImlRXejTAlzK0xFuSFzB+HwWsCUtgV+TFC/AUw0Wb3UTf4Q7QsrbNhHs2EcAUNKDg=
X-Gm-Gg: ASbGncv1U9kRQf1Chz38FZEcpsj84ADoaNBcHCqiPdM+b9hkcUKYNJpFBT3ZOipjLRx
 3ygAFNEKOl9/QYsCsB2XzawfKSKbPSWL/kskQGM7pr5H3WadwLb++CDh+U/ICE2v33KFz42LG4Q
 NIxN+pBzfxXe8U9iuAeup0HRfaBFa7IEFEHBThn2GvsPO8nRsn5P68/Rr848qr4h+w23cHeoYqh
 XaI7XlPZMSK06QJDQG/pHLQzjKrv1JgbXrzJr238xX/nWrhpCujT7vkkQmdFPsU4BX8A8aEXZxf
 n7VBttdWgQyvnpwOdABOvBDI0fs5h8G4insL0VarN7CnPIV5eozOE6/nfEXfTk0sKSFGVi0=
X-Google-Smtp-Source: AGHT+IEqdF3+R9PvjaaVFg6PDyOWyRZc3HR0H7gqLL2irDsUydaByqxkZ9IUn5cux0xSEgLuwczlgg==
X-Received: by 2002:a05:600c:45ce:b0:43b:c938:1d0e with SMTP id
 5b1f17b1804b1-44fcb9e409dmr26120075e9.2.1748428898180; 
 Wed, 28 May 2025 03:41:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:41:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:58 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ctLoeYbHiiEBT9tiXppJUMjUFh7QHQFzP0xX2rdTSyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhKnpMXQJB0a7WYDcwZWwHu8C1P+bTuhMNNC
 +EXWDs6a8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSgAKCRDBN2bmhouD
 11VaD/9bw31tjR68bxVpvaTyp/6cSym928yjCV9vR7oyl3BoFzh4W/a+7D30PLrsKSbtBC0J/LD
 ZSkuCuQRCTdT/n3XZG0T+ABgncoGE8an/aWUK1QeNySdpFSaEb5IitD03FUnLNTrxbziwX2OSOt
 6Z8A1nYodGD43IqazDQ2Xa7koDf9waLjKZ4MmbB8/+UkbSkzvm0UwGsFauOIvDrdj5PPraBwoo0
 W1X4sxPqQbmIu/4DVRh6oGcHsCwbTyAArmCXRUGcCavGlYBMYD0sfBZ14yAoyXbd+TywqhMmceW
 Tgtkyg/cXJ8JinZQIyzaHGnbQKLMukCGj+sTXlEyYG54GXhLmH3szir1Zsww23gOCwDK/qdnObe
 c/31A7IEOIftcgkxejUbOr2hcAttBy7peOBZmeIe2iHS2xV/0B3z4DN69SNuH7YSD06YPSnBrgv
 BPRrGVkzC6QpojpzpZYG1rdP1Mov2N6Xb6lFueCWghnaWhmNte0hYDoOi3sHyHcLTY1RBqCyKVb
 ghPKA7ZSaMhuw3XFjrTUOHMhvO/Qxo44gHjL9XbyoHVDmw2vtEczKKN6madwPnMdoxroiO8Szan
 PthWKLwLidRlevSuV3zpMfPWxCO8gOal4o4jOif7BkNZmL0L1ELFxabGoZqrimpzXrW9si4MeWO
 jCjZimWjAIxLjVg==
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
Subject: [Linux-stm32] [PATCH 02/17] pinctrl: Allow compile testing for K210,
 TB10X and ZYNQ
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

Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
headers, thus can be compile tested for increased build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 33db9104df178e5a3148b60c3c6bd153113385d3..77a5d13e899f8c5251987c2c74df1d05dbd59128 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -269,7 +269,7 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN_K210 && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF || COMPILE_TEST
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
@@ -554,8 +554,8 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_TB10X
-	bool
-	depends on OF && ARC_PLAT_TB10X
+	bool "Pinctrl for TB10X" if COMPILE_TEST
+	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIOLIB
 
 config PINCTRL_TPS6594
@@ -590,7 +590,7 @@ config PINCTRL_TH1520
 
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
-	depends on ARCH_ZYNQ
+	depends on ARCH_ZYNQ || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	help

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
