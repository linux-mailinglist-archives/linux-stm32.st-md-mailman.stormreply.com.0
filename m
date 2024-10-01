Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F10BD98C21C
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 18:03:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F0FAC78012;
	Tue,  1 Oct 2024 16:03:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B960C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lxU6m74sMOqbJJJW/j/WEzyJZ3dIO/M0FxXkS3nCyJE=; b=sCPAyHolJvckbrBVmAXO4SD+Lf
 eP0MHUaLrmdqWKLeEym2qnB98HODvToSjQ4238haMfQQckJwqxkiVAQTe7L6DJMIHBoEdw4+QJpii
 jySTnRHbqVq4b9ghCQXcXz2iICX+SdSNCf/4p5HndbnLTW++V4bDyBxA7+UhWuI6ujO2JJ0VvM5bN
 PpsorjefsCHyjYVh4y8RigywgdTUhfVmY8olw/69InE9jU4TpSMqWZABzXRGVa4ugYixjtmD4Knol
 xy/5V+tcSOdQrI59G4gSttJKxTzQrrXCcWE+v52SaRpp2pbfDbEBTg6G+ZEWD91umXgbXr7kwKndX
 aDWEFS0Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50108)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1svfKy-00064b-0I;
 Tue, 01 Oct 2024 17:02:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1svfKq-000540-29;
 Tue, 01 Oct 2024 17:02:48 +0100
Date: Tue, 1 Oct 2024 17:02:48 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
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
Subject: [Linux-stm32] [PATCH net-next 00/10] net: pcs: xpcs: cleanups batch
	1
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
unnecessary complexity. This patch should be tested on Wangxun
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
 drivers/net/dsa/sja1105/sja1105_main.c            | 85 ++++++++++----------
 drivers/net/dsa/sja1105/sja1105_mdio.c            | 28 ++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  7 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c    | 18 ++---
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h   |  2 +-
 drivers/net/pcs/pcs-xpcs.c                        | 92 ++++++++++++++---------
 include/linux/pcs/pcs-xpcs.h                      | 14 ++--
 8 files changed, 132 insertions(+), 116 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
