Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9B32B5DB
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6951C57B71;
	Wed,  3 Mar 2021 08:05:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9045C57B70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:45 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c16so4123411ply.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qdgr/ifpE0o61aoybVYDv5ppFI/eCDrAFK0Jy6HzHYs=;
 b=IgvyOfQ7ScCWn+dZ3+7IR7OC6NLmseM1HqfYVLpQpM/4yoTCj11NNXGdCyAqAHdj7Q
 9TZ+lofj7BWRaZYf/lmh+iDbxsBAoeuW5tiq97SVe7hkYuGmWi7Mn4BwXp0koEaLPONH
 UTLpipmsFE/cJ+0UztA7pvy74C/si9kHZVQvQndv7QedcZCBe3S3sCxsin79zXCkCpHH
 bbSP5lF8qCDjJ8Iuct4o+VA2FmftqcQTidzhYyfQeoQuA8x+XVjZxRYNiO/rx80rEgME
 N3sFWfbLaZe2pxp554VtHqHJqcgm/aNVA8cKyXpefhU/Hh/w8d4/ytEdDE6f1qaFSuOD
 PpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qdgr/ifpE0o61aoybVYDv5ppFI/eCDrAFK0Jy6HzHYs=;
 b=sSColB86NPi5Zv5W0+l8X9WYnOJBNP9wGHkvWyc+/XdQzCseLaFq/5CaP9AK7u/hQa
 LfmvL+XpSxwK0RS3QOwAZ6Qxm9qZ+VTP8e3Xu+sDHaCO8xHnE/F1AYDevyqHbcalWtPU
 Za1jraXsRDraJ2B+7Yj5O3T23h8OS8CNHdLUPR/a4cUgzjmjLjfFyNLF6jApHYQhIl4+
 XOwgWI/BIKGFCnIz81YatNMpoYxj7aujKACMFRtVvdXFwU0GDL7Y4SVX6zHNC63x8xwI
 zGQOLNNZ+1Q+KeOct5p+0MTvslyuRXOCg60PXIAXVsJR/remsKH1dfv3s7nUBIE+kDJX
 A9fw==
X-Gm-Message-State: AOAM530LOb7QHWXwlvbXVk+6ZCLLCLmnL4tPcC33eMCt1v9HO3FjgGVZ
 2u3wt2DxCDfbfHmP8/1sedA=
X-Google-Smtp-Source: ABdhPJxYQ4/1gCWvL4vyQt+5Bga3uvBsL7PfVNPdqVAESGdFKi+gCB/AE4F6qLTAqZu1fQC6lMkIrA==
X-Received: by 2002:a17:90b:253:: with SMTP id
 fz19mr8463334pjb.160.1614758744149; 
 Wed, 03 Mar 2021 00:05:44 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:43 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:16 +0800
Message-Id: <1614758717-18223-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 7/8] ARM: dts: stm32: add support for art-pi
	board based on stm32h750xbh6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

This patchset has following changes:

- add stm32h750i-art-pi.dtb
- add dts binding usart3 for bt, uart4 for console
- add dts binding sdmmc2 for wifi
- add stm32h750-art-pi.dts to support art-pi board

board component:
- 8MiB qspi flash
- 16MiB spi flash
- 32MiB sdram
- ap6212 wifi&bt&fm

the detail board information can be found at:
https://art-pi.gitee.io/website/

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/Makefile              |   1 +
 arch/arm/boot/dts/stm32h743.dtsi        |  30 +++++
 arch/arm/boot/dts/stm32h750.dtsi        |   5 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts | 224 ++++++++++++++++++++++++++++++++
 4 files changed, 260 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e75e..a19c5ab9df84 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1071,6 +1071,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32746g-eval.dtb \
 	stm32h743i-eval.dtb \
 	stm32h743i-disco.dtb \
