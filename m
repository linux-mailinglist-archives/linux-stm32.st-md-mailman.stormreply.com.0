Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD10E104470
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 20:45:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67EBDC36B0B;
	Wed, 20 Nov 2019 19:45:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA083C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 19:45:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKJh0ha016754; Wed, 20 Nov 2019 20:44:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=o+X8AS60Eijt7vdoaqRux4/FQnWUKnnAr6CTV+AlGXM=;
 b=X8k7SKgaUjmjxDgXAXQdxnmhpNMsaptUcPY7z1F3uJXc/0NuOMiuz0Cv6hyVhWeaLFFg
 vtTGtUo8g/PMQnWFX+qmqoDmqrmqo7NkcOKiGxWxejqdOIegNYdGI7t6R2tR0ZHeUQXe
 49TnW9w6lDujkIAgLIlEUu9KpM0Ww8gL5LugaZ8faDWv62/K2CoJSSnBQEfmbrKWWhVO
 9ILx6W7KzVtj2TiWF+anxVimp5nDmZKwD1xXawdN5V6ZcXG8F39GSZv9+g2zHv8zdU0E
 +o4dbF4qiweG9vYlJJgHcxw3HXeJ+x539KRTXOGxvFHDtwEEPHx7UD5XzQhCpqisIs1e uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usfca3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 20:44:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88E39100034;
 Wed, 20 Nov 2019 20:44:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CD952C6151;
 Wed, 20 Nov 2019 20:44:46 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 20 Nov 2019 20:44:45
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <alexandre.torgue@st.com>
Date: Wed, 20 Nov 2019 20:44:44 +0100
Message-ID: <20191120194444.10540-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_06:2019-11-20,2019-11-20 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: spi: Convert stm32 QSPI
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

Convert the STM32 QSPI binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in version 2:
- fix subject
- remove useless minItems and maxItems
 .../devicetree/bindings/spi/spi-stm32-qspi.txt     | 47 ------------
 .../devicetree/bindings/spi/st,stm32-qspi.yaml     | 83 ++++++++++++++++++++++
 2 files changed, 83 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-stm32-qspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/spi-stm32-qspi.txt b/Documentation/devicetree/bindings/spi/spi-stm32-qspi.txt
deleted file mode 100644
index bfc038b9478d..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-stm32-qspi.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* STMicroelectronics Quad Serial Peripheral Interface(QSPI)
-
-Required properties:
-- compatible: should be "st,stm32f469-qspi"
-- reg: the first contains the register location and length.
-       the second contains the memory mapping address and length
-- reg-names: should contain the reg names "qspi" "qspi_mm"
-- interrupts: should contain the interrupt for the device
-- clocks: the phandle of the clock needed by the QSPI controller
-- A pinctrl must be defined to set pins in mode of operation for QSPI transfer
-
-Optional properties:
-- resets: must contain the phandle to the reset controller.
-
-A spi flash (NOR/NAND) must be a child of spi node and could have some
-properties. Also see jedec,spi-nor.txt.
-
-Required properties:
-- reg: chip-Select number (QSPI controller may connect 2 flashes)
-- spi-max-frequency: max frequency of spi bus
-
-Optional properties:
-- spi-rx-bus-width: see ./spi-bus.txt for the description
-- dmas: DMA specifiers for tx and rx dma. See the DMA client binding,
-Documentation/devicetree/bindings/dma/dma.txt.
-- dma-names: DMA request names should include "tx" and "rx" if present.
-
-Example:
-
-qspi: spi@a0001000 {
-	compatible = "st,stm32f469-qspi";
-	reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
-	reg-names = "qspi", "qspi_mm";
-	interrupts = <91>;
-	resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
-	clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_qspi0>;
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-rx-bus-width = <4>;
-		spi-max-frequency = <108000000>;
-		...
-	};
-};
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
new file mode 100644
index 000000000000..3665a5fe6b7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/st,stm32-qspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Quad Serial Peripheral Interface (QSPI) bindings
+
+maintainers:
+  - Christophe Kerello <christophe.kerello@st.com>
+  - Patrice Chotard <patrice.chotard@st.com>
+
+allOf:
+  - $ref: "spi-controller.yaml#"
+
+properties:
+  compatible:
+    const: st,stm32f469-qspi
+
+  reg:
+    items:
+      - description: registers
+      - description: memory mapping
+
+  reg-names:
+    items:
+     - const: qspi
+     - const: qspi_mm
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: tx DMA channel
+      - description: rx DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    spi@58003000 {
+      compatible = "st,stm32f469-qspi";
+      reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
+      reg-names = "qspi", "qspi_mm";
+      interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+      dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
+             <&mdma1 22 0x10 0x100008 0x0 0x0>;
+      dma-names = "tx", "rx";
+      clocks = <&rcc QSPI_K>;
+      resets = <&rcc QSPI_R>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      flash@0 {
+        compatible = "jedec,spi-nor";
+        reg = <0>;
+        spi-rx-bus-width = <4>;
+        spi-max-frequency = <108000000>;
+      };
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
