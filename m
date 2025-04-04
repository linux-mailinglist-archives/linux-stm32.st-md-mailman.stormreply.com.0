Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5918A7BBF8
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 13:57:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9808BC7A826;
	Fri,  4 Apr 2025 11:57:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A859C7A827
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 11:57:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cee550af2so1880875e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743767827; x=1744372627;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
 b=ROEoe2zP2N+7FPdB+SNKTSByqlRb/3/cL26SA3LkkW1o7keAis1U+4QecsEtmM0WRW
 0EgoQtFLbMbp+DeOgS80YOAnBq02b9MQFiBfLBvTvVIMMKAua8Dsd4QlciGHVWZNTCax
 y3fN+HTXMi/1DgT+O1zrSbY3HPwNeBz4keJtNemJR3ahtz6elM2JT4q/HyC1gsOyQmlq
 QVR6zkGa7Quot378EvleVWtuQ6EOvAeXYOkv94M7w+Lww6coc+XMQiCBOykgaH0Yz+x2
 voUR5daTNUm9aiC6sDzToh/j994Zm+YDE8veyGHQ9gSfkyLOe0hQzBlyaEy4RelhYTN+
 pakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743767827; x=1744372627;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
 b=OHcVKccIuU8rcpANT6XrP41k8X2HL6aHZSN6d2IW6hLHOEm9IsIa4ZDLFQZY/trQsK
 5ZERp0frt26PD99NKnbulg7hZAN3K+v+0GLQx73cV1YLOp3Z0096v3TWuTTtuTEIRki2
 aHweYZfzy1jv611q44dg+W+LvOctV/NMmYV1X0V8FMW/bCtBIcCfMFheS5JWfF1hQ8+3
 Gbxs/69TJrU+Q7aPhrI1ZcLCDwRqGmYUO8ceNW3bm6xJ+O/3aeFiP3LFT3U0kMR1Se97
 KKJUovnOybje7ogDeHkhwSnUOUAckxn8no3t0/3B0aL9xoifLQrEh/g90rYEgeVxjx/+
 I0Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu1MCixDytUrCaLfcmFeCb4mE0uPnYlDTZE6GOwyzUnjUmRt8rqbNKyhPLkxl/oKqI2vgpvAaGLC8MDg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxtr/2zQmlsTTz4Dos4e2A5rmJxJwIHiMB45mz1tYsb8CqsDO5P
 o7OPNc407q6qh35M9mipXX9sh8m7ymagLSlJEx07pRPz7mBdOmYlhZxRodYIF5iTBwUOkE7sI2E
 6
X-Gm-Gg: ASbGncs4/F5ZTfZRjpuSp4ImfQKGgUNcrsRPHR1L4GQcNVKv7zaGoiwNgbGz4m1Mj9S
 sAKuMUd0xD41onHaJC8CkkMDcyKy2toz+0cB0BpTNPikw+SlRnjVPWUwCA/tYl9tEcvi/92srEF
 IV6Jm/KjtOe4hLGyNfYX+x7ucVmhggwyNSRUpPd18hJi30d5+jneb0Knrxh5O7/kbBKvFmjlUxa
 9eE/IjMj23xF/+oCRsuQZWIjzPqFfqm5yuDbNVuuoqwWTp4uW2ynZx7O2GX28WAuxoVnvksibOJ
 NJ633DaM4AcDWcA3mN5GbRjg9KuXsO6b/1/PmiCRsu98M+fTkJqOq5Svcl4SxU0=
X-Google-Smtp-Source: AGHT+IHHD7HuendpPytpQj7rstsIi+Mc3ng61xMnf8Qu66Hus393p51dcdiyAL39bcJzERvr8KKSjw==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id
 5b1f17b1804b1-43ecfa18ba7mr9352835e9.6.1743767827420; 
 Fri, 04 Apr 2025 04:57:07 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:00 +0200
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
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
Subject: [Linux-stm32] [PATCH 4/5] clk: sunxi-ng: Do not enable by default
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
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 5830a9d87bf25d536ac787fe83669c64c8214952..8896fd052ef1784d60d488ab1498737c1405deb2 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -9,123 +9,123 @@ if SUNXI_CCU
 
 config SUNIV_F1C100S_CCU
 	tristate "Support for the Allwinner newer F1C100s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUNIV || COMPILE_TEST
 
 config SUN20I_D1_CCU
 	tristate "Support for the Allwinner D1/R528/T113 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN20I_D1_R_CCU
 	tristate "Support for the Allwinner D1/R528/T113 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN50I_A64_CCU
 	tristate "Support for the Allwinner A64 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_CCU
 	tristate "Support for the Allwinner A100 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_R_CCU
 	tristate "Support for the Allwinner A100 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_CCU
 	tristate "Support for the Allwinner H6 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H616_CCU
 	tristate "Support for the Allwinner H616 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_R_CCU
 	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_CCU
 	tristate "Support for the Allwinner A523/T527 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_R_CCU
 	tristate "Support for the Allwinner A523/T527 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
 
 config SUN5I_CCU
 	bool "Support for the Allwinner sun5i family CCM"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN5I || COMPILE_TEST
 	depends on SUNXI_CCU=y
 
 config SUN6I_A31_CCU
 	tristate "Support for the Allwinner A31/A31s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN6I || COMPILE_TEST
 
 config SUN6I_RTC_CCU
 	tristate "Support for the Allwinner H616/R329 RTC CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A33_CCU
 	tristate "Support for the Allwinner A33 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A83T_CCU
 	tristate "Support for the Allwinner A83T CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_H3_CCU
 	tristate "Support for the Allwinner H3 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 config SUN8I_V3S_CCU
 	tristate "Support for the Allwinner V3s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_DE2_CCU
 	tristate "Support for the Allwinner SoCs DE2 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_R40_CCU
 	tristate "Support for the Allwinner R40 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN9I_A80_CCU
 	tristate "Support for the Allwinner A80 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN9I || COMPILE_TEST
 
 config SUN8I_R_CCU
 	tristate "Support for Allwinner SoCs' PRCM CCUs"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 endif

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
