Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2325316FE57
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 12:56:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D63AEC36B0B;
	Wed, 26 Feb 2020 11:56:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C46DAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gDj4mVuatasof5Pyrcad66Gpw4ynFxkDIJvwyyZzESw=; b=l6Ty9+wRPEIo4QfQmAG1IL4QX
 +/HhzofQYEOVcB//1+pWsQeYKCAAEuyxiX/0r2xUvUDPsvhAphAKAudIF7RVXZ5TpqWmPQfnDiTDg
 pfxk2w/485b0nnH+deBmIy+4eXAiXM5CilgGj9kpUVx0w/mUAxKZr2XJc24FQK8bS5//79ONffZsN
 pr9n7aUg8kamfN/fwdlsgW0b3gbowpw+icOXN88MBkuS53ss/RUYPMUBYBsiXAPIrz8nMj3WBGc9Y
 mXwOJmVnuK42RV5P++9fjVvBY2dQSWgACycHbN/okG97BKXvqPT9PmUyVaylZ9ZxmSXstGwsJ9iA6
 ZvCDF8NJA==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:53006)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j6vIK-0007O8-Ed; Wed, 26 Feb 2020 11:56:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j6vI5-0008Nm-B4; Wed, 26 Feb 2020 11:55:49 +0000
Date: Wed, 26 Feb 2020 11:55:49 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20200226115549.GZ25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
 <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: phylink: propagate
 resolved link config via mac_link_up()
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

On Wed, Feb 26, 2020 at 01:06:06PM +0200, Vladimir Oltean wrote:
> Hi Russell,
> 
> On Wed, 26 Feb 2020 at 12:23, Russell King <rmk+kernel@armlinux.org.uk> wrote:
> >
> > Propagate the resolved link parameters via the mac_link_up() call for
> > MACs that do not automatically track their PCS state. We propagate the
> > link parameters via function arguments so that inappropriate members
> > of struct phylink_link_state can't be accessed, and creating a new
> > structure just for this adds needless complexity to the API.
> >
> > Tested-by: Andre Przywara <andre.przywara@arm.com>
> > Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> >  Documentation/networking/sfp-phylink.rst      | 17 +++++-
> >  drivers/net/ethernet/cadence/macb_main.c      |  7 ++-
> >  .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  7 ++-
> >  drivers/net/ethernet/marvell/mvneta.c         |  8 ++-
> >  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 19 +++++--
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  7 ++-
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
> >  .../net/ethernet/xilinx/xilinx_axienet_main.c |  7 ++-
> >  drivers/net/phy/phylink.c                     |  9 ++-
> >  include/linux/phylink.h                       | 57 ++++++++++++++-----
> >  net/dsa/port.c                                |  4 +-
> >  11 files changed, 105 insertions(+), 41 deletions(-)
> >
> > diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
> > index d753a309f9d1..8d7af28cd835 100644
> > --- a/Documentation/networking/sfp-phylink.rst
> > +++ b/Documentation/networking/sfp-phylink.rst
> > @@ -74,10 +74,13 @@ phylib to the sfp/phylink support.  Please send patches to improve
> >  this documentation.
> >
> >  1. Optionally split the network driver's phylib update function into
> > -   three parts dealing with link-down, link-up and reconfiguring the
> > -   MAC settings. This can be done as a separate preparation commit.
> > +   two parts dealing with link-down and link-up. This can be done as
> > +   a separate preparation commit.
> >
> > -   An example of this preparation can be found in git commit fc548b991fb0.
> > +   An older example of this preparation can be found in git commit
> > +   fc548b991fb0, although this was splitting into three parts; the
> > +   link-up part now includes configuring the MAC for the link settings.
> > +   Please see :c:func:`mac_link_up` for more information on this.
> >
> >  2. Replace::
> >
> > @@ -207,6 +210,14 @@ this documentation.
> >     using. This is particularly important for in-band negotiation
> >     methods such as 1000base-X and SGMII.
> >
> > +   The :c:func:`mac_link_up` method is used to inform the MAC that the
> > +   link has come up. The call includes the negotiation mode and interface
> > +   for reference only. The finalised link parameters are also supplied
> > +   (speed, duplex and flow control/pause enablement settings) which
> > +   should be used to configure the MAC when the MAC and PCS are not
> > +   tightly integrated, or when the settings are not coming from in-band
> > +   negotiation.
> > +
> >     The :c:func:`mac_config` method is used to update the MAC with the
> >     requested state, and must avoid unnecessarily taking the link down
> >     when making changes to the MAC configuration.  This means the
> 
> Just to make sure I understand the changes:
> - A MAC with no PCS can be configured in either .mac_config or .mac_link_up

