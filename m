Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3010EC08
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2019 16:04:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7BF0C36B0B;
	Mon,  2 Dec 2019 15:04:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1061CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2019 15:04:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB2Eqcve006818; Mon, 2 Dec 2019 16:03:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=TVle+DE3dnCA7IhmRgC1AN/Md8I3hWUb219+dQQGb4c=;
 b=KhbYeHhwb4lDOLTJQC8Ipqj5iCfMPlGEmXqeEMsxdSyx3+4yx0Sl6hOlixYI+qzy5aaz
 KY8BRCStBKfkRKl93rVv0R3nJf8cc9S+GVZvJEGt87WL5bwCxflG1BOvaN7XnpdBL19s
 SUwUjGNuQX7yRXwno+oGOyNP/NF9+7X3Q1gbzoQzalRv8ZMLtcPrtevWtpiBSZlQE8cp
 uZ1ZXSJincuEzfUQw7LwA6mvE3WQAQv1pXyH4fhqZfFCKmjLn75k3w/BnxW0uBgndgy5
 MUPg+FHzJjKKyfuZ6ZdL65WMDwRsxDbTXP44M07687NOA4moswH0M5svfka4oYuXBJPU kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkee9tk0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 16:03:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB08C10002A;
 Mon,  2 Dec 2019 16:03:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag4node2.st.com [10.75.127.11])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDD662D3783;
 Mon,  2 Dec 2019 16:03:56 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG4NODE2.st.com (10.75.127.11)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 2 Dec 2019 16:03:56 +0100
From: <gabriel.fernandez@st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Mon, 2 Dec 2019 16:03:43 +0100
Message-ID: <20191202150343.27854-1-gabriel.fernandez@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG4NODE2.st.com
 (10.75.127.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_02:2019-11-29,2019-12-02 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: rcc: Convert stm32mp1 rcc
	bindings to json-schema
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

From: Gabriel Fernandez <gabriel.fernandez@st.com>

Convert the STM32MP1 RCC binding to DT schema format using json-schema.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 .../bindings/clock/st,stm32mp1-rcc.txt        | 60 --------------
 .../bindings/clock/st,stm32mp1-rcc.yaml       | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt
deleted file mode 100644
index fb9495ea582c..000000000000
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-STMicroelectronics STM32 Peripheral Reset Clock Controller
-==========================================================
-
-The RCC IP is both a reset and a clock controller.
-
-RCC makes also power management (resume/supend and wakeup interrupt).
-
-Please also refer to reset.txt for common reset controller binding usage.
-
-Please also refer to clock-bindings.txt for common clock controller
-binding usage.
-
-
-Required properties:
-- compatible: "st,stm32mp1-rcc", "syscon"
-- reg: should be register base and length as documented in the datasheet
-- #clock-cells: 1, device nodes should specify the clock in their
-  "clocks" property, containing a phandle to the clock device node,
-  an index specifying the clock to use.
-- #reset-cells: Shall be 1
-- interrupts: Should contain a general interrupt line and a interrupt line
-  to the wake-up of processor (CSTOP).
-
-Example:
-	rcc: rcc@50000000 {
-		compatible = "st,stm32mp1-rcc", "syscon";
-		reg = <0x50000000 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>,
-			     <GIC_SPI 145 IRQ_TYPE_NONE>;
-	};
-
-Specifying clocks
-=================
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/stm32mp1-clks.h header and can be used in device
-tree sources.
-
-Specifying softreset control of devices
-=======================================
-
-Device nodes should specify the reset channel required in their "resets"
-property, containing a phandle to the reset device node and an index specifying
-which channel to use.
-The index is the bit number within the RCC registers bank, starting from RCC
-base address.
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register.
-
-For example on STM32MP1, for LTDC reset:
- ltdc = APB4_RSTSETR_offset / 4 * 32 + LTDC_bit_offset
-      = 0x180 / 4 * 32 + 0 = 3072
-
-The list of valid indices for STM32MP1 is available in:
-include/dt-bindings/reset-controller/stm32mp1-resets.h
-
-This file implements defines like:
-#define LTDC_R	3072
diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
new file mode 100644
index 000000000000..b8f91e444d2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/st,stm32mp1-rcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Reset Clock Controller Binding
+
+maintainers:
+  - Gabriel Fernandez <gabriel.fernandez@st.com>
+
+description: |
+  The RCC IP is both a reset and a clock controller.
+  RCC makes also power management (resume/supend and wakeup interrupt).
+  Please also refer to reset.txt for common reset controller binding usage.
+
+  This binding uses common clock bindings
+  Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+  Specifying clocks
+  =================
+
+  All available clocks are defined as preprocessor macros in
+  dt-bindings/clock/stm32mp1-clks.h header and can be used in device
+  tree sources.
+
+  Specifying softreset control of devices
+  =======================================
+
+  Device nodes should specify the reset channel required in their "resets"
+  property, containing a phandle to the reset device node and an index specifying
+  which channel to use.
+  The index is the bit number within the RCC registers bank, starting from RCC
+  base address.
+  It is calculated as: index = register_offset / 4 * 32 + bit_offset.
+  Where bit_offset is the bit offset within the register.
+
+  For example on STM32MP1, for LTDC reset:
+     ltdc = APB4_RSTSETR_offset / 4 * 32 + LTDC_bit_offset
+          = 0x180 / 4 * 32 + 0 = 3072
+
+  The list of valid indices for STM32MP1 is available in:
+  include/dt-bindings/reset-controller/stm32mp1-resets.h
+
+  This file implements defines like:
+  #define LTDC_R	3072
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  compatible:
+    items:
+      - const: st,stm32mp1-rcc
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - "#clock-cells"
+  - "#reset-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rcc: rcc@50000000 {
+        compatible = "st,stm32mp1-rcc", "syscon";
+        reg = <0x50000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
