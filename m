Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58D927E05
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 21:56:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95093C71282;
	Thu,  4 Jul 2024 19:56:31 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72268C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 19:56:24 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so4894201fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2024 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720122983; x=1720727783;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T5hX7DNMSGVPeQt2ruoRa6Yr82t4hcURljOV5Qu5BwY=;
 b=fTKoEC7bXczry7VYVmud5ZeMqN9JK/LarJas2g7rKF5mbJEfAmGpnr+xF7tbAxhwBr
 JXYw0I3uGti66OH2PrnsUQMTABChqg7d6uOp249JALHaUnRuHPssVPj8272bk4/ErIe2
 DtWSPjpK4yK7UgxyObQCFtQsDQoU4/jIVPmriezCXyLxrfXQ2plu1TOavN5i5yXuEcr5
 0yHVARXgYPyXhB9fQAFry3EbpkfNw51ZPlQ90C82oNl+GGbyWOTB8bmqmCW1KBQwXmPT
 IUZc41UIqZ1HuRk/ft9IImcOgXNBQI7bx4fKzOhH6TCo1/u/5JWoATks56Qq47fvGAK2
 AnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720122983; x=1720727783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5hX7DNMSGVPeQt2ruoRa6Yr82t4hcURljOV5Qu5BwY=;
 b=npSvTUMUe45UrTvpT55qPNkwQsB29fffAR2AN7ag4O65rOjOc6rT4Lr4WDJHqLYUBm
 1ah2V7ejluKtDObn7wvY+cq6/WMLyEtgm0Tri6pxd6Le984BWK737AK6QOLjPJG04ElR
 V6EFf6GqsvXRRLWKSlTCqvUeg6M6TedTFywVcj6oHmvFP4cFvAXW86O37pTXxLi48fLU
 dAJ5bNXBYLIJ49k/wvilvR+0HwIdsOX1/X+ddy6yyyDvGrZHiyjzdj7pzBPGT7gytiJc
 /eiZzy4eKFtZ1+JkYB+u8kcXak0LGO+jpvJgcdeHspzw+36hmnNuE5izNQfcM1m/elbp
 EXeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQu0FsGwWmDGzVLb471kaRrCyX5dNswAi9/ki3f+H+gHzEMHZCEOIT7ijSCsAdO+eRoSoQoJf+HWNVLwoRdsqRGKYJpnYSZCnX9TVMJ3niJtyCfEcOYOKK
X-Gm-Message-State: AOJu0Yz4Sg0FHGSsTZ7fI1PQ19aOr15H/qTw1wfa4+Rr7oaYnHS/uABm
 PdSuol1zaj8eM0qCTB3Nc6qLc3nmxWJjKpNtDj7DKDJcS1eMcx+l
X-Google-Smtp-Source: AGHT+IGbU17GjcUH7kKqzQCOajDryup2rgaM1Kxc28/sqbd8meWamzP4ZHG3VTliJxJ1isrF/OA3gA==
X-Received: by 2002:ac2:596a:0:b0:52e:767a:ada7 with SMTP id
 2adb3069b0e04-52ea06ba8afmr1576303e87.50.1720122982057; 
 Thu, 04 Jul 2024 12:56:22 -0700 (PDT)
Received: from mobilestation ([95.79.180.161])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab0bbf0sm2585230e87.25.2024.07.04.12.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 12:56:21 -0700 (PDT)
Date: Thu, 4 Jul 2024 22:56:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <3mpvgoh6sdyccpppmwkoqugvoyv3spgyry47gg6sjmpg5es3iy@zqd3p3k6lpnn>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-6-fancer.lancer@gmail.com>
 <Zn7Rwt9KNac2mMah@shell.armlinux.org.uk>
 <4q6a2vo23clanqs36e2idzjybh7ugp7pxqldeyhkk4upfn4lhp@75mz4t7rbhjm>
 <ZoWvejkng/Ch/YIz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZoWvejkng/Ch/YIz@shell.armlinux.org.uk>
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

