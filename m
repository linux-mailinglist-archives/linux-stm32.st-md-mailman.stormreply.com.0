Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23122C302
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 12:23:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08DD0C36B27;
	Fri, 24 Jul 2020 10:23:09 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33E8BC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 10:23:08 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BCldl56wyz1rwZx;
 Fri, 24 Jul 2020 12:23:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BCldl4P2Wz1qw6Q;
 Fri, 24 Jul 2020 12:23:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KEG8SpaHyy_E; Fri, 24 Jul 2020 12:23:05 +0200 (CEST)
X-Auth-Info: 2OwQPVTH4Q6PAdixEkcXYvb7kPTl1ej5K7p/iNwqn0U=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 24 Jul 2020 12:23:05 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Jul 2020 12:22:49 +0200
Message-Id: <20200724102250.146817-1-marex@denx.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Move ethernet PHY into
	SoM DT
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

The PHY and the VIO regulator is populated on the SoM, move it
into the SoM DT.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 33 -----------------
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 7c4bd615b311..9cf6d90fbf69 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -11,7 +11,6 @@ aliases {
 		serial0 = &uart4;
 		serial1 = &usart3;
 		serial2 = &uart8;
-		ethernet0 = &ethernet0;
 	};
 
 	chosen {
@@ -33,16 +32,6 @@ display_bl: display-bl {
 		status = "okay";
 	};
 
-	ethernet_vio: vioregulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vio";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpiog 3 GPIO_ACTIVE_LOW>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		#size-cells = <0>;
@@ -141,28 +130,6 @@ &cec {
 	status = "okay";
 };
 
-&ethernet0 {
-	status = "okay";
-	pinctrl-0 = <&ethernet0_rmii_pins_a>;
-	pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
-	pinctrl-names = "default", "sleep";
-	phy-mode = "rmii";
-	max-speed = <100>;
-	phy-handle = <&phy0>;
-	st,eth-ref-clk-sel;
-	phy-reset-gpios = <&gpioh 15 GPIO_ACTIVE_LOW>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-
-		phy0: ethernet-phy@1 {
-			reg = <1>;
-		};
-	};
-};
-
 &i2c2 {	/* Header X22 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index ba905196fb54..d30a3c60da9b 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -9,6 +9,10 @@
 #include <dt-bindings/mfd/st,stpmic1.h>
 
 / {
+	aliases {
+		ethernet0 = &ethernet0;
+	};
+
 	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xC0000000 0x40000000>;
@@ -55,6 +59,16 @@ retram: retram@38000000 {
 			no-map;
 		};
 	};
+
+	ethernet_vio: vioregulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vio";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpiog 3 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &adc {
@@ -94,6 +108,28 @@ &dts {
 	status = "okay";
 };
 
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rmii";
+	max-speed = <100>;
+	phy-handle = <&phy0>;
+	st,eth-ref-clk-sel;
+	phy-reset-gpios = <&gpioh 15 GPIO_ACTIVE_LOW>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
+
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