+	stm32h750i-art-pi.dtb \
 	stm32mp153c-dhcom-drc02.dtb \
 	stm32mp157a-avenger96.dtb \
 	stm32mp157a-dhcor-avenger96.dtb \
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 4ebffb0a45a3..981d44051007 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -135,6 +135,22 @@
 			clocks = <&rcc USART2_CK>;
 		};
 
+		usart3: serial@40004800 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004800 0x400>;
+			interrupts = <39>;
+			status = "disabled";
+			clocks = <&rcc USART3_CK>;
+		};
+
+		uart4: serial@40004c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004c00 0x400>;
+			interrupts = <52>;
+			status = "disabled";
+			clocks = <&rcc UART4_CK>;
+		};
+
 		i2c1: i2c@40005400 {
 			compatible = "st,stm32f7-i2c";
 			#address-cells = <1>;
@@ -368,6 +384,20 @@
 			max-frequency = <120000000>;
 		};
 
+		sdmmc2: mmc@48022400 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x10153180>;
+			reg = <0x48022400 0x400>;
+			interrupts = <124>;
+			interrupt-names	= "cmd_irq";
+			clocks = <&rcc SDMMC2_CK>;
+			clock-names = "apb_pclk";
+			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+		};
+
 		exti: interrupt-controller@58000000 {
 			compatible = "st,stm32h7-exti";
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/stm32h750.dtsi b/arch/arm/boot/dts/stm32h750.dtsi
new file mode 100644
index 000000000000..dd9166223c2f
--- /dev/null
+++ b/arch/arm/boot/dts/stm32h750.dtsi
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
+
+#include "stm32h743.dtsi"
+
diff --git a/arch/arm/boot/dts/stm32h750i-art-pi.dts b/arch/arm/boot/dts/stm32h750i-art-pi.dts
new file mode 100644
index 000000000000..84cf70d7800c
--- /dev/null
+++ b/arch/arm/boot/dts/stm32h750i-art-pi.dts
@@ -0,0 +1,224 @@
+/*
+ * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "stm32h750.dtsi"
+#include "stm32h750-pinctrl.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "RT-Thread STM32H750i-ART-PI board";
+	compatible = "st,stm32h750i-art-pi", "st,stm32h750";
+
+	chosen {
+		bootargs = "root=/dev/ram";
+		stdout-path = "serial0:2000000n8";
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x2000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			no-map;
+			size = <0x100000>;
+			linux,dma-default;
+		};
+	};
+
+	aliases {
+		serial0 = &uart4;
+		serial1 = &usart3;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-red {
+			gpios = <&gpioi 8 0>;
+		};
+		led-green {
+			gpios = <&gpioc 15 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wlan_pwr: regulator-wlan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "wl-reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&clk_hse {
+	clock-frequency = <25000000>;
+};
+
+&mac {
+	status = "disabled";
+	pinctrl-0	= <&ethernet_rmii>;
+	pinctrl-names	= "default";
+	phy-mode	= "rmii";
+	phy-handle	= <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&usart2 {
+	pinctrl-0 = <&usart2_pins>;
+	pinctrl-names = "default";
+	status = "disabled";
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&dma1 {
+	status = "okay";
+};
+
+&dma2 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
+	dmas = <&dmamux1 37 0x400 0x05>,
+	       <&dmamux1 38 0x400 0x05>;
+	dma-names = "rx", "tx";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <80000000>;
+
+		partition@0 {
+			label = "root filesystem";
+			reg = <0 0x1000000>;
+		};
+	};
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
+	broken-cd;
+	non-removable;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&wlan_pwr>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+&usart3 {
+	/delete-property/st,hw-flow-ctrl;
+	cts-gpios = <&gpiod 11 GPIO_ACTIVE_LOW>;
+	rts-gpios = <&gpiod 12 GPIO_ACTIVE_LOW>;
+	dmas = <&dmamux1 45 0x400 0x05>,
+	       <&dmamux1 46 0x400 0x05>;
+	dma-names = "rx", "tx";
+	status = "okay";
+
+	bluetooth {
+		host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <115200>;
+	};
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
