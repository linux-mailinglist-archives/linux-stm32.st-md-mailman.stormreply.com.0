Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571C8D60AA
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 13:27:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4108FC7128F;
	Fri, 31 May 2024 11:27:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B173C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJqln5CuneS2TvD1H9y/Tz8bk9KxHi2kkk+NrB7yFlU=; b=UAGagerFYK9Dr2Z2gvazyIG2XD
 jRMd9D0LVd0sTZrFi/ag5R5RDtjqPXfj5u6q6aIorRYDdo9DmKZVEaLng9yWMeCRU3T9SNtWjTLKf
 LTwHkot2z0Bd+4RYlVeI4+8Gg+t3GgxgNEcrUZhSjFhJL3G8I7okK7D5kh3H/laZTCKjfI2Y97qfG
 uKABc6+a0hemA6yrr/iAGztwUqjJdxQAeSsNGhz78wJCkgN96uqIxrNgvQe7Tj6j30Ngpz2f8rWUw
 W7U4JFzaJGnoH4PX7pk7w7iQ1zICgsoOxaSqAQSbb6DD+JqInAv0CYYeglyI88jcKQVK5KcvBJj6m
 8FzRO7GA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34898 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sD0PE-0008Su-1e;
 Fri, 31 May 2024 12:26:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sD0PF-00EzCJ-UL; Fri, 31 May 2024 12:26:45 +0100
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sD0PF-00EzCJ-UL@rmk-PC.armlinux.org.uk>
Date: Fri, 31 May 2024 12:26:45 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC net-next v2 7/8] net: stmmac: remove
 obsolete pcs methods and associated code
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

The pcs_ctrl_ane() and pcs_get_adv_lp(0 methods are no longer required
as this will be handled by the mac_pcs phylink_pcs instance. Remove
these methods, their common implementation, the pcs_link, pcs_duplex and
pcs_speed members of struct stmmac_extra_stats, and
stmmac_has_mac_phylink_select_pcs().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |   3 -
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   6 -
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 115 +-----------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 --
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  30 -----
 5 files changed, 2 insertions(+), 165 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 940e83fa1202..a66b836996d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -191,9 +191,6 @@ struct stmmac_extra_stats {
 	unsigned long irq_pcs_ane_n;
 	unsigned long irq_pcs_link_n;
 	unsigned long irq_rgmii_n;
-	unsigned long pcs_link;
-	unsigned long pcs_duplex;
-	unsigned long pcs_speed;
 	/* debug register */
 	unsigned long mtl_tx_status_fifo_full;
 	unsigned long mtl_tx_fifo_not_empty;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index aa5f6e40cb53..8a17e7d6e37d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -378,7 +378,6 @@ struct stmmac_ops {
 	/* PCS calls */
 	void (*pcs_ctrl_ane)(void __iomem *ioaddr, bool ane, bool srgmi_ral,
 			     bool loopback);
-	void (*pcs_get_adv_lp)(void __iomem *ioaddr, struct rgmii_adv *adv);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
 				  struct stmmac_safety_feature_cfg *safety_cfg);
@@ -495,8 +494,6 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
 #define stmmac_pcs_ctrl_ane(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __args)
-#define stmmac_pcs_get_adv_lp(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, pcs_get_adv_lp, __args)
 #define stmmac_safety_feat_config(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, safety_feat_config, __args)
 #define stmmac_safety_feat_irq_status(__priv, __args...) \
@@ -542,9 +539,6 @@ struct stmmac_ops {
 #define stmmac_fpe_irq_status(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, fpe_irq_status, __args)
 
-#define stmmac_has_mac_phylink_select_pcs(__priv) \
-	((__priv)->hw->mac->phylink_select_pcs != NULL)
-
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
 	void (*config_hw_tstamping) (void __iomem *ioaddr, u32 data);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 7c6530d63ade..db439d00f692 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -321,85 +321,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
-	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII) &&
-	    !stmmac_has_mac_phylink_select_pcs(priv)) {
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
 
@@ -409,21 +330,6 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
-	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII) &&
-	    !stmmac_has_mac_phylink_select_pcs(priv)) {
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
 
@@ -523,16 +429,8 @@ stmmac_get_pauseparam(struct net_device *netdev,
 		      struct ethtool_pauseparam *pause)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
-	struct rgmii_adv adv_lp;
 
-	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv) &&
-	    !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
-		pause->autoneg = 1;
-		if (!adv_lp.pause)
-			return;
-	} else {
-		phylink_ethtool_get_pauseparam(priv->phylink, pause);
-	}
+	phylink_ethtool_get_pauseparam(priv->phylink, pause);
 }
 
 static int
@@ -540,17 +438,8 @@ stmmac_set_pauseparam(struct net_device *netdev,
 		      struct ethtool_pauseparam *pause)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
-	struct rgmii_adv adv_lp;
 
-	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv) &&
-	   !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
-		pause->autoneg = 1;
-		if (!adv_lp.pause)
-			return -EOPNOTSUPP;
-		return 0;
-	} else {
-		return phylink_ethtool_set_pauseparam(priv->phylink, pause);
-	}
+	return phylink_ethtool_set_pauseparam(priv->phylink, pause);
 }
 
 static u64 stmmac_get_rx_normal_irq_n(struct stmmac_priv *priv, int q)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56c351e11952..ad19ba42c412 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3485,9 +3485,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		}
 	}
 
-	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv))
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
-
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
 
@@ -6053,16 +6050,6 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		for (queue = 0; queue < queues_count; queue++)
 			stmmac_host_mtl_irq_status(priv, priv->hw, queue);
 
-		/* PCS link status */
-		if (priv->hw->pcs &&
-		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
-		    !stmmac_has_mac_phylink_select_pcs(priv)) {
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
index 888485fa2761..27ea7f4d789d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -108,36 +108,6 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
 }
 
-/**
- * dwmac_get_adv_lp - Get ADV and LP cap
- * @ioaddr: IO registers pointer
- * @reg: Base address of the AN Control Register.
- * @adv_lp: structure to store the adv,lp status
- * Description: this is to expose the ANE advertisement and Link partner ability
- * status to ethtool support.
- */
-static inline void dwmac_get_adv_lp(void __iomem *ioaddr, u32 reg,
-				    struct rgmii_adv *adv_lp)
-{
-	u32 value = readl(ioaddr + GMAC_ANE_ADV(reg));
-
-	if (value & GMAC_ANE_FD)
-		adv_lp->duplex = DUPLEX_FULL;
-	if (value & GMAC_ANE_HD)
-		adv_lp->duplex |= DUPLEX_HALF;
-
-	adv_lp->pause = (value & GMAC_ANE_PSE) >> GMAC_ANE_PSE_SHIFT;
-
-	value = readl(ioaddr + GMAC_ANE_LPA(reg));
-
-	if (value & GMAC_ANE_FD)
-		adv_lp->lp_duplex = DUPLEX_FULL;
-	if (value & GMAC_ANE_HD)
-		adv_lp->lp_duplex = DUPLEX_HALF;
-
-	adv_lp->lp_pause = (value & GMAC_ANE_PSE) >> GMAC_ANE_PSE_SHIFT;
-}
-
 int dwmac_pcs_config(struct mac_device_info *hw, unsigned int neg_mode,
 		     phy_interface_t interface,
 		     const unsigned long *advertising,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
