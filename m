Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 829CB7898BC
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Aug 2023 21:01:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26D1CC6B44F;
	Sat, 26 Aug 2023 19:01:45 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F01F4C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 19:01:43 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2bccda76fb1so29699841fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693076503; x=1693681303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sjx31P2LOtZyDGEPab19XWTZreTskP8FhK51/PO/d54=;
 b=kpBWD7sl/M3yLXwzcq2uwFOjqS6WmYUzUGtZ81oF/H/WNmCRYQPCGDsfGdrkpd1cgn
 9bdwT9KAButJdCfOkhRB5gDS4uuCvmQVhVspF9zcOq5ElIsWDVCrALJfIikubeumaivT
 dG0fOIZ7NAQ2y/ygEHnB/NbHtYlattqsNGjA8m6eSmOY6lXF3etJ6T3ar3sQcBEE97Hj
 EaSpq8SBTiQbq/767JVZvRAYCqlSF9EJUVnO/mqWmgts5p9brgcP73dR3u1Ko6hff7P7
 U6utRmIb4T2qRkeldF2c8U44xXLxRPYHP2yK/ERlnBuUgT+lZiHrI9ftF7/cOxcB1TwE
 Nizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693076503; x=1693681303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjx31P2LOtZyDGEPab19XWTZreTskP8FhK51/PO/d54=;
 b=FA5hESMiF6blq83cyLHIdTK8FwoYTJgS7HxYxpBYhvUJqdXmNpVn5sgjTl8hwRwi5k
 VKPC3rxdXJQuQ2gRUdwDLLn1laTdHygBczTTXs/Otj9H4nglavtfaFjTDTKtHzNP8JJg
 1odcGwPL58l26fxrccTfMK7dmAbrabUz/ehYmlbeWfVv2+jV7jLC2g0fkfBuS7ygj/5x
 DTL/8aa18tXYhifKt9oEu/fJrrCCXElB3vaRARPvNG2EaN9J7WcvFSokWosWOf6MccxQ
 P79D9SUhbAMA/ICR6tmVbuG8E7ed+xHGQ8IIoghlZ0ru1m88t/MpXTGvRS8PXho6e6O9
 igsg==
X-Gm-Message-State: AOJu0YxglcYAOEl7tOEtHfHWMTGu5yHRcjFvgKEoikzqsvyG4UjkBx/t
 IZWo8G6giJODpolLj6icjJU=
X-Google-Smtp-Source: AGHT+IFx/KOtyNp+rwbc1cwhJ/nDV1vdBbxBCGXcpklWzuBdLo+Y9rB5znltnx+CmDXr1k5GEZLsFg==
X-Received: by 2002:a2e:9d96:0:b0:2bc:ce85:2de2 with SMTP id
 c22-20020a2e9d96000000b002bcce852de2mr11119882ljj.37.1693076502852; 
 Sat, 26 Aug 2023 12:01:42 -0700 (PDT)
Received: from mobilestation ([95.79.200.178])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a2e2e1a000000b002ba15c272e8sm902809lju.71.2023.08.26.12.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 12:01:42 -0700 (PDT)
Date: Sat, 26 Aug 2023 22:01:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <uw56ervtsa2uoovtsmoidkcfflhnwuv7cgj23qdebag3gry42n@inwwdqlbazg6>
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
 <E1qZAXd-005pUP-JL@rmk-PC.armlinux.org.uk>
 <rpwsyyjdzeixx3f7o3pxeslyff7yc3fuutm436ygjggoyiwjcb@7s3skg627mid>
 <ZOoRiVZiAyf7pArp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOoRiVZiAyf7pArp@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 08/10] net: stmmac: move xgmac
 specific phylink caps to dwxgmac2 core
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

