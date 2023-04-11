Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3456DD58A
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 10:31:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30908C6B467;
	Tue, 11 Apr 2023 08:31:12 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEA21C6B45F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 08:31:10 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1pm9PC-0005Nv-66; Tue, 11 Apr 2023 10:31:10 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 11 Apr 2023 10:30:45 +0200
Message-Id: <20230411083045.2850138-11-s.trumtrar@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230411083045.2850138-1-s.trumtrar@pengutronix.de>
References: <20230411083045.2850138-1-s.trumtrar@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [Linux-stm32] [PATCH v8 10/10] ARM: dts: stm32: add STM32MP1-based
	Phytec board
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

Add the Phytec STM32MP1-3 Dev board. The devboard uses a Phytec
stm32m157c-som.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---

Notes:
    Changes since v7:
       - remove secure-status for sdmmc

 arch/arm/boot/dts/Makefile                    |  3 +-
 .../dts/stm32mp157c-phycore-stm32mp1-3.dts    | 60 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe4152e5846d..dfa9a7477c825 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1252,7 +1252,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-ev1.dtb \
 	stm32mp157c-ev1-scmi.dtb \
 	stm32mp157c-lxa-mc1.dtb \
-	stm32mp157c-odyssey.dtb
+	stm32mp157c-odyssey.dtb \
+	stm32mp157c-phycore-stm32mp1-3.dtb
 dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-a1000.dtb \
 	sun4i-a10-ba10-tvbox.dtb \
diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
new file mode 100644
index 0000000000000..28d7203264cea
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
+ * Author: Dom VOVARD <dom.vovard@linrt.com>.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
+
+/ {
+	model = "PHYTEC phyCORE-STM32MP1-3 Dev Board";
+	compatible = "phytec,phycore-stm32mp1-3",
+		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
+
+	aliases {
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
+		mmc2 = &sdmmc3;
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &usart1;
+	};
+};
+
+&cryp1 {
+	status = "okay";
+};
+
+&dts {
+	status = "okay";
+};
+
+&fmc {
+	status = "disabled";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&i2c4_eeprom {
+	status = "okay";
+};
+
+&i2c4_rtc {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+};
+
+&sdmmc2 {
+	status = "okay";
+};
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
