Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4981BE406
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 18:38:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C99E1C36B16;
	Wed, 29 Apr 2020 16:38:07 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34A36C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 16:38:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49C4256Q7Fz1rtMh;
 Wed, 29 Apr 2020 18:38:05 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49C4255cHsz1qv7g;
 Wed, 29 Apr 2020 18:38:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id bvq8MRawqO7Q; Wed, 29 Apr 2020 18:38:03 +0200 (CEST)
X-Auth-Info: B6LwnjmvzXIu/P9qIkak98NrvLphknixHCqewsfaZn4=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 29 Apr 2020 18:38:03 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 29 Apr 2020 18:37:42 +0200
Message-Id: <20200429163743.67854-11-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200429163743.67854-1-marex@denx.de>
References: <20200429163743.67854-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 11/12] ARM: dts: stm32: Split Avenger96 into
	DHCOR SoM and Avenger96 board
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

The Avenger96 is in fact an assembly of DH Electronics DHCOR SoM on top
of an Avenger96 reference board. Split the DTs to reflect that and make
sure to DHCOR SoM can be reused on other boards easily.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts   | 210 +-----------------
 .../arm/boot/dts/stm32mp157a-dhcor-io1v8.dtsi |  23 ++
 arch/arm/boot/dts/stm32mp157a-dhcor-som.dtsi  | 210 ++++++++++++++++++
 3 files changed, 237 insertions(+), 206 deletions(-)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-dhcor-io1v8.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157a-dhcor-som.dtsi

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index a9f3ba9da170..10f11ca53c7d 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -2,15 +2,14 @@
 /*
  * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
  */
 
 /dts-v1/;
 
