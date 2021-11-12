Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA4044E19E
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 06:39:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44237C5EC73;
	Fri, 12 Nov 2021 05:39:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0EC6C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 05:39:12 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso6677854pjo.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 21:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwSmaZ0/XBjCCpcjkMDJ976dMmOGPgUfSWLa9+mY8As=;
 b=LsRTIR3Qwpo3xYnQju230XT6ajXoYMJ4sg7/11NlrfGxKyymx1z915yRin5ORS7iJa
 Cv+YJbpWTh0wsKxHrecAzLKua8xlqEiCQ6zgVmyFs6NTzVdWbjARc6bpiiW1IXb7+Hqc
 iEzraWwhtZP3VJntGgJEaIe4YYhy1y8/vK9u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwSmaZ0/XBjCCpcjkMDJ976dMmOGPgUfSWLa9+mY8As=;
 b=5o9jHl3wX+f9XNx09/G3AWDT9vyIe4Zmi2VuAivhy5zATIt1w1CBzVvWFH8ydl9I6n
 lWCNPw93IzlJgoSt+TJyHqavaZhztihRhTtuKTkuGy6iuSM18QgbJUm/6QLECfXYjAbG
 tKtm8fxGdsbgLjjb9RxL1LepeJbvmq16scdl0CG+J9OqyJVzHhd0K59H9w0GGN/I6RHC
 Jg7w2aEdTegdCGvPJkEZ8cxlQqTu4nNNkXizHLCkMisIqBKXrCy4niOZ1Urj1CWkT5bZ
 DWP2xLjlIvN92R3wHO5ak1WDbUm92qilvGhG7dTqB4n+O3hTIXstIx/hYZRsPAZcptsK
 IKEw==
X-Gm-Message-State: AOAM531IOOejujrf6NaNksP0ZTTGov3y5fULs32u/JbOjZKIyQy/vnQ/
 ERkca/wfhMrWfB0xIDN8gE9YVg==
X-Google-Smtp-Source: ABdhPJzeFsEK8Jc335z0N/alGaTtbAlORtl477rEH9WM9e0Tb0J3yfZCT2kMOeWDWNvqfrf37hTHBg==
X-Received: by 2002:a17:902:8f93:b0:142:8731:1a5d with SMTP id
 z19-20020a1709028f9300b0014287311a5dmr5490076plo.60.1636695551306; 
 Thu, 11 Nov 2021 21:39:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:de19:8cdf:97cf:a6b1])
 by smtp.gmail.com with ESMTPSA id v38sm3764345pgl.38.2021.11.11.21.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:10 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 12 Nov 2021 11:08:56 +0530
Message-Id: <20211112053856.18412-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112053856.18412-1-jagan@amarulasolutions.com>
References: <20211112053856.18412-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: Add Engicam i.Core
	STM32MP1 C.TOUCH 2.0 10.1" OF
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

ARM: dts: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0

Engicam C.TOUCH 2.0 is an EDIMM compliant general purpose Carrier
board.

Genaral features:
- Ethernet 10/100
- Wifi/BT
- USB Type A/OTG
- Audio Out
- CAN
- 10" LVDS Panel (SN65DSI84 DSI-LVDS bridge on SoM)

i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

10.1" OF is a capacitive touch 10.1" Open Frame panel solutions.

i.Core STM32MP1 needs to mount on top of C.TOUCH 2.0 carrier with
pluged 10.1" OF for creating complete i.Core STM32MP1 C.TOUCH 2.0
10.1" Open Frame board.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 arch/arm/boot/dts/Makefile                    |   1 +
 ...tm32mp157a-icore-stm32mp1-ctouch2-of10.dts | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0de64f237cd8..641220e970e8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1140,6 +1140,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
 	stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb \
 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
+	stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb \
 	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
 	stm32mp157a-stinger96.dtb \
 	stm32mp157c-dhcom-pdk2.dtb \
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
new file mode 100644
index 000000000000..351be43b3d39
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/dts-v1/;
+#include "stm32mp157.dtsi"
+#include "stm32mp157a-icore-stm32mp1.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1\" Open Frame";
+	compatible = "engicam,icore-stm32mp1-ctouch2-of10",
+		     "engicam,icore-stm32mp1", "st,stm32mp157";
+
+	aliases {
+		serial0 = &uart4;
+	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpiod 13 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	panel {
+		compatible = "ampire,am-1280800n3tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&v3v3>;
+
+		port {
+			panel_in_lvds: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+};
+
+&dsi {
+	status = "okay";
+	phy-dsi-supply = <&reg18>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			dsi_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	i2c-scl-falling-time-ns = <20>;
+	i2c-scl-rising-time-ns = <185>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c6_pins_a>;
+	pinctrl-1 = <&i2c6_sleep_pins_a>;
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+					data-lanes = <0 1>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in_lvds>;
+				};
+			};
+		};
+	};
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_ep0_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&dsi_in>;
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
+	vmmc-supply = <&v3v3>;
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
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
