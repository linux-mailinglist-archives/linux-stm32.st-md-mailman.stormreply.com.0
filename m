Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E28BFDCE0
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:23:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C060C5E2D8;
	Wed, 22 Oct 2025 18:23:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41D10C5E2D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kt5HidSb6xkRGWxoBaNt52wPsH3u1Zf7gYVwAQOjbyE=; b=KRV2gabIuAHKCA2bR3TFyg37Ot
 8grILVv1y2mAuzQh8SM6YPUPC6DVTocs8MCRSgLTJTs+luotqmjScfW0CB6UwsnCpZL72KRjpgoFJ
 28sAaCiJ+UjCEel7jcqgd2okiqhaIw36zpO+CtaP4ajUm72ADnAV58C4lbUM4i4kmmDN9okFLtvoH
 IXHu6WJBu70qAWnRCa8AvANYNesWBbgtSyOxAgpPc36uCl6z6iw0b9NTt8zdba21Q0scwDPDDkBVR
 5VviXoafsaPQ2ifn2UwD0JyCO8oHRWh+fRHKvLO0PPIA4EMbOH/5ZBmsGoZBjoPOVzT8tEMfTGtVA
 AcDDVXEQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55460)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBdUc-000000005JH-1XpL;
 Wed, 22 Oct 2025 19:23:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBdUa-000000000vO-2zLy; Wed, 22 Oct 2025 19:23:24 +0100
Date: Wed, 22 Oct 2025 19:23:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aPkhHIMJAYNEj_6Z@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
 <6bff48d0-dd19-48d4-91e6-0d991365b8f9@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bff48d0-dd19-48d4-91e6-0d991365b8f9@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: phylink: add phylink
 managed MAC Wake-on-Lan support
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

On Wed, Oct 22, 2025 at 04:06:00PM +0200, Maxime Chevallier wrote:
> >  int phylink_ethtool_set_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
> >  {
> > +	struct ethtool_wolinfo w;

...

> > +			phy_ethtool_get_wol(pl->phydev, &w);
> > +
> > +			/* Any Wake-on-Lan modes which the PHY is handling
> > +			 * should not be passed on to the MAC.
> > +			 */
> > +			wolopts &= ~w.wolopts;
> 
> When PHY drivers gets converted to the new model, we'll have to look at
> how the .get_wol() behave WRT how they fill-in their wolopts.
> 
> The Broadcom driver for example may not set w.wolopts to 0 :
> 
>   https://elixir.bootlin.com/linux/v6.17.4/source/drivers/net/phy/broadcom.c#L1121
> 
> You'd probably end-up with garbage here then. But not blocking for your series.

Good point. We should initialise 'w' in the same way other users do, so:

+       struct ethtool_wolinfo w = { .cmd = ETHTOOL_GWOL };

Does your r-b still stand with this change?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