-#include "stm32mp157.dtsi"
-#include "stm32mp15-pinctrl.dtsi"
-#include "stm32mp15xxac-pinctrl.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/mfd/st,stpmic1.h>
+#include "stm32mp157a-dhcor-som.dtsi"
+/* Avenger96 uses DHCOR SoM configured for 1V8 IO operation */
+#include "stm32mp157a-dhcor-io1v8.dtsi"
 
 / {
 	model = "Arrow Electronics STM32MP157A Avenger96 board";
@@ -47,11 +46,6 @@ hdmi_con: endpoint {
 		};
 	};
 
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xc0000000 0x40000000>;
-	};
-
 	led {
 		compatible = "gpio-leds";
 		led1 {
@@ -105,17 +99,6 @@ sound {
 		status = "okay";
 	};
 
-	/* Enpirion EP3A8LQI U2 on the DHCOR */
-	vdd_io: regulator-buck-io {
-		compatible = "regulator-fixed";
-		regulator-name = "buck-io";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&vdd>;
-	};
-
 	wlan_pwr: regulator-wlan {
 		compatible = "regulator-fixed";
 
@@ -206,148 +189,6 @@ &i2c2 {	/* X6 I2C2 */
 };
 
 &i2c4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c4_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-
-	pmic: stpmic@33 {
-		compatible = "st,stpmic1";
-		reg = <0x33>;
-		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		status = "okay";
-
-		regulators {
-			compatible = "st,stpmic1-regulators";
-
-			ldo1-supply = <&v3v3>;
-			ldo2-supply = <&v3v3>;
-			ldo3-supply = <&vdd_ddr>;
-			ldo5-supply = <&v3v3>;
-			ldo6-supply = <&v3v3>;
-			pwr_sw1-supply = <&bst_out>;
-			pwr_sw2-supply = <&bst_out>;
-
-			vddcore: buck1 {
-				regulator-name = "vddcore";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd_ddr: buck2 {
-				regulator-name = "vdd_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd: buck3 {
-				regulator-name = "vdd";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			v3v3: buck4 {
-				regulator-name = "v3v3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-				regulator-initial-mode = <0>;
-			};
-
-			vdda: ldo1 {
-				regulator-name = "vdda";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO1 0>;
-			};
-
-			v2v8: ldo2 {
-				regulator-name = "v2v8";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				interrupts = <IT_CURLIM_LDO2 0>;
-			};
-
-			vtt_ddr: ldo3 {
-				regulator-name = "vtt_ddr";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <750000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-			};
-
-			vdd_usb: ldo4 {
-				regulator-name = "vdd_usb";
-				interrupts = <IT_CURLIM_LDO4 0>;
-			};
-
-			vdd_sd: ldo5 {
-				regulator-name = "vdd_sd";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO5 0>;
-				regulator-boot-on;
-			};
-
-			v1v8: ldo6 {
-				regulator-name = "v1v8";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				interrupts = <IT_CURLIM_LDO6 0>;
-				regulator-enable-ramp-delay = <300000>;
-			};
-
-			vref_ddr: vref_ddr {
-				regulator-name = "vref_ddr";
-				regulator-always-on;
-			};
-
-			bst_out: boost {
-				regulator-name = "bst_out";
-				interrupts = <IT_OCP_BOOST 0>;
-			};
-
-			vbus_otg: pwr_sw1 {
-				regulator-name = "vbus_otg";
-				interrupts = <IT_OCP_OTG 0>;
-				regulator-active-discharge = <1>;
-			};
-
-			vbus_sw: pwr_sw2 {
-				regulator-name = "vbus_sw";
-				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge = <1>;
-			};
-		};
-
-		onkey {
-			compatible = "st,stpmic1-onkey";
-			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
-			interrupt-names = "onkey-falling", "onkey-rising";
-			status = "okay";
-		};
-
-		watchdog {
-			compatible = "st,stpmic1-wdt";
-			status = "disabled";
-		};
-	};
-
 	hdmi-transmitter@3d {
 		compatible = "adi,adv7513";
 		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
@@ -398,17 +239,6 @@ adv7513_i2s0: endpoint {
 			};
 		};
 	};
-
-	eeprom@53 {
-		compatible = "atmel,24c02";
-		reg = <0x53>;
-		pagesize = <16>;
-	};
-};
-
-&iwdg2 {
-	timeout-sec = <32>;
-	status = "okay";
 };
 
 &ltdc {
@@ -442,38 +272,6 @@ &m_can2 {
 	status = "disabled";
 };
 
-&pwr_regulators {
-	vdd-supply = <&vdd_io>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
-};
-
-&qspi {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
-	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "okay";
-
-	flash0: spi-flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-rx-bus-width = <4>;
-		spi-max-frequency = <108000000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-};
-
-&rng1 {
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
-
 &sai2 {
 	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/stm32mp157a-dhcor-io1v8.dtsi b/arch/arm/boot/dts/stm32mp157a-dhcor-io1v8.dtsi
new file mode 100644
index 000000000000..75172314d7af
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-dhcor-io1v8.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
+ */
+
+/ {
+	/* Enpirion EP3A8LQI U2 on the DHCOR */
+	vdd_io: regulator-buck-io {
+		compatible = "regulator-fixed";
+		regulator-name = "buck-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd>;
+	};
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd_io>;
+};
diff --git a/arch/arm/boot/dts/stm32mp157a-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp157a-dhcor-som.dtsi
new file mode 100644
index 000000000000..7144afeab6ca
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-dhcor-som.dtsi
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
+ */
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+
+/ {
+	aliases {
+		spi0 = &qspi;
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x40000000>;
+	};
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "okay";
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+
+			ldo1-supply = <&v3v3>;
+			ldo2-supply = <&v3v3>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo5-supply = <&v3v3>;
+			ldo6-supply = <&v3v3>;
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
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				regulator-always-on;
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
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				interrupts = <IT_CURLIM_LDO1 0>;
+			};
+
+			v2v8: ldo2 {
+				regulator-name = "v2v8";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				interrupts = <IT_CURLIM_LDO2 0>;
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				interrupts = <IT_CURLIM_LDO4 0>;
+			};
+
+			vdd_sd: ldo5 {
+				regulator-name = "vdd_sd";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				interrupts = <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			v1v8: ldo6 {
+				regulator-name = "v1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				interrupts = <IT_CURLIM_LDO6 0>;
+				regulator-enable-ramp-delay = <300000>;
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+			};
+
+			bst_out: boost {
+				regulator-name = "bst_out";
+				interrupts = <IT_OCP_BOOST 0>;
+			};
+
+			vbus_otg: pwr_sw1 {
+				regulator-name = "vbus_otg";
+				interrupts = <IT_OCP_OTG 0>;
+				regulator-active-discharge = <1>;
+			};
+
+			vbus_sw: pwr_sw2 {
+				regulator-name = "vbus_sw";
+				interrupts = <IT_OCP_SWOUT 0>;
+				regulator-active-discharge = <1>;
+			};
+		};
+
+		onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			status = "okay";
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+			status = "disabled";
+		};
+	};
+
+	eeprom@53 {
+		compatible = "atmel,24c02";
+		reg = <0x53>;
+		pagesize = <16>;
+	};
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&qspi {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
+	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash0: spi-flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <108000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
