Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89949CB9C66
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Dec 2025 21:33:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ABD6C8F277;
	Fri, 12 Dec 2025 20:33:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D458C8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Dec 2025 20:33:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4309260197;
 Fri, 12 Dec 2025 20:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D849DC4CEF1;
 Fri, 12 Dec 2025 20:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765571582;
 bh=oXV52+EBwnwQgsf4JQISAFcL+Q5wlGyp41ZRqonHpZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=KpvygYdbl+4QNc5B0uRSQKkrD3fQ8etfSezmQ9uT3E2yv1THLQROJFd6eavFCHURo
 xX0+3Wdd/mbarggr2WfdhfVIfznhmevgSradqiJrVjX4oATKIeQpOidzJxWfYX9UMj
 mvSRtL8QntugInpc1el8zgQfBM4jRQE3rjSZj38S6XHrdT28tifFqrTWrk+K4xbxZX
 5nKqVWjr+g6ZSc5MEPMJTzz39ERSfNQ3UnXiSbDQ2D5/EWhTKYTYPhFDVDJ89u5xok
 tTS1nIt0485bFcHL0AGVHkTEPjIwH7xF6ygRuyHdLliBze4vkI45jOn8PGJ1ziiTDC
 SMAmkG1Od/Yjg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 12 Dec 2025 14:32:09 -0600
Message-ID: <20251212203226.458694-3-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, soc@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] arm/arm64: dts: st: Drop unused .dtsi
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

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------
 .../boot/dts/st/stm32mp15xxab-pinctrl.dtsi    | 57 ---------------
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi    | 63 ----------------
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |  8 ---
 .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    | 71 -------------------
 7 files changed, 239 deletions(-)
 delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi

diff --git a/arch/arm/boot/dts/st/spear320s.dtsi b/arch/arm/boot/dts/st/spear320s.dtsi
deleted file mode 100644
index 133236dc190d..000000000000
--- a/arch/arm/boot/dts/st/spear320s.dtsi
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * DTS file for SPEAr320s SoC
- *
- * Copyright 2021 Herve Codina <herve.codina@bootlin.com>
- */
-
-/include/ "spear320.dtsi"
-
-/ {
-	ahb {
-		apb {
-			gpiopinctrl: gpio@b3000000 {
-				/*
-				 * The "RM0321 SPEAr320s address and map
-				 * registers" document mentions interrupt 6
-				 * (NPGIO_INTR) for the PL_GPIO interrupt.
-				 */
-				interrupts = <6>;
-				interrupt-parent = <&shirq>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
deleted file mode 100644
index 328dad140e9b..000000000000
--- a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
+++ /dev/null
@@ -1,57 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AB>;
-
-	gpioa: gpio@50002000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@50003000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@50004000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 32 16>;
-	};
-
-	gpiod: gpio@50005000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@50006000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@50007000 {
-		status = "okay";
-		ngpios = <6>;
-		gpio-ranges = <&pinctrl 6 86 6>;
-	};
-
-	gpiog: gpio@50008000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl 6 102 10>;
-	};
-
-	gpioh: gpio@50009000 {
-		status = "okay";
-		ngpios = <2>;
-		gpio-ranges = <&pinctrl 0 112 2>;
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi b/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
deleted file mode 100644
index 929bdcd45d02..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
+++ /dev/null
@@ -1,63 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
- */
-
-#include "msm8996.dtsi"
-
-/ {
-	qcom,msm-id = <246 0x30000>;
-};
-
- /*
-  * This revision seems to have differ GPU CPR
-  * parameters, GPU frequencies and some differences
-  * when it comes to voltage delivery to.. once again
-  * the GPU. Funnily enough, it's simpler to make it an
-  * overlay on top of 3.1 (the final one) than vice versa.
-  * The differences will show here as more and more
-  * features get enabled upstream.
-  */
-
-gpu_opp_table_3_0: opp-table-gpu30 {
-	compatible = "operating-points-v2";
-
-	opp-624000000 {
-		opp-hz = /bits/ 64 <624000000>;
-		opp-level = <7>;
-	};
-
-	opp-560000000 {
-		opp-hz = /bits/ 64 <560000000>;
-		opp-level = <6>;
-	};
-
-	opp-510000000 {
-		opp-hz = /bits/ 64 <510000000>;
-		opp-level = <5>;
-	};
-
-	opp-401800000 {
-		opp-hz = /bits/ 64 <401800000>;
-		opp-level = <4>;
-	};
-
-	opp-315000000 {
-		opp-hz = /bits/ 64 <315000000>;
-		opp-level = <3>;
-	};
-
-	opp-214000000 {
-		opp-hz = /bits/ 64 <214000000>;
-		opp-level = <3>;
-	};
-
-	opp-133000000 {
-		opp-hz = /bits/ 64 <133000000>;
-		opp-level = <3>;
-	};
-};
-
-&gpu {
-	operating-points-v2 = <&gpu_opp_table_3_0>;
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi b/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
deleted file mode 100644
index e33b00b424e1..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp23xc.dtsi b/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
deleted file mode 100644
index e33b00b424e1..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi b/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
deleted file mode 100644
index 5e83a6926485..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
deleted file mode 100644
index 2406e972554c..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AL>;
-
-	gpioa: gpio@44240000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@44250000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@44260000 {
-		status = "okay";
-		ngpios = <14>;
-		gpio-ranges = <&pinctrl 0 32 14>;
-	};
-
-	gpiod: gpio@44270000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@44280000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@44290000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 80 16>;
-	};
-
-	gpiog: gpio@442a0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 96 16>;
-	};
-
-	gpioh: gpio@442b0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 2 114 12>;
-	};
-
-	gpioi: gpio@442c0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 0 128 12>;
-	};
-};
-
-&pinctrl_z {
-	gpioz: gpio@46200000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl_z 0 400 10>;
-	};
-};
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
