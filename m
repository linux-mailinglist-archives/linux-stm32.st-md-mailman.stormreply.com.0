Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16723C2B806
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:49:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4AE1C62D2D;
	Mon,  3 Nov 2025 11:49:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97A93C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GTfMsl5VdszDHeLyngBRKiaPiX+MAqFEJJUPqI8k2GI=; b=gNKzdyIAH2mme3mWN8ZqzZZWor
 vNnDr4RJdn7vga8saNkBBGnBLW5U2X78/HI2+HCcVG0VTWh0SIIHJQfU3qWFyWzeGhBCR8MaQGPVj
 rKBALG4yYpxykQEFWOtBtSuE23KFadOONtu5PDwNTLlfc9mGp98uXHRT8Z5+Qkh77ZOSQ45F/HiiI
 Cd8pEeclcM6R8ItQhkSojdVgfuoLLzJd53hFABseSHuns+iLoZT/wPvIyzn7yv5XD591V77ksOSKf
 XvrUjJ4ph1dKJH5Uh64MpOOLpGPAbVTIwnbczewIdaV2RxdxpA7P77vQiaOJS4Xuj6hoqGEbG1FrX
 XIJxknVw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55964)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vFt46-000000000ep-0SZE;
 Mon, 03 Nov 2025 11:49:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vFt43-000000003mC-1llA; Mon, 03 Nov 2025 11:49:35 +0000
Date: Mon, 3 Nov 2025 11:49:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: multi-interface
	stmmac
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

This series adds a callback for platform glue to configure the stmmac
core interface mode depending on the PHY interface mode that is being
used. This is currently only called justbefore the dwmac core is reset
since these signals are latched on reset.

Included in this series are changes to s32 to move its PHY_INTF_SEL_x
definitions out of the way of the dwmac core's signals which has more
entitlement to use this name. We convert dwmac-imx as an example.

Including other platform glue would make this series excessively large,
but once this core code is merged, the individual platform glue updates
can be posted one after another as they will be independent of each
other.

It is hoped that this callback can be used in future to reconfigure the
dwmac core when the interface mode changes to support PHYs that change
their interface mode, but we're nowhere near being able to do that yet.

 drivers/net/ethernet/stmicro/stmmac/common.h      |  10 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 134 +++++++---------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c   |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  54 +++++++++
 include/linux/stmmac.h                            |   1 +
 6 files changed, 115 insertions(+), 95 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
