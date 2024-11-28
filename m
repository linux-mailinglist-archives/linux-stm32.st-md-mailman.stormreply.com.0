Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 543279DB97D
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2024 15:22:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB4F6C7802D;
	Thu, 28 Nov 2024 14:22:19 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22EEFC78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Nov 2024 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=PmKBbKYuoLleqExWJCCCSze5Rdx0CWrSTJ6oO6RpaSM=; b=MW64YBdgJ+mct0zLl1Xod9CUgv
 lvEaoPD4oOeg9rzPup/jyaNJ8lfKoRZR8Ol8VNvh467jvNxNXa7HOCtTNtcu7MxaC47EhsDXY69AT
 tPY8pvSsDJHciOBE7d4+V+KaVUNbbuPE0AfLheBR1OyNg7Bi14obRx+WFPEhU8xU0dpI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tGfP5-00EiFo-8J; Thu, 28 Nov 2024 15:21:59 +0100
Date: Thu, 28 Nov 2024 15:21:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <46498cdf-3582-4bbc-a00d-c02ff72cf600@lunn.ch>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <Z0cAaH30cXo38xwE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z0cAaH30cXo38xwE@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] net: ti: weirdness (was Re: [PATCH RFC net-next
 00/23] net: phylink managed EEE support)
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

On Wed, Nov 27, 2024 at 11:20:08AM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
> > In doing this, I came across the fact that the addition of phylib
> > managed EEE support has actually broken a huge number of drivers -
> > phylib will now overwrite all members of struct ethtool_keee whether
> > the netdev driver wants it or not. This leads to weird scenarios where
> > doing a get_eee() op followed by a set_eee() op results in e.g.
> > tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
> > to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
> > really needs urgently addressing, and I believe it came about because
> > Andrew's patches were only partly merged via another party - I guess
> > highlighting the inherent danger of "thou shalt limit your patch series
> > to no more than 15 patches" when one has a subsystem who's in-kernel
> > API is changing.
> 
> Looking at the two TI offerings that call phy_ethtool_get_eee(), both
> of them call the phylib functions from their ethtool ops, but it looks
> like the driver does diddly squat with LPI state, which makes me wonder
> why they implemented the calls to phy_ethtool_get_eee() and
> phy_ethtool_set_eee(), since EEE will not be functional unless the PHY
> has been configured with a SmartEEE mode outside the kernel.

Probably because they did not know what they were doing, and it got
past reviewers.

Well, actually:

commit a090994980a15f8cc14fc188b5929bd61d2ae9c3
Author: Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon Nov 28 09:41:33 2016 +0100

    cpsw: ethtool: add support for getting/setting EEE registers
    
    Add the ability to query and set Energy Efficient Ethernet parameters
    via ethtool for applicable devices.
    
    This patch doesn't activate full EEE support in cpsw driver, but it
    enables reading and writing EEE advertising settings. This way one
    can disable advertising EEE for certain speeds.
    
    Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
    Acked-by: Rami Rosen <roszenrami@gmail.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

Seems like somebody had an issue and did the minimum to work around
the issue. This also suggests the hardware is doing EEE by default,
hopefully with some sort of sensible hardware defaults.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
