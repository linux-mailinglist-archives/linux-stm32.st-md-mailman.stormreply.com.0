Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D2476198
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 20:23:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84624C5E2C5;
	Wed, 15 Dec 2021 19:23:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5865C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 19:22:59 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o29so17419809wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 11:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZYwgBJaj/unectxNhsPO9gtbst5oHKfm3K6XFRszQRI=;
 b=Q8NaUFUtT9c0f6DWp6vcNspUZhwLnLLSM/MRmWvwOXoaGLFgWTvznHeCK6G6Lv934a
 M64NfrQya2KQIzKh01W+U12Fc7ldmtVW9/QKNPPcJfW98omhxwTAOLoQ1tnf9uozXYFR
 NhqMlEouQ17uLSmCToamGDc9h6NyMYGaKDiYqrTPVJu/H03fyy6Qkf27XcnGnbhzzBnl
 2L+yId8J8VjvBTK3Jdi7/LtTrlpECXazAnNo0EWmPimXS9G6qtvsCBIYC7zN/DXF26LE
 dcIzRF8iQwU8dwLNXKqq2yrKot8R+jQPOyNSsNpSZWudcWz1a4njmkaYgWQJYoR8yS3E
 9mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZYwgBJaj/unectxNhsPO9gtbst5oHKfm3K6XFRszQRI=;
 b=svwXX3wP8ir/tti4yOg3Mumho0VBz9iXn0YttMsa7p05vINeaq0IsJVX3Po9ek++qv
 5tkW0e2nhtr34y/4QRnfZVSM6gwjyiJbt6CnrYY0zpqWPITrJOxROeA8vhOSyLOAsIO6
 CUw/QflAPaMW7nodCr/6VMjWvvJCb5nJPslJLZoCDW7pf+MC/HeRVq6JXczXg7FAGTnU
 OJJhXIqIRA+v4sojM38yavuU5IVNik1FHNCD/2ootE08iBNWHjZ4pj/97nS58eiJrg8j
 zx9Sm9UIM6ZnDN2+Z4df9DRe9fm7MhKwy978/foIOHf6PDl1D7UqcniOILpiaqn18/3+
 FtCw==
X-Gm-Message-State: AOAM533aJYbC5zJMDWRP+dyW1O7uyFGzleTIPszy9vBWkhQpiVY/nGQ/
 Nk/HxAAm4e1PcgGMDnf8k4Q=
X-Google-Smtp-Source: ABdhPJwNwyh4XxuqT5udvlzXiwRG9boU1Qdrw7Pw7evZ7Hxcwq1PG3znUeUEH0XlTzDd6waANd8aVg==
X-Received: by 2002:a05:600c:3788:: with SMTP id
 o8mr1574047wmr.82.1639596179243; 
 Wed, 15 Dec 2021 11:22:59 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id m17sm2676457wrw.11.2021.12.15.11.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 11:22:58 -0800 (PST)
Message-ID: <c9b3d31a-1c18-32ec-8077-603bb93fe8d0@gmail.com>
Date: Wed, 15 Dec 2021 20:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-4-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211210013129.811-4-biao.huang@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v8 3/6] arm64: dts: mt2712:
 update ethernet device node
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



On 10/12/2021 02:31, Biao Huang wrote:
> Since there are some changes in ethernet driver,
> update ethernet device node in dts to accommodate to it.
> 

I have a hard time to understand how the first two patches are related to this 
one. Please be more specific in your commit message.

Also please beware that we should make sure that a newer driver version should 
still work properly with an older device tree, which does not have your changes.

Regards,
Matthias

> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  1 +
>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 14 +++++++++-----
>   2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> index 7d369fdd3117..11aa135aa0f3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> @@ -110,6 +110,7 @@ &eth {
>   	phy-handle = <&ethernet_phy0>;
>   	mediatek,tx-delay-ps = <1530>;
>   	snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> +	snps,reset-delays-us = <0 10000 10000>;
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&eth_default>;
>   	pinctrl-1 = <&eth_sleep>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index a9cca9c146fd..9e850e04fffb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -726,7 +726,7 @@ queue2 {
>   	};
>   
>   	eth: ethernet@1101c000 {
> -		compatible = "mediatek,mt2712-gmac";
> +		compatible = "mediatek,mt2712-gmac", "snps,dwmac-4.20a";
>   		reg = <0 0x1101c000 0 0x1300>;
>   		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
>   		interrupt-names = "macirq";
> @@ -734,15 +734,19 @@ eth: ethernet@1101c000 {
>   		clock-names = "axi",
>   			      "apb",
>   			      "mac_main",
> -			      "ptp_ref";
> +			      "ptp_ref",
> +			      "rmii_internal";
>   		clocks = <&pericfg CLK_PERI_GMAC>,
>   			 <&pericfg CLK_PERI_GMAC_PCLK>,
>   			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -			 <&topckgen CLK_TOP_ETHER_50M_SEL>;
> +			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
>   		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -				  <&topckgen CLK_TOP_ETHER_50M_SEL>;
> +				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +				  <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
>   		assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
> -					 <&topckgen CLK_TOP_APLL1_D3>;
> +					 <&topckgen CLK_TOP_APLL1_D3>,
> +					 <&topckgen CLK_TOP_ETHERPLL_50M>;
>   		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
>   		mediatek,pericfg = <&pericfg>;
>   		snps,axi-config = <&stmmac_axi_setup>;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
