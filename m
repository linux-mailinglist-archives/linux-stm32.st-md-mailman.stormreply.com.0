Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D2784995
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 20:50:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3345DC6B444;
	Tue, 22 Aug 2023 18:50:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30FF1C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=blH/hqqKqMi+gy0guzeEpc4bpRaUzWv6qZAMAVdyYUQ=; b=QXF9ZXHiJwEJYjjC/ZVXCMSte8
 /O58QCUo0VyBOox5unGFleYn4FN+iT6dZJ/+LSulXbiXdkAv0bfie2m2fbzZTg5TTpG4ddbA5K842
 xu/194PYLkv0ArzZCFZtmrKUMR+eWBgyqQUidvEK1kCF8see+xmVYyUxntG72QmEVDEdjR6S5b/d6
 h55XUE3mvZ8lH4k+W109dM9GKmOBk5z4oPF3q0pN2bR26bCjkKcIB6tO/o5QAQRS5jQAT1t2bsJqV
 Leh1HRiO28WHDJHnUqtppFOznOjWu96Y72N4l8wclr0eFgl2cz9RplUy7ZGh8DnaA+k1woyCDbwVZ
 R1aUS6tg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41746)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qYWRl-0001qs-2l;
 Tue, 22 Aug 2023 19:49:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qYWRi-00062L-Ep; Tue, 22 Aug 2023 19:49:42 +0100
Date: Tue, 22 Aug 2023 19:49:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 0/9] stmmac cleanups
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

One of the comments I had on Feiyang Chen's series was concerning the
initialisation of phylink... and so I've decided to do something about
it, cleaning it up a bit.

This series:

1) adds a new phylink function to limit the MAC capabilities according
   to a maximum speed. This allows us to greatly simplify stmmac's
   initialisation of phylink's mac capabilities.

2) everywhere that uses priv->plat->phylink_node first converts this
   to a fwnode before doing anything with it. This is silly. Let's
   instead store it as a fwnode to eliminate these conversions in
   multiple places.

3) clean up passing the fwnode to phylink - it might as well happen
   at the phylink_create() callsite, rather than being scattered
   throughout the entire function.

4) same for mdio_bus_data

5) use phylink_limit_mac_speed() to handle the priv->plat->max_speed
   restriction.

6) add a method to get the MAC-specific capabilities from the code
   dealing with the MACs, and arrange to call it at an appropriate
   time.

7) convert the gmac4 users to use the MAC specific method.

8) same for xgmac.

9) lastly, group all the simple phylink_config initialisations together.


While looking into all of this, this raised eyebrows:

        if (priv->plat->tx_queues_to_use > 1)
                priv->phylink_config.mac_capabilities &=
                        ~(MAC_10HD | MAC_100HD | MAC_1000HD);

priv->plat->tx_queues_to_use is initialised by platforms to either 1,
4 or 8, and can be controlled from userspace via the --set-channels
ethtool op. The implementation of this op in this driver limits the
number of channels to priv->dma_cap.number_tx_queues, which is derived
from the DMA hwcap.

So, the obvious questions are:

1) what guarantees that the static initialisation of tx_queues_to_use
will always be less than or equal to number_tx_queues from the DMA hw
cap?

2) tx_queues_to_use starts off as 1, but number_tx_queues is larger,
we will leave the half-duplex capabilities in place, but userspace can
increase tx_queues_to_use above 1. Does that mean half-duplex is then
not supported?

3) Should we be basing the decision whether half-duplex is supported
off the DMA capabilities?

4) What about priv->dma_cap.half_duplex? Doesn't that get a say in
whether half-duplex is supported or not? Why isn't this used? Why is
it only reported via debugfs? If it's not being used by the driver,
what's the point of reporting it via debugfs?

 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  8 ++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 10 ++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 53 ++++++++--------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  2 +-
 drivers/net/phy/phylink.c                          | 18 ++++++++
 include/linux/phylink.h                            |  2 +
 include/linux/stmmac.h                             |  2 +-
 9 files changed, 66 insertions(+), 36 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
