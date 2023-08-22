Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D851478499D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 20:50:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F900C6B44C;
	Tue, 22 Aug 2023 18:50:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C3B0C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+PIAFvnnVRoqBc3oEJJkW0gQZ7UP+fUDByEcVubuzS0=; b=rYdVHBW1mnILRLn2nkRxHDjBM8
 D2/2fjXQhwIZ9856rMCRz2LsQliUybTS8V7/X8gpwul3ngsfqZNKGMIrwGIkSiYl9mxnryz+skSux
 GNfurXnrZ93hbwiaolggEadQjrJYiDswuu1OIIsSKa2Z/102fQjxkOOzSPGLi8cYo4XO80wmHnOxQ
 b/7elxhhuwruHvh0Siwyfg4p8prMefT9HiK08+PIJrwmmKrS/xL6VBbXyQOx9F1bMsTByz8ZMkDYq
 CUk/eCyVqEStIXurMmilBALEiQ2QBZdhbHweYrlpKoHOSwKsms4nbzzgRuqzdNcQpEbRsm1FqQmwm
 y+AWFv3Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60680 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qYWSI-0001rt-2M;
 Tue, 22 Aug 2023 19:50:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qYWSJ-005fXr-2M; Tue, 22 Aug 2023 19:50:19 +0100
In-Reply-To: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
References: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qYWSJ-005fXr-2M@rmk-PC.armlinux.org.uk>
Date: Tue, 22 Aug 2023 19:50:19 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 4/9] net: stmmac: use "mdio_bus_data"
	local variable
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

We have a local variable for priv->plat->mdio_bus_data, which we use
later in the conditional if() block, but we evaluate the above within
the conditional expression. Use mdio_bus_data instead. Since these
will be the only two users of this local variable, move its assignment
just before the if().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7d97166194b5..fe733a9f5fe4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1199,7 +1199,7 @@ static int stmmac_init_phy(struct net_device *dev)
 
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
-	struct stmmac_mdio_bus_data *mdio_bus_data = priv->plat->mdio_bus_data;
+	struct stmmac_mdio_bus_data *mdio_bus_data;
 	int max_speed = priv->plat->max_speed;
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *fwnode;
@@ -1207,7 +1207,9 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
-	if (priv->plat->mdio_bus_data)
+
+	mdio_bus_data = priv->plat->mdio_bus_data;
+	if (mdio_bus_data)
 		priv->phylink_config.ovr_an_inband =
 			mdio_bus_data->xpcs_an_inband;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
