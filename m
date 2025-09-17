Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105BB81012
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 18:31:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A08CDC3F954;
	Wed, 17 Sep 2025 16:31:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72572C3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t7ZqalwnvjICi7kuOiOIafiliCtJGxrARFdp8W4lXxY=; b=lqNmbubTKYTpthGWHPykLNREkq
 a6h0sXLqwZcvzf1kHFi8/4wqRzTLPZ5t4JG0CX4Ax83EBEIolNl3BmwHrN5NmNiZX671xdmPJSgH2
 nFtq7ceA+M5n1PeBvkOVPFNvRXxDrq8tYVBobWZmNDyHpKQmZ158OQtCadM+oLJDaOmnk77cmCPYl
 IFMBaQIdpJj0yuWqNpTnxRkrKexCbJs00Ef7dR2v3QxXq/JjrV8aDwIZKLzlbVv7iTPkFIPpFwXkb
 d6e9GNwiy2bH5R5G8dIxQjEYUZwXZcz8KvO6Swi1xoMfVcDOTSVBZeIUeAISi+cACfrpX4OE/tHJs
 d90qzIPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49908)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uyv3v-000000005BG-32EF;
 Wed, 17 Sep 2025 17:31:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uyv3s-000000000LJ-1mOb; Wed, 17 Sep 2025 17:31:16 +0100
Date: Wed, 17 Sep 2025 17:31:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: stm32: add
 WoL from PHY support
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

On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
> If the "st,phy-wol" property is present in the device tree node,
> set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
> the PHY.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -106,6 +106,7 @@ struct stm32_dwmac {
>  	u32 speed;
>  	const struct stm32_ops *ops;
>  	struct device *dev;
> +	bool phy_wol;
>  };
>  
>  struct stm32_ops {
> @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>  		}
>  	}
>  
> +	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
> +
>  	return err;
>  }
>  
> @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->bsp_priv = dwmac;
>  	plat_dat->suspend = stm32_dwmac_suspend;
>  	plat_dat->resume = stm32_dwmac_resume;
> +	if (dwmac->phy_wol)
> +		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;

I would much rather we found a different approach, rather than adding
custom per-driver DT properties to figure this out.

Andrew has previously suggested that MAC drivers should ask the PHY
whether WoL is supported, but this pre-supposes that PHY drivers are
coded correctly to only report WoL capabilities if they are really
capable of waking the system. As shown in your smsc PHY driver patch,
this may not be the case.

Given that we have historically had PHY drivers reporting WoL
capabilities without being able to wake the system, we can't
implement Andrew's suggestion easily.

The only approach I can think that would allow us to transition is
to add:

static inline bool phy_can_wakeup(struct phy_device *phy_dev)
{
	return device_can_wakeup(&phy_dev->mdio.dev);
}

to include/linux/phy.h, and a corresponding wrapper for phylink.
This can then be used to determine whether to attempt to use PHY-based
Wol in stmmac_get_wol() and rtl8211f_set_wol(), falling back to
PMT-based WoL if supported at the MAC.

So, maybe something like:

static u32 stmmac_wol_support(struct stmmac_priv *priv)
{
	u32 support = 0;

	if (priv->plat->pmt && device_can_wakeup(priv->device)) {
		support = WAKE_UCAST;
		if (priv->hw_cap_support && priv->dma_cap.pmt_magic_frame)
			support |= WAKE_MAGIC;
	}

	return support;
}

static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
{
	struct stmmac_priv *priv = netdev_priv(dev);
	int err;

	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
	if (phylink_can_wakeup(priv->phylink) ||
	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
		err = phylink_ethtool_get_wol(priv->phylink, wol);
		if (err != 0 && err != -EOPNOTSUPP)
			return;
	}

	wol->supported |= stmmac_wol_support(priv);

	/* A read of priv->wolopts is single-copy atomic. Locking
	 * doesn't add any benefit.
	 */
	wol->wolopts |= priv->wolopts;
}

static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
{
	struct stmmac_priv *priv = netdev_priv(dev);
	u32 support, wolopts;
	int err;

	wolopts = wol->wolopts;

	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
	if (phylink_can_wakeup(priv->phylink) ||
	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
		struct ethtool_wolinfo w;

		err = phylink_ethtool_set_wol(priv->phylink, wol);
		if (err != -EOPNOTSUPP)
			return err;

		/* Remove the WoL modes that the PHY is handling */
		if (!phylink_ethtool_get_wol(priv->phylink, &w))
			wolopts &= ~w.wolopts;
	}

	support = stmmac_wol_support(priv);

	mutex_lock(&priv->lock);
	priv->wolopts = wolopts & support;
	device_set_wakeup_enable(priv->device, !!priv->wolopts);
	mutex_unlock(&priv->lock);

	return 0;
}

... and now I'm wondering whether this complexity is something that
phylink should handle internally, presenting a mac_set_wol() method
to configure the MAC-side WoL settings. What makes it difficult to
just move into phylink is the STMMAC_FLAG_USE_PHY_WOL flag, but
that could be a "force_phy_wol" flag in struct phylink_config as
a transitionary measure... so long as PHY drivers get fixed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
