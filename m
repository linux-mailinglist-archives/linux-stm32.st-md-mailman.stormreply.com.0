Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4E78705E
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 15:38:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 992E5C6B44F;
	Thu, 24 Aug 2023 13:38:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FF15C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r6O6RSRp6YDHbbpq6uICMyLDTLB4GW3APZkGyfsKHnU=; b=f1k3D0vgKh5BtpvAKUNYmPpnyL
 rZg2QM/fWg1n9cYxlqh7xJ7giHaZ1wR+fa1a46BWzjV44CQgpKnAr+ffAGdsh6lBJEYPN+76iNEWx
 sSEc2vn9sp8cUICMcRvvMXWTOcs4G3lSqbupGWPY9vJTIaIOKQHY0TeygINZtpgaAuI/9E1ym5ZrR
 Dkkw4hSmjfLgUmbJMZHwID25DRz/yYmCO/yJXXr/kNE7eQfPg9dt2y2WOegCM+jJb7fYjN2ociL9U
 hMRv74DorCBg2QkzeYHnidCt8+KzjSGGGuE+Jy1+vQyWmSdphA7Eo4n6iHQb6SHQ64H5/OXEZaO7g
 ptUPtAiA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51988 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qZAXD-0004CS-1u;
 Thu, 24 Aug 2023 14:38:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qZAXD-005pTv-TN; Thu, 24 Aug 2023 14:38:03 +0100
In-Reply-To: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qZAXD-005pTv-TN@rmk-PC.armlinux.org.uk>
Date: Thu, 24 Aug 2023 14:38:03 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 03/10] net: stmmac: clean up passing
 fwnode to phylink
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

Move the initialisation of the fwnode variable closer to its use
site, rather than scattered throughout stmmac_phy_setup().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a2dfb624e10c..7d97166194b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1200,9 +1200,9 @@ static int stmmac_init_phy(struct net_device *dev)
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data = priv->plat->mdio_bus_data;
-	struct fwnode_handle *fwnode = priv->plat->port_node;
 	int max_speed = priv->plat->max_speed;
 	int mode = priv->plat->phy_interface;
+	struct fwnode_handle *fwnode;
 	struct phylink *phylink;
 
 	priv->phylink_config.dev = &priv->dev->dev;
@@ -1211,9 +1211,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		priv->phylink_config.ovr_an_inband =
 			mdio_bus_data->xpcs_an_inband;
 
-	if (!fwnode)
-		fwnode = dev_fwnode(priv->device);
-
 	/* Set the platform/firmware specified interface mode */
 	__set_bit(mode, priv->phylink_config.supported_interfaces);
 
@@ -1254,6 +1251,10 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
 	priv->phylink_config.mac_managed_pm = true;
 
+	fwnode = priv->plat->port_node;
+	if (!fwnode)
+		fwnode = dev_fwnode(priv->device);
+
 	phylink = phylink_create(&priv->phylink_config, fwnode,
 				 mode, &stmmac_phylink_mac_ops);
 	if (IS_ERR(phylink))
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
