Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B928A176D
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Apr 2024 16:38:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3860C6DD6D;
	Thu, 11 Apr 2024 14:38:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA39C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 14:38:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43B8nFV0029043; Thu, 11 Apr 2024 16:38:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=pdiOg0qMVK3K8F6mkd9yI3FRY3kP3X2qeN1i6q/LFAs=; b=6R
 YrOvsA8Cfo7AMuhHFFuZUxg4zvvvrIFz2P5I1DfVUpZwhq8VHwmJGSmI7ehstsP7
 DREk6dLHmWJ23xTRbZ571qdwrB46tGvpFUX9xrSjZ39knWWgx4iLuKUPUKVKda8s
 pqbIj/3fx9ETV0p5twbAR91kcAxxvtxPLUwdTfhlzSMuJvBp5vM15lY9Dti0bQLg
 3jwt1wJHtKLxTW1H9KfVfCdsQpmP5WXkvP+qflgGkOSPS4nbMh70C6oUwjAb4A16
 LbbxlgYujgZ7nLEvK0X2E6IkdZCjjveHplsuy7+DVp0qHscYfprkQjY4oO/1yBnE
 aCgWVdOrCfd/hfrYpMaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xawqy5ds5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 16:38:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64D8A40045;
 Thu, 11 Apr 2024 16:38:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 892C4216821;
 Thu, 11 Apr 2024 16:37:22 +0200 (CEST)
Received: from localhost (10.48.86.106) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Apr
 2024 16:37:22 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
Date: Thu, 11 Apr 2024 16:36:48 +0200
Message-ID: <20240411143658.1049706-2-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240411143658.1049706-1-christophe.roullier@foss.st.com>
References: <20240411143658.1049706-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.106]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH 01/11] dt-bindings: net: add STM32MP13
	compatible in documentation for stm32
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

New STM32 SOC have 2 GMACs instances.
GMAC IP version is SNPS 4.20.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../devicetree/bindings/net/stm32-dwmac.yaml  | 80 +++++++++++++++++--
 1 file changed, 72 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 857d58949b029..20f58eff6e6f9 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -22,18 +22,17 @@ select:
         enum:
           - st,stm32-dwmac
           - st,stm32mp1-dwmac
+          - st,stm32mp13-dwmac
   required:
     - compatible
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
           - enum:
               - st,stm32mp1-dwmac
+              - st,stm32mp13-dwmac
           - const: snps,dwmac-4.20a
       - items:
           - enum:
@@ -74,13 +73,16 @@ properties:
 
   st,syscon:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to the syscon node which encompases the glue register
-          - description: offset of the control register
     description:
       Should be phandle/offset pair. The phandle to the syscon node which
-      encompases the glue register, and the offset of the control register
+      encompases the glue register, the offset of the control register and
+      the mask to set bitfield in control register
+    items:
+      minItems: 2
+      items:
+        - description: phandle to the syscon node which encompases the glue register
+        - description: offset of the control register
+        - description: field to set mask in register
 
   st,ext-phyclk:
     description:
@@ -108,6 +110,34 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp1-dwmac
+              - st,stm32-dwmac
+    then:
+      properties:
+        st,syscon:
+          items:
+            minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp13-dwmac
+    then:
+      properties:
+        st,syscon:
+          items:
+            minItems: 3
+
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -168,3 +198,37 @@ examples:
            snps,pbl = <8>;
            phy-mode = "mii";
        };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    #include <dt-bindings/mfd/stm32h7-rcc.h>
+    //Example 4
+     ethernet3: ethernet@5800a000 {
+           compatible = "st,stm32mp13-dwmac", "snps,dwmac-4.20a";
+           reg = <0x5800a000 0x2000>;
+           reg-names = "stmmaceth";
+           interrupts-extended = <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+                                 <&exti 68 IRQ_TYPE_LEVEL_HIGH>;
+           interrupt-names = "macirq",
+                             "eth_wake_irq";
+           clock-names = "stmmaceth",
+                         "mac-clk-tx",
+                         "mac-clk-rx",
+                         "eth-ck",
+                         "ptp_ref",
+                         "ethstp";
+           clocks = <&rcc ETHMAC>,
+                    <&rcc ETHTX>,
+                    <&rcc ETHRX>,
+                    <&rcc ETHCK_K>,
+                    <&rcc ETHPTP_K>,
+                    <&rcc ETHSTP>;
+           st,syscon = <&syscfg 0x4 0xff0000>;
+           snps,mixed-burst;
+           snps,pbl = <2>;
+           snps,axi-config = <&stmmac_axi_config_1>;
+           snps,tso;
+           phy-mode = "rmii";
+     };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
