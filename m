Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F01A3742B
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Feb 2025 13:40:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD976C78F71;
	Sun, 16 Feb 2025 12:40:29 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF2B3C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 12:40:28 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7c07441f14cso313681685a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739709627; x=1740314427;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=;
 b=T8MDuU/O6zUNhUwp3s2U9nTzCG9Wz+r/9tYpAVEcHBcO4KVtXJVGVsnNIRr8R7o+if
 m4CmrFB2Kib9FCJumL2DhcvpL4oAmtXfuXBUVa0Xf9P1tNvYf9X8wNJlCS8ZuBnnLocl
 9l21xgMgOOPJGW/YWgmLxfvQ1EHqhJQDXs3biTcAHDeJjc9iuvdMoYzjaMZvGtvzgW7I
 HjnU8OaRf9OG1EZqk2CvrRFd/DrBGtvLScYKMPB7mteKVQtd8TVWge+hA6H16h/wySgN
 ta9A90qZZZrCfevtjISAzxlwdovJ3So7IDbb84IO4IAApfPxQZbdOeVXd8gXmCPlS1+V
 dDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739709627; x=1740314427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=;
 b=GsfheXF2OFhT7aAtw4Rf3EioeSvpor0GhPA4hLCYZH9bZcxgSRLE7ZJIKwvhB2x2BA
 Tmhw9yZrZvUT9k5PCmjLYDICcQ7m6V6F8DBb6u5C95rBiV9Bh7rtArTqrZEMcik9szJF
 rGS6vfsX1ESkbLwJb6kRd1U1Foi04pHEKVuAqGxo7gYKGmPlg5wckM25yHCMizthXZWl
 qpd56ClzCbICWQlH3buoUEvagh4MxQYEhJlAhmHnW2QjLDQCnmgkAydxbL2PEHvLLvZL
 RZWGBRGxUtm8jHsCHAdlGJQwukM1oyL0O/kME4x/s7cqwWbFI+6wLzSgCNkRWMrlFQYJ
 ZCdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuAgYx+aBxGJsyU1AqtuOsgbBLTMhLs+iMyCQqsAbR4xbXWhWPtfCr2BW2X3X7ZMqE2O1DGcUZZ4Hgfw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9sKVsc15yLLNH8j1l9fPkaFUJT0fX0Fe9VF0AWZRmWR7DLUoQ
 v1HcXdfMfJAPQ3vPlNmS7+9jAoEfXu+iEQY5Lh8veDfKb+VIF+98
X-Gm-Gg: ASbGncuqQytOJ8+31UPpbyU9joOcFaTEwe/5kQl3OU+xtE0Ua7mqNYOm73DjNtLLlq1
 oZ5ilgaHVYdkt/52beXsbeDvuQFIkn44AGdLmR59hclmYa3NRYjxpSMmrGOnMXyxQe3POmMuCyv
 1wlwvQ26MO4/sa0czVrpBa/1/2VeYq9f51ZYHzFOUAaBrfZq/Z4+gFNnkViENgxTxadKoUo0JM2
 VnMupH5TydrI51Z4rLJd/74VfU+hUdulP2EuDZz/n6SvQerYfx7Nu4Np04VAeukQxM=
X-Google-Smtp-Source: AGHT+IFwCG0WhNlXVH9+JU8Q7jE4SQEUikrNIBKk/Yjtq4P8r19QHTmuFn8zXjmDXQs/E0vnx9tHuQ==
X-Received: by 2002:a05:620a:880a:b0:7c0:7818:8559 with SMTP id
 af79cd13be357-7c08a9807fbmr795514985a.3.1739709627506; 
 Sun, 16 Feb 2025 04:40:27 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c07c87006bsm416867385a.108.2025.02.16.04.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 04:40:26 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Serge Semin <fancer.lancer@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sun, 16 Feb 2025 20:39:49 +0800
Message-ID: <20250216123953.1252523-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216123953.1252523-1-inochiama@gmail.com>
References: <20250216123953.1252523-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 1/3] dt-bindings: net: Add support
	for Sophgo SG2044 dwmac
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

The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
MAC (version 5.30a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..02ab6a9aded2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -32,6 +32,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -98,8 +99,10 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
         - thead,th1520-gmac
@@ -631,6 +634,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
new file mode 100644
index 000000000000..b7e4216ea45a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sophgo,sg2044-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2044-dwmac
+      - const: snps,dwmac-5.30a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@30006000 {
+      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
+      reg = <0x30006000 0x4000>;
+      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupt-parent = <&intc>;
+      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      resets = <&rst 30>;
+      reset-names = "stmmaceth";
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,tso;
+      snps,txpbl = <32>;
+      snps,rxpbl = <32>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+      status = "disabled";
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <8>;
+        snps,rx-sched-wsp;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <8>;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,wr_osr_lmt = <1>;
+        snps,rd_osr_lmt = <2>;
+      };
+    };
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
