Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6DD585AD
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 17:32:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 988F2C572F9;
	Thu, 27 Jun 2019 15:32:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCFFDC56C5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 15:32:16 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9B895240004;
 Thu, 27 Jun 2019 15:32:09 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 27 Jun 2019 17:31:45 +0200
Message-Id: <e99ff7377a0d3d140cf62200fd9d62c108dac24e.1561649505.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v4 03/13] dt-bindings: net: Add a YAML schemas
	for the generic MDIO options
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

The MDIO buses have a number of available device tree properties that can
be used in their device tree node. Add a YAML schemas for those.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/mdio.txt  | 38 +-------------
 Documentation/devicetree/bindings/net/mdio.yaml | 51 ++++++++++++++++++-
 2 files changed, 52 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/mdio.txt b/Documentation/devicetree/bindings/net/mdio.txt
index e3e1603f256c..cf8a0105488e 100644
--- a/Documentation/devicetree/bindings/net/mdio.txt
+++ b/Documentation/devicetree/bindings/net/mdio.txt
@@ -1,37 +1 @@
-Common MDIO bus properties.
-
-These are generic properties that can apply to any MDIO bus.
-
-Optional properties:
-- reset-gpios: One GPIO that control the RESET lines of all PHYs on that MDIO
-  bus.
-- reset-delay-us: RESET pulse width in microseconds.
-
-A list of child nodes, one per device on the bus is expected. These
-should follow the generic phy.txt, or a device specific binding document.
-
-The 'reset-delay-us' indicates the RESET signal pulse width in microseconds and
-applies to all PHY devices. It must therefore be appropriately determined based
-on all PHY requirements (maximum value of all per-PHY RESET pulse widths).
-
-Example :
-This example shows these optional properties, plus other properties
-required for the TI Davinci MDIO driver.
-
-	davinci_mdio: ethernet@5c030000 {
-		compatible = "ti,davinci_mdio";
-		reg = <0x5c030000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
-		reset-delay-us = <2>;
-
-		ethphy0: ethernet-phy@1 {
-			reg = <1>;
-		};
-
-		ethphy1: ethernet-phy@3 {
-			reg = <3>;
-		};
-	};
+This file has moved to mdio.yaml.
diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
new file mode 100644
index 000000000000..b8fa8251c4bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mdio.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MDIO Bus Generic Binding
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Florian Fainelli <f.fainelli@gmail.com>
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+description:
+  These are generic properties that can apply to any MDIO bus. Any
+  MDIO bus must have a list of child nodes, one per device on the
+  bus. These should follow the generic ethernet-phy.yaml document, or
+  a device specific binding document.
+
+properties:
+  reset-gpios:
+    maxItems: 1
+    description:
+      The phandle and specifier for the GPIO that controls the RESET
+      lines of all PHYs on that MDIO bus.
+
+  reset-delay-us:
+    description:
+      RESET pulse width in microseconds. It applies to all PHY devices
+      and must therefore be appropriately determined based on all PHY
+      requirements (maximum value of all per-PHY RESET pulse widths).
+
+examples:
+  - |
+    davinci_mdio: mdio@5c030000 {
+        compatible = "ti,davinci_mdio";
+        reg = <0x5c030000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        reset-gpios = <&gpio2 5 1>;
+        reset-delay-us = <2>;
+
+        ethphy0: ethernet-phy@1 {
+            reg = <1>;
+        };
+
+        ethphy1: ethernet-phy@3 {
+            reg = <3>;
+        };
+    };
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
