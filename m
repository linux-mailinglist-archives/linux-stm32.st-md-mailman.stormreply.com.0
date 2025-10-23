Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C11C002DC
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 11:16:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1407C5EC44;
	Thu, 23 Oct 2025 09:16:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB587C01FA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWb4aYpde1fJIhvGzJoG+aTRnw9zMVErNOqJattNJ3c=; b=MhaAm0QivJW9lg9yNIF5QA/P9X
 B9rDo5nrY6ALNQ2lWHOZTUFkjGoDOE54VyCcCdljEFf1PUVB/S7w2QY6mKkFSvDqQtdF9PM1hj9wL
 21T2DNV7UQU0DAzfUlyA3adoWf5c/IIeFdJ4aRiElCfCGbo/30HD5xE+gfrKrxWjUWnp1V/wdECFA
 yE5rvs0oSbIzhrW5HkL3F+Y4qeVfTrqBysIRzV+YPeZ3vtFG2v/IDVYiv1u4u4a1V4QIJfxtYFjqD
 31T/iXlP5oVT5NFbQFvZtkzmqeZ+S/nB2hqyeQD5HHQvmkWbqlalMgq2o7Vt7j8mBkTtmB80woXgo
 gFcJ3Agw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49586)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBrQf-0000000060K-0X5a;
 Thu, 23 Oct 2025 10:16:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBrQa-000000001Yy-0fHD; Thu, 23 Oct 2025 10:16:12 +0100
Date: Thu, 23 Oct 2025 10:16:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Simon Horman <horms@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Tristram Ha <Tristram.Ha@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/6] net: add phylink managed WoL
 and convert stmmac
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

This series is implementing the thoughts of Andrew, Florian and myself
to improve the quality of Wake-on-Lan (WoL) implementations.

This changes nothing for MAC drivers that do not wish to participate in
this, but if they do, then they gain the benefit of phylink configuring
WoL at the point closest to the media as possible.

We first need to solve the problem that the multitude of PHY drivers
report their device supports WoL, but are not capable of waking the
system. Correcting this is fundamental to choosing where WoL should be
enabled - a mis-reported WoL support can render WoL completely
ineffective.

The only PHY drivers which uses the driver model's wakeup support is
drivers/net/phy/broadcom.c, and until recently, realtek. This means
we have the opportunity for PHY drivers to be _correctly_ converted
to use this method of signalling wake-up capability only when they can
actually wake the system, and thus providing a way for phylink to
know whether to use PHY-based WoL at all.

However, a PHY driver not implementing that logic doesn't become a
blocker to MACs wanting to convert. In full, the logic is:

- phylink supports a flag, wol_phy_legacy, which forces phylink to use
  the PHY-based WoL even if the MDIO device is not marked as wake-up
  capable.

- when wol_phy_legacy is not set, we check whether the PHY MDIO device
  is wake-up capable. If it is, we offer the WoL request to the PHY.

- if neither wol_phy_legacy is set, or the PHY is not wake-up capable,
  we do not offer the WoL request to the PHY.

In both cases, after setting any PHY based WoL, we remove the options
that the PHY now reports are enabled from the options mask, and offer
these (if any) to the MAC. The mac will get a "mac_set_wol()" method
call when any settings change.

Phylink mainatains the WoL state for the MAC, so there's no need for
a "mac_get_wol()" method. There may be the need to set the initial
state but this is not supported at present.

I've also added support for doing the PHY speed-up/speed-down at
suspend/resume time depending on the WoL state, which takes another
issue from the MAC authors.

Lastly, with phylink now having the full picture for WoL, the
"mac_wol" argument for phylink_suspend() becomes redundant, and for
MAC drivers that implement mac_set_wol(), the value passed becomes
irrelevant.

Changes since v1:
- patch 2: fix kerneldoc description of phy_may_wakeup()
- patch 3: initialise wolinfo in phylink_ethtool_set_wol().
- patch 4: use phylink_speed_up/down() to avoid speed changes on SFP
   PHYs
Changes since RFC:
- patch 3: fix location of phylink_xxx_supports_wol() helpers
- patch 3: handle sopass for WAKE_MAGICSECURE only when the MAC is
  handling magic secure.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h       | 11 +--
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 31 +-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 45 +++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  4 +-
 drivers/net/phy/phy_device.c                       | 14 +++-
 drivers/net/phy/phylink.c                          | 92 +++++++++++++++++++++-
 include/linux/phy.h                                | 21 +++++
 include/linux/phylink.h                            | 28 +++++++
 8 files changed, 182 insertions(+), 64 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
