Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87AA559E8
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 23:37:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0A3AC78F81;
	Thu,  6 Mar 2025 22:37:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20198C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 22:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=dV4SgXTKPQRxhmfsW6BVI1ffsVoZlfX/2pdna3rupKY=; b=IRzhDcZxrjSQpHJrI0vOG307PI
 4Q3zFT2Lm7742/6V+Zy28VNBTQDyPbga72V/f058fDc2wie/b+PEhFuwl65zKZkyMo5cctlbL8LJY
 ehLYgxrxr1RmotX+87e2e13mIu3sITEu8+lf19srPgserUr4akQURsT8UKxhccoLO+lI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tqJqJ-002wLx-Da; Thu, 06 Mar 2025 23:37:27 +0100
Date: Thu, 6 Mar 2025 23:37:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306210950.1686713-3-jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-rk: Validate
 rockchip, grf and php-grf during probe
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

On Thu, Mar 06, 2025 at 09:09:46PM +0000, Jonas Karlman wrote:
> All Rockchip GMAC variants require writing to GRF to configure e.g.
> interface mode and MAC rx/tx delay. The GRF syscon regmap is located
> with help of a rockchip,grf and rockchip,php-grf phandle.

> @@ -1813,8 +1564,24 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>  
>  	bsp_priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							"rockchip,grf");
> -	bsp_priv->php_grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> -							    "rockchip,php-grf");
> +	if (IS_ERR(bsp_priv->grf)) {
> +		ret = PTR_ERR(bsp_priv->grf);
> +		dev_err_probe(dev, ret, "failed to lookup rockchip,grf\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	bsp_priv->php_grf =
> +		syscon_regmap_lookup_by_phandle_optional(dev->of_node,
> +							 "rockchip,php-grf");
> +	if ((of_device_is_compatible(dev->of_node, "rockchip,rk3588-gmac") ||
> +	     of_device_is_compatible(dev->of_node, "rockchip,rk3576-gmac")) &&
> +	    !bsp_priv->php_grf)
> +		bsp_priv->php_grf = ERR_PTR(-ENODEV);

It seems odd you say all variants need this property, and then you
look for two specific variants here and do something different? Why
are these two special?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
