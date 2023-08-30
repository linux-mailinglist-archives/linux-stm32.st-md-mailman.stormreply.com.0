Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F7578D612
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 15:17:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73BEAC6B444;
	Wed, 30 Aug 2023 13:17:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59DE8C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 11:44:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-500c7796d8eso2046492e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 04:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693395840; x=1694000640;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N1Sbb7p3SrQd/DNgMqL38yyp7CsvX5fC331B45U0y/M=;
 b=YGIE0Q1nybhqVILZYVbJliNJrTp3MTaFgIuaaU3XM9ijDNgFAw8U7CjF380AcpwTBi
 +wuhbylMjIZJyonyH7C3Qnz0H+sumN4N0lztEytI+0PE7SjtjoZTcFWIzSv3zLhbnGuk
 MyEO7smqg3yFLLf0trqv0RH8G6NWomf1dO4Dj/kG/SKANmaIrM5UEEqOy17oHhU+ECY7
 06vSfPxXDQxSNuTFZ12SxbqlFrDGzjkeE6SL8bkVeqytxWO6IC+Ret4ea6SJsfmy8HCy
 LotFSNo6ZjPGecpVqtSjImW80YS4GNRvLJRiQKfOAbsDQQyiRQzIe+Mi2jmoS7v96K+h
 r+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693395840; x=1694000640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1Sbb7p3SrQd/DNgMqL38yyp7CsvX5fC331B45U0y/M=;
 b=FF/S4Wu87xR7b8FEFU8QyLWCAtRw0aveyfU9/Y9niAGlxWoANbhUKm+1rwJuLWrORu
 DC8Ipd0mMQaX4kSkjwH+atsUNMYffoNnJ2gVi3Al9EHdKecFtp3n/pGp2j+BMQosquAJ
 9kgKK+1nEX8r2BGr7zYqylTC8/zlvqzE1+H+opbhrJ4KRMuEqrEVrPSLs6RqAKveb+Rw
 XVGvauqL46Kww4AgVvDG4/3vjkf1PUoiAya7hE+8yC4shMQ54DD8JfJr+9VO8JLRc32W
 G1LkNMuE9IbpTi0+O83NSoFl8Xx3DkWggyyx4Fut+/FkaEnfAZ3s4f/pT88qRd7epe4W
 Pe7g==
X-Gm-Message-State: AOJu0YxtMhLb9HYJYQGU0hEnlSq6Vq9ooMU9sp9/CJCCCyEiWEcM61w6
 UG7G+b/h2cDMN+u0et1o6xY=
X-Google-Smtp-Source: AGHT+IHn1ot3X1Bhc70IkbJ8GPeL+13BQdi0etDufb/n7hhbmzk2UfubMhyREYyA1quTwduEUDiKbg==
X-Received: by 2002:ac2:4e82:0:b0:500:882b:e55a with SMTP id
 o2-20020ac24e82000000b00500882be55amr1399170lfr.45.1693395840186; 
 Wed, 30 Aug 2023 04:44:00 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac24143000000b004ff8f448343sm2336074lfi.33.2023.08.30.04.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 04:43:59 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 30 Aug 2023 14:43:35 +0300
Message-Id: <20230830114335.106344-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Aug 2023 13:17:28 +0000
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add MyirTech MYD-YA15XC-T
	development board support
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

Add support for the MyirTech MYD-YA15XC-T development board.

General features:
 - STM32MP151
 - 256MB RAM
 - 2xUSB HOST
 - USB-C OTG
 - Gigabit ethernet
 - UART
 - Boot from NAND, eMMC, SD

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 arch/arm/boot/dts/st/Makefile                 |   3 +-
 .../boot/dts/st/stm32mp15x-myirtech-myc.dtsi  | 351 ++++++++++++++
 .../boot/dts/st/stm32mp15x-myirtech-myd.dts   | 457 ++++++++++++++++++
 3 files changed, 810 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi
 create mode 100644 arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index b3e9d29390e3..5b18767bbd4f 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -57,7 +57,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-ev1-scmi.dtb \
 	stm32mp157c-lxa-mc1.dtb \
 	stm32mp157c-odyssey.dtb \
