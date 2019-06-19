Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5F4B55D
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 11:48:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37FA4C593DC
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 09:48:53 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E92CC593D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 09:48:52 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2F7DC240021;
 Wed, 19 Jun 2019 09:48:48 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Wed, 19 Jun 2019 11:47:18 +0200
Message-Id: <727b6d0540a500ccdb2addd9a54bcf62463b426f.1560937626.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 09/16] dt-bindings: net: sun7i-gmac:
	Convert the binding to a schemas
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

Switch our Allwinner A20 GMAC controller binding to a YAML schema to enable
the DT validation. Since that controller is based on a Synopsys IP, let's
add the validation to that schemas with a bunch of conditionals.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2:
  - Switch to phy-connection-type instead of phy-mode

Changes from v1:
  - Add a file of its own
---
 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt  | 27 ---------------------------
 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml               |  3 +++
 3 files changed, 69 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
deleted file mode 100644
index 8b3f953656e3..000000000000
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Allwinner GMAC ethernet controller
-
-This device is a platform glue layer for stmmac.
-Please see stmmac.txt for the other unchanged properties.
-
-Required properties:
- - compatible:  Should be "allwinner,sun7i-a20-gmac"
- - clocks: Should contain the GMAC main clock, and tx clock
-   The tx clock type should be "allwinner,sun7i-a20-gmac-clk"
- - clock-names: Should contain the clock names "stmmaceth",
-   and "allwinner_gmac_tx"
-
-Optional properties:
-- phy-supply: phandle to a regulator if the PHY needs one
-
-Examples:
-
-	gmac: ethernet@1c50000 {
-		compatible = "allwinner,sun7i-a20-gmac";
-		reg = <0x01c50000 0x10000>,
-		      <0x01c20164 0x4>;
-		interrupts = <0 85 1>;
-		interrupt-names = "macirq";
-		clocks = <&ahb_gates 49>, <&gmac_tx>;
-		clock-names = "stmmaceth", "allwinner_gmac_tx";
-		phy-mode = "mii";
-	};
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
new file mode 100644
index 000000000000..38f6a2a73f46
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/allwinner,sun7i-a20-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A20 GMAC Device Tree Bindings
+
+allOf:
+  - $ref: "snps,dwmac.yaml#"
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    const: allwinner,sun7i-a20-gmac
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: allwinner_gmac_tx
+
+  phy-supply:
+    description:
+      PHY regulator
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phy-connection-type
+
+examples:
+  - |
+    gmac: ethernet@1c50000 {
+        compatible = "allwinner,sun7i-a20-gmac";
+        reg = <0x01c50000 0x10000>,
+              <0x01c20164 0x4>;
+        interrupts = <0 85 1>;
+        interrupt-names = "macirq";
+        clocks = <&ahb_gates 49>, <&gmac_tx>;
+        clock-names = "stmmaceth", "allwinner_gmac_tx";
+        phy-connection-type = "mii";
+    };
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 30e2ff7a2dcb..fed623a81dcd 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -44,6 +44,7 @@ properties:
   compatible:
     contains:
       enum:
+        - allwinner,sun7i-a20-gmac
         - snps,dwmac
         - snps,dwmac-3.50a
         - snps,dwmac-3.610
@@ -265,6 +266,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun7i-a20-gmac
               - snps,dwxgmac
               - snps,dwxgmac-2.10
               - st,spear600-gmac
@@ -305,6 +307,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun7i-a20-gmac
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
               - snps,dwxgmac
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
