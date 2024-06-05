Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E928FD704
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 22:05:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A083DC7129F;
	Wed,  5 Jun 2024 20:05:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB0B5C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717617948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PrdH88/0O98/W7d4Muvx4vjoUCcxM5TP1MAziR+qePQ=;
 b=WbgQ0OdOSgPIgelQA+cRDD1px72R6YIGHXXwRtqUMcRd658Lwa6i1/YjxsxzLU2XoESsNP
 h54Xo0rU+ftgwhtCmlBzhbzjtk7h0eYxCdqYpQf9+q37S8p2d9WZ2eep6utIEhs1rNqRgW
 AaLU3opZ4LDuvpnIKJI9KmLWp/Vuawg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-NkwhNOLfNG-IIMES86iR5A-1; Wed, 05 Jun 2024 16:05:47 -0400
X-MC-Unique: NkwhNOLfNG-IIMES86iR5A-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7951af635dfso16783385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jun 2024 13:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717617947; x=1718222747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrdH88/0O98/W7d4Muvx4vjoUCcxM5TP1MAziR+qePQ=;
 b=GiLwEV4uCi1SIx07+4Nc7ATgjlh5ZHE43lQcpakHoD3vDEIPkBIiN15ksWgusFoH/H
 XXLRP1qhAxS5wm42TgvwSQmMMHtoPiSJ+R/6YJXQ6wzqeSxgyJ+GGDN4mUduC2gS1Ef8
 SPZCiL4U6vYZBuL5paroLfjZbI9iDPaUOum6FQe9WZBtjJGvW7Tn3uecmyxdsM2q90Wx
 gQ/Wg3YnT9Sn5MVXJBnZb0TOwka99HOdA8hZD8WMHUwYcDB7WIvh7L2iaROYwCPjliuW
 Cl8xzy1PidF48lCGkPzAb0w4nSK6hV/CiKZYz51At3f4TX9WO0W8ajd3JnzWokGJoUVo
 SNow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSd5Kct+Tt5mjzkEmAMt3CE+BbwEYauyWugksh3g2BeHcC//2dqmgwGVASg8rPRBig2u9aPQcdEVWeYXUHBiPBayDFko+fTexUu46Xd3mghEFNnhbAjgls
X-Gm-Message-State: AOJu0YzzyJqIe72mmoEJoB6ZlB5z4Dmd/IeLRlJx/mIpVB5udXqrpxW4
 HREjEaBxq+vshZPTYtHUm7/HaqfM6tTq2vbZ5C99TffWJlzwySSg/dMVQb9/jyXxIbsS57F1crz
 O5WseXX4R1ikGO0yHKrR+g9H1yDie8U6CwGEbs31QJ8TGVs7/1p4xXHzKggTwI4aKzYG8ylgV2U
 IQ+w==
X-Received: by 2002:a05:620a:288b:b0:792:bc0b:e269 with SMTP id
 af79cd13be357-79523fd9b67mr449348885a.52.1717617946465; 
 Wed, 05 Jun 2024 13:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMYwT4U14yD46Q+CgdugT284E/jRdYiZEAS6QBZe9UXDuAmP9vXDCSKxak9gLW7oyz9grJfA==
X-Received: by 2002:a05:620a:288b:b0:792:bc0b:e269 with SMTP id
 af79cd13be357-79523fd9b67mr449345985a.52.1717617945960; 
 Wed, 05 Jun 2024 13:05:45 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79519a7ba98sm149204785a.119.2024.06.05.13.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:05:45 -0700 (PDT)
Date: Wed, 5 Jun 2024 15:05:43 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 3/8] net: stmmac:
 dwmac1000: convert sgmii/rgmii "pcs" to phylink
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

