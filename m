Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16588FDB43
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 11:24:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB49FC36B0B;
	Fri, 15 Nov 2019 10:24:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D2DAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 10:24:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFAMjp8021368; Fri, 15 Nov 2019 11:24:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=G7/vNr2mUj/ypwdiuuuBONQIOgMUSkIYzFbYwlty4cU=;
 b=GKqHP3GVDgRYkuv35dVhv4BNGRDvGWOmYbXWI2H3I323pftfCkIoJVDlZiEvbJlI4ReG
 C1q4xiLL6PgT/CA4ZjB193k2Qi8q6DyGw1taDBjMf+1QY80dtKUl8LeT+6gS/f2yo2at
 Od2cZ2fk+VHrjIHpkCgtHeoQM2gGRJp3SqEPfmrCq6HDKftO6AXzCuapbU/wlZjRYkp7
 IfozdDyaXaGpSKoStDjuAja5CwCeHpkhugQZRxQWHRvbIKOdUHNZSq7jrZ1+voChFejF
 a5g0ZcI7ST5eLcn+E7AlGpiksNjhMHzhY3DvVL6U5ZcM3yXW6w8SKBqA4TinqABaTS1g qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psfkjbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 11:24:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7829A10002A;
 Fri, 15 Nov 2019 11:24:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FF582B2558;
 Fri, 15 Nov 2019 11:24:29 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 15 Nov 2019 11:24:28
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>, <lionel.debieve@st.com>
Date: Fri, 15 Nov 2019 11:24:27 +0100
Message-ID: <20191115102427.31224-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_02:2019-11-15,2019-11-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: crypto: Convert stm32 HASH
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

Convert the STM32 HASH binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
version 2:
- add type ref, min, max and default values for dma-maxburst property

 .../devicetree/bindings/crypto/st,stm32-hash.txt   | 30 ----------
 .../devicetree/bindings/crypto/st,stm32-hash.yaml  | 69 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-hash.txt
 create mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.txt b/Documentation/devicetree/bindings/crypto/st,stm32-hash.txt
deleted file mode 100644
index 04fc246f02f7..000000000000
--- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* STMicroelectronics STM32 HASH
-
-Required properties:
-- compatible: Should contain entries for this and backward compatible
-  HASH versions:
-  - "st,stm32f456-hash" for stm32 F456.
-  - "st,stm32f756-hash" for stm32 F756.
-- reg: The address and length of the peripheral registers space
-- interrupts: the interrupt specifier for the HASH
-- clocks: The input clock of the HASH instance
-
-Optional properties:
-- resets: The input reset of the HASH instance
-- dmas: DMA specifiers for the HASH. See the DMA client binding,
-	 Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: DMA request name. Should be "in" if a dma is present.
-- dma-maxburst: Set number of maximum dma burst supported
-
-Example:
-
-hash1: hash@50060400 {
-	compatible = "st,stm32f756-hash";
-	reg = <0x50060400 0x400>;
-	interrupts = <80>;
-	clocks = <&rcc 0 STM32F7_AHB2_CLOCK(HASH)>;
-	resets = <&rcc STM32F7_AHB2_RESET(HASH)>;
-	dmas = <&dma2 7 2 0x400 0x0>;
-	dma-names = "in";
-	dma-maxburst = <0>;
-};
diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
new file mode 100644
index 000000000000..57ae1c0b6d18
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/st,stm32-hash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 HASH bindings
+
+maintainers:
+  - Lionel Debieve <lionel.debieve@st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32f456-hash
+      - st,stm32f756-hash
+
+  reg:
+    maxItems: 1
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
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: in
+
+  dma-maxburst:
+    description: Set number of maximum dma burst supported
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+      - maximum: 2
+      - default: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    hash@54002000 {
+      compatible = "st,stm32f756-hash";
+      reg = <0x54002000 0x400>;
+      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&rcc HASH1>;
+      resets = <&rcc HASH1_R>;
+      dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0>;
+      dma-names = "in";
+      dma-maxburst = <2>;
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
