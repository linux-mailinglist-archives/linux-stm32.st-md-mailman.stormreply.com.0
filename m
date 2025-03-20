Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D52A6B06F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 23:11:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB56DC78F64;
	Thu, 20 Mar 2025 22:11:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB373C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 22:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFupyxRw5puB7rY+I+pSpWWinqc8yOvuXTzK677/+ko=; b=dPynrXQVBUh0EjRZA7HxfWyQtR
 WRKRPt7Q8mN0m1CGloIwWN5CB5VJkKlpI6uwLxiJlW6rAWVAMUQlPJbYpKA+xZclj6glqHhtozKES
 1EdwLJfnDNQB9GRA2pORTp4y+mDPp7N2jh2dUGU7UjKSy2lRFWSj9aKtpxo/Hl2j8MXXjIsHjq8za
 0dJzaL7Y7M29ab/QFiH0PpvtJ+hH9Zm7lvoW5YLJuuraPHfPtpL20TXhGRHjoLGAeA4enDKnH3kEP
 bGlQy8hQR3IxAEn5TXoNKEofQHI0nQ/IUUqGM8ML5yOgAc+IRs10Do+RWx3fXUgrsudcZzLQnE0Ho
 fSi6WbHA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60908 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tvO70-0008E5-0O;
 Thu, 20 Mar 2025 22:11:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tvO6f-008Vjn-J1; Thu, 20 Mar 2025 22:11:17 +0000
In-Reply-To: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
References: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tvO6f-008Vjn-J1@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Mar 2025 22:11:17 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/5] net: stmmac: socfpga: remove
	phy_resume() call
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

As the previous commit addressed DWGMAC resuming with a PHY in
suspended state, there is now no need for socfpga to work around
this. Remove this code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c    | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 6b78ae730466..116855658559 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -523,24 +523,6 @@ static int socfpga_dwmac_resume(struct device *dev)
 
 	dwmac_priv->ops->set_phy_mode(priv->plat->bsp_priv);
 
-	/* Before the enet controller is suspended, the phy is suspended.
-	 * This causes the phy clock to be gated. The enet controller is
-	 * resumed before the phy, so the clock is still gated "off" when
-	 * the enet controller is resumed. This code makes sure the phy
-	 * is "resumed" before reinitializing the enet controller since
-	 * the enet controller depends on an active phy clock to complete
-	 * a DMA reset. A DMA reset will "time out" if executed
-	 * with no phy clock input on the Synopsys enet controller.
-	 * Verified through Synopsys Case #8000711656.
-	 *
-	 * Note that the phy clock is also gated when the phy is isolated.
-	 * Phy "suspend" and "isolate" controls are located in phy basic
-	 * control register 0, and can be modified by the phy driver
-	 * framework.
-	 */
-	if (ndev->phydev)
-		phy_resume(ndev->phydev);
-
 	return stmmac_resume(dev);
 }
 #endif /* CONFIG_PM_SLEEP */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
