Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43750BB48
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 17:11:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03231C628B1;
	Fri, 22 Apr 2022 15:11:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A41AC628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 15:11:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23MF1q0S028161;
 Fri, 22 Apr 2022 17:10:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=gos07UT+BBqc579VYg/fvSB/SDbppQIssePXNTd0GbM=;
 b=5NrBe5Yz4VQ7tYgchQT+5CdDWJB91RRFoc6zwlzB8itkPlksQXITmDjsmXUSpBn1sTse
 nmfxS2bfYHzP5dyEVCge1ZUZfPAMgPskcgXMcfS6qu9jvS/vFtfHF2jvSaAaiMXLeZeg
 wFnIUZinPo4ES54Bdz0nwtNuPwHDVdcjNBijR/BkcFPUl1NUwvyiPNNdLWH0gkMDlPol
 I77fgwGK7vPEBMCZQcxtJJFFPxkf3W1zOGY699BYHlakvpW3hMdoYz4fXiKHiOz9MGeP
 y0EIzsUfRa367L0JCTHG8woJQIzGNDGr9781BjXASDMXmKjeO40fI69M8808qqv41/hh IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fkskgt1wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 17:10:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34EED100034;
 Fri, 22 Apr 2022 17:10:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D469233C64;
 Fri, 22 Apr 2022 17:10:59 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 17:10:58 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 22 Apr 2022 17:09:52 +0200
Message-ID: <20220422150952.20587-9-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_04,2022-04-22_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, etienne.carriere@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/8] ARM: dts: stm32: Add SCMI version of
	STM32 boards (DK1/DK2/ED1/EV1)
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

Add a "secure" version based on SCMI of STM32 boards. Only boards
provided by STMicroelectronics are concerned:

-STM32MP157A-DK1
-STM32MP157C-DK2
-STM32MP157C-ED1
-STM32MP157C-EV1

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c16f8a2b738..a98b2c26f80b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1160,6 +1160,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157a-avenger96.dtb \
 	stm32mp157a-dhcor-avenger96.dtb \
 	stm32mp157a-dk1.dtb \
+	stm32mp157a-dk1-scmi.dtb \
 	stm32mp157a-iot-box.dtb \
 	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
 	stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb \
@@ -1170,9 +1171,12 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-dhcom-pdk2.dtb \
 	stm32mp157c-dhcom-picoitx.dtb \
 	stm32mp157c-dk2.dtb \
+	stm32mp157c-dk2-scmi.dtb \
 	stm32mp157c-ed1.dtb \
+	stm32mp157c-ed1-scmi.dtb \
 	stm32mp157c-emsbc-argon.dtb \
 	stm32mp157c-ev1.dtb \
