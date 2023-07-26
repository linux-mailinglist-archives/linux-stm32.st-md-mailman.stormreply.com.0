Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6B763D1D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 19:01:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C92D3C6B45C;
	Wed, 26 Jul 2023 17:01:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0D05C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 17:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5wb4u1I6KiBdsFKw2z/lY2XjhQjbgtTPu6biCWQJSU=; b=wIJRDzewcYAlR6LRNZp158cGtS
 Jzk/rV7zF2a5nzjQmiPEZpz/X45THVtoBgi3TeGHug1Z27eRRp8kzTCukqx/sceqdILCfLLBwE1RC
 +tc9PaeX21jbCCHot9cSUUFlE9JR+/8ZN4/UDm2f2GLhkMf1mW19JQkRSJt/hZZEZJxtT56gMEmFd
 2wt4lcQRj4BlxeaIPEiUlm/OZLIeQ+7CD4FJdQ5BtQZIzmSr0BnEhHVROZx9MRscU1gwPVrnHHAIj
 HMXiN4ZT+JjfyiSgjprrko7y7VWifU3OtCKpZzPUDZdT1Nod3KtTqPTtSJ+3QmyDsO3RZDIAJ0Jyj
 4buR7MaA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56670)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qOhsv-0004kV-2z;
 Wed, 26 Jul 2023 18:01:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qOhss-00031x-Vb; Wed, 26 Jul 2023 18:01:10 +0100
Date: Wed, 26 Jul 2023 18:01:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <ZMFRVtg5WQyGlBJ1@shell.armlinux.org.uk>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
 <20230726004338.6i354ue576hb35of@skbuf>
 <PAXPR04MB9185C1A95E101AC2E08639B78900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ZME71epmSHYIB4DZ@shell.armlinux.org.uk>
 <PAXPR04MB91856018959FE0752F1A27888900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91856018959FE0752F1A27888900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Vladimir Oltean <olteanv@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, dl-linux-imx <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause
 the TXC clock in fixed-link
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

On Wed, Jul 26, 2023 at 03:59:38PM +0000, Shenwei Wang wrote:
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: Wednesday, July 26, 2023 10:29 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Vladimir Oltean <olteanv@gmail.com>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> > Coquelin <mcoquelin.stm32@gmail.com>; Shawn Guo <shawnguo@kernel.org>;
> > dl-linux-imx <linux-imx@nxp.com>; Giuseppe Cavallaro
> > <peppe.cavallaro@st.com>; Alexandre Torgue <alexandre.torgue@foss.st.com>;
> > Jose Abreu <joabreu@synopsys.com>; Sascha Hauer <s.hauer@pengutronix.de>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> > mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; Frank Li <frank.li@nxp.com>
> > Subject: Re: [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause the TXC clock in
> > fixed-link
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Wed, Jul 26, 2023 at 03:10:19PM +0000, Shenwei Wang wrote:
> > > > if (of_phy_is_fixed_link(dwmac->dev->of_node)) {
> > > >
> > >
> > > This does not help in this case. What I need to determine is if the PHY currently
> > in use is a fixed-link.
> > > The dwmac DTS node may have multiple PHY nodes defined, including both
> > fixed-link and real PHYs.
> >
> > ... and this makes me wonder what DT node structure you think would describe a
> > fixed-link.
> >
> > A valid ethernet device node would be:
> >
> >         dwmac-node {
> >                 phy-handle = <&phy1>;
> >         };
> >
> > In this case:
> >         dwmac->dev->of_node points at "dwmac-node"
> >         plat->phylink_node points at "dwmac-node"
> >         plat->phy_node points at "phy1"
> >         Your "dn" is NULL.
> >         Therefore, your imx_dwmac_is_fixed_link() returns false.
> >
> >         dwmac-node {
> >                 fixed-link {
> >                         speed = <...>;
> >                         full-duplex;
> >                 };
> >         };
> >
> > In this case:
> >         dwmac->dev->of_node points at "dwmac-node"
> >         plat->phylink_node points at "dwmac-node"
> >         plat->phy_node is NULL
> >         Your "dn" points at the "fixed-link" node.
> >         Therefore, your imx_dwmac_is_fixed_link() also returns false.
> >
> > Now, as far as your comment "What I need to determine is if the PHY currently
> > in use is a fixed-link." I'm just going "Eh? What?" at that, because it makes zero
> > sense to me.
> >
> > stmmac uses phylink. phylink doesn't use a PHY for fixed-links, unlike the old
> > phylib-based fixed-link implementation that software-emulated a clause-22 PHY.
> > With phylink, when fixed-link is specified, there is _no_ PHY.
> 
> So you mean the fixed-link node will always be the highest priority to
> be used in the phylink use case?

Yes, because that is how all network drivers have behaved. If you look
at the function that Vladimir pointed out, then you will notice that
the mere presence of a fixed-link node makes it a "fixed link".

> If so, I just need to check if there is a fixed-link node as Vladimir pointed out, right?

You could, but that is grossly inefficient, and I will NAK it because
by doing so, it makes this messy driver even worse.

> > There is no need to do any of this poking about to determine if the link that is
> > being brought up is a fixed-link or not, because phylink's callbacks into the MAC
> > driver already contain this information in the "mode" argument. However, that
> > is not passed to the driver's internal
> > priv->plat->fix_mac_speed() method - but this is the information you
> > need.
> >
> 
> Yes, you are right. The best way is to change the fix_mac_speed prototype
> but it will change several other platforms. That's why I didn't go that way.

Why is that a problem?

I really don't get this "I can't get at information I need without
changing a driver internal interface, so I'll write some really
inefficient code to work around the problem and make the driver
even more messy" attitude.

It's not like you're changing a publicly visible API - it's a
driver private API and all the users of it are in the kernel tree.

A standard part of open source development is not to bodge around
existing code, but to implement efficient solutions to problems.

As phylink *already* tells stmmac_mac_link_up() whether it is
operating with a PHY, fixed-link, or in-band mode, the stmmac
layer has the information you need, but doesn't pass this into
the fix_mac_speed() function.

The best solution to this is *not* to bodge around it by trying
to second-guess what's going on and thus creating messy code.

Given that we have the full source available which we can modify,
then changing things like this function pointer prototype is
absolutely acceptable, and in this case is the correct way to
address the issue you have.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
