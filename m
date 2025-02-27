Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3EAA47FCD
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 14:48:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAEE1C7A84A;
	Thu, 27 Feb 2025 13:48:00 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41263C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=z2VNcrufiCKj7eFAmSfO6YQZUc/4GuUjSOvR4L9XN8o=; b=VjM/TY+MXccsyzI6ksj8zDo9In
 yFoyfRsMmdidwKCGMPw1blkR3xTStw1bxHGpgycjtHDOsEnqExtNS3RQIudklQ8ucmhjj/B4S1SWP
 XZsbM1ax1tchMRmjs0fXdGMprPgX+3Ab2pssCBqoQkjazkJQI0GjsRlxtyc69Y/C4pOw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tneEx-000bcT-JT; Thu, 27 Feb 2025 14:47:51 +0100
Date: Thu, 27 Feb 2025 14:47:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <f7146c95-85dd-4e5f-99b4-83a5d1b6fbd1@lunn.ch>
References: <20250227110652.2342729-1-kever.yang@rock-chips.com>
 <20250227110652.2342729-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250227110652.2342729-2-kever.yang@rock-chips.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 2/3] ethernet: stmmac: dwmac-rk: Add
 gmac support for rk3562
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

On Thu, Feb 27, 2025 at 07:06:51PM +0800, Kever Yang wrote:
> From: David Wu <david.wu@rock-chips.com>
> 
> Add constants and callback functions for the dwmac on RK3562 soc.
> As can be seen, the base structure is the same.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
> Changes in v2:
> - Collect review tag
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 207 +++++++++++++++++-
>  1 file changed, 205 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index a4dc89e23a68..ccf4ecdffad3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -2,8 +2,7 @@
>  /**
>   * DOC: dwmac-rk.c - Rockchip RK3288 DWMAC specific glue layer
>   *
> - * Copyright (C) 2014 Chen-Zhi (Roger Chen)
> - *
> + * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
>   * Chen-Zhi (Roger Chen)  <roger.chen@rock-chips.com>
>   */

IANAL, but generally, you add additional copyright notices, not
replace them.

> +#define DELAY_VALUE(soc, tx, rx) \
> +	((((tx) >= 0) ? soc##_GMAC_CLK_TX_DL_CFG(tx) : 0) | \
> +	 (((rx) >= 0) ? soc##_GMAC_CLK_RX_DL_CFG(rx) : 0))
> +
> +#define GMAC_RGMII_CLK_DIV_BY_ID(soc, id, div) \
> +		(soc##_GMAC##id##_CLK_RGMII_DIV##div)
> +
> +#define GMAC_RMII_CLK_DIV_BY_ID(soc, id, div) \
> +		(soc##_GMAC##id##_CLK_RMII_DIV##div)
> +

This macro magic is pretty unreadable. Please consider another way to
do this. Some wise developer once said, code is written once, read 100
times. So please make code readable by default, unless it is hot path.

> +static void rk3562_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int val = 0, offset, id = bsp_priv->id;
> +
> +	switch (speed) {
> +	case 10:
> +		if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII) {
> +			if (id > 0) {
> +				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 1, 20);
> +				regmap_write(bsp_priv->grf, RK3562_GRF_SYS_SOC_CON0,
> +					     RK3562_GMAC1_RMII_SPEED10);
> +			} else {
> +				val = GMAC_RMII_CLK_DIV_BY_ID(RK3562, 0, 20);
> +			}
> +		} else {
> +			val = GMAC_RGMII_CLK_DIV_BY_ID(RK3562, 0, 50);
> +		}
> +		break;

It seems like this function would be a lot more readable if it was
split into two, one dealing with RMII and another with RGMII.

> +static void rk3562_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
> +				       bool enable)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int value;
> +
> +	if (IS_ERR(bsp_priv->grf) || IS_ERR(bsp_priv->php_grf)) {
> +		dev_err(dev, "Missing rockchip,grf or rockchip,php_grf property\n");
> +		return;
> +	}

That should of been checked much earlier, at probe.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
