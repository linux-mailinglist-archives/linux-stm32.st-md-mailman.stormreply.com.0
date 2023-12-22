Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0C81C7D6
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 11:10:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FBAAC6C841;
	Fri, 22 Dec 2023 10:10:07 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B43DC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703239804;
 bh=uWnUGLE/quS8brRKKnW9+bEaKmmv9xeEiJDJO/bueIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rBI2TwKC4Q8ef0fvmaDUe+zyxYI33HW9HobqwXUQi+RS1Vo03YnlHVW167yWIoUge
 CxruM57vdMZgUdh8TBOOCXboEkTLYyyj0HS/4xCkkwFKMusbuzyXkZBQlNulcbZMal
 c3M51GTxNrrX9lp0LokcjHxp4av1Imm53bWpBR0jkLF+EakS++ophko3oqvQykIPnF
 dCVZECxn5hbwNiqIuMRYxYQavW1V9jMKJG+lDP46k2fVg6AcXMRtlWlrR2o62sJyfk
 M4Vg0A4rq9KmYHm1OziP5Rr6rKTRUjiOUdCvHTwhJz8gdpYX2CkXSsvvE1191u0vyq
 dVLoRBizcCF3g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A6C653782005;
 Fri, 22 Dec 2023 10:10:04 +0000 (UTC)
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
Date: Fri, 22 Dec 2023 12:09:59 +0200
Message-ID: <20231222101001.2541758-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222101001.2541758-1-cristian.ciocaltea@collabora.com>
References: <20231222101001.2541758-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: net: starfive,
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
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 11 +--
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 72 +++++++++++++------
 2 files changed, 57 insertions(+), 26 deletions(-)

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
index 5e7cfbbebce6..0d1962980f57 100644
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
@@ -94,6 +80,48 @@ required:
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
+
+        reset-names:
+          minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
