Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF5CA4823F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:00:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC4C0C7A849;
	Thu, 27 Feb 2025 15:00:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB8FCC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PgMRekuM6/wN27KKXDqw9MR6fLL7vwR1VpZwGH+P4Y8=; b=a9KJOkrzhoferwAPNCQyMPdkU2
 qZq3mkWYyvs6Z4TJGj35fJVHCiby0eopRMzZYQ5xd0L6GlUXgF3/QPA/AOsBkurMLKePFqo0iHFLK
 AlGAlRAPdSiZj5m+yHUBbsES7QgzC4r2bJWRb1u3BBTEWgDJmFIaG+xLeVwlj4uq51q+kNwyV7M2M
 hvvLTPAUWPEK9XJIhQ7+N7rxB2Xao20o/RB+zNLhcu6qspur//+lo795Ax+Eml/Iu6IdgnV55xvp5
 qqytsHGLIeT7+mWIjr5Z9FQ7vmG9AR/49sH9HCIfxFKxHUzsMhkIe6f6DRcz/cyq8++/4JGaST5wZ
 xogKCMyg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54178)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnfNH-0007Vv-0H;
 Thu, 27 Feb 2025 15:00:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnfNE-0008EE-31;
 Thu, 27 Feb 2025 15:00:28 +0000
Date: Thu, 27 Feb 2025 15:00:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 0/5] net: stmmac: fix setting RE and TE
	inappropriately
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

Note: this series depends on "net: stmmac: fix resume failures due to
RX clock".

This series addresses inappropriate setting of the receive and transmit
enables in the GMAC control register.

The databook is clear for the receive enable, that this should not be
set until the initialisation of the MAC and DMA has been completed.
The previous RFC patch series ("net: stmmac: fix resume failures due to
RX clock") which moves phylink_resume() solves that, but we are left
with these enables being set when the link is down. This is not correct.

Sadly, when XDP support was added, new calls to netif_carrier_on() and
netif_carrier_off() were added, which are incorrect in drivers that
make use of phylink - by doing so, the driver has no guarantee that
the .mac_link_up() and .mac_link_down() methods will be called in
sequence anymore.

Solving this requires a number of changes. First, fixing XDP to call
into phylink to bring the link down. This removes a source of
phylink method de-sync mentioned above.

Then we remove the racy teardown in the driver's remove method -
nothing should be torn down while userspace still has access to the
netdev.

Then we remove an unnecessary call to disable the enable bits in
the .ndo_stop() method.

Finally, we remove manipulation of the RE and TE bits from the
start_tx(), stop_tx(), start_rx() and stop_rx() methods.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 22 ++++++----------------
 3 files changed, 6 insertions(+), 36 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
