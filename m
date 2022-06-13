Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC65483C0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 11:54:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E936C628AD;
	Mon, 13 Jun 2022 09:54:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A66A5C60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 09:54:03 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2EF378443B;
 Mon, 13 Jun 2022 11:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655114043;
 bh=IflyIkJlv40sM7CEDZ3Qzf7M6nJUT9ya1MoSibM0bJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eXcD8U82m8hEwySTkW0Zervcd0L2J9p1V5NJRTmwoJRi4G8Jp95e+a+4cPaa/L9rl
 LTcfv9lKRjfI9jq7LmujQr+n1ZL961pMi6wmOXw0tb1IVT31/kdrYTl3FRuAivG1g5
 QHHdmZu4fZbHfxIZvcsRF0hBRUijxIa0lorHJjb0ZfL4XhxEQjdrkTtBjbMEN2DWeC
 2WLaE6fFkSjaAcGLsbp2DVuHUPjGD7x85eCMrTQPuG1Xc4tep0YMTOOnTiFmlzEq2C
 w59a4ONL6+GoWITcJwiiK5O3CPKwuihVJuCTnpEjWQdH9xyeAuMjNx8BcMoYiOPSIi
 2Kbrrecb9Ljtg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Jun 2022 11:53:28 +0200
Message-Id: <20220613095328.5661-7-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613095328.5661-1-marex@denx.de>
References: <20220613095328.5661-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 7/7] ARM: dts: stm32: Add DHCOR based DRC
	Compact board
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

Add DT for DH DRC Compact unit, which is a universal controller device.
The system has two ethernet ports, one CAN, RS485 and RS232, USB, uSD
card slot, eMMC and SDIO Wi-Fi.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/stm32mp153c-dhcor-drc-compact.dts     |  30 ++
 .../dts/stm32mp15xx-dhcor-drc-compact.dtsi    | 322 ++++++++++++++++++
 3 files changed, 353 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts
 create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5112f493f4946..e3e9af031bf58 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1192,6 +1192,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp151a-prtt1c.dtb \
 	stm32mp151a-prtt1s.dtb \
 	stm32mp153c-dhcom-drc02.dtb \
+	stm32mp153c-dhcor-drc-compact.dtb \
 	stm32mp157a-avenger96.dtb \
 	stm32mp157a-dhcor-avenger96.dtb \
 	stm32mp157a-dk1.dtb \
