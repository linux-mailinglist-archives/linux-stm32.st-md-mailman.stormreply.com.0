Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F96BF8BD
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 08:59:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 566A4C6907C;
	Sat, 18 Mar 2023 07:59:10 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24825C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 07:59:09 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id cy23so28501377edb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679126348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GezqDX/ePqvpjZIuKIvbpmkWxRTWWY79otLLtVmi4uI=;
 b=MIo4FysqEObPhPrO5ovWEj/Y+fjZ+JHzDeLwvK2p1XLlCl43vYotPoQU5pTbqrDxfO
 cRK5WXQ9/E6U9BOSrRCKrVesqIQxIokI8jXR4Pie7uaeBDSBqAznP6Q64if4WSxEJ2/Q
 uaVGKBSsK5sOOnPS9sxtLbC2d64pZEN5w6OdRlSecJd620C0phrsybcJEqvTR1GIeGXH
 jrvrrIxlcw8pcjROtkJdwn3pzJYizNDhLUUSwmK3KPW2B3ro+jym3U4lB+XNUqHSJAyJ
 jrjd4OKlrIikF7TcfJa3H13regSRB3FGldUrSL21tPAIM7UO29D1CGM30oEb9xKHwwoV
 S1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679126348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GezqDX/ePqvpjZIuKIvbpmkWxRTWWY79otLLtVmi4uI=;
 b=ZUBRcpZ3j7Et1yd1sppVLNJnPkamyn58KOV1E+c8kzXyDkQ2f0QwPMvKx6D0IOTJ39
 eWHQ9bi9471h/HhyaW7wWQosPjBcGCQu+G+Ay/Jqp5yAkuccICqUStZjf7CklkMrHrM7
 GmQ7RJbOSF/aNg/qJ3EG2DyKTDxJuyX1eYLMgXdZlJCmTiVhvOHG5mRt+i4xAOuJNokj
 U/Us8ye3kGrEaDLMaHggl/4UVx0BmnX66l8E4PVfJuWpmTFRl2x+whNpEWAemc/5MDM1
 Nc+H5jgoPGBwjztrfpLFeAGqQJ0IcNZi2mrI6/t5YrPgjVGg1jtk3o9Q1KcnfKo272qD
 al7Q==
X-Gm-Message-State: AO0yUKVwy0rAFl2pFfeAK8Tyigzv/YnBcxUmVQWIAjmIy8DkOlUK9qjF
 yCOQlF+ouE+Hql1siBzTHWA=
X-Google-Smtp-Source: AK7set9nT9qNsfgktXgC9t9HagqTbjcAEspAFTOqh7EcN3bos4Xtz1AewsGVVMnDSG+mVDFOgXgh3g==
X-Received: by 2002:a17:907:20e3:b0:926:8992:4310 with SMTP id
 rh3-20020a17090720e300b0092689924310mr2058754ejb.38.1679126348548; 
 Sat, 18 Mar 2023 00:59:08 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 i6-20020a170906250600b009306be6bed7sm1842624ejb.190.2023.03.18.00.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 00:59:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh@kernel.org>
Date: Sat, 18 Mar 2023 08:59:04 +0100
Message-ID: <1846135.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
References: <20230317233623.3968172-1-robh@kernel.org>
MIME-Version: 1.0
X-Topics: 
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
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

Dne sobota, 18. marec 2023 ob 00:36:18 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pinctrl/actions,s500-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml     |  2 +-
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml       |  4 ++--
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml       |  4 ++--
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  6 +++---
>  .../bindings/pinctrl/brcm,bcm6318-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm63268-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/brcm,bcm6328-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6358-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6362-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6368-pinctrl.yaml         |  2 +-
>  .../devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml    |  2 +-
>  .../devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  2 +-
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml     |  4 ++--
>  .../devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml  |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml |  2 +-
>  .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml          |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx93-pinctrl.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/ingenic,pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/intel,lgm-io.yaml      |  2 +-
>  .../bindings/pinctrl/marvell,ac5-pinctrl.yaml          |  4 ++--
>  .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt8188-pinctrl.yaml      |  2 +-
>  .../bindings/pinctrl/mediatek,pinctrl-mt6795.yaml      |  4 ++--
>  .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml          |  6 +++---
>  .../devicetree/bindings/pinctrl/pinctrl-mt8186.yaml    |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml     |  4 ++--
>  .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         |  2 +-
>  .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml         |  2 +-
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml  |  2 +-
>  .../bindings/pinctrl/ralink,mt7620-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,mt7621-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml        |  2 +-
>  .../devicetree/bindings/pinctrl/renesas,pfc.yaml       |  2 +-
>  .../bindings/pinctrl/renesas,rza1-ports.yaml           |  2 +-
>  .../bindings/pinctrl/renesas,rza2-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-
>  .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml  | 10 +++++-----
>  .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/semtech,sx1501q.yaml   |  6 +++---
>  .../bindings/pinctrl/socionext,uniphier-pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml  | 10 +++++-----
>  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml       |  6 +++---
>  .../bindings/pinctrl/toshiba,visconti-pinctrl.yaml     |  8 ++++----
>  .../devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml |  2 +-
>  60 files changed, 97 insertions(+), 97 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
