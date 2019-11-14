Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A616FCAE8
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 17:41:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC884C36B0B;
	Thu, 14 Nov 2019 16:41:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 421FBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 16:41:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAEGRfQv012514; Thu, 14 Nov 2019 17:41:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=/A39Sh+nCYrrupVXGJZyMVV+LPFXNnjXh6rGGijztCw=;
 b=hkI/WIpfS0WslxmzwqRUtIm1FWpoHNI4/2n2xp4znd9LQEhp6zclQ+xFbyxfWh/OO4nV
 RnlzowKJ9Wceeg9AMUqe+SOT4gspwnnBvEtWi81iGA1KZf94ruwh2UIx6dZCAil/fhID
 HqpyUfrj7hwYgNtoCSkdzmL7cFm8MO+4CGgKdVoqQ5E8NnWGLvrZUfaCCa7LjlCG5Jm8
 028QQ14O2h0/yh+FbRvkF7dzzJx+EKQven4tgjrPGaoMoYu12duS8ZpPCXWwV5m+Basj
 lt6fAssTIhcizj6jzW2HsWEhRGkW/wqEvLPYAhs4kLd+t01tK9xnfFY3HeGnJhyHFxJ2 tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psbf99g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 17:41:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6DA3100038;
 Thu, 14 Nov 2019 17:41:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D0DE2C2DB5;
 Thu, 14 Nov 2019 17:41:05 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 Nov 2019 17:41:05
 +0100
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>
Date: Thu, 14 Nov 2019 17:41:04 +0100
Message-ID: <20191114164104.22782-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_05:2019-11-14,2019-11-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: interrupt-controller: Convert
	stm32-exti to json-schema
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

Convert the STM32 external interrupt controller (EXTI) binding to DT
schema format using json-schema.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
---

Hi Rob,

I planned to use "additionalProperties: false" for this schema but as I add a
property under condition, I got an error (property added under contion seems
to be detected as an "additional" property and then error is raised).

Is there a way to fix that ?

regards
Alex

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
deleted file mode 100644
index cd01b2292ec6..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-STM32 External Interrupt Controller
-
-Required properties:
-
-- compatible: Should be:
-    "st,stm32-exti"
-    "st,stm32h7-exti"
-    "st,stm32mp1-exti"
-- reg: Specifies base physical address and size of the registers
-- interrupt-controller: Indentifies the node as an interrupt controller
-- #interrupt-cells: Specifies the number of cells to encode an interrupt
-  specifier, shall be 2
-- interrupts: interrupts references to primary interrupt controller
-  (only needed for exti controller with multiple exti under
-  same parent interrupt: st,stm32-exti and st,stm32h7-exti)
-
-Optional properties:
-
-- hwlocks: reference to a phandle of a hardware spinlock provider node.
-
-Example:
-
-exti: interrupt-controller@40013c00 {
-	compatible = "st,stm32-exti";
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	reg = <0x40013C00 0x400>;
-	interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
new file mode 100644
index 000000000000..39be37e1e532
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/st,stm32-exti.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 External Interrupt Controller Device Tree Bindings
+
+maintainers:
+  - Alexandre Torgue <alexandre.torgue@st.com>
+  - Ludovic Barre <ludovic.barre@st.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - st,stm32-exti
+          - st,stm32h7-exti
+      - items:
+        - enum:
+          - st,stm32mp1-exti
+        - const: syscon
+
+  "#interrupt-cells":
+    const: 2
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  hwlocks:
+    maxItems: 1
+    description:
+      Reference to a phandle of a hardware spinlock provider node.
+
+required:
+  - "#interrupt-cells"
+  - compatible
+  - reg
+  - interrupt-controller
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32-exti
+              - st,stm32h7-exti
+    then:
+      properties:
+        interrupts:
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32-array
+          description:
+            Interrupts references to primary interrupt controller
+      required:
+        - interrupts
+
+examples:
+  - |
+    //Example 1
+    exti1: interrupt-controller@5000d000 {
+        compatible = "st,stm32mp1-exti", "syscon";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        reg = <0x5000d000 0x400>;
+    };
+
+    //Example 2
+    exti2: interrupt-controller@40013c00 {
+        compatible = "st,stm32-exti";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        reg = <0x40013C00 0x400>;
+        interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
+    };
+
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
