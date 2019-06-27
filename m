Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A96585A1
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 17:32:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F345C55175;
	Thu, 27 Jun 2019 15:32:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0C29C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 15:32:06 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6443FC0003;
 Thu, 27 Jun 2019 15:32:04 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 27 Jun 2019 17:31:43 +0200
Message-Id: <bbda9a50acace27f2fa79af71723e7d3b0111bc4.1561649505.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v4 01/13] dt-bindings: net: Add YAML schemas
	for the generic Ethernet options
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

The Ethernet controllers have a good number of generic options that can be
needed in a device tree. Add a YAML schemas for those.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 204 +++++++-
 Documentation/devicetree/bindings/net/ethernet.txt             |  69 +--
 Documentation/devicetree/bindings/net/fixed-link.txt           |  55 +--
 3 files changed, 206 insertions(+), 122 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-controller.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
new file mode 100644
index 000000000000..77ee2aa5d29e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet Controller Generic Binding
+
+maintainers:
+  - David S. Miller <davem@davemloft.net>
+
+properties:
+  $nodename:
+    pattern: "^ethernet(@.*)?$"
+
+  local-mac-address:
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint8-array
+      - minItems: 6
+        maxItems: 6
+    description:
+      Specifies the MAC address that was assigned to the network device.
+
+  mac-address:
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint8-array
+      - minItems: 6
+        maxItems: 6
+    description:
+      Specifies the MAC address that was last used by the boot
+      program; should be used in cases where the MAC address assigned
+      to the device by the boot program is different from the
+      local-mac-address property.
+
+  max-frame-size:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Maximum transfer unit (IEEE defined MTU), rather than the
+      maximum frame size (there\'s contradiction in the Devicetree
+      Specification).
+
+  max-speed:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Specifies maximum speed in Mbit/s supported by the device.
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Reference to an nvmem node for the MAC address
+
+  nvmem-cells-names:
+    const: mac-address
+
+  phy-connection-type:
+    description:
+      Operation mode of the PHY interface
+    enum:
+      # There is not a standard bus between the MAC and the PHY,
+      # something proprietary is being used to embed the PHY in the
+      # MAC.
+      - internal
+      - mii
+      - gmii
+      - sgmii
+      - qsgmii
+      - tbi
+      - rev-mii
+      - rmii
+
+      # RX and TX delays are added by the MAC when required
+      - rgmii
+
+      # RGMII with internal RX and TX delays provided by the PHY,
+      # the MAC should not add the RX or TX delays in this case
+      - rgmii-id
+
+      # RGMII with internal RX delay provided by the PHY, the MAC
+      # should not add an RX delay in this case
+      - rgmii-rxid
+
+      # RGMII with internal TX delay provided by the PHY, the MAC
+      # should not add an TX delay in this case
+      - rgmii-txid
+      - rtbi
+      - smii
+      - xgmii
+      - trgmii
+      - 1000base-x
+      - 2500base-x
+      - rxaui
+      - xaui
+
+      # 10GBASE-KR, XFI, SFI
+      - 10gbase-kr
+      - usxgmii
+
+  phy-mode:
+    $ref: "#/properties/phy-connection-type"
+
+  phy-handle:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description:
+      Specifies a reference to a node representing a PHY device.
+
+  phy:
+    $ref: "#/properties/phy-handle"
+    deprecated: true
+
+  phy-device:
+    $ref: "#/properties/phy-handle"
+    deprecated: true
+
+  rx-fifo-depth:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      The size of the controller\'s receive fifo in bytes. This is used
+      for components that can have configurable receive fifo sizes,
+      and is useful for determining certain configuration settings
+      such as flow control thresholds.
+
+  tx-fifo-depth:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      The size of the controller\'s transmit fifo in bytes. This
+      is used for components that can have configurable fifo sizes.
+
+  managed:
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/string
+      - default: auto
+        enum:
+          - auto
+          - in-band-status
+    description:
+      Specifies the PHY management type. If auto is set and fixed-link
+      is not specified, it uses MDIO for management.
+
+  fixed-link:
+    allOf:
+      - if:
+          type: array
+        then:
+          deprecated: true
+          minItems: 1
+          maxItems: 1
+          items:
+            items:
+              - minimum: 0
+                maximum: 31
+                description:
+                  Emulated PHY ID, choose any but unique to the all
+                  specified fixed-links
+
+              - enum: [0, 1]
+                description:
+                  Duplex configuration. 0 for half duplex or 1 for
+                  full duplex
+
+              - enum: [10, 100, 1000]
+                description:
+                  Link speed in Mbits/sec.
+
+              - enum: [0, 1]
+                description:
+                  Pause configuration. 0 for no pause, 1 for pause
+
+              - enum: [0, 1]
+                description:
+                  Asymmetric pause configuration. 0 for no asymmetric
+                  pause, 1 for asymmetric pause
+
+
+      - if:
+          type: object
+        then:
+          properties:
+            speed:
+              allOf:
+                - $ref: /schemas/types.yaml#definitions/uint32
+                - enum: [10, 100, 1000]
+              description:
+                Link speed.
+
+            full-duplex:
+              $ref: /schemas/types.yaml#definitions/flag
+              description:
+                Indicates that full-duplex is used. When absent, half
+                duplex is assumed.
+
+            asym-pause:
+              $ref: /schemas/types.yaml#definitions/flag
+              description:
+                Indicates that asym_pause should be enabled.
+
+            link-gpios:
+              maxItems: 1
+              description:
+                GPIO to determine if the link is up
+
+          required:
+            - speed
+
+...
diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index 5475682bf06e..5df413d01be2 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -1,68 +1 @@
-The following properties are common to the Ethernet controllers:
-
-NOTE: All 'phy*' properties documented below are Ethernet specific. For the
-generic PHY 'phys' property, see
-Documentation/devicetree/bindings/phy/phy-bindings.txt.
-
-- mac-address: array of 6 bytes, specifies the MAC address that was last used by
-  the boot program; should be used in cases where the MAC address assigned to
-  the device by the boot program is different from the "local-mac-address"
-  property;
-- local-mac-address: array of 6 bytes, specifies the MAC address that was
-  assigned to the network device;
-- nvmem-cells: phandle, reference to an nvmem node for the MAC address
-- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used
-- max-speed: number, specifies maximum speed in Mbit/s supported by the device;
-- max-frame-size: number, maximum transfer unit (IEEE defined MTU), rather than
-  the maximum frame size (there's contradiction in the Devicetree
-  Specification).
-- phy-mode: string, operation mode of the PHY interface. This is now a de-facto
-  standard property; supported values are:
-  * "internal" (Internal means there is not a standard bus between the MAC and
-     the PHY, something proprietary is being used to embed the PHY in the MAC.)
-  * "mii"
-  * "gmii"
-  * "sgmii"
-  * "qsgmii"
-  * "tbi"
-  * "rev-mii"
-  * "rmii"
-  * "rgmii" (RX and TX delays are added by the MAC when required)
-  * "rgmii-id" (RGMII with internal RX and TX delays provided by the PHY, the
-     MAC should not add the RX or TX delays in this case)
-  * "rgmii-rxid" (RGMII with internal RX delay provided by the PHY, the MAC
-     should not add an RX delay in this case)
-  * "rgmii-txid" (RGMII with internal TX delay provided by the PHY, the MAC
-     should not add an TX delay in this case)
-  * "rtbi"
-  * "smii"
-  * "xgmii"
-  * "trgmii"
-  * "1000base-x",
-  * "2500base-x",
-  * "rxaui"
-  * "xaui"
-  * "10gbase-kr" (10GBASE-KR, XFI, SFI)
-  * "usxgmii"
-- phy-connection-type: the same as "phy-mode" property but described in the
-  Devicetree Specification;
-- phy-handle: phandle, specifies a reference to a node representing a PHY
-  device; this property is described in the Devicetree Specification and so
-  preferred;
-- phy: the same as "phy-handle" property, not recommended for new bindings.
-- phy-device: the same as "phy-handle" property, not recommended for new
-  bindings.
-- rx-fifo-depth: the size of the controller's receive fifo in bytes. This
-  is used for components that can have configurable receive fifo sizes,
-  and is useful for determining certain configuration settings such as
-  flow control thresholds.
-- tx-fifo-depth: the size of the controller's transmit fifo in bytes. This
-  is used for components that can have configurable fifo sizes.
-- managed: string, specifies the PHY management type. Supported values are:
-  "auto", "in-band-status". "auto" is the default, it usess MDIO for
-  management if fixed-link is not specified.
-
-Child nodes of the Ethernet controller are typically the individual PHY devices
-connected via the MDIO bus (sometimes the MDIO bus controller is separate).
-They are described in the phy.txt file in this same directory.
-For non-MDIO PHY management see fixed-link.txt.
+This file has moved to ethernet-controller.yaml.
diff --git a/Documentation/devicetree/bindings/net/fixed-link.txt b/Documentation/devicetree/bindings/net/fixed-link.txt
index ec5d889fe3d8..5df413d01be2 100644
--- a/Documentation/devicetree/bindings/net/fixed-link.txt
+++ b/Documentation/devicetree/bindings/net/fixed-link.txt
@@ -1,54 +1 @@
-Fixed link Device Tree binding
-------------------------------
-
-Some Ethernet MACs have a "fixed link", and are not connected to a
-normal MDIO-managed PHY device. For those situations, a Device Tree
-binding allows to describe a "fixed link".
-
-Such a fixed link situation is described by creating a 'fixed-link'
-sub-node of the Ethernet MAC device node, with the following
-properties:
-
-* 'speed' (integer, mandatory), to indicate the link speed. Accepted
-  values are 10, 100 and 1000
-* 'full-duplex' (boolean, optional), to indicate that full duplex is
-  used. When absent, half duplex is assumed.
-* 'pause' (boolean, optional), to indicate that pause should be
-  enabled.
-* 'asym-pause' (boolean, optional), to indicate that asym_pause should
-  be enabled.
-* 'link-gpios' ('gpio-list', optional), to indicate if a gpio can be read
-  to determine if the link is up.
-
-Old, deprecated 'fixed-link' binding:
-
-* A 'fixed-link' property in the Ethernet MAC node, with 5 cells, of the
-  form <a b c d e> with the following accepted values:
-  - a: emulated PHY ID, choose any but but unique to the all specified
-    fixed-links, from 0 to 31
-  - b: duplex configuration: 0 for half duplex, 1 for full duplex
-  - c: link speed in Mbits/sec, accepted values are: 10, 100 and 1000
-  - d: pause configuration: 0 for no pause, 1 for pause
-  - e: asymmetric pause configuration: 0 for no asymmetric pause, 1 for
-    asymmetric pause
-
-Examples:
-
-ethernet@0 {
-	...
-	fixed-link {
-	      speed = <1000>;
-	      full-duplex;
-	};
-	...
-};
-
-ethernet@1 {
-	...
-	fixed-link {
-	      speed = <1000>;
-	      pause;
-	      link-gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
-	};
-	...
-};
+This file has moved to ethernet-controller.yaml.
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
