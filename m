Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2CA10845
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 14:59:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7DFFC78031;
	Tue, 14 Jan 2025 13:59:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AD95C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7u6u610TK3l8oltBms9GRiIQMrHBSXpM/XVDOMLWH/4=; b=WaI7F2P4XGmqeMsUaixx+7EuIJ
 tjTb4buCgfSad7RjqbE3ZfVdn0XHl3+U0voQz0w249Kk7OmucYtjq5U4dzczKO11ANPSVyRS9hxNh
 IpAklOfFH00aIxu7APMmejc0kUcSPd3h62wJhsl0lE5WZ2ptSWwNW4g9kHHIocKqyE/Z8ch+gsWiJ
 SRfRWlLf+WYv3uta7dbvx62bLBJMnTO+uvTGq22HXwj5R20BFNXIRDYCgN5v6Ti9D9dZ+gVk8RSun
 580+tLafu3M+H35pE8ppFk93YlvlYV1dBpasoDkhgRW0IfC7wv4dpa0p8ENSJjZGe06wZP+QdMZg1
 s3cEbQjQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35990)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tXhRd-00088J-0c;
 Tue, 14 Jan 2025 13:59:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tXhRZ-00058K-33;
 Tue, 14 Jan 2025 13:58:57 +0000
Date: Tue, 14 Jan 2025 13:58:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 00/10] net: add phylink managed
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

Hi,

Adding managed EEE support to phylink has been on the cards ever since
the idea in phylib was mooted. This overly large series attempts to do
so. I've included all the patches as it's important to get the driver
patches out there.

Patch 1 adds a definition for the clock stop capable bit in the PCS
MMD status register.

Patch 2 adds a phylib API to query whether the PHY allows the transmit
xMII clock to be stopped while in LPI mode. This capability is for MAC
drivers to save power when LPI is active, to allow them to stop their
transmit clock.

Patch 3 extracts a phylink internal helper for determining whether the
link is up.

Patch 4 adds basic phylink managed EEE support. Two new MAC APIs are
added, to enable and disable LPI. The enable method is passed the LPI
timer setting which it is expected to program into the hardware, and
also a flag ehther the transmit clock should be stopped.

I have taken the decision to make enable_tx_lpi() to return an error
code, but not do much with it other than report it - the intention
being that we can later use it to extend functionality if needed
without reworking loads of drivers.

I have also dropped the validation/limitation of the LPI timer, and
left that in the driver code prior to calling phylink_ethtool_set_eee().

The remainder of the patches convert mvneta, lan743x and stmmac, add
support for mvneta, and add the basics that will be necessary into the
DSA code for DSA drivers to make use of this.

I would like to get patches 1 through 9 into net-next before the
merge window, but we're running out of time for that.

 drivers/net/ethernet/marvell/mvneta.c             | 107 +++++++++-------
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h        |   5 +
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c   |  86 +++++++++++++
 drivers/net/ethernet/microchip/lan743x_ethtool.c  |  21 ----
 drivers/net/ethernet/microchip/lan743x_main.c     |  46 +++++--
 drivers/net/ethernet/microchip/lan743x_main.h     |   1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  57 +++++++--
 drivers/net/phy/phy.c                             |  20 +++
 drivers/net/phy/phylink.c                         | 144 ++++++++++++++++++++--
 include/linux/phy.h                               |   1 +
 include/linux/phylink.h                           |  45 +++++++
 include/uapi/linux/mdio.h                         |   1 +
 net/dsa/user.c                                    |  25 ++--
 13 files changed, 458 insertions(+), 101 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
