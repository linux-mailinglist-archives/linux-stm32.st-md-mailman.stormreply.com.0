Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 759099268D6
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 21:08:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D801C71280;
	Wed,  3 Jul 2024 19:08:29 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D4D5C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 19:08:21 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ee8911b451so7892641fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720033700; x=1720638500;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hlntWaXrDgE6HSswwW9oXi0jbGPL9ArLggt0x5XmFrg=;
 b=bzmIYit7i/pP469TCBTwaoZ7kn+D8X0dO7xGeoEP2dxYfpy1fpIASk3DM3n9i1KloZ
 axZrHs9vgu41ZTpc8mU6teGXXDig0C5OPQ6NnIMG6240m8HbIkVqW7/r1oABLsbPY7GI
 PFIyjNUb/PbCFNJbZThFCTNTLKS3Yl2WI3ASP9mHKhGtylTgXXBhqxxtMhR9D/5gDOLf
 zBWSztDx92erAZIKH3pNSzsFBWVwR9QmyPBH7CA5ByvDk2Ck0zIx2HqN/ZQQ74yFg19g
 ub74QrJlMje1FEGMH1NkEQ93od5hVcaDMM+CFmcoKe+S7GXojoT0Y85+fpkhRBNXe5xA
 9Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720033700; x=1720638500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hlntWaXrDgE6HSswwW9oXi0jbGPL9ArLggt0x5XmFrg=;
 b=oHvTAR+qcZgdPSB7TH+LKKmrUseUHViuU+4YpkbyzoN1riOpCW6UjZkVGeG2DgHloB
 vxS8I/dK4Qu+Tc5W5bKFUh/kbFeV2THeiFlnNDYEnW+X9dt8rKzHtxgMTi4vXPSXpmMA
 816Dl72zHAUboFC5AobhoFOi7P5raYzvxxSfnQ+xYiKbPszC/JZopEtilov87qzn8it9
 gPemL33Lcw8hr6NI4uXa/4qqAYFLJ6Dqa3u/LKLd2QaKB5prmGQnSvp4H2bEWXWtWTj2
 mo/bgfOW5nP9XxSNJKSeCbpkXG+f2qVoKKDR8e7wfufY3IwJjjht2ij/hKyUtGclFnHu
 lQnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqeoLTJ1BXmmw4oYvh2V0dbxDJv/ufxY8lhHgKHCLOsaFhM1AsTrzidaDM3pOZ8npHFIaGLeKfipgA/mXRgq7/e59ujyimsz0PS9HHath2plsw7TzwxI3l
X-Gm-Message-State: AOJu0YzPnwni7Zrq2frNRIxlgmshhZOwDzQKRQfzTB2UONZeuwMchG6k
 vdBo85o8E2XxgFcRhWjGXAEoQ7Ygua2ubtC+vUvw6mXqoHQv07Nx
X-Google-Smtp-Source: AGHT+IEhYsRvNc0lqvVe3TlXD9DWFvBg0+oQz1UgPDpTJWstt7MI64FMmex1waX5Hsqm8bgi3ztE2Q==
X-Received: by 2002:a2e:9ed2:0:b0:2ec:5699:5e6 with SMTP id
 38308e7fff4ca-2ee5e37ff7cmr75446691fa.26.1720033700085; 
 Wed, 03 Jul 2024 12:08:20 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5a11d48asm16798821fa.100.2024.07.03.12.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 12:08:19 -0700 (PDT)
Date: Wed, 3 Jul 2024 22:08:16 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <4q6a2vo23clanqs36e2idzjybh7ugp7pxqldeyhkk4upfn4lhp@75mz4t7rbhjm>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-6-fancer.lancer@gmail.com>
 <Zn7Rwt9KNac2mMah@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zn7Rwt9KNac2mMah@shell.armlinux.org.uk>
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

On Fri, Jun 28, 2024 at 04:07:46PM +0100, Russell King (Oracle) wrote:
> On Mon, Jun 24, 2024 at 04:26:31PM +0300, Serge Semin wrote:
> > @@ -621,7 +548,6 @@ int dwmac1000_setup(struct stmmac_priv *priv)
> >  	mac->mii.clk_csr_shift = 2;
> >  	mac->mii.clk_csr_mask = GENMASK(5, 2);
> >  
> > -	mac->mac_pcs.ops = &dwmac1000_mii_pcs_ops;
> >  	mac->mac_pcs.neg_mode = true;
> 
> "mac->mac_pcs.neg_mode = true;" is a property of the "ops" so should
> move with it.
> 
> > @@ -1475,7 +1396,6 @@ int dwmac4_setup(struct stmmac_priv *priv)
> >  	mac->mii.clk_csr_mask = GENMASK(11, 8);
> >  	mac->num_vlan = dwmac4_get_num_vlan(priv->ioaddr);
> >  
> > -	mac->mac_pcs.ops = &dwmac4_mii_pcs_ops;
> >  	mac->mac_pcs.neg_mode = true;
> 
> Also applies here.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > index 3666893acb69..c42fb2437948 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > @@ -363,6 +363,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
> >  		mac->tc = mac->tc ? : entry->tc;
> >  		mac->mmc = mac->mmc ? : entry->mmc;
> >  		mac->est = mac->est ? : entry->est;
> > +		mac->mac_pcs.ops = mac->mac_pcs.ops ?: entry->pcs;
> 

