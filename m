Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F274B546
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 11:48:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC901C593D5
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 09:48:07 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B1ECC593D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 09:48:07 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8B7CD20000F;
 Wed, 19 Jun 2019 09:47:57 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Wed, 19 Jun 2019 11:47:15 +0200
Message-Id: <e7c13fc3c4e287df6292dbee27ae1caeca0c06c4.1560937626.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 06/16] dt-bindings: net: sun4i-emac:
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

Switch our Allwinner A10 EMAC controller binding to a YAML schema to enable
the DT validation.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2:
  - Switch from the deprecated phy property to phy-handle
---
 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt      | 19 -------------------
 2 files changed, 55 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
new file mode 100644
index 000000000000..2ff9e605cd26
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 EMAC Ethernet Controller Device Tree Bindings
+
+allOf:
+  - $ref: "ethernet-controller.yaml#"
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    const: allwinner,sun4i-a10-emac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  allwinner,sram:
+    description: Phandle to the device SRAM
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - phy-handle
+  - allwinner,sram
+
+examples:
+  - |
+    emac: ethernet@1c0b000 {
+        compatible = "allwinner,sun4i-a10-emac";
+        reg = <0x01c0b000 0x1000>;
+        interrupts = <55>;
+        clocks = <&ahb_gates 17>;
+        phy = <&phy0>;
+    };
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt b/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
deleted file mode 100644
index e98118aef5f6..000000000000
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Allwinner EMAC ethernet controller
-
-Required properties:
-- compatible: should be "allwinner,sun4i-a10-emac" (Deprecated:
-              "allwinner,sun4i-emac")
-- reg: address and length of the register set for the device.
-- interrupts: interrupt for the device
-- phy: see ethernet.txt file in the same directory.
-- clocks: A phandle to the reference clock for this device
-
-Example:
-
-emac: ethernet@1c0b000 {
-       compatible = "allwinner,sun4i-a10-emac";
-       reg = <0x01c0b000 0x1000>;
-       interrupts = <55>;
-       clocks = <&ahb_gates 17>;
-       phy = <&phy0>;
-};
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
