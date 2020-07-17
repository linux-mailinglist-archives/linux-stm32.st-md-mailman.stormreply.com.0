Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F1E225A3B
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 10:40:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B936C36B2D;
	Mon, 20 Jul 2020 08:40:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D5CC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 13:25:48 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
 (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9746A1C000D;
 Fri, 17 Jul 2020 13:25:42 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: robh+dt@kernel.org,
	devicetree@vger.kernel.org
Date: Fri, 17 Jul 2020 15:28:51 +0200
Message-Id: <20200717132859.237120-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jul 2020 08:40:53 +0000
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Tero Kristo <t-kristo@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, slongerbeam@gmail.com,
 linux-media@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH 05/13] dt-bindings: media: ov5640: Make
	bus-type mandatory
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

The ov5640 driver supports both a parallel data interface and a
CSI-2 serial data interface.

Depending on which interface is in use, the required endpoint
properties are different. In order to be able to validate if a
device node is compliant with the dt-schema bindings, start by
making the bus-type a mandatory property, and add it to all the
existing users of ov5640 in mainline DTS.

On top of this, endpoint properties validation will be implemented,
conditionally to the reported bus type.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml    | 6 ++++++
 arch/arm/boot/dts/dra72-evm-common.dtsi                    | 1 +
 arch/arm/boot/dts/dra76-evm.dts                            | 1 +
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi              | 1 +
 arch/arm/boot/dts/imx6qdl-icore.dtsi                       | 1 +
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                   | 1 +
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi                     | 1 +
 arch/arm/boot/dts/stm32mp157c-ev1.dts                      | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts       | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                  | 1 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts             | 1 +
 12 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 503f8b78615c..16e6c2dc629a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -73,6 +73,9 @@ properties:
           remote-endpoint:
             description: A phandle to the bus receiver's endpoint node.

+          bus-type:
+            enum: [4, 5]
+
           clock-lanes:
             const: 0

@@ -109,6 +112,7 @@ properties:

         required:
           - remote-endpoint
+          - bus-type

     additionalProperties: false

@@ -146,6 +150,7 @@ examples:
             port {
                 ov5640_to_mipi_csi2: endpoint {
                     remote-endpoint = <&mipi_csi2_from_ov5640>;
+                    bus-type = <4>;
                     clock-lanes = <0>;
                     data-lanes = <1 2>;
                 };
@@ -172,6 +177,7 @@ examples:
             port {
                 ov5640_to_parallel: endpoint {
                     remote-endpoint = <&parallel_from_ov5640>;
+                    bus-type = <5>;
                     bus-width = <10>;
                 };
             };
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index c84b63bf0fc8..aba7eb55525d 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -287,6 +287,7 @@ ov5640@3c {
 		port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 820a0ece20d4..ddf16e65ec7f 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -420,6 +420,7 @@ ov5640@3c {
 		port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
index 9e027b9a5f91..dd5765778e87 100644
--- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
@@ -274,6 +274,7 @@ ov5640: camera@10 {
 		port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
index 756f3a9f1b4f..2b1f275b8cc4 100644
--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
@@ -213,6 +213,7 @@ ov5640: camera@3c {
 		port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
index 8468216dae9b..5752abb48e68 100644
--- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
@@ -382,6 +382,7 @@ ov5640: camera@40 {
 		port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index 28b35ccb3757..990f4cc345da 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -313,6 +313,7 @@ rev B board is VGEN5 */
 		port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index b19056557ef0..613ede73b65b 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -190,6 +190,7 @@ ov5640: camera@3c {
 		port {
 			ov5640_0: endpoint {
 				remote-endpoint = <&dcmi_0>;
+				bus-type = <5>;
 				bus-width = <8>;
 				data-shift = <2>; /* lines 9:2 are used */
 				hsync-active = <0>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
index c7bd73f35ed8..6ef528bb5564 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
@@ -46,6 +46,7 @@ ov5640: camera@3c {
 			port {
 				ov5640_ep: endpoint {
 					remote-endpoint = <&csi_ep>;
+					bus-type = <5>;
 					bus-width = <8>;
 					hsync-active = <1>; /* Active high */
 					vsync-active = <0>; /* Active low */
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
index dc4ab6b434f9..8ebd6547786e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
@@ -61,6 +61,7 @@ ov5640: camera@3c {
 			port {
 				ov5640_ep: endpoint {
 					remote-endpoint = <&csi_ep>;
+					bus-type = <5>;
 					bus-width = <8>;
 					hsync-active = <1>; /* Active high */
 					vsync-active = <0>; /* Active low */
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index fe6613676e45..5c79ad5e7b5d 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -627,6 +627,7 @@ camera_rear@3b {

 		port {
 			ov5640_ep: endpoint {
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 2f3d3316a1cf..33f4eceffbe5 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -254,6 +254,7 @@ ov5640@3c {
 		port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
+				bus-type = <4>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
--
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
