Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D210CC0A
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2019 16:47:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98054C36B0B;
	Thu, 28 Nov 2019 15:47:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0E7FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Nov 2019 15:47:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASFgPVo023621; Thu, 28 Nov 2019 16:47:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rUcrmp6FDis0MYM6sfyej2AR9/hatx5q+JoT9j7Vktc=;
 b=QgnRDT9ig/K54IfKnmwnt2JtFyprAUi04+kHWxFzQgcYH/QuQkzGhzskgFXZd9XgArH+
 UBtCPA2Y/6gadfBYviu05CWYYtwTy3lVmB/RI5CYW1uHdPnAThIkD/pNYsyVH/Mlyg7i
 5I3fqSn+wL3QyxjLYI20t5wjBxw4Bk3f2v2w5fUJlOH4ge/Ot27pTadhSLehGzZwsyxX
 3wjVqFe1nBQYQrLFWAn+A9yeXjXvz8R6gtC1ZYe/itZ9KneD4I2G+3+SoMFqMq1blm2k
 tqLp9L5fIkP7JZXInWUWIyUSpNlaC1Ppsl/v2/vE/nSUBKWti9Fj1rd4N7+iwC7TvpsS lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxktpp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 16:47:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5DDE10002A;
 Thu, 28 Nov 2019 16:46:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFB482BF9AD;
 Thu, 28 Nov 2019 16:46:59 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Nov 2019 16:46:58
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
Date: Thu, 28 Nov 2019 16:46:03 +0100
Message-ID: <20191128154603.6911-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_04:2019-11-28,2019-11-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: stm32: convert mlahb to
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
Notice that this patch requests an update of the simple-bus schema to add
the support of the "dma-ranges" property.
A Pull request has been sent in parallel to the dt-schema github repo:
https://github.com/devicetree-org/dt-schema/pull/30

To remind the topic around the use of "dma-ranges" please
refer to following discussion: https://lkml.org/lkml/2019/4/3/1261
---
 .../devicetree/bindings/arm/stm32/mlahb.txt   | 37 ----------
 .../bindings/arm/stm32/st,mlahb.yaml          | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 37 deletions(-)
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
index 000000000000..8ad3f7c7f9ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
@@ -0,0 +1,69 @@
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