> Removing both of the above means that mac->mac_pcs.ops won't ever be set
> prior to this, so this whole thing should just be:
> 
> 		mac->mac_pcs.ops = entry->pcs;
> 		mac->mac_pcs.neg_mode = true;

Actually, no. mac->mac_pcs.ops can be set by the platform-specific
plat_stmmacenet_data::setup() method.

> 
> > +static void dwmac_pcs_get_state(struct phylink_pcs *pcs,
> > +				struct phylink_link_state *state)
> >  {
> > +	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
> >  	struct stmmac_priv *priv = hw->priv;
> >  	u32 val;
> >  
> > +	val = stmmac_pcs_get_config_reg(priv, hw);
> > +
> > +	/* TODO The next is SGMII/RGMII/SMII-specific */
> > +	state->link = !!(val & PCS_CFG_LNKSTS);
> > +	if (!state->link)
> > +		return;
> > +
> > +	switch (FIELD_GET(PCS_CFG_LNKSPEED, val)) {
> > +	case PCS_CFG_LNKSPEED_2_5:
> > +		state->speed = SPEED_10;
> > +		break;
> > +	case PCS_CFG_LNKSPEED_25:
> > +		state->speed = SPEED_100;
> > +		break;
> > +	case PCS_CFG_LNKSPEED_250:
> > +		state->speed = SPEED_1000;
> > +		break;
> > +	default:
> > +		netdev_err(priv->dev, "Unknown speed detected\n");
> > +		break;
> > +	}
> > +
> > +	state->duplex = val & PCS_CFG_LNKMOD ? DUPLEX_FULL : DUPLEX_HALF;
> > +
> > +	/* TODO Check the PCS_AN_STATUS.Link status here?.. Note the flag is latched-low */
> > +
> > +	/* TODO The next is the TBI/RTBI-specific and seems to be valid if PCS_AN_STATUS.ANC */
> >  	val = readl(priv->pcsaddr + PCS_ANE_LPA);
> 

> I thought these registers only existed of dma_cap.pcs is true ?

Right. The AN-registers are SGMII/TBI/RTBI-specific.

> If we
> start checking PCS_AN_STATUS.Link here, and this register reads as
> zeros, doesn't it mean that RMGII inband mode won't ever signal link
> up?

Right. The PCS_AN_STATUS.Link should be checked for the SGMII (and
TBI/RTBI) only. The databooks defines the flag as follows:

DW GMAC v3.73a:
Link Status   This bit indicates whether the data channel (link) is up or
R_SS_SC_LLO   down. For the TBI, RTBI or SGMII interfaces, if ANEG is going
              on, data cannot be transferred across the link and hence the
              link is given as down.

DW QoS Eth:
Link Status   When this bit is set, it indicates that the link is up between
Read-only     the MAC and the TBI, RTBI, or SGMII interface. When this bit is
              reset, it indicates that the link is down between the MAC and
              the TBI, RTBI, or SGMII interface.

I guess that in fact the flag semantics is the same on both devices.
But the Access-status for some reason different. Although DW QoS Eth
databook doesn't define any latched-low CSR. So there is a chance that
some of the databooks might be wrong in the flag access status.

> 
> >  
> > -	/* TODO Make sure that STMMAC_PCS_PAUSE STMMAC_PCS_ASYM_PAUSE usage is legitimate */
> > +	/* TODO The databook says the encoding is defined in IEEE 802.3z,
> > +	 * Section 37.2.1.4. Do we need the STMMAC_PCS_PAUSE and
> > +	 * STMMAC_PCS_ASYM_PAUSE mask here?
> > +	 */
> >  	linkmode_mod_bit(ETHTOOL_LINK_MODE_Pause_BIT,
> >  			 state->lp_advertising,
> >  			 FIELD_GET(PCS_ANE_PSE, val) & STMMAC_PCS_PAUSE);
> 

> If it's 802.3z aka 1000base-X format, then yes, we should be using
> these bits if we are getting state from this register.

I meant that should we be using the driver-specific macro in here
seeing the field encoding is defined by the IEEE 802.3z? Is there any
ready-to-use macros/constants defined in the network subsystem core
for the standard Pause encoding (IEEE 802.3z Section 37.2.1.4)?

> 
> If TBI/RTBI is ever used, rather than trying to shoe-horn it all into
> these functions, please consider splitting them into separate PCSes,
> and sharing code between them e.g. using common functions called from
> the method functions or shared method functions where appropriate.

Ok. Sounds reasonable.

I guess your message also means that the patchset re-spinning will be
on me from now, right?) If so, please note, I can't promise I'll be
able to do that soonish. I am quite busy at the moment. I'll be
more-or-less free for that in a month or so.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
