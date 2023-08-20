Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 736C2781DB8
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Aug 2023 14:14:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DF9CC6B44E;
	Sun, 20 Aug 2023 12:14:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F90DC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 12:14:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6172960A6D;
 Sun, 20 Aug 2023 12:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E68C433CB;
 Sun, 20 Aug 2023 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692533651;
 bh=EWb+P3txvbafg7rtyKSyM9vIE84CV5SI1rjEO7WrC7E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q2xkdFXW9IDM4IEr5OO9OFBpFD5VxDqpX80tvSxxF14Z6z+DYDTv3j1UFDSFcqOqL
 1EdUE3yXcdCkFyRMOVj767X0ETveH/PRAVcMXH9GOWYkV8CKdAnq/+WQG9bns0kuEU
 svD7noomEBmZZPBpHeFxJ4NCxGNE18ESX+geeIn9unHfpZVVtxQvZ/YYuHS0vAiMAi
 uXLkWw6VjzpXND1nYqcXcz9i8z3WBapUs3+KZBtk4IbOkXOYXFpRcELTsSIsJ2xG/1
 CU44q1bQp2cObVDRMd8J1vec6VcFmEl35A8HVyLRj90KRvA8Lndt+Xp9wzHdJ4tvnY
 WlQH4OCv1+r6g==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun, 20 Aug 2023 20:02:12 +0800
Message-Id: <20230820120213.2054-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230820120213.2054-1-jszhang@kernel.org>
References: <20230820120213.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/3] dt-bindings: net: add T-HEAD
	dwmac support
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

Add documentation to describe T-HEAD dwmac.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../devicetree/bindings/net/thead,dwmac.yaml  | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 7626289157df..b8f61db0e9d9 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -96,6 +96,7 @@ properties:
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - starfive,jh7110-dwmac
+        - thead,th1520-dwmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
new file mode 100644
index 000000000000..8ab16c408537
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD DWMAC glue layer
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: AXI clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: axi
+
+  thead,gmacapb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle to the syscon node that control ethernet
+      interface and timing delay.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phy-mode
+  - thead,gmacapb
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
+        reg = <0xe7070000 0x2000>;
+        clocks = <&clk 1>, <&clk 2>;
+        clock-names = "stmmaceth", "axi";
+        interrupts = <66>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,pbl = <32>;
+        thead,gmacapb = <&gmacapb_syscon>;
+        phy-handle = <&phy0>;
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
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
