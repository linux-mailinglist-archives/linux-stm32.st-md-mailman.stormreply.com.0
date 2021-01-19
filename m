Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 165CF2FB50D
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jan 2021 10:52:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED71C3FADA;
	Tue, 19 Jan 2021 09:52:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DCC5C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jan 2021 09:52:54 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1l1ngy-0007kD-71; Tue, 19 Jan 2021 10:52:52 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1l1ngw-0004fd-0U; Tue, 19 Jan 2021 10:52:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 19 Jan 2021 10:52:39 +0100
Message-Id: <20210119095241.17888-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: enable STM32MP1 crypto/CRC
	accelerators unconditionally
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

There is no SoC-external hardware support needed for the hash1, rng1,
crc1 and cryp1 IP blocks to function. Enable them thus unconditionally
instead of replicating their enablement in board device trees.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/stm32mp151.dtsi              |  3 ---
 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi   |  4 ----
 arch/arm/boot/dts/stm32mp157c-dk2.dts          |  4 ----
 arch/arm/boot/dts/stm32mp157c-ed1.dts          | 16 ----------------
 arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi |  4 ----
 arch/arm/boot/dts/stm32mp15xc.dtsi             |  1 -
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi   |  8 --------
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi   |  4 ----
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi         | 12 ------------
 arch/arm/boot/dts/stm32mp15xx-osd32.dtsi       |  4 ----
 10 files changed, 60 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3c75abacb374..c2d998343b6a 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1297,7 +1297,6 @@ hash1: hash@54002000 {
 			dmas = <&mdma1 31 0x2 0x1000A02 0x0 0x0>;
 			dma-names = "in";
 			dma-maxburst = <2>;
-			status = "disabled";
 		};
 
 		rng1: rng@54003000 {
@@ -1305,7 +1304,6 @@ rng1: rng@54003000 {
 			reg = <0x54003000 0x400>;
 			clocks = <&rcc RNG1_K>;
 			resets = <&rcc RNG1_R>;
-			status = "disabled";
 		};
 
 		mdma1: dma-controller@58000000 {
@@ -1402,7 +1400,6 @@ crc1: crc@58009000 {
 			compatible = "st,stm32f7-crc";
 			reg = <0x58009000 0x400>;
 			clocks = <&rcc CRC1>;
-			status = "disabled";
 		};
 
 		stmmac_axi_config_0: stmmac-axi-config {
diff --git a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
index 58275bcf9e26..268a99291d79 100644
--- a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
@@ -253,10 +253,6 @@ &pwr_regulators {
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
-&rng1 {
-	status = "okay";
-};
-
 &rtc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 2bc92ef3aeb9..045636555ddd 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -29,10 +29,6 @@ chosen {
 	};
 };
 
-&cryp1 {
-	status = "okay";
-};
-
 &dsi {
 	status = "okay";
 	phy-dsi-supply = <&reg18>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 81a7d5849db4..f69622097e89 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -115,14 +115,6 @@ adc1: adc@0 {
 	};
 };
 
-&crc1 {
-	status = "okay";
-};
-
-&cryp1 {
-	status = "okay";
-};
-
 &dac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
@@ -144,10 +136,6 @@ &gpu {
 	contiguous-area = <&gpu_reserved>;
 };
 
-&hash1 {
-	status = "okay";
-};
-
 &i2c4 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c4_pins_a>;
@@ -325,10 +313,6 @@ &pwr_regulators {
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
-&rng1 {
-	status = "okay";
-};
-
 &rtc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
index 6cf49a0a9e69..a2aca1982bf6 100644
--- a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
@@ -250,10 +250,6 @@ &m4_rproc {
 	status = "okay";
 };
 
-&rng1 {
-	status = "okay";
-};
-
 &rtc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp15xc.dtsi b/arch/arm/boot/dts/stm32mp15xc.dtsi
index b06a55a2fa18..86953d7ddde0 100644
--- a/arch/arm/boot/dts/stm32mp15xc.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xc.dtsi
@@ -12,7 +12,6 @@ cryp1: cryp@54001000 {
 			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc CRYP1>;
 			resets = <&rcc CRYP1_R>;
-			status = "disabled";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index ac46ab363e1b..603c14054509 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -377,14 +377,6 @@ flash0: mx66l51235l@0 {
 	};
 };
 
-&rng1 {
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
-
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index 803eb8bc9c85..3f4af430aaf4 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -204,10 +204,6 @@ flash0: spi-flash@0 {
 	};
 };
 
-&rng1 {
-	status = "okay";
-};
-
 &rtc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 89c0e1ddc387..0cca6c3ff4a0 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -124,10 +124,6 @@ &cec {
 	status = "okay";
 };
 
-&crc1 {
-	status = "okay";
-};
-
 &dts {
 	status = "okay";
 };
@@ -155,10 +151,6 @@ &gpu {
 	contiguous-area = <&gpu_reserved>;
 };
 
-&hash1 {
-	status = "okay";
-};
-
 &i2c1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c1_pins_a>;
@@ -482,10 +474,6 @@ &pwr_regulators {
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
-&rng1 {
-	status = "okay";
-};
-
 &rtc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
index 713485a95795..d03d4d12133c 100644
--- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
@@ -224,7 +224,3 @@ &m4_rproc {
 	interrupts = <68 1>;
 	status = "okay";
 };
-
-&rng1 {
-	status = "okay";
-};
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
