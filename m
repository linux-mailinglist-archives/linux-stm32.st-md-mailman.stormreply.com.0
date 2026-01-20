Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F1D3BF08
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 07:19:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1A59C36B3C;
	Tue, 20 Jan 2026 06:19:34 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A0A2C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 06:19:33 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-5636784883bso4129629e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 22:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768889972; x=1769494772;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
 b=DwIqFlH5gaTXHSBLG7Vp67ojz9PoPlaWvFEGZnusAc6wOD73zE+i5EEpzzsVkl/FJK
 hxSmW6xm6CEZyQZQd/+FVhiJFsspDNYNXXgXSaP2RNQASdWQtzVH85JRB2Qvp433O10D
 8OFjA+uHrgRkX3iOHZRt5ETj7gvuCDrX2qd/P5y9ceo9XlwV9CUggM6TiqOpu+6Ki9bD
 3YXBi0c+fu4XZ40OB09CMvzdtVhlJQ84zBRHsUDGOggdq6rZw7wFZlocd16oEwADM8EI
 GT3vJdGbudftmS48vP9prgmTBTyfbFqlU77FjQEA+0NOR6G1tpac5j7yfjz+RNgjtUwX
 7skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768889972; x=1769494772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
 b=DxqhVmE6NI9aQPlVEOura8lQ12pp9wlo6dY/8DUitv4CBoDTrhjJf+J8rBk44l5GZK
 1jRkcVsZF8CqGkFsfpv/MlrzDnphwsppECoVWGmQzZexAF8XioGWz0K/UwxajNNMvlvY
 dggM7ZRK4LtjH2uJdCKaZQ/JYIV87v0R1Mg9HhZjiE5VpzBdx5eMifrbuRG/LeQrAOFz
 UbuKKtPXHh1j0mIWthsn0ozRidlMbLDmIl1NEz9kSsISEUfJOz1tOlPoDDd5gpINDX/S
 jJKUS4HmbpQUa74xK//8BWZ8YpatFKAxzP2AaK91cPG/UvuhafBGRxL9oouK1fGtRbpK
 M2pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdMOMpWPsRdnsYPdQ1KEh1Q7lOepZU14KF0DNYngjddvqzZlaH0CYSqOtibrl2xQoQWd9g6VLn0J88EA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMOIpgPybRvv4AlpVWsE4Uhtf0EuIw5kfumesaBbE9xZvuq9kD
 +Fep0bbwXFb36c2v8Mk0boovBy2ix9Zb5b88IxjXfVsJ5ZHn3N51C+FHiqQfVK25
X-Gm-Gg: AZuq6aI35YdTjyrrBdl1ubFsdC7+04mEUC2VwiI536Jcffz4TMCqtFxp2ILTnD6n+4U
 mJXVYMfJF97bSt2M/BnuN8sL7XGzyOGZuLvHHzn5f2didQOYbc0Lg00TDz4ROIIgfdJlNpmlb7D
 sJdfmAHhDfg2wV7zurLJiNHVE3HI6EhIX+0531vt/1lrDhjUn4RVMKprvgX10BW58yxmOeDqfUU
 J/C9CJB306eXgPtHtjBSWdvsAvWlFzwmwi9OaV3FSMp6pdYFDQIS7/GtifJ1HBTNGD7d7XT9iNL
 VNXs2XchLJaPjPdqUbfYyMRgZK4OK2G9kIb9TGF91W+Lg4oqAHxKhOkciv1Lw/gn9ZyWpfpmKK4
 gcCYR+MWNxTQ4gKJnQtLo7lpDAj9bUtnWewjOQc99pVcmhGgue+Wm22/TWO5EjOOIxSub/Yuq5C
 zvNmkU4g81Bg==
X-Received: by 2002:a05:7300:6d1f:b0:2b0:4e86:8157 with SMTP id
 5a478bee46e88-2b6b46eb100mr10720484eec.17.1768883786512; 
 Mon, 19 Jan 2026 20:36:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6b3502c91sm15459859eec.9.2026.01.19.20.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 20:36:26 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue, 20 Jan 2026 12:36:06 +0800
Message-ID: <20260120043609.910302-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/3] dt-bindings: net: Add support
	for Spacemit K3 dwmac
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

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
MAC (version 5.40a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..3c2c6cb6b10b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -34,6 +34,7 @@ select:
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
+          - snps,dwmac-5.40a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -108,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -653,6 +655,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..58dd98f79e8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k3-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: spacemit,k3-dwmac
+      - const: snps,dwmac-5.40a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+      - description: PHY clock
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+      - const: phy
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: MAC interrupt
+      - description: MAC wake interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node which control the glue register
+          - description: offset of the control register
+          - description: offset of the dline register
+
+    description:
+      A phandle to syscon with offset to control registers for this MAC
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
+    eth0: ethernet@cac80000 {
+      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+      reg = <0xcac80000 0x2000>;
+      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
+               <&syscon_apmu 69>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_wake_irq";
+      phy-mode = "rgmii-id";
+      phy-handle = <&phy0>;
+      resets = <&syscon_apmu 67>;
+      reset-names = "stmmaceth";
+      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
+    };
+
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