On Sat, Aug 26, 2023 at 03:51:53PM +0100, Russell King (Oracle) wrote:
> On Sat, Aug 26, 2023 at 04:32:15PM +0300, Serge Semin wrote:
> > On Thu, Aug 24, 2023 at 02:38:29PM +0100, Russell King (Oracle) wrote:
> > > Move the xgmac specific phylink capabilities to the dwxgmac2 support
> > > core.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 10 ++++++++++
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 10 ----------
> > >  2 files changed, 10 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > index 34e1b0c3f346..f352be269deb 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > @@ -47,6 +47,14 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
> > >  	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
> > >  }
> > >  
> > > +static void xgmac_phylink_get_caps(struct stmmac_priv *priv)
> > > +{
> > > +	priv->phylink_config.mac_capabilities |= MAC_2500FD | MAC_5000FD |
> > > +						 MAC_10000FD | MAC_25000FD |
> > > +						 MAC_40000FD | MAC_50000FD |
> > > +						 MAC_100000FD;
> > > +}
> > > +
> > >  static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
> > >  {
> > >  	u32 tx = readl(ioaddr + XGMAC_TX_CONFIG);
> > > @@ -1490,6 +1498,7 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr, u32 num_txq,
> > >  
> > >  const struct stmmac_ops dwxgmac210_ops = {
> > >  	.core_init = dwxgmac2_core_init,
> > 
> > > +	.phylink_get_caps = xgmac_phylink_get_caps,
> > 
> > This doesn't look correct. DW XGMAC doesn't support 25/40/50/100Gbps
> > speeds.
> 
> So the reason this got added is to keep the code compatible with how
> things work today.
> 
> When priv->plat->has_xgmac is true, the old code in stmmac_phy_setup()
> would enable speeds from 2.5G up to 100G, limiting them if
> priv->plat->max_speed is set non-zero.

Indeed. I didn't consider it has been coded like that long before this
discussion.

> 
> The table in hwif.c matches when:
> 	entry->gmac == priv->plat->has_gmac,
> 	entry->gmac4 == priv->plat->has_gmac4 and
> 	entry->xgmac == priv->plat->has_xgmac
> 
> The entries in the table which patch on has_xgmac = true contain the
> following:
> 
>                 .mac = &dwxgmac210_ops,
>                 .mac = &dwxlgmac2_ops,
> 
> Therefore, to keep things compatible, I've effectively moved this
> initialisation into the new .phylink_get_caps method that is part of
> those two ops, and since they have has_xgmac true, this means that
> all these speeds need to be set.
> 
> We do this without regard to max_speed, which we apply separately,
> after the .phylink_get_caps method has returned.
> 
> So, the code is functionally identical to what happens in the driver,
> even if it is the case that xgmac210 doesn't actually support the
> speeds. If those extra speeds that the hardware doesn't support were
> present before, they're present after. If those extra speeds are
> limited by the max_speed, then they will be similarly limited.

> 
> While it may look odd, since the specifications for Synopsys are all
> behind closed doors, all I can do is transform the code - I can't
> know that such-and-such a core doesn't actually support stuff. So
> my only option is to keep the code bug-compatible.
> 

If I see odd things and have no specs at hand I normally dig into the
git log in order to find a respective commit, then get to finding the
corresponding lkml discussion which may have some clue of possible
oddness justification. In this case the problematic part was added in
the commit 8a880936e902 ("net: stmmac: Add XLGMII support"). So before
having the XLGMAC support added the DW XGMAC had had standard speeds
support. Seeing there were no discussion concerning that part of the
code within the review it was very likely wrong to add the higher
speeds support to the DW XMGAC controller. But of course with no
databook at hand it gets to be still an assumption but with high
probability to be true though.

> I think all I've done here is make it glaringly obvious what the old
> code is doing and you've spotted "but that isn't right!" - which is
> actually a good thing!
> 
> Feel free to submit patches to correct the functionality as bugs in
> the driver become more obvious!

I see your point. Ok I'll add such fix to my extensive collection of
the STMMAC driver bug-fixes.) I'll send it out to the community
eventually when I get to have more spare time for review.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
