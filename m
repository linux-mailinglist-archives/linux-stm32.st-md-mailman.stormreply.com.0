Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ADF750910
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 15:02:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F14CC6B44E;
	Wed, 12 Jul 2023 13:02:30 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D341C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=kNMrFGES7NPyloTYFnGi6EEQKp1AtpDzCVH9fxreOdQ=; b=zrYR3XF1TnQnweFsLg5cGVJ0PI
 H6p6De9H2pCyJ1jX616+PKXugFR/u0TaHUuWzLx9WEXDWQQVRTs5629HTlFvahNLoOuLK8U79cAWZ
 kb0c8f7XaS4Y8XbQQwFbeWG34QCwE+OJSzt9O8HthuRjMXuEfTWLHAof6zuUyvNhKQmxJH3/S+PuK
 IhG6y8gkjXpNPoxNPzsm9se696XM8zdHuhEkjzV+eUViT5NxtBaAsQAk3Mdu5PoQ/LZ3OPxpQN4Jd
 VvWnIukW97m8tkWGlAVINqhET1oFtM10G1Sj4ghc7XaPtwjN4B+BK85aKaGgtjKsdTIxG25VztrjJ
 OSY7rLmA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qJZBk-000NNx-VB; Wed, 12 Jul 2023 14:43:24 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qJZBk-000L9W-B3; Wed, 12 Jul 2023 14:43:24 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: l.goehrs@pengutronix.de, a.fatoum@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Jul 2023 14:42:47 +0200
Message-Id: <20230712124248.2400862-9-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230712124248.2400862-1-sean@geanix.com>
References: <20230712124248.2400862-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26967/Wed Jul 12 09:28:32 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 9/9] ARM: dts: stm32: Add Octavo
	OSD32MP1-RED board
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

Add support for the Octavo OSD32MP1-RED development board.

General features:
 - STM32MP157C
 - 512MB DDR3
 - CAN-FD
 - HDMI
 - USB-C OTG
 - UART

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
Changes since v1:
 - Fixed comments from Ahmad

Changes since v2:
 - Reordered phandles alfabetically
 - Added devicetree to Makefile

Changes since v3:
 - Explained the dma disable
 - Removed the status ok for hdmi-transmitter

 arch/arm/boot/dts/st/Makefile                 |   3 +-
 .../boot/dts/st/stm32mp157c-osd32mp1-red.dts  | 226 ++++++++++++++++++
 2 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 44b264c399ec..94feb1f1d569 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -59,7 +59,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-lxa-tac-gen1.dtb \
 	stm32mp157c-lxa-tac-gen2.dtb \
 	stm32mp157c-odyssey.dtb \
-	stm32mp157c-phycore-stm32mp1-3.dtb
+	stm32mp157c-phycore-stm32mp1-3.dtb \
+	stm32mp157c-osd32mp1-red.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
 	ste-hrefprev60-stuib.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
new file mode 100644
index 000000000000..2e2751a62aaf
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) Geanix ApS 2023 - All Rights Reserved
+ * Author: Sean Nyekjaer <sean@geanix.com>
+ */
+
+/dts-v1/;
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xx-osd32.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+/ {
+	model = "Octavo OSD32MP1 RED board";
+	compatible = "oct,stm32mp157c-osd32-red", "oct,stm32mp15xx-osd32", "st,stm32mp157";
+
+	aliases {
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	led-controller-0 {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "heartbeat";
+			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&crc1 {
+	status = "okay";
+};
+
+&dts {
+	status = "okay";
+};
+
+&ethernet0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
+	phy-mode = "rgmii-id";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+	st,eth-clk-sel;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@3 {
+			reg = <3>;
+		};
+	};
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	status = "okay";
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	hdmi-transmitter@39 {
+		compatible = "sil,sii9022";
+		reg = <0x39>;
+		reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpiog>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&ltdc_pins_e>;
+		pinctrl-1 = <&ltdc_sleep_pins_e>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sii9022_in: endpoint {
+					remote-endpoint = <&ltdc_ep0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sii9022_tx_endpoint: endpoint {
+					remote-endpoint = <&i2s2_endpoint>;
+				};
+			};
+		};
+	};
+};
+
+&i2s2 {
+	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc CK_PER>, <&rcc PLL3_R>;
+	clock-names = "pclk", "i2sclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2s2_pins_b>;
+	pinctrl-1 = <&i2s2_sleep_pins_b>;
+	status = "okay";
+
+	i2s2_port: port {
+		i2s2_endpoint: endpoint {
+			remote-endpoint = <&sii9022_tx_endpoint>;
+			format = "i2s";
+			mclk-fs = <256>;
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
+			remote-endpoint = <&sii9022_in>;
+		};
+	};
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_d>;
+	pinctrl-1 = <&m_can1_sleep_pins_d>;
+	status = "okay";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpioe 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_d>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_d>;
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
+
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	phy-names = "usb";
+	status = "okay";
+};
+
+&usbh_ohci {
+	phys = <&usbphyc_port0>;
+	phy-names = "usb";
+	status = "okay";
+};
+
+&usbotg_hs {
+	vbus-supply = <&vbus_otg>;
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
