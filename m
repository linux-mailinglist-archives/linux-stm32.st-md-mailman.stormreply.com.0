Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E01C5E7E
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 19:14:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5125C36B09;
	Tue,  5 May 2020 17:14:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EDBCC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 17:14:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045GvH2b002729; Tue, 5 May 2020 19:14:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RqpLBqb+fp7RVc37uIEnow0hRBgx8dutl+HOKhcBEc4=;
 b=p3MJebFjLz85dtqNWgTmOKaV42Ji/DTaGCherj6BKbome6Z8Cq8ZS0UL0tnmon6PoRsA
 4gfX6oSmdqSIkhD0/1ZmnLGkn/18AjPJV6AOm+4uzZj146nA6tI8sTlzZGwUIpaN1Ax4
 jvqal9X57f3cwpyaG1DArFt5dPexsgqyldBW7yovs0+T1YOyYHIyTZCgjSLt0LgyueCG
 lyrl3CNEsyThG+aRk/SO/Wa2sDFyF8vesD804TzBJam2YhxLeGcADtVUa0hH5aFQYhP0
 4QwWQJX/1955sA0ryKBrLw9ZrMP/ZgBmq2/BxAxC9rSpkds2KBOt8CmpK3rHjeehxOCi 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rx08hrc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 19:14:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3603810002A;
 Tue,  5 May 2020 19:14:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24F2B2B5A7A;
 Tue,  5 May 2020 19:14:04 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 5 May 2020 19:14:02 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <gregkh@linuxfoundation.org>, <boris.brezillon@collabora.com>
Date: Tue, 5 May 2020 19:11:05 +0200
Message-ID: <1588698668-25288-8-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588698668-25288-1-git-send-email-christophe.kerello@st.com>
References: <1588698668-25288-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_09:2020-05-04,
 2020-05-05 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 07/10] dt-bindings: memory-controller: add
	STM32 FMC2 EBI controller documentation
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

This patch adds the documentation of the device tree bindings for the STM32
FMC2 EBI controller.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
Changes in v3:
 - pattern name has been modified
 - vendor properties have been modified
   - s/_/-/
   - add unit suffix (-ns) on timing properties

 .../memory-controllers/st,stm32-fmc2-ebi.yaml      | 261 +++++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
