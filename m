Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC6C6792CB
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 09:14:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9806C69054;
	Tue, 24 Jan 2023 08:14:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3DE3C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 08:14:49 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so12230792wma.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 00:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RVSNIHGB8PISxIKwAljYge1nd6C8hUrlvE6VAZnPjHQ=;
 b=txIRzhryWamfe1z9Em3a0nBHIMlRv5s54CEfSUm93gszPu25ZLJ4IkPT0gsKTi4c3W
 19CCIKmTAIXurZIZ6Cy1W6SG5YGePUxXcVH+ddEUyAQ5l6rsURL1tX66fACMqBTgLeAN
 h8maayB9m1Nd0/koDmGy0gCChEjhR2WACCCEvgwCc+wz+yTBWAfV3RX91yXpgJ9g26y7
 YGcjWpQ6UbbfDiGjrrPYMIpkRjGo4z6DX1OaXRDM4MOVISLedvtVwDShRcPnAY+/Q5jo
 tgguNUJgYRZuisExE7oJ7fZuyC6GbLCz2AlCXJ6qR/J9Td6HAfkX/L+IBgYjkj+vu0F6
 ICjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RVSNIHGB8PISxIKwAljYge1nd6C8hUrlvE6VAZnPjHQ=;
 b=ADwp0vJBxcMIWSPLQjH/iaHsBB5T2I9s53Gq4FmX0E3t/rB8DUnGXjpk8koBJAz8Iv
 eQ3BY8+x8w2OmuNT3h9FzKq5yAtdqV3MbyKhVWHGtUjRX/DY63Fue6ndHLOZTfwJGkHB
 I3aKDMLEfbLgiiM1z5h/AaL5279KzRmBiMGUM7Mj9rdgOUAasHqaiM4zGLMDWUo2ItEO
 bNaclBXJrC2CfZy9AY5oStie2GXQq2HxqLaRXo95LxbbS9gP93ksUF4xmOWrKtbCyFUi
 05P/U6Bfo2mUemJhF6P9v7PO02qPspnWIBj7BPriCEEMhcHqr9ZRZC1hTcs+eC31Ajef
 /FcQ==
X-Gm-Message-State: AFqh2krvAo/7EwIkbPfCK8rhDVkA/0omkAEwYEv8GOzrSkUzT4j3mk4H
 vRseqVA6cfjGHn0BQm+8WDplwg==
X-Google-Smtp-Source: AMrXdXt9KYzPZpMpoFYU6I2G9b/HtmRi0n7BFoNHmhNOvGumycgmZFNF8bAQ+/xC9kTewL+1vTLzQQ==
X-Received: by 2002:a05:600c:1c01:b0:3c6:e63e:23e9 with SMTP id
 j1-20020a05600c1c0100b003c6e63e23e9mr27243001wms.24.1674548089277; 
 Tue, 24 Jan 2023 00:14:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1ccc14000000b003dafbd859a6sm12350698wmb.43.2023.01.24.00.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 00:14:48 -0800 (PST)
Message-ID: <aa6f0211-b744-7420-1e1e-fdf87832a154@linaro.org>
Date: Tue, 24 Jan 2023 09:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
 Peng Fan <peng.fan@nxp.com>, Paul Cercueil <paul@crapouillou.net>,
 - <chuanhua.lei@intel.com>, Long Cheng <long.cheng@mediatek.com>,
 Rajesh Gumasta <rgumasta@nvidia.com>,
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
References: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: dma: drop unneeded
	quotes
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

On 24/01/2023 09:11, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> # mediatek
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Hector Martin <marcan@marcan.st> # apple

I forgot previous tags:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org> # Spear
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> # Renesas
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com> # Socionext


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
