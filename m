Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B78EA781F83
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Aug 2023 21:28:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56AC7C6B44E;
	Sun, 20 Aug 2023 19:28:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B28EC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 19:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Wh8avz/7K6bn0D0zVtQFXw0sAZfG126ls7Hida4UZLI=; b=nlQquKpF3yIWBRgr1Z4AnG5zP4
 aArpXuS4cb7j7EH33gEQrChMNyoAPleexNbPyLzwE7FrFiLaHsxo3dzK/PnRPIulLJ+RswsOHAdAv
 DnJGu1IN3a8rGNy3AMDwn+YVHHqsD4XMWNokVjQ/NntyHeYy7zIF8jCV7y94qirz8joQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qXo5n-004dXe-2V; Sun, 20 Aug 2023 21:28:07 +0200
Date: Sun, 20 Aug 2023 21:28:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <aba9a96a-a761-4849-b13d-50fb61973e8d@lunn.ch>
References: <20230816152926.4093-1-jszhang@kernel.org>
 <20230816152926.4093-8-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816152926.4093-8-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 7/9] net: stmmac: platform:
 support parsing safety irqs from DT
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

On Wed, Aug 16, 2023 at 11:29:24PM +0800, Jisheng Zhang wrote:
> The snps dwmac IP may support safety features, and those Safety
> Feature Correctible Error and Uncorrectible Error irqs may be
> separate irqs. Add support to parse the safety irqs from DT.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index be8e79c7aa34..4a2002eea870 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -737,6 +737,18 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>  	}
>  
> +	stmmac_res->sfty_ce_irq = platform_get_irq_byname_optional(pdev, "sfty_ce");
> +	if (stmmac_res->sfty_ce_irq < 0) {
> +		if (stmmac_res->sfty_ce_irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +	}

I think the error checking should be better than this. If i'm reading
the code correctly, it should return -ENXIO if it does not exist, and
since it is supposed to be optional, you can continue. Other values <
0 are real errors, and it should be returned.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
