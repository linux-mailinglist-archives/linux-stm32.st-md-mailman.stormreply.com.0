Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234C4772C4
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 14:12:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 937BCC5F1D8;
	Thu, 16 Dec 2021 13:12:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A83B4C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t2vjzoX9cwMjGlu4dHBqN2Zl8P2+SybJYTU85oK98A4=; b=SMZj88Eiuw7lYX5Oa3yKrx3JGW
 BgDOrx6bkqpyDEKqhZXpUwVAu6bmXPI0zWuXzQJ+NvCwdum6Hh1yUvlBTixy/ZWPk3eIl6rfNchLw
 R2p7gdCz2uqjOuQ+o99Hzjv3FpV//SOC+7nESCl0AYVuXGgeQ2wfkXFisx2njI93ek3D4BcXj6hJM
 rwtToUHU2xpmS7l5rQrr+JT17AUt/sxkJdS4knKKcWt7QRxLv28vAjHWRH8rgRLO44bpRMT35JShI
 SZ+4y7ONV2/1ko/nVXvwbYA2itVZZBrLCHBiv5fngUomG4ICXlbvbng+G0Qwzq1PNm3JpvURRrk5o
 Xhfkfptg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49902 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mxqYY-0007sf-SG; Thu, 16 Dec 2021 13:12:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mxqYY-00GYYc-EW; Thu, 16 Dec 2021 13:12:22 +0000
In-Reply-To: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
References: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mxqYY-00GYYc-EW@rmk-PC.armlinux.org.uk>
Date: Thu, 16 Dec 2021 13:12:22 +0000
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH CFT net-next 2/6] net: stmmac: convert to
 phylink_get_linkmodes()
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

Add the MAC speed, duplex and pause capabilities to the phylink_config
structure, and switch stmmac_validate() to use phylink_get_linkmodes()
to generate the mask of supported ethtool link modes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 125 ++++++------------
 1 file changed, 42 insertions(+), 83 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c26ac288f981..09bef8310360 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -942,95 +942,22 @@ static void stmmac_validate(struct phylink_config *config,
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mac_supported) = { 0, };
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
-	int tx_cnt = priv->plat->tx_queues_to_use;
-	int max_speed = priv->plat->max_speed;
-
-	phylink_set(mac_supported, 10baseT_Half);
-	phylink_set(mac_supported, 10baseT_Full);
-	phylink_set(mac_supported, 100baseT_Half);
-	phylink_set(mac_supported, 100baseT_Full);
-	phylink_set(mac_supported, 1000baseT_Half);
-	phylink_set(mac_supported, 1000baseT_Full);
-	phylink_set(mac_supported, 1000baseKX_Full);
 
+	/* This is very similar to phylink_generic_validate() except that
+	 * we always use PHY_INTERFACE_MODE_INTERNAL to get all capabilities.
+	 * This is because we don't always have config->supported_interfaces
+	 * populated (only when we have the XPCS.)
+	 *
+	 * When we do have an XPCS, we could pass state->interface, as XPCS
+	 * limits to a subset of the ethtool link modes allowed here.
+	 */
 	phylink_set(mac_supported, Autoneg);
-	phylink_set(mac_supported, Pause);
-	phylink_set(mac_supported, Asym_Pause);
 	phylink_set_port_modes(mac_supported);
