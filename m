Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A96C2C4C40B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 09:08:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EFEAC60497;
	Tue, 11 Nov 2025 08:08:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F169CC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R4v0T/jYSK8ngu6ACLcnRSLuWsTH7J+YbIQLDPezMxs=; b=cTiTNXOLW3RqLXigzxvsker54y
 g9a8LCpbcringQVyc8/mHLO9Z+VijvZ62PYOuEJse/aNKrHo6DsdD2JifuRBNEHBMytboM/zxuZ8o
 W2JevlUfztmI2Iuio2DXqM22dOh6BKWHhjoxD4eU6wSpwQ+2SKVaA+WJ59lZglIMZNQX7mmVyt+2i
 +7skzzvbhN32GpXwbgX0bz7F2UwpvdlK3rrifLlHPydqJ70EKS4hgK0dvWDc7RcH9+aLMZsqSHA7y
 Y+oEu6jocsY/myOZkIHq0qT4zN3pQbMjfB7rQQmnRBa46IVHomT/wYF1hQw2lqT6EQVNdbKi21SzW
 GBKafOTw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37306)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vIjQV-0000000028e-3t9d;
 Tue, 11 Nov 2025 08:08:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vIjQM-000000002m9-2KCm; Tue, 11 Nov 2025 08:08:22 +0000
Date: Tue, 11 Nov 2025 08:08:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aRLu9qdfUnizqJRR@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
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
Subject: [Linux-stm32] [PATCH net-next 00/13] net: stmmac: convert glue
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