On Wed, Jul 03, 2024 at 09:07:22PM +0100, Russell King (Oracle) wrote:
> On Wed, Jul 03, 2024 at 10:08:16PM +0300, Serge Semin wrote:
> > On Fri, Jun 28, 2024 at 04:07:46PM +0100, Russell King (Oracle) wrote:
> > > On Mon, Jun 24, 2024 at 04:26:31PM +0300, Serge Semin wrote:
> > > > @@ -621,7 +548,6 @@ int dwmac1000_setup(struct stmmac_priv *priv)
> > > >  	mac->mii.clk_csr_shift = 2;
> > > >  	mac->mii.clk_csr_mask = GENMASK(5, 2);
> > > >  
> > > > -	mac->mac_pcs.ops = &dwmac1000_mii_pcs_ops;
> > > >  	mac->mac_pcs.neg_mode = true;
> > > 
> > > "mac->mac_pcs.neg_mode = true;" is a property of the "ops" so should
> > > move with it.
> > > 
> > > > @@ -1475,7 +1396,6 @@ int dwmac4_setup(struct stmmac_priv *priv)
> > > >  	mac->mii.clk_csr_mask = GENMASK(11, 8);
> > > >  	mac->num_vlan = dwmac4_get_num_vlan(priv->ioaddr);
> > > >  
> > > > -	mac->mac_pcs.ops = &dwmac4_mii_pcs_ops;
> > > >  	mac->mac_pcs.neg_mode = true;
> > > 
> > > Also applies here.
> > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > > index 3666893acb69..c42fb2437948 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > > @@ -363,6 +363,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
> > > >  		mac->tc = mac->tc ? : entry->tc;
> > > >  		mac->mmc = mac->mmc ? : entry->mmc;
> > > >  		mac->est = mac->est ? : entry->est;
> > > > +		mac->mac_pcs.ops = mac->mac_pcs.ops ?: entry->pcs;
> > > 
> > 
> > > Removing both of the above means that mac->mac_pcs.ops won't ever be set
> > > prior to this, so this whole thing should just be:
> > > 
> > > 		mac->mac_pcs.ops = entry->pcs;
> > > 		mac->mac_pcs.neg_mode = true;
> > 
> > Actually, no. mac->mac_pcs.ops can be set by the platform-specific
> > plat_stmmacenet_data::setup() method.
> 
> mac->mac_pcs is there for the _internal_ MAC only, not for platforms
> to fiddle around with (remember, my patch set adds this!)
> 
> I think you're thinking of mac->phylink_pcs which platforms can and
> do fiddle with.

Actually I did mean mac->mac_pcs.ops. AFAICS the stmmac_hwif_init()
method semantics implies that the plat_stmmacenet_data::setup()
function responsibility is to allocate the mac_device_info instance
and pre-initialize it' fields with the data specific for the
particular device including the DW MAC HW-interface ops. Like it's
done in the dwmac-sun8i.c driver (and in the currently being reviewed
Loongson GMAC/GNET series). So I suppose it should also concern the
internal PCS ops implementation being added by you. In case if some
particular controller has some internal PCS peculiarities required to
be fixed on the PHY-link PCS ops implementation level. No?

> 
> > > > +	/* TODO Check the PCS_AN_STATUS.Link status here?.. Note the flag is latched-low */
> > > > +
> > > > +	/* TODO The next is the TBI/RTBI-specific and seems to be valid if PCS_AN_STATUS.ANC */
> > > >  	val = readl(priv->pcsaddr + PCS_ANE_LPA);
> > > 
> > 
> > > I thought these registers only existed of dma_cap.pcs is true ?
> > 
> > Right. The AN-registers are SGMII/TBI/RTBI-specific.
> 

> Therefore, I suggest that if state->interface is RGMII, then these
> registers should not be accessed.

Fully agree.

> 
> My idea is to provide two PCS per MAC:
> 
> One simple one which covers RGMII which only reads the PHYIF/RGSMIIIS
> register, does no configuration, but does implement the .pcs_enable/
> .pcs_disable etc. The .pcs_validate method should also be empty for
> this because the AutoNeg ethtool capability does not refer to the
> inband signalling, but to the media PHY.
> 
> Then a more complex PCS implementation that does everything the RGMII
> one does, but also the bits for SGMII (and TBI/RTBI).

Agreed. Good idea.

