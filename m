Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 550DC763B07
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 17:29:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16FECC6B45C;
	Wed, 26 Jul 2023 15:29:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5060EC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 15:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BjrSQ5IKcciLqpEbqlMKfz6FUHHN3vwxCeK/ewwtna4=; b=TaPWC+C+4uIwdrOzp/Om38TvyX
 raBlxmx3U4JM1EKRP62aTIA1WVTSZdRD18lH/V1yY/xY7jMr13RRK3lU+nUNUZqHy/oZ0KOSGytzD
 pmtarKSR3aIEIKRDw3c5C6OpS706E6iqL0vJo4D4KFPjKzLukKaiBapDikz1cL5cbGVan+dhQMQkt
 SLp08qTpwplSvChhladPL2mnySpOyVYqMtjWyUBUVCsfwfLtA1eclUxJSSZxFv/brgGgy2G5GldBM
 A40IAwnQxmtz/xyC9Nv1BF18QHAPq2lr1UKzhUpHVAFLPlA/r2qe4gJ8kmt89Oo9R5AGCLZrATBjO
 XLulJ8fg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40774)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qOgS6-0004dh-2x;
 Wed, 26 Jul 2023 16:29:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qOgS5-0002yX-BF; Wed, 26 Jul 2023 16:29:25 +0100
Date: Wed, 26 Jul 2023 16:29:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <ZME71epmSHYIB4DZ@shell.armlinux.org.uk>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
 <20230726004338.6i354ue576hb35of@skbuf>
 <PAXPR04MB9185C1A95E101AC2E08639B78900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185C1A95E101AC2E08639B78900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
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

On Wed, Jul 26, 2023 at 03:10:19PM +0000, Shenwei Wang wrote:
> > if (of_phy_is_fixed_link(dwmac->dev->of_node)) {
> > 
> 
> This does not help in this case. What I need to determine is if the PHY currently in use is a fixed-link.
> The dwmac DTS node may have multiple PHY nodes defined, including both fixed-link and real PHYs.

... and this makes me wonder what DT node structure you think would
describe a fixed-link.

A valid ethernet device node would be:

	dwmac-node {
		phy-handle = <&phy1>;
	};

In this case:
	dwmac->dev->of_node points at "dwmac-node"
	plat->phylink_node points at "dwmac-node"
	plat->phy_node points at "phy1"
	Your "dn" is NULL.
	Therefore, your imx_dwmac_is_fixed_link() returns false.

	dwmac-node {
		fixed-link {
			speed = <...>;
			full-duplex;
		};
	};

In this case:
	dwmac->dev->of_node points at "dwmac-node"
	plat->phylink_node points at "dwmac-node"
	plat->phy_node is NULL
	Your "dn" points at the "fixed-link" node.
	Therefore, your imx_dwmac_is_fixed_link() also returns false.

Now, as far as your comment "What I need to determine is if the PHY
currently in use is a fixed-link." I'm just going "Eh? What?" at that,
because it makes zero sense to me.

stmmac uses phylink. phylink doesn't use a PHY for fixed-links, unlike
the old phylib-based fixed-link implementation that software-emulated
a clause-22 PHY. With phylink, when fixed-link is specified, there is
_no_ PHY.

There is no need to do any of this poking about to determine if the
link that is being brought up is a fixed-link or not, because phylink's
callbacks into the MAC driver already contain this information in the
"mode" argument. However, that is not passed to the driver's internal
priv->plat->fix_mac_speed() method - but this is the information you
need.

There is no need to write code to try and second-guess this, phylink
tells drivers what mode it is operating under.

stmmac really needs to be cleaned up - and really doesn't need more
complexity when the information is already being provided to the
driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
