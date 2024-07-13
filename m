Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBA93FA00
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74CBEC78F65;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31FD1C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 22:35:25 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3d9dfc7c5f6so1458514b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 15:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910124; x=1721514924;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=alTBG+u/YLjKyTy47XAD1gqzMa09sOqVoRaB/kIbg6M=;
 b=JwVzICBmPgJ0qi0AizOTsXYzx5GgjQiWyzTLei4tJOsBD3hRrNrs12thCZHSc5hw6c
 Y1oK//xLCTsE1q8tufe0w1piiYhaMUZ3lDcjPW14zE8c8sJMyHr4MSCmQ4GC8jTSD0l2
 eD3exMC+ZYIR5GQgO1GOrgmbtrvC5FJ9VLl/w9OfDoa0VgbZIXtOLLAYY+YecuTqDAff
 U0UhzJMkL/M4c8sJgnUomLFb58sYOnHNODwDfqGHnv6EetoRCXzfAWTm05zRBrYXo+22
 fPzphy6CSLWhOoGdgRdfBttKiNGPboqzDNrS9+zvnSc8DMB/fdUqJD5bnHZjblVMNzif
 OTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720910124; x=1721514924;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=alTBG+u/YLjKyTy47XAD1gqzMa09sOqVoRaB/kIbg6M=;
 b=PBPVqQjIJ1iXa/D4Z6OvqePy1pGXeWm22iv2aYTt8T1oyt3SEHHso5ASyeloJMnkBn
 1ll5lZ+y2l8bUgnWFICTb+QbphiXVwuMCiMBvZ8vRjpZOm9x6rIJLW1PI1k09sDD1pOB
 KyMiBeUfNA6NNjp1eWu3W/AcO8uqTIvSajCzs97XkIla4zWpc6rAHXIO1iTSTJiv0Rg5
 IOLAwOGhxiT0mWjQGJR7f6hAJrxs/E9U7axItSl+oyIYrpbHjvfxZdazE1J0nRGN00rd
 ldBp195QoaRU6k93X6Na4S++tLYptd8CBHuGGW4sxD9mHWdcWyb5TlcnwbKRKPV1MOkV
 Jr4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhPmu+rl+8E5Md5psDsVYLlX3CdFGKUTjYHI2HuCmrmhbY8BARikqOL3kcZ3Eb2ZN0PZiZnce8fW6057U3M3rZ3/BKtVB1qq+ovLPwFOJStzTXtGNyZNZT
X-Gm-Message-State: AOJu0YwZ6AXZB71znjzqB0nsyOhMI2rkbom/a1J91ecJq8sUA5+/H//u
 Rz4meGCZRK43gU4V/RZSSVwW4DDlyK/KzNCU1uF9kx04HRcRLOlrhYlduazmRNk=
X-Google-Smtp-Source: AGHT+IEYT0gC2VTZYS2sf8gfKkEAnenEHDXxurHyzMbwt0lUKt7Uw0JJq9+GvaJQa3SRamrYdVWDxQ==
X-Received: by 2002:a54:4887:0:b0:3da:a6ce:f02c with SMTP id
 5614622812f47-3daa6cef4c8mr8226788b6e.20.1720910123980; 
 Sat, 13 Jul 2024 15:35:23 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 15:35:23 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Sat, 13 Jul 2024 15:35:11 -0700
MIME-Version: 1.0
Message-Id: <20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=3679;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=Y0E8nHMS0ChuTKJIO/9LY9pitgmvEOTz6OdEh2EGJdM=;
 b=CnXpDka3RYSnvNevDmDeEY3cdh4Cuclhx83gpRYciYZPaW7Lncl7HiKfGGZ+vf+vL/6bKiiAg
 NqzeNosEJGHCjNVVRAFPPUyhZ9vKonMP2wKOgI5NMbo4mgJUTSUKo60
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 2/4] dt-bindings: net: add T-HEAD
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

Add documentation to describe T-HEAD dwmac.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Link: https://lore.kernel.org/r/20230827091710.1483-3-jszhang@kernel.org
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: change apb registers from syscon to second reg of gmac node]
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 .../devicetree/bindings/net/thead,dwmac.yaml       | 81 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ad3bf5dafa7..d417f0e2d9c6 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -97,6 +97,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - thead,th1520-dwmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
new file mode 100644
index 000000000000..5618ede47925
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD DWMAC Ethernet controller
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
+    minItems: 2
+    maxItems: 2
+    items:
+      - description: DesignWare GMAC IP core registers
+      - description: GMAC APB registers
+
+  reg-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      - const: dwmac
+      - const: apb
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phy-mode
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
index e1736969189b..c724c2c4e06c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19319,6 +19319,7 @@ M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,dwmac.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
