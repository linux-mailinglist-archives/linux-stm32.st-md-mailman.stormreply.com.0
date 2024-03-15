Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E987E46B
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 08:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2095EC6DD9E;
	Mon, 18 Mar 2024 07:54:23 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C062BC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 22:28:53 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d459a0462fso37154011fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 15:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710541733; x=1711146533;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=302kqphgnvloT7tRflp5vmAeTFbHsjR2zeOi1oIAOPs=;
 b=NSSf+g5wknRa9JdZdb1TPPuFBmrahIDywAbXOFA609OZ2hgLYly2YITq95eRKk86fM
 spKo3gPP6Qd+RYIoaTm8sjJojTvSX+W4y3KIrMIv/Ms56ivJE7Ri+uGkrkmJhthDpi1F
 qwlWHGxRHTbbcbNxkDjHJwwVD7mt/+WDy3brdj6C/AfFyelAodMRNPp8r0t87tT48ooX
 jmYhtwX0M8zjz9qHjHstvq+jVzUT9agqaj7GUrhC12JLULF+RQDzS+5/FsvUbnAd5Egd
 9QKOW8DG8YsCYHuC0T8kBIFJoXTBMn8vQvqAbWhn8uir7CsnbaIcMlI28+rfnkI9QoFW
 osaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710541733; x=1711146533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=302kqphgnvloT7tRflp5vmAeTFbHsjR2zeOi1oIAOPs=;
 b=Z/vC2fpbuAAghTq8ZgclruRVwV7g2nGG35CJ1g8qeu8IJVpssM1X1ZUVx/JDfulXlG
 PGSxJ99i8EgH94iTeMKMZrPHWVPJ+albXIMVaM9khYyexgfnR1oeInHz+hXBUDKdLiaj
 ddCAJCJuNFAgxQUMyznCOjC2DEhHowWvCq5fDC+6cC0k/CJsOzQ7NUgTKKUwbeHpAsWD
 25mRxAxXUUKr1BoBTDRNGT87EgYvR+tAhlV84QhtaBV3rU/+NF9FjC6t9JYUg4QG6r98
 n+n7ashqzyivxGtpV4TKZEtbxttUMUSdYRrMIazuoKRgNyhY2LreWfOWZWqTugM7lC5j
 8bxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVEMxlmLgU8qDz+1L+cIat6JG9Y1Wxm4wCp60SuFkeyVOukzUisMo5pOj/C/QpLyjq8LpClGUtm9pI7UtGW8zXTPczoxuBcFTo3bSZs4M0JgDxIQz9nVRY
X-Gm-Message-State: AOJu0YwE2ioa3T8UNfpUXA2XikyR6lwGlAxYOARGDcy3b9SZfutGAitb
 MYV1xWDi3RAMuxqOVzJl89bFH6De0pm7eGNEAQcD7UWrr1TUAtDa
X-Google-Smtp-Source: AGHT+IHcjRin3ixKrRDCEXWR1NTp6DqzyykF1/dJQj9Pfcg3SJc4VnuWq0HeLh8Kw0lcnJE/ychySA==
X-Received: by 2002:a2e:b81a:0:b0:2d2:cb43:bc86 with SMTP id
 u26-20020a2eb81a000000b002d2cb43bc86mr3340739ljo.45.1710541732845; 
 Fri, 15 Mar 2024 15:28:52 -0700 (PDT)
Received: from bhlegrsu.conti.de ([2a02:908:2525:6ea0::f845])
 by smtp.googlemail.com with ESMTPSA id
 el9-20020a056402360900b005684173e413sm2039833edb.72.2024.03.15.15.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 15:28:52 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: 
Date: Fri, 15 Mar 2024 23:27:49 +0100
Message-Id: <20240315222754.22366-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315222754.22366-1-wafgo01@gmail.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Mar 2024 07:54:20 +0000
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Wadim Mueller <wafgo01@gmail.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Linux-stm32] [PATCH 3/3] dt-bindings: net: add schema for NXP S32
	dwmac glue driver
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

Add DT binding schema documentation for the NXP S32 dwmac glue driver. This documentation is based on the patchset originally provided by Chester Lin [1]. This commit is a re-send of [2] and [3].

