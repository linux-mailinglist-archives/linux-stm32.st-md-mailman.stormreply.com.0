Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47D714E23
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 18:22:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0691C6B443;
	Mon, 29 May 2023 16:22:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13173C6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 16:22:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34TBPLpq014278; Mon, 29 May 2023 18:22:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=URPMyZ0cWhjrevEx55KM2u3Pq++xNRKwlp8kHzIpe5A=;
 b=N+8Ea1N7hEu7WCCubRMmI/3ZD5Pjv95gOJ7RbzgMxRhi8rL0gcJvvYgl42JeIUa0S3ny
 RB/RcE3TQVbRr72EHKiKSgNuvNpJlp22jASLRl40S1gIZKRuhojV57upl2ciCw1wZTNo
 yCDt4dueQ+MIz7cz7Z3XIeInzD0nUhUkPPl+J7+ZGN0XXBr1B7701mpuKmybCYnOAH3H
 f3eU80YDUpOde/5t0My+qrcx9IFu+Ck4wpaPdvQ/Wze9ru08Xj3K/+xmTgoSfa70bhja
 /v+CY+oytY5erYOJwsKu1PdEgLaVI57iyglqcUroynJxIG1NWKioSuBUYkrxv5JsyRSb Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy2mhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 18:22:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6ED5910003A;
 Mon, 29 May 2023 18:22:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E03F233C79;
 Mon, 29 May 2023 18:21:45 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 18:21:44 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, <soc@kernel.org>
Date: Mon, 29 May 2023 18:20:29 +0200
Message-ID: <20230529162034.20481-7-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_10,2023-05-29_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 06/11] arm64: dts: st: introduce stm32mp25
	SoCs family
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

STM32MP25 family is composed of 4 SoCs defined as following:

-STM32MP251: common part composed of 1*Cortex-A35, common peripherals like
SDMMC, UART, SPI, I2C, PCIe, USB3, parallel and DSI display, 1*ETH ...

-STM32MP253: STM32MP251 + 1*Cortex-A35 (dual CPU), a second ETH, CAN-FD and
LVDS display.

-STM32MP255: STM32MP253 + GPU/AI and video encode/decode.
-STM32MP257: STM32MP255 + ETH TSN switch (2+1 ports).

A second diversity layer exists for security features/ A35 frequency:
-STM32MP25xY, "Y" gives information:
 -Y = A means A35@1.2GHz + no cryp IP and no secure boot.
 -Y = C means A35@1.2GHz + cryp IP and secure boot.
 -Y = D means A35@1.5GHz + no cryp IP and no secure boot.
 -Y = F means A35@1.5GHz + cryp IP and secure boot.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
new file mode 100644
index 000000000000..5268a4321841
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a35-pmu";
+		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+		interrupt-parent = <&intc>;
+	};
+
+	clocks {
+		ck_flexgen_08: ck-flexgen-08 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <100000000>;
+		};
+
+		ck_flexgen_51: ck-flexgen-51 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+
+		ck_icn_ls_mcu: ck-icn-ls-mcu {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scmi {
+			compatible = "linaro,scmi-optee";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			linaro,optee-channel-id = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+	};
+
+	intc: interrupt-controller@4ac00000 {
+		compatible = "arm,cortex-a7-gic";
+		#interrupt-cells = <3>;
+		#address-cells = <1>;
+		interrupt-controller;
+		reg = <0x0 0x4ac10000 0x0 0x1000>,
+		      <0x0 0x4ac20000 0x0 0x2000>,
+		      <0x0 0x4ac40000 0x0 0x2000>,
+		      <0x0 0x4ac60000 0x0 0x2000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+		ranges = <0x0 0x0 0x0 0x80000000>;
+
+		rifsc: rifsc-bus@42080000 {
+			compatible = "simple-bus";
+			reg = <0x42080000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			usart2: serial@400e0000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x400e0000 0x400>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&ck_flexgen_08>;
+				status = "disabled";
+			};
+		};
+
+		syscfg: syscon@44230000 {
+			compatible = "st,stm32mp25-syscfg", "syscon";
+			reg = <0x44230000 0x10000>;
+		};
+
+		pinctrl: pinctrl@44240000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp257-pinctrl";
+			ranges = <0 0x44240000 0xa0400>;
+			pins-are-numbered;
+
+			gpioa: gpio@44240000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x0 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOA";
+				status = "disabled";
+			};
+
+			gpiob: gpio@44250000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x10000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOB";
+				status = "disabled";
+			};
+
+			gpioc: gpio@44260000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x20000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOC";
+				status = "disabled";
+			};
+
+			gpiod: gpio@44270000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x30000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOD";
+				status = "disabled";
+			};
+
+			gpioe: gpio@44280000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x40000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOE";
+				status = "disabled";
+			};
+
+			gpiof: gpio@44290000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x50000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOF";
+				status = "disabled";
+			};
+
+			gpiog: gpio@442a0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x60000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOG";
+				status = "disabled";
+			};
+
+			gpioh: gpio@442b0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x70000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOH";
+				status = "disabled";
+			};
+
+			gpioi: gpio@442c0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x80000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOI";
+				status = "disabled";
+			};
+
+			gpioj: gpio@442d0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x90000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOJ";
+				status = "disabled";
+			};
+
+			gpiok: gpio@442e0000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0xa0000 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOK";
+				status = "disabled";
+			};
+		};
+
+		pinctrl_z: pinctrl@46200000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp257-z-pinctrl";
+			ranges = <0 0x46200000 0x400>;
+			pins-are-numbered;
+
+			gpioz: gpio@46200000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0 0x400>;
+				clocks = <&ck_icn_ls_mcu>;
+				st,bank-name = "GPIOZ";
+				st,bank-ioport = <11>;
+				status = "disabled";
+			};
+
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
new file mode 100644
index 000000000000..af48e82efe8a
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp251.dtsi"
+
+/ {
+	cpus {
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			reg = <1>;
+			enable-method = "psci";
+		};
+	};
+
+	arm-pmu {
+		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
new file mode 100644
index 000000000000..e6fa596211f5
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp253.dtsi"
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257.dtsi b/arch/arm64/boot/dts/st/stm32mp257.dtsi
new file mode 100644
index 000000000000..5c5000d3d9db
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp255.dtsi"
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi b/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
new file mode 100644
index 000000000000..5e83a6926485
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xf.dtsi b/arch/arm64/boot/dts/st/stm32mp25xf.dtsi
new file mode 100644
index 000000000000..5e83a6926485
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xf.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
