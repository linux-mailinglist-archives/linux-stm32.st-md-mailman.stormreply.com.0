Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C692767F
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 14:55:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9081DC71287;
	Thu,  4 Jul 2024 12:55:38 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 710AFC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 12:55:31 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so6132351fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2024 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720097731; x=1720702531;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IisAl8oOfrfYeQcJjMJI5kRn1qwRcjc/z7zNpbMqBTM=;
 b=DP4JppiglKa5Ri5SGiRYKHUzMgAxaEl0sKuDfbv6srzxwWUs0aJlfc70qk0iPPRnQ7
 II1H1svtfRUVtCB7D13db6fzW7SyBa0JD/jYvbJXmf5IVCkLLSFgugJoCxR+q1hBuHF5
 pSa2JxLGYxVpTzpESnlz+BfMBrX2EYiipkVMR/2ZF6B0TIbVfCgOVnDKEyL+C9HKgz9N
 T/p8xd30xX7R5H1QKw8VaRg9vi9c3Dk663XjfI4dzgQ1XDyfLYY3OYKH+YwKO7Mx1sok
 1s1913Uy+yVWv+8tc137l2/3bviHwecIb7nwoATTJHerw+mWc6gEfZd+sTDCq76nVuoz
 HMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720097731; x=1720702531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IisAl8oOfrfYeQcJjMJI5kRn1qwRcjc/z7zNpbMqBTM=;
 b=W+e8SQfwCa8J8hCY2ZLP32QvPhVOyqe5TQyq03o0kY+U17dCd3abjsbrFJ7TthgUd2
 Z4Jkjb372ti/jXRZm0PI9FIaT2hcD+pcHD2q+ufQg1D9iKCjxx6tRGN1tsYvEfU598AY
 WcvAZiknd0SxS2AE82+3NEQGKR5VfrW1fsCqzBukID4Ts3XGeWA/1dveRzm/LwFt5nHI
 4x/3L1vziA9P76ngq7diNQt7JYJBDf1n7IzVADUIHa+nGjtCucUvfodtmPdkYFQk+oVq
 QPwn6mcQ9mKiTmKl3qECloI3Ve0nEcPknE0WwWpvtF4kRQskFHeUwnxGa8gb6wLXesQ5
 a5Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuIoOuX5caItUt+dVRFKmPNwLKlhQNMWE3T5aQZZk30OpEnUWQLn1irXjoDEKJ2uTOAeV+iZw85pnE/aF+50Th9Gxpybm0sUkWQpvfbA6Pxf3WBmuvnaqK
X-Gm-Message-State: AOJu0YwsPm1XeVqI3DjoJt3BRQk6FpqHJrF1UeHaJcam2DYJKm8B3jf8
 Y7gTw8hVUap/AiticvWKTaSC2ANUl/Dy61qPZ/TjV+oDbgLtuXFa
X-Google-Smtp-Source: AGHT+IEcnKmz932eZFNiupiD0RMCnB+W3lPfatW6ACtn3Rdl9ux7hoIMymXOiaKWmYqYxATMK7TOgg==
X-Received: by 2002:a2e:a988:0:b0:2ee:7255:5047 with SMTP id
 38308e7fff4ca-2ee8ee0f784mr12540601fa.50.1720097730202; 
 Thu, 04 Jul 2024 05:55:30 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e72csm22567491fa.23.2024.07.04.05.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 05:55:29 -0700 (PDT)
Date: Thu, 4 Jul 2024 15:55:26 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <5dsv27tygpfsmaofdtswwlsfjxzxlwnnysdziqgdglkydgoqtg@qwssdirr42bd>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-8-fancer.lancer@gmail.com>
 <Zn7KZG+KDU01APar@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zn7KZG+KDU01APar@shell.armlinux.org.uk>
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

