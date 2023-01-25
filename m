Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A667BC04
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:05:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B108C69057;
	Wed, 25 Jan 2023 20:05:45 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7E7EC69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:05:43 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-12c8312131fso22757119fac.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kqCnvG5HfBYMdFzmIrllsGYjZVwDWefqF05Cmky4HA=;
 b=V07zgGzS7j7HWpPUR6VitnHu+HSYewkwuKeDDkXWfEv3W78niJRmFkvnUoauFvue3H
 MFbGxRBrJwqSPVgPT6drKZ6GBYCszaeSg/9jI5bSacTFr9uX6tjT/sotlLsreCu/XTbj
 CuzbYTzGmnL1QHup2xClroy7OF4zJ9D0fF5FQmEzb6q1fMBPCO0ffgoesz7jBCLExwfk
 PF5zOaDtnvmaUKNe4YYWlAZuA5p1uZgBnzis2/kktCwHQB3ve5jzdXNOo8Q2NQn7rvN7
 7e2EhBD5yatys2lJWMb8GehpRt8xwSixHI6y+3InHJTNNh/4hMPuHwBBOqH6wwIq8B9F
 aybQ==
X-Gm-Message-State: AO0yUKXq9xLMeIm+wJ48nLwIxdB3M/hlLGY1LFVpTGc8pOuaprLBX+WP
 dNTH9p8b2HUv3WyZXvrHWQ==
X-Google-Smtp-Source: AK7set+KlYA9hOhKxY3yXbw1+jJFui+axb/K8qUGpNYSrXD6fL93Qjufe/ZRHNh9bIxZbHxYbUPr4A==
X-Received: by 2002:a05:6870:14d5:b0:163:45a2:e276 with SMTP id
 l21-20020a05687014d500b0016345a2e276mr684576oab.9.1674677142691; 
 Wed, 25 Jan 2023 12:05:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n20-20020a056870559400b0010d7242b623sm2325869oao.21.2023.01.25.12.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:05:42 -0800 (PST)
Received: (nullmailer pid 2768672 invoked by uid 1000);
 Wed, 25 Jan 2023 20:05:39 -0000
Date: Wed, 25 Jan 2023 14:05:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467713905.2768614.7865748447151198568.robh@kernel.org>
References: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
 <20230124083342.34869-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124083342.34869-2-krzysztof.kozlowski@linaro.org>
Cc: ", Bert Vermeulen" <bert@biot.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, ", Fabio Estevam" <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, linux-aspeed@lists.ozlabs.org,
 Anson Huang <Anson.Huang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Leilk Liu <leilk.liu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 openbmc@lists.ozlabs.org, Michal Simek <michal.simek@xilinx.com>,
 Haibo Chen <haibo.chen@nxp.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, ",
 Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 Birger Koblitz <mail@birger-koblitz.de>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Parshuram Thombare <pthombar@cadence.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Li-hao Kuo <lhjeff911@gmail.com>,
 Gabor Juhos <juhosg@openwrt.org>, Vaishnav Achath <vaishnav.a@ti.com>,
 Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] spi: dt-bindings: cleanup examples
 - indentation, lowercase hex
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


On Tue, 24 Jan 2023 09:33:42 +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au> # aspeed
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # meson
> 
> ---
> 
> Changes since v1:
> 1. Adjust indentation in two more examples (cdns,qspi-nor, st,stm32-spi)
> 2. Add tags
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>  .../bindings/spi/cdns,qspi-nor.yaml           |  34 ++--
>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml |  23 ++-
>  10 files changed, 176 insertions(+), 178 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
