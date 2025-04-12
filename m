Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F33ECA86BFF
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 11:35:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87C0EC78F77;
	Sat, 12 Apr 2025 09:35:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 400C9C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=73zpcZNzKe8FYfTe+3EaL4lfP342rNv4xALU1Mdg9ZI=; b=k0KAIMTnhYWnkciA3DJxXWVNqJ
 8cAMrVPgalWOqaiY5qYM13rKcaMn3IzWJrGZG72VO8QuZL3YZVzjY2h4nTp0diSeYT14aEvWxjdAK
 TaansuIYENUC6QqjdfHH4SAIbndzr1jDW3wtghGXt8bNpZk3zGYt/CG7/fuHgNUryHrk0LM+5Agl5
 /RdGzml4jqvR+tW+xi8qb/HnyGeMdq9tkHgmptIiqynbMJJx0qMphLii7hHpnarZCzpAXMmsyrByR
 0ghvTQZSlp1QGZozy6iG38tJBEJYFwzTq1H8cUm1TuVK2VzPU4PNRj+pJgpPwni4AJ9S0HMNwQZR6
 cj4Mdd8g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43880)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u3XGM-0004QK-0B;
 Sat, 12 Apr 2025 10:34:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u3XGG-0005Yi-1k;
 Sat, 12 Apr 2025 10:34:52 +0100
Date: Sat, 12 Apr 2025 10:34:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: fix setting RE and
 TE inappropriately
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

This series addresses inappropriate setting of the receive and transmit
enables in the GMAC control register identified back in
https://lore.kernel.org/r/Z8BboX9RxZBSXRr1@shell.armlinux.org.uk

The databook is clear for the receive enable, that this should not be
set until the initialisation of the MAC and DMA has been completed.
The previous RFC patch series ("net: stmmac: fix resume failures due to
RX clock") which moves phylink_resume() solves that, but we are left
with these enables being set when the link is down. This is not correct.

Sadly, when XDP support was added, new calls to netif_carrier_on() and
netif_carrier_off() were added, which are incorrect in drivers that
make use of phylink - by doing so, the driver has no guarantee that
the .mac_link_up() and .mac_link_down() methods will be called in
sequence anymore. This is fixed in patch 1.

We remove manipulation of the RE and TE bits from the start_tx(),
stop_tx(), start_rx() and stop_rx() methods for each core.

Finally, we remove the stmmac_mac_set() call from stmmac_hw_setup().

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 17 ++++++-----------
 3 files changed, 6 insertions(+), 31 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
