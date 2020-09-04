Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE2C25D98E
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Sep 2020 15:23:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AAD2C3FADC;
	Fri,  4 Sep 2020 13:23:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF743C3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 13:23:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084DM2qK005938; Fri, 4 Sep 2020 15:23:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9tDNNyjW1JFlsbbCLIY7DyEV8OK1r9OXdF3FnYfERXw=;
 b=Igs8SeG/ZKp3N0XD8OfxBgvi/CRjxUi0S9+7BaZJ9q139ip+kCpiFe6mmtCBU71yMNnc
 4Z71DgRMm2U78YwyMo78Z4KWA6jt5CxjYxIGRsQ+kW9m5yaf7Sl1rTkJwCKPYIh/igvS
 U5TyC+njDLQHWmR28nlZ9XNq+t9q5Z5OB10PWGTV5ywvgm0H4Zci3iiovApvJWqUN5pI
 y+bDQc+Nz2GXdB6Ke+J2L4B9CFL6APrNREUMEWckiumicZ9V6SUqC1xfk15pm6DjtiTf
 yaDGGtDZmrtyP/g9qt/rYG6ub1C4qumM9c07c6Wq1dT6xGoXt2ik+C5hEbmpdJP6aKZ2 rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 337csw9xvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 15:23:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FA1B10002A;
 Fri,  4 Sep 2020 15:23:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 447B82B0EBD;
 Fri,  4 Sep 2020 15:23:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 4 Sep 2020 15:23:03 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <robh+dt@kernel.org>, <alexandre.torgue@st.com>, <linux@armlinux.org.uk>
Date: Fri, 4 Sep 2020 15:20:43 +0200
Message-ID: <1599225643-5558-3-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1599225643-5558-1-git-send-email-christophe.kerello@st.com>
References: <1599225643-5558-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_07:2020-09-04,
 2020-09-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add FMC2 EBI support for
	stm32mp157c
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

This patch adds FMC2 External Bus Interface support on stm32mp157c.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi     | 43 +++++++++++++++++++++++------------
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 16 +++++++------
 2 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bfe2902..4fd7572 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1302,23 +1302,38 @@
 			dma-requests = <48>;
 		};
 
-		fmc: nand-controller@58002000 {
-			compatible = "st,stm32mp15-fmc2";
-			reg = <0x58002000 0x1000>,
-			      <0x80000000 0x1000>,
-			      <0x88010000 0x1000>,
-			      <0x88020000 0x1000>,
-			      <0x81000000 0x1000>,
-			      <0x89010000 0x1000>,
-			      <0x89020000 0x1000>;
-			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
-			       <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
-			       <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
-			dma-names = "tx", "rx", "ecc";
+		fmc: memory-controller@58002000 {
+			#address-cells = <2>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp1-fmc2-ebi";
+			reg = <0x58002000 0x1000>;
 			clocks = <&rcc FMC_K>;
 			resets = <&rcc FMC_R>;
 			status = "disabled";
+
+			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
+				 <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
+				 <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
+				 <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
+				 <4 0 0x80000000 0x10000000>; /* NAND */
+
+			nand-controller@4,0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32mp1-fmc2-nfc";
+				reg = <4 0x00000000 0x1000>,
+				      <4 0x08010000 0x1000>,
+				      <4 0x08020000 0x1000>,
+				      <4 0x01000000 0x1000>,
+				      <4 0x09010000 0x1000>,
+				      <4 0x09020000 0x1000>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
+				       <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
+				       <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
+				dma-names = "tx", "rx", "ecc";
+				status = "disabled";
+			};
 		};
 
 		qspi: spi@58003000 {
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 85628e1..a55e80c 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -158,14 +158,16 @@
 	pinctrl-0 = <&fmc_pins_a>;
 	pinctrl-1 = <&fmc_sleep_pins_a>;
 	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-		#address-cells = <1>;
-		#size-cells = <1>;
+	nand-controller@4,0 {
+		status = "okay";
+
+		nand@0 {
+			reg = <0>;
+			nand-on-flash-bbt;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
