Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F75BC3C8FB
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 17:48:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EACADC5C842;
	Thu,  6 Nov 2025 16:48:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7638AC5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 16:48:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73408618FF;
 Thu,  6 Nov 2025 16:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE72C4CEF7;
 Thu,  6 Nov 2025 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762447716;
 bh=/4FiJ6f4TJaczdM9ytFvrqq6aZ2yS1FDznxDzKEei/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2hzfVWNCgssw0kO7ViuyxSePza4gd1TziiqxcEy+VihxmqregtZ0f2I5UyFVRe/l
 BxMdDMmGR1KTotHicZSKkN2Q6DDslnC3ldcc6lRSN4fqNpmR1z3f/Fr6uQo+0By4Y5
 oIxKVJv+w2iOmlA4fKLSBXK6J3cVeTJesy8dS+atlvbK4iKDqksmaXeywJ5H83jG4M
 8q7gI5sFzH9BBXY0KGDF0Kh/+X1X8bt0cf1gPKAarT7qt1EG89aNSs7bWc1daJFQ0S
 SVTrnil1nerWwq9TJ7F3N+6WbRXpRZKK2Iy3Yngbnvh2M0sjIgPAo3nH/WQGRML16L
 3Vgtodby78kGg==
Date: Thu, 6 Nov 2025 16:48:31 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aQzRX6qHy5Yo7T5x@horms.kernel.org>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoo-0000000DWpK-47nP@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vGvoo-0000000DWpK-47nP@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 11/11] net: stmmac: ingenic:
 use ->set_phy_intf_sel()
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

On Thu, Nov 06, 2025 at 08:58:10AM +0000, Russell King (Oracle) wrote:
> Rather than placing the phy_intf_sel() setup in the ->init() method,
> move it to the new ->set_phy_intf_sel() method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++++++------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 41a2071262bc..957bc78d5a1e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -134,32 +134,21 @@ static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
> +static int ingenic_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = bsp_priv;
> -	phy_interface_t interface;
> -	int phy_intf_sel, ret;
> -
> -	if (mac->soc_info->set_mode) {
> -		interface = mac->plat_dat->phy_interface;
> -
> -		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
> -		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
> -		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
> -			dev_err(mac->dev, "unsupported interface %s\n",
> -				phy_modes(interface));
> -			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> -		}
>  
> -		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> -			phy_modes(interface));
> +	if (!mac->soc_info->set_mode)
> +		return 0;
>  
> -		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
> -		if (ret)
> -			return ret;
> -	}
> +	if (phy_intf_sel >= BITS_PER_BYTE ||
> +	    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel))
> +		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;

nit from Smatch: phy_intf_sel is unsigned and thus cannot be negative

> +
> +	dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> +		phy_modes(mac->plat_dat->phy_interface));
>  
> -	return 0;
> +	return mac->soc_info->set_mode(mac, phy_intf_sel);
>  }

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
