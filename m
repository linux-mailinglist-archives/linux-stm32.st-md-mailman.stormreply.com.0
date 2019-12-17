Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C6D122699
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 09:24:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFDF4C36B0B;
	Tue, 17 Dec 2019 08:24:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64714C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 08:24:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH8O37e026676; Tue, 17 Dec 2019 09:24:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=u4ZnCG3JwwEgOMIhN/AX7q3BNavU/cal6soqQfW8/vk=;
 b=poEflfU7WipianGUh4qcW0Ougu12H/fKNIAbdgx6mzbidUxEywqXwbXGJH1x2f9Js2Eu
 aS3mr7YNZhjqRaYKcWz3zByLF5ZW9T5n5WfwF05rMM00tn76jJSYgNc94YDIBJI9PpfM
 qspKnXNy+mTn0cFlkrHOiCAt4HyOncaz65lNRDDplnjWn1gt0phUJxfB7WvOY47QcFOn
 xhfdPX9LMbghIuloAbAPvqjgzfq4rx46yZWhfOLxsoX+wCa7vk330OoJy7866+QfrIsT
 5BaCvq+DxNxyX1q/nF6fTq51+W2sUwiWVNENg31KC41AJY9dYeXiVvocmUpnvYvbptC4 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvp36wpx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 09:24:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79431100034;
 Tue, 17 Dec 2019 09:24:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B57322085F;
 Tue, 17 Dec 2019 09:24:32 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec 2019 09:24:31
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
Date: Tue, 17 Dec 2019 09:24:15 +0100
Message-ID: <20191217082415.14844-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: stm32: convert mlahb to
	json-schema
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

Convert the ML-AHB bus bindings to DT schema format using json-schema

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
V2: Add "ranges" property as mandatory
---
 .../devicetree/bindings/arm/stm32/mlahb.txt   | 37 ----------
 .../bindings/arm/stm32/st,mlahb.yaml          | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml

diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
deleted file mode 100644
index 25307aa1eb9b..000000000000
--- a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-ML-AHB interconnect bindings
-
-These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
-a Cortex-M subsystem with dedicated memories.
-The MCU SRAM and RETRAM memory parts can be accessed through different addresses
-(see "RAM aliases" in [1]) using different buses (see [2]) : balancing the
-Cortex-M firmware accesses among those ports allows to tune the system
-performance.
-
-[1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
-[2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
-
-Required properties:
-- compatible: should be "simple-bus"
-- dma-ranges: describes memory addresses translation between the local CPU and
-	   the remote Cortex-M processor. Each memory region, is declared with
-	   3 parameters:
-		 - param 1: device base address (Cortex-M processor address)
-		 - param 2: physical base address (local CPU address)
-		 - param 3: size of the memory region.
-
-The Cortex-M remote processor accessed via the mlahb interconnect is described
-by a child node.
-
-Example:
-mlahb {
-	compatible = "simple-bus";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	dma-ranges = <0x00000000 0x38000000 0x10000>,
-		     <0x10000000 0x10000000 0x60000>,
-		     <0x30000000 0x30000000 0x60000>;
-
-	m4_rproc: m4@10000000 {
-		...
-	};
-};
diff --git a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
new file mode 100644
index 000000000000..68917bb7c7e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: STMicroelectronics STM32 ML-AHB interconnect bindings
+
+maintainers:
+  - Fabien Dessenne <fabien.dessenne@st.com>
+  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
+
+description: |
+  These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
+  a Cortex-M subsystem with dedicated memories. The MCU SRAM and RETRAM memory
+  parts can be accessed through different addresses (see "RAM aliases" in [1])
+  using different buses (see [2]): balancing the Cortex-M firmware accesses
+  among those ports allows to tune the system performance.
+  [1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
+  [2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
+
+allOf:
+ - $ref: /schemas/simple-bus.yaml#
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - st,mlahb
+
+  dma-ranges:
+    description: |
+      Describe memory addresses translation between the local CPU and the
+      remote Cortex-M processor. Each memory region, is declared with
+      3 parameters:
+      - param 1: device base address (Cortex-M processor address)
+      - param 2: physical base address (local CPU address)
+      - param 3: size of the memory region.
+    maxItems: 3
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - dma-ranges
+
+examples:
+  - |
+    mlahb: ahb {
+      compatible = "st,mlahb", "simple-bus";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      reg = <0x10000000 0x40000>;
+      ranges;
+      dma-ranges = <0x00000000 0x38000000 0x10000>,
+                   <0x10000000 0x10000000 0x60000>,
+                   <0x30000000 0x30000000 0x60000>;
+
+      m4_rproc: m4@10000000 {
+       reg = <0x10000000 0x40000>;
+      };
+    };
+
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
