Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DED1052A1
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 14:06:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E611C36B0B;
	Thu, 21 Nov 2019 13:06:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52D41C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 13:06:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALD2sic023372; Thu, 21 Nov 2019 14:06:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CZLchOtGzzjkcSU/Amhs8d3lsV5kVJY44jLWirDhTC0=;
 b=f81Mnilf5iGhL2LVdhHNWiAXVKxuTj+fahFGZ0UGGF98dtC6xBdnPZ5VHJbLDz3yn+cy
 RHyJ5BxJDsIBVzaIDnidRfHI4HBF4O9MKtavjH5uZeR/00DETFhqL5hnFdiKH77Z8DAq
 Kl3O/VN9wZ9dZuIplkr47jsngG7jqv1/m+pquWGXP8KZ2TvTU7cskgJFLQZwx4Pr4QIq
 zovQii3tRWUBj1lH/drLHLk1HsKaQLIrnJCnBNoNS1oL3FqD77F0w272F8R6K4YqtLPv
 876iSdjvLmYqMI/bfUWaFrZfh0kIXXk/pYSD7eRILyKuLF7n4/NT1hbfb8ujne9feRT4 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9uskdhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 14:06:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48B83100039;
 Thu, 21 Nov 2019 14:06:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E59C2BEC5B;
 Thu, 21 Nov 2019 14:06:17 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 21 Nov 2019 14:06:16
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <alexandre.torgue@st.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 21 Nov 2019 14:06:15 +0100
Message-ID: <20191121130615.13007-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_02:2019-11-21,2019-11-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: mtd: Convert stm32 fmc2-nand
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

Convert the STM32 fmc2-nand binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
CC: Christophe Kerello <christophe.kerello@st.com>
---
 .../bindings/mtd/st,stm32-fmc2-nand.yaml           | 98 ++++++++++++++++++++++
 .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 --------------
 2 files changed, 98 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
new file mode 100644
index 000000000000..b059267f6d20
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/st,stm32-fmc2-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
+
+maintainers:
+  - Christophe Kerello <christophe.kerello@st.com>
+
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+properties:
+  compatible:
+    const: st,stm32mp15-fmc2
+
+  reg:
+    items:
+      - description: Registers
+      - description: Chip select 0 data
+      - description: Chip select 0 command
+      - description: Chip select 0 address space
+      - description: Chip select 1 data
+      - description: Chip select 1 command
+      - description: Chip select 1 address space
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: tx DMA channel
+      - description: rx DMA channel
+      - description: ecc DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: ecc
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    properties:
+      nand-ecc-step-size:
+        const: 512
+
+      nand-ecc-strength:
+        enum: [1, 4 ,8 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    nand-controller@58002000 {
+      compatible = "st,stm32mp15-fmc2";
+      reg = <0x58002000 0x1000>,
+            <0x80000000 0x1000>,
+            <0x88010000 0x1000>,
+            <0x88020000 0x1000>,
+            <0x81000000 0x1000>,
+            <0x89010000 0x1000>,
+            <0x89020000 0x1000>;
+            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
+                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
+                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
+            dma-names = "tx", "rx", "ecc";
+            clocks = <&rcc FMC_K>;
+            resets = <&rcc FMC_R>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-on-flash-bbt;
+        #address-cells = <1>;
+        #size-cells = <1>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
deleted file mode 100644
index e55895e8dae4..000000000000
--- a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-STMicroelectronics Flexible Memory Controller 2 (FMC2)
-NAND Interface
-
-Required properties:
-- compatible: Should be one of:
-              * st,stm32mp15-fmc2
-- reg: NAND flash controller memory areas.
-       First region contains the register location.
-       Regions 2 to 4 respectively contain the data, command,
-       and address space for CS0.
-       Regions 5 to 7 contain the same areas for CS1.
-- interrupts: The interrupt number
-- pinctrl-0: Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
-- clocks: The clock needed by the NAND flash controller
-
-Optional properties:
-- resets: Reference to a reset controller asserting the FMC controller
-- dmas: DMA specifiers (see: dma/stm32-mdma.txt)
-- dma-names: Must be "tx", "rx" and "ecc"
-
-* NAND device bindings:
-
-Required properties:
-- reg: describes the CS lines assigned to the NAND device.
-
-Optional properties:
-- nand-on-flash-bbt: see nand-controller.yaml
-- nand-ecc-strength: see nand-controller.yaml
-- nand-ecc-step-size: see nand-controller.yaml
-
-The following ECC strength and step size are currently supported:
- - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Hamming)
- - nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
- - nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8) (default)
-
-Example:
-
-	fmc: nand-controller@58002000 {
-		compatible = "st,stm32mp15-fmc2";
-		reg = <0x58002000 0x1000>,
-		      <0x80000000 0x1000>,
-		      <0x88010000 0x1000>,
-		      <0x88020000 0x1000>,
-		      <0x81000000 0x1000>,
-		      <0x89010000 0x1000>,
-		      <0x89020000 0x1000>;
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&rcc FMC_K>;
-		resets = <&rcc FMC_R>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&fmc_pins_a>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		nand@0 {
-			reg = <0>;
-			nand-on-flash-bbt;
-			#address-cells = <1>;
-			#size-cells = <1>;
-		};
-	};
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
