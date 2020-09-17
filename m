Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FC26E130
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Sep 2020 18:53:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A00E9C32EA3;
	Thu, 17 Sep 2020 16:53:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D16E8C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 16:53:27 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39C1520708;
 Thu, 17 Sep 2020 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361605;
 bh=P6t4EObPuKTAtjmptm4+AFH+z1+4hhhtxhJjS4UyDF0=;
 h=From:To:Cc:Subject:Date:From;
 b=QWWMJnynLqLOQxMCeIhdb30C/fJHQKsRzanwLdTpwbhaMyXT+tXpbqbOYpkb+Ly2M
 aBumK6+zCHsWhNp6ZfqN5QXKUzl+nO1TwJgKiLkTRKlRiFxwyqIPdifsq9tCyheivp
 WIbwLhtE7vcm3MGDi0wpAwkD5yRasj8RADVLwNo8=
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
Date: Thu, 17 Sep 2020 18:52:48 +0200
Message-Id: <20200917165301.23100-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 00/13] gpio: add common dtschema
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

Hi,

Changes since v1
================
1. Use common schema in bindings outside of gpio/ (new patches).
2. Minor fixes - see individual patches for changelogs.


Notes
=====
This is independent work of pca953x bindings:
https://lore.kernel.org/lkml/20200916155715.21009-1-krzk@kernel.org/T/#u

The DTS patches can be also applied independently.
The bindings patches depend on first one, adding common schema.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  dt-bindings: gpio: add common schema for GPIO controllers
  dt-bindings: gpio: include common schema in GPIO controllers
  dt-bindings: gpio: pl061: add missing properties and include common
    schema
  dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6 and ARMv7 compatibles
  dt-bindings: gpio: fsl-imx-gpio: add gpio-line-names
  dt-bindings: gpio: gpio-vf610: fix iMX 7ULP compatible matching
  dt-bindings: media: include common schema in GPIO controllers
  dt-bindings: mfd: include common schema in GPIO controllers
  dt-bindings: pinctrl: include common schema in GPIO controllers
  ASoC: dt-bindings: zl38060: include common schema in GPIO controllers
  arm64: dts: imx8mq-librem5: correct GPIO hog property
  arm64: dts: imx8mq-librem5: align GPIO hog names with dtschema
  ARM: dts: imx: align GPIO hog names with dtschema

 .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    |   3 +
 .../bindings/gpio/fsl-imx-gpio.yaml           |  17 ++-
 .../devicetree/bindings/gpio/gpio-common.yaml | 125 ++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-mxs.yaml    |   4 +
 .../bindings/gpio/gpio-pca9570.yaml           |   3 +
 .../devicetree/bindings/gpio/gpio-rda.yaml    |   3 +
 .../devicetree/bindings/gpio/gpio-vf610.yaml  |  11 +-
 .../devicetree/bindings/gpio/mrvl-gpio.yaml   |   1 +
 .../devicetree/bindings/gpio/pl061-gpio.yaml  |   6 +
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      |   3 +
 .../bindings/gpio/renesas,em-gio.yaml         |   3 +
 .../bindings/gpio/renesas,rcar-gpio.yaml      |   3 +
 .../devicetree/bindings/gpio/sifive,gpio.yaml |   3 +
 .../bindings/gpio/snps,dw-apb-gpio.yaml       |   3 +
 .../gpio/socionext,uniphier-gpio.yaml         |   3 +
 .../bindings/gpio/xylon,logicvc-gpio.yaml     |   3 +
 .../bindings/media/i2c/maxim,max9286.yaml     |   3 +
 .../bindings/mfd/cirrus,madera.yaml           |   1 +
 .../devicetree/bindings/mfd/max77650.yaml     |   3 +
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |   3 +
 .../devicetree/bindings/mfd/st,stmfx.yaml     |   2 +
 .../devicetree/bindings/mfd/wlf,arizona.yaml  |   1 +
 .../pinctrl/actions,s500-pinctrl.yaml         |   3 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |   1 +
 .../bindings/pinctrl/cirrus,lochnagar.yaml    |   3 +
 .../bindings/pinctrl/ingenic,pinctrl.yaml     |   3 +
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |   3 +
 .../bindings/pinctrl/pinctrl-mt8192.yaml      |   3 +
 .../pinctrl/qcom,ipq6018-pinctrl.yaml         |   3 +
 .../pinctrl/qcom,msm8226-pinctrl.yaml         |   3 +
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml |   3 +
 .../pinctrl/renesas,rza2-pinctrl.yaml         |   3 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |   3 +
 .../devicetree/bindings/sound/zl38060.yaml    |   3 +
 arch/arm/boot/dts/imx51-zii-rdu1.dts          |   2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi       |   8 +-
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts   |   2 +-
 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   4 +-
 38 files changed, 245 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-common.yaml

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
