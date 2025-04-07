Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F2A7DD04
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 14:03:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1C3CC78F9C;
	Mon,  7 Apr 2025 12:03:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4843EC78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 12:03:29 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so29357835e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744027409; x=1744632209;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5Ix48oRIT+HGTyPb9AccXXigQ/v++2JPi/QLW8EM4M=;
 b=h7Hsl3kxru0JUbPZ/cwv6hGZdT+BVD1+3YJKSWImsbFnXQkFcAyqG5A/+WWz8L1gUp
 k1QBM39PllqUQTMniHjskSKd5CpdMKZscX0vEcHwIQUoWezshsU6y7I8tYS5V5xTheT4
 rYWSsxHhCx1oA7ysR2n1nLsRB5j/AWSClCBMOZFbrVLeiN5NOroVQTJOnVGItPu35gM4
 fAWeCj+9M05xWEELQGXFryykWEoNezFFd86IN+Z+wXfiyUt5C2t7P2yVTiInIAnByx+e
 siA4TlZj0oywk+9D0OXEicyQyE/WsltI/rQ9VBBwMWRKWJe1cIs1bOX2qIrT4IlRUhDO
 IHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744027409; x=1744632209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P5Ix48oRIT+HGTyPb9AccXXigQ/v++2JPi/QLW8EM4M=;
 b=r1RaGbFD1mj8VkPpCguBiDd8ZrFxY9lJK/C6rkfbXp4wR2vNmK7X5ENACId+xy+f+r
 pAcBrRMhf5v5nYcmybP0Lfu3AweRrFywCGCE8a1dORa4QMHEK12Qrszf8aLj2FpoDzQp
 o+RyHzrq/SDaqVAQwky5n4mG0qlNUz7T08PKX2Q+Mj1OjeTNVCmuDYKZJrhKx6Km8L8p
 vXn5tL7Sch0whxZ8o54wN+zP87VIXFCwzm1RW542ZvxD3uJTMqOu9ttVuXBg4ZCbYA5d
 1PR6iU28t2hEFFAebvDnzY0dRzd8T/qh6TKJTWM1OoR/Mpn84hEPjj6QebydXYllt2Wc
 HiBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeI9wGg/n/heGZKX56/U7dFCEwHh39ca3FR/yG7ZeaiRcordTR87ngORvh5yxWR8snL8KsTUa9D0ggig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXl6+Rit/sGrd4LFIdhqRXkB+94FDDVzjGS6qS3eCyierP1dzM
 8QqlIwk/jV+LZdgpY5LKhlPwefB1Ub0olM4uVnGEawdA4s7GNQVa
X-Gm-Gg: ASbGncv3XHCTH5/nN+lHII/V/PB2tA1uMAn9TXrOuL6pgeArmn9aUd4gkDhMUe5pCPr
 N808Rm34VMiUNNZqbGbXzWsDApjzd9OXVxt6a1rL2zJMc/8m2nkZM949YEXJid0QabXALVlFFG1
 ZHAvBW2g5KBd1FrXdc+fa1yOmjQaEJ0s5r+m0XmTbufwdM/YegBS1GMieabHSTPM5xnKNIrv1ET
 NzGOI0WIPJFp96BhOlfrUOaSvbgXXJ0Gnyf5w8zqFgXJ4wsjaTBBS1qhviZOj2QSOaHa9ddavL3
 Sf9kMUg5mMoISw3OPhIngI3/6LUf7yKS/zYcm7bVl01+Mxbm3YfkzhbUibnh8wPxj2G4mg==
X-Google-Smtp-Source: AGHT+IGv0WPEhaxZ3KFf2ynxyZh1pTzIGfLq7WSPwZd1xfiZPI9qiPF8P8FlBP+2g6f4DtbJ3H397w==
X-Received: by 2002:a05:600c:3d05:b0:43c:fdbe:439b with SMTP id
 5b1f17b1804b1-43ed0b76649mr112092695e9.4.1744027408323; 
 Mon, 07 Apr 2025 05:03:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 05:03:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon,  7 Apr 2025 13:03:16 +0100
Message-ID: <20250407120317.127056-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 2/3] dt-bindings: net: Document
	support for Renesas RZ/V2H(P) GBETH
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

GBETH IP on the Renesas RZ/V2H(P) SoC is integrated with Synopsys
DesignWare MAC (version 5.20). Document the device tree bindings for
the GBETH glue layer.

Generic compatible string 'renesas,rzv2h-gbeth' is added since this
module is identical on both the RZ/V2H(P) and RZ/G3E SoCs.

The Rx/Tx clocks supplied for GBETH on the RZ/V2H(P) SoC is depicted
below:

                      Rx / Tx
-------+------------- on / off -------
       |
       |            Rx-180 / Tx-180
       +---- not ---- on / off -------

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4->v5
- No change

v3->v4
- No change

