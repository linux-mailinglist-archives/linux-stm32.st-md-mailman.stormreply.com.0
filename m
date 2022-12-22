Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F11B8653E04
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2C2AC6904E;
	Thu, 22 Dec 2022 10:08:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A40D4C6904D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:08:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BM7i86C006371; Thu, 22 Dec 2022 11:08:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=HvbZMt9uDmeIHEq1F2d8b531XzccYnOXXCh8BRejkHI=;
 b=0aOLiW/5yk94W7IywlL+O7RGxMcFAbR7V/cT2Y2xoSg0b+iei4SGAUY2jrGh/c6HBJq4
 o0GxNw8EGtZW66xSsQX8C+UKamz1YG/N7GJoe6zwJp9+d5DP7TO1JUlv0xlPMflvbi5P
 np9g5vSxiEhPW2S1XdgqjajikA6XLBmHoi9b8NE5n8JnCyzZqHe6O+R/mbdigRV2qp1Y
 ANKwvFMo0ANhB7gK1W46zMuEAGFvVrjHtua4p4unfbpRwCI+dlv3VUwczBKs9EzrCT7O
 oqU1KT5j9nK1j8DtYHeEu+I4zKaYLb+7x9WL4tS6ykBD7umrHGM3k3N3O6djEbUGWU51 nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mkc8jdu2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 11:08:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 970B810002A;
 Thu, 22 Dec 2022 11:08:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EE4521D3C8;
 Thu, 22 Dec 2022 11:08:15 +0100 (CET)
Received: from localhost (10.201.21.217) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 22 Dec
 2022 11:08:15 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <Oleksii_Moisieiev@epam.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Thu, 22 Dec 2022 11:07:15 +0100
Message-ID: <20221222100715.69233-8-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222100715.69233-6-gatien.chevallier@foss.st.com>
References: <20221222100715.69233-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.217]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_05,2022-12-21_01,2022-06-22_01
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, gatien.chevallier@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH v2 7/7] ARM: dts: stm32: add ETZPC as a
	system bus for STM32MP13x boards
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

The STM32 System Bus is an internal bus on which devices are connected.
ETZPC is a peripheral overseeing the firewall bus that configures
and control access to the peripherals connected on it.

For more information on which peripheral is securable, please read
the STM32MP13 reference manual.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 242 ++++++++++++++++--------------
 1 file changed, 130 insertions(+), 112 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index dd35a607073d..0b3934fe6c34 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/bus/stm32mp13_sys_bus.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
 #include <dt-bindings/reset/stm32mp13-resets.h>
@@ -231,88 +232,6 @@ dmamux1: dma-router@48002000 {
 			dma-channels = <16>;
 		};
 
