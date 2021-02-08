Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2A31347C
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:08:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD03CC57B5B;
	Mon,  8 Feb 2021 14:08:24 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CEC2C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:08:23 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Serge Semin <fancer.lancer@gmail.com>
Date: Mon, 8 Feb 2021 17:08:06 +0300
Message-ID: <20210208140820.10410-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/16] dt-bindings: net: Add Baikal-T1 GMAC
	bindings
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

Baikal-T1 SoC is equipped with two DW GMAC v3.73a-based 1GBE ethernet
interfaces synthesized with: RGMII PHY interface, AXI-DMA and APB3 CSR,
16KB Tx/Rx FIFOs and PBL up to half of that, PTP, PMT, TCP/IP CoE, up to 4
outstanding AXI read/write requests, maximum AXI burst length of 16 beats,
up to eight MAC address slots, one GPI and one GPO ports. Generic DW
MAC/STMMAC driver will easily handle the DT-node describing the Baikal-T1
GMAC network devices, but the bindings still needs to be created to have a
better understanding of what the interface looks like.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Rob, please note I couldn't declare the axi-config object properties constraints
without specifying the properties type and description. If I remove them the
dt_binding_check will curse with the error:

>> .../baikal,bt1-gmac.yaml: properties:axi-config:properties:snps,blen: 'description' is a required property
>> .../baikal,bt1-gmac.yaml: properties:axi-config:properties:snps,wr_osr_lmt: 'oneOf' conditional failed, one must be fixed:
        'type' is a required property
        Additional properties are not allowed ('maximum' was unexpected)
>> ...

I did't know what to do with these errors, so I just created normal sub-node
properties with stricter constraints than they are specified in the main
snps,dwmac.yaml schema. Any suggestion what is a better way to apply
additional constraints on sub-node properties?
---
 .../bindings/net/baikal,bt1-gmac.yaml         | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/baikal,bt1-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/baikal,bt1-gmac.yaml b/Documentation/devicetree/bindings/net/baikal,bt1-gmac.yaml
new file mode 100644
index 000000000000..30ab74a9023d
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/baikal,bt1-gmac.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/baikal,bt1-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Baikal-T1 DW GMAC Network Interface
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
+
+description:
+  Baikal-T1 is equipped with two DW GMAC v3.73a network interfaces. Each of
+  them doesn't have any on-SoC PHY attached, but instead exports RGMII
+  interface to connect any compatible physical layer transceiver.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: baikal,bt1-gmac
+
+  required:
+    - compatible
+
+allOf:
+  - $ref: "snps,dwmac.yaml#"
+
+properties:
+  compatible:
+    items:
+      - const: baikal,bt1-gmac
+      - const: snps,dwmac-3.73a
+      - const: snps,dwmac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+
+  clock-names:
+    minItems: 4
+    maxItems: 4
+    contains:
+      enum:
+        - stmmaceth
+        - pclk
+        - tx
+        - ptp_ref
+
+  ngpios:
+    description:
+      Baikal-T1 GMAC have been created with one GPI and one GPO ports
+      enabled. So there are total two GPIOs available.
+    const: 2
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  tx-internal-delay-ps:
+    description:
+      DW MAC Tx clocks generator has been designed to always add 2ns delay
+      of TXC with respect to TXD.
+    const: 2000
+
+  rx-fifo-depth:
+    const: 16384
+
+  tx-fifo-depth:
+    const: 16384
+
+  axi-config:
+    type: object
+
+    properties:
+      snps,wr_osr_lmt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Maximum write outstanding requests is limited with 4
+        maximum: 3
+
+      snps,rd_osr_lmt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Maximum read outstanding requests is limited with 4
+        maximum: 3
+
+      snps,blen:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: AXI-bus burst length width is limited with just 4 bits
+        items:
+          enum: [16, 8, 4, 0]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@1f05e000 {
+      compatible = "baikal,bt1-dwmac", "snps,dwmac-3.73a", "snps,dwmac";
+      reg = <0x1f05e000 0x2000>;
+      #address-cells = <1>;
+      #size-cells = <2>;
+
+      interrupts = <72>;
+      interrupt-names = "macirq";
+
+      clocks = <&ccu_sys 1>, <&ccu_axi 3>, <&ccu_sys 2>, <&ccu_sys 3>;
+      clock-names = "pclk", "stmmaceth", "tx", "ptp_ref";
+
+      resets = <&ccu_axi 3>;
+      reset-names = "stmmaceth";
+
+      ngpios = <2>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      phy-mode = "rgmii-rxid";
+      tx-internal-delay-ps = <2000>;
+
+      rx-fifo-depth = <16384>;
+      tx-fifo-depth = <16384>;
+
+      axi-config {
+        snps,wr_osr_lmt = <0x3>;
+        snps,rd_osr_lmt = <0x3>;
+        snps,blen = <0 0 0 0 16 8 4>;
+      };
+    };
+...
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
