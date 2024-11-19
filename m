Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 466009D28CF
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 16:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D36DBC7A82A;
	Tue, 19 Nov 2024 15:01:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7077CC78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 15:01:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DF25AA42B72;
 Tue, 19 Nov 2024 14:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09E8AC4AF10;
 Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732028465;
 bh=OmhoPxBbW2h8GuBsgibA6xugOaiXQl/SNjprceISX24=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=RkBYdbFVF2kJFYxglbrq1cixQ8DxB02h/9tzJO4xw43qLqtGTaAGYToVIxtls/tyB
 a4zej2rsLvWoGx60mvaaGpFj+fGpyMqB8eHWtaT9G8OyqkKkzihGCuiBrArimi3eBZ
 cNL3zyRDHePyKUG0md4r15EHmaInkFahmQBDNoAfYM/ifD5Z135oqNKAY0v5E/Cu+W
 gNh27QAXnpGnPCcSvgooMCoWlml31vHDqzH9Eu1/4pkBwZeonM4yza75tCToDFjMHx
 4sDmDsFvRAT9Djw2xMRb+YsK70rpbPB2nPxNXWBXtoHn6kPReCEGLTJ1rpauAcFOVz
 oefMbJJnzwtRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F088ED44167;
 Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:19 +0100
MIME-Version: 1.0
Message-Id: <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=4093;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=1xROYlylzwH8UK0iKW6W31OAoU/xH+M2AeMY1t7N71A=;
 b=egKGCJN7L7SfDPwLAkt0D8PQm2WbSjgetnAwUx7ajU6wFMX7ZykF4MeT4vQGiic4QS3j4HY7g
 dukyTfF5/bgCfzXADaOQyoGgrz6ag4THqvIlg54jUjvEv7bGItftnQy
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 13/16] dt-bindings: net: Add DT bindings
 for DWMAC on NXP S32G/R SoCs
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
and S32R45 automotive series SoCs.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
 2 files changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
new file mode 100644
index 000000000000..a141e826a295
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2021-2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
+
+maintainers:
+  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
+
+description:
+  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
+  The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
+  the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
+  interface over Pinctrl device or the output can be routed
+  to the embedded SerDes for SGMII connectivity.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-dwmac
+      - items:
+        - enum:
+            - nxp,s32g3-dwmac
+            - nxp,s32r45-dwmac
+        - const: nxp,s32g2-dwmac
+
+  reg:
+    items:
+      - description: Main GMAC registers
+      - description: GMAC PHY mode control register
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: Main GMAC clock
+      - description: Transmit clock
+      - description: Receive clock
+      - description: PTP reference clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: tx
+      - const: rx
+      - const: ptp_ref
+
+required:
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ethernet@4033c000 {
+        compatible = "nxp,s32g2-dwmac";
+        reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
+              <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        snps,mtl-rx-config = <&mtl_rx_setup>;
+        snps,mtl-tx-config = <&mtl_tx_setup>;
+        clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
+        clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
+        phy-mode = "rgmii-id";
+        phy-handle = <&phy0>;
+
+        mtl_rx_setup: rx-queues-config {
+          snps,rx-queues-to-use = <5>;
+        };
+
+        mtl_tx_setup: tx-queues-config {
+          snps,tx-queues-to-use = <5>;
+        };
+
+        mdio {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          compatible = "snps,dwmac-mdio";
+
+          phy0: ethernet-phy@0 {
+            reg = <0>;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..a88d1c236eaf 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,9 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nxp,s32g2-dwmac
+        - nxp,s32g3-dwmac
+        - nxp,s32r-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
