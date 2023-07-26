Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F99762C6E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA529C6B45C;
	Wed, 26 Jul 2023 07:03:37 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A7B8C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:36 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-52227142a27so4588510a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355015; x=1690959815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KDOr8lmHhSQc4kSLIBTngZ/PO46LSeqTh+hZ/Wh1rk=;
 b=PdwjHsUAYpm2rxK8shLHLhFMW/8Geg9oWWPt/GAjP2tNoQcI9/cnSNqdWjSQNbq5Pi
 Pcs8g3lPlbXgLJsjvOo/CBLMXQCU5frh+HkjVCyi++maUcMrN50i7zahD9rOt+ZSszRw
 he1tg4GHgSvm7Dd3p0KcyzlS9VIdDy53wbeExZdVi5aXMY6DXdw3pWsEyg1eD6Nm2ivB
 Z7IAln7yvRVxnrO07e9gaHHEcwSkKtKAhdrnMU2ukN8S5x8QS85bSYtaNz2KDJVX3ysf
 jXvC60uov9gJMA3axrNetLSkYL60An3qXsopMurrLI8+UdV+LDKHIMZ3ec26vYWhmoKb
 FraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355015; x=1690959815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KDOr8lmHhSQc4kSLIBTngZ/PO46LSeqTh+hZ/Wh1rk=;
 b=ef3VpJ6Q4pvVyDWt9qCbE23CBPCTmIUxSPkbTOpqweuWmdIYvF6fademtLU2M2/Ink
 Y7CZNaa7z4o29tHtptFHvt4WmUZrIAOQ6wbcqRN91PLNcphIfTi3YfGnj/lPNfYCf5ox
 HwB6nMrJ2u4BafCHAspsy5z/9H+3knjHLH4JK1bvJ+ImhgwWEZF/kKcCT4UWER9f62Et
 Uqsh5gQcG+A13eF7sCkgkgHBqAdPeduQLY3+6gatQlO6FN6D1szzWO+hlbdf1VU9pSKn
 TTJixIhtTZgj39hbxXT4uBZtLzOGcq4OLMtubxGCiJxLxtCeUFwuI1Z7X+ix1lS7Jh2/
 XH4g==
X-Gm-Message-State: ABy/qLYK5qBn2ZPLBWP9Mx0MBt3vV5CsE7Qert/lamKM8jgX3GyOkvgh
 Q2oWSrio7Fc4RleJ9uDAOcprtg==
X-Google-Smtp-Source: APBJJlFrQ7uiahYO7hvBRb11BV4XesFvHQuCYhuaQHwgQ7xYZrKDEkBE+yyKvIQcMaeYcivkC9ir7Q==
X-Received: by 2002:a05:6402:180f:b0:51d:88b2:872e with SMTP id
 g15-20020a056402180f00b0051d88b2872emr615987edy.42.1690355015815; 
 Wed, 26 Jul 2023 00:03:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:35 -0700 (PDT)
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
Date: Wed, 26 Jul 2023 09:03:19 +0200
Message-Id: <20230726070322.103871-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 5/8] ARM: dts: imx23: drop incorrect reg in
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
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts | 23 +++++++------------
 .../boot/dts/nxp/mxs/imx23-stmp378x_devb.dts  | 19 +++++----------
 2 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts b/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
index 0729e72f2283..229e727b222e 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
@@ -101,21 +101,14 @@ usb0: usb@80080000 {
 		};
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
-			enable-active-high;
-			startup-delay-us = <300>; /* LAN9215 requires a POR of 200us minimum */
-			gpio = <&gpio0 17 0>;
-		};
+	reg_usb0_vbus: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		startup-delay-us = <300>; /* LAN9215 requires a POR of 200us minimum */
+		gpio = <&gpio0 17 0>;
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts b/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts
index da4b88f32eaa..69124ba6a666 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts
@@ -59,18 +59,11 @@ duart: serial@80070000 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_vddio_sd0: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vddio-sd0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio1 29 0>;
-		};
+	reg_vddio_sd0: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-sd0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio1 29 0>;
 	};
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
