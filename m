Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A14D1B2A2
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 21:14:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 718CCC8F282;
	Tue, 13 Jan 2026 20:14:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DD47C5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 20:14:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2634E42BA6;
 Tue, 13 Jan 2026 20:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F5CC116C6;
 Tue, 13 Jan 2026 20:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768335252;
 bh=5NBDhvcf0Xl7tSwBf8nTtU/2p0OwbbFqu3FaqzpjFXM=;
 h=From:To:Cc:Subject:Date:From;
 b=Wh9+CgUaWrNifq/AVDrjrmZ9r5yNSepaTEWAcTKTAXHRD3iTDgi/f7UbGqisVflUK
 pHxfJwXGVyU65d4QUZ1XSWKUYPqIEJBs91TPcmTzzCA54ragy6QJYB1OqmLD1rX4bS
 0c5r0CRqFIe9OsWZjxZtO3Ni7l5r6wauKAqj9iFkvVZ/dYrfi/NprRwYNghZ8ZEUXF
 L/ki0D9qOCx8yomhAfrx1xHhklUeoYGUGpTLzoAXq64bFqGyQg6hhf/dMWgYbZ/HFn
 mE3sFQreYBrB8LA4kB8MTqwnlP3ZN9B6TB12rcGTsOWFFYJ3ze8r9FE5l65h/WTbwV
 f6jcd+1zlA+Qw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 13 Jan 2026 14:13:38 -0600
Message-ID: <20260113201340.36950-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] arm/arm64: dts: st: Drop unused .dtsi
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

Reviewed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop erroneous QCom .dtsi
---
 arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------
 .../boot/dts/st/stm32mp15xxab-pinctrl.dtsi    | 57 ---------------
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |  8 ---
 .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    | 71 -------------------
 6 files changed, 176 deletions(-)
 delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
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
