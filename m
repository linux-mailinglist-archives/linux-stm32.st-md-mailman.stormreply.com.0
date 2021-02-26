Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE34325DDD
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 08:03:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B29A5C57B61;
	Fri, 26 Feb 2021 07:03:48 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAFE2C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:03:46 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t25so5689219pga.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NBz1gQTegMTBk7VZTnZCpJq+81uQkfMqVu5DuOlqxI=;
 b=V0GHHKbRRczf2drikjIjOz8qfx12rEOKwj05+6yRlTEw3412Q/pbBZtG4ju/1sSMMK
 YXJBLwIqF+YJLRFRftuXxV61Nq4Qcmn2OJr9Nu0AldV6edIAW0dGOYJv/km0Y5vjASJB
 f2eOXPTCA8lS01snbBR0qDblVMUqKrUNaouIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8NBz1gQTegMTBk7VZTnZCpJq+81uQkfMqVu5DuOlqxI=;
 b=lqJHYN/lvOV0PvPlinaGF+O73CzD1mxV81mgd+mx7IHkuMV/lYpmbLlk21m81Bjb1Q
 hgoPGWpcN7ZjzCoBdWqy4UX/WhT7Fuuiy5pKRw+EU/wO3VnbcHLM72HbIX8L5rCjDajD
 xGrqf+E3PF9ydpp+ZXv8vR7nNOy697o/vjjaLDsKZIUCvuI2klPaN6+ST1SuiupoZ6iY
 1wxv2mRlFMuiLLKxLpe+QCDb0xm7D0l2IQ8VIew3G8wKXx9UyR3oQ8gy7WPkhbMaahYc
 fNRk7TDFnhFJN7NdNjPcENihvIXCQlNHJhPA1AO5C1WqtzNaeP9eJhTvtOyeh6km/Etq
 McjA==
X-Gm-Message-State: AOAM531flp0ct9lYYG1CF6rIU5UIO7JHRN1DCXSqUEXNndu+uSNOK3zu
 PybfKO96PPtMTQIkDs4Ttwi61Q==
X-Google-Smtp-Source: ABdhPJzFUg/z8lwqLAydLcpx6WBH6q9sosi+9Q762WNpEgj6XgOh8GqjTmfooKnZZ/2KRtsIdUMDaw==
X-Received: by 2002:a62:184f:0:b029:1ed:e5ae:889b with SMTP id
 76-20020a62184f0000b02901ede5ae889bmr2018068pfy.50.1614323025308; 
 Thu, 25 Feb 2021 23:03:45 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.220])
 by smtp.gmail.com with ESMTPSA id f7sm7592156pjh.45.2021.02.25.23.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 23:03:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Feb 2021 12:32:59 +0530
Message-Id: <20210226070304.8028-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226070304.8028-1-jagan@amarulasolutions.com>
References: <20210226070304.8028-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Francesco Utel <francesco.utel@engicam.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Mirko Ardinghi <mirko.ardinghi@engicam.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 05/10] ARM: dts: stm32: Add Engicam
	MicroGEA STM32MP1 MicroDev 2.0 7" OF
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

7" OF is a capacitive touch 7" Open Frame panel solutions with
- 7" AUO B101AW03 LVDS panel
- EDT, FT5526 Touch

MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

MicroDev 2.0 is a general purpose miniature carrier board with CAN,
LTE and LVDS panel interfaces.

MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0
7" Open Frame Solution board.

Add support for it.

Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
Signed-off-by: Francesco Utel <francesco.utel@engicam.com>
Signed-off-by: Mirko Ardinghi <mirko.ardinghi@engicam.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- don't create carrier board dtsi, add it in final dts.

 arch/arm/boot/dts/Makefile                    |   1 +
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts | 154 ++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b4a9cd071f99..1332622a3f9f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1072,6 +1072,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157a-dk1.dtb \
 	stm32mp157a-iot-box.dtb \
 	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
+	stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb \
 	stm32mp157a-stinger96.dtb \
 	stm32mp157c-dhcom-pdk2.dtb \
 	stm32mp157c-dhcom-picoitx.dtb \
diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
new file mode 100644
index 000000000000..674b2d330dc4
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/dts-v1/;
+#include "stm32mp157.dtsi"
+#include "stm32mp157a-microgea-stm32mp1.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Engicam MicroGEA STM32MP1 MicroDev 2.0 7\" Open Frame";
+	compatible = "engicam,microgea-stm32mp1-microdev2.0-of7",
+		     "engicam,microgea-stm32mp1", "st,stm32mp157";
+
+	aliases {
+		serial0 = &uart4;
+		serial1 = &uart8;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpiod 13 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	lcd_3v3: regulator-lcd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpiof 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		power-supply = <&panel_pwr>;
+	};
+
+	panel_pwr: regulator-panel-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpiob 10 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+	};
+
+	panel {
+		compatible = "auo,b101aw03";
+		backlight = <&backlight>;
+		enable-gpios = <&gpiof 2 GPIO_ACTIVE_HIGH>;
+		power-supply = <&lcd_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	i2c-scl-falling-time-ns = <20>;
+	i2c-scl-rising-time-ns = <185>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	status = "okay";
+};
+
+&ltdc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ltdc_pins>;
+	status = "okay";
+
+	port {
+		ltdc_ep0_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&pinctrl {
+	ltdc_pins: ltdc {
+		pins {
+			pinmux = <STM32_PINMUX('G', 10, AF14)>,	/* LTDC_B2 */
+				 <STM32_PINMUX('H', 12, AF14)>,	/* LTDC_R6 */
+				 <STM32_PINMUX('H', 11, AF14)>,	/* LTDC_R5 */
+				 <STM32_PINMUX('D', 10, AF14)>,	/* LTDC_B3 */
+				 <STM32_PINMUX('D', 9, AF14)>,	/* LTDC_B0 */
+				 <STM32_PINMUX('E', 5, AF14)>,	/* LTDC_G0 */
+				 <STM32_PINMUX('E', 6, AF14)>,	/* LTDC_G1 */
+				 <STM32_PINMUX('E', 13, AF14)>,	/* LTDC_DE */
+				 <STM32_PINMUX('E', 15, AF14)>,	/* LTDC_R7 */
+				 <STM32_PINMUX('G', 7, AF14)>,	/* LTDC_CLK */
+				 <STM32_PINMUX('G', 12, AF14)>,	/* LTDC_B1 */
+				 <STM32_PINMUX('H', 2, AF14)>,	/* LTDC_R0 */
+				 <STM32_PINMUX('H', 3, AF14)>,	/* LTDC_R1 */
+				 <STM32_PINMUX('H', 8, AF14)>,	/* LTDC_R2 */
+				 <STM32_PINMUX('H', 9, AF14)>,	/* LTDC_R3 */
+				 <STM32_PINMUX('H', 10, AF14)>,	/* LTDC_R4 */
+				 <STM32_PINMUX('H', 13, AF14)>,	/* LTDC_G2 */
+				 <STM32_PINMUX('H', 14, AF14)>,	/* LTDC_G3 */
+				 <STM32_PINMUX('H', 15, AF14)>,	/* LTDC_G4 */
+				 <STM32_PINMUX('I', 0, AF14)>,	/* LTDC_G5 */
+				 <STM32_PINMUX('I', 1, AF14)>,	/* LTDC_G6 */
+				 <STM32_PINMUX('I', 2, AF14)>,	/* LTDC_G7 */
+				 <STM32_PINMUX('I', 4, AF14)>,	/* LTDC_B4 */
+				 <STM32_PINMUX('I', 5, AF14)>,	/* LTDC_B5 */
+				 <STM32_PINMUX('B', 8, AF14)>,	/* LTDC_B6 */
+				 <STM32_PINMUX('I', 7, AF14)>,	/* LTDC_B7 */
+				 <STM32_PINMUX('I', 9, AF14)>,	/* LTDC_VSYNC */
+				 <STM32_PINMUX('I', 10, AF14)>;	/* LTDC_HSYNC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+	};
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	disable-wp;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	st,neg-edge;
+	vmmc-supply = <&vdd>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	status = "okay";
+};
+
+/* J31: RS323 */
+&uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_pins_a>;
+	status = "okay";
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
