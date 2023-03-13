Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D641D6B8528
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98917C69053;
	Mon, 13 Mar 2023 22:51:15 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65E44C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:13 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 07D5DE0EB5;
 Tue, 14 Mar 2023 01:51:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=N0KiAqfklGN/cwCh1WSz63GI/ELUsm0TaCCC6dXn1zo=; b=Cutu09l6xqVa
 xaIMw0AweMsGMt5BY9x/9+9ek4fvOhE7Ts9ep06UTS//PC4Dlt1rZSyCML3eGOyh
 K0pYECLmBYunXE3ZM7AdY1AipxLYhsix1sfDMNujRnKh+BMen0GhBAfomsPUfgkQ
 bNads3d2gLSiBgcK6OM6aqCwn7bTk/g=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id E7733E0E6A;
 Tue, 14 Mar 2023 01:51:12 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:12 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:50:51 +0300
Message-ID: <20230313225103.30512-5-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-Originating-IP: [10.8.30.10]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh@kernel.org>, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/16] dt-bindings: net: dwmac:
	Detach Generic DW MAC bindings
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

Currently the snps,dwmac.yaml DT bindings file is used for both DT nodes
describing generic DW MAC devices and as DT schema with common properties
to be evaluated against a vendor-specific DW MAC IP-cores. Due to such
dual-purpose design the "compatible" property of the common DW MAC schema
needs to contain the vendor-specific strings to successfully pass the
schema evaluation in case if it's referenced from the vendor-specific DT
bindings. That's a bad design from maintainability point of view, since
adding/removing any DW MAC-based device bindings requires the common
schema modification. In order to fix that let's detach the schema which
provides the generic DW MAC DT nodes evaluation into a dedicated DT
bindings file preserving the common DW MAC properties declaration in the
snps,dwmac.yaml file. By doing so we'll still provide a common properties
evaluation for each vendor-specific MAC bindings which refer to the
common bindings file, while the generic DW MAC DT nodes will be checked
against the new snps,dwmac-generic.yaml DT schema.

While at it extend the DW GMAC and xGMAC compatibles set with known to be
released DW GMAC v3.72a, 3.73a, 3.74a and DW xGMAC v2.11a IP-cores.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v1:
- Add a note to the snps,dwmac-generic.yaml bindings file description of
  a requirement to create a new DT bindings file for the vendor-specific
  versions of the DW MAC.

Link: https://lore.kernel.org/linux-arm-kernel/20210208135609.7685-8-Sergey.Semin@baikalelectronics.ru
Changelog v2:
- Replace double quotes with single ones in the select pattern strings.
  After doing so we can discard escaping the backslash in the regexpes.
- Add DW GMAC v3.72a, 3.73a, 3.74a and DW xGMAC v2.11a compatibles.
---
 .../bindings/net/snps,dwmac-generic.yaml      | 155 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   | 149 +----------------
 MAINTAINERS                                   |   1 +
 3 files changed, 158 insertions(+), 147 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
