Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67E26E137
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Sep 2020 18:54:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3124AC32EA9;
	Thu, 17 Sep 2020 16:54:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A020C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 16:54:00 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E0AE2078D;
 Thu, 17 Sep 2020 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361639;
 bh=GtFv1bQ2EU3MwleV0JE6I8vR62sturzYAF1oB7cn/SA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YM6mlUDG5hyxYr2PjQI9LyR9rTPvZdnNnIn9xvWCqJYk3nDtgx1zXa2CAXZWc9yob
 /G/0a0BLDvjNoWd2WFFzBWb3eT/SflJkTQOhMvxAAeOFo6x5eFDXyOkI4psvphsJUd
 mLsI8+P+uKyKX+cvfUUutZdxrHH+134Z22gFqYwI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 - <patches@opensource.cirrus.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Andy Teng <andy.teng@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sricharan R <sricharan@codeaurora.org>,
 Chris Brandt <chris.brandt@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Sep 2020 18:52:50 +0200
Message-Id: <20200917165301.23100-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917165301.23100-1-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 02/13] dt-bindings: gpio: include common
	schema in GPIO controllers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Include the common GPIO schema in GPIO controllers to be sure all common
properties are properly validated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix gpio-mxs.yaml
2. Add snps,dw-apb-gpio.yaml
---
 .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml         | 3 +++
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml      | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml          | 4 ++++
 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml      | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-rda.yaml          | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml        | 3 +++
 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml         | 1 +
 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml | 3 +++
 Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml    | 3 +++
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 3 +++
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml       | 3 +++
 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml  | 3 +++
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml     | 3 +++
 .../devicetree/bindings/gpio/xylon,logicvc-gpio.yaml          | 3 +++
 14 files changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
index c213cb9ddb9f..1ac69b9c03f9 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
@@ -13,6 +13,9 @@ description: |
   This controller is the Chip Common A GPIO present on a number of Broadcom
   switch ASICs with integrated SoCs.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: brcm,iproc-gpio-cca
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index de0b9b5f6a70..737756e081fb 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -9,6 +9,9 @@ title: Freescale i.MX/MXC GPIO controller
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index dfa1133f8c5e..bd0c4f329625 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -34,6 +34,10 @@ properties:
 patternProperties:
   "gpio@[0-9]+$":
     type: object
+
+    allOf:
+      - $ref: gpio-common.yaml#
+
     properties:
       compatible:
         enum:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 338c5312a106..69b12041c893 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -9,6 +9,9 @@ title: PCA9570 I2C GPO expander
 maintainers:
   - Sungbo Eo <mans0n@gorani.run>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
index 6ece555f074f..d70c99f463c2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
@@ -9,6 +9,9 @@ title: RDA Micro GPIO controller
 maintainers:
   - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: rda,8810pl-gpio
diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 6ac5a78ad3da..82f3e4b407d1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -17,6 +17,9 @@ description: |
   Note: Each GPIO port should have an alias correctly numbered in "aliases"
   node.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
index 4db3b8a3332c..e2b7d2d133a8 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -12,6 +12,7 @@ maintainers:
   - Rob Herring <robh+dt@kernel.org>
 
 allOf:
+  - $ref: gpio-common.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
index 32a566ec3558..2eee374e8396 100644
--- a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -13,6 +13,9 @@ description: |
   Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
   gpio controller to control 5 gpios on the chip.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
index 8bdef812c87c..845689807678 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
@@ -9,6 +9,9 @@ title: Renesas EMMA Mobile General Purpose I/O Interface
 maintainers:
   - Magnus Damm <magnus.damm@gmail.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: renesas,em-gio
diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 5026662e4508..c116000d579f 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -9,6 +9,9 @@ title: Renesas R-Car General-Purpose Input/Output Ports (GPIO)
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index a0efd8dc2538..f2d93b40fc7e 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Yash Shah <yash.shah@sifive.com>
   - Paul Walmsley <paul.walmsley@sifive.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     items:
diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index b391cc1b4590..459aafe5fd47 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -49,6 +49,9 @@ properties:
 patternProperties:
   "^gpio-(port|controller)@[0-9a-f]+$":
     type: object
+    allOf:
+      - $ref: gpio-common.yaml#
+
     properties:
       compatible:
         const: snps,dw-apb-gpio-port
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index c58ff9a94f45..94a911e9c313 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -9,6 +9,9 @@ title: UniPhier GPIO controller
 maintainers:
   - Masahiro Yamada <yamada.masahiro@socionext.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   $nodename:
     pattern: "^gpio@[0-9a-f]+$"
diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
index a36aec27069c..0e4581241b3f 100644
--- a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
@@ -23,6 +23,9 @@ description: |
   - EN_VEE (power control) mapped to index 7
   - V_EN (power control) mapped to index 8
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   $nodename:
     pattern: "^gpio@[0-9a-f]+$"
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
