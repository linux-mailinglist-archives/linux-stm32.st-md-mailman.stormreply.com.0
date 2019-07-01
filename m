Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7ED279C6
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 11:56:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E278C0CD1B
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 09:56:59 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB553C0CD1A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 09:56:57 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 70D91100015;
 Thu, 23 May 2019 09:56:53 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 23 May 2019 11:56:45 +0200
Message-Id: <aa5ec90854429c2d9e2c565604243e1b10cfd94b.1558605170.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/8] dt-bindings: net: Add a YAML schemas for
	the generic PHY options
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

The networking PHYs have a number of available device tree properties that
can be used in their device tree node. Add a YAML schemas for those.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 148 +++++++++-
 Documentation/devicetree/bindings/net/phy.txt           |  80 +-----
 2 files changed, 149 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
new file mode 100644
index 000000000000..eb79ee6db977
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PHY Generic Binding
+
+maintainers:
+  - David S. Miller <davem@davemloft.net>
+
+properties:
+  $nodename:
+    pattern: "^ethernet-phy(@[a-f0-9])?$"
+
+  compatible:
+    oneOf:
+      - const: ethernet-phy-ieee802.3-c22
+        description: PHYs that implement IEEE802.3 clause 22
+      - const: ethernet-phy-ieee802.3-c45
+        description: PHYs that implement IEEE802.3 clause 45
+      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
+        description:
+          The first group of digits is the 16 bit Phy Identifier 1
+          register, this is the chip vendor OUI bits 3:18. The
+          second group of digits is the Phy Identifier 2 register,
+          this is the chip vendor OUI bits 19:24, followed by 10
+          bits of a vendor specific ID.
+
+  reg:
+    maxItems: 1
+    minimum: 0
+    maximum: 31
+    description:
+      The ID number for the PHY.
+
+  interrupts:
+    maxItems: 1
+
+  max-speed:
+    enum:
+      - 10
+      - 100
+      - 1000
+    description:
+      Maximum PHY supported speed in Mbits / seconds.
+
+  broken-turn-around:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      If set, indicates the PHY device does not correctly release
+      the turn around line low at the end of a MDIO transaction.
+
+  enet-phy-lane-swap:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      If set, indicates the PHY will swap the TX/RX lanes to
+      compensate for the board being designed with the lanes
+      swapped.
+
+  eee-broken-100tx:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      Mark the corresponding energy efficient ethernet mode as
+      broken and request the ethernet to stop advertising it.
+
+  eee-broken-1000t:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      Mark the corresponding energy efficient ethernet mode as
+      broken and request the ethernet to stop advertising it.
+
+  eee-broken-10gt:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      Mark the corresponding energy efficient ethernet mode as
+      broken and request the ethernet to stop advertising it.
+
+  eee-broken-1000kx:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      Mark the corresponding energy efficient ethernet mode as
+      broken and request the ethernet to stop advertising it.
+
+  eee-broken-10gkx4:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      Mark the corresponding energy efficient ethernet mode as
+      broken and request the ethernet to stop advertising it.
+
+  eee-broken-10gkr:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      Mark the corresponding energy efficient ethernet mode as
+      broken and request the ethernet to stop advertising it.
+
+  phy-is-integrated:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      If set, indicates that the PHY is integrated into the same
+      physical package as the Ethernet MAC. If needed, muxers
+      should be configured to ensure the integrated PHY is
+      used. The absence of this property indicates the muxers
+      should be configured so that the external PHY is used.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: phy
+
+  reset-gpios:
+    description:
+      The GPIO phandle and specifier for the PHY reset signal.
+
+  reset-assert-us:
+    description:
+      Delay after the reset was asserted in microseconds. If this
+      property is missing the delay will be skipped.
+
+  reset-deassert-us:
+    description:
+      Delay after the reset was deasserted in microseconds. If
+      this property is missing the delay will be skipped.
+
+required:
+  - reg
+  - interrupts
+
+examples:
+  - |
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0141.0e90", "ethernet-phy-ieee802.3-c22";
+            interrupt-parent = <&PIC>;
+            interrupts = <35 1>;
+            reg = <0>;
+
+            resets = <&rst 8>;
+            reset-names = "phy";
+            reset-gpios = <&gpio1 4 1>;
+            reset-assert-us = <1000>;
+            reset-deassert-us = <2000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index 9b9e5b1765dd..2399ee60caed 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -1,79 +1 @@
-PHY nodes
-
-Required properties:
-
- - interrupts : interrupt specifier for the sole interrupt.
- - reg : The ID number for the phy, usually a small integer
-
-Optional Properties:
-
-- compatible: Compatible list, may contain
-  "ethernet-phy-ieee802.3-c22" or "ethernet-phy-ieee802.3-c45" for
-  PHYs that implement IEEE802.3 clause 22 or IEEE802.3 clause 45
-  specifications. If neither of these are specified, the default is to
-  assume clause 22.
-
-  If the PHY reports an incorrect ID (or none at all) then the
-  "compatible" list may contain an entry with the correct PHY ID in the
-  form: "ethernet-phy-idAAAA.BBBB" where
-     AAAA - The value of the 16 bit Phy Identifier 1 register as
-            4 hex digits. This is the chip vendor OUI bits 3:18
-     BBBB - The value of the 16 bit Phy Identifier 2 register as
-            4 hex digits. This is the chip vendor OUI bits 19:24,
-            followed by 10 bits of a vendor specific ID.
-
-  The compatible list should not contain other values than those
-  listed here.
-
-- max-speed: Maximum PHY supported speed (10, 100, 1000...)
-
-- broken-turn-around: If set, indicates the PHY device does not correctly
-  release the turn around line low at the end of a MDIO transaction.
-
-- enet-phy-lane-swap: If set, indicates the PHY will swap the TX/RX lanes to
-  compensate for the board being designed with the lanes swapped.
-
-- enet-phy-lane-no-swap: If set, indicates that PHY will disable swap of the
-  TX/RX lanes. This property allows the PHY to work correcly after e.g. wrong
-  bootstrap configuration caused by issues in PCB layout design.
-
-- eee-broken-100tx:
-- eee-broken-1000t:
-- eee-broken-10gt:
-- eee-broken-1000kx:
-- eee-broken-10gkx4:
-- eee-broken-10gkr:
-  Mark the corresponding energy efficient ethernet mode as broken and
-  request the ethernet to stop advertising it.
-
-- phy-is-integrated: If set, indicates that the PHY is integrated into the same
-  physical package as the Ethernet MAC. If needed, muxers should be configured
-  to ensure the integrated PHY is used. The absence of this property indicates
-  the muxers should be configured so that the external PHY is used.
-
-- resets: The reset-controller phandle and specifier for the PHY reset signal.
-
-- reset-names: Must be "phy" for the PHY reset signal.
-
-- reset-gpios: The GPIO phandle and specifier for the PHY reset signal.
-
-- reset-assert-us: Delay after the reset was asserted in microseconds.
-  If this property is missing the delay will be skipped.
-
-- reset-deassert-us: Delay after the reset was deasserted in microseconds.
-  If this property is missing the delay will be skipped.
-
-Example:
-
-ethernet-phy@0 {
-	compatible = "ethernet-phy-id0141.0e90", "ethernet-phy-ieee802.3-c22";
-	interrupt-parent = <&PIC>;
-	interrupts = <35 IRQ_TYPE_EDGE_RISING>;
-	reg = <0>;
-
-	resets = <&rst 8>;
-	reset-names = "phy";
-	reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
-	reset-assert-us = <1000>;
-	reset-deassert-us = <2000>;
-};
+This file has moved to ethernet-phy.yaml.
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
