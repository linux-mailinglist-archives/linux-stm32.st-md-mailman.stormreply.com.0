Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9476225A3C
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 10:40:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9FB9C36B30;
	Mon, 20 Jul 2020 08:40:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F14FC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 13:25:54 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
 (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0DDAB1C000C;
 Fri, 17 Jul 2020 13:25:49 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: robh+dt@kernel.org,
	devicetree@vger.kernel.org
Date: Fri, 17 Jul 2020 15:28:53 +0200
Message-Id: <20200717132859.237120-8-jacopo+renesas@jmondi.org>
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
Subject: [Linux-stm32] [PATCH 07/13] dt-bindings: media: ov5640: Remove
	clock-lanes
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

The ov5640 does not support routing the clock signal to a different
lane, and the property has value fixed to 0.

Remove the property from the bindings and update its users
accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 6 ------
 arch/arm/boot/dts/dra72-evm-common.dtsi                 | 1 -
 arch/arm/boot/dts/dra76-evm.dts                         | 1 -
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi           | 1 -
 arch/arm/boot/dts/imx6qdl-icore.dtsi                    | 1 -
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                | 1 -
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi                  | 1 -
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi               | 1 -
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts          | 1 -
 9 files changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 8fd54575a1db..5e1662e848bd 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -76,9 +76,6 @@ properties:
           bus-type:
             enum: [4, 5]

-          clock-lanes:
-            const: 0
-
           data-lanes:
             description: |
               Should be set to <1> or <1 2> (one or two CSI-2 lanes supported).
@@ -125,7 +122,6 @@ properties:
                 required:
                   - remote-endpoint
                   - bus-type
-                  - clock-lanes
                   - data-lanes

           - if:
@@ -134,7 +130,6 @@ properties:
                   const: 5
             then:
               properties:
-                clock-lanes: false
                 data-lanes: false
               required:
                 - remote-endpoint
@@ -182,7 +177,6 @@ examples:
                 ov5640_to_mipi_csi2: endpoint {
                     remote-endpoint = <&mipi_csi2_from_ov5640>;
                     bus-type = <4>;
-                    clock-lanes = <0>;
                     data-lanes = <1 2>;
                 };
             };
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index aba7eb55525d..b5b31dc927d4 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -288,7 +288,6 @@ port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index ddf16e65ec7f..6fcb96abc41d 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -421,7 +421,6 @@ port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
index dd5765778e87..a12d80a2403e 100644
--- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
@@ -275,7 +275,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
index 2b1f275b8cc4..05bd332f527b 100644
--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
@@ -214,7 +214,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
index 5752abb48e68..5eb7fbf33069 100644
--- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
@@ -383,7 +383,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index 990f4cc345da..02f78b46a8fd 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -314,7 +314,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 5c79ad5e7b5d..8c24fd468a22 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -628,7 +628,6 @@ camera_rear@3b {
 		port {
 			ov5640_ep: endpoint {
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 33f4eceffbe5..dd6a636ba3af 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -255,7 +255,6 @@ port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
--
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
