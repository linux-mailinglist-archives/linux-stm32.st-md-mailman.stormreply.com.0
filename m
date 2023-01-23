Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB44678762
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 21:17:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC22CC65E71;
	Mon, 23 Jan 2023 20:17:56 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6A57C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 20:17:55 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id o66so11422729oia.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EY7We4I2hSyd2pZ0VulkHT4dyOP0LEqk/GnlS4AQK4k=;
 b=7F3SPAitJYWKVyL3WoU92uQwSkiJ8352OxVN1bLHQ9XwJ6x8yd+AXpFApN9bZSllOf
 kiJIIBNqAzSnWSabJ7rCWeEiGBdtn8HlywOk+sm7D1sjlRldcxPQGchoXOxrSpjWxEAl
 0GXNKYPd9qGbDzMlcHVJNfurbYnSJFXo3wBkRyQfWmSSLElJjRGP9KBjSQEo8n0uSsrQ
 SkRlGDGuSHLqDjmjkemwXbjrqpM2xyH2CPljY+4BByGZTHWYya6oUFKCHwg4vIpJg4Im
 4iT5tkzMPyLJjYsnXXcOAql22e8aa9dJYaCQ30dg4Tn9buq32GtRO/oZ1e4QfpS+755Y
 QTBw==
X-Gm-Message-State: AFqh2kon8SANG8hU0S7An1er9HZBK+6+DY/ch+wTIkAombwlb5Px0jlQ
 wC18H8hT2CP9kicuZXIkyQ==
X-Google-Smtp-Source: AMrXdXuvPUKWyC8RGNKpvhdFpfXGmbs7xnQ1zVyMxDHfPRH77j6ghKDaBa0O8cM4huncdcgY7ZWv7g==
X-Received: by 2002:a05:6808:f14:b0:364:e9f4:9dd with SMTP id
 m20-20020a0568080f1400b00364e9f409ddmr15059505oiw.47.1674505074502; 
 Mon, 23 Jan 2023 12:17:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i11-20020aca2b0b000000b00369a721732asm124660oik.41.2023.01.23.12.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 12:17:54 -0800 (PST)
Received: (nullmailer pid 2454148 invoked by uid 1000);
 Mon, 23 Jan 2023 20:17:51 -0000
Date: Mon, 23 Jan 2023 14:17:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230123201751.GA2450665-robh@kernel.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Cc: Bert Vermeulen <bert@biot.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Gabor Juhos <juhosg@openwrt.org>,
 Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 linux-aspeed@lists.ozlabs.org, Anson Huang <Anson.Huang@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Leilk Liu <leilk.liu@mediatek.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-amlogic@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>, linux-tegra@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Li-hao Kuo <lhjeff911@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Birger Koblitz <mail@birger-koblitz.de>,
 Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-sunxi@lists.linux.dev, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] spi: dt-bindings: cleanup examples -
 indentation, lowercase hex
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

On Wed, Jan 18, 2023 at 06:39:32PM +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>  .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>  10 files changed, 150 insertions(+), 152 deletions(-)

[...]

> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index d35c6f7e2dd5..18afdaab946d 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -95,7 +95,6 @@ examples:
>               <&dmamux1 1 40 0x400 0x05>;
>        dma-names = "rx", "tx";
>        cs-gpios = <&gpioa 11 0>;

Looks like the indentation needs adjusting here.

> -
>      };
>  
>  ...
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
