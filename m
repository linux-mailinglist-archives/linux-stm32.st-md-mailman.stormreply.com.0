Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D27A8A41D
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 18:29:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9D68C78023;
	Tue, 15 Apr 2025 16:29:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63CFAC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dN5nYyiU35H99VU7lHwdDyUBPUQ+9txXBMSlQXrMmdM=; b=tCSG7ijLCLZYTgm+x8yJfhVWNb
 j77xBlbDb8pWvFuI2hysvtt0TlXtumAMr2ujSjel9si064CRoAIYdeQkONNCnFnCnM6lZOHz4uHmd
 X0Pb3ZR8VBnv1ChNx8e5faJHZ6NxCcscq2OevudnD7kXgoXqzNy4SEvLD84TCeOOQPsmx+/+JEzKN
 a1reWh8eAecpU6u04O2S2FHRM7rK+x1lSXuitaUKUt5WM9f0g99uNbG1kztF200CSFjKBL/nvZCXS
 XkYr1749Mnal/2wYTqA5GcvQm9j10haHGEAOmzFgVDE6czJr4FYasyFKpwikEJVtrOAKCDHQI0FdM
 iiMk/kwA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33638)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4jAC-0008T0-0g;
 Tue, 15 Apr 2025 17:29:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4jA8-0000Vx-14;
 Tue, 15 Apr 2025 17:29:28 +0100
Date: Tue, 15 Apr 2025 17:29:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: socfpga: fix init
 ordering and cleanups
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

This series fixes the init ordering of the socfpga probe function.
The standard rule is to do all setup before publishing any device,
and socfpga violates that. I can see no reason for this, but these
patches have not been tested on hardware.

Address this by moving the initialisation of dwmac->stmmac_rst
along with all the other dwmac initialisers - there's no reason
for this to be late as plat_dat->stmmac_rst has already been
populated.

Next, replace the call to ops->set_phy_mode() with an init function
socfpga_dwmac_init() which will then be linked in to plat_dat->init.

Then, add this to plat_dat->init, and switch to stmmac_pltfr_pm_ops
from the private ops. The runtime suspend/resume socfpga implementations
are identical to the platform ones, but misses the noirq versions
which this will add.

Next, swap the order of socfpga_dwmac_init() and stmmac_dvr_probe().

Finally, convert to devm_stmmac_pltfr_probe() by moving the call
to ops->set_phy_mode() into an init function appropriately populating
plat_dat->init.

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 79 +++++-----------------
 1 file changed, 16 insertions(+), 63 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