[1] https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228
[2] https://lore.kernel.org/lkml/20221031101052.14956-1-clin@suse.com/T/#me96c28bd0536de276dee941469ea084d51b42244
[3] https://lore.kernel.org/lkml/20221031101052.14956-1-clin@suse.com/T/#m887a1b34e612f8dc0d5b718e4d6834c083f1e245

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 .../bindings/net/nxp,s32-dwmac.yaml           | 130 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 2 files changed, 133 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
new file mode 100644
index 000000000000..0fbca6ce7d60
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: NXP S32 DWMAC Ethernet controller
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nxp,s32-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: "snps,dwmac.yaml#"
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - nxp,s32-dwmac
+
+  reg:
+    items:
+      - description: Main GMAC registers
+      - description: S32 MAC control registers
+
+  dma-coherent:
+    description:
+      Declares GMAC device as DMA coherent
+
+  clocks:
+    items:
+      - description: Main GMAC clock
+      - description: Peripheral registers clock
+      - description: Transmit SGMII clock
+      - description: Transmit RGMII clock
+      - description: Transmit RMII clock
+      - description: Transmit MII clock
+      - description: Receive SGMII clock
+      - description: Receive RGMII clock
+      - description: Receive RMII clock
+      - description: Receive MII clock
+      - description:
+          PTP reference clock. This clock is used for programming the
+          Timestamp Addend Register. If not passed then the system
+          clock will be used.
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+      - const: tx_sgmii
+      - const: tx_rgmii
+      - const: tx_rmii
+      - const: tx_mii
+      - const: rx_sgmii
+      - const: rx_rgmii
+      - const: rx_rmii
+      - const: rx_mii
+      - const: ptp_ref
+
+  tx-fifo-depth:
+    const: 20480
+
+  rx-fifo-depth:
+    const: 20480
+
+required:
+  - compatible
+  - reg
+  - tx-fifo-depth
+  - rx-fifo-depth
+  - clocks
+  - clock-names
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/nxp,s32-scmi-clock.h>
+
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      gmac0: ethernet@4033c000 {
+        compatible = "nxp,s32-dwmac";
+        reg = <0x4033c000 0x2000>, /* gmac IP */
+              <0x4007C004 0x4>;    /* S32 CTRL_STS reg */
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        tx-fifo-depth = <20480>;
+        rx-fifo-depth = <20480>;
+        dma-coherent;
+        clocks = <&clks S32_SCMI_CLK_GMAC0_AXI>,
+                 <&clks S32_SCMI_CLK_GMAC0_AXI>,
+                 <&clks S32_SCMI_CLK_GMAC0_TX_SGMII>,
+                 <&clks S32_SCMI_CLK_GMAC0_TX_RGMII>,
+                 <&clks S32_SCMI_CLK_GMAC0_TX_RMII>,
+                 <&clks S32_SCMI_CLK_GMAC0_TX_MII>,
+                 <&clks S32_SCMI_CLK_GMAC0_RX_SGMII>,
+                 <&clks S32_SCMI_CLK_GMAC0_RX_RGMII>,
+                 <&clks S32_SCMI_CLK_GMAC0_RX_RMII>,
+                 <&clks S32_SCMI_CLK_GMAC0_RX_MII>,
+                 <&clks S32_SCMI_CLK_GMAC0_TS>;
+        clock-names = "stmmaceth", "pclk",
+                      "tx_sgmii", "tx_rgmii", "tx_rmii", "tx_mii",
+                      "rx_sgmii", "rx_rgmii", "rx_rmii", "rx_mii",
+                      "ptp_ref";
+
+        gmac0_mdio: mdio {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          compatible = "snps,dwmac-mdio";
+
+          ethernet-phy@1 {
+            reg = <0x01>;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..e5bf61347b66 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nxp,s32-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
@@ -117,7 +118,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 8
+    maxItems: 11
     additionalItems: true
     items:
       - description: GMAC main clock
@@ -129,7 +130,7 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 8
+    maxItems: 11
     additionalItems: true
     contains:
       enum:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
