Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C2750AC8
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 16:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF2EC6B452;
	Wed, 12 Jul 2023 14:25:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7205C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 14:25:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CCt4ES013152; Wed, 12 Jul 2023 16:24:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=tf52zjVbeZ9FyRb7xOYnVur943iT9URER5nDBPNhnZM=;
 b=eMV3sUk9lrxX7s8pxd5xoEY9O0Gz34Zw6D4zWd6dKo6wyDZlLvERoctn9xHd1AQQ/CYL
 RIyv/Atfz0e2sSMjPBWuANfKadIDbtbQmHqUoS/gPl/ioQG1K6YwTsyZgMYTMHCYkQg6
 Y78BHvg232myCIZ8AgafjLLfWfqCcAbBtH253/6Qmij1JFte+o7eoLyRAmKt9FV0NIYj
 rqbrUuMA7ux4G9csgynuYr/z7O77aFxpXbmQb1XRRRNm/Cx3pYkBlj4vIFRkA27qo6qG
 Uv1eMoHM1449I89l6Nw2mp/ZsjR0HxCQ5DFG0csdkXieT05FOPLZfR1n6CQdrt0RD3MQ tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rss5j28wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 16:24:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 108B810005B;
 Wed, 12 Jul 2023 16:24:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 074B021BF65;
 Wed, 12 Jul 2023 16:24:39 +0200 (CEST)
Received: from localhost (10.252.136.3) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 12 Jul
 2023 16:24:38 +0200
From: <p.paillet@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 12 Jul 2023 16:24:31 +0200
Message-ID: <20230712142432.1885162-4-p.paillet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712142432.1885162-1-p.paillet@foss.st.com>
References: <20230712142432.1885162-1-p.paillet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.136.3]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_09,2023-07-11_01,2023-05-22_02
Cc: p.paillet@foss.st.com
Subject: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: add SCMI PMIC regulators
	on stm32mp135f-dk board
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

From: Etienne Carriere <etienne.carriere@foss.st.com>

Since OP-TEE release tag 3.22.0, OP-TEE SCMI service for STM32MP13x
SoC family exposes PMIC voltage regulators. This change defines
them in the platform DTS file and removes the fixed regulators that
were previously defined to abstract them before OP-TEE firmware was
ready.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 68 +++++++++++--------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index f0900ca672b5..eea740d097c7 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
 #include "stm32mp135.dtsi"
 #include "stm32mp13xf.dtsi"
 #include "stm32mp13-pinctrl.dtsi"
@@ -65,45 +66,13 @@ led-blue {
 			default-state = "off";
 		};
 	};
-
-	v3v3_sw: v3v3-sw {
-		compatible = "regulator-fixed";
-		regulator-name = "v3v3_sw";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	vdd_adc: vdd-adc {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_adc";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	vdd_sd: vdd-sd {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_sd";
-		regulator-min-microvolt = <2900000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-always-on;
-	};
-
-	vdd_usb: vdd-usb {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_usb";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
 };
 
 &adc_1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&adc1_usb_cc_pins_a>;
-	vdda-supply = <&vdd_adc>;
-	vref-supply = <&vdd_adc>;
+	vdda-supply = <&scmi_vdd_adc>;
+	vref-supply = <&scmi_vdd_adc>;
 	status = "okay";
 	adc1: adc@0 {
 		status = "okay";
@@ -195,6 +164,29 @@ &rtc {
 	status = "okay";
 };
 
+&scmi_regu {
+	scmi_vdd_adc: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
+		regulator-name = "vdd_adc";
+	};
+	scmi_vdd_usb: regulator@13 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO4>;
+		regulator-name = "vdd_usb";
+	};
+	scmi_vdd_sd: regulator@14 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO5>;
+		regulator-name = "vdd_sd";
+	};
+	scmi_v1v8_periph: regulator@15 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO6>;
+		regulator-name = "v1v8_periph";
+	};
+	scmi_v3v3_sw: regulator@19 {
+		reg = <VOLTD_SCMI_STPMIC1_PWR_SW2>;
+		regulator-name = "v3v3_sw";
+	};
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
@@ -204,7 +196,7 @@ &sdmmc1 {
 	disable-wp;
 	st,neg-edge;
 	bus-width = <4>;
-	vmmc-supply = <&vdd_sd>;
+	vmmc-supply = <&scmi_vdd_sd>;
 	status = "okay";
 };
 
@@ -321,7 +313,7 @@ &usbh_ehci {
 	hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
-		vdd-supply = <&v3v3_sw>;
+		vdd-supply = <&scmi_v3v3_sw>;
 	};
 };
 
@@ -342,7 +334,7 @@ &usbphyc {
 };
 
 &usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
+	phy-supply = <&scmi_vdd_usb>;
 	st,current-boost-microamp = <1000>;
 	st,decrease-hs-slew-rate;
 	st,tune-hs-dc-level = <2>;
@@ -356,7 +348,7 @@ &usbphyc_port0 {
 };
 
 &usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
+	phy-supply = <&scmi_vdd_usb>;
 	st,current-boost-microamp = <1000>;
 	st,decrease-hs-slew-rate;
 	st,tune-hs-dc-level = <2>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
