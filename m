Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155672485A
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 17:56:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34B1FC65E70;
	Tue,  6 Jun 2023 15:56:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CC3FC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOb0UwEClDB1Qka6QaDlB5BDDx21uX4az9r2VZIY7OQ=; b=BOBCO+KbEgtJzTxxohFX4kdX1q
 ru624IM0vblq9lILI68ln+63XaMu7FWQQVQvXyGT9Qils+x/Gn6fQMCLAQQ5W/QbxH3rihsst8tuM
 066hB/VKkgSoosdojJTBfm2cXVAMCsEIBmMMqs/fcRYRidPXMza3YHUtpXSKW3bmeUMdcH7LPFnZq
 M7hztsaUzrAcJ7/uppDAvexWWC1qGWa5X4icoYEDuh0YTpA8XE03/oPeJGjwQCTfff6IxRGqFNKnN
 Yiq7razeyv43PNPkwdQe1r/yR6/GbmteYKUKkYxxtd1V0/pUh2X3XJ/YXeut3cUK/PYj+wt5DY9nA
 KZ0DMYNg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56672)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q6Z2t-00061Z-AQ; Tue, 06 Jun 2023 16:56:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q6Z2p-0007HB-53; Tue, 06 Jun 2023 16:56:27 +0100
Date: Tue, 6 Jun 2023 16:56:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <ZH9XK5yEGyoDMIs/@shell.armlinux.org.uk>
References: <20230606152501.328789-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606152501.328789-1-maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/5] Followup fixes for the
 dwmac and altera lynx conversion
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

On Tue, Jun 06, 2023 at 05:24:56PM +0200, Maxime Chevallier wrote:
> Hello everyone,
> 
> Here's another version of the cleanup series for the TSE PCS replacement
> by PCS Lynx. It includes Kconfig fixups, some missing initialisations
> and a slight rework suggested by Russell for the dwmac cleanup sequence.

Thanks, this is getting there, but now you've now made me read
altera_tse.c, and it suffers the same issue that dwmac-socfpga.c does:

        ret = register_netdev(ndev);
...
        priv->pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
...
        priv->phylink = phylink_create(&priv->phylink_config,

This means you're publishing before you've finished setup - which is
a racy thing to do, especially if the driver is a module.

Let's think about what could happen. register_netdev() adds the network
device to the net layer and publishes it to userspace. Userspace notices
a new network interface and configures it, causing tse_open() to be
called. However, priv->phylink has not yet been initialised.

tse_open() then does:

        ret = phylink_of_phy_connect(priv->phylink, priv->device->of_node, 0);

and phylink_of_phy_connect() attempts to dereference it's first
argument, resulting in a NULL pointer dereference. Even if that doesn't
get you, then:

        phylink_start(priv->phylink);

will.

Golden rule: setup everything you need first, and only once that's
complete, publish. If you publish before you've completed setup, then
you're giving permission for other stuff to immediately start making
use of what you've published, which may occur before the remainder of
the initialisation has completed.

Lastly, remember that phylink_start() can result in the link coming up
_immediately_ (that means mac_link_up() could be called before it's
returned), so I would hope that the Altera TSE driver is prepared
for that to happen before napi, queues, and rx dma are ready.

Not saying that there's anything wrong with this series (there isn't),
merely that there's more issues that ought to be resolved.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
