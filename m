Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 676191618AF
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 18:23:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16452C36B0B;
	Mon, 17 Feb 2020 17:23:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08366C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oY8Hprjp+0+cXfhTnYBhP1nb+wmn9WucklmpZMOU5v0=; b=bEe7Mh3ZHtZITIcMegKi4Tbq4
 cF+tqyiLbpTEFFpy450jEylMS4b4m+hbKMBKY71wdC+5KZTtI5/MOb2u6WU3FcjhGi1j1pEnut6Vo
 sRL0jkk5D0BMR1L7eJoa66h+dB2q54hf0vhFhNLm9u5Yavss7dHxtDRlX5RCCQlT4WiCdHpAKI6UX
 lxAU1dkOo6Gu6OTxbpoPD8/uecUCaX2OcbKPqabfYCPphI1IAlyGsHVSClmPRW1CXlRhn88AuagDO
 sxOvIzOwdZyQAxJhOQyZLSJJN3JHwYJklWvrKhLi3986Exl+lCs4IkBsb/dT4De5XxR53+j+dU4EZ
 UjtJnpZhQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53260)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j3k6g-000266-K1; Mon, 17 Feb 2020 17:22:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j3k6V-0006UE-2c; Mon, 17 Feb 2020 17:22:43 +0000
Date: Mon, 17 Feb 2020 17:22:43 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <20200217172242.GZ25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-doc@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [CFT 0/8] rework phylink interface for split MAC/PCS
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

The following series changes the phylink interface to allow us to
better support split MAC / MAC PCS setups.  The fundamental change
required for this turns out to be quite simple.

Today, mac_config() is used for everything to do with setting the
parameters for the MAC, and mac_link_up() is used to inform the
MAC driver that the link is now up (and so to allow packet flow.)
mac_config() also has had a few implementation issues, with folk
who believe that members such as "speed" and "duplex" are always
valid, where "link" gets used inappropriately, etc.

With the proposed patches, all this changes subtly - but in a
backwards compatible way at this stage.

We pass the the full resolved link state (speed, duplex, pause) to
mac_link_up(), and it is now guaranteed that these parameters to
this function will always be valid (no more SPEED_UNKNOWN or
DUPLEX_UNKNOWN here - unless phylink is fed with such things.)

Drivers should convert over to using the state in mac_link_up()
rather than configuring the speed, duplex and pause in the
mac_config() method. The patch series includes a number of MAC
drivers which I've thought have been easy targets - I've left the
remainder as I think they need maintainer input. However, *all*
drivers will need conversion for future phylink development.

 Documentation/networking/sfp-phylink.rst          |  17 +++-
 drivers/net/dsa/b53/b53_common.c                  |   4 +-
 drivers/net/dsa/b53/b53_priv.h                    |   4 +-
 drivers/net/dsa/bcm_sf2.c                         |   4 +-
 drivers/net/dsa/lantiq_gswip.c                    |   4 +-
 drivers/net/dsa/mt7530.c                          |   4 +-
 drivers/net/dsa/mv88e6xxx/chip.c                  |  79 +++++++++++++----
 drivers/net/dsa/sja1105/sja1105_main.c            |   4 +-
 drivers/net/ethernet/cadence/macb.h               |   1 -
 drivers/net/ethernet/cadence/macb_main.c          |  53 ++++++-----
 drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  61 ++++++++-----
 drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h  |   1 +
 drivers/net/ethernet/marvell/mvneta.c             |  63 ++++++++-----
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c   | 102 +++++++++++++---------
 drivers/net/ethernet/mediatek/mtk_eth_soc.c       |   7 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |   4 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  37 ++++----
 drivers/net/phy/phylink.c                         |   9 +-
 include/linux/phylink.h                           |  57 ++++++++----
 include/net/dsa.h                                 |   4 +-
 net/dsa/port.c                                    |   7 +-
 21 files changed, 350 insertions(+), 176 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