I would much prefer mac_link_up to be used for setting the speed,
duplex and pause modes for future-proofing in all cases except for
the case where these parameters are automatically updated in the
MAC from its associated PCS.

mac_link_up must not be used to configure the AN mode or interface
mode; these must be configured in mac_config().

> - A MAC that needs to be manually reconfigured to the link mode
> negotiated by its PCS needs to have the PCS configured in .mac_config
> and the MAC in .mac_link_up

I do have further changes that split the PCS ops from the MAC ops, so
what is in this series is not the full story yet - some of the further
patches can be found in my "phy" branch and "cex7" branches where I add
support to dpaa2 for automatically switching between SGMII and
1000BASE-X.  dpaa2 is one of these split PCS/MAC setups, but with the
extra complication that there's a firmware layer between the PCS and
MAC.

However, this series is the first stand-alone step along the road to
supporting split PCS/MAC setups in a sane manner.

I discussed with Andrew Lunn how much to send, and the conclusion was
to make the changes in a number of small patch series, as large patch
series tend not to get reviewed.  My experience with _this_ series is
that even this is very difficult to get feedback for, so adding any
additional patches will just make that worse.

> - A MAC with PCS where the MAC follows the PCS negotiation
> automatically in hardware is basically equivalent with a MAC with no
> PCS, and therefore can be configured in either .mac_config or
> .mac_link_up

In this case, mac_link_up doesn't do anything with the speed/duplex/
pause stuff when those are automatically passed from the PCS.

I'm afraid that sentence contains a subtlety that's going to get
people: it is not clear cut because of the different natures of the
various links.

In 1000BASE-X, speed is fixed at 1G, and the PCS autonegotiates the
duplex and pause with the remote end.  For mvneta (an example of a
combined PCS/MAC implementation) operating in-band:
- In mac_config():
  - configures for 1000BASE-X interface type with in-band AN.
  - configures fixed 1G.
  - As mvneta only supports full duplex, we disable duplex negotiation
    and force full duplex.
  - Only symmetric pause is supported, and we set the symmetric pause
    advertisement appropriately, with pause negotiation enabled.
- In mac_link_up():
  - merely allow the device to transmit and receive.

The MAC will be forced to 1G, full duplex, and will automatically be
configured by the PCS for pause support depending on the hardware
based pause resolution.

The situation is different for SGMII operating in-band:
- In mac_config():
  - configures for SGMII interface type with in-band AN.
  - configures speed and duplex negotiation.
  - disables pause negotiation; SGMII has no support for this.
- In mac_link_up():
  - enables or disables pause frames depending on the tx_pause/
    rx_pause flags, since this is not available from the MAC.
  - allow the device to transmit and receive.

If we aren't operating in in-band mode, then:
- In mac_config():
  - configures for the interface type without in-band AN.
  - disables speed, duplex and pause negotiation.
- In mac_link_up():
  - sets the speed, duplex and pause frames depending on the passed
    parameters.
  - allow the device to transmit and receive.

Please see patch 7 of this series which implements this for mvneta.

So, there is a split between what mac_config() should be doing and what
mac_link_up() should be doing; this is why I've said in the
documentation that the "mode" and "interface" are for reference only in
mac_link_up() - mac_link_up() can use these to decide _how_ to program
the resolved parameters, but should _not_ use them to determine the
link configuration (such as changing the interface between SGMII and
1000BASE-X - that is the responsibility of mac_config().)

I hope that helps clarify the situation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
