Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 541FE762C70
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 129BEC6B465;
	Wed, 26 Jul 2023 07:03:41 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15201C6B465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-52164adea19so8465830a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355019; x=1690959819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHJNnsXc4d/K/z6VhqA+wtVe+B6ZApclNDr3oVz3Qng=;
 b=ue0FwepuEKanedIaHj88Eu2du8PJDtqjDGNpgDhpT2z4n0dS9MRxnqTskins8Gk9HF
 L6MK1edEEuji1HIuypxoDb1OCwJn4IbPxoy5xCEz+5gvcG8gC9cCcns9+rY4SDi+hqSK
 1IqgDd4Ari2bRlA4wkExlMs6VP3NNa5XR2rqJgsxb6Qeo5TEN/xJnorg5SdT6tcYCgfd
 8Zi5RHN6s3F2hj2Q4bU/JwgTyjgw9J+bXBlAgCLVZ97eu960x1t69oY7XksH3mEZZxvf
 17yBbT7pOQZEPQ6O1v9ODy1zbB47ocmWKIwW3vwR80hiOJGDfT/fxIhJlOdpgIbQBiGq
 uV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355019; x=1690959819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHJNnsXc4d/K/z6VhqA+wtVe+B6ZApclNDr3oVz3Qng=;
 b=lLbB9ZgKqCx9VGDC1w4QNeeR52Nz4NzHd/4VoBGMFSg/Nl/TG8JUfa5/Mj/Z4s8rwj
 XOwGAw8oJECXpQuEgS72/6wzWSc5ioR0RSsAN/pjH+qDIXedT7InEYcx1Y5C9i+eRjea
 QdDImvT9vPUGhStjRkUqY5UscJ7XJjVPvxiMCpe7kn+7qJKOmnXW2JhlYu7/cMZXNCSr
 9xxn8+CtL9lNnuLxPSrm2/NOuL0f1DyEeso9O6RspEUq/uw+OPhcrn2aNa+atZ4qpbrS
 TLa3P3aME3zIrkL+3kKOAu/U50n8XhOUbrZ9ALVQk95SYhxujw8799Q7G56r2IIG53QW
 92Sg==
X-Gm-Message-State: ABy/qLY7NsXze7LFOjXeIftcymEtYVby1i1t/4VFsFBcbM/q7/kmGW65
 u0FWxDIHeC/n7NzFTltbJ13gWA==
X-Google-Smtp-Source: APBJJlGnDIhxl1WovcgmyilqMxw7RAGIcmctqxCam8gYqUxk7SpEEL3pcCtNf0MDvcl2CVE72MU7cg==
X-Received: by 2002:a05:6402:744:b0:522:5873:d4aa with SMTP id
 p4-20020a056402074400b005225873d4aamr828651edy.23.1690355019657; 
 Wed, 26 Jul 2023 00:03:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:39 -0700 (PDT)
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
Date: Wed, 26 Jul 2023 09:03:21 +0200
Message-Id: <20230726070322.103871-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 7/8] ARM: dts: imx27: drop incorrect reg in
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
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts  | 19 ++++--------
 .../imx/imx27-eukrea-mbimxsd27-baseboard.dts  | 25 ++++++----------
 .../nxp/imx/imx27-phytec-phycard-s-rdk.dts    | 19 ++++--------
 .../dts/nxp/imx/imx27-phytec-phycore-rdk.dts  | 21 ++++++-------
 .../dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 30 +++++++------------
 5 files changed, 41 insertions(+), 73 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts b/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts
index 6f1e8ce9e76e..a21f1f7c24b8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts
@@ -54,19 +54,12 @@ user {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_max5821: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "max5821-reg";
-			regulator-min-microvolt = <2500000>;
-			regulator-max-microvolt = <2500000>;
-			regulator-always-on;
-		};
+	reg_max5821: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "max5821-reg";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-always-on;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index 9c3ec82ec7e5..145e459625b3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -54,22 +54,15 @@ led2 {
 		};
 	};
 
-	regulators {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "simple-bus";
-
-		reg_lcd: regulator@0 {
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_lcdreg>;
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "LCD";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio1 25 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	reg_lcd: regulator-0 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcdreg>;
+		regulator-name = "LCD";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts
index 188639738dc3..25442eba21c1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts
@@ -33,19 +33,12 @@ timing0: 640x480 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_3v3: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "3V3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_3v3: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
index 344e77790152..7f0cd4d3ec2d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
@@ -37,18 +37,15 @@ timing0: 240x320 {
 		};
 	};
 
-	regulators {
-		regulator@2 {
-			compatible = "regulator-fixed";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_csien>;
-			reg = <2>;
-			regulator-name = "CSI_EN";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio2 24 GPIO_ACTIVE_LOW>;
-			regulator-always-on;
-		};
+	regulator-2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_csien>;
+		regulator-name = "CSI_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
 	};
 
 	usbphy {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
index 3d10273177e9..7191e10712b9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
@@ -15,26 +15,18 @@ memory@a0000000 {
 		reg = <0xa0000000 0x08000000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
+	reg_3v3: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 
-		reg_3v3: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "3V3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		reg_5v0: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "5V0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-		};
+	reg_5v0: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 	};
 
 	usbphy {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
