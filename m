Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1168C377F
	for <lists+linux-stm32@lfdr.de>; Sun, 12 May 2024 18:29:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97B37C62EFE;
	Sun, 12 May 2024 16:29:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6862C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 May 2024 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cCOwKNNiF9akXY6thi6oAVDW0m2KRZV4js3TRJjfKDE=; b=NhciW89kOHoBz9FOUnfM0eZ/yc
 gkGiQt1jh5/BQ2O4beBnLH6bsrWkMi1bmFdAK5LhP9UHZCbod5fzlrSj7JYMJKX7/l4OebE9XmAlo
 rXuVlIyaCKQgz8fgUpbXGI7rczhR0JS6OOwUNKVBgquzaviuz7zN5ZqgyKgkixXQeNrzXYjfC6elP
 D/U27OvbzSN5sqJTI3ErG6QnouAdSCS0bloYKGccaaI27k00MacYGCw783YPJiwkZp9G0eViRrqiT
 Ur/06W/uqiGVSQBxStcComFEqhgGePmjEFbVbSgf8Ax8aiL0lBdhdPIYvvf/+uqSizthRGEsVCH+k
 vFajVUHw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39810 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1s6C4M-0000tF-1G;
 Sun, 12 May 2024 17:29:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1s6C4O-00Ck6O-9D; Sun, 12 May 2024 17:29:04 +0100
In-Reply-To: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1s6C4O-00Ck6O-9D@rmk-PC.armlinux.org.uk>
Date: Sun, 12 May 2024 17:29:04 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 2/6] net: stmmac: remove
 pcs_ctrl_ane() method and associated code
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

The pcs_ctrl_ane() method is no longer required as this will be handled
by the mac_pcs phylink_pcs instance.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  7 --
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  9 --
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  2 -
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  4 -
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 92 -------------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 34 -------
 7 files changed, 160 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 4ead61886fe5..cf20af8f0bbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -401,12 +401,6 @@ static void dwmac1000_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + LPI_TIMER_CTRL);
 }
 
-static void dwmac1000_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
-			       bool loopback)
-{
-	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
-}
-
 static void dwmac1000_rane(void __iomem *ioaddr, bool restart)
 {
 	dwmac_rane(ioaddr, GMAC_PCS_BASE, restart);
@@ -588,7 +582,6 @@ const struct stmmac_ops dwmac1000_ops = {
 	.set_eee_timer = dwmac1000_set_eee_timer,
 	.set_eee_pls = dwmac1000_set_eee_pls,
 	.debug = dwmac1000_debug,
-	.pcs_ctrl_ane = dwmac1000_ctrl_ane,
 	.pcs_rane = dwmac1000_rane,
 	.pcs_get_adv_lp = dwmac1000_get_adv_lp,
 	.set_mac_loopback = dwmac1000_set_mac_loopback,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 3c1181b1933f..48e5d15cead1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -753,12 +753,6 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 	}
 }
 
-static void dwmac4_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
-			    bool loopback)
-{
-	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
-}
-
 static void dwmac4_rane(void __iomem *ioaddr, bool restart)
 {
 	dwmac_rane(ioaddr, GMAC_PCS_BASE, restart);
@@ -1289,7 +1283,6 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.pcs_rane = dwmac4_rane,
 	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
@@ -1335,7 +1328,6 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.pcs_rane = dwmac4_rane,
 	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
@@ -1385,7 +1377,6 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
-	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.pcs_rane = dwmac4_rane,
 	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index f8e7775bb633..bb82eaa2e099 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1554,7 +1554,6 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
-	.pcs_ctrl_ane = NULL,
 	.pcs_rane = NULL,
 	.pcs_get_adv_lp = NULL,
 	.debug = NULL,
@@ -1614,7 +1613,6 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
-	.pcs_ctrl_ane = NULL,
 	.pcs_rane = NULL,
 	.pcs_get_adv_lp = NULL,
 	.debug = NULL,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e106f57b8b66..ecc957fa16cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -376,8 +376,6 @@ struct stmmac_ops {
 		      struct stmmac_extra_stats *x, u32 rx_queues,
 		      u32 tx_queues);
 	/* PCS calls */
-	void (*pcs_ctrl_ane)(void __iomem *ioaddr, bool ane, bool srgmi_ral,
-			     bool loopback);
 	void (*pcs_rane)(void __iomem *ioaddr, bool restart);
 	void (*pcs_get_adv_lp)(void __iomem *ioaddr, struct rgmii_adv *adv);
 	/* Safety Features */
@@ -494,8 +492,6 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, set_eee_pls, __args)
 #define stmmac_mac_debug(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
-#define stmmac_pcs_ctrl_ane(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __args)
 #define stmmac_pcs_rane(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, pcs_rane, __priv, __args)
 #define stmmac_pcs_get_adv_lp(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 542e2633a6f5..2aaffa07977e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -321,84 +321,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
