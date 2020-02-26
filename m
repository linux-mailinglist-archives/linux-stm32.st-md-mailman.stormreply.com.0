Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244716FC6A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 11:40:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24D51C36B0B;
	Wed, 26 Feb 2020 10:40:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAFFDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHjOim15jd4o09NnZjH5LH9s+ZcSG6bZ/1c5E3qyvo4=; b=r/p4PjDpcixJ8lUnSiXLAl4AV
 M3/nlPwheegQWB6gz85+4JN8JbeNT+1nUpxDGwwTIaDpnbxhk/5Fo4H893Ls6FoWMiBxz1xGLG9zU
 Y4R3FIqxjy6zmwaDYotrgUjsLzwq0ZIG0/klV1V2Toz4/xVllt3hk+UDInPxvqY1x8Pp7iWePdElj
 G33ifII3WAfBYsu7CSq/IaGilQ8xfQ16ikE6nIARLjvi9laOHpUwg1SsCwTSLsyCiz1Oj4UTXJm42
 n78Ijep4FE90dHV5Ow9NHKtdBZF2uAFagJmklL2ZqtgGNqDZMKCq+00wOYdK2Uu61a3/96O/gA99Q
 j23bm05mQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57120)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j6u6i-00070o-Gh; Wed, 26 Feb 2020 10:40:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j6u6d-0008LS-Mn; Wed, 26 Feb 2020 10:39:55 +0000
Date: Wed, 26 Feb 2020 10:39:55 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20200226103955.GY25745@shell.armlinux.org.uk>
References: <20200225093703.GS25745@shell.armlinux.org.uk>
 <E1j6Wg0-0000Ss-W7@rmk-PC.armlinux.org.uk>
 <CA+h21hp8KCqhCasOAGz17k0eRteHVVYK-eANQmn4h443qv=2JQ@mail.gmail.com>
 <20200225232307.GU25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225232307.GU25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next 2/8] net: dsa: propagate resolved
 link config via mac_link_up()
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

On Tue, Feb 25, 2020 at 11:23:07PM +0000, Russell King - ARM Linux admin wrote:
> On Tue, Feb 25, 2020 at 11:09:35PM +0200, Vladimir Oltean wrote:
> > Hi Russell,
> > 
> > On Tue, 25 Feb 2020 at 11:39, Russell King <rmk+kernel@armlinux.org.uk> wrote:
> > >
> > > Propagate the resolved link configuration down via DSA's
> > > phylink_mac_link_up() operation to allow split PCS/MAC to work.
> > >
> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/dsa/b53/b53_common.c       | 4 +++-
> > >  drivers/net/dsa/b53/b53_priv.h         | 4 +++-
> > >  drivers/net/dsa/bcm_sf2.c              | 4 +++-
> > >  drivers/net/dsa/lantiq_gswip.c         | 4 +++-
> > >  drivers/net/dsa/mt7530.c               | 4 +++-
> > >  drivers/net/dsa/mv88e6xxx/chip.c       | 4 +++-
> > >  drivers/net/dsa/sja1105/sja1105_main.c | 4 +++-
> > >  include/net/dsa.h                      | 4 +++-
> > >  net/dsa/port.c                         | 3 ++-
> > >  9 files changed, 26 insertions(+), 9 deletions(-)
> > >
> > 
> > It looks like you missed the felix_phylink_mac_link_up() conversion in
> > this patch? (which also makes it fail to build, by the way, I'm
> > supposed the Kbuild robot didn't already jump)
> > Nonetheless, I've manually added the missing speed, duplex, tx_pause
> > and rx_pause parameters, and it appears to work as before.
> > Same for sja1105.
> 
> Quite possibly; the patch was developed against 5.5 plus the phylink
> changes, but applied to net-next. Hmm, it seems my coccinelle script
> that detects .mac_link_up initialiser prototypes, but not the DSA
> equivalent using the old prototype.
> 
> Thanks for pointing it out.

I've just sent v2 with ocelot and qca included... and some recipients
for patch 2 bounced - the Cc line is now too long!

As far as the kbuild robot goes, you are not the first to notice that
kbuild seems to be flakey... I've noticed it for some time, as has
Greg KH.  It isn't just patches on mailing lists, it's git trees as
well.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
