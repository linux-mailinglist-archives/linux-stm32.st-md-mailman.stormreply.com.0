Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4336839EA84
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 02:02:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0D54C58D7B;
	Tue,  8 Jun 2021 00:02:11 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76EBAC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 00:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=N3a+03kBTMfQSx5Hd/bgZB3TBPMGzTKqpBlMp1B0wk8=; b=nakdTipNHB98wcXQ2sRFnxmLlF
 WoyocyN0jrUpK+Zcdvcu2GYF34gelZzc6rMgPNpe6zxlAVZE7cwYGNe+aAHNR9ozGYlAVFVT6HYBS
 x1EBu7rwkrI8Yx2xyCDXKAF7Y0MixQIOsjKlaDfC4SRgb88JciIQq9gImH4SrflyzGC0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lqPBa-008GfJ-3G; Tue, 08 Jun 2021 02:01:38 +0200
Date: Tue, 8 Jun 2021 02:01:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Message-ID: <YL6zYgGdqxqL9c0j@lunn.ch>
References: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623086867-119039-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623086867-119039-3-git-send-email-zhouyanjie@wanyeetech.com>
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

>  config DWMAC_ROCKCHIP
>  	tristate "Rockchip dwmac support"
> -	default ARCH_ROCKCHIP
> +	default MACH_ROCKCHIP
>  	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>  	select MFD_SYSCON
>  	help
> @@ -164,7 +176,7 @@ config DWMAC_STI
>  
>  config DWMAC_STM32
>  	tristate "STM32 DWMAC support"
> -	default ARCH_STM32
> +	default MACH_STM32

It would be good to explain in the commit message why you are changing
these two. It is not obvious.

> +static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct ingenic_mac *mac = plat_dat->bsp_priv;
> +	int val;
> +
> +	switch (plat_dat->interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_MII);
> +		pr_debug("MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
> +		break;
> +
> +	case PHY_INTERFACE_MODE_GMII:
> +		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_GMII);
> +		pr_debug("MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RMII:
> +		val = FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT) |
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RMII);
> +		pr_debug("MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII:

What about the other three RGMII modes?

> +	case PHY_INTERFACE_MODE_RGMII:
> +		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY) |
> +			  FIELD_PREP(MACPHYC_TX_DELAY_MASK, MACPHYC_TX_DELAY_63_UNIT) |
> +			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
> +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);

What exactly does MACPHYC_TX_DELAY_63_UNIT mean here? Ideally, the MAC
should not be adding any RGMII delays. It should however pass mode
through to the PHY, so it can add the delays, if the mode indicates it
should, e.g. PHY_INTERFACE_MODE_RGMII_ID. This is also why you should
be handling all 4 RGMII modes here, not just one.

	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
