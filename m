Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD99D4180
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE437C7A842;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 512D3C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 05:20:03 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7181285c7c4so3350895a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 21:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731475202; x=1732080002;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=;
 b=MWsjpnkEYXpEBCZGYplZzYZrmGn84Atow1ZB2qjqFU8dVDbZf5TrFAGS0YBFYFbWUC
 t9VRvEhePZWLelLTN5TAX5fL09m8LnS7BDnorJO+KY/R3mVZbeK+L7aryOsJwcA+dOhm
 0DXaQFPiO7lkTG/iSj9SYRH+6iA25/ItdzsT1Dr6Bi9EzGQ+MBIdMjja+OqyY77yHsmm
 4GrKohSptCQkCj31mlO6UjN4yqs7IDoASsUE0fWvgOwEoS0pyIyvLXB8e5LvWIkXu9Tc
 TinVMf0CD1/bIqKQxqDYeRS4ImDBg08mE4t25BggxPx0JeDofOo2YCJv/wApccYqiRQK
 cFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731475202; x=1732080002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=;
 b=ZgVZnAPaTmfB6JsT3tm+fWgk0o2w4xCjj2Wawd3UdE93F5yYPIoHZNg1uzKyeKTeEg
 dAzyYV/3HhlOxwAe43LnMNYXsUMkgooxr1CNT0nPHJZJoMhQ6Tr4b+pIe6JjkzokjQkB
 anLnVuyIYXU/k66Hx0c60MFntj50syjGupMIVsbnz1X9id8H2zHJlkxbVGYCCN5bGZ+0
 Trs0s3ctbatFjfLT2lWFnQMG47ssna0gKajS1Df2/YlAuttJa+jpp4gYBkodN/9JteIb
 jitVuxyjZ5m+LdhWD2XzXaK3YBRKpvZ3V9WNLrLshby457oqSYFeFBFByCvE4kRGY4Jm
 9bAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfaMRhrqK04H8rWstyKmBeBJYRKdObLXTF9LuXjWB9jIjJxviHKVn5iMUAN0cnX/TIHBitbHNgCr4SXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHrkiM7EkY4sFE50sZOdjmzW8vErIec+w/SrjZpn0zx+ci2MOD
 2dEQnro7XTsD9CfIHiKdixKK9RbKnm59cRc3nMhyi1c7Q3eB4die
X-Google-Smtp-Source: AGHT+IFe3VKkmjJmFK7cHt6HbH+71V9EWcoc7te6pi89V3VQcehyCiLGVfV8cx19XT/Qp+l+Gy43rA==
X-Received: by 2002:a05:6870:4686:b0:26c:64f8:d6c4 with SMTP id
 586e51a60fabf-2956032f1bfmr14436206fac.38.1731475202093; 
 Tue, 12 Nov 2024 21:20:02 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 21:20:01 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Wed, 13 Nov 2024 13:18:55 +0800
Message-Id: <20241113051857.12732-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113051857.12732-1-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema
	for MA35 family GMAC
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

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..45eaf13467b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+# We need a select here so we don't match all nodes with 'snps,dwmac'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    - items:
+        - enum:
+            - nuvoton,ma35d1-dwmac
+        - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum: [0, 1]
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  phy-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Specifies a reference to a node representing a PHY device.
+
+  tx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+
+  rx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    //Example 1
+    gmac0: ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x0 0x40120000 0x0 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio0 {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
+
+  - |
+    //Example 2
+    gmac1: ethernet@40130000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x0 0x40130000 0x0 0x10000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 1>;
+        resets = <&sys MA35D1_RESET_GMAC1>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rmii";
+        phy-handle = <&eth_phy1>;
+        mdio1 {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy1: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
