Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D734E3AA
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 10:58:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A1B4C57B60;
	Tue, 30 Mar 2021 08:58:52 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD599C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 08:58:49 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id h3so11682885pfr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l40L85yjOAF1nMjx7IR1eqOyevgxGfAORpjk7JeQePU=;
 b=DAnHGbBQe/cRUeQb9G+oQfqXLp37LHSokZLXilL7ZII51fG9eOpi+4hVDI+ggjQalI
 uPyvyLbbb+v2qqnCR4afL9dfwy9/CDC4Dj1CD4rjbyFyT/bsnnoKJ88HDz13Ejc6+dqi
 EVTj+2VBX4ISH0hIMfl+51dmsegAs5gy8RNMN6sNpDAGF5gVXiuw8WxlmN7i1x3TGRPQ
 F45w4m3fN4yC+t6A5O7G6sgjU4Px8JbA4jj2yL98gTnoddthlS4PUMpUIt3aKbe6iPM9
 qjCZUTTiQ3cxOCic/PwYKfEOTYgWF025TRbaak7RMcz6wSZ67PHqcUn4uZsHHh7NoOaj
 O0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l40L85yjOAF1nMjx7IR1eqOyevgxGfAORpjk7JeQePU=;
 b=kPdYjp3dfg3o7kb0gY9YoAYLbg/HYgTgVpE9Sad3FD5TN7VXw5Ba0j1iNlcXwuhKTW
 9fnOILtI97KZSd9iyfPaOHTBKRKtPetb7hHt1HzC25/ErgouqAloIyfNX9irLD0gQ3LP
 EQp0ZJWxs/6ySPXR8VUgLreISIm72Hy9UHDHVeXY4oIQXu4e6+tEgp2mw2fm6c/i9+hC
 87m0HHOi7Lkwg3ZK5Uo8uoW19Yn9uP42GkD6rXQWSZRdpOzhkVY1ZYY6n7/kEcdC7maP
 9DvH+3ZmS8rJmyJwJOGaG2tegUqgbi+pNmykd7d/i8n6d4idtDpfYQzCo7TKjz2Dkwus
 lqFg==
X-Gm-Message-State: AOAM533Dro+8381MXdx/skkt2rVHaO3VofjJRU0/avIGl9crTuFDji+F
 u2XqV4DrSOiFju0Aw2m6uLc=
X-Google-Smtp-Source: ABdhPJzp0OZqbrC42l6F/8me/1akRAMkUI0IZO4k0EidXWF4ZKtX4Mf8+Kps3Su4R9ZV6ZJHjCxKbA==
X-Received: by 2002:a62:e119:0:b029:1f8:9345:a099 with SMTP id
 q25-20020a62e1190000b02901f89345a099mr29752361pfh.21.1617094728280; 
 Tue, 30 Mar 2021 01:58:48 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y8sm20952642pfp.140.2021.03.30.01.58.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 01:58:48 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 16:58:22 +0800
Message-Id: <1617094704-10040-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
References: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v8 4/6] ARM: dts: stm32: add support for
	art-pi board based on stm32h750xbh6
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

- introduce stm32h750.dtsi to support stm32h750 value line
- add stm32h750i-art-pi.dtb (arch/arm/boot/dts/Makefile)
- add stm32h750-art-pi.dts to support art-pi board

art-pi board component:
- 8MiB qspi flash
- 16MiB spi flash
- 32MiB sdram
- ap6212 wifi&bt&fm

the detail board information can be found at:
https://art-pi.gitee.io/website/

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v8:
- move file stm32h743.dtsi submit position to [PATCH V8 3/6]

 arch/arm/boot/dts/Makefile              |   1 +
 arch/arm/boot/dts/stm32h750.dtsi        |   6 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts | 229 ++++++++++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
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
diff --git a/arch/arm/boot/dts/stm32h750.dtsi b/arch/arm/boot/dts/stm32h750.dtsi
new file mode 100644
index 000000000000..41e3b1e3a874
--- /dev/null
+++ b/arch/arm/boot/dts/stm32h750.dtsi
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
+
+#include "stm32h743.dtsi"
+
+
diff --git a/arch/arm/boot/dts/stm32h750i-art-pi.dts b/arch/arm/boot/dts/stm32h750i-art-pi.dts
new file mode 100644
index 000000000000..9bb73bb61901
--- /dev/null
+++ b/arch/arm/boot/dts/stm32h750i-art-pi.dts
@@ -0,0 +1,229 @@
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
+ *
+ * For art-pi board resources, you can refer to link:
+ * 	https://art-pi.gitee.io/website/
+ */
+
+/dts-v1/;
+#include "stm32h750.dtsi"
+#include "stm32h7-pinctrl.dtsi"
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
+&dma1 {
+	status = "okay";
+};
+
+&dma2 {
+	status = "okay";
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
+&usart2 {
+	pinctrl-0 = <&usart2_pins>;
+	pinctrl-names = "default";
+	status = "disabled";
+};
+
+&usart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usart3_pins>;
+	dmas = <&dmamux1 45 0x400 0x05>,
+	       <&dmamux1 46 0x400 0x05>;
+	dma-names = "rx", "tx";
+	st,hw-flow-ctrl;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
+		max-speed = <115200>;
+	};
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
