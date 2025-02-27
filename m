Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE30A4819A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 15:38:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FCE4C7A84B;
	Thu, 27 Feb 2025 14:38:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4F89C7A849
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z915uYURLS9YYBK3HUBsVHhjYSPFcN02eHGGjD1vORo=; b=hhiZzwczH9Jwtadlk7SMudUeFF
 XLSnG+YnH9bmqrRioM9+hniodnLIItH5IQk14TNZ4+Hbsa1kgzAylRWI1L0lNXz8QwWXXQJOU4o/u
 vHUg11YFlr88KC6I7w140r+cI83jfmFgGOFxx9tByGPC6UHsdmPrXsNiNkRxvNsCxgpe/nIfhQH4H
 op8/6arxw0G8A2P0eKaISlNJFq0v1fgsiYlxumE6cR8kpxgJGiwZEy4gyUlmKoA32iBOTmwtzgbB0
 4kZrZTjqaTTi+oh6VhAJUeyXoe5SZAsgzcPSMqRATmFbne7xSb7CrAQnCRKjcE7thmWKcK6kLfM6Z
 ViGD3M5g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35842 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tnf1r-0007R1-1z;
 Thu, 27 Feb 2025 14:38:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tnf1X-0056LI-9i; Thu, 27 Feb 2025 14:38:03 +0000
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tnf1X-0056LI-9i@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 14:38:03 +0000
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 4/5] net: stmmac: move
 phylink_resume() after resume setup is complete
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

Move phylink_resume() to be after the setup in stmmac_resume() has
completed, as phylink_resume() may result in an immediate call to the
.mac_link_up method, which will enable the transmitter and receiver,
and enable the transmit queues.

This behaviour has been witnessed by Jon Hunter on the Jetson TX2
platform (Tegra 186).

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fbcba6c71f12..23c610f7c779 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7924,12 +7924,6 @@ int stmmac_resume(struct device *dev)
 			return ret;
 	}
 
-	rtnl_lock();
-	phylink_resume(priv->phylink);
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
-		phylink_speed_up(priv->phylink);
-	rtnl_unlock();
-
 	rtnl_lock();
 	mutex_lock(&priv->lock);
 
@@ -7948,6 +7942,11 @@ int stmmac_resume(struct device *dev)
 	stmmac_enable_all_dma_irq(priv);
 
 	mutex_unlock(&priv->lock);
+
+	phylink_resume(priv->phylink);
+	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+		phylink_speed_up(priv->phylink);
+
 	rtnl_unlock();
 
 	netif_device_attach(ndev);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
