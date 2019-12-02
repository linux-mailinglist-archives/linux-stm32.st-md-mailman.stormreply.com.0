Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D36E910F05D
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2019 20:33:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EE63C36B10;
	Mon,  2 Dec 2019 19:33:47 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 618F2C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2019 19:33:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id DC0E4290514
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org
Date: Mon,  2 Dec 2019 21:33:59 +0200
Message-Id: <20191202193359.703709-5-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191202193359.703709-1-adrian.ratiu@collabora.com>
References: <20191202193359.703709-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@collabora.com
Subject: [Linux-stm32] [PATCH v4 4/4] dt-bindings: display: add i.MX6 MIPI
	DSI host controller doc
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

This provides an example DT binding for the MIPI DSI host controller
present on the i.MX6 SoC based on Synopsis DesignWare v1.01 IP.

Cc: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 .../display/imx/fsl,mipi-dsi-imx6.yaml        | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
new file mode 100644
index 000000000000..8c9603c28240
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/fsl,mipi-dsi-imx6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX6 DW MIPI DSI Host Controller
+
+description:
+  The DSI host controller is a Synopsys DesignWare MIPI DSI v1.01 IP with a companion PHY IP.
+
+  These DT bindings follow the Synopsys DW MIPI DSI bindings defined in
+  Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt with
+  the following device-specific properties.
+
+properties:
+  compatible:
+    const: [ "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi" ]
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+      - description: DSI bus clock
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: ref
+    minItems: 2
+    maxItems: 2
+
+  fsl,gpr:
+    description: Phandle to the iomuxc-gpr region containing the multiplexer control register.
+    const: *gpr
+
+  ports:
+    type: object
+    description:
+      A node containing DSI input & output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+    properties:
+      port@0:
+        type: object
+        description:
+          DSI input port node, connected to the ltdc rgb output port.
+
+      port@1:
+        type: object
+        description:
+          DSI output port node, connected to a panel or a bridge input port"
+
+patternProperties:
+  "^(panel|panel-dsi)@[0-9]$":
+    type: object
+    description:
+      A node containing the panel or bridge description as documented in
+      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+    properties:
+      port:
+        type: object
+        description:
+          Panel or bridge port node, connected to the DSI output port (port@1)
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi: dsi@21e0000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
+        reg = <0x021e0000 0x4000>;
+        interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
+        fsl,gpr = <&gpr>;
+        clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
+                 <&clks IMX6QDL_CLK_MIPI_IPG>;
+        clock-names = "ref", "pclk";
+
+        ports {
+            port@0 {
+                reg = <0>;
+                dsi_in: endpoint {
+                    remote-endpoint = <&ltdc_ep1_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsi_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+
+        panel@0 {
+            compatible = "sharp,ls032b3sx01";
+            reg = <0>;
+            reset-gpios = <&gpio6 8 GPIO_ACTIVE_LOW>;
+
+            ports {
+                port@0 {
+                    panel_in: endpoint {
+                        remote-endpoint = <&dsi_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.24.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