v2->v3
- Dropped interrupts description from interrupts property as
  snps,dwmac.yaml already describes it.
- Dropped snps,en-tx-lpi-clockgating as this is being marked
  as deprecated.
- Updated Rx/Tx interrupt names to match the regex from patch 1/3
- Listed Rx interrupts before Tx interrupts in example node for
  consistency.

v1->v2
- Updated commit description
- Updated interrupts description for clarity
- Updated interrupt-names for clarity
- Updated example node
---
 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml

diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
new file mode 100644
index 000000000000..02a6793c26f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/renesas,r9a09g057-gbeth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GBETH glue layer for Renesas RZ/V2H(P) (and similar SoCs)
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a09g057-gbeth
+          - renesas,rzv2h-gbeth
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a09g057-gbeth # RZ/V2H(P)
+      - const: renesas,rzv2h-gbeth
+      - const: snps,dwmac-5.20
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: CSR clock
+      - description: AXI system clock
+      - description: PTP clock
+      - description: TX clock
+      - description: RX clock
+      - description: TX clock phase-shifted by 180 degrees
+      - description: RX clock phase-shifted by 180 degrees
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+      - const: ptp_ref
+      - const: tx
+      - const: rx
+      - const: tx-180
+      - const: rx-180
+
+  interrupts:
+    minItems: 11
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+      - const: eth_lpi
+      - const: rx-queue-0
+      - const: rx-queue-1
+      - const: rx-queue-2
+      - const: rx-queue-3
+      - const: tx-queue-0
+      - const: tx-queue-1
+      - const: tx-queue-2
+      - const: tx-queue-3
+
+  resets:
+    items:
+      - description: AXI power-on system reset
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet@15c30000 {
+        compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth", "snps,dwmac-5.20";
+        reg = <0x15c30000 0x10000>;
+        clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+                  <&ptp_clock>, <&cpg CPG_MOD 0xb8>,
+                  <&cpg CPG_MOD 0xb9>, <&cpg CPG_MOD 0xba>,
+                  <&cpg CPG_MOD 0xbb>;
+        clock-names = "stmmaceth", "pclk", "ptp_ref",
+                      "tx", "rx", "tx-180", "rx-180";
+        resets = <&cpg 0xb0>;
+        interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+                          "rx-queue-0", "rx-queue-1", "rx-queue-2",
+                          "rx-queue-3", "tx-queue-0", "tx-queue-1",
+                          "tx-queue-2", "tx-queue-3";
+        phy-mode = "rgmii-id";
+        snps,multicast-filter-bins = <256>;
+        snps,perfect-filter-entries = <128>;
+        rx-fifo-depth = <8192>;
+        tx-fifo-depth = <8192>;
+        snps,fixed-burst;
+        snps,force_thresh_dma_mode;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,mtl-rx-config = <&mtl_rx_setup>;
+        snps,mtl-tx-config = <&mtl_tx_setup>;
+        snps,txpbl = <32>;
+        snps,rxpbl = <32>;
+        phy-handle = <&phy0>;
+
+        stmmac_axi_setup: stmmac-axi-config {
+            snps,lpi_en;
+            snps,wr_osr_lmt = <0xf>;
+            snps,rd_osr_lmt = <0xf>;
+            snps,blen = <16 8 4 0 0 0 0>;
+        };
+
+        mtl_rx_setup: rx-queues-config {
+            snps,rx-queues-to-use = <4>;
+            snps,rx-sched-sp;
+
+            queue0 {
+                snps,dcb-algorithm;
+                snps,priority = <0x1>;
+                snps,map-to-dma-channel = <0>;
+            };
+
+            queue1 {
+                snps,dcb-algorithm;
+                snps,priority = <0x2>;
+                snps,map-to-dma-channel = <1>;
+            };
+
+            queue2 {
+                snps,dcb-algorithm;
+                snps,priority = <0x4>;
+                snps,map-to-dma-channel = <2>;
+            };
+
+            queue3 {
+                snps,dcb-algorithm;
+                snps,priority = <0x8>;
+                snps,map-to-dma-channel = <3>;
+            };
+        };
+
+        mtl_tx_setup: tx-queues-config {
+            snps,tx-queues-to-use = <4>;
+
+            queue0 {
+                snps,dcb-algorithm;
+                snps,priority = <0x1>;
+            };
+
+            queue1 {
+                snps,dcb-algorithm;
+                snps,priority = <0x2>;
+            };
+
+            queue2 {
+                snps,dcb-algorithm;
+                snps,priority = <0x4>;
+            };
+
+            queue3 {
+                snps,dcb-algorithm;
+                snps,priority = <0x1>;
+            };
+        };
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "snps,dwmac-mdio";
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4d4fcaeca8a8..b525eca53850 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
+        - renesas,rzv2h-gbeth
         - rockchip,px30-gmac
         - rockchip,rk3128-gmac
         - rockchip,rk3228-gmac
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
