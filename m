Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A06059DB94D
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2024 15:12:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47BCDC7802D;
	Thu, 28 Nov 2024 14:12:15 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8A66C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Nov 2024 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=kftlvdSPNN2/qEIMi2IQIekU3CLHwUEfGfLj5UP8QHU=; b=h20AFG9jT3cuoAi2yE6w7EFyp3
 fj+TAnqizyy7nuytM97J2K97nfMOlvbGwli5n0+ZPpPl+czYij/Ku2QNYLKPPkNGDY6Y+14fRWG4n
 oHlkBTnWjaT+pNzB9buunLYN3St+uJ3k2RrdxU3IQ+MHMwq0vrEQbk93wIUCCO2Tcmqw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tGfFF-00EiC6-5Z; Thu, 28 Nov 2024 15:11:49 +0100
Date: Thu, 28 Nov 2024 15:11:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <4e0fd2d9-ab05-4e0c-9179-ca5c7572084f@lunn.ch>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3F-005yhT-AA@rmk-PC.armlinux.org.uk>
 <Z0b-nJ7bt8IlBMpz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z0b-nJ7bt8IlBMpz@shell.armlinux.org.uk>
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 02/23] net: phy: fix
 phy_ethtool_set_eee() incorrectly enabling LPI
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

On Wed, Nov 27, 2024 at 11:12:28AM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 26, 2024 at 12:52:21PM +0000, Russell King (Oracle) wrote:
> > @@ -1685,15 +1685,21 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
> >  static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
> >  				      const struct eee_config *old_cfg)
> >  {
> > -	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
> > +	bool enable_tx_lpi;
> > +
> > +	if (!phydev->link)
> > +		return;
> > +
> > +	enable_tx_lpi = phydev->eee_cfg.tx_lpi_enabled && phydev->eee_active;
> > +
> > +	if (phydev->enable_tx_lpi != enable_tx_lpi ||
> >  	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
> 
> I'm wondering whether this should be:
> 
> 	if (phydev->enable_tx_lpi != enable_tx_lpi ||
> 	    (phydev->enable_tx_lpi &&
> 	     phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer)) {
> 
> The argument for this change would be to avoid cycling the link when the
> LPI timer changes but we're not using LPI.
> 
> The argument against this change would be that then we don't program the
> hardware, and if the driver reads the initial value from hardware and
> is unbound/rebound, we'll lose that update whereas before the phylib
> changes, it would have been preserved.

unbound/rebound is a pretty unusual use case. I would not consider
that a strong argument against it.

This is the case where we don't need to perform negotiation. So it is
going to be a fast operation compared to when we do need negotiation.
So i wounder if we really need to care?  Donald Knuth, Premature
optimisation is the root of all evil, etc...

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
