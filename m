Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C853B9B5E0
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 20:17:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B1A6C3F93D;
	Wed, 24 Sep 2025 18:17:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 734C6C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fhmKwvAUWzveTngA4eJfQvzbLqxvWCX7DkiPlDVUjgA=; b=LEKQZt+pzXyXy5B+7trTp4mEEB
 zYn2GRXW0jpjUZZ4E7Do6tEvybf9HYmS3X+MD2pCsbcDUkGqSzB+UNW/tE0yHK2i7wwU9MWViHjHE
 qXoUNBQQ6GzbFZ2tTv9zOR+8QHy/++4cLlTDLsKy0BrK9lQ21mEFuqxOAbjqlMvilemuNRkb2WFJH
 7DWRYdir4KAZZkcUgdd/c5nWckGosGDE+ug1OrzgNzjYXQxwwZV/wqk3z71FLQqDSa6cqa+rTxicG
 HFvEb13ZW9/31LD6FKXwC5dF/0O7fP6U8lUMgWjaEkUrsqCENWthzYFnA7znLtGNl1SGPYsVUWJzV
 4WkmLs3g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48390)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v1U3K-0000000010Z-1Q9L;
 Wed, 24 Sep 2025 19:17:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v1U37-000000007Md-0NV4; Wed, 24 Sep 2025 19:17:05 +0100
Date: Wed, 24 Sep 2025 19:17:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [Linux-stm32] [PATCH RFC net-next 0/9] net: stmmac: experimental
	PCS conversion
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

This series is radical - it takes the brave step of ripping out much of
the existing PCS support code and throwing it all away.

I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
flag with Bartosz Golaszewski, and the conclusion I came to is that
this is to workaround the breakage that I've been going on about
concerning the phylink conversion for the last five or six years.

The problem is that the stmmac PCS code manipulates the netif carrier
state, which confuses phylink.

There is a way of testing this out on the Jetson Xavier NX platform as
the "PCS" code paths can be exercised while in RGMII mode - because
RGMII also has in-band status and the status register is shared with
SGMII. Testing this out confirms my long held theory: the interrupt
handler manipulates the netif carrier state before phylink gets a
look-in, which means that the mac_link_up() and mac_link_down() methods
are never called, resulting in the device being non-functional.

Moreover, on dwmac4 cores, ethtool reports incorrect information -
despite having a full-duplex link, ethtool reports that it is
half-dupex.

Thus, this code is completely broken - anyone using it will not have
a functional platform, and thus it doesn't deserve to live any longer,
especially as it's a thorn in phylink.

Rip all this out, leaving just the bare bones initialisation in place.

However, this is not the last of what's broken. We have this hw->ps
integer which is really not descriptive, and the DT property from
which it comes from does little to help understand what's going on.
Putting all the clues together:

- early configuration of the GMAC configuration register for the
  speed.
- setting the SGMII rate adapter layer to take its speed from the
  GMAC configuration register.

Lastly, setting the transmit enable (TE) bit, which is a typo that puts
the nail in the coffin of this code. It should be the transmit
configuration (TC) bit. Given that when the link comes up, phylink
will call mac_link_up() which will overwrite the speed in the GMAC
configuration register, the only part of this that is functional is
changing where the SGMII rate adapter layer gets its speed from,
which is a boolean.

From what I've found so far, everyone who sets the snps,ps-speed
property which configures this mode also configures a fixed link,
so the pre-configuration is unnecessary - the link will come up
anyway.

So, this series rips that out the preconfiguration as well, and
replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.

We then move the sole PCS configuration into a phylink_pcs instance,
which configures the PCS control register in the same way as is done
during the probe function.

Thus, we end up with much easier and simpler conversion to phylink PCS
than previous attempts.

Even so, this still results in inband mode always being enabled at the
moment in the new .pcs_config() method to reflect what the probe
function was doing. The next stage will be to change that to allow
phylink to correctly configure the PCS. This needs fixing to allow
platform glue maintainers who are currently blocked to progress.

Please note, however, that this has not been tested with any SGMII
platform.

I've tried to get as many people into the Cc list with get_maintainers,
I hope that's sufficient to get enough eyeballs on this.

 drivers/net/ethernet/stmicro/stmmac/Makefile       |  2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  6 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  6 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 65 ++-------------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 66 ++-------------------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 25 +-------
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  4 ++
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 68 +---------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 24 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 47 +++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 23 ++++++--
 include/linux/stmmac.h                             |  1 -
 15 files changed, 104 insertions(+), 245 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
