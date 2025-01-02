Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA19FF746
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2025 10:09:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB3AEC7801F;
	Thu,  2 Jan 2025 09:09:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACEE5C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jan 2025 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N2/lJMrShdKFF/LCN9VGIHz6yfGl2Ad/fJkiczIYxJk=; b=L4pPXnCQ9/MJcPrdVq87EETWV0
 YDKENkOXhbSxIPBk+Fja0LuH8yLVErcGMrtKbOeNwLJrx0Q1b1cVhgbCsdctxHwteht7k98Ox7cLK
 MoRfX66zRHw7bblH1gYjqVZYzwdvk0Gj4o/vArejDnQkzany+qP73vcTOikSRfaME3xbZR7kxP0pw
 soBjvplC+RcHJpTBAxSoixRJaUArYlSYFBFjx1INgvnf6nBptKYRysgz0dkMaqUF5tukvPeVtAAmL
 Enhth10wOgC4RkuAx5idJIPV/id+reUcAeYsNI709XYEVelZVerZKiQABcdZZ3Uw/GIpbH+lcf0Y8
 yT9odH4Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43370)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tTHC9-0001nF-0g;
 Thu, 02 Jan 2025 09:08:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tTHC5-00008P-0K;
 Thu, 02 Jan 2025 09:08:41 +0000
Date: Thu, 2 Jan 2025 09:08:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <Z3ZXmAIAHmYVbdbl@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <E1tMBRQ-006vat-7F@rmk-PC.armlinux.org.uk>
 <20241217141912.34cdd5ae@fedora.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217141912.34cdd5ae@fedora.home>
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: use PCS
	supported_interfaces
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

On Tue, Dec 17, 2024 at 02:19:12PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On Fri, 13 Dec 2024 19:35:12 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Use the PCS' supported_interfaces member to build the MAC level
> > supported_interfaces bitmap.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index d45fd7a3acd5..0e45c4a48bb5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -1206,6 +1206,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
> >  	struct stmmac_mdio_bus_data *mdio_bus_data;
> >  	int mode = priv->plat->phy_interface;
> >  	struct fwnode_handle *fwnode;
> > +	struct phylink_pcs *pcs;
> >  	struct phylink *phylink;
> >  
> >  	priv->phylink_config.dev = &priv->dev->dev;
> > @@ -1227,8 +1228,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
> >  
> >  	/* If we have an xpcs, it defines which PHY interfaces are supported. */
> >  	if (priv->hw->xpcs)
> > -		xpcs_get_interfaces(priv->hw->xpcs,
> > -				    priv->phylink_config.supported_interfaces);
> > +		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> > +	else
> > +		pcs = priv->hw->phylink_pcs;
> > +
> > +	if (pcs)
> > +		phy_interface_or(priv->phylink_config.supported_interfaces,
> > +				 priv->phylink_config.supported_interfaces,
> > +				 pcs->supported_interfaces);
> >  
> >  	fwnode = priv->plat->port_node;
> >  	if (!fwnode)
> 
> I think that we could even make xpcs_get_interfaces a static
> non-exported function now :) But this can be done in a subsequent patch.

Yes, that can definitely be done. I already have a patch for this.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