diff --git a/arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts b/arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts
new file mode 100644
index 0000000000000..c8b9818499ea0
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (C) 2022 Marek Vasut <marex@denx.de>
+ *
+ * DHCOR STM32MP1 variant:
+ * DHCR-STM32MP153C-C065-R051-V33-SPI-I-01LG
+ * DHCOR PCB number: 586-100 or newer
+ * DRC Compact PCB number: 627-100 or newer
+ */
+
+/dts-v1/;
+
+#include "stm32mp153.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xx-dhcor-som.dtsi"
+#include "stm32mp15xx-dhcor-drc-compact.dtsi"
+
+/ {
+	model = "DH electronics STM32MP153C DHCOR DRC Compact";
+	compatible = "dh,stm32mp153c-dhcor-drc-compact",
+		     "dh,stm32mp153c-dhcor-som",
+		     "st,stm32mp153";
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_c>;
+	pinctrl-1 = <&m_can1_sleep_pins_c>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
new file mode 100644
index 0000000000000..27477bb219ded
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (C) 2022 Marek Vasut <marex@denx.de>
+ */
+
+/ {
+	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ksz8851;
+		mmc0 = &sdmmc1;
+		rtc0 = &hwrtc;
+		rtc1 = &rtc;
+		serial0 = &uart4;
+		serial1 = &uart8;
+		serial2 = &usart3;
+		serial3 = &uart5;
+		spi0 = &qspi;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	led {
+		compatible = "gpio-leds";
+		led1 {
+			label = "yellow:user0";
+			gpios = <&gpioz 6 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led2 {
+			label = "red:user1";
+			gpios = <&gpioz 3 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	ethernet_vio: vioregulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vio";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpioh 2 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd>;
+	};
+};
+
+&adc {	/* X11 ADC inputs */
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc12_ain_pins_b>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdda>;
+	vref-supply = <&vdda>;
+	status = "okay";
+
+	adc1: adc@0 {
+		st,adc-channels = <0 1 6>;
+		st,min-sample-time-nsecs = <5000>;
+		status = "okay";
+	};
+
+	adc2: adc@100 {
+		st,adc-channels = <0 1 2>;
+		st,min-sample-time-nsecs = <5000>;
+		status = "okay";
+	};
+};
+
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rgmii_pins_c>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_c>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		reset-gpios = <&gpioz 2 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <1000>;
+		reset-post-delay-us = <1000>;
+
+		phy0: ethernet-phy@7 {
+			reg = <7>;
+
+			rxc-skew-ps = <1500>;
+			rxdv-skew-ps = <540>;
+			rxd0-skew-ps = <420>;
+			rxd1-skew-ps = <420>;
+			rxd2-skew-ps = <420>;
+			rxd3-skew-ps = <420>;
+
+			txc-skew-ps = <1440>;
+			txen-skew-ps = <540>;
+			txd0-skew-ps = <420>;
+			txd1-skew-ps = <420>;
+			txd2-skew-ps = <420>;
+			txd3-skew-ps = <420>;
+		};
+	};
+};
+
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_b>;
+	pinctrl-1 = <&fmc_sleep_pins_b>;
+	status = "okay";
+
+	ksz8851: ethernet@1,0 {
+		compatible = "micrel,ks8851-mll";
+		reg = <1 0x0 0x2>, <1 0x2 0x20000>;
+		interrupt-parent = <&gpioc>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		bank-width = <2>;
+
+		/* Timing values are in nS */
+		st,fmc2-ebi-cs-mux-enable;
+		st,fmc2-ebi-cs-transaction-type = <4>;
+		st,fmc2-ebi-cs-buswidth = <16>;
+		st,fmc2-ebi-cs-address-setup-ns = <5>;
+		st,fmc2-ebi-cs-address-hold-ns = <5>;
+		st,fmc2-ebi-cs-bus-turnaround-ns = <5>;
+		st,fmc2-ebi-cs-data-setup-ns = <45>;
+		st,fmc2-ebi-cs-data-hold-ns = <1>;
+		st,fmc2-ebi-cs-write-address-setup-ns = <5>;
+		st,fmc2-ebi-cs-write-address-hold-ns = <5>;
+		st,fmc2-ebi-cs-write-bus-turnaround-ns = <5>;
+		st,fmc2-ebi-cs-write-data-setup-ns = <45>;
+		st,fmc2-ebi-cs-write-data-hold-ns = <1>;
+	};
+};
+
+&gpioa {
+	gpio-line-names = "", "", "", "",
+			  "DRCC-VAR2", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioe {
+	gpio-line-names = "", "", "", "",
+			  "", "DRCC-GPIO0", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "DRCC-GPIO5", "", "", "";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "", "DRCC-HW2",
+			  "DRCC-GPIO4", "", "", "",
+			  "DRCC-HW1", "DRCC-HW0", "", "DRCC-VAR1",
+			  "DRCC-VAR0", "", "", "DRCC-GPIO6";
+};
+
+&gpioi {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "DRCC-GPIO2",
+			  "", "DRCC-GPIO1", "", "",
+			  "", "", "", "";
+};
+
+&i2c1 {	/* X11 I2C1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_b>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2c4 {
+	hwrtc: rtc@32 {
+		compatible = "microcrystal,rv8803";
+		reg = <0x32>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&sdmmc1 {	/* MicroSD */
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&vdd>;
+	vqmmc-supply = <&vdd>;
+	status = "okay";
+};
+
+&sdmmc2 {	/* eMMC */
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_c>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_c>;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	st,neg-edge;
+	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&vdd>;
+	status = "okay";
+};
+
+&sdmmc3 {	/* SDIO Wi-Fi */
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_b4_pins_a>;
+	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
+	broken-cd;
+	bus-width = <4>;
+	mmc-ddr-3_3v;
+	st,neg-edge;
+	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&spi2 {	/* X11 SPI */
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2_pins_b>;
+	cs-gpios = <&gpioi 0 0>;
+	status = "disabled";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&uart4 {
+	label = "UART0";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_d>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+&uart5 {	/* X11 UART */
+	label = "X11-UART5";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart5_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+&uart8 {
+	label = "RS485-1";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_pins_a &uart8_rtscts_pins_a>;
+	uart-has-rtscts;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+&usart3 {	/* RS485 or RS232 */
+	label = "RS485-2";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&usart3_pins_e>;
+	pinctrl-1 = <&usart3_sleep_pins_e>;
+	uart-has-rtscts;
+	/delete-property/dmas;
+	/delete-property/dma-names;
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
+	connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vbus_sw>;
+	};
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