new file mode 100644
index 000000000000..ae740a1ab213
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/snps,dwmac-generic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Generic MAC Device Tree Bindings
+
+maintainers:
+  - Alexandre Torgue <alexandre.torgue@st.com>
+  - Giuseppe Cavallaro <peppe.cavallaro@st.com>
+  - Jose Abreu <joabreu@synopsys.com>
+
+description:
+  The primary purpose of this bindings file is to validate the Generic
+  Synopsys Desginware MAC DT nodes defined in accordance with the select
+  schema. All new vendor-specific versions of the DW *MAC IP-cores must
+  be described in a dedicated DT bindings file.
+
+# Select the DT nodes, which have got compatible strings either as just a
+# single string with IP-core name optionally followed by the IP version or
+# two strings: one with IP-core name plus the IP version, another as just
+# the IP-core name.
+select:
+  properties:
+    compatible:
+      oneOf:
+        - items:
+            - pattern: '^snps,dw(xg)+mac(-[0-9]+\.[0-9]+a?)?$'
+        - items:
+            - pattern: '^snps,dwmac-[0-9]+\.[0-9]+a?$'
+            - const: snps,dwmac
+        - items:
+            - pattern: '^snps,dwxgmac-[0-9]+\.[0-9]+a?$'
+            - const: snps,dwxgmac
+
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - description: Generic Synopsys DW MAC
+        oneOf:
+          - items:
+              - enum:
+                  - snps,dwmac-3.40a
+                  - snps,dwmac-3.50a
+                  - snps,dwmac-3.610
+                  - snps,dwmac-3.70a
+                  - snps,dwmac-3.710
+                  - snps,dwmac-3.72a
+                  - snps,dwmac-3.73a
+                  - snps,dwmac-3.74a
+                  - snps,dwmac-4.00
+                  - snps,dwmac-4.10a
+                  - snps,dwmac-4.20a
+              - const: snps,dwmac
+          - const: snps,dwmac
+      - description: Generic Synopsys DW xGMAC
+        oneOf:
+          - items:
+              - enum:
+                  - snps,dwxgmac-2.10
+                  - snps,dwxgmac-2.11a
+              - const: snps,dwxgmac
+          - const: snps,dwxgmac
+      - description: ST SPEAr SoC Family GMAC
+        deprecated: true
+        const: st,spear600-gmac
+
+  reg:
+    maxItems: 1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@e0800000 {
+        compatible = "snps,dwxgmac-2.10", "snps,dwxgmac";
+        reg = <0xe0800000 0x8000>;
+
+        interrupt-parent = <&vic1>;
+        interrupts = <24 23 22>;
+        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
+
+        mac-address = [000000000000]; /* Filled in by U-Boot */
+        max-frame-size = <3800>;
+
+        snps,multicast-filter-bins = <256>;
+        snps,perfect-filter-entries = <128>;
+
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        clocks = <&clock>;
+        clock-names = "stmmaceth";
+
+        phy-mode = "gmii";
+
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,mtl-rx-config = <&mtl_rx_setup>;
+        snps,mtl-tx-config = <&mtl_tx_setup>;
+
+        stmmac_axi_setup: stmmac-axi-config {
+            snps,wr_osr_lmt = <0xf>;
+            snps,rd_osr_lmt = <0xf>;
+            snps,blen = <256 128 64 32 0 0 0>;
+        };
+
+        mtl_rx_setup: rx-queues-config {
+            snps,rx-queues-to-use = <1>;
+            snps,rx-sched-sp;
+
+            queue0 {
+                snps,dcb-algorithm;
+                snps,map-to-dma-channel = <0x0>;
+                snps,priority = <0x0>;
+            };
+        };
+
+        mtl_tx_setup: tx-queues-config {
+            snps,tx-queues-to-use = <2>;
+            snps,tx-sched-wrr;
+
+            queue0 {
+                snps,weight = <0x10>;
+                snps,dcb-algorithm;
+                snps,priority = <0x0>;
+            };
+
+            queue1 {
+                snps,avb-algorithm;
+                snps,send_slope = <0x1000>;
+                snps,idle_slope = <0x1000>;
+                snps,high_credit = <0x3E800>;
+                snps,low_credit = <0xFFC18000>;
+                snps,priority = <0x1>;
+            };
+        };
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 92feed3c29bc..224f8f70db85 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -11,85 +11,9 @@ maintainers:
   - Giuseppe Cavallaro <peppe.cavallaro@st.com>
   - Jose Abreu <joabreu@synopsys.com>
 
-# Select every compatible, including the deprecated ones. This way, we
-# will be able to report a warning when we have that compatible, since
-# we will validate the node thanks to the select, but won't report it
-# as a valid value in the compatible property description
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - snps,dwmac
-          - snps,dwmac-3.40a
-          - snps,dwmac-3.50a
-          - snps,dwmac-3.610
-          - snps,dwmac-3.70a
-          - snps,dwmac-3.710
-          - snps,dwmac-4.00
-          - snps,dwmac-4.10a
-          - snps,dwmac-4.20a
-          - snps,dwmac-5.10a
-          - snps,dwxgmac
-          - snps,dwxgmac-2.10
-
-          # Deprecated
-          - st,spear600-gmac
-
-  required:
-    - compatible
+select: false
 
 properties:
-
-  # We need to include all the compatibles from schemas that will
-  # include that schemas, otherwise compatible won't validate for
-  # those.
-  compatible:
-    contains:
-      enum:
-        - allwinner,sun7i-a20-gmac
-        - allwinner,sun8i-a83t-emac
-        - allwinner,sun8i-h3-emac
-        - allwinner,sun8i-r40-gmac
-        - allwinner,sun8i-v3s-emac
-        - allwinner,sun50i-a64-emac
-        - amlogic,meson6-dwmac
-        - amlogic,meson8b-dwmac
-        - amlogic,meson8m2-dwmac
-        - amlogic,meson-gxbb-dwmac
-        - amlogic,meson-axg-dwmac
-        - ingenic,jz4775-mac
-        - ingenic,x1000-mac
-        - ingenic,x1600-mac
-        - ingenic,x1830-mac
-        - ingenic,x2000-mac
-        - loongson,ls2k-dwmac
-        - loongson,ls7a-dwmac
-        - renesas,r9a06g032-gmac
-        - renesas,rzn1-gmac
-        - rockchip,px30-gmac
-        - rockchip,rk3128-gmac
-        - rockchip,rk3228-gmac
-        - rockchip,rk3288-gmac
-        - rockchip,rk3328-gmac
-        - rockchip,rk3366-gmac
-        - rockchip,rk3368-gmac
-        - rockchip,rk3588-gmac
-        - rockchip,rk3399-gmac
-        - rockchip,rv1108-gmac
-        - snps,dwmac
-        - snps,dwmac-3.40a
-        - snps,dwmac-3.50a
-        - snps,dwmac-3.610
-        - snps,dwmac-3.70a
-        - snps,dwmac-3.710
-        - snps,dwmac-4.00
-        - snps,dwmac-4.10a
-        - snps,dwmac-4.20a
-        - snps,dwmac-5.10a
-        - snps,dwxgmac
-        - snps,dwxgmac-2.10
-
   reg:
     minItems: 1
     maxItems: 2
@@ -596,6 +520,7 @@ allOf:
               - snps,dwmac-5.10a
               - snps,dwxgmac
               - snps,dwxgmac-2.10
+              - snps,dwxgmac-2.11a
     then:
       properties:
         snps,tso:
@@ -606,74 +531,4 @@ allOf:
 
 additionalProperties: true
 
-examples:
-  - |
-    gmac0: ethernet@e0800000 {
-        compatible = "snps,dwxgmac-2.10", "snps,dwxgmac";
-        reg = <0xe0800000 0x8000>;
-        interrupt-parent = <&vic1>;
-        interrupts = <24 23 22>;
-        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
-        mac-address = [000000000000]; /* Filled in by U-Boot */
-        max-frame-size = <3800>;
-        phy-mode = "gmii";
-        snps,multicast-filter-bins = <256>;
-        snps,perfect-filter-entries = <128>;
-        rx-fifo-depth = <16384>;
-        tx-fifo-depth = <16384>;
-        clocks = <&clock>;
-        clock-names = "stmmaceth";
-        snps,axi-config = <&stmmac_axi_setup>;
-        snps,mtl-rx-config = <&mtl_rx_setup>;
-        snps,mtl-tx-config = <&mtl_tx_setup>;
-
-        stmmac_axi_setup: stmmac-axi-config {
-            snps,wr_osr_lmt = <0xf>;
-            snps,rd_osr_lmt = <0xf>;
-            snps,blen = <256 128 64 32 0 0 0>;
-        };
-
-        mtl_rx_setup: rx-queues-config {
-            snps,rx-queues-to-use = <1>;
-            snps,rx-sched-sp;
-            queue0 {
-                snps,dcb-algorithm;
-                snps,map-to-dma-channel = <0x0>;
-                snps,priority = <0x0>;
-            };
-        };
-
-        mtl_tx_setup: tx-queues-config {
-            snps,tx-queues-to-use = <2>;
-            snps,tx-sched-wrr;
-            queue0 {
-                snps,weight = <0x10>;
-                snps,dcb-algorithm;
-                snps,priority = <0x0>;
-            };
-
-            queue1 {
-                snps,avb-algorithm;
-                snps,send_slope = <0x1000>;
-                snps,idle_slope = <0x1000>;
-                snps,high_credit = <0x3E800>;
-                snps,low_credit = <0xFFC18000>;
-                snps,priority = <0x1>;
-            };
-        };
-
-        mdio0 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            compatible = "snps,dwmac-mdio";
-            phy1: ethernet-phy@0 {
-                reg = <0>;
-            };
-        };
-    };
-
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
-
 ...
diff --git a/MAINTAINERS b/MAINTAINERS
index ec57c42ed544..30d90d9daa9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20017,6 +20017,7 @@ M:	Jose Abreu <joabreu@synopsys.com>
 L:	netdev@vger.kernel.org
 S:	Supported
 W:	http://www.stlinux.com
+F:	Documentation/devicetree/bindings/net/snps,dwmac*.yaml
 F:	Documentation/networking/device_drivers/ethernet/stmicro/
 F:	drivers/net/ethernet/stmicro/stmmac/
 
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
