Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02527787063
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 15:38:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC9B9C6B454;
	Thu, 24 Aug 2023 13:38:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8A09C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fL2vmU0lJyEilSH6H6zvhSQ3kxhQLqqMcqHG138QaUM=; b=v048nZiNmFsgapvw8SNn1zpX0p
 YWAbOIBRp6gG7xg3O96UaGgdLNwRwAMVIogELoM8iwKRPERMwmAGf5OgN/4AEzmp2O63wLVjWhGbx
 mKTMJwpHrZ8IbXJ8Lt+TCUx8mqRyUWGecy7iZG2uriugF/BqNUCle4RkvoR7dKqwHx6Y27DJibR12
 tDs/nLXX3J3Tixcw1x5plCjJFJL9VXzZU+LeXZ7ddqYj5NnDUjXitdoHHAWpeKqa9u3BT9V0rosNG
 /2RgAy7Si4n8BU8aNwXo1bArrI4yn3GfiaKjbdGUXCw1/g+l+uIrV+Tmpt+cDbMBaLjZCKD9P4Ud2
 IeISrkmw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54822 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qZAXN-0004D7-2k;
 Thu, 24 Aug 2023 14:38:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qZAXO-005pU7-61; Thu, 24 Aug 2023 14:38:14 +0100
In-Reply-To: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qZAXO-005pU7-61@rmk-PC.armlinux.org.uk>
Date: Thu, 24 Aug 2023 14:38:14 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 05/10] net: stmmac: use
	phylink_limit_mac_speed()
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

Use phylink_limit_mac_speed() to limit the MAC capabilities rather
than coding this for each speed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++-----------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fe733a9f5fe4..30a085f2b8fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1200,10 +1200,10 @@ static int stmmac_init_phy(struct net_device *dev)
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
-	int max_speed = priv->plat->max_speed;
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *fwnode;
 	struct phylink *phylink;
+	int max_speed;
 
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
@@ -1222,29 +1222,18 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 				    priv->phylink_config.supported_interfaces);
 
 	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-		MAC_10 | MAC_100;
-
-	if (!max_speed || max_speed >= 1000)
-		priv->phylink_config.mac_capabilities |= MAC_1000;
+		MAC_10 | MAC_100 | MAC_1000;
 
 	if (priv->plat->has_gmac4) {
-		if (!max_speed || max_speed >= 2500)
-			priv->phylink_config.mac_capabilities |= MAC_2500FD;
+		priv->phylink_config.mac_capabilities |= MAC_2500FD;
 	} else if (priv->plat->has_xgmac) {
-		if (!max_speed || max_speed >= 2500)
-			priv->phylink_config.mac_capabilities |= MAC_2500FD;
-		if (!max_speed || max_speed >= 5000)
-			priv->phylink_config.mac_capabilities |= MAC_5000FD;
-		if (!max_speed || max_speed >= 10000)
-			priv->phylink_config.mac_capabilities |= MAC_10000FD;
-		if (!max_speed || max_speed >= 25000)
-			priv->phylink_config.mac_capabilities |= MAC_25000FD;
-		if (!max_speed || max_speed >= 40000)
-			priv->phylink_config.mac_capabilities |= MAC_40000FD;
-		if (!max_speed || max_speed >= 50000)
-			priv->phylink_config.mac_capabilities |= MAC_50000FD;
-		if (!max_speed || max_speed >= 100000)
-			priv->phylink_config.mac_capabilities |= MAC_100000FD;
+		priv->phylink_config.mac_capabilities |= MAC_2500FD;
+		priv->phylink_config.mac_capabilities |= MAC_5000FD;
+		priv->phylink_config.mac_capabilities |= MAC_10000FD;
+		priv->phylink_config.mac_capabilities |= MAC_25000FD;
+		priv->phylink_config.mac_capabilities |= MAC_40000FD;
+		priv->phylink_config.mac_capabilities |= MAC_50000FD;
+		priv->phylink_config.mac_capabilities |= MAC_100000FD;
 	}
 
 	/* Half-Duplex can only work with single queue */
@@ -1253,6 +1242,10 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
 	priv->phylink_config.mac_managed_pm = true;
 
+	max_speed = priv->plat->max_speed;
+	if (max_speed)
+		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
+
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
