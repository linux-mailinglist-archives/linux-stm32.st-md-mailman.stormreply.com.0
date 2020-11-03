Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9222A4DF1
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 19:11:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00CBFC36B35;
	Tue,  3 Nov 2020 18:11:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECFC0C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 18:11:45 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CQdCP0HCWz1qs0Y;
 Tue,  3 Nov 2020 19:11:45 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CQdCN6VtNz1qtZ6;
 Tue,  3 Nov 2020 19:11:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 9yCyy8kb8Fc2; Tue,  3 Nov 2020 19:11:43 +0100 (CET)
X-Auth-Info: PIH8kX8fpZ2lCap2lTXEUkepn3Qqu25rgYoONv4USMU=
Received: from localhost.localdomain (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  3 Nov 2020 19:11:43 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue,  3 Nov 2020 19:11:37 +0100
Message-Id: <20201103181137.443586-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add DHCOM based PicoITX board
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

Add DT for DH PicoITX unit, which is a bare-bones carrier board for
the DHCOM. The board has ethernet port, USB, CAN, LEDs and a custom
board-to-board expansion connector.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/stm32mp157c-dhcom-picoitx.dts    |  35 +++++
 .../boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 143 ++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
 create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index db0223cf47da..36ec449a8b4e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1066,6 +1066,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157a-iot-box.dtb \
 	stm32mp157a-stinger96.dtb \
 	stm32mp157c-dhcom-pdk2.dtb \
+	stm32mp157c-dhcom-picoitx.dtb \
 	stm32mp157c-dk2.dtb \
 	stm32mp157c-ed1.dtb \
 	stm32mp157c-ev1.dtb \
diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
new file mode 100644
index 000000000000..cfb8f8a0c82d
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
+ *
+ * DHCOM STM32MP1 variant:
+ * DHCM-STM32MP157C-C065-R102-F0819-SPI-E-CAN2-SD-RTC-T-DSI-I-01D2
+ * DHCOM PCB number: 587-200 or newer
+ * PicoITX PCB number: 487-600 or newer
+ */
+/dts-v1/;
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xx-dhcom-som.dtsi"
+#include "stm32mp15xx-dhcom-picoitx.dtsi"
+
+/ {
+	model = "DH electronics STM32MP157C DHCOM PicoITX";
+	compatible = "dh,stm32mp157c-dhcom-picoitx", "dh,stm32mp157c-dhcom-som",
+		     "st,stm32mp157";
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_a>;
+	pinctrl-1 = <&m_can1_sleep_pins_a>;
+	status = "okay";
+};
+
+&m_can2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can2_pins_a>;
+	pinctrl-1 = <&m_can2_sleep_pins_a>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
new file mode 100644
index 000000000000..356150d28c42
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	aliases {
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart8;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	led {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "yellow:led";
+			gpios = <&gpioi 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+};
+
+&adc {
+	status = "disabled";
+};
+
+&dac {
+	status = "disabled";
+};
+
+&gpioa {
+	/*
+	 * NOTE: The USB Port on the PicoITX needs a PWR_EN signal to enable
+	 * port power. This signal should be handled by USB power sequencing
+	 * in order to turn on port power when USB bus is powered up, but so
+	 * far there is no such functionality.
+	 */
+	usb-port-power {
+		gpio-hog;
+		gpios = <13 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "usb-port-power";
+	};
+};
+
+&gpioc {
+	gpio-line-names = "", "", "", "",
+			  "", "", "In1", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiod {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "Out1",
+			  "Out2", "", "", "";
+};
+
+&gpiog {
+	gpio-line-names = "In2", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&i2c2 {	/* On board-to-board connector (optional) */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2c5 {	/* On board-to-board connector */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&usart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usart3_pins_a>;
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
+	status = "okay";
+};
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	status = "okay";
+};
+
+&usbh_ohci {
+	phys = <&usbphyc_port0>;
+	status = "okay";
+};
+
+&usbotg_hs {
+	dr_mode = "otg";
+	pinctrl-0 = <&usbotg_hs_pins_a>;
+	pinctrl-names = "default";
+	phy-names = "usb2-phy";
+	phys = <&usbphyc_port1 0>;
+	vbus-supply = <&vbus_otg>;
+	status = "okay";
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+	vdda1v1-supply = <&reg11>;
+	vdda1v8-supply = <&reg18>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+	vdda1v1-supply = <&reg11>;
+	vdda1v8-supply = <&reg18>;
+};
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
