Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD09857934
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 10:49:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA087C71286;
	Fri, 16 Feb 2024 09:49:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84C1FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 09:49:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G4qHJU024968; Fri, 16 Feb 2024 10:49:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6oy4aiUMKITAZcOmFqBjM6ZnhYNqhJFyPyPaNACQD3I=; b=Rb
 ZppuBSKRCfE/AbEaqxNqIA71yVxaQPb2Z5/M+GS+P4mUIe+YW02k722ObMuEbe9T
 EKAdxPvUcNWa4tPtIBTF7CBh2yzARnlJgrDLsnjy58nbPJEfaqaUStz/Gxcph/oW
 SbcFLnG1bKeK/5lESmWN61uv1VPCAi5hAk8Oavo4xDdpll5hX3jxhLoXJyQewWMb
 RdBiP6f2X7UVqApIaYeP18BxT5e/zbFYdYZattcrl9a1ykHP/cZMl5hA1Y0+Y7kC
 168z3S1YxlIx7xPs7QeYXnfPcr1zT1GbDFIwFv9CwH+y7Jem0gytKix2lkHFkl+I
 yp0MrKV+veearNGx3GuA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wa126gy3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 10:49:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 89DB340048;
 Fri, 16 Feb 2024 10:49:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D0A8237D75;
 Fri, 16 Feb 2024 10:48:18 +0100 (CET)
Received: from localhost (10.201.20.114) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 16 Feb
 2024 10:48:17 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Fri, 16 Feb 2024 10:47:47 +0100
Message-ID: <20240216094758.916722-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216094758.916722-1-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_08,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/12] dt-bindings: interrupt-controller:
	stm32-exti: Add irq nexus child node
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

The mapping of EXTI interrupts to its parent interrupt controller
is both SoC and instance dependent.
The current implementation requires adding a new table to the
driver's code and a new compatible for each new EXTI instance.

Add to the binding an interrupt nexus child node that will be
used on the new EXTI instances and can be optionally used on the
existing instances.
The property 'interrupt-map' in the nexus node maps each EXTI
interrupt to the parent interrupt.
Align #address-cells and #interrupt-cells between the EXTI node
and its nexus node.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../interrupt-controller/st,stm32-exti.yaml   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
index 00c10a8258f1..1a4cf9537b9e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
@@ -26,6 +26,9 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  "#address-cells":
+    const: 0
+
   reg:
     maxItems: 1
 
@@ -42,6 +45,24 @@ properties:
     description:
       Interrupts references to primary interrupt controller
 
+  exti-interrupt-map:
+    type: object
+    properties:
+      interrupt-map: true
+
+      interrupt-map-mask: true
+
+      "#interrupt-cells":
+        const: 2
+
+      "#address-cells":
+        const: 0
+
+    required:
+      - interrupt-map
+      - "#interrupt-cells"
+      - "#address-cells"
+
 required:
   - "#interrupt-cells"
   - compatible
@@ -89,8 +110,27 @@ examples:
         reg = <0x5000d000 0x400>;
     };
 
+  - |
     //Example 2
-    exti2: interrupt-controller@40013c00 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    exti2: interrupt-controller@5000d000 {
+        compatible = "st,stm32mp1-exti", "syscon";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        reg = <0x5000d000 0x400>;
+        exti-interrupt-map {
+            #address-cells = <0>;
+            #interrupt-cells = <2>;
+            interrupt-map-mask = <0xffffffff 0>;
+            interrupt-map =
+                <0 0 &intc GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+                <3 0 &intc GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+
+  - |
+    //Example 3
+    exti3: interrupt-controller@40013c00 {
         compatible = "st,stm32-exti";
         interrupt-controller;
         #interrupt-cells = <2>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
