Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58517762C71
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FDC4C6B466;
	Wed, 26 Jul 2023 07:03:43 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 103AAC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:42 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5222c5d71b8so4264049a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355021; x=1690959821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhKuY6ckEMiOHhyrPQuF626RPMJ/PN1yP/pIhFIhjXE=;
 b=UhF4ZVqaAb/xdgfRnaORxHshpJ1SwbcYhP1ceBbpERdTIgvD1dap4lGSWjWO45QEOe
 jeT1aJlrVc91PVcZmzf7L5hcYyzwRIQPD0Lmg1BJFWj33MJg2zFDsZf0wlbI0oEjmTfc
 ZZr5C6BIkhiriXTrlI8rj8sUjsgNkEGgyOYOt8TkAXyO6FWZ6FfbqM2EjoVA/hzu7iue
 kPyd3F5WZg/HhgbqGQyXdMtOS60yFIMmn1r2CHYpc8UFPGlNI4LExfyOYyHt5hUqzxeU
 k/Vp60TQ3jMDH9xFLcOJe7JMtSSSL9apU/Gbgcj+JoY0U+GEjqTyRPdxjpMO/X7OfnIG
 Mfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355021; x=1690959821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhKuY6ckEMiOHhyrPQuF626RPMJ/PN1yP/pIhFIhjXE=;
 b=Dv7/qkWn5GIxSr2kabvSVXtoLMWI6VPQOt1DY09F4VFT2i7dULf2D8usmpdBPN3ieS
 KYEe5jCrMBzli8lfhwr89HV26iiA38Licrp5omZBv+NOOKSgs3pVvgD6G8uwqkKwbRaq
 /9HsHC/pAayOvmXYxZGOHa9ApkWmIAwSPxNCObSBZvPx2Tht+cuDw2ZBHv52pmG20gcU
 UCx80Nif3Y5dF4UU3uNXHwNLNw9+fa6echMK2+w3rxIPIWzSEJFD00LRWYNpFByqSk77
 nxBpRwTsJGlHedGbR00DAj8uorN8blbiu20YDaKKxNLzH/GKY6Y+fyKJk3OZ0+qb3aCn
 3UzQ==
X-Gm-Message-State: ABy/qLaMkgHhJVg1/+CSKa2FZbTSkxdq70v1uvFgltUdbBt7eJ05/To2
 1kXQS8AyStuTo6GR5a65pTnWyw==
X-Google-Smtp-Source: APBJJlHhHJ+fV7LTxQKOwNKCqhQW4A26em8Z73Uxrgoaf6xibti5Z7PLrmgKWS5DlulzHJdNxoyCLQ==
X-Received: by 2002:aa7:cf0e:0:b0:51a:5c1d:5c06 with SMTP id
 a14-20020aa7cf0e000000b0051a5c1d5c06mr668352edy.42.1690355021604; 
 Wed, 26 Jul 2023 00:03:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Jul 2023 09:03:22 +0200
Message-Id: <20230726070322.103871-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 8/8] ARM: dts: imx28: drop incorrect reg in
	fixed regulators
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

Fixed regulators are not in some bus and bindings do not allow a "reg"
property.  Move them out of "regulators" node to top-level.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts  | 34 +++-----
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts  | 23 ++----
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts  | 23 ++----
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts  | 23 ++----
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts  | 23 ++----
 .../dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi    | 82 ++++++++-----------
 arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi      | 19 ++---
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts    | 66 +++++++--------
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts      | 19 ++---
 9 files changed, 121 insertions(+), 191 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts b/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
index 4704b6141836..fd6fee63ad2f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
@@ -10,28 +10,20 @@ / {
 	model = "Armadeus Systems APF28Dev docking/development board";
 	compatible = "armadeus,imx28-apf28dev", "armadeus,imx28-apf28", "fsl,imx28";
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
+	reg_usb0_vbus: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 23 1>;
+		enable-active-high;
+	};
 
