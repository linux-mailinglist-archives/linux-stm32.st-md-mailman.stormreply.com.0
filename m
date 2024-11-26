Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9769D97E0
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 14:01:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23799C78023;
	Tue, 26 Nov 2024 13:01:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE66EC78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ky6HbS31SSAdMYxozY6xIMAs0Cpmlvp4GWo+IUxC3Gc=; b=sA/wh2QdMDG6PLLquxIEEkTzeN
 r8oRRbixq8aAWGNui9FskfeZ+s+CruyDf1QNYcJu1YTw1B59tqTMhKJR5jcBCUo9aYxQfbbZSAbcy
 UpRmoq+0oztPAtiTZR6Jf3kg5fvS/1q+fWAJT5LrwrQ3ap6KoivSQLAQ9JoXquDPGhH60kjpyU37Z
 ch0Ypjw60dLf9Z4KZrdjMH+PaZkow2p6pzin2z+wpe5l+BuIFlWrY+PUbynf8x03RargY5D9GF0m1
 X4wNGVCYilk3TcsMtkI4sJ0U6Rpug2xNX4sO5o4186DptWdSkvOXoUIFEfbvq1X8w7oRZhuxM13zB
 aQRGky1w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54564)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tFvBq-00070g-17;
 Tue, 26 Nov 2024 13:01:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tFvBn-0004ZI-1q;
 Tue, 26 Nov 2024 13:01:11 +0000
Date: Tue, 26 Nov 2024 13:01:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z0XGl0caztvVarmZ@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 00/23] net: phylink managed
	EEE support
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
> Patch 11 adds phylink managed EEE support. Two new MAC APIs are added,
> to enable and disable LPI. The enable method is passed the LPI timer
> setting which it is expected to program into the hardware, and also a
> flag ehther the transmit clock should be stopped.
> 
>  *** There are open questions here. Eagle eyed reviewers will notice
>    pl->config->lpi_interfaces. There are MACs out there which only
>    support LPI signalling on a subset of their interface types. Phylib
>    doesn't understand this. I'm handling this at the moment by simply
>    not activating LPI at the MAC, but that leads to ethtool --show-eee
>    suggesting that EEE is active when it isn't.
>  *** Should we pass the phy_interface_t to these functions?
>  *** Should mac_enable_tx_lpi() be allowed to fail if the MAC doesn't
>    support the interface mode?

There is another point to raise here - should we have a "validate_eee"
method in struct phylink_mac_ops so that MAC drivers can validate
settings such as the tx_lpi_timer value can be programmed into the
hardware?

We do have the situation on Marvell platforms where the programmed
value depends on the MAC speed, and is only 8 bit, which makes
validating its value rather difficult - at 1G speeds, it's a
resolution of 1us so we can support up to 255us. At 100M speeds,
it's 10us, supporting up to 2.55ms. This makes it awkward to be able
to validate the set_eee() settings are sane for the hardware. Should
Marvell platforms instead implement a hrtimer above this? That sounds
a bit problematical to manage sanely.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
