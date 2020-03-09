Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71717DB0A
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Mar 2020 09:36:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7305C36B1E;
	Mon,  9 Mar 2020 08:36:48 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79028C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2020 08:36:46 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F11C2C04C0;
 Mon,  9 Mar 2020 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583743004; bh=nNW7ATs8+GuGeb3XY+MZ9vqqRxlVeew7FQjk122/a3E=;
 h=From:To:Cc:Subject:Date:From;
 b=ZcicXufR4XTCBX1R49tN9rvomFqt9gJOHipcnE6Ebh37+J79vyF5cZX7VHlzDm7Hl
 tuuHmZbca9mllw360dlR2UgwNMtNVuSDfKJI8TUgzUNveltSy3Az250ONW4p1SWVCo
 V3qWxpYjhlG8PL5YVdsa+AWYQcQ7rf4Cj9jGsElUJPvdh2IlVs4IoGUyrbaUslnxPe
 Fy+Ee6fPi+hvm/35w5hKcq2lYY8mmwAS5FUxk3SgTPtgPPj7wXDcq9ffkDlsFUVTc6
 X3c4jVSzPL1TdQjjYUrjPapoIxH+A/9ZR6a6dRCA9+5stxGSuOTYDZmeQ5wG5WNIp/
 eax4z/zWeagug==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id C741CA005C;
 Mon,  9 Mar 2020 08:36:38 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  9 Mar 2020 09:36:19 +0100
Message-Id: <cover.1583742615.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Joao Pinto <Joao.Pinto@synopsys.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 0/8] net: Add support for Synopsys
	DesignWare XPCS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This adds support for Synopsys DesignWare XPCS in net subsystem and
integrates it into stmmac.

At 1/8, we start by removing the limitation of stmmac selftests that needed
a PHY to pass all the tests.

Then at 2/8 we use some helpers in stmmac so that some code can be
simplified.

At 3/8, we fallback to dev_fwnode() so that PCI based setups wich may
not have CONFIG_OF can still use FW node.

At 4/8, we adapt stmmac to the new PHYLINK changes as suggested by Russell
King.

We proceed by doing changes in PHYLINK in order to support XPCS: At 5/8 we
add some missing speeds that USXGMII supports and at 6/8 we check if
Autoneg is supported after initial parameters are validated.

Support for XPCS is finally introduced at 7/8, along with the usage of it
in stmmac driver at 8/8.

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Jose Abreu (8):
  net: stmmac: selftests: Do not fail if PHY is not attached
  net: stmmac: Switch to linkmode_and()/linkmode_andnot()
  net: stmmac: Fallback to dev_fwnode() if needed
  net: stmmac: Use resolved link config in mac_link_up()
  net: phylink: Add missing Backplane speeds
  net: phylink: Test if MAC/PCS support Autoneg
  net: phy: Add Synopsys DesignWare XPCS MDIO module
  net: stmmac: Integrate it with DesignWare XPCS

 MAINTAINERS                                        |   7 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h       |   3 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  12 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  96 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  27 +
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c |   2 +-
 drivers/net/phy/Kconfig                            |   6 +
 drivers/net/phy/Makefile                           |   1 +
 drivers/net/phy/mdio-xpcs.c                        | 612 +++++++++++++++++++++
 drivers/net/phy/phylink.c                          |   5 +
 include/linux/mdio-xpcs.h                          |  41 ++
 include/linux/stmmac.h                             |   1 +
 13 files changed, 771 insertions(+), 43 deletions(-)
 create mode 100644 drivers/net/phy/mdio-xpcs.c
 create mode 100644 include/linux/mdio-xpcs.h

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
