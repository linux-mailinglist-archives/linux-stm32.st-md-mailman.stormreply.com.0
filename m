Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E410D94E
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Nov 2019 19:06:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7EF3C36B0B;
	Fri, 29 Nov 2019 18:06:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7D16C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2019 18:06:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xATI28bE023932; Fri, 29 Nov 2019 19:06:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CGV8S/eMKv56unQRut98j0sGn8pkJ9E63CyqkZteevw=;
 b=RKldKw/6udso8MS+BO337tY7q7pjmwU6gq6GFRL6ysNsjm/EaHCw91gbojyWYvcyt0rL
 58guH5bPJYQ/l09WZNW6cKVC2SHDaymZCAS2bdWniM7G0RGduEy6X92xf8Dqk72TpNmL
 bvgAiY7dGhF3XJpuA85iCzdb83DM4TBFSx0UHwwVTwEonEX6nWiqFc1ORTWOCSsLKhVm
 ANPGHOdzS7aPQx7Z+c54NRwc90NE9/x86XJHv669WioCXWDGVYPgy1s0tPRyDJClvtio
 UQ6zaOrisslWdK+nKWRqlAFJ4rA8PVmr2RdSoY8JJlMfhTRP6yAz9/eNFy+2qSOlL3EG 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxjgr6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2019 19:06:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 978CB100039;
 Fri, 29 Nov 2019 19:06:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BD5C222D1F;
 Fri, 29 Nov 2019 19:06:06 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 29 Nov 2019 19:06:06
 +0100
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Fri, 29 Nov 2019 19:05:59 +0100
Message-ID: <20191129180602.28470-4-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129180602.28470-1-alexandre.torgue@st.com>
References: <20191129180602.28470-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-29_06:2019-11-29,2019-11-29 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/6] ARM: dts: stm32: Introduce new
	STM32MP15 SOCs: STM32MP151 and STM32MP153
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

STM32MP151 and STM32MP153 were not explicitly supported through
stm32mp157c.dts. This commit adds dedicated files to support all STM32MP15
SOCs family.

The differences between those SOCs are:
 -STM32MP151 [1]: common file.
 -STM32MP153 [2]: STM32MP151 + CANs + a second CortexA7-CPU.
 -STM32MP157 [3]: STM32MP153 + DSI + GPU.

[1] https://www.st.com/resource/en/reference_manual/dm00366349.pdf
[2] https://www.st.com/resource/en/reference_manual/dm00366355.pdf
[3] https://www.st.com/resource/en/reference_manual/dm00327659.pdf

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
similarity index 96%
rename from arch/arm/boot/dts/stm32mp157c.dtsi
rename to arch/arm/boot/dts/stm32mp151.dtsi
index ce641c4359cf..9a0b55be134d 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -20,12 +20,6 @@
 			device_type = "cpu";
 			reg = <0>;
 		};
-
-		cpu1: cpu@1 {
-			compatible = "arm,cortex-a7";
-			device_type = "cpu";
-			reg = <1>;
-		};
 	};
 
 	psci {
@@ -953,32 +947,6 @@
 			};
 		};
 
-		m_can1: can@4400e000 {
-			compatible = "bosch,m_can";
-			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
-			status = "disabled";
-		};
-
-		m_can2: can@4400f000 {
-			compatible = "bosch,m_can";
-			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
-			status = "disabled";
-		};
-
 		dma1: dma@48000000 {
 			compatible = "st,stm32-dma";
 			reg = <0x48000000 0x400>;
@@ -1444,26 +1412,6 @@
 			status = "disabled";
 		};
 
-		gpu: gpu@59000000 {
-			compatible = "vivante,gc";
-			reg = <0x59000000 0x800>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc GPU>, <&rcc GPU_K>;
-			clock-names = "bus" ,"core";
-			resets = <&rcc GPU_R>;
-			status = "disabled";
-		};
-
-		dsi: dsi@5a000000 {
-			compatible = "st,stm32-dsi";
-			reg = <0x5a000000 0x800>;
-			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
-			clock-names = "pclk", "ref", "px_clk";
-			resets = <&rcc DSI_R>;
-			reset-names = "apb";
-			status = "disabled";
-		};
-
 		ltdc: display-controller@5a001000 {
 			compatible = "st,stm32-ltdc";
 			reg = <0x5a001000 0x400>;
diff --git a/arch/arm/boot/dts/stm32mp153.dtsi b/arch/arm/boot/dts/stm32mp153.dtsi
new file mode 100644
index 000000000000..2d759fc6015c
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp153.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp151.dtsi"
+
+/ {
+	cpus {
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <1>;
+		};
+	};
+
+	soc {
+		m_can1: can@4400e000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+
+		m_can2: can@4400f000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
new file mode 100644
index 000000000000..3f0a4a91cce6
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp153.dtsi"
+
+/ {
+	soc {
+		gpu: gpu@59000000 {
+			compatible = "vivante,gc";
+			reg = <0x59000000 0x800>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc GPU>, <&rcc GPU_K>;
+			clock-names = "bus" ,"core";
+			resets = <&rcc GPU_R>;
+			status = "disabled";
+		};
+
+		dsi: dsi@5a000000 {
+			compatible = "st,stm32-dsi";
+			reg = <0x5a000000 0x800>;
+			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
+			clock-names = "pclk", "ref", "px_clk";
+			resets = <&rcc DSI_R>;
+			reset-names = "apb";
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index 2f6dd51e8506..cbfa4075907e 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "stm32mp157c.dtsi"
+#include "stm32mp157.dtsi"
 #include "stm32mp15-pinctrl.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 7ee7b4d13d39..3f869bd67082 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "stm32mp157c.dtsi"
+#include "stm32mp157.dtsi"
 #include "stm32mp15-pinctrl.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index e5d8da01aaef..975f69ea4eed 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -5,7 +5,7 @@
  */
 /dts-v1/;
 
-#include "stm32mp157c.dtsi"
+#include "stm32mp157.dtsi"
 #include "stm32mp15-pinctrl.dtsi"
 #include "stm32mp15xxaa-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
