Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED16762C6F
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8403C6B464;
	Wed, 26 Jul 2023 07:03:38 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 042BBC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:38 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-522462d8416so2409830a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355017; x=1690959817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F4NEIl0PF0jWLTgC3MG7VZaECShTTB2BR5eqLLfzHn0=;
 b=fJBgXQ+8eV+aY5RpuuTg+SXdJ82OameqMpnOM06NXyGaJkQa7LSY8oytbkt9cvaZuL
 XRBu2MGH9aKCYb1L7h//H8eFqvXRjdrTHzhO3820qwDp6MuJcia5+t5M9ixdWfOlxjYW
 /SAH6L8ADxt7NnHTemHkeh3n0shIfBOT23sOoxVY/rXTkSx7zhHKWuz5mv22Geq+iW4E
 ICpM7lTYjJeeGifNGSJ48vLLXbVedBeaO1Cu/xfTldupF0JYmiaXca6hrnRX79onNPRG
 G0iZVJt5rZ4p1+HuN5vH597gr1udFu+8mwANey/g9Hs8/ZZEzA10A1r/yra1NOeHHZto
 urqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355017; x=1690959817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F4NEIl0PF0jWLTgC3MG7VZaECShTTB2BR5eqLLfzHn0=;
 b=RNBMsE0iuRTBQn+lT0gl4p1aNsuG0y14pikzzIdp/1mDs+MROcYbBpdOmzjTHFMEEM
 2bx0OZalmodiOJFjrozHu+3C44iAgB4DmkguMAcBC/zkZuKY6mReQwJ05+WK6BhQ4Ee9
 u4ErjUSZAX/+Dfmfp1Mgsq7thkTBfVjDbxkb1GdLupSyRmEY5G3xkOcUX67haTywRqy3
 KUH4LobZ/3DxfCQ2EMTVyIzbDbXwIQEuWugyc/NPSuF6RhJZJn/h5Itf5Ojdqf73FXzj
 97AokGCuKZmY4aSQxewvNmjf/QD/M5suu4BBnj0uhxn2x6QgNtUdRqB0RngA53mbsjYk
 etbg==
X-Gm-Message-State: ABy/qLZ00GH+20xxI+iddDh0haCHr4VVZ02BEv4RFCIIhP5HRETl4if+
 thnvc/uL4piY9vGiwXYdyqALvw==
X-Google-Smtp-Source: APBJJlHK9AaezVXLCEASRuLyz474dcZIyZkKzKbObKu8+M+Dcd8Ek/phvOVZNz3xG5x+7GxIQyVoKw==
X-Received: by 2002:aa7:c901:0:b0:522:4766:6990 with SMTP id
 b1-20020aa7c901000000b0052247666990mr810358edt.6.1690355017598; 
 Wed, 26 Jul 2023 00:03:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:37 -0700 (PDT)
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
Date: Wed, 26 Jul 2023 09:03:20 +0200
Message-Id: <20230726070322.103871-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 6/8] ARM: dts: imx25: drop incorrect reg in
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
 ...25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts | 25 +++-----
 arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts | 21 +++----
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts       | 62 ++++++++-----------
 3 files changed, 42 insertions(+), 66 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
index 7d4301b22b90..fc8a502fc957 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
@@ -30,22 +30,15 @@ qvga_timings: 320x240 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_lcd_3v3: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_reg_lcd_3v3>;
-			regulator-name = "lcd-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	reg_lcd_3v3: regulator-0 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_lcd_3v3>;
+		regulator-name = "lcd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
index 57d5ade5aa46..458b94d3d4ed 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
@@ -14,20 +14,13 @@ chosen {
 		stdout-path = &uart1;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_fec_phy: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "fec-phy";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio4 9 0>;
-			enable-active-high;
-		};
+	reg_fec_phy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio4 9 0>;
+		enable-active-high;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
index fb66884d8a2f..04f4b127a172 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
@@ -16,45 +16,35 @@ memory@80000000 {
 		reg = <0x80000000 0x4000000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
+	reg_fec_3v3: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 3 0>;
+		enable-active-high;
+	};
 
-		reg_fec_3v3: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "fec-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio2 3 0>;
-			enable-active-high;
-		};
+	reg_2p5v: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P5V";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+	};
 
-		reg_2p5v: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "2P5V";
-			regulator-min-microvolt = <2500000>;
-			regulator-max-microvolt = <2500000>;
-		};
+	reg_3p3v: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 
-		reg_3p3v: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		reg_can_3v3: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "can-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio4 6 0>;
-		};
+	reg_can_3v3: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "can-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio4 6 0>;
 	};
 
 	sound {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
