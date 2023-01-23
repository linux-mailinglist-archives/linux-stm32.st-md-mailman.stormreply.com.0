Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E367877A
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 21:18:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06CA1C65E71;
	Mon, 23 Jan 2023 20:18:54 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69B40C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 20:18:52 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id r132so11403512oif.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9TsVviuOODJWqPa0qVN9YfAyBsPjmf84LKhNhzNHe4=;
 b=b+RXImIRFCLUDbmA3sFZUWSV333XriHANGJu+OepcXZVPlKZcpGwJ6YKhnEWSQFhIx
 bY8sutD1LVd3SkQ2bopbQZ0mjHnzRdH34gttrBkXMOLu+W0ST4Gh9fdO7sAMtP7Y8wTg
 c1lk1l+w7Gja7C1diFjql52FK8j9xLg+IsBISb1qhuc5cEKrRdPcL9ILNxcr/QLmpE4m
 +ZSy6x0q76HjZsV2q1HU3FXyQMWFyKdLuRQxWXnmaNkl8EON4S3X0Txt161gpfPwSWK1
 jOARz0wrp40FK8FJA3FjK2ueG2p3c5VYRd7OHJR7l80Icqdg7G1+5wladhzO2mi2oe0a
 3UTQ==
X-Gm-Message-State: AFqh2kqHYxOpKiQm0W7DhmwxWQHZGOWbKSm3F66jKmyXXcqvHiWYsYsY
 U96siPvXk8WKQa59TYrOVyUcejOBPg==
X-Google-Smtp-Source: AMrXdXt5T2+J150uc85qX/a/e7OoRAT8w8CmhGAUYbfvTzt6sNah2y7/iS9iRApYVIYYdn6OfeHWPg==
X-Received: by 2002:a05:6808:280b:b0:36e:c24b:85f5 with SMTP id
 et11-20020a056808280b00b0036ec24b85f5mr5096100oib.22.1674505131237; 
 Mon, 23 Jan 2023 12:18:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g16-20020a9d6490000000b00684e09b43bdsm105528otl.13.2023.01.23.12.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 12:18:50 -0800 (PST)
Received: (nullmailer pid 2455776 invoked by uid 1000);
 Mon, 23 Jan 2023 20:18:48 -0000
Date: Mon, 23 Jan 2023 14:18:48 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167450512824.2455711.11173604781836638882.robh@kernel.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Debbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Samuel Holland <samuel@sholland.org>,
 Viresh Kumar <vireshk@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Long Cheng <long.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 - <chuanhua.lei@intel.com>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Green Wan <green.wan@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Rajesh Gumasta <rgumasta@nvidia.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Hector Martin <marcan@marcan.st>, Biju Das <biju.das.jz@bp.renesas.com>,
 Andy Gross <agross@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
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


On Wed, 18 Jan 2023 19:01:43 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml        | 2 +-
>  .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
>  .../devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml        | 2 +-
>  Documentation/devicetree/bindings/dma/altr,msgdma.yaml          | 2 +-
>  Documentation/devicetree/bindings/dma/apple,admac.yaml          | 2 +-
>  Documentation/devicetree/bindings/dma/arm-pl08x.yaml            | 2 +-
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml             | 2 +-
>  Documentation/devicetree/bindings/dma/ingenic,dma.yaml          | 2 +-
>  Documentation/devicetree/bindings/dma/intel,ldma.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml    | 2 +-
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml        | 2 +-
>  Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml | 2 +-
>  Documentation/devicetree/bindings/dma/owl-dma.yaml              | 2 +-
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml             | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml    | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml      | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml  | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml     | 2 +-
>  .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml   | 2 +-
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml     | 2 +-
>  .../devicetree/bindings/dma/socionext,uniphier-mio-dmac.yaml    | 2 +-
>  .../devicetree/bindings/dma/socionext,uniphier-xdmac.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml      | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml        | 2 +-
>  Documentation/devicetree/bindings/dma/stericsson,dma40.yaml     | 2 +-
>  30 files changed, 30 insertions(+), 30 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
