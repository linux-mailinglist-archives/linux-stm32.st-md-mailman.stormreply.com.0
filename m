Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 400506D244B
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 17:47:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 028C7C6A5FB;
	Fri, 31 Mar 2023 15:47:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE2ACC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 15:47:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VDsgnj010401; Fri, 31 Mar 2023 17:47:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=w9ILhYsOTZvuxzQYlPD9R8Ib3F4vFKSWlfhzjruH6nM=;
 b=xGrE7u0ouxNc3tQtzmyx/VyqCaQAa62qt6PtmS7wzEF18jsY3S1m2WvotXBjp0BnC9Sr
 kwub1o4269ISZH4nquOX8i9rPiVmbSKiSCJLv53mxh01ahRlw9SFgGlreFDldA9UdMLJ
 PbO6rja7T6UYoyS2ftrOqdiQohgn2o8dI3OBv+ijCQGwYcDlEcNU6E3+PFJ9qrVUAjaD
 J6GmSQPhu8iM94NylhExE0AdNRb5vtO4BROppMjJ0nicdyJstQbXzdkGecm+5zUNun+g
 PBfyLFAV6oZjif8J5oGQrZtOYQ4nKN08GlRF+Nt2Hw/SzKr8cETg+LWbfOFWvNz2bglD vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pnw9c24rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 17:47:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97E3110002A;
 Fri, 31 Mar 2023 17:47:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91E09222CAD;
 Fri, 31 Mar 2023 17:47:17 +0200 (CEST)
Received: from localhost (10.201.21.178) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 31 Mar
 2023 17:47:15 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 31 Mar 2023 17:46:47 +0200
Message-ID: <20230331154651.3107173-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331154651.3107173-1-arnaud.pouliquen@foss.st.com>
References: <20230331154651.3107173-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.178]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/5] dt-bindings: remoteproc: st,
	stm32-rproc: Rework reset declarations
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

With the introduction of the SCMI server it is now possible to use
the SCMI to handle the hold boot instead of a dedicated smc call.

As consequences two configurations are possible:
- use the Linux rcc reset service and use syscon for the MCU hold boot
- use the SCMI reset service for both the MCU reset and the MCU hold boot.

This patch:
- suppresses the use of the property st,syscfg-tz which was used
  to check if the trusted Zone was enable to use scm call to manage
  the hold boot (the reset controller phandle is used instead to select
  the configurations)
- adds properties check on resets definitions.
- adds an example of the SCMI reset service usage.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 52 +++++++++++++------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 66b1e3efdaa3..98d98e9114fc 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -25,7 +25,14 @@ properties:
     maxItems: 3
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: mcu_rst
+      - const: hold_boot
+    minItems: 1
 
   st,syscfg-holdboot:
     description: remote processor reset hold boot
@@ -36,16 +43,6 @@ properties:
           - description: The offset of the hold boot setting register
           - description: The field mask of the hold boot
 
-  st,syscfg-tz:
-    description:
-      Reference to the system configuration which holds the RCC trust zone mode
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
-    items:
-      - items:
-          - description: Phandle of syscon block
-          - description: The offset of the trust zone setting register
-          - description: The field mask of the trust zone state
-
   interrupts:
     description: Should contain the WWDG1 watchdog reset interrupt
     maxItems: 1
@@ -135,22 +132,47 @@ required:
   - compatible
   - reg
   - resets
-  - st,syscfg-holdboot
-  - st,syscfg-tz
+  - reset-names
+
+allOf:
+  - if:
+      properties:
+        reset-names:
+          not:
+            contains:
+              const: hold_boot
+    then:
+      required:
+        - st,syscfg-holdboot
+    else:
+      properties:
+        st,syscfg-holdboot: false
 
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/reset/stm32mp1-resets.h>
-    m4_rproc: m4@10000000 {
+    m4_rproc_example1: m4@10000000 {
       compatible = "st,stm32mp1-m4";
       reg = <0x10000000 0x40000>,
             <0x30000000 0x40000>,
             <0x38000000 0x10000>;
       resets = <&rcc MCU_R>;
+      reset-names = "mcu_rst";
       st,syscfg-holdboot = <&rcc 0x10C 0x1>;
-      st,syscfg-tz = <&rcc 0x000 0x1>;
+      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
+    };
+  - |
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    m4_rproc_example2: m4@10000000 {
+      compatible = "st,stm32mp1-m4";
+      reg = <0x10000000 0x40000>,
+            <0x30000000 0x40000>,
+            <0x38000000 0x10000>;
+      resets = <&scmi MCU_R>, <&scmi MCU_HOLD_BOOT_R>;
+      reset-names = "mcu_rst", "hold_boot";
       st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
       st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
