Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A23133E4
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 14:56:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0288C57B56;
	Mon,  8 Feb 2021 13:56:13 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB9AC57188
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:56:12 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>
Date: Mon, 8 Feb 2021 16:55:45 +0300
Message-ID: <20210208135609.7685-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/24] dt-bindings: net: dwmac: Validate
	PBL for all IP-cores
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

Indeed the maximum DMA burst length can be programmed not only for DW
xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
the property and then apply the configuration for all supported DW MAC
devices. All of that makes the property being available for all IP-cores
the bindings supports. Let's make sure the PBL-related properties are
validated for all of them by the common DW MAC DT schema.

[1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
    October 2013, p. 380.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Use correct syntax of the JSON pointers, so the later would begin
  with a '/' after the '#'.
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 69 +++++++------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0642b0f59491..40a002770441 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -265,6 +265,32 @@ properties:
       is supported. For example, this is used in case of SGMII and
       MAC2MAC connection.
 
+  snps,pbl:
+    description:
+      Programmable Burst Length (tx and rx)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4, 8]
+
+  snps,txpbl:
+    description:
+      Tx Programmable Burst Length. If set, DMA tx will use this
+      value rather than snps,pbl.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4, 8]
+
+  snps,rxpbl:
+    description:
+      Rx Programmable Burst Length. If set, DMA rx will use this
+      value rather than snps,pbl.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4, 8]
+
+  snps,no-pbl-x8:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core
+      rev < 3.50, don\'t multiply the values by 4.
+
   mdio:
     type: object
     description:
@@ -290,49 +316,6 @@ dependencies:
 
 allOf:
   - $ref: "ethernet-controller.yaml#"
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - allwinner,sun7i-a20-gmac
-              - allwinner,sun8i-a83t-emac
-              - allwinner,sun8i-h3-emac
-              - allwinner,sun8i-r40-emac
-              - allwinner,sun8i-v3s-emac
-              - allwinner,sun50i-a64-emac
-              - snps,dwxgmac
-              - snps,dwxgmac-2.10
-              - st,spear600-gmac
-
-    then:
-      properties:
-        snps,pbl:
-          description:
-            Programmable Burst Length (tx and rx)
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [2, 4, 8]
-
-        snps,txpbl:
-          description:
-            Tx Programmable Burst Length. If set, DMA tx will use this
-            value rather than snps,pbl.
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [2, 4, 8]
-
-        snps,rxpbl:
-          description:
-            Rx Programmable Burst Length. If set, DMA rx will use this
-            value rather than snps,pbl.
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [2, 4, 8]
-
-        snps,no-pbl-x8:
-          $ref: /schemas/types.yaml#/definitions/flag
-          description:
-            Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core
-            rev < 3.50, don\'t multiply the values by 4.
-
   - if:
       properties:
         compatible:
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
