Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8BE81953D
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 01:28:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B603C6DD6F;
	Wed, 20 Dec 2023 00:28:36 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77BD3C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 00:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703032115;
 bh=60WvtqZegeWvB0tamY/8ektCCEV6OJAa6Oke2f1GXLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=skT5ltiLsjQGqvughCqz7YutY0JwGX80oJ7EYNjWxm1TbfNEPEBja3kh5TKsWKeZ/
 8HXk7NcRSWZllkKAGw78Jl/bkug5AtGTpeLKUX/7l5Xg8nTlRExIZvX1CPPyJtaj4x
 +M2wnE07064EccN4PC7Q1m05uCwawGioszgw4BCvR5XPpqSkXL/gL3HqMuqKmqiWpF
 J7DFdAXizOUgthwhMFAeuSujgy/nUvMI6DocMfO+Pj/IMdSAbje/Z4KnJUxGkMIUuv
 xQkUhVoHD9j7yYQIFOsbpAI7yITLE4MgqjKBycUhAdNkUeDm+lhGtxtRjZR+MZ69yN
 YpIgF/+2OVPnA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D55593781F86;
 Wed, 20 Dec 2023 00:28:34 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 20 Dec 2023 02:28:22 +0200
Message-ID: <20231220002824.2462655-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220002824.2462655-1-cristian.ciocaltea@collabora.com>
References: <20231220002824.2462655-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: net: starfive,
	jh7110-dwmac: Add JH7100 SoC compatible
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

The Synopsys DesignWare MAC found on StarFive JH7100 SoC is mostly
similar to the newer JH7110, but it requires only two interrupts and a
single reset line, which is 'ahb' instead of the commonly used
'stmmaceth'.

Since the common binding 'snps,dwmac' allows selecting 'ahb' only in
conjunction with 'stmmaceth', extend the logic to also permit exclusive
usage of the 'ahb' reset name.  This ensures the following use cases are
supported:

  JH7110: reset-names = "stmmaceth", "ahb";
  JH7100: reset-names = "ahb";
  other:  reset-names = "stmmaceth";

Also note the need to use a different dwmac fallback, as v5.20 applies
to JH7110 only, while JH7100 relies on v3.7x.

Additionally, drop the reset description items from top-level binding as
they are already provided by the included snps,dwmac schema.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 11 ++-
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 75 +++++++++++++------
 2 files changed, 60 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..90c4db178c67 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -95,6 +95,7 @@ properties:
         - snps,dwmac-5.20
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
 
   reg:
@@ -144,10 +145,12 @@ properties:
       - description: AHB reset
 
   reset-names:
-    minItems: 1
-    items:
-      - const: stmmaceth
-      - const: ahb
+    oneOf:
+      - items:
+          - enum: [stmmaceth, ahb]
+      - items:
+          - const: stmmaceth
+          - const: ahb
 
   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 5e7cfbbebce6..f5f0bff5be0f 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -16,16 +16,20 @@ select:
     compatible:
       contains:
         enum:
+          - starfive,jh7100-dwmac
           - starfive,jh7110-dwmac
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - starfive,jh7110-dwmac
-      - const: snps,dwmac-5.20
+    oneOf:
+      - items:
+          - const: starfive,jh7100-dwmac
+          - const: snps,dwmac
+      - items:
+          - const: starfive,jh7110-dwmac
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
@@ -46,24 +50,6 @@ properties:
       - const: tx
       - const: gtx
 
-  interrupts:
-    minItems: 3
-    maxItems: 3
-
-  interrupt-names:
-    minItems: 3
-    maxItems: 3
-
-  resets:
-    items:
-      - description: MAC Reset signal.
-      - description: AHB Reset signal.
-
-  reset-names:
-    items:
-      - const: stmmaceth
-      - const: ahb
-
   starfive,tx-use-rgmii-clk:
     description:
       Tx clock is provided by external rgmii clock.
@@ -94,6 +80,51 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7100-dwmac
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
+        interrupt-names:
+          minItems: 2
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          const: ahb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-dwmac
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
+        resets:
+          minItems: 2
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: stmmaceth
+            - const: ahb
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
