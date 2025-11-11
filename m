Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6369C4C46D
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 09:11:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A3FCC628AA;
	Tue, 11 Nov 2025 08:11:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3019DC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R4v0T/jYSK8ngu6ACLcnRSLuWsTH7J+YbIQLDPezMxs=; b=qffcZfWRYLgsyXDoZnCmSC8DaU
 gLwEBczqur0L6JTHiMf48sWjyW0H7eFBsRltMRz++iQ//Xdp0wUkR5VIp8x8vPvonpfTVG+eLCPMX
 YV0C9bY3IK6t96L2RxpbtfnBOsuewGiT6Tdd0r+2waJVlr41Vi5WNh1Ui+pimwqySOoQmQK17yBsB
 eVqyNX4p4hqKECB1FcGHpDyL58e7ROLnJV3WqwJRCS9PKX9D93ghM4lb7nAw2kftfgF3BrDYCzIOy
 8prMLIDMiG78wImay5usyazruInKjFh1npzjmZZPzwysllPwmoUjaUdikR6Wwd9dT7hhWwVDtPtYm
 HqhbGfUA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41674)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vIjTL-00000000295-1GyZ;
 Tue, 11 Nov 2025 08:11:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vIjTJ-000000002nI-1GLe; Tue, 11 Nov 2025 08:11:25 +0000
Date: Tue, 11 Nov 2025 08:11:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next v2 00/13] net: stmmac: convert glue
 drivers to use stmmac_get_phy_intf_sel()
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

This series converts the remaining glue drivers that support
multi-interface to use stmmac_get_phy_intf_sel(). The reason these
drivers are not converted to the set_phy_intf_sel() method is
because it is unclear whether there are ordering dependencies that
would prevent it.

For example, reading the stm32mp2 documentation, it is required to
set the ETH1_SEL field while the dwmac core is in reset and before
clocks are enabled. This requirement can not be satsified at the
moment (but could with further changes.)

v2:
- sending meson8b seperately
- updated a number of commit descriptions: PHY_INTF_SEL_xxx ->
  PHY_INTF_SEL_x, added note where GMII no longer errors out.

 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  | 18 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 77 ++++++++--------------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 24 ++-----
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 44 +++++++------
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   | 26 ++------
 5 files changed, 70 insertions(+), 119 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
