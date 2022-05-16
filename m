Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A355283F5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 14:16:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B559C57183;
	Mon, 16 May 2022 12:16:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C8AAC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 12:16:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <str@pengutronix.de>)
 id 1nqZeG-0002m0-JR; Mon, 16 May 2022 14:16:28 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <str@pengutronix.de>)
 id 1nqZeG-002fMb-Gn; Mon, 16 May 2022 14:16:27 +0200
Received: from str by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <str@pengutronix.de>)
 id 1nqZeE-00Ayvn-BX; Mon, 16 May 2022 14:16:26 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 16 May 2022 14:16:19 +0200
Message-Id: <20220516121619.2617401-3-s.trumtrar@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516121619.2617401-1-s.trumtrar@pengutronix.de>
References: <20220516121619.2617401-1-s.trumtrar@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: str@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: add STM32MP1-based
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

Add the Phytec STM32MP1-3 Dev board. The devboard uses a Phytec stm32m15-som.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 .../dts/stm32mp157c-phycore-stm32mp1-3.dts    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts

diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
new file mode 100644
index 000000000000..e91c0ef499c9
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
@@ -0,0 +1,56 @@
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
+	compatible = "phytec,phycore-stm32mp1-3", "st,stm32mp157";
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
+	contiguous-area = <&gpu_reserved>;
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
+&sdmmc1 {
+	secure-status = "disabled";
+};
+
+&sdmmc2 {
+	status = "okay";
+	secure-status = "disabled";
+};
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