-		reg_usb0_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "usb0_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio1 23 1>;
-			enable-active-high;
-		};
-
-		reg_can0_vcc: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "can0_vcc";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-		};
+	reg_can0_vcc: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "can0_vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts
index d3e9a731525b..c72fe2d392f1 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts
@@ -64,20 +64,13 @@ mac0: ethernet@800f0000 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb1_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&usb_pins_cfa10037>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio0 7 1>;
-		};
+	reg_usb1_vbus: regulator-0 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_pins_cfa10037>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio0 7 1>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
index c5a7f56d83db..953e3162d2d2 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
@@ -78,21 +78,14 @@ pca9555: pca9555@20 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb1_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&usb_pins_cfa10049>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio0 7 1>;
-		};
+	reg_usb1_vbus: regulator-0 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_pins_cfa10049>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio0 7 1>;
 	};
 
 	spi-2 {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts
index 27602c01f162..0be7356941ee 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts
@@ -14,21 +14,14 @@ / {
 	model = "Crystalfontz CFA-10057 Board";
 	compatible = "crystalfontz,cfa10057", "crystalfontz,cfa10036", "fsl,imx28";
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb1_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&usb_pins_cfa10057>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio0 7 1>;
-		};
+	reg_usb1_vbus: regulator-0 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_pins_cfa10057>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio0 7 1>;
 	};
 
 	backlight {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts
index 931c4d089b26..aae0f1801461 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts
@@ -14,21 +14,14 @@ / {
 	model = "Crystalfontz CFA-10058 Board";
 	compatible = "crystalfontz,cfa10058", "crystalfontz,cfa10036", "fsl,imx28";
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb1_vbus: regulator@0 {
-			pinctrl-names = "default";
-			pinctrl-0 = <&usb_pins_cfa10058>;
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio0 7 1>;
-		};
+	reg_usb1_vbus: regulator-0 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_pins_cfa10058>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio0 7 1>;
 	};
 
 	backlight {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi
index b285a946e2c2..6633cde305e5 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi
@@ -69,55 +69,45 @@ led1 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
+	reg_3p3v: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		reg_3p3v: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_lcd_3v3: regulator-1 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&reg_lcd_3v3_pins_mbmx28lc>;
+		regulator-name = "lcd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		reg_lcd_3v3: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&reg_lcd_3v3_pins_mbmx28lc>;
-			regulator-name = "lcd-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	reg_usb0_vbus: regulator-2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&reg_usb0_vbus_pins_mbmx28lc>;
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		reg_usb0_vbus: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&reg_usb0_vbus_pins_mbmx28lc>;
-			regulator-name = "usb0_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio1 18 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
-
-		reg_usb1_vbus: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&reg_usb1_vbus_pins_mbmx28lc>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio1 19 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	reg_usb1_vbus: regulator-3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&reg_usb1_vbus_pins_mbmx28lc>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
index c08b14ad7cd5..66facef10ba9 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
@@ -14,19 +14,12 @@ memory@40000000 {
 		reg = <0x40000000 0x08000000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_3p3v: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_3p3v: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
index 6b01de9efd02..8241c2d159fa 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
@@ -40,47 +40,37 @@ user2 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
+	reg_3p3v: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		reg_3p3v: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_vddio_sd0: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-sd0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 29 0>;
+	};
 
-		reg_vddio_sd0: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vddio-sd0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio3 29 0>;
-		};
+	reg_vddio_sd1: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-sd1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 0>;
+	};
 
-		reg_vddio_sd1: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "vddio-sd1";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio2 19 0>;
-		};
-
-		reg_usb1_vbus: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 8 0>;
-			enable-active-high;
-		};
+	reg_usb1_vbus: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio3 8 0>;
+		enable-active-high;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
index 5d74a68c56ff..0f01dded4e3d 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
@@ -15,19 +15,12 @@ memory@40000000 {
 		reg = <0x40000000 0x08000000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb0_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "usb0_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 9 0>;
-		};
+	reg_usb0_vbus: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio3 9 0>;
 	};
 
 	leds {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
