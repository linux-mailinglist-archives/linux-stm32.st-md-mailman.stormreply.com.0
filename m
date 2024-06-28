Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7991C11C
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 16:36:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D3C0C71282;
	Fri, 28 Jun 2024 14:36:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FB07C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dn8dd9XofEX3Uhxe0baYs+HlRiMw0xmll7rakGvzy50=; b=Cqv4ThO5K430oyZ2P6/0xKye2t
 dcVwpn/gglUa0CJqhAN+opJSD6fX3NJv+GbcL5k/c4EwzwND43nPnDy+bpoIqtGo+vLKI2FOubIqs
 Fvk74xjycJ9/p6rbCTdrQngllERV7m92ztiQsm0d5x2t2e3LC6gMsCLiGO/ckIZnQ2AprJa5/Ve1x
 7nVuXuVCk1Eck2s+1es8VUVhYFZ/5YC8VxXfqplKesv5yRcQRzKkv9urI632OyjgKKQdtyERinlCZ
 hOSoxViS6lcjxxxu6qSstM5r1CijGBQv3xhaYtMKdyTxvuyOVdXATGeQwcfbbru1AsdTgVxxnG0YD
 DgriEQQw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57500)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sNCi4-0006kX-1r;
 Fri, 28 Jun 2024 15:36:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sNCi4-0006Zb-BR; Fri, 28 Jun 2024 15:36:20 +0100
Date: Fri, 28 Jun 2024 15:36:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zn7KZG+KDU01APar@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-8-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240624132802.14238-8-fancer.lancer@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 16/17] net: stmmac: Move
 internal PCS init method to stmmac_pcs.c
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

On Mon, Jun 24, 2024 at 04:26:33PM +0300, Serge Semin wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 72c2d3e2c121..743d356f6d12 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -950,13 +950,16 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  {
>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>  
> +	if (priv->hw->pcs)
> +		return &priv->hw->mac_pcs;
> +
>  	if (priv->hw->xpcs)
>  		return &priv->hw->xpcs->pcs;
>  
>  	if (priv->hw->phylink_pcs)
>  		return priv->hw->phylink_pcs;
>  
> -	return stmmac_mac_phylink_select_pcs(priv, interface);
> +	return NULL;

I really really don't like this due to:

1. I spent a long time working out what the priority here should be, and
you've just thrown all that work away by changing it - to something that
I believe is incorrect.

2. I want to eventually see this function checking the interface type
before just handing out a random PCS, and it was my intention to
eventually that into the MACs own select_pcs() methods. Getting rid of
those methods means that the MACs themselves now can't make the
decision which is where that should be.

3. When operating in RGMII "inband" mode, the .pcs_config etc doesn't
make much sense (we're probably accessing registers that don't exist)
and I had plans to split this into a RGMII "PCS" which was just a PCS
that implemented .pcs_get_state(), a stub .pcs_config(), and a separate
fully-featured "SGMII PCS".

So, I would like to eventually see here something like:

	if (priv->hw->xpcs)
		return &priv->hw->xpcs->pcs;

	if (priv->hw->phylink_pcs)
		return priv->hw->phylink_pcs;

	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
		if (phy_interface_mode_is_rgmii(priv->plat->mac_interface))
			return &priv->hw->mac_rgmii_pcs;

		if (priv->dma_cap.pcs &&
		    priv->plat->mac_interface == PHY_INTERFACE_MODE_SGMII)
			return &priv->hw->mac_sgmii_pcs;
	}

	return NULL;

> +void dwmac_pcs_init(struct mac_device_info *hw)
> +{
> +	struct stmmac_priv *priv = hw->priv;
> +	int interface = priv->plat->mac_interface;
> +
> +	if (priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)
> +		return;
> +	else if (phy_interface_mode_is_rgmii(interface))
> +		hw->pcs = STMMAC_PCS_RGMII;
> +	else if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII)
> +		hw->pcs = STMMAC_PCS_SGMII;
> +
> +	hw->mac_pcs.neg_mode = true;
> +}

Please move "hw->mac_pcs.neg_mode = true;" to where the PCS method
functions are implemented - it determines whether the PCS method
functions take the AN mode or the neg mode, and this is a property of
their implementations. It should not be split away from them.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
