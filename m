Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB416248F
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2020 11:30:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B917CC36B0B;
	Tue, 18 Feb 2020 10:30:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C8B3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TsJ7rijmH0yW9ZZDdkUsZMwrbM/8nqThPqBsqCAkk4k=; b=L3ZDybIgpFGLp7UVUhoCXj1/g
 FS5mIbnpAfGKZgRDZJXQxOaKF06XZr57BggWSmgADckVoW4D7AMr8gTjS38MdEZOL9TeWol0l0bk+
 U7qlP7l1mreO6UVfaOl4hYzXYUSZN3aV7Csl2bEm/70CABSFHClKiUmgot65zS+mTuLvCFaHW4EzP
 q4UNUUwpLqYgMeyyoDkNqOwoK5Au+kfwgup4jtPJDiyVVuhwXFm73HYINp7x+qIXcY1YfRG43Wdu8
 0VkAT1CiAiATvQN4La90Pz+i2MjCwKWWOvHYy3BGQ3QzKrP9haO2YhfeX1iybGW9bhxVrPw0JNkd0
 lQ9hjaEww==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53586)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j408V-0006be-OY; Tue, 18 Feb 2020 10:29:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j408M-0000Lm-2I; Tue, 18 Feb 2020 10:29:42 +0000
Date: Tue, 18 Feb 2020 10:29:42 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20200218102941.GE25745@shell.armlinux.org.uk>
References: <20200217172242.GZ25745@shell.armlinux.org.uk>
 <20200217173324.GI31084@lunn.ch>
 <20200217185131.GC25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217185131.GC25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-doc@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [CFT 0/8] rework phylink interface for split
	MAC/PCS support
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

On Mon, Feb 17, 2020 at 06:51:31PM +0000, Russell King - ARM Linux admin wrote:
> On Mon, Feb 17, 2020 at 06:33:24PM +0100, Andrew Lunn wrote:
> > On Mon, Feb 17, 2020 at 05:22:43PM +0000, Russell King - ARM Linux admin wrote:
> > > Hi,
> > > 
> > > The following series changes the phylink interface to allow us to
> > > better support split MAC / MAC PCS setups.  The fundamental change
> > > required for this turns out to be quite simple.
> > 
> > Hi Russell
> > 
> > Do you have a branch i can pull and test?
> 
> Nothing beyond the branches I've mentioned in the previous heads-up as
> yet, sorry.

In any case, for any particular network driver, there are three patches
maximum that you need - the first, and the one or two patches specific
to the network driver, depending whether it's a DSA driver or not. You
don't need all 8 patches to test this series. All can be applied on top
of yesterday's net-next, specifically

92df9f8a745e ("Merge branch 'mvneta-xdp-ethtool-stats'")

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
