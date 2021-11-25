Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7A45DC8B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Nov 2021 15:44:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF176C597BE;
	Thu, 25 Nov 2021 14:44:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09EC0C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 14:44:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AP9GKsm002630;
 Thu, 25 Nov 2021 15:44:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=m7uWqW34ebKJsCiE75+OnmMwbr1EosFegGv/Ik9D7jY=;
 b=5xYyGq4B/xztIvQqdrQ3sLWmyg0UdaMjQF7+K9YbSdC2Ev8wANUuRTWqJ6teVF8IPqjy
 Xk3FBwoVhCV1pqaOZ+b4LRPABOXk9j4LWENukOsCXLRsZS9Etd4OpN3gyJ9JqiCbzd1s
 wNqsrloCmaN/38EnpZ58Wi2G888xIO6aUoFAGczP92Sv7G7JHwVcxHhifut7SnJ2fg6g
 TqHEThKaoQhuDk34W6BYg3kZHIB5XSIIYhSSuma1NY/Dtrnd7w2s0wfu3IxEF3o8lVgz
 4oX5z8Bvmuo8oMDzaKISM3VTqlncqRlDLs4s7lSqid6BkP/f03u8fwVroBSgBpa9bGFa iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cj3cykuw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:44:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBE04100034;
 Thu, 25 Nov 2021 15:44:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1030237D97;
 Thu, 25 Nov 2021 15:44:23 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 25 Nov 2021 15:44:23
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@st.com>, "Rob
 Herring" <robh+dt@kernel.org>, <arnaud.pouliquen@foss.st.com>,
 <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Date: Thu, 25 Nov 2021 15:40:53 +0100
Message-ID: <20211125144053.774-5-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125144053.774-1-olivier.moysan@foss.st.com>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] ARM: dts: stm32: merge spi and i2s
	nodes
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

When a SPI instance offers I2S feature, two nodes are defined
in SoC device tree to support both SPI and I2S.
Merge SPI node and I2S nodes into a single node, to avoid
hardware description duplication and compilation warnings.
spi2sx label is used to identify the SPI instances which
are supporting I2S feature.

Rename nodes, to match new labels of SPI/I2S nodes in the
SoC device tree on following boards:
- STMP32MP15xx-DKx
- STMP32MP157C-EV1
- STMP32MP15xx-dhcor-avenger96
- STMP32MP15xx-dhcom-drc02

In DT check utility, the spi2s2 node is identified as an spi node.
The check_spi_bus_reg() function issues a warning "missing or empty
reg property" if reg property is not defined in child nodes.
Add reg property to STM32 I2S port node on STM32MP15XX-DK board
to match this requirement and add related unit-address in node name.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi             | 39 ++-----------------
 arch/arm/boot/dts/stm32mp157c-ev1.dts         |  2 +-
 .../arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi |  2 +-
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  2 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  7 +++-
 5 files changed, 11 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index f693a7d24247..61226821ff8c 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -386,7 +386,7 @@
 			};
 		};
 
-		spi2: spi@4000b000 {
+		spi2s2: spi@4000b000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "st,stm32h7-spi";
@@ -400,18 +400,7 @@
 			status = "disabled";
 		};
 
-		i2s2: audio-controller@4000b000 {
-			compatible = "st,stm32h7-i2s";
-			#sound-dai-cells = <0>;
-			reg = <0x4000b000 0x400>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 39 0x400 0x01>,
-			       <&dmamux1 40 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spi3: spi@4000c000 {
+		spi2s3: spi@4000c000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "st,stm32h7-spi";
@@ -425,17 +414,6 @@
 			status = "disabled";
 		};
 
-		i2s3: audio-controller@4000c000 {
-			compatible = "st,stm32h7-i2s";
-			#sound-dai-cells = <0>;
-			reg = <0x4000c000 0x400>;
-			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 61 0x400 0x01>,
-			       <&dmamux1 62 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
 		spdifrx: audio-controller@4000d000 {
 			compatible = "st,stm32h7-spdifrx";
 			#sound-dai-cells = <0>;
@@ -681,7 +659,7 @@
 			status = "disabled";
 		};
 
-		spi1: spi@44004000 {
+		spi2s1: spi@44004000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "st,stm32h7-spi";
@@ -695,17 +673,6 @@
 			status = "disabled";
 		};
 
-		i2s1: audio-controller@44004000 {
-			compatible = "st,stm32h7-i2s";
-			#sound-dai-cells = <0>;
-			reg = <0x44004000 0x400>;
-			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 37 0x400 0x01>,
-			       <&dmamux1 38 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
 		spi4: spi@44005000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 5c5b1ddf7bfd..c836b4a1dbe2 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -293,7 +293,7 @@
 	status = "disabled";
 };
 
-&spi1 {
+&spi2s1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins_a>;
 	status = "disabled";
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
index 4b10b013ffd5..29f18382d962 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
@@ -114,7 +114,7 @@
 	disable-wp;
 };
 
-&spi1 {
+&spi2s1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins_a>;
 	cs-gpios = <&gpioz 3 0>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 6885948f3024..0dce9b118318 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -362,7 +362,7 @@
 	};
 };
 
-&spi2 {
+&spi2s2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi2_pins_a>;
 	cs-gpios = <&gpioi 0 0>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 48beed0f1f30..4c362af95736 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -427,7 +427,9 @@
 	status = "disabled";
 };
 
-&i2s2 {
+&spi2s2 {
+	compatible = "st,stm32h7-i2s";
+	#sound-dai-cells = <0>;
 	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
 	clock-names = "pclk", "i2sclk", "x8k", "x11k";
 	pinctrl-names = "default", "sleep";
@@ -435,7 +437,8 @@
 	pinctrl-1 = <&i2s2_sleep_pins_a>;
 	status = "okay";
 
-	i2s2_port: port {
+	i2s2_port: port@0 {
+		reg = <0>;
 		i2s2_endpoint: endpoint {
 			remote-endpoint = <&sii9022_tx_endpoint>;
 			format = "i2s";
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