> 
> > > If we
> > > start checking PCS_AN_STATUS.Link here, and this register reads as
> > > zeros, doesn't it mean that RMGII inband mode won't ever signal link
> > > up?
> > 
> > Right. The PCS_AN_STATUS.Link should be checked for the SGMII (and
> > TBI/RTBI) only. The databooks defines the flag as follows:
> > 
> > DW GMAC v3.73a:
> > Link Status   This bit indicates whether the data channel (link) is up or
> > R_SS_SC_LLO   down. For the TBI, RTBI or SGMII interfaces, if ANEG is going
> >               on, data cannot be transferred across the link and hence the
> >               link is given as down.
> > 
> > DW QoS Eth:
> > Link Status   When this bit is set, it indicates that the link is up between
> > Read-only     the MAC and the TBI, RTBI, or SGMII interface. When this bit is
> >               reset, it indicates that the link is down between the MAC and
> >               the TBI, RTBI, or SGMII interface.
> > 
> > I guess that in fact the flag semantics is the same on both devices.
> > But the Access-status for some reason different. Although DW QoS Eth
> > databook doesn't define any latched-low CSR. So there is a chance that
> > some of the databooks might be wrong in the flag access status.
> 
> Yes, it sounds like it.
> 
> > > > -	/* TODO Make sure that STMMAC_PCS_PAUSE STMMAC_PCS_ASYM_PAUSE usage is legitimate */
> > > > +	/* TODO The databook says the encoding is defined in IEEE 802.3z,
> > > > +	 * Section 37.2.1.4. Do we need the STMMAC_PCS_PAUSE and
> > > > +	 * STMMAC_PCS_ASYM_PAUSE mask here?
> > > > +	 */
> > > >  	linkmode_mod_bit(ETHTOOL_LINK_MODE_Pause_BIT,
> > > >  			 state->lp_advertising,
> > > >  			 FIELD_GET(PCS_ANE_PSE, val) & STMMAC_PCS_PAUSE);
> > > 
> > 
> > > If it's 802.3z aka 1000base-X format, then yes, we should be using
> > > these bits if we are getting state from this register.
> > 
> > I meant that should we be using the driver-specific macro in here
> > seeing the field encoding is defined by the IEEE 802.3z? Is there any
> > ready-to-use macros/constants defined in the network subsystem core
> > for the standard Pause encoding (IEEE 802.3z Section 37.2.1.4)?
> 
> include/uapi/linux/mii.h:
> 
> #define ADVERTISE_1000XFULL     0x0020  /* Try for 1000BASE-X full-duplex */
> 	/* GMAC_ANE_FD */
> #define ADVERTISE_1000XHALF     0x0040  /* Try for 1000BASE-X half-duplex */
> 	/* GMAC_ANE_HD */
> #define ADVERTISE_1000XPAUSE    0x0080  /* Try for 1000BASE-X pause    */
> 	/* GMAC_ANE_PSE bit 0 */
> #define ADVERTISE_1000XPSE_ASYM 0x0100  /* Try for 1000BASE-X asym pause */
> 	/* GMAC_ANE_PSE bit 1 */
> #define ADVERTISE_LPACK         0x4000  /* Ack link partners response  */
> 	/* GMAC_ANE_ACK */
> 
> #define LPA_1000XFULL           0x0020  /* Can do 1000BASE-X full-duplex */
> 	/* GMAC_ANE_FD */
> #define LPA_1000XHALF           0x0040  /* Can do 1000BASE-X half-duplex */
> 	/* GMAC_ANE_HD */
> #define LPA_1000XPAUSE          0x0080  /* Can do 1000BASE-X pause     */
> 	/* GMAC_ANE_PSE bit 0 */
> #define LPA_1000XPAUSE_ASYM     0x0100  /* Can do 1000BASE-X pause asym*/
> 	/* GMAC_ANE_PSE bit 1 */
> #define LPA_RESV                0x1000  /* Unused...                   */
> 	/* GMAC_ANE_RFE bit 0 */
> #define LPA_RFAULT              0x2000  /* Link partner faulted        */
> 	/* GMAC_ANE_RFE bit 1 */
> #define LPA_LPACK               0x4000  /* Link partner acked us       */
> 	/* GMAC_ANE_ACK */

Got it. Thanks.

> 
> > > If TBI/RTBI is ever used, rather than trying to shoe-horn it all into
> > > these functions, please consider splitting them into separate PCSes,
> > > and sharing code between them e.g. using common functions called from
> > > the method functions or shared method functions where appropriate.
> > 
> > Ok. Sounds reasonable.
> > 
> > I guess your message also means that the patchset re-spinning will be
> > on me from now, right?) If so, please note, I can't promise I'll be
> > able to do that soonish. I am quite busy at the moment. I'll be
> > more-or-less free for that in a month or so.
> 
> Not necessarily - some good news today, the high priority issue I was
> working on is lower priority at last, which means I've more time to
> look at mainline again. Bad news... I need a break after about 2.5
> months of frustrations, which could be from this weekend!
> 
> Given the fix for the LNKMOD issue, I suspect that won't be merged
> into net-next until after the weekend, but I'll see whether I can
> sneak a respin of the patch set once that's happened. That said,
> given that we'll be at -rc7, it's likely too late to be thinking
> about getting the PCS changes queued up for this coming merge
> window. In any case, I don't think even if I did post a series, we're
> at the point where we have something that would be ready.

Ok. Let me know what is going to be my part in the next patch set
revision preparation and when my help is needed. I think I'll be able
to allocate some evenings and a few weekend days for that in this
month. I very much hope my work schedule will be less occupied in the
next month.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
