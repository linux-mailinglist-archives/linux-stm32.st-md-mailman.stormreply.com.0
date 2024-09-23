Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DAD97ECAA
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 16:01:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3EDFC78006;
	Mon, 23 Sep 2024 14:01:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D14C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rlbTSzoMwe9Gz7cOZS88v/Qn7t4z6TgShE6pjDg4V1k=; b=A4FHBbQhqKW7VgJM5LpclvPSZy
 czYMWcV6w2EfKbTnq1cJ3SacoYM6cOTN2aEkMLpdEyRbTsCuIqw863Vzf0gicAwfpUj4B0EqLUq0T
 vvOiHYC55hjeng9BpqsQxaQwIfDISbIlr/8AvLtdI++cbbnJRKuUKIJRwA+BcSAy17h+PNjgBmMYT
 eR/K2cClBpu70SIz/W4TqJF4T1+g2OjWWCK5PYLc92liq1wRje34i3Wl+k5npj3Y7kp60EH8glv5D
 1HGTO+KELiRTMu/6LYGzy5cIo9GRkqiL4Q1zx46dKiKiZwhU5njSt+Vq6cdWX36CUIR4+jsDthdtl
 nnU+KSqw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49610)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ssjcB-0004Gt-19;
 Mon, 23 Sep 2024 15:00:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ssjc2-0005RQ-1V;
 Mon, 23 Sep 2024 15:00:26 +0100
Date: Mon, 23 Sep 2024 15:00:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 00/10] net: pcs: xpcs: cleanups batch 1
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

First, sorry for the bland series subject - this is the first in a
number of cleanup series to the XPCS driver. This series has some
functional changes beyond merely cleanups, notably the first patch.

This series starts off with a patch that moves the PCS reset from
the xpcs_create*() family of calls to when phylink first configures
the PHY. The motivation for this change is to get rid of the
interface argument to the xpcs_create*() functions, which I see as
unnecessary complexity. This patch needs testing on SJA1105, Wangxun
and STMMAC drivers.

Patch 2 removes the now unnecessary interface argument from the
internal xpcs_create() and xpcs_init_iface() functions. With this,
xpcs_init_iface() becomes a misnamed function, but patch 3 removes
this function, moving its now meager contents to xpcs_create().

Patch 4 adds xpcs_destroy_pcs() and xpcs_create_pcs_mdiodev()
functions which return and take a phylink_pcs, allowing SJA1105
and Wangxun drivers to be converted to using the phylink_pcs
structure internally.

Patches 5 through 8 convert both these drivers to that end.

Patch 9 drops the interface argument from the remaining xpcs_create*()
functions, addressing the only remaining caller of these functions,
that being the STMMAC driver.

As patch 7 removed the direct calls to the XPCS config/link-up
functions, the last patch makes these functions static.

 drivers/net/dsa/sja1105/sja1105.h                 |  2 +-
 drivers/net/dsa/sja1105/sja1105_main.c            | 83 ++++++++++----------
 drivers/net/dsa/sja1105/sja1105_mdio.c            | 28 ++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  7 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c    | 18 ++---
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h   |  2 +-
 drivers/net/pcs/pcs-xpcs.c                        | 92 ++++++++++++++---------
 include/linux/pcs/pcs-xpcs.h                      | 14 ++--
 8 files changed, 130 insertions(+), 116 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
