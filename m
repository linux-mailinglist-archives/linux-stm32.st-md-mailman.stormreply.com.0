Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 914EA673E9D
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 17:23:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24C25C6904C;
	Thu, 19 Jan 2023 16:23:47 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86616C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 16:23:45 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i4so1753867wrs.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 08:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+PcC7y3FS+HA6LTR16Kak4eGsTRhnH7QRvBCszT9C5U=;
 b=OWsZGZ11elP4SzbvFuPicIoLtQvQgdqjQHT0EUCq9YSbAvdwb9nvSo63kZNE5WYSMb
 m3bYZzWWZkK2BFpF7AI1la1QPxmBW5+32EJ6oMNgNGbtLQuhMW2srvFFT4yNQKmcCT+a
 1WKMbYW2N3hrUWZfoPBhHCUW/l0AHVY5YVa28nF+GHGTFYlx286xt3wzPq6YYUtC0cM/
 thGP4Mgb8c19/HobPxN1HeBnO3RDu+oLrGGCnPhlkj2DXA9O2wa49uO8sf/45240GSof
 YBXM7bXnJndVD1ceuTWCkL1u5eAbfyMuhx2ZmZwlxs9cfmodBlu1zkyJnGZU1iqX3jmw
 ctqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+PcC7y3FS+HA6LTR16Kak4eGsTRhnH7QRvBCszT9C5U=;
 b=ac8wxxDFVifJZq2e1SFqtvLhIhJT0f63g7hApwv7jAeEHUpaLG3fwVZNR1BeOnS69A
 gThB0WFK46FKfx3pDP3y/064FADXjoo7bTFeSyfJ3LARwrHgKB3fILolebiNQwgFB9yY
 oJPMcK14lQ6XCfLj0cQnd1kMKLKBZQKOGryLrfy+abrbvw71lFbQdMmoH39N272tvUAs
 TsSoQqdnbxbTf5Ccv+9n86/rry2b5GmzvRizjpV7NgjF2zMez6UbYALvAeoXLTYTEtcp
 SJwuz0DmLer/jaMeB0cdZRNstTPHKlzz84QNYjj7THVAM9Oa528wkHUvqQhxYQWEyhkI
 mVcQ==
X-Gm-Message-State: AFqh2koqAr99eQDb5mRI3ZO4Y96M91FpvR01lxoX3Hhi6gAKqSpMQKsV
 fmbCMWkqL75ady6qXMBm5rk=
X-Google-Smtp-Source: AMrXdXtIzYjj/CzYqkow+WPiYOG8ccH53zjNKZrQ2FyPIsv67Z3n3uwh+vn0p8V5ULjrCdWWyoakDg==
X-Received: by 2002:adf:f18e:0:b0:2bd:e8bd:79ce with SMTP id
 h14-20020adff18e000000b002bde8bd79cemr9683654wro.20.1674145424906; 
 Thu, 19 Jan 2023 08:23:44 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 b10-20020adfe64a000000b00287da7ee033sm34552910wrn.46.2023.01.19.08.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:23:44 -0800 (PST)
Message-ID: <b9f20fce-9091-27ab-11c3-0670835ce0e7@gmail.com>
Date: Thu, 19 Jan 2023 17:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>, Stefan Roese
 <sr@denx.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Green Wan <green.wan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?77+9ZXI=?=
 <povik+lin@cutebit.org>, Peng Fan <peng.fan@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, - <chuanhua.lei@intel.com>,
 Long Cheng <long.cheng@mediatek.com>, Rajesh Gumasta <rgumasta@nvidia.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Palmer Debbelt
 <palmer@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 18/01/2023 19:01, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml        | 2 +-
>   .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
>   .../devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml        | 2 +-
>   Documentation/devicetree/bindings/dma/altr,msgdma.yaml          | 2 +-
>   Documentation/devicetree/bindings/dma/apple,admac.yaml          | 2 +-
>   Documentation/devicetree/bindings/dma/arm-pl08x.yaml            | 2 +-
>   Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>   Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-
>   Documentation/devicetree/bindings/dma/fsl,edma.yaml             | 2 +-
>   Documentation/devicetree/bindings/dma/ingenic,dma.yaml          | 2 +-
>   Documentation/devicetree/bindings/dma/intel,ldma.yaml           | 2 +-
>   Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml    | 2 +-

[...]

> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> index 9ab4d81ead35..dab468a88942 100644
> --- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> @@ -14,7 +14,7 @@ description: |
>     for the UART peripheral bus.
>   
>   allOf:
> -  - $ref: "dma-controller.yaml#"
> +  - $ref: dma-controller.yaml#
>   
>   properties:
>     compatible:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
