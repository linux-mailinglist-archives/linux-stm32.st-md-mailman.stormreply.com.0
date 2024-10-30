Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C609B69D1
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 17:58:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F05D7C78033;
	Wed, 30 Oct 2024 16:58:06 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A72C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 16:58:00 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-720b173a9ebso28667b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 09:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1730307479; x=1730912279;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pzL62SVyIjejPV0WK5Icvrl5yXIEFUYP1mc1b47FbtQ=;
 b=WChwz3Zv4fa9JH2U3dAGU/YM7IGa6gUyDpR6fYTuWDVuE8JH85g1/4X9abKxc2cqXC
 ycn6nOq6g/RCc+TGfzHzS3ksFP5RyACDSawplOEehITKtxjbS/cxYnMhY8jwWD9btW0n
 ii64a3qvSEUndM7LtVuZt0bDXdD92binJZa+fGKt/iwTSDG4VmhOq9wn4tYRh3QOHdmh
 HLUkoVaM/Hlxg7OZjk8LwObeWU1TPF62GjeP9E43Y4Z/ZZ20ttN4gGJ5HGJ+FLXGCV3j
 30StByixj5zNb9OP/MZvesY866rkrXiUjiTAU9TWfqT7vwDDDhRCIKMcbelLdRNMlOLA
 jwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730307479; x=1730912279;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzL62SVyIjejPV0WK5Icvrl5yXIEFUYP1mc1b47FbtQ=;
 b=tdEt6mB3zQ/olYZ49CggnprRY/r3H6xG4exZLc1Lgg6UuYZOztwZZiWxCPxi12gHO1
 p6GOd5sL+U3yYA2icGxm10scF+zQkcEZ2fbC+ohySSH7fow7IvE2Gd3UvozzX31J8G8y
 s+0pmxdbAUPpEvZduidDg9oAC4d/2tmruE3ipMDZu7ZGUb1BgOOl1CcNf1OGIa7w+GoW
 9xSszSOu7bKD/K/kfZYlEZjZ2keBUduCIYBfB13Z3ofeNW7Q0L0vsmK7i3jkNbgmJOaf
 nr+fT+YvC2C/QFes8LFKXGHtrnF4+RUl9mgF5SrRR7VFqI2HmyAUCDxii8vxVpnns+cI
 08ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpgO0LxszKbuLzpu+aKGOUvNT3dARaDTC1VUZSDO5vtuCGM2NB3MMP2LVcNloWNRtp0sRAiL2NB+BA9A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwtNDtBr1nMRmfd3dbeQ4FCbc2lBwCaFTK3imoPC6d4Z4ZCcycG
 isoBZJruU2uTboJ++xDFMnoOCfr5xGdG42A98TcJFy6hcpdQNOh2mH5RREMShCc=
X-Google-Smtp-Source: AGHT+IE8bL+epQxJK6CXce+NuA003s35k7m7I3D6tHPjdUbTchJcFFfnxiHRxOXvx11kN2Kqf0lARg==
X-Received: by 2002:a05:6a21:6e41:b0:1d9:175a:c2ba with SMTP id
 adf61e73a8af0-1db91d8b4b5mr85520637.20.1730307478935; 
 Wed, 30 Oct 2024 09:57:58 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a1f1ddsm9810776b3a.149.2024.10.30.09.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 09:57:58 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Wed, 30 Oct 2024 09:57:44 -0700
MIME-Version: 1.0
Message-Id: <20241030-th1520-gmac-v6-1-e48176d45116@tenstorrent.com>
References: <20241030-th1520-gmac-v6-0-e48176d45116@tenstorrent.com>
In-Reply-To: <20241030-th1520-gmac-v6-0-e48176d45116@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
X-Mailer: b4 0.14.1
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 1/2] dt-bindings: net: Add T-HEAD
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

From: Jisheng Zhang <jszhang@kernel.org>

Add documentation to describe the DesginWare-based GMAC controllers in
the T-HEAD TH1520 SoC.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: rename compatible, add apb registers as second reg of gmac node,
       add clocks and interrupts poroperties]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 110 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..474ade185033 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -99,6 +99,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - thead,th1520-gmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
new file mode 100644
index 000000000000..6d9de3303762
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 GMAC Ethernet controller
+
+maintainers:
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+description: |
+  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
+  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
+
+  Features include
+    - Compliant with IEEE802.3 Specification
+    - IEEE 1588-2008 standard for precision networked clock synchronization
+    - Supports 10/100/1000Mbps data transfer rate
+    - Supports RGMII/MII interface
+    - Preamble and start of frame data (SFD) insertion in Transmit path
+    - Preamble and SFD deletion in the Receive path
+    - Automatic CRC and pad generation options for receive frames
+    - MDIO master interface for PHY device configuration and management
+
+  The GMAC Registers consists of two parts
+    - APB registers are used to configure clock frequency/clock enable/clock
+      direction/PHY interface type.
+    - AHB registers are use to configure GMAC core (DesignWare Core part).
+      GMAC core register consists of DMA registers and GMAC registers.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-gmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-gmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    items:
+      - description: DesignWare GMAC IP core registers
+      - description: GMAC APB registers
+
+  reg-names:
+    items:
+      - const: dwmac
+      - const: apb
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: Peripheral registers interface clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+
+  interrupt-names:
+    items:
+      - const: macirq
+
+required:
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+        reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
+        reg-names = "dwmac", "apb";
+        clocks = <&clk 1>, <&clk 2>;
+        clock-names = "stmmaceth", "pclk";
+        interrupts = <66>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,pbl = <32>;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index f39ab140710f..72dee6d07ced 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19827,6 +19827,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
