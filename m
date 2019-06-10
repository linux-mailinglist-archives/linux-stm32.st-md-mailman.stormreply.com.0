Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B472A3B1FE
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 11:26:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ED5DC0757F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 09:26:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31048C0757E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 09:26:45 +0000 (UTC)
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A773AC000B;
 Mon, 10 Jun 2019 09:26:42 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 10 Jun 2019 11:25:49 +0200
Message-Id: <ff6306c71a6b6ad174007f9f2823499d3093e21c.1560158667.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v2 10/11] dt-bindings: net: dwmac: Deprecate
	the PHY reset properties
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

Even though the DWMAC driver uses some driver specific properties, the PHY
core has a bunch of generic properties and can deal with them nicely.

Let's deprecate our specific properties.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v1:
  - New patch
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 54 ++++++------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index c48a089edc21..a2d56e8a7a39 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -171,26 +171,6 @@ properties:
             * snps,low_credit, max read outstanding req. limit
           * snps,priority, TX queue priority (Range 0x0 to 0xF)
 
-  snps,reset-gpio:
-    maxItems: 1
-    description:
-      PHY Reset GPIO
-
-  snps,reset-active-low:
-    $ref: /schemas/types.yaml#definitions/flag
-    description:
-      Indicates that the PHY Reset is active low
-
-  snps,reset-delays-us:
-    allOf:
-      - $ref: /schemas/types.yaml#definitions/uint32-array
-      - minItems: 3
-        maxItems: 3
-    description:
-      Triplet of delays. The 1st cell is reset pre-delay in micro
-      seconds. The 2nd cell is reset pulse in micro seconds. The 3rd
-      cell is reset post-delay in micro seconds.
-
   snps,aal:
     $ref: /schemas/types.yaml#definitions/flag
     description:
@@ -253,6 +233,36 @@ properties:
     required:
       - compatible
 
+  ## Deprecated properties
+  #
+  # Deprecated in favor of ethernet phy's reset-gpios property
+  # snps,reset-gpio:
+  #   maxItems: 1
+  #   description:
+  #     PHY Reset GPIO
+
+  # Deprecated in favor of ethernet phy's reset-gpios property
+  # snps,reset-active-low:
+  #   $ref: /schemas/types.yaml#definitions/flag
+  #   description:
+  #     Indicates that the PHY Reset is active low
+
+  # Deprecated in favor of ethernet phy's reset-assert-us and
+  # reset-deassert-us properties
+  # snps,reset-delays-us:
+  #   allOf:
+  #     - $ref: /schemas/types.yaml#definitions/uint32-array
+  #     - minItems: 3
+  #       maxItems: 3
+  #   description:
+  #     Triplet of delays. The 1st cell is reset pre-delay in micro
+  #     seconds. The 2nd cell is reset pulse in micro seconds. The 3rd
+  #     cell is reset post-delay in micro seconds.
+
+# dependencies:
+#   snps,reset-active-low: ["snps,reset-gpio"]
+#   snps,reset-delay-us: ["snps,reset-gpio"]
+
 required:
   - compatible
   - reg
@@ -260,10 +270,6 @@ required:
   - interrupt-names
   - phy-mode
 
-dependencies:
-  snps,reset-active-low: ["snps,reset-gpio"]
-  snps,reset-delay-us: ["snps,reset-gpio"]
-
 allOf:
   - $ref: "ethernet-controller.yaml#"
   - if:
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
