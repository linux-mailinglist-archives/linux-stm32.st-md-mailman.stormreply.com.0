Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F926A8B562
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 11:31:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 084D3C78F81;
	Wed, 16 Apr 2025 09:31:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24776C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xHYaOtwx99ZZgi8ahq47uLXju4A9RCSm3k3c98E5wYI=; b=fqDJ91iq7sXU6lG5+Xaf6CZH6A
 xRTvrrlxNWtyH0c+78YyIh/ZgKdsGwXDqxKcb62dNl3rpa2u4PVOMq44XrMNxeDq0BAS5sewyupBv
 QJHCLn6hJC3+UWthihjjaKMeue6noJDORmBJEoYkQo5gaZiKl88jLHNh6oEq8x2rqjKtc2HIaLMQx
 Fw8oHP5hUrolWoM1aZJxm78UJTsWTRa/vbdH4bDsazspygcmU3wajRCkaRZ+afPLHv9QHgdRmjVBE
 1uDMeXdD34KCS1xv4qsQDw19plgleDEDZC+VGKwlGbTHuUANj80pifhtN258zEqqhaMqf3gbmTonP
 k+uTnleQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58106)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4z7V-0000yH-0c;
 Wed, 16 Apr 2025 10:31:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4z7Q-0001Hh-0x;
 Wed, 16 Apr 2025 10:31:44 +0100
Date: Wed, 16 Apr 2025 10:31:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/5] net: stmmac: socfpga: fix
 init ordering and cleanups
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

Before we swap the order of socfpga_dwmac_init() and
stmmac_dvr_probe(), we need to change the way the interface is
obtained, as that uses driver data and the struct net_device which
haven't been initialised. Save a pointer to plat_dat in the socfpga
private data, and use that to get the interface mode. We can then swap
the order of the init and probe functions.

Finally, convert to devm_stmmac_pltfr_probe() by moving the call
to ops->set_phy_mode() into an init function appropriately populating
plat_dat->init.

v2: fix oops when calling set_phy_mode() early.

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 79 +++++-----------------
 1 file changed, 16 insertions(+), 63 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
