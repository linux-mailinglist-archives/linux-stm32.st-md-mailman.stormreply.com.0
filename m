Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F62100820
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Nov 2019 16:25:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97FC0C36B16;
	Mon, 18 Nov 2019 15:25:10 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CEA7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2019 15:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 9907428E105
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Date: Mon, 18 Nov 2019 17:25:18 +0200
Message-Id: <20191118152518.3374263-5-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Cc: Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@collabora.com
Subject: [Linux-stm32] [PATCH v3 4/4] dt-bindings: display: add IMX MIPI DSI
	host controller doc
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

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 .../bindings/display/imx/mipi-dsi.txt         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/mipi-dsi.txt

diff --git a/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt b/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt
new file mode 100644
index 000000000000..3f05c32ef963
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt
@@ -0,0 +1,56 @@
+Freescale i.MX6 DW MIPI DSI Host Controller
+===========================================
+
+The DSI host controller is a Synopsys DesignWare MIPI DSI v1.01 IP
+with a companion PHY IP.
+
+These DT bindings follow the Synopsys DW MIPI DSI bindings defined in
+Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt with
+the following device-specific properties.
+
+Required properties:
+
+- #address-cells: Should be <1>.
+- #size-cells: Should be <0>.
+- compatible: "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi".
+- reg: See dw_mipi_dsi.txt.
+- interrupts: The controller's CPU interrupt.
+- clocks, clock-names: Phandles to the controller's pll reference
+  clock(ref) and APB clock(pclk), as described in [1].
+- ports: a port node with endpoint definitions as defined in [2].
+- gpr: Should be <&gpr>.
+       Phandle to the iomuxc-gpr region containing the multiplexer
+       control register.
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	mipi_dsi: mipi@21e0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x021e0000 0x4000>;
+		interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
+		gpr = <&gpr>;
+		clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
+			 <&clks IMX6QDL_CLK_MIPI_IPG>;
+		clock-names = "ref", "pclk";
+		status = "okay";
+
+		ports {
+			port@0 {
+				reg = <0>;
+				mipi_mux_0: endpoint {
+					remote-endpoint = <&ipu1_di0_mipi>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				mipi_mux_1: endpoint {
+					remote-endpoint = <&ipu1_di1_mipi>;
+				};
+			};
+		};
+        };
-- 
2.24.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
