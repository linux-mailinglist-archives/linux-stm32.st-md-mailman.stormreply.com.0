Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3AF9D977A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:52:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75FA7C78021;
	Tue, 26 Nov 2024 12:52:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6C35C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UBOm54eDNU5qHqV5+q6YCc8Jf+8eu5ki7mmj+f767o4=; b=lCJNcmZ9BHMsquiiiy0Ks0W5zk
 oEFcavkVPwtpUjrcJFnKDMCujy0LPy4s8ITxl/ZcskkSAWF58oOuwBm6tqCoUWFLr57qn9buQEynh
 IRtup8KRm1yZUJSdR5p0eaK1Bcqddtli0elwkGRIWGMre1GGavFnF8dA3k6TxN37LAySLhA9eF7Tf
 X4UP9G75NmMTzCSLLhMims1j9QfmOxUWRKfr7ksbcyWje24HeHsB/XYAaFRX5fhWiKVQ4Oiu2Wpa8
 zZnYQDUg6TGuzTkZzM07S3WmdY570AV0UjwkMupx8MCWe5wN+4gKFfu3DeaxReCQR6ZU3v0zDnEv2
 dglIxmEQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47164)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tFv2b-0006r2-1M;
 Tue, 26 Nov 2024 12:51:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tFv2W-0004Yp-2f;
 Tue, 26 Nov 2024 12:51:36 +0000
Date: Tue, 26 Nov 2024 12:51:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 00/23] net: phylink managed EEE
	support
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

In doing this, I came across the fact that the addition of phylib
managed EEE support has actually broken a huge number of drivers -
phylib will now overwrite all members of struct ethtool_keee whether
the netdev driver wants it or not. This leads to weird scenarios where
doing a get_eee() op followed by a set_eee() op results in e.g.
tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
really needs urgently addressing, and I believe it came about because
Andrew's patches were only partly merged via another party - I guess
highlighting the inherent danger of "thou shalt limit your patch series
to no more than 15 patches" when one has a subsystem who's in-kernel
API is changing.

I am ignoring that limit for this posting precisely because of this.
I think we need to have a discussion about it, because if it ends up
causing breakage, then we're doing something wrong.

One of the drivers that got broken was stmmac, so this series also
includes a number of patches that fix it before converting stmmac to
phylink managed EEE. I can point to many many more that are similarly
broken.

Also inflating this series are two important patches that have been
submitted for the NET tree, but which aren't yet part of the net-next
tree - thus making this series larger than really necessary. If it
weren't for both of these issues, then this series would be exactly
15 patches.

Anyway, these patches...

Patch 1 and 2 are patches that have been submitted and possibly applied
to the net tree.

Patch 3 changes the Marvell driver to use the state we store in
struct phy_device, rather than manually calling
phydev->eee_cfg.eee_enabled.

Patch 4 avoids genphy_c45_ethtool_get_eee() setting ->eee_enabled, as
we copy that from phydev->eee_cfg.eee_enabled later, and after patch 3
mo one uses this after calling genphy_c45_ethtool_get_eee(). In fact,
the only caller of this function now is phy_ethtool_get_eee().

As all callers to genphy_c45_eee_is_active() now pass NULL as its
is_enabled flag, this is no longer useful. Remove the argument in
patch 5.

Patch 6 updates the phylib documentation to make it absolutely clear
that phy_ethtool_get_eee() now fills in all members of struct
ethtool_keee, which is why we now have so many buggy network drivers.
We need to decide how to fix this mess.

Patch 7 adds a definition for the clock stop capable bit in the PCS
MMD status register.

Patch 8 adds a phylib API to query whether the PHY allows the transmit
xMII clock to be stopped while in LPI mode. This capability is for MAC
drivers to save power when LPI is active, to allow them to stop their
transmit clock.

Patch 9 adds another phylib API to configure whether the receive xMII
clock may be disabled by the PHY. We do have an existing API,
phy_init_eee(), but... it only allows the control bit to be set which
is weird - what if a boot firmware or previous kernel has set this bit
and we want it clear?

Patch 10 finally starts on the phylink parts of this, extracting from
phylink_resolve() the detection of link-up. (Yes, okay, I could've
dropped this patch, but with 23 patches, it's not going to make that
much difference.)

Patch 11 adds phylink managed EEE support. Two new MAC APIs are added,
to enable and disable LPI. The enable method is passed the LPI timer
setting which it is expected to program into the hardware, and also a
flag ehther the transmit clock should be stopped.

 *** There are open questions here. Eagle eyed reviewers will notice
   pl->config->lpi_interfaces. There are MACs out there which only
   support LPI signalling on a subset of their interface types. Phylib
   doesn't understand this. I'm handling this at the moment by simply
   not activating LPI at the MAC, but that leads to ethtool --show-eee
   suggesting that EEE is active when it isn't.
 *** Should we pass the phy_interface_t to these functions?
 *** Should mac_enable_tx_lpi() be allowed to fail if the MAC doesn't
   support the interface mode?

An example of a MAC that this is the case are the Marvell ones - both
NETA and PP2 only support LPI signalling when connected via SGMII,
which makes being connected to a PHY which changes its link mode
problematical.

The remainder of the patches address the driver sides, which are
necessary to actually test this stuff out. The exception are the stmmac
patches.

The first four stmmac patches show what is necessary across many drivers
to fix the current phylib EEE mess.

The 5th stmmac patch makes reporting of EEE errors dependent on whether
EEE is supported by stmmac or not - I can't see why one would want
anything else (maybe someone can enlighten me?)

The 6th stmmac patch converts to use phy_eee_rx_clock_stop(), thereby
ensuring that, if desired, the RX clock will not be stopped by the PHY
when in LPI mode (which as noted above is something that phy_init_eee()
doesn't do.) Given that we know stmmac has issues if the RX clock is
stopped, this could be a bug fix.

The final patch converts stmmac to phylink managed EEE.

 drivers/net/ethernet/marvell/mvneta.c              | 118 ++++++++++--------
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h         |   5 +
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c    |  88 ++++++++++++++
 drivers/net/ethernet/microchip/lan743x_ethtool.c   |  21 ----
 drivers/net/ethernet/microchip/lan743x_main.c      |  39 ++++--
 drivers/net/ethernet/microchip/lan743x_main.h      |   1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 -
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  25 +---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  68 ++++++++---
 drivers/net/phy/marvell.c                          |   4 +-
 drivers/net/phy/phy-c45.c                          |  15 +--
 drivers/net/phy/phy.c                              | 106 +++++++++++-----
 drivers/net/phy/phylink.c                          | 134 +++++++++++++++++++--
 include/linux/phy.h                                |   6 +-
 include/linux/phylink.h                            |  44 +++++++
 include/uapi/linux/mdio.h                          |   1 +
 16 files changed, 505 insertions(+), 171 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
