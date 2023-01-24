Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D57367924B
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 08:52:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25D2FC65E72;
	Tue, 24 Jan 2023 07:52:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C32BC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 07:52:41 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso623853wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 23:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAe2WJH+upW322dDk1bEGZ4cZcCC0V7GrzqFfjdJrMg=;
 b=hGPTxpSwZUv2ubxuT/5nHbDe+A30AqGBmtvji/Iv7jd9BR1eURErdOE+Ld8kUkcKcV
 KBpMd+yZB0HVRMSv788IXaCQQxdg9P9UVfVih3M/pen+O2tI+hvtR5R6cbWPe7F48Hqb
 ExACdlVSsYE6TI+k3v/pOyJomrx6/HBSc4EsF3l9xMz8Uj2+xwf7DVxSUixIp9lITiFV
 6yOGgpOTV+n/yLZlsoLSx3vLvV/ml+6ZI023vAbywjGDGOjFDrxp+r82czeY0Jb8dexv
 CP5uWx6pW85Lp7lztlLRVLu4x+/zCR5SutP5JmJbQ2uCG/SEL2XnmQFMRKINlPjQweee
 wnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAe2WJH+upW322dDk1bEGZ4cZcCC0V7GrzqFfjdJrMg=;
 b=dY1/dCDv7qf/K2UsyW0k/y3KkI1csh+93DV+Dud3/hN9BC8C6+MqRPVti/O9a7u6bf
 8A4mrxTm+iKYDfUOrCah88lUwmH/TzgA6odJtd0pIsbGakNISXKOW2FeeT46F14BCMtb
 SZ6wN4l93vpazg/n9f/KBjubrjTmf2eLupkLUeDu2yAov+YAyG8ddXOURKJjVUD9iiwv
 guXtfTWpHCWWh97PcIdMla/p1fDly2BSUoG6LIR8L8GTU2H+XM2PEnpLRDkkQ3K4DJxW
 rEb8TypJTZZkhJojulhaM2L90d8yTIBUzL2+zp9diWWjOV5+yvMrPtG3qeDGvTU77YRc
 UVwg==
X-Gm-Message-State: AFqh2krq8109J0TAd4kUlvwzh37We9IkbzTfOVforeOn1Q69peqRA4Zi
 alSM25kH0wvTq0fwcAC/Csk3ew==
X-Google-Smtp-Source: AMrXdXtUIbnTklwYfp0Ur7d3WG5zlOuPOMpIoOKsMyOMySKmH3lI7Ra+GFxs1Sh1FysqHT0LgtpI4A==
X-Received: by 2002:a05:600c:3488:b0:3d2:370b:97f4 with SMTP id
 a8-20020a05600c348800b003d2370b97f4mr34735239wmq.16.1674546760714; 
 Mon, 23 Jan 2023 23:52:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a7bcb9a000000b003db2dede1a2sm12401412wmi.26.2023.01.23.23.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:52:40 -0800 (PST)
Message-ID: <b88bacbb-9da2-2175-3f59-7156c3aad4e3@linaro.org>
Date: Tue, 24 Jan 2023 08:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
 <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
 <20230123202010.GA2455859-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123202010.GA2455859-robh@kernel.org>
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
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
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

On 23/01/2023 21:20, Rob Herring wrote:
> On Wed, Jan 18, 2023 at 07:01:44PM +0100, Krzysztof Kozlowski wrote:
>> Cleanup examples:
>>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>>  - use lowercase hex.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
>>  .../bindings/dma/stericsson,dma40.yaml        |  4 +--
>>  2 files changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index 2bedab1f74e0..d34d0fa62ab5 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -113,21 +113,21 @@ additionalProperties: false
>>  
>>  examples:
>>    - |
>> -     #include <dt-bindings/interrupt-controller/arm-gic.h>
>> -     #include <dt-bindings/interrupt-controller/irq.h>
>> -     /* example with snps,dw-axi-dmac */
>> -     dmac: dma-controller@80000 {
>> -         compatible = "snps,axi-dma-1.01a";
>> -         reg = <0x80000 0x400>;
>> -         clocks = <&core_clk>, <&cfgr_clk>;
>> -         clock-names = "core-clk", "cfgr-clk";
>> -         interrupt-parent = <&intc>;
>> -         interrupts = <27>;
>> -         #dma-cells = <1>;
>> -         dma-channels = <4>;
>> -         snps,dma-masters = <2>;
>> -         snps,data-width = <3>;
>> -         snps,block-size = <4096 4096 4096 4096>;
>> -         snps,priority = <0 1 2 3>;
>> -         snps,axi-max-burst-len = <16>;
>> -     };
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    /* example with snps,dw-axi-dmac */
>> +    dmac: dma-controller@80000 {
> 
> Drop unused labels while you are here.

Ack

> 
>> +        compatible = "snps,axi-dma-1.01a";
>> +        reg = <0x80000 0x400>;
>> +        clocks = <&core_clk>, <&cfgr_clk>;
>> +        clock-names = "core-clk", "cfgr-clk";
>> +        interrupt-parent = <&intc>;
>> +        interrupts = <27>;
>> +        #dma-cells = <1>;
>> +        dma-channels = <4>;
>> +        snps,dma-masters = <2>;
>> +        snps,data-width = <3>;
>> +        snps,block-size = <4096 4096 4096 4096>;
>> +        snps,priority = <0 1 2 3>;
>> +        snps,axi-max-burst-len = <16>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
>> index 664ee61a00d8..57395a810719 100644
>> --- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
>> +++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
>> @@ -147,9 +147,9 @@ examples:
>>      #include <dt-bindings/interrupt-controller/irq.h>
>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>>      #include <dt-bindings/mfd/dbx500-prcmu.h>
>> -    dma-controller@801C0000 {
>> +    dma-controller@801c0000 {
>>        compatible = "stericsson,db8500-dma40", "stericsson,dma40";
>> -      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
>> +      reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
>>        reg-names = "base", "lcpa";
>>        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>>        #dma-cells = <3>;
> 
> Indentation?

Ack

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
