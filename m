Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73952A127CC
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 16:46:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F71BC78F6C;
	Wed, 15 Jan 2025 15:46:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1AEDC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S42DDkPynBO+hlx/lydV1Jlo7tr53yug/v0X8twoOEg=; b=l8/w4QtnpRqEdettHBVyIuwDZc
 FQUDLsKUwDsfX0FU+R6R6zH+4kJxJiXIusCizXwSzL9CDrdmB1o9Z80eWzDXY3N66R9sX1BOGThV5
 sX1gWOwdxP/KtnYUtwHXW2nOh8mSgg0XoQWKHuQbEz6+sPBhg1Iw6bECzNYzayfHXc3/erhqLcMBX
 iqnwITC6lTI+h+iZaiWVzf6cKHmOuZSHK537q+kFKlXc/fGWNpgwZM+1EN5oURRfVsdRn6gKBHK5z
 lDFgQPB1PaDAZE9XwDJqu4ddD5hWi63LZ4/DkYq/Xbc6zn1UrxhsJtIgnb9EZFFPB/rKul1Wl/aK3
 lIcmiF4Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56716)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tY5b9-0001MY-2b;
 Wed, 15 Jan 2025 15:46:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tY5b6-0006H7-2H;
 Wed, 15 Jan 2025 15:46:24 +0000
Date: Wed, 15 Jan 2025 15:46:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <Z4fYUAxIG6k0Uuka@shell.armlinux.org.uk>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhUz-000n0k-IY@rmk-PC.armlinux.org.uk>
 <20250115155354.0acdacc7@fedora.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115155354.0acdacc7@fedora.home>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 06/10] net: mvpp2: add EEE
	implementation
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

On Wed, Jan 15, 2025 at 03:53:54PM +0100, Maxime Chevallier wrote:
> Hello Russell,
> 
> On Tue, 14 Jan 2025 14:02:29 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Add EEE support for mvpp2, using phylink's EEE implementation, which
> > means we just need to implement the two methods for LPI control, and
> > with the initial configuration. Only SGMII mode is supported, so only
> > 100M and 1G speeds.
> > 
> > Disabling LPI requires clearing a single bit. Enabling LPI needs a full
> > configuration of several values, as the timer values are dependent on
> > the MAC operating speed.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > --
> > v3: split LPI timer limit and validation into separate patches
> > ---
> >  drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  5 ++
> >  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 86 +++++++++++++++++++
> >  2 files changed, 91 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > index 9e02e4367bec..364d038da7ea 100644
> > --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > @@ -481,6 +481,11 @@
> >  #define MVPP22_GMAC_INT_SUM_MASK		0xa4
> >  #define     MVPP22_GMAC_INT_SUM_MASK_LINK_STAT	BIT(1)
> >  #define	    MVPP22_GMAC_INT_SUM_MASK_PTP	BIT(2)
> > +#define MVPP2_GMAC_LPI_CTRL0			0xc0
> > +#define     MVPP2_GMAC_LPI_CTRL0_TS_MASK	GENMASK(8, 8)
> 
> I think this should be GENMASK(15, 8) :)

Bah.

Thanks for spotting... and people say GENMASK() is better than using
hex. I've disagreed with that, but tried to conform, but I keep making
mistakes with GENMASK(), but never have with hex notation. Maybe I'm
just different from most people, having been programming computers in
assembly since the 1980s, where the choices were decimal or hex!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
