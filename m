Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A787686DF
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jul 2023 19:50:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A95FC6B472;
	Sun, 30 Jul 2023 17:50:03 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CA8BC6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 17:50:01 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so600013566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690739401; x=1691344201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0JMSr6ztA05jmLDaIzGxamkK1kTz52ftEBBvAyV0mA=;
 b=WGgNOz1T5FuGFUgMWJng2mqOuR62p2WNmaq4WZQZc8EtAvQg/gvbavjgGHPsdL5byv
 /8n4vjVxnfbym1Fd+wl7UkYOXleEd6+jNrAYJ7bMoS4euqunAWZE0G7hfE9bdQLoRuA2
 BWyG9uFWaaGacDcfnkVsNpB8G1wu/lXQgW1PMwkHPGMXdrRGKhnU596b++8xkUKXUlHt
 XHAvraIqWvMpXD+ifaxCB35iS6Mex/cIqIlbpAy+nvNxqMS8lGuXWtlWttBpgytiECa5
 xDXzWhIqDYOqZnQj+Qd5LwDAynaRBk1AiuwGHyddZ1uoXPYVsQqQ5rQRs6pZjALlkh0l
 6Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690739401; x=1691344201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0JMSr6ztA05jmLDaIzGxamkK1kTz52ftEBBvAyV0mA=;
 b=N3dyCcD2KnHU+hUFxteKj1wX4iMZcv2R6NaltASNWmq1EYrNnAY886Xkz4YewkRkbK
 ARd8lk6kWCr3V3aG0FL8En5kdde+s1imhguDzeCBfcHGpr/zU9PDdayWKxRXYqmlhVkA
 vUo0qDcHyQooo7u0hwfU4emhvdYYzWFXiTjCM5xMTLJpz4BRxSVFkpB7JsnK67qvdy7m
 +CbjBj012C5JMe1SEDBOW6u0GlXZ2B9HCToMXO/DczSLOOYzjGUBI5VbbHqiC0TpCy0F
 SDXGXJXCns7wYzzYIeegM0TPa8ccbIDDqvay3GKTeJIwBp9kqmKZryZDQsCjAuIbRfnt
 vCAQ==
X-Gm-Message-State: ABy/qLb+52mCEBv9+3Z2t4WRgP5cw5sK7FuYaSnT/mOkhCB0fhsuCA+J
 LfN3kE3HagcpLQE5IY1GCE6pLA==
X-Google-Smtp-Source: APBJJlGz19IFvmEMqfL23X2YXbqU3Sz+jR/XJnz6m0yn6JR5EwOFd9qqlwMPvB+JXLEz8LNeezUGiw==
X-Received: by 2002:a17:906:5393:b0:99b:d6f5:afee with SMTP id
 g19-20020a170906539300b0099bd6f5afeemr5486169ejo.23.1690739400806; 
 Sun, 30 Jul 2023 10:50:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183]) by smtp.gmail.com with ESMTPSA id
 f19-20020a170906495300b00992c4103cb5sm4913537ejt.129.2023.07.30.10.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 10:50:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 30 Jul 2023 19:49:53 +0200
Message-Id: <20230730174954.5293-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
References: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 3/4] ARM: dts: st: ste: switch to
	enable-gpios
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

The recommended name for enable GPIOs property in regulator-gpio is
"enable-gpios".  This is also required by bindings:

  ste-hrefv60plus-stuib.dtb: regulator-gpio: Unevaluated properties are not allowed ('enable-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Correct subject prefix: AMR->ARM
---
 arch/arm/boot/dts/st/ste-href520-tvk.dts       | 2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts  | 2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts    | 2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts | 2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts   | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href520-tvk.dts b/arch/arm/boot/dts/st/ste-href520-tvk.dts
index 4201547c5988..7f661f8f13ad 100644
--- a/arch/arm/boot/dts/st/ste-href520-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-href520-tvk.dts
@@ -28,7 +28,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
index dfc933214c1a..a29e345a43d3 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
@@ -27,7 +27,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&tc3589x_gpio 18 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
index 75506339a93c..1968bd143114 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
@@ -27,7 +27,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&tc3589x_gpio 18 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
index 52c56ed17ae6..7a5b6aa1db5b 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
@@ -29,7 +29,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
index 2db2f8be8b03..d5af3f375161 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
@@ -29,7 +29,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 9a3d6546399d..27c2ec51e732 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -229,7 +229,7 @@ vmmci: regulator-gpio {
 			/* GPIO228 SD_SEL */
 			gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>;
 			/* GPIO217 MMC_EN */
-			enable-gpio = <&gpio6 25 GPIO_ACTIVE_HIGH>;
+			enable-gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 
 			regulator-min-microvolt = <1800000>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
