Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75868BA6C77
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Sep 2025 10:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32121C3F95D;
	Sun, 28 Sep 2025 08:59:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A7E8C3FAD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Sep 2025 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g1oVnAqIRynEdvtoz62JGVAuoit/j3pFYMM2fpFBQec=; b=DqgYUnERY07W98n11vJicdqk2c
 go4P3eNuR4PhwpX9UriGbqN914adWhCxKX1xklzqxcuTc4WmC5k02LkVbwLSVp54/6p8645fclIJn
 vueeOYLqex3ojNdfYWAuFARcfeBNOWUVCfQLP6Q2RSygJEgzcmt3+9I5f+SfaroLxbOhYpFRqa4i7
 wpGNXMxzMSWFf3888PzzEy89aR38G61KzonQZNpJ/aIXPbJO+M47tOWIvUPRUyLG1o8CPZhZKvjga
 Sg74MoNL7UDBbccqR6Xv+4k7MPU3ZshqYrn3D7T8YbGTE7ovXzAYVZ1IntRvaAC2zvvbmiGXor5cC
 kTqK31iA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40264 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v2nFd-000000005Bv-3hCj;
 Sun, 28 Sep 2025 09:59:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v2nFX-00000007jXn-2pUD; Sun, 28 Sep 2025 09:59:19 +0100
In-Reply-To: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
References: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v2nFX-00000007jXn-2pUD@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 09:59:19 +0100
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tristram Ha <Tristram.Ha@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH RFC net-next 6/6] net: stmmac: convert to
 phylink managed WoL PHY speed
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

Convert stmmac to use phylink's management of the PHY speed when
Wake-on-Lan is enabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  5 -----
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c  |  7 +------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +--------------
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index db4f82672d9a..d10da13ad645 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -376,11 +376,6 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
-static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
-{
-	return !priv->plat->pmt && device_may_wakeup(priv->device);
-}
-
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index fd29b551a082..7ab736de308f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -793,13 +793,8 @@ static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret;
 
-	ret = phylink_ethtool_set_wol(priv->phylink, wol);
-	if (!ret)
-		device_set_wakeup_enable(priv->device, !!wol->wolopts);
-
-	return ret;
+	return phylink_ethtool_set_wol(priv->phylink, wol);
 }
 
 static int stmmac_ethtool_op_get_eee(struct net_device *dev,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index abe88b74239a..7b4f0c54b9ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1189,14 +1189,6 @@ static int stmmac_init_phy(struct net_device *dev)
 		phylink_ethtool_set_eee(priv->phylink, &eee);
 	}
 
-	if (!priv->plat->pmt) {
-		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
-
-		phylink_ethtool_get_wol(priv->phylink, &wol);
-		device_set_wakeup_capable(priv->device, !!wol.supported);
-		device_set_wakeup_enable(priv->device, !!wol.wolopts);
-	}
-
 	return 0;
 }
 
@@ -1265,6 +1257,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		config->eee_enabled_default = true;
 	}
 
+	config->wol_phy_speed_ctrl = true;
 	if (priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
 		config->wol_phy_legacy = true;
 	} else {
@@ -7795,9 +7788,6 @@ int stmmac_suspend(struct device *dev)
 	mutex_unlock(&priv->lock);
 
 	rtnl_lock();
-	if (stmmac_wol_enabled_phy(priv))
-		phylink_speed_down(priv->phylink, false);
-
 	phylink_suspend(priv->phylink, !!priv->wolopts);
 	rtnl_unlock();
 
@@ -7936,9 +7926,6 @@ int stmmac_resume(struct device *dev)
 	 * workqueue thread, which will race with initialisation.
 	 */
 	phylink_resume(priv->phylink);
-	if (stmmac_wol_enabled_phy(priv))
-		phylink_speed_up(priv->phylink);
-
 	rtnl_unlock();
 
 	netif_device_attach(ndev);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