On Fri, May 31, 2024 at 12:26:25PM GMT, Russell King (Oracle) wrote:
> Convert dwmac1000 sgmii/rgmii "pcs" implementation to use a phylink_pcs
> so we can eventually get rid of the exceptional paths that conflict
> with phylink.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 113 ++++++++++++------
>  1 file changed, 75 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> index d413d76a8936..4a0572d5f865 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/ethtool.h>
>  #include <linux/io.h>
> +#include <linux/phylink.h>
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
>  #include "dwmac1000.h"
> @@ -261,39 +262,6 @@ static void dwmac1000_pmt(struct mac_device_info *hw, unsigned long mode)
>  	writel(pmt, ioaddr + GMAC_PMT);
>  }
>  
> -/* RGMII or SMII interface */
> -static void dwmac1000_rgsmii(void __iomem *ioaddr, struct stmmac_extra_stats *x)
> -{
> -	u32 status;
> -
> -	status = readl(ioaddr + GMAC_RGSMIIIS);
> -	x->irq_rgmii_n++;
> -
> -	/* Check the link status */
> -	if (status & GMAC_RGSMIIIS_LNKSTS) {
> -		int speed_value;
> -
> -		x->pcs_link = 1;
> -
> -		speed_value = ((status & GMAC_RGSMIIIS_SPEED) >>
> -			       GMAC_RGSMIIIS_SPEED_SHIFT);
> -		if (speed_value == GMAC_RGSMIIIS_SPEED_125)
> -			x->pcs_speed = SPEED_1000;
> -		else if (speed_value == GMAC_RGSMIIIS_SPEED_25)
> -			x->pcs_speed = SPEED_100;
> -		else
> -			x->pcs_speed = SPEED_10;
> -
> -		x->pcs_duplex = (status & GMAC_RGSMIIIS_LNKMOD_MASK);
> -
> -		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
> -			x->pcs_duplex ? "Full" : "Half");
> -	} else {
> -		x->pcs_link = 0;
> -		pr_info("Link is Down\n");
> -	}
> -}
> -
>  static int dwmac1000_irq_status(struct mac_device_info *hw,
>  				struct stmmac_extra_stats *x)
>  {
> @@ -335,8 +303,12 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
>  
>  	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
>  
> -	if (intr_status & PCS_RGSMIIIS_IRQ)
> -		dwmac1000_rgsmii(ioaddr, x);
> +	if (intr_status & PCS_RGSMIIIS_IRQ) {
> +		/* TODO Dummy-read to clear the IRQ status */
> +		readl(ioaddr + GMAC_RGSMIIIS);

This seems to me that you're doing the TODO here? Maybe I'm
misunderstanding... maybe not :)

> +		phylink_pcs_change(&hw->mac_pcs, false);
> +		x->irq_rgmii_n++;
> +	}
>  
>  	return ret;
>  }
> @@ -404,9 +376,71 @@ static void dwmac1000_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
>  	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
>  }
>  
> -static void dwmac1000_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
> +static int dwmac1000_mii_pcs_validate(struct phylink_pcs *pcs,
> +				      unsigned long *supported,
> +				      const struct phylink_link_state *state)
> +{
> +	/* Only support in-band */
> +	if (!test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, state->advertising))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int dwmac1000_mii_pcs_config(struct phylink_pcs *pcs,
> +				    unsigned int neg_mode,
> +				    phy_interface_t interface,
> +				    const unsigned long *advertising,
> +				    bool permit_pause_to_mac)
>  {
> -	dwmac_get_adv_lp(ioaddr, GMAC_PCS_BASE, adv);
> +	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
> +
> +	return dwmac_pcs_config(hw, neg_mode, interface, advertising,
> +				GMAC_PCS_BASE);
> +}
> +
> +static void dwmac1000_mii_pcs_get_state(struct phylink_pcs *pcs,
> +					struct phylink_link_state *state)
> +{
> +	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
> +	unsigned int spd_clk;
> +	u32 status;
> +
> +	status = readl(hw->pcsr + GMAC_RGSMIIIS);
> +
> +	state->link = status & GMAC_RGSMIIIS_LNKSTS;
> +	if (!state->link)
> +		return;
> +
> +	spd_clk = FIELD_GET(GMAC_RGSMIIIS_SPEED, status);
> +	if (spd_clk == GMAC_RGSMIIIS_SPEED_125)
> +		state->speed = SPEED_1000;
> +	else if (spd_clk == GMAC_RGSMIIIS_SPEED_25)
> +		state->speed = SPEED_100;
> +	else if (spd_clk == GMAC_RGSMIIIS_SPEED_2_5)
> +		state->speed = SPEED_10;
> +
> +	state->duplex = status & GMAC_RGSMIIIS_LNKMOD_MASK ?
> +			DUPLEX_FULL : DUPLEX_HALF;
> +
> +	dwmac_pcs_get_state(hw, state, GMAC_PCS_BASE);
> +}
> +
> +static const struct phylink_pcs_ops dwmac1000_mii_pcs_ops = {
> +	.pcs_validate = dwmac1000_mii_pcs_validate,
> +	.pcs_config = dwmac1000_mii_pcs_config,
> +	.pcs_get_state = dwmac1000_mii_pcs_get_state,
> +};
> +
> +static struct phylink_pcs *
> +dwmac1000_phylink_select_pcs(struct stmmac_priv *priv,
> +			     phy_interface_t interface)
> +{
> +	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
> +	    priv->hw->pcs & STMMAC_PCS_SGMII)
> +		return &priv->hw->mac_pcs;
> +
> +	return NULL;
>  }
>  
>  static void dwmac1000_debug(struct stmmac_priv *priv, void __iomem *ioaddr,
> @@ -499,6 +533,7 @@ static void dwmac1000_set_mac_loopback(void __iomem *ioaddr, bool enable)
>  
>  const struct stmmac_ops dwmac1000_ops = {
>  	.core_init = dwmac1000_core_init,
> +	.phylink_select_pcs = dwmac1000_phylink_select_pcs,
>  	.set_mac = stmmac_set_mac,
>  	.rx_ipc = dwmac1000_rx_ipc_enable,
>  	.dump_regs = dwmac1000_dump_regs,
> @@ -514,7 +549,6 @@ const struct stmmac_ops dwmac1000_ops = {
>  	.set_eee_pls = dwmac1000_set_eee_pls,
>  	.debug = dwmac1000_debug,
>  	.pcs_ctrl_ane = dwmac1000_ctrl_ane,
> -	.pcs_get_adv_lp = dwmac1000_get_adv_lp,
>  	.set_mac_loopback = dwmac1000_set_mac_loopback,
>  };
>  
> @@ -549,5 +583,8 @@ int dwmac1000_setup(struct stmmac_priv *priv)
>  	mac->mii.clk_csr_shift = 2;
>  	mac->mii.clk_csr_mask = GENMASK(5, 2);
>  
> +	mac->mac_pcs.ops = &dwmac1000_mii_pcs_ops;
> +	mac->mac_pcs.neg_mode = true;
> +
>  	return 0;
>  }
> -- 
> 2.30.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