-	stm32mp157c-phycore-stm32mp1-3.dtb
+	stm32mp157c-phycore-stm32mp1-3.dtb \
+	stm32mp15x-myirtech-myd.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
 	ste-hrefprev60-stuib.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi
new file mode 100644
index 000000000000..7fe858c9622f
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myc.dtsi
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+
+#include "stm32mp151.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+
+/ {
+	model = "MYIR MYC-YA15XC-T";
+	compatible = "myir,myc-stm32mp15x", "st,stm32mp151";
+
+	aliases {
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		i2c2 = &i2c3;
+		i2c3 = &i2c4;
+		i2c4 = &i2c5;
+		i2c5 = &i2c6;
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x10000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		optee: optee@de000000 {
+			reg = <0xde000000 0x02000000>;
+			no-map;
+		};
+	};
+
+	vin_som: vin_som {
+		compatible = "regulator-fixed";
+		regulator-name = "vin_som";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_cpu: led_cpu {
+			label = "som:cpu";
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_CPU;
+			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+			linux,default-trigger = LED_FUNCTION_CPU;
+		};
+	};
+};
+
+&bsec {
+	board_id: board_id@ec {
+		reg = <0xec 0x4>;
+		st,non-secure-otp;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vddcore>;
+};
+
+&dts {
+	status = "okay";
+};
+
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_a>;
+	pinctrl-1 = <&fmc_sleep_pins_a>;
+	status = "okay";
+
+	nand-controller@4,0 {
+		status = "okay";
+
+		nand@0 {
+			reg = <0>;
+			nand-on-flash-bbt;
+			nand-ecc-strength = <4>;
+			nand-ecc-step-size = <512>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nand_parts: partitions {
+				compatible = "fixed-partitions";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				partition@0 {
+					label = "fsbl1";
+					reg = <0x0 0x80000>;
+				};
+
+				partition@80000 {
+					label = "fsbl2";
+					reg = <0x80000 0x80000>;
+				};
+
+				partition@100000 {
+					label = "matadata1";
+					reg = <0x100000 0x80000>;
+				};
+
+				partition@180000 {
+					label = "matadata2";
+					reg = <0x180000 0x80000>;
+				};
+
+				partition@200000 {
+					label = "fip-a1";
+					reg = <0x200000 0x400000>;
+				};
+
+				partition@600000 {
+					label = "fip-a2";
+					reg = <0x600000 0x400000>;
+				};
+
+				partition@a00000 {
+					label = "fip-b1";
+					reg = <0xa00000 0x400000>;
+				};
+
+				partition@e00000 {
+					label = "fip-b2";
+					reg = <0xe00000 0x400000>;
+				};
+
+				partition@1200000 {
+					label = "system";
+					reg = <0x01200000 0>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c4_pins_a>;
+	pinctrl-1 = <&i2c4_sleep_pins_a>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+			buck1-supply = <&vin_som>;
+			buck2-supply = <&vin_som>;
+			buck3-supply = <&vin_som>;
+			buck4-supply = <&vin_som>;
+			ldo1-supply = <&v3v3>;
+			ldo4-supply = <&vin_som>;
+			vref_ddr-supply = <&vin_som>;
+			boost-supply = <&vin_som>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore: buck1 {
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd: buck3 {
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			v3v3: buck4 {
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+			};
+
+			vdda: ldo1 {
+				regulator-name = "vdda";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-always-on;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			bst_out: boost {
+				regulator-name = "bst_out";
+			};
+
+			vbus_otg: pwr_sw1 {
+				regulator-name = "vbus_otg";
+				regulator-active-discharge;
+			};
+
+			vbus_sw: pwr_sw2 {
+				regulator-name = "vbus_sw";
+				regulator-active-discharge;
+			};
+		};
+
+		onkey: onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
+		};
+	};
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+		num-addresses = <8>;
+		wp-gpios = <&gpioa 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
+	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	interrupt-parent = <&exti>;
+	interrupts = <68 IRQ_TYPE_EDGE_RISING>;
+	status = "okay";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&vdd>;
+	mmc-ddr-3_3v;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts
new file mode 100644
index 000000000000..ad8dd9ee085c
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15x-myirtech-myd.dts
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
+
+/dts-v1/;
+
+#include "stm32mp15x-myirtech-myc.dtsi"
+
+#include <dt-bindings/net/qca-ar803x.h>
+
+/ {
+	model = "MYIR MYD-YA15XC-T";
+	compatible = "myir,myd-stm32mp15x", "myir,myc-stm32mp15x", "st,stm32mp151";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm2 0 100000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <256>;
+		default-brightness-level = <255>;
+	};
+
+	panel: panel {
+		compatible = "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		enable-gpios = <&gpioi 3 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
+		power-supply = <&vdd_3v3>;
+		height-mm = <0>;
+		width-mm = <0>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+	};
+
+	vin: vin {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vdd_3v3: vdd_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&v3v3>;
+	};
+};
+
+&leds {
+	led_live: led_live {
+		label = "board:live";
+		color = <LED_COLOR_ID_BLUE>;
+		default-state = "off";
+		function = LED_FUNCTION_HEARTBEAT;
+		gpios = <&extgpio 4 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = LED_FUNCTION_HEARTBEAT;
+		panic-indicator;
+	};
+};
+
+&vin_som {
+	vin-supply = <&vin>;
+};
+
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins &i2c2_pins_z>;
+	pinctrl-1 = <&i2c2_sleep_pins &i2c2_sleep_pins_z>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	extgpio: pcf8575@20 {
+		compatible = "nxp,pcf8575";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	typec: stusb1600@28 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&stusb1600_pins>;
+		compatible = "st,stusb1600";
+		reg = <0x28>;
+		interrupt-parent = <&gpioa>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&vin>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			power-opmode = "default";
+
+			port {
+				con_usbotg_hs_ep: endpoint {
+					remote-endpoint = <&usbotg_hs_ep>;
+				};
+			};
+		};
+	};
+
+	rx8025: rtc@32 {
+		compatible = "epson,rx8025";
+		reg = <0x32>;
+	};
+};
+
+&ethernet0 {
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		reset-gpios = <&gpiog 3 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <2000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@6 {
+			reg = <6>;
+			qca,clk-out-frequency = <125000000>;
+			qca,clk-out-strength = <AR803X_STRENGTH_FULL>;
+		};
+	};
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins>;
+	pinctrl-1 = <&ltdc_sleep_pins>;
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sai1_pins>;
+	pinctrl-1 = <&sai1_sleep_pins>;
+	clocks = <&rcc SAI1>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "x8k", "x11k";
+	status = "okay";
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpioa 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
+	st,neg-edge;
+	vmmc-supply = <&vdd>;
+	status = "okay";
+};
+
+&spi5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi5_pins>;
+	cs-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>,
+		   <&gpiof 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	status = "okay";
+};
+
+&timers2 {
+	status = "okay";
+
+	pwm2: pwm {
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&tim2_pwm_pins>;
+		pinctrl-1 = <&tim2_pwm_sleep_pins>;
+		status = "okay";
+	};
+};
+
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins>;
+	pinctrl-1 = <&uart4_sleep_pins>;
+	pinctrl-2 = <&uart4_idle_pins>;
+	status = "okay";
+};
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	phy-names = "usb";
+	status = "okay";
+};
+
+&usbotg_hs {
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	usb-role-switch;
+	vbus-supply = <&vbus_otg>;
+	status = "okay";
+
+	port {
+		usbotg_hs_ep: endpoint {
+			remote-endpoint = <&con_usbotg_hs_ep>;
+		};
+	};
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+	st,tune-hs-dc-level = <2>;
+	st,enable-fs-rftime-tuning;
+	st,enable-hs-rftime-reduction;
+	st,trim-hs-current = <15>;
+	st,trim-hs-impedance = <1>;
+	st,tune-squelch-level = <3>;
+	st,tune-hs-rx-offset = <2>;
+	st,no-lsfs-sc;
+
+	connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vin>;
+	};
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+	st,tune-hs-dc-level = <2>;
+	st,enable-fs-rftime-tuning;
+	st,enable-hs-rftime-reduction;
+	st,trim-hs-current = <15>;
+	st,trim-hs-impedance = <1>;
+	st,tune-squelch-level = <3>;
+	st,tune-hs-rx-offset = <2>;
+	st,no-lsfs-sc;
+};
+
+&pinctrl {
+	i2c2_pins: i2c2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 4, AF4)>;		/* I2C2_SCL */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins: i2c2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 4, ANALOG)>;	/* I2C2_SCL */
+		};
+	};
+
+	ltdc_pins: ltdc-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G',  7, AF14)>,		/* LCD_CLK */
+				 <STM32_PINMUX('I', 10, AF14)>,		/* LCD_HSYNC */
+				 <STM32_PINMUX('I',  9, AF14)>,		/* LCD_VSYNC */
+				 <STM32_PINMUX('E', 13, AF14)>,		/* LCD_DE */
+				 <STM32_PINMUX('H',  2, AF14)>,		/* LCD_R0 */
+				 <STM32_PINMUX('H',  3, AF14)>,		/* LCD_R1 */
+				 <STM32_PINMUX('H',  8, AF14)>,		/* LCD_R2 */
+				 <STM32_PINMUX('H',  9, AF14)>,		/* LCD_R3 */
+				 <STM32_PINMUX('H', 10, AF14)>,		/* LCD_R4 */
+				 <STM32_PINMUX('H', 11, AF14)>,		/* LCD_R5 */
+				 <STM32_PINMUX('H', 12, AF14)>,		/* LCD_R6 */
+				 <STM32_PINMUX('E', 15, AF14)>,		/* LCD_R7 */
+				 <STM32_PINMUX('E', 14, AF14)>,		/* LCD_G0 */
+				 <STM32_PINMUX('E',  6, AF14)>,		/* LCD_G1 */
+				 <STM32_PINMUX('H', 13, AF14)>,		/* LCD_G2 */
+				 <STM32_PINMUX('H', 14, AF14)>,		/* LCD_G3 */
+				 <STM32_PINMUX('H', 15, AF14)>,		/* LCD_G4 */
+				 <STM32_PINMUX('I',  0, AF14)>,		/* LCD_G5 */
+				 <STM32_PINMUX('I',  1, AF14)>,		/* LCD_G6 */
+				 <STM32_PINMUX('I',  2, AF14)>,		/* LCD_G7 */
+				 <STM32_PINMUX('D',  9, AF14)>,		/* LCD_B0 */
+				 <STM32_PINMUX('G', 12, AF14)>,		/* LCD_B1 */
+				 <STM32_PINMUX('G', 10, AF14)>,		/* LCD_B2 */
+				 <STM32_PINMUX('D', 10, AF14)>,		/* LCD_B3 */
+				 <STM32_PINMUX('I',  4, AF14)>,		/* LCD_B4 */
+				 <STM32_PINMUX('I',  5, AF14)>,		/* LCD_B5 */
+				 <STM32_PINMUX('I',  6, AF14)>,		/* LCD_B6 */
+				 <STM32_PINMUX('I',  7, AF14)>;		/* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	ltdc_sleep_pins: ltdc-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G',  7, ANALOG)>,	/* LCD_CLK */
+				 <STM32_PINMUX('I', 10, ANALOG)>,	/* LCD_HSYNC */
+				 <STM32_PINMUX('I',  9, ANALOG)>,	/* LCD_VSYNC */
+				 <STM32_PINMUX('E', 13, ANALOG)>,	/* LCD_DE */
+				 <STM32_PINMUX('H',  2, ANALOG)>,	/* LCD_R0 */
+				 <STM32_PINMUX('H',  3, ANALOG)>,	/* LCD_R1 */
+				 <STM32_PINMUX('H',  8, ANALOG)>,	/* LCD_R2 */
+				 <STM32_PINMUX('H',  9, ANALOG)>,	/* LCD_R3 */
+				 <STM32_PINMUX('H', 10, ANALOG)>,	/* LCD_R4 */
+				 <STM32_PINMUX('H', 11, ANALOG)>,	/* LCD_R5 */
+				 <STM32_PINMUX('H', 12, ANALOG)>,	/* LCD_R6 */
+				 <STM32_PINMUX('E', 15, ANALOG)>,	/* LCD_R7 */
+				 <STM32_PINMUX('E', 14, ANALOG)>,	/* LCD_G0 */
+				 <STM32_PINMUX('E',  6, ANALOG)>,	/* LCD_G1 */
+				 <STM32_PINMUX('H', 13, ANALOG)>,	/* LCD_G2 */
+				 <STM32_PINMUX('H', 14, ANALOG)>,	/* LCD_G3 */
+				 <STM32_PINMUX('H', 15, ANALOG)>,	/* LCD_G4 */
+				 <STM32_PINMUX('I',  0, ANALOG)>,	/* LCD_G5 */
+				 <STM32_PINMUX('I',  1, ANALOG)>,	/* LCD_G6 */
+				 <STM32_PINMUX('I',  2, ANALOG)>,	/* LCD_G7 */
+				 <STM32_PINMUX('D',  9, ANALOG)>,	/* LCD_B0 */
+				 <STM32_PINMUX('G', 12, ANALOG)>,	/* LCD_B1 */
+				 <STM32_PINMUX('G', 10, ANALOG)>,	/* LCD_B2 */
+				 <STM32_PINMUX('D', 10, ANALOG)>,	/* LCD_B3 */
+				 <STM32_PINMUX('I',  4, ANALOG)>,	/* LCD_B4 */
+				 <STM32_PINMUX('I',  5, ANALOG)>,	/* LCD_B5 */
+				 <STM32_PINMUX('I',  6, ANALOG)>,	/* LCD_B6 */
+				 <STM32_PINMUX('I',  7, ANALOG)>;	/* LCD_B7 */
+		};
+	};
+
+	sai1_pins: sai1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 2, AF6)>,		/* SAI1_SD_A */
+				 <STM32_PINMUX('F', 8, AF6)>,		/* SAI1_SCK_B */
+				 <STM32_PINMUX('F', 9, AF6)>,		/* SAI1_FS_B */
+				 <STM32_PINMUX('F', 7, AF6)>;		/* SAI1_MCLK_B */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 6, AF6)>;		/* SAI1_SD_B */
+			bias-disable;
+		};
+	};
+
+	sai1_sleep_pins: sai1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 2, ANALOG)>,	/* SAI1_SD_A */
+				 <STM32_PINMUX('F', 8, ANALOG)>,	/* SAI1_SCK_B */
+				 <STM32_PINMUX('F', 9, ANALOG)>,	/* SAI1_FS_B */
+				 <STM32_PINMUX('F', 7, ANALOG)>,	/* SAI1_MCLK_B */
+				 <STM32_PINMUX('F', 6, ANALOG)>;	/* SAI1_SD_B */
+		};
+	};
+
+	spi5_pins: spi5-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 6, AF5)>,		/* SPI5_SCK */
+				 <STM32_PINMUX('F', 11, AF5)>;		/* SPI5_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 7, AF5)>;		/* SPI5_MISO */
+			bias-disable;
+		};
+	};
+
+	stusb1600_pins: stusb1600-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 10, ANALOG)>;	/* STUSB1600 IRQ */
+			bias-pull-up;
+		};
+	};
+
+	tim2_pwm_pins: tim2-pwm-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 8, AF1)>;		/* TIM2_CH1 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	tim2_pwm_sleep_pins: tim2-pwm-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 8, ANALOG)>;	/* TIM2_CH1 */
+		};
+	};
+
+	uart4_pins: uart4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, AF6)>;		/* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 11, AF6)>;		/* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart4_idle_pins: uart4-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, ANALOG)>;	/* UART4_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 11, AF6)>;		/* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart4_sleep_pins: uart4-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, ANALOG)>,	/* UART4_TX */
+				 <STM32_PINMUX('A', 11, ANALOG)>;	/* UART4_RX */
+		};
+	};
+};
+
+&pinctrl_z {
+	i2c2_pins_z: i2c2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 7, AF3)>;		/* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_z: i2c2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 7, ANALOG)>;	/* I2C2_SDA */
+		};
+	};
+};
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
