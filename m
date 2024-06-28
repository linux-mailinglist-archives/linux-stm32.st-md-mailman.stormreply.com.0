Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEEA91C217
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 17:08:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A97DDC71282;
	Fri, 28 Jun 2024 15:08:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C909C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKeNupwsPSrvE04qYcLHS5Qf0hnRaatid61rEYfWQaA=; b=grvZHTLMNbz8IGpB8IsDq8tVaB
 O8Kdrj1Wm5knEHgfNK5PVm7zmHg5aOBb0W2yALLnd9JAxHZPlVV7+SWSG7goEQeSLhA8eCZ6PluMG
 p+pgQxnqsxpUITKYfbPoZYOXhddo1ADVfTU+tHn2B939ipP/pM1cM7dX5/SdhBIKJnPVLg1EmDgAh
 OKJumBhYWd2F94Veoeyfo2mWJDTJ9nXeyL7OUm69tRKjXtTBGAgbPzaIZKO6TuWsYTBHhq/nAerhD
 qM4VHUw6Ex4bmKX4n29ir43HdS8MGMOKFsyRxTCY37pVyD6NEd1f91hGv4gLQiISeZo7Zx2zT3JGd
 wIoqSNfw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54812)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sNDCT-0006oN-1m;
 Fri, 28 Jun 2024 16:07:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sNDCV-0006as-1Z; Fri, 28 Jun 2024 16:07:47 +0100
Date: Fri, 28 Jun 2024 16:07:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zn7Rwt9KNac2mMah@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-6-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240624132802.14238-6-fancer.lancer@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 14/17] net: stmmac: Move
 internal PCS PHYLINK ops to stmmac_pcs.c
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

On Mon, Jun 24, 2024 at 04:26:31PM +0300, Serge Semin wrote:
> @@ -621,7 +548,6 @@ int dwmac1000_setup(struct stmmac_priv *priv)
>  	mac->mii.clk_csr_shift = 2;
>  	mac->mii.clk_csr_mask = GENMASK(5, 2);
>  
> -	mac->mac_pcs.ops = &dwmac1000_mii_pcs_ops;
>  	mac->mac_pcs.neg_mode = true;

"mac->mac_pcs.neg_mode = true;" is a property of the "ops" so should
move with it.

> @@ -1475,7 +1396,6 @@ int dwmac4_setup(struct stmmac_priv *priv)
>  	mac->mii.clk_csr_mask = GENMASK(11, 8);
>  	mac->num_vlan = dwmac4_get_num_vlan(priv->ioaddr);
>  
> -	mac->mac_pcs.ops = &dwmac4_mii_pcs_ops;
>  	mac->mac_pcs.neg_mode = true;

Also applies here.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 3666893acb69..c42fb2437948 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -363,6 +363,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
>  		mac->tc = mac->tc ? : entry->tc;
>  		mac->mmc = mac->mmc ? : entry->mmc;
>  		mac->est = mac->est ? : entry->est;
> +		mac->mac_pcs.ops = mac->mac_pcs.ops ?: entry->pcs;

Removing both of the above means that mac->mac_pcs.ops won't ever be set
prior to this, so this whole thing should just be:

		mac->mac_pcs.ops = entry->pcs;
		mac->mac_pcs.neg_mode = true;

> +static void dwmac_pcs_get_state(struct phylink_pcs *pcs,
> +				struct phylink_link_state *state)
>  {
> +	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
>  	struct stmmac_priv *priv = hw->priv;
>  	u32 val;
>  
> +	val = stmmac_pcs_get_config_reg(priv, hw);
> +
> +	/* TODO The next is SGMII/RGMII/SMII-specific */
> +	state->link = !!(val & PCS_CFG_LNKSTS);
> +	if (!state->link)
> +		return;
> +
> +	switch (FIELD_GET(PCS_CFG_LNKSPEED, val)) {
> +	case PCS_CFG_LNKSPEED_2_5:
> +		state->speed = SPEED_10;
> +		break;
> +	case PCS_CFG_LNKSPEED_25:
> +		state->speed = SPEED_100;
> +		break;
> +	case PCS_CFG_LNKSPEED_250:
> +		state->speed = SPEED_1000;
> +		break;
> +	default:
> +		netdev_err(priv->dev, "Unknown speed detected\n");
> +		break;
> +	}
> +
> +	state->duplex = val & PCS_CFG_LNKMOD ? DUPLEX_FULL : DUPLEX_HALF;
> +
> +	/* TODO Check the PCS_AN_STATUS.Link status here?.. Note the flag is latched-low */
> +
> +	/* TODO The next is the TBI/RTBI-specific and seems to be valid if PCS_AN_STATUS.ANC */
>  	val = readl(priv->pcsaddr + PCS_ANE_LPA);

I thought these registers only existed of dma_cap.pcs is true ? If we
start checking PCS_AN_STATUS.Link here, and this register reads as
zeros, doesn't it mean that RMGII inband mode won't ever signal link
up?

>  
> -	/* TODO Make sure that STMMAC_PCS_PAUSE STMMAC_PCS_ASYM_PAUSE usage is legitimate */
> +	/* TODO The databook says the encoding is defined in IEEE 802.3z,
> +	 * Section 37.2.1.4. Do we need the STMMAC_PCS_PAUSE and
> +	 * STMMAC_PCS_ASYM_PAUSE mask here?
> +	 */
>  	linkmode_mod_bit(ETHTOOL_LINK_MODE_Pause_BIT,
>  			 state->lp_advertising,
>  			 FIELD_GET(PCS_ANE_PSE, val) & STMMAC_PCS_PAUSE);

If it's 802.3z aka 1000base-X format, then yes, we should be using
these bits if we are getting state from this register.

If TBI/RTBI is ever used, rather than trying to shoe-horn it all into
these functions, please consider splitting them into separate PCSes,
and sharing code between them e.g. using common functions called from
the method functions or shared method functions where appropriate.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