On Fri, Jun 28, 2024 at 03:36:20PM +0100, Russell King (Oracle) wrote:
> On Mon, Jun 24, 2024 at 04:26:33PM +0300, Serge Semin wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 72c2d3e2c121..743d356f6d12 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -950,13 +950,16 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
> >  {
> >  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> >  
> > +	if (priv->hw->pcs)
> > +		return &priv->hw->mac_pcs;
> > +
> >  	if (priv->hw->xpcs)
> >  		return &priv->hw->xpcs->pcs;
> >  
> >  	if (priv->hw->phylink_pcs)
> >  		return priv->hw->phylink_pcs;
> >  
> > -	return stmmac_mac_phylink_select_pcs(priv, interface);
> > +	return NULL;
> 
> I really really don't like this due to:
> 

> 1. I spent a long time working out what the priority here should be, and
> you've just thrown all that work away by changing it - to something that
> I believe is incorrect.
> 

Right, the correct precedence would be to use the external PCS if one
available. It's easy to fix anyway.

> 2. I want to eventually see this function checking the interface type
> before just handing out a random PCS,

The only problem is that currently it relies on the
plat_stmmaenet_data::mac_interface field value instead of parsing the
specified interface type.(

> and it was my intention to
> eventually that into the MACs own select_pcs() methods. Getting rid of
> those methods means that the MACs themselves now can't make the
> decision which is where that should be.

Ok. Why not. We can preserve the MAC-own select_pcs() method.
(See my last comment on this email for details.)

> 
> 3. When operating in RGMII "inband" mode, the .pcs_config etc doesn't
> make much sense (we're probably accessing registers that don't exist)

Absolutely right. Current dwmac_pcs_config() implementation is fully
SGMII/TBI/RTBI-specific.

> and I had plans to split this into a RGMII "PCS" which was just a PCS
> that implemented .pcs_get_state(), a stub .pcs_config(), and a separate
> fully-featured "SGMII PCS".

Actually it's a good idea. We should have that implemented in v3.

> 
> So, I would like to eventually see here something like:
> 
> 	if (priv->hw->xpcs)
> 		return &priv->hw->xpcs->pcs;
> 
> 	if (priv->hw->phylink_pcs)
> 		return priv->hw->phylink_pcs;
> 
> 	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
> 		if (phy_interface_mode_is_rgmii(priv->plat->mac_interface))
> 			return &priv->hw->mac_rgmii_pcs;
> 
> 		if (priv->dma_cap.pcs &&
> 		    priv->plat->mac_interface == PHY_INTERFACE_MODE_SGMII)
> 			return &priv->hw->mac_sgmii_pcs;
> 	}
> 
> 	return NULL;

So the differences of my and your implementations are:
1. priv->hw->pcs field is utilized to determine the RGMII/SGMII PCS
availability (it's initialized in dwmac_pcs_init()).
2. The order of the PCS selection: internal PCS has precedence over
the external PCS'es.
3. There is a single PHY-link PCS descriptor for both RGMII "inband"
and SGMII PCSes.

There is nothing hard to settle the 2. and 3. notes. The only
problematic part is 1. due to the damn mac_device_info::ps field
implying the fixed-speed semantics for the MAC2MAC case. The field is
initialized in the stmmac_hw_setup() method based on the
mac_device_info::pcs field content. The mac_device_info::ps value is
then utilized in the stmmac_ops::core_init() methods and in
dwmac_pcs_config() to pre-define the link speed. Since I hadn't come
up with a good idea of what to do with that MAC2MAC stuff back then I
decided to preserve the mac_device_info::pcs-based semantics
everywhere.

But now I guess I've got a good idea. We can use the
plat_stmmacenet_data::mac_port_sel_speed field directly where it is
relevant. Like this:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:
static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
{
	// Drop everything priv->hw.pcs and priv->hw.ps related from here
	// due to the changes suggested further.
}

drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:
drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:
static void dwmac*_core_init(...)
{
	...
	// Directly use the plat_stmmacenet_data::mac_port_sel_speed value
	switch (priv->plat->mac_port_sel_speed) {
	case SPEED_1000:
		ps_speed = hw->link.speed1000;
		break;
	case SPEED_100:
		ps_speed = hw->link.speed100;
		break;
	case SPEED_10:
		ps_speed = hw->link.speed10;
		break;
	default:
		dev_warn(priv->device, "Unsupported port speed\n");
		break;
	}

	if (ps_speed) {
		value &= hw->link.speed_mask;
		value |= ps_speed | GMAC_CONFIG_TE;
	}
	...
}

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:
static void dwmac*_core_init(...)
{
	// There is no internal PCS in DW XGMACes. So we can freely drop
	// the hw->ps clause from here.
}

drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c:
static int dwmac_pcs_config(...)
{
	...
	// Directly use the plat_stmmacenet_data::mac_port_sel_speed value
	if (priv->plat->mac_port_sel_speed)
		val |= PCS_AN_CTRL_SGMRAL;
	...
}

After that we can freely drop the mac_device_info::ps and
mac_device_info::pcs fields. Thoughts?

> 
> > +void dwmac_pcs_init(struct mac_device_info *hw)
> > +{
> > +	struct stmmac_priv *priv = hw->priv;
> > +	int interface = priv->plat->mac_interface;
> > +
> > +	if (priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)
> > +		return;
> > +	else if (phy_interface_mode_is_rgmii(interface))
> > +		hw->pcs = STMMAC_PCS_RGMII;
> > +	else if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII)
> > +		hw->pcs = STMMAC_PCS_SGMII;
> > +
> > +	hw->mac_pcs.neg_mode = true;
> > +}
> 

> Please move "hw->mac_pcs.neg_mode = true;" to where the PCS method
> functions are implemented - it determines whether the PCS method
> functions take the AN mode or the neg mode, and this is a property of
> their implementations. It should not be split away from them.

Ok.

---

Seeing the series introducing the plat_stmmacenet_data::select_pcs()
method has been recently merged in, let's discuss the entire PCS
selection code a bit more. Taking into account what you said above I
guess we can implement something like this:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:
static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
                                                 phy_interface_t interface)
{
	// Platform-specific PCS selection method implying DW XPCS and
	// Lynx PCS selection (and internal PCS selection if relevant)
        if (priv->plat->select_pcs) {
                pcs = priv->plat->select_pcs(priv, interface);
                if (!IS_ERR(pcs))
                        return pcs;
        }

	// MAC-specific PCS selection method
	pcs = stmmac_mac_select_int_pcs(priv, priv->hw, priv->plat->mac_interface);
        if (!IS_ERR(pcs))
                return pcs;

        return NULL;
}

drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:
static struct phylink_pcs *dwmac1000_select_pcs(struct mac_device_info *hw,
						phy_interface_t interface)
{
	if (phy_interface_mode_is_rgmii(interface))
		return &hw->mac_rgmii_pcs;
	else if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII)
		return &hw->mac_sgmii_pcs;

	return NULLL
}

...

const struct stmmac_ops dwmac1000_ops = {
	...
	.select_pcs = dwmac1000_select_pcs,
	...
};

drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:
// The same changes as in the dwmac1000_core.c file.

drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c:
// Drop my dwmac_pcs_init() implementation if we get to eliminate the 
// mac_device_info::ps and mac_device_info::pcs fields as I suggested
// earlier in this message


So what do you think?

-Serge(y)

> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