-		spi4: spi@4c002000 {
-			compatible = "st,stm32h7-spi";
-			reg = <0x4c002000 0x400>;
-			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI4_K>;
-			resets = <&rcc SPI4_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 83 0x400 0x01>,
-			       <&dmamux1 84 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spi5: spi@4c003000 {
-			compatible = "st,stm32h7-spi";
-			reg = <0x4c003000 0x400>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI5_K>;
-			resets = <&rcc SPI5_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 85 0x400 0x01>,
-			       <&dmamux1 86 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		i2c3: i2c@4c004000 {
-			compatible = "st,stm32mp13-i2c";
-			reg = <0x4c004000 0x400>;
-			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc I2C3_K>;
-			resets = <&rcc I2C3_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 73 0x400 0x1>,
-			       <&dmamux1 74 0x400 0x1>;
-			dma-names = "rx", "tx";
-			st,syscfg-fmp = <&syscfg 0x4 0x4>;
-			i2c-analog-filter;
-			status = "disabled";
-		};
-
-		i2c4: i2c@4c005000 {
-			compatible = "st,stm32mp13-i2c";
-			reg = <0x4c005000 0x400>;
-			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc I2C4_K>;
-			resets = <&rcc I2C4_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 75 0x400 0x1>,
-			       <&dmamux1 76 0x400 0x1>;
-			dma-names = "rx", "tx";
-			st,syscfg-fmp = <&syscfg 0x4 0x8>;
-			i2c-analog-filter;
-			status = "disabled";
-		};
-
-		i2c5: i2c@4c006000 {
-			compatible = "st,stm32mp13-i2c";
-			reg = <0x4c006000 0x400>;
-			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc I2C5_K>;
-			resets = <&rcc I2C5_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 115 0x400 0x1>,
-			       <&dmamux1 116 0x400 0x1>;
-			dma-names = "rx", "tx";
-			st,syscfg-fmp = <&syscfg 0x4 0x10>;
-			i2c-analog-filter;
-			status = "disabled";
-		};
-
 		rcc: rcc@50000000 {
 			compatible = "st,stm32mp13-rcc", "syscon";
 			reg = <0x50000000 0x1000>;
@@ -349,36 +268,6 @@ mdma: dma-controller@58000000 {
 			dma-requests = <48>;
 		};
 
-		sdmmc1: mmc@58005000 {
-			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x20253180>;
-			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
-			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
-			clocks = <&rcc SDMMC1_K>;
-			clock-names = "apb_pclk";
-			resets = <&rcc SDMMC1_R>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <130000000>;
-			status = "disabled";
-		};
-
-		sdmmc2: mmc@58007000 {
-			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x20253180>;
-			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
-			clocks = <&rcc SDMMC2_K>;
-			clock-names = "apb_pclk";
-			resets = <&rcc SDMMC2_R>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <130000000>;
-			status = "disabled";
-		};
-
 		iwdg2: watchdog@5a002000 {
 			compatible = "st,stm32mp1-iwdg";
 			reg = <0x5a002000 0x400>;
@@ -414,6 +303,135 @@ ts_cal2: calib@5e {
 			};
 		};
 
+		etzpc: etzpc@5c007000 {
+			compatible = "st,stm32mp13-sys-bus";
+			reg = <0x5c007000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			feature-domain-controller;
+			#feature-domain-cells = <2>;
+			ranges;
+
+			spi4: spi@4c002000 {
+				compatible = "st,stm32h7-spi";
+				reg = <0x4c002000 0x400>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc SPI4_K>;
+				resets = <&rcc SPI4_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 83 0x400 0x01>,
+				       <&dmamux1 84 0x400 0x01>;
+				dma-names = "rx", "tx";
+				feature-domains = <&etzpc STM32MP1_ETZPC_SPI4_ID>;
+				status = "disabled";
+			};
+
+			spi5: spi@4c003000 {
+				compatible = "st,stm32h7-spi";
+				reg = <0x4c003000 0x400>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc SPI5_K>;
+				resets = <&rcc SPI5_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 85 0x400 0x01>,
+				       <&dmamux1 86 0x400 0x01>;
+				dma-names = "rx", "tx";
+				feature-domains = <&etzpc STM32MP1_ETZPC_SPI5_ID>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@4c004000 {
+				compatible = "st,stm32mp13-i2c";
+				reg = <0x4c004000 0x400>;
+				interrupt-names = "event", "error";
+				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc I2C3_K>;
+				resets = <&rcc I2C3_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 73 0x400 0x1>,
+				       <&dmamux1 74 0x400 0x1>;
+				dma-names = "rx", "tx";
+				st,syscfg-fmp = <&syscfg 0x4 0x4>;
+				i2c-analog-filter;
+				feature-domains = <&etzpc STM32MP1_ETZPC_I2C3_ID>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@4c005000 {
+				compatible = "st,stm32mp13-i2c";
+				reg = <0x4c005000 0x400>;
+				interrupt-names = "event", "error";
+				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc I2C4_K>;
+				resets = <&rcc I2C4_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 75 0x400 0x1>,
+				       <&dmamux1 76 0x400 0x1>;
+				dma-names = "rx", "tx";
+				st,syscfg-fmp = <&syscfg 0x4 0x8>;
+				i2c-analog-filter;
+				feature-domains = <&etzpc STM32MP1_ETZPC_I2C4_ID>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@4c006000 {
+				compatible = "st,stm32mp13-i2c";
+				reg = <0x4c006000 0x400>;
+				interrupt-names = "event", "error";
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc I2C5_K>;
+				resets = <&rcc I2C5_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 115 0x400 0x1>,
+				       <&dmamux1 116 0x400 0x1>;
+				dma-names = "rx", "tx";
+				st,syscfg-fmp = <&syscfg 0x4 0x10>;
+				i2c-analog-filter;
+				feature-domains = <&etzpc STM32MP1_ETZPC_I2C5_ID>;
+				status = "disabled";
+			};
+
+			sdmmc1: mmc@58005000 {
+				compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x20253180>;
+				reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "cmd_irq";
+				clocks = <&rcc SDMMC1_K>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC1_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <130000000>;
+				feature-domains = <&etzpc STM32MP1_ETZPC_SDMMC1_ID>;
+				status = "disabled";
+			};
+
+			sdmmc2: mmc@58007000 {
+				compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x20253180>;
+				reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
+				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "cmd_irq";
+				clocks = <&rcc SDMMC2_K>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <130000000>;
+				feature-domains = <&etzpc STM32MP1_ETZPC_SDMMC2_ID>;
+				status = "disabled";
+			};
+
+		};
 		/*
 		 * Break node order to solve dependency probe issue between
 		 * pinctrl and exti.
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
