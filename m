Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71216678789
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 21:20:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BD88C65E72;
	Mon, 23 Jan 2023 20:20:15 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36C61C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 20:20:14 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 g2-20020a9d6b02000000b006864bf5e658so8032178otp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJIseX7fbuePlCt3lfYMHgc5yPjn6sJZXZh9GvE7Yuk=;
 b=bSi3YHUI1DEhzsXbgG9pTxkqRIPH/K2AyUDW93b5nnYkle9Ldk2EPd/6vPRtLUSpvP
 SB3xjkYlw0dShHf6Hn6iwX4mTI7/RICRGD8QwjWjYEhHuCgxnBHfwL1Zv5vXUHGD0AeW
 Kj/ufpc+ydDwDh8uRocqpz5sM4RGEoCOQK6I7OCKAIA3SvqaYHgUosqVv2ZfDSd0HNHG
 +S82cRu1fzVDmDzxRH+QKZzx8lSaBF/8ZHXUu0mSYaREHK1JtdI7e3E5ATJxi+nXjsI/
 RnTa9HKUQNq/WOybcWxvwuZG22jb7WSBRRKf+Hc1DcB8OohxoqSRQXXpIpHybQn2J/Bo
 HaDw==
X-Gm-Message-State: AFqh2kq1H+nkvzCEgrTnTxHc4Zb5ebwWvjG29hfoIdh0qCY+uJLaiFoe
 vUuZ9m6KE2zlUn50ARjKwA==
X-Google-Smtp-Source: AMrXdXtXo7dsxEuvQDVOZCdjfJoyKEoO2vYkeou3j0fcHEiMdz4hYCE8ilnCls8sDDy5APHHbusT7w==
X-Received: by 2002:a9d:370:0:b0:66c:dd2b:e1ad with SMTP id
 103-20020a9d0370000000b0066cdd2be1admr23494564otv.23.1674505212954; 
 Mon, 23 Jan 2023 12:20:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x17-20020a9d6291000000b00677714a440fsm52560otk.81.2023.01.23.12.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 12:20:12 -0800 (PST)
Received: (nullmailer pid 2457598 invoked by uid 1000);
 Mon, 23 Jan 2023 20:20:10 -0000
Date: Mon, 23 Jan 2023 14:20:10 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230123202010.GA2455859-robh@kernel.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
 <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Debbelt <palmer@sifive.com>,
 Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Samuel Holland <samuel@sholland.org>,
 Viresh Kumar <vireshk@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, =?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, devicetree@vger.kernel.org, - <chuanhua.lei@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, Green Wan <green.wan@sifive.com>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Long Cheng <long.cheng@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Rajesh Gumasta <rgumasta@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: dma: cleanup examples -
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

On Wed, Jan 18, 2023 at 07:01:44PM +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - use lowercase hex.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
>  .../bindings/dma/stericsson,dma40.yaml        |  4 +--
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 2bedab1f74e0..d34d0fa62ab5 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -113,21 +113,21 @@ additionalProperties: false
>  
>  examples:
>    - |
> -     #include <dt-bindings/interrupt-controller/arm-gic.h>
> -     #include <dt-bindings/interrupt-controller/irq.h>
> -     /* example with snps,dw-axi-dmac */
> -     dmac: dma-controller@80000 {
> -         compatible = "snps,axi-dma-1.01a";
> -         reg = <0x80000 0x400>;
> -         clocks = <&core_clk>, <&cfgr_clk>;
> -         clock-names = "core-clk", "cfgr-clk";
> -         interrupt-parent = <&intc>;
> -         interrupts = <27>;
> -         #dma-cells = <1>;
> -         dma-channels = <4>;
> -         snps,dma-masters = <2>;
> -         snps,data-width = <3>;
> -         snps,block-size = <4096 4096 4096 4096>;
> -         snps,priority = <0 1 2 3>;
> -         snps,axi-max-burst-len = <16>;
> -     };
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    /* example with snps,dw-axi-dmac */
> +    dmac: dma-controller@80000 {

Drop unused labels while you are here.

> +        compatible = "snps,axi-dma-1.01a";
> +        reg = <0x80000 0x400>;
> +        clocks = <&core_clk>, <&cfgr_clk>;
> +        clock-names = "core-clk", "cfgr-clk";
> +        interrupt-parent = <&intc>;
> +        interrupts = <27>;
> +        #dma-cells = <1>;
> +        dma-channels = <4>;
> +        snps,dma-masters = <2>;
> +        snps,data-width = <3>;
> +        snps,block-size = <4096 4096 4096 4096>;
> +        snps,priority = <0 1 2 3>;
> +        snps,axi-max-burst-len = <16>;
> +    };
> diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> index 664ee61a00d8..57395a810719 100644
> --- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> +++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> @@ -147,9 +147,9 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/mfd/dbx500-prcmu.h>
> -    dma-controller@801C0000 {
> +    dma-controller@801c0000 {
>        compatible = "stericsson,db8500-dma40", "stericsson,dma40";
> -      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
> +      reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
>        reg-names = "base", "lcpa";
>        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>        #dma-cells = <3>;

Indentation?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
