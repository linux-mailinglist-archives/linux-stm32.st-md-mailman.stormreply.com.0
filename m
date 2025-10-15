Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFC7BDF919
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 18:09:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF73C5663E;
	Wed, 15 Oct 2025 16:09:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27558C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F8AivNmNX6ytHIHlRjMKoCXQh8wrZGlkylky6XBPiQc=; b=JSl3cHHKoZDp+JKzHu7hDUEWlw
 59mlLBmMOXJDVl0p0OuMwUoP6WEKYaTspfWZwwMBcB1GSFJzGee6OMchHlEPUXc+Lkwv9XJfVKUNg
 UGf6+0vAQH0LmaN6JKzr8HupJc5COgTuT1cDtllNsAgs19TaoYZ1SGoZfx18GWaMJGySOgJP0l6iS
 zEVRBEczRTsiwio6cv+4f2ZIO6oFTKf+mWQQQb28D0K7CCA7CD/w2R+hMrUMxEW2L3S6p7iwuabz/
 pgwkwRcKVSp58/aNGiJxOEE05/vwTnZgR2wUivvdpNnLByWxjMWgnksQ654zNpuQYBm+4T0Giptcj
 9BiTBHBw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51416)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v943s-0000000059Q-2LIy;
 Wed, 15 Oct 2025 17:09:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v943n-000000002OD-3sXH; Wed, 15 Oct 2025 17:09:07 +0100
Date: Wed, 15 Oct 2025 17:09:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: more cleanups
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

The subject for the cover message is wearing thin as I've used it a
number of times, but the scope for cleaning up the driver continues,
and continue it will do, because this is just a small fraction of the
queue.

1. make a better job of one of my previous commits, moving the holding
   of the lock into stmmac_mdio.c

2. move the mac_finish() method to be in-order with the layout of
   struct phylink_mac_ops - this order was chosen because it reflects
   the order that the methods are called, thus making the flow more
   obvious when reading code.

3. continuing on the "removal of stuff that doesn't need to happen",
   patch 3 removes the phylink_speed_(up|down) out of the path that
   is used for MTU changes - we really don't need to fiddle with the
   PHY advertisement when changing the MTU!

4. clean up tc_init()'s initialisation of flow_entries_max - this is
   the sole place that this is written, and we might as well make the
   code more easy to follow.

5. stmmac_phy_setup() really confuses me when I read the code, it's
   not really about PHY setup, but about phylink setup. So, name its
   name reflect its functionality.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 49 +++++++++++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 14 +++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  6 +--
 5 files changed, 46 insertions(+), 29 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
