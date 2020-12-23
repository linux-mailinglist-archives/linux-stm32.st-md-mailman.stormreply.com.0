Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B729B2E20BC
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Dec 2020 20:16:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D599C57184;
	Wed, 23 Dec 2020 19:16:55 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7800BC5717E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 19:16:54 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id t22so10907172pfl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 11:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qhp6q+QBdG1WW7qenApuL0xvi4ljbicDcoMAKnT28Zc=;
 b=BKd0gmyaN1VGhpAPkmphgaKf0IfBekNhHWpA34wieyhk3fQpSga44Zlih2ixTE1FmY
 ld6F48X6b9u5CRK+9cU1HS9hVmZm5lmLoY9GZZjhzQjGguc/oH7NapcRW2hXSts+Iq+R
 FmdK35es4TSHG0VzfxiK7KJEBQAyI+rGVAK2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qhp6q+QBdG1WW7qenApuL0xvi4ljbicDcoMAKnT28Zc=;
 b=r/OR9jszjjiSYJPfcIoi48OlvXNjtQ8/FenZZz6LIjDiQRrnJ1wtkSys3CkSd18aWt
 t6T9NxWpggRkqYj2n9tu+qJimMabHGAaicJAIsmJirgMfKsi3RHJ+nwdwuxQhKzHsx4M
 voYF0IXFPcHMgLCQzUppkX4oJb4eaTRoPCru36VAiDQJ2XFpY7p012kY37wC0A8wXlib
 tCzl/rhEahza9M/+vO/MFSmnim3qeKsIi19bCzf2pWKAEI7SsxHiAYVM6jPmRY9XHjn1
 F/UcCnnVBzZ8IF9FzAI9pY2QBYJyZJsSA/NDMnFBO1xSJEmA5OPMhTuxn6sLjIQULuWY
 UeGg==
X-Gm-Message-State: AOAM531Yz8QH5g0Oo5xvjcVBZBdbiAWjq/SU6oWG+S/ngm6wqWRi648i
 7LlNc3FJ3KrfozoRiemV/2oKVQ==
X-Google-Smtp-Source: ABdhPJxDkZNiUeZCBlgr0bVt5R7MhD/a9Io5mgKDvVxS1PNVfl7x0p7h7lC9IVu88o1R+ygUxidthA==
X-Received: by 2002:a63:1142:: with SMTP id 2mr25898480pgr.263.1608751012585; 
 Wed, 23 Dec 2020 11:16:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a884:29f0:6e54:608c:e1b9])
 by smtp.gmail.com with ESMTPSA id i2sm397640pjd.21.2020.12.23.11.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 11:16:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 24 Dec 2020 00:44:00 +0530
Message-Id: <20201223191402.378560-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223191402.378560-1-jagan@amarulasolutions.com>
References: <20201223191402.378560-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Francesco Utel <francesco.utel@engicam.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Mirko Ardinghi <mirko.ardinghi@engicam.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/5] ARM: dts: stm32: Add Engicam MicroGEA
	STM32MP1 MicroDev 2.0 board
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

MicroDev 2.0 is a general purpose miniature carrier board with CAN,
LTE and LVDS panel interfaces.

Genaral features:
- Ethernet 10/100
- USB Type A
- Audio Out
- microSD
- LVDS panel connector
- Wifi/BT (option)
- UMTS LTE with sim connector (option)

MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.

Add support for it.

Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
Signed-off-by: Francesco Utel <francesco.utel@engicam.com>
Signed-off-by: Mirko Ardinghi <mirko.ardinghi@engicam.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/stm32mp157a-engicam-microdev2.0.dtsi  | 44 +++++++++++++++++++
 ...32mp157a-microgea-stm32mp1-microdev2.0.dts | 21 +++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-engicam-microdev2.0.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9f9f3e49132a..b4a9cd071f99 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1071,6 +1071,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157a-dhcor-avenger96.dtb \
 	stm32mp157a-dk1.dtb \
 	stm32mp157a-iot-box.dtb \
+	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
 	stm32mp157a-stinger96.dtb \
 	stm32mp157c-dhcom-pdk2.dtb \
 	stm32mp157c-dhcom-picoitx.dtb \
diff --git a/arch/arm/boot/dts/stm32mp157a-engicam-microdev2.0.dtsi b/arch/arm/boot/dts/stm32mp157a-engicam-microdev2.0.dtsi
new file mode 100644
index 000000000000..a5c04eb80a99
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-engicam-microdev2.0.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	aliases {
+		serial0 = &uart4;
+		serial1 = &uart8;
+	};
+};
+
+&sdmmc1{
+	bus-width = <4>;
+	disable-wp;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	st,neg-edge;
+	vmmc-supply = <&vdd>;
+	status = "okay";
+};
+
+&uart4{
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	status = "okay";
+};
+
+/* J31: RS323 */
+&uart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8_pins_a>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
new file mode 100644
index 000000000000..51707bfb649d
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/dts-v1/;
+#include "stm32mp157.dtsi"
+#include "stm32mp157a-engicam-microdev2.0.dtsi"
+#include "stm32mp157a-microgea-stm32mp1.dtsi"
+
+/ {
+	model = "Engicam MicroGEA STM32MP1 MicroDev 2.0 Carrier Board";
+	compatible = "engicam,microgea-stm32mp1-microdev2.0",
+		     "engicam,microgea-stm32mp1", "st,stm32mp157";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
