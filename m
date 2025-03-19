Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9DA69C2E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 23:40:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A947BC7803C;
	Wed, 19 Mar 2025 22:40:09 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9440C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 22:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=jTG3WnDFAfRFQDs0cUx1kwKiOP6BmpOLg7RMMJcqr7s=; b=awaNfGbpagVPUyFCmBEgPJBmul
 e9tPJGuvyQX/cvhie0Gzen6w0UIqucPHwRQq7lqNasTTazFhe+DK60szAbKolzU3XYaHFyzt0or44
 01eTmdmeu014tYZJcfTanw14k5yoqvo9Fh+IUWcXPUAuQyz34EHR/nWevIkioAIety70=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tv24e-006Q5Z-KP; Wed, 19 Mar 2025 23:39:44 +0100
Date: Wed, 19 Mar 2025 23:39:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319214415.3086027-4-jonas@kwiboo.se>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/5] net: stmmac: dwmac-rk:
 Move integrated_phy_powerup/down functions
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

On Wed, Mar 19, 2025 at 09:44:07PM +0000, Jonas Karlman wrote:
> Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
> the integrated PHY on RK3228/RK3328. Current powerup/down operation is
> not compatible with the integrated PHY found in these SoCs.
> 
> Move the rk_gmac_integrated_phy_powerup/down functions to top of the
> file to prepare for them to be called directly by a GMAC variant
> specific powerup/down operation.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

> +#define RK_GRF_CON2_MACPHY_ID		HIWORD_UPDATE(0x1234, 0xffff, 0)
> +#define RK_GRF_CON3_MACPHY_ID		HIWORD_UPDATE(0x35, 0x3f, 0)
> +
> +static void rk_gmac_integrated_phy_powerup(struct rk_priv_data *priv)
> +{
> +	if (priv->ops->integrated_phy_powerup)
> +		priv->ops->integrated_phy_powerup(priv);
> +
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_MACPHY_CFG_CLK_50M);
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_GMAC2PHY_RMII_MODE);
> +
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON2, RK_GRF_CON2_MACPHY_ID);
> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON3, RK_GRF_CON3_MACPHY_ID);

I know you are just moving code around....

Do you know what these MACPHY_ID are? I hope it is not what you get
when you read PHY registers 2 and 3?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