-
-	/* Cut down 1G if asked to */
-	if ((max_speed > 0) && (max_speed < 1000)) {
-		phylink_set(mask, 1000baseT_Full);
-		phylink_set(mask, 1000baseX_Full);
-	} else if (priv->plat->has_gmac4) {
-		if (!max_speed || max_speed >= 2500) {
-			phylink_set(mac_supported, 2500baseT_Full);
-			phylink_set(mac_supported, 2500baseX_Full);
-		}
-	} else if (priv->plat->has_xgmac) {
-		if (!max_speed || (max_speed >= 2500)) {
-			phylink_set(mac_supported, 2500baseT_Full);
-			phylink_set(mac_supported, 2500baseX_Full);
-		}
-		if (!max_speed || (max_speed >= 5000)) {
-			phylink_set(mac_supported, 5000baseT_Full);
-		}
-		if (!max_speed || (max_speed >= 10000)) {
-			phylink_set(mac_supported, 10000baseSR_Full);
-			phylink_set(mac_supported, 10000baseLR_Full);
-			phylink_set(mac_supported, 10000baseER_Full);
-			phylink_set(mac_supported, 10000baseLRM_Full);
-			phylink_set(mac_supported, 10000baseT_Full);
-			phylink_set(mac_supported, 10000baseKX4_Full);
-			phylink_set(mac_supported, 10000baseKR_Full);
-		}
-		if (!max_speed || (max_speed >= 25000)) {
-			phylink_set(mac_supported, 25000baseCR_Full);
-			phylink_set(mac_supported, 25000baseKR_Full);
-			phylink_set(mac_supported, 25000baseSR_Full);
-		}
-		if (!max_speed || (max_speed >= 40000)) {
-			phylink_set(mac_supported, 40000baseKR4_Full);
-			phylink_set(mac_supported, 40000baseCR4_Full);
-			phylink_set(mac_supported, 40000baseSR4_Full);
-			phylink_set(mac_supported, 40000baseLR4_Full);
-		}
-		if (!max_speed || (max_speed >= 50000)) {
-			phylink_set(mac_supported, 50000baseCR2_Full);
-			phylink_set(mac_supported, 50000baseKR2_Full);
-			phylink_set(mac_supported, 50000baseSR2_Full);
-			phylink_set(mac_supported, 50000baseKR_Full);
-			phylink_set(mac_supported, 50000baseSR_Full);
-			phylink_set(mac_supported, 50000baseCR_Full);
-			phylink_set(mac_supported, 50000baseLR_ER_FR_Full);
-			phylink_set(mac_supported, 50000baseDR_Full);
-		}
-		if (!max_speed || (max_speed >= 100000)) {
-			phylink_set(mac_supported, 100000baseKR4_Full);
-			phylink_set(mac_supported, 100000baseSR4_Full);
-			phylink_set(mac_supported, 100000baseCR4_Full);
-			phylink_set(mac_supported, 100000baseLR4_ER4_Full);
-			phylink_set(mac_supported, 100000baseKR2_Full);
-			phylink_set(mac_supported, 100000baseSR2_Full);
-			phylink_set(mac_supported, 100000baseCR2_Full);
-			phylink_set(mac_supported, 100000baseLR2_ER2_FR2_Full);
-			phylink_set(mac_supported, 100000baseDR2_Full);
-		}
-	}
-
-	/* Half-Duplex can only work with single queue */
-	if (tx_cnt > 1) {
-		phylink_set(mask, 10baseT_Half);
-		phylink_set(mask, 100baseT_Half);
-		phylink_set(mask, 1000baseT_Half);
-	}
+	phylink_get_linkmodes(mac_supported, PHY_INTERFACE_MODE_INTERNAL,
+			      config->mac_capabilities);
 
 	linkmode_and(supported, supported, mac_supported);
-	linkmode_andnot(supported, supported, mask);
-
 	linkmode_and(state->advertising, state->advertising, mac_supported);
-	linkmode_andnot(state->advertising, state->advertising, mask);
 
 	/* If PCS is supported, check which modes it supports. */
 	if (priv->hw->xpcs)
@@ -1253,6 +1180,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data = priv->plat->mdio_bus_data;
 	struct fwnode_handle *fwnode = of_fwnode_handle(priv->plat->phylink_node);
+	int max_speed = priv->plat->max_speed;
 	int mode = priv->plat->phy_interface;
 	struct phylink *phylink;
 
@@ -1266,6 +1194,37 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
 
+	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+		MAC_10 | MAC_100;
+
+	if (!max_speed || max_speed >= 1000)
+		priv->phylink_config.mac_capabilities |= MAC_1000;
+
+	if (priv->plat->has_gmac4) {
+		if (!max_speed || max_speed >= 2500)
+			priv->phylink_config.mac_capabilities |= MAC_2500FD;
+	} else if (priv->plat->has_xgmac) {
+		if (!max_speed || max_speed >= 2500)
+			priv->phylink_config.mac_capabilities |= MAC_2500FD;
+		if (!max_speed || max_speed >= 5000)
+			priv->phylink_config.mac_capabilities |= MAC_5000FD;
+		if (!max_speed || max_speed >= 10000)
+			priv->phylink_config.mac_capabilities |= MAC_10000FD;
+		if (!max_speed || max_speed >= 25000)
+			priv->phylink_config.mac_capabilities |= MAC_25000FD;
+		if (!max_speed || max_speed >= 40000)
+			priv->phylink_config.mac_capabilities |= MAC_40000FD;
+		if (!max_speed || max_speed >= 50000)
+			priv->phylink_config.mac_capabilities |= MAC_50000FD;
+		if (!max_speed || max_speed >= 100000)
+			priv->phylink_config.mac_capabilities |= MAC_100000FD;
+	}
+
+	/* Half-Duplex can only work with single queue */
+	if (priv->plat->tx_queues_to_use > 1)
+		priv->phylink_config.mac_capabilities &=
+			~(MAC_10HD | MAC_100HD | MAC_1000HD);
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