-	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
-		struct rgmii_adv adv;
-		u32 supported, advertising, lp_advertising;
-
-		if (!priv->xstats.pcs_link) {
-			cmd->base.speed = SPEED_UNKNOWN;
-			cmd->base.duplex = DUPLEX_UNKNOWN;
-			return 0;
-		}
-		cmd->base.duplex = priv->xstats.pcs_duplex;
-
-		cmd->base.speed = priv->xstats.pcs_speed;
-
-		/* Get and convert ADV/LP_ADV from the HW AN registers */
-		if (stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv))
-			return -EOPNOTSUPP;	/* should never happen indeed */
-
-		/* Encoding of PSE bits is defined in 802.3z, 37.2.1.4 */
-
-		ethtool_convert_link_mode_to_legacy_u32(
-			&supported, cmd->link_modes.supported);
-		ethtool_convert_link_mode_to_legacy_u32(
-			&advertising, cmd->link_modes.advertising);
-		ethtool_convert_link_mode_to_legacy_u32(
-			&lp_advertising, cmd->link_modes.lp_advertising);
-
-		if (adv.pause & STMMAC_PCS_PAUSE)
-			advertising |= ADVERTISED_Pause;
-		if (adv.pause & STMMAC_PCS_ASYM_PAUSE)
-			advertising |= ADVERTISED_Asym_Pause;
-		if (adv.lp_pause & STMMAC_PCS_PAUSE)
-			lp_advertising |= ADVERTISED_Pause;
-		if (adv.lp_pause & STMMAC_PCS_ASYM_PAUSE)
-			lp_advertising |= ADVERTISED_Asym_Pause;
-
-		/* Reg49[3] always set because ANE is always supported */
-		cmd->base.autoneg = ADVERTISED_Autoneg;
-		supported |= SUPPORTED_Autoneg;
-		advertising |= ADVERTISED_Autoneg;
-		lp_advertising |= ADVERTISED_Autoneg;
-
-		if (adv.duplex) {
-			supported |= (SUPPORTED_1000baseT_Full |
-				      SUPPORTED_100baseT_Full |
-				      SUPPORTED_10baseT_Full);
-			advertising |= (ADVERTISED_1000baseT_Full |
-					ADVERTISED_100baseT_Full |
-					ADVERTISED_10baseT_Full);
-		} else {
-			supported |= (SUPPORTED_1000baseT_Half |
-				      SUPPORTED_100baseT_Half |
-				      SUPPORTED_10baseT_Half);
-			advertising |= (ADVERTISED_1000baseT_Half |
-					ADVERTISED_100baseT_Half |
-					ADVERTISED_10baseT_Half);
-		}
-		if (adv.lp_duplex)
-			lp_advertising |= (ADVERTISED_1000baseT_Full |
-					   ADVERTISED_100baseT_Full |
-					   ADVERTISED_10baseT_Full);
-		else
-			lp_advertising |= (ADVERTISED_1000baseT_Half |
-					   ADVERTISED_100baseT_Half |
-					   ADVERTISED_10baseT_Half);
-		cmd->base.port = PORT_OTHER;
-
-		ethtool_convert_legacy_u32_to_link_mode(
-			cmd->link_modes.supported, supported);
-		ethtool_convert_legacy_u32_to_link_mode(
-			cmd->link_modes.advertising, advertising);
-		ethtool_convert_legacy_u32_to_link_mode(
-			cmd->link_modes.lp_advertising, lp_advertising);
-
-		return 0;
-	}
-
 	return phylink_ethtool_ksettings_get(priv->phylink, cmd);
 }
 
@@ -408,20 +330,6 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
-	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
-		/* Only support ANE */
-		if (cmd->base.autoneg != AUTONEG_ENABLE)
-			return -EINVAL;
-
-		mutex_lock(&priv->lock);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
-		mutex_unlock(&priv->lock);
-
-		return 0;
-	}
-
 	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 79364b60ac6b..cb0e5bd5ed05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3496,9 +3496,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		}
 	}
 
-	if (priv->hw->pcs)
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
-
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
 
@@ -6068,15 +6065,6 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		for (queue = 0; queue < queues_count; queue++)
 			stmmac_host_mtl_irq_status(priv, priv->hw, queue);
 
-		/* PCS link status */
-		if (priv->hw->pcs &&
-		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
-			if (priv->xstats.pcs_link)
-				netif_carrier_on(priv->dev);
-			else
-				netif_carrier_off(priv->dev);
-		}
-
 		stmmac_timestamp_interrupt(priv, priv);
 	}
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index c3ff12a6859b..c0821ed4e9b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -91,40 +91,6 @@ static inline void dwmac_rane(void __iomem *ioaddr, u32 reg, bool restart)
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
 }
 
-/**
- * dwmac_ctrl_ane - To program the AN Control Register.
- * @ioaddr: IO registers pointer
- * @reg: Base address of the AN Control Register.
- * @ane: to enable the auto-negotiation
- * @srgmi_ral: to manage MAC-2-MAC SGMII connections.
- * @loopback: to cause the PHY to loopback tx data into rx path.
- * Description: this is the main function to configure the AN control register
- * and init the ANE, select loopback (usually for debugging purpose) and
- * configure SGMII RAL.
- */
-static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
-				  bool srgmi_ral, bool loopback)
-{
-	u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
-
-	/* Enable and restart the Auto-Negotiation */
-	if (ane)
-		value |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
-	else
-		value &= ~GMAC_AN_CTRL_ANE;
-
-	/* In case of MAC-2-MAC connection, block is configured to operate
-	 * according to MAC conf register.
-	 */
-	if (srgmi_ral)
-		value |= GMAC_AN_CTRL_SGMRAL;
-
-	if (loopback)
-		value |= GMAC_AN_CTRL_ELE;
-
-	writel(value, ioaddr + GMAC_AN_CTRL(reg));
-}
-
 /**
  * dwmac_get_adv_lp - Get ADV and LP cap
  * @ioaddr: IO registers pointer
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
