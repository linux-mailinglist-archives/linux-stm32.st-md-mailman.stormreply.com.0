Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C0A48008
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 14:54:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59D63C7A84A;
	Thu, 27 Feb 2025 13:54:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75489C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+7p+whL+y2ixszcQ8G1Y9xt2LHqMnZq6hXYHzWoyza0=; b=ZEwSO2rCiGPMOuBHO8x1SYughN
 fgqx5F8nB+leOGzlDnAeTvXiV5RenBG4RfJroRdp+uK1TO3ZTSPLA79yHFN4qIn3wk+X8V37Tz7Au
 Nz68ETmYRp+jludadMpYqCvj0FvHQ+eNtTGDIwaBQqpQYUWRSFPKFIA6F8t08MlPB/WU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tneKs-000bj1-01; Thu, 27 Feb 2025 14:53:58 +0100
Date: Thu, 27 Feb 2025 14:53:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <c523a7a8-34db-4902-bfc2-b8207ce4f4a0@lunn.ch>
References: <20250227110652.2342729-1-kever.yang@rock-chips.com>
 <20250227110652.2342729-3-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250227110652.2342729-3-kever.yang@rock-chips.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Paolo Abeni <pabeni@redhat.com>, heiko@sntech.de,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] ethernet: stmmac: dwmac-rk: Make
 the phy clock could be used for external phy
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

On Thu, Feb 27, 2025 at 07:06:52PM +0800, Kever Yang wrote:
> From: David Wu <david.wu@rock-chips.com>
> 
> Use the phy_clk to prepare_enable and unprepare_disable related phy clock.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ccf4ecdffad3..cc90c74ec70c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1867,12 +1867,14 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>  		clk_set_rate(bsp_priv->clk_mac, 50000000);
>  	}
>  
> -	if (plat->phy_node && bsp_priv->integrated_phy) {
> +	if (plat->phy_node) {
>  		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>  		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> -		clk_set_rate(bsp_priv->clk_phy, 50000000);
> +		/* If it is not integrated_phy, clk_phy is optional */
> +		if (bsp_priv->integrated_phy)
> +			clk_set_rate(bsp_priv->clk_phy, 50000000);

That does not look backwards compatible. Older DT blobs which don't
have an integrated PHY won't have a clock in the node, so of_clk_get()
will return an error, and this function then exits with an error code.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
