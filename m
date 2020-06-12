Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D81F7AB2
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2020 17:23:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D33DC36B24;
	Fri, 12 Jun 2020 15:23:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85D8DC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 15:23:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05CFNR3S018151; Fri, 12 Jun 2020 17:23:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=aotqVRLL0Rv78d4dsdQZWxOc139fY0Xhw2sAed8qeIA=;
 b=fEgX2kv5x7WTL9UfUpzuiap63u1jEKWgU6rK2x3nokwbFjPt9Kl/gXKGYa142iztEYJ8
 5aigDFZV9McRu3HlTYb23IAO2lEdZdCPqkLM9fUDVScSc7BpDjgIuYXhEtRxG9iBGGkm
 RbbW2oJx7vTgQTOTMrRv9mlI7v9T6ZkaTW9ve0WTFb48FPHyWaBEjB+3ctYNH1gRHBso
 sU9lkqEAQosI10Hn15USqlnTsblgAEus9fssmjVVXjyjQhdHBVHFDvbvbohUhSmMoOwL
 o1giU9uWfU0y4XOoSupKm0y1Xqj5ueDRLuBAF7iJMjfdnn2Z152/yMt5Gz2AOXHpNnpr rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g21ggmvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 17:23:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BE9D10002A;
 Fri, 12 Jun 2020 17:23:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10C9F2B9918;
 Fri, 12 Jun 2020 17:23:28 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 12 Jun 2020 17:23:27 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <arnd@linaro.org>,
 <alexandre.torgue@st.com>
Date: Fri, 12 Jun 2020 17:22:38 +0200
Message-ID: <1591975362-22009-3-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_11:2020-06-12,
 2020-06-12 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 2/6] dt-bindings: mtd: update STM32 FMC2
	NAND controller documentation
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

These bindings can be used on SOCs where the FMC2 NAND controller is
in standalone. In case that the FMC2 embeds 2 controllers (an external
bus controller and a raw NAND controller), the register base address,
the clock and the reset will be defined in the parent node.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
Changes in v4:
 - add new NFC compatible string to handle reg number of entries.

 .../bindings/mtd/st,stm32-fmc2-nand.yaml           | 83 +++++++++++++++-------
 1 file changed, 57 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index b059267..6ae7de1 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -9,32 +9,19 @@ title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
 maintainers:
   - Christophe Kerello <christophe.kerello@st.com>
 
-allOf:
-  - $ref: "nand-controller.yaml#"
-
 properties:
   compatible:
-    const: st,stm32mp15-fmc2
+    enum:
+      - st,stm32mp15-fmc2
+      - st,stm32mp1-fmc2-nfc
 
   reg:
-    items:
-      - description: Registers
-      - description: Chip select 0 data
-      - description: Chip select 0 command
-      - description: Chip select 0 address space
-      - description: Chip select 1 data
-      - description: Chip select 1 command
-      - description: Chip select 1 address space
+    minItems: 6
+    maxItems: 7
 
   interrupts:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
-
-  resets:
-    maxItems: 1
-
   dmas:
     items:
       - description: tx DMA channel
@@ -57,11 +44,55 @@ patternProperties:
       nand-ecc-strength:
         enum: [1, 4 ,8 ]
 
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp15-fmc2
+    then:
+      properties:
+        reg:
+          items:
+            - description: Registers
+            - description: Chip select 0 data
+            - description: Chip select 0 command
+            - description: Chip select 0 address space
+            - description: Chip select 1 data
+            - description: Chip select 1 command
+            - description: Chip select 1 address space
+
+        clocks:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+      required:
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp1-fmc2-nfc
+    then:
+      properties:
+        reg:
+          items:
+            - description: Chip select 0 data
+            - description: Chip select 0 command
+            - description: Chip select 0 address space
+            - description: Chip select 1 data
+            - description: Chip select 1 command
+            - description: Chip select 1 address space
+
 required:
   - compatible
   - reg
   - interrupts
-  - clocks
 
 examples:
   - |
@@ -77,13 +108,13 @@ examples:
             <0x81000000 0x1000>,
             <0x89010000 0x1000>,
             <0x89020000 0x1000>;
-            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
-                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
-                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
-            dma-names = "tx", "rx", "ecc";
-            clocks = <&rcc FMC_K>;
-            resets = <&rcc FMC_R>;
+      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+      dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
+             <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
+             <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
+      dma-names = "tx", "rx", "ecc";
+      clocks = <&rcc FMC_K>;
+      resets = <&rcc FMC_R>;
       #address-cells = <1>;
       #size-cells = <0>;
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
