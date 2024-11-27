Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FA99DA626
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2024 11:49:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1FC8C78F83;
	Wed, 27 Nov 2024 10:49:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63D58C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2oZD0zN1OqlWY3Xl/s5KM7s42CEMCxfoFjW01Rsvl2k=; b=n7IcBDDliXi1TXfixo+nibhjRC
 6tliHVfbJRuMjwL23r8zVzg2t5H4Eu8qlexTRfd2g4dc6gUxTz6Rm3rank02nURIiNzNLE2c+LhUZ
 4oSEg0Ey0R+GpljVnyaYxZiC8anJQ9Z316HzOqyRPbmjm0ciiUq4cirUEI2hzNC4LmQ4Wzxq0buk+
 nKryo2u06SvVDKDMVxK9xQh1SvgckM8HzDvlLmB9WrTEV1lu7GAb0SGIn1xdRu+VOjKAr1ZgmBaVs
 qAVAbmtbaWyuVgS/axf4ldaRatPkkEts3hPjocFD8igQ8pJsIUWGbfdLKQdG6n4ppaZu4BGzjrJX4
 cVObfl9g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38012)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tGFbu-00009L-1D;
 Wed, 27 Nov 2024 10:49:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tGFbp-00075l-2X;
 Wed, 27 Nov 2024 10:49:25 +0000
Date: Wed, 27 Nov 2024 10:49:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z0b5NepJdXiEQ1IC@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] net: rtl8169: EEE seems to be ok (was: Re: [PATCH
 RFC net-next 00/23] net: phylink managed EEE support)
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

On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
> In doing this, I came across the fact that the addition of phylib
> managed EEE support has actually broken a huge number of drivers -
> phylib will now overwrite all members of struct ethtool_keee whether
> the netdev driver wants it or not. This leads to weird scenarios where
> doing a get_eee() op followed by a set_eee() op results in e.g.
> tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
> to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
> really needs urgently addressing, and I believe it came about because
> Andrew's patches were only partly merged via another party - I guess
> highlighting the inherent danger of "thou shalt limit your patch series
> to no more than 15 patches" when one has a subsystem who's in-kernel
> API is changing.

Looking at the rtl8169 driver, it looks pretty similar to the Marvell
situation. The value stored in tp->tx_lpi_timer is apparently,
according to r8169_get_tx_lpi_timer_us(), a value in bytes, not in a
unit of time. So it's dependent on the negotiated speed, and thus we
can't read it to set the initial phydev->eee_cfg.tx_lpi_timer state,
because in the _probe() function, the PHY may not have negotiated a
speed.

However, this driver writes keee->tx_lpi_timer after
phy_ethtool_get_eee() which means that it overrides phylib, so hasn't
been broken.

Therefore, I think rtl8169 is fine.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