+	stm32mp157c-ev1-scmi.dtb \
 	stm32mp157c-lxa-mc1.dtb \
 	stm32mp157c-odyssey.dtb
 dtb-$(CONFIG_MACH_SUN4I) += \
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
new file mode 100644
index 000000000000..e3d3f3f30c7d
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157a-dk1.dts"
+
+/ {
+	model = "STMicroelectronics STM32MP157A-DK1 SCMI Discovery Board";
+	compatible = "st,stm32mp157a-dk1-scmi", "st,stm32mp157a-dk1", "st,stm32mp157";
+
+	reserved-memory {
+		optee@de000000 {
+			reg = <0xde000000 0x2000000>;
+			no-map;
+		};
+	};
+};
+
+&cpu0 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cpu1 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&gpioz {
+	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
+};
+
+&hash1 {
+	clocks = <&scmi_clk CK_SCMI_HASH1>;
+	resets = <&scmi_reset RST_SCMI_HASH1>;
+};
+
+&i2c4 {
+	clocks = <&scmi_clk CK_SCMI_I2C4>;
+	resets = <&scmi_reset RST_SCMI_I2C4>;
+};
+
+&iwdg2 {
+	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
+};
+
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
+&mlahb {
+	resets = <&scmi_reset RST_SCMI_MCU>;
+};
+
+&optee {
+	status = "okay";
+};
+
+&rcc {
+	compatible = "st,stm32mp1-rcc-secure", "syscon";
+	clock-names = "hse", "hsi", "csi", "lse", "lsi";
+	clocks = <&scmi_clk CK_SCMI_HSE>,
+		 <&scmi_clk CK_SCMI_HSI>,
+		 <&scmi_clk CK_SCMI_CSI>,
+		 <&scmi_clk CK_SCMI_LSE>,
+		 <&scmi_clk CK_SCMI_LSI>;
+};
+
+&rng1 {
+	clocks = <&scmi_clk CK_SCMI_RNG1>;
+	resets = <&scmi_reset RST_SCMI_RNG1>;
+};
+
+&rtc {
+	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
+};
+
+&scmi {
+	status = "okay";
+};
+
+&scmi_shm {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
new file mode 100644
index 000000000000..45dcd299aa9e
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157c-dk2.dts"
+
+/ {
+	model = "STMicroelectronics STM32MP157C-DK2 SCMI Discovery Board";
+	compatible = "st,stm32mp157c-dk2-scmi", "st,stm32mp157c-dk2", "st,stm32mp157";
+
+	reserved-memory {
+		optee@de000000 {
+			reg = <0xde000000 0x2000000>;
+			no-map;
+		};
+	};
+};
+
+&cpu0 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cpu1 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cryp1 {
+	clocks = <&scmi_clk CK_SCMI_CRYP1>;
+	resets = <&scmi_reset RST_SCMI_CRYP1>;
+};
+
+&dsi {
+	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+};
+
+&gpioz {
+	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
+};
+
+&hash1 {
+	clocks = <&scmi_clk CK_SCMI_HASH1>;
+	resets = <&scmi_reset RST_SCMI_HASH1>;
+};
+
+&i2c4 {
+	clocks = <&scmi_clk CK_SCMI_I2C4>;
+	resets = <&scmi_reset RST_SCMI_I2C4>;
+};
+
+&iwdg2 {
+	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
+};
+
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
+&mlahb {
+	resets = <&scmi_reset RST_SCMI_MCU>;
+};
+
+&optee {
+	status = "okay";
+};
+
+&rcc {
+	compatible = "st,stm32mp1-rcc-secure", "syscon";
+	clock-names = "hse", "hsi", "csi", "lse", "lsi";
+	clocks = <&scmi_clk CK_SCMI_HSE>,
+		 <&scmi_clk CK_SCMI_HSI>,
+		 <&scmi_clk CK_SCMI_CSI>,
+		 <&scmi_clk CK_SCMI_LSE>,
+		 <&scmi_clk CK_SCMI_LSI>;
+};
+
+&rng1 {
+	clocks = <&scmi_clk CK_SCMI_RNG1>;
+	resets = <&scmi_reset RST_SCMI_RNG1>;
+};
+
+&rtc {
+	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
+};
+
+&scmi {
+	status = "okay";
+};
+
+&scmi_shm {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
new file mode 100644
index 000000000000..458e0ca3cded
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157c-ed1.dts"
+
+/ {
+	model = "STMicroelectronics STM32MP157C-ED1 SCMI eval daughter";
+	compatible = "st,stm32mp157c-ed1-scmi", "st,stm32mp157c-ed1", "st,stm32mp157";
+
+	reserved-memory {
+		optee@fe000000 {
+			reg = <0xfe000000 0x2000000>;
+			no-map;
+		};
+	};
+};
+
+&cpu0 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cpu1 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cryp1 {
+	clocks = <&scmi_clk CK_SCMI_CRYP1>;
+	resets = <&scmi_reset RST_SCMI_CRYP1>;
+};
+
+&gpioz {
+	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
+};
+
+&hash1 {
+	clocks = <&scmi_clk CK_SCMI_HASH1>;
+	resets = <&scmi_reset RST_SCMI_HASH1>;
+};
+
+&i2c4 {
+	clocks = <&scmi_clk CK_SCMI_I2C4>;
+	resets = <&scmi_reset RST_SCMI_I2C4>;
+};
+
+&iwdg2 {
+	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
+};
+
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
+&mlahb {
+	resets = <&scmi_reset RST_SCMI_MCU>;
+};
+
+&optee {
+	status = "okay";
+};
+
+&rcc {
+	compatible = "st,stm32mp1-rcc-secure", "syscon";
+	clock-names = "hse", "hsi", "csi", "lse", "lsi";
+	clocks = <&scmi_clk CK_SCMI_HSE>,
+		 <&scmi_clk CK_SCMI_HSI>,
+		 <&scmi_clk CK_SCMI_CSI>,
+		 <&scmi_clk CK_SCMI_LSE>,
+		 <&scmi_clk CK_SCMI_LSI>;
+};
+
+&rng1 {
+	clocks = <&scmi_clk CK_SCMI_RNG1>;
+	resets = <&scmi_reset RST_SCMI_RNG1>;
+};
+
+&rtc {
+	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
+};
+
+&scmi {
+	status = "okay";
+};
+
+&scmi_shm {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
new file mode 100644
index 000000000000..df9c113edb4b
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157c-ev1.dts"
+
+/ {
+	model = "STMicroelectronics STM32MP157C-EV1 SCMI eval daughter on eval mother";
+	compatible = "st,stm32mp157c-ev1-scmi", "st,stm32mp157c-ev1", "st,stm32mp157c-ed1",
+		     "st,stm32mp157";
+
+	reserved-memory {
+		optee@fe000000 {
+			reg = <0xfe000000 0x2000000>;
+			no-map;
+		};
+	};
+};
+
+&cpu0 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cpu1 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cryp1 {
+	clocks = <&scmi_clk CK_SCMI_CRYP1>;
+	resets = <&scmi_reset RST_SCMI_CRYP1>;
+};
+
+&dsi {
+	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+};
+
+&gpioz {
+	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
+};
+
+&hash1 {
+	clocks = <&scmi_clk CK_SCMI_HASH1>;
+	resets = <&scmi_reset RST_SCMI_HASH1>;
+};
+
+&i2c4 {
+	clocks = <&scmi_clk CK_SCMI_I2C4>;
+	resets = <&scmi_reset RST_SCMI_I2C4>;
+};
+
+&iwdg2 {
+	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
+};
+
+&m_can1 {
+	clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
+};
+
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
+&mlahb {
+	resets = <&scmi_reset RST_SCMI_MCU>;
+};
+
+&optee {
+	status = "okay";
+};
+
+&rcc {
+	compatible = "st,stm32mp1-rcc-secure", "syscon";
+	clock-names = "hse", "hsi", "csi", "lse", "lsi";
+	clocks = <&scmi_clk CK_SCMI_HSE>,
+		 <&scmi_clk CK_SCMI_HSI>,
+		 <&scmi_clk CK_SCMI_CSI>,
+		 <&scmi_clk CK_SCMI_LSE>,
+		 <&scmi_clk CK_SCMI_LSI>;
+};
+
+&rng1 {
+	clocks = <&scmi_clk CK_SCMI_RNG1>;
+	resets = <&scmi_reset RST_SCMI_RNG1>;
+};
+
+&rtc {
+	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
+};
+
+&scmi {
+	status = "okay";
+};
+
+&scmi_shm {
+	status = "okay";
+};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
