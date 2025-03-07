Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E245A55CF9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 02:17:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BB4EC78F85;
	Fri,  7 Mar 2025 01:17:03 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FC3EC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 01:17:01 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6dcd4f1aaccso21259256d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 17:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741310220; x=1741915020;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hjmCOU7/uhA2+L6wbt2c30nT+R/zwMCwKB+eVYC894=;
 b=NBip4mV3dyG7lKMzev1r8GmFservwlZFqaOpOBAQQUZAe0FMw6tOWBMM65csY1a7nk
 +wqF6yexKD+Z5ue8Q4CsQPL8+B1JPrk7iIXx68zu/ZyheFgnfMKN5kKSIjJeqbV/7R5d
 rMmABz/zrEp9Oa4otsZAnyuGP+xVOf5l+2LgR2G4idFYF6EjwR1CHwYOHWi+KADeN9zX
 rBoyQTPBLExfRbI9NwDNpGes8ruqpAONKNABxSCsiiub1EMSq+XDKYIvumEgEp5GpJ9v
 zSmGCLf18OJaVIQSC46gKA1klTofxttxT7ZM3mrhY7C99TAGRo6OtyqxeRRpxvjDV9h2
 yRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741310220; x=1741915020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hjmCOU7/uhA2+L6wbt2c30nT+R/zwMCwKB+eVYC894=;
 b=NacV+mjJ/rXs7QU4iyZXudA9a9+dtRUo9xEZw64Jq+ZNAfaJZhsusHKTJ27c1wYwEm
 kgmNMhDcLUFzG/i8Ni5+d3yZwLwMHDILB6Qc7lTQS4RhTYmwdfJJPe7vy40RFYUjYxJ0
 nWlQtA8DwPxSomNPP2D/cGuKWHjRcC9OrSf6DDebKrQrf8MEFnZDKZ1cQVRIVegKlZjt
 3rAgaQYQMpZLWg0uE4wxRoun6D9PfLvBb22oWwkHu2f4iPwwURW11ZH8+l7ap8+1I0UG
 5Z5PgPs0lqO55qugNG5PvF2Cldrg0U73wMGnssxUg/AjEyaa60jKHgXbWjODlt4poTz0
 ZpNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp+6nOXIDhJ6lxlTaD0Feio5kv3vGUmPmA7TL/RF5g03Cc55WDhnrsBlQz3iPUz6AvwwPti6zm9pMB5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYJBKaI2MKdjKkqX/Shnfug8vGQ6xyvVBLmVGwApXdBt6gHGKs
 X/wyYmTHOYLDNC7lxk9r0B5sF1CpLk2OGHOwYZOobq5mylDjM4Mb
X-Gm-Gg: ASbGncvwQ8zwuvvDYiclHGskfKYDK77s/QAqc9ZJRE20WV5ijQOzdp4GDxIgaZjAwY0
 QapjZBHl+FqVsHxj9AzZvKKpqkWi0I99kOvlUbLObDoelhIqFaiIyVxsmJiLqJYizwASo6ggQaw
 hp7bGNaOfkExT+Tz8Qi/aOy9olhoOCL3GegUYEWGUwRzPcBMi6d+4/1trYnD5zntGzDobs7GbGf
 D0S9c8j4MSai+TEOKST9s563LSGOvE1ddWgmqwLFf9qiIl47nIYMlxOVvPs9JGTmt1HOGKh3jvZ
 d4CwJPrv7HMxOhOYl/mR
X-Google-Smtp-Source: AGHT+IGLrdmWP/DPnT7w5ju6tPX8ko4QQGUEjeJXPFNnzgqBis94wAJsjfYZjIZPTsiSqztQL3GYoQ==
X-Received: by 2002:a05:6214:b69:b0:6e4:442c:2888 with SMTP id
 6a1803df08f44-6e9006cb8e2mr17002256d6.39.1741310220402; 
 Thu, 06 Mar 2025 17:17:00 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-4751d96f378sm13978491cf.30.2025.03.06.17.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 17:16:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri,  7 Mar 2025 09:16:14 +0800
Message-ID: <20250307011623.440792-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
References: <20250307011623.440792-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 1/4] dt-bindings: net: Add support
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
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index c7004eaa8eae..3f0aa46d798e 100644
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
         - tesla,fsd-ethqos
@@ -632,6 +635,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
new file mode 100644
index 000000000000..4dd2dc9c678b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -0,0 +1,126 @@
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
+  dma-noncoherent: true
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