new file mode 100644
index 0000000..3ec57d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -0,0 +1,261 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/st,stm32-fmc2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
+
+description: |
+  The FMC2 functional block makes the interface with: synchronous and
+  asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
+  peripherals) and NAND flash memories.
+  Its main purposes are:
+    - to translate AXI transactions into the appropriate external device
+      protocol
+    - to meet the access time requirements of the external devices
+  All external devices share the addresses, data and control signals with the
+  controller. Each external device is accessed by means of a unique Chip
+  Select. The FMC2 performs only one access at a time to an external device.
+
+maintainers:
+  - Christophe Kerello <christophe.kerello@st.com>
+
+properties:
+  compatible:
+    const: st,stm32mp1-fmc2-ebi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    description: |
+      Reflects the memory layout with four integer values per bank. Format:
+      <bank-number> 0 <address of the bank> <size>
+
+patternProperties:
+  "^.*@[0-4],[a-f0-9]+$":
+    type: object
+
+    properties:
+      reg:
+        description: Bank number, base address and size of the device.
+
+      st,fmc2-ebi-cs-transaction-type:
+        description: |
+                     Select one of the transactions type supported
+                       0: Asynchronous mode 1 SRAM/FRAM.
+                       1: Asynchronous mode 1 PSRAM.
+                       2: Asynchronous mode A SRAM/FRAM.
+                       3: Asynchronous mode A PSRAM.
+                       4: Asynchronous mode 2 NOR.
+                       5: Asynchronous mode B NOR.
+                       6: Asynchronous mode C NOR.
+                       7: Asynchronous mode D NOR.
+                       8: Synchronous read synchronous write PSRAM.
+                       9: Synchronous read asynchronous write PSRAM.
+                       10: Synchronous read synchronous write NOR.
+                       11: Synchronous read asynchronous write NOR.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 11
+
+      st,fmc2-ebi-cs-cclk-enable:
+        description: Continuous clock enable (first bank must be configured
+                     in synchronous mode). The FMC_CLK is generated continuously
+                     during asynchronous and synchronous access. By default, the
+                     FMC_CLK is only generated during synchronous access.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,fmc2-ebi-cs-mux-enable:
+        description: Address/Data multiplexed on databus (valid only with
+                     NOR and PSRAM transactions type). By default, Address/Data
+                     are not multiplexed.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,fmc2-ebi-cs-buswidth:
+        description: Data bus width
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 8, 16 ]
+        default: 16
+
+      st,fmc2-ebi-cs-waitpol-high:
+        description: Wait signal polarity (NWAIT signal active high).
+                     By default, NWAIT is active low.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,fmc2-ebi-cs-waitcfg-enable:
+        description: The NWAIT signal indicates wheither the data from the
+                     device are valid or if a wait state must be inserted when
+                     accessing the device in synchronous mode. By default, the
+                     NWAIT signal is active one data cycle before wait state.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,fmc2-ebi-cs-wait-enable:
+        description: The NWAIT signal is enabled (its level is taken into
+                     account after the programmed latency period to insert wait
+                     states if asserted). By default, the NWAIT signal is
+                     disabled.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,fmc2-ebi-cs-asyncwait-enable:
+        description: The NWAIT signal is taken into account during asynchronous
+                     transactions. By default, the NWAIT signal is not taken
+                     into account during asynchronous transactions.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,fmc2-ebi-cs-cpsize:
+        description: CRAM page size. The controller splits the burst access
+                     when the memory page is reached. By default, no burst
+                     split when crossing page boundary.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 128, 256, 512, 1024 ]
+        default: 0
+
+      st,fmc2-ebi-cs-byte-lane-setup-ns:
+        description: This property configures the byte lane setup timing
+                     defined in nanoseconds from NBLx low to Chip Select NEx
+                     low.
+
+      st,fmc2-ebi-cs-address-setup-ns:
+        description: This property defines the duration of the address setup
+                     phase in nanoseconds used for asynchronous read/write
+                     transactions.
+
+      st,fmc2-ebi-cs-address-hold-ns:
+        description: This property defines the duration of the address hold
+                     phase in nanoseconds used for asynchronous multiplexed
+                     read/write transactions.
+
+      st,fmc2-ebi-cs-data-setup-ns:
+        description: This property defines the duration of the data setup phase
+                     in nanoseconds used for asynchronous read/write
+                     transactions.
+
+      st,fmc2-ebi-cs-bus-turnaround-ns:
+        description: This property defines the delay in nanoseconds between the
+                     end of current read/write transaction and the next
+                     transaction.
+
+      st,fmc2-ebi-cs-data-hold-ns:
+        description: This property defines the duration of the data hold phase
+                     in nanoseconds used for asynchronous read/write
+                     transactions.
+
+      st,fmc2-ebi-cs-clk-period-ns:
+        description: This property defines the FMC_CLK output signal period in
+                     nanoseconds.
+
+      st,fmc2-ebi-cs-data-latency-ns:
+        description: This property defines the data latency before reading or
+                     writing the first data in nanoseconds.
+
+      st,fmc2_ebi-cs-write-address-setup-ns:
+        description: This property defines the duration of the address setup
+                     phase in nanoseconds used for asynchronous write
+                     transactions.
+
+      st,fmc2-ebi-cs-write-address-hold-ns:
+        description: This property defines the duration of the address hold
+                     phase in nanoseconds used for asynchronous multiplexed
+                     write transactions.
+
+      st,fmc2-ebi-cs-write-data-setup-ns:
+        description: This property defines the duration of the data setup
+                     phase in nanoseconds used for asynchronous write
+                     transactions.
+
+      st,fmc2-ebi-cs-write-bus-turnaround-ns:
+        description: This property defines the delay between the end of current
+                     write transaction and the next transaction in nanoseconds.
+
+      st,fmc2-ebi-cs-write-data-hold-ns:
+        description: This property defines the duration of the data hold phase
+                     in nanoseconds used for asynchronous write transactions.
+
+      st,fmc2-ebi-cs-max-low-pulse-ns:
+        description: This property defines the maximum chip select low pulse
+                     duration in nanoseconds for synchronous transactions. When
+                     this timing reaches 0, the controller splits the current
+                     access, toggles NE to allow device refresh and restarts a
+                     new access.
+
+    required:
+      - reg
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - clocks
+  - ranges
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    memory-controller@58002000 {
+      #address-cells = <2>;
+      #size-cells = <1>;
+      compatible = "st,stm32mp1-fmc2-ebi";
+      reg = <0x58002000 0x1000>;
+      clocks = <&rcc FMC_K>;
+      resets = <&rcc FMC_R>;
+
+      ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
+               <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
+               <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
+               <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
+               <4 0 0x80000000 0x10000000>; /* NAND */
+
+      psram@0,0 {
+        compatible = "mtd-ram";
+        reg = <0 0x00000000 0x100000>;
+        bank-width = <2>;
+
+        st,fmc2-ebi-cs-transaction-type = <1>;
+        st,fmc2-ebi-cs-address-setup-ns = <60>;
+        st,fmc2-ebi-cs-data-setup-ns = <30>;
+        st,fmc2-ebi-cs-bus-turnaround-ns = <5>;
+      };
+
+      nand-controller@4,0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "st,stm32mp15-fmc2";
+        reg = <4 0x00000000 0x1000>,
+              <4 0x08010000 0x1000>,
+              <4 0x08020000 0x1000>,
+              <4 0x01000000 0x1000>,
+              <4 0x09010000 0x1000>,
+              <4 0x09020000 0x1000>;
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
+               <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
+               <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
+        dma-names = "tx", "rx", "ecc";
+
+        nand@0 {
+          reg = <0>;
+          nand-on-flash-bbt;
+          #address-cells = <1>;
+          #size-cells = <1>;
+        };
+      };
+    };
+
+...
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
