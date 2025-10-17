Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74295BE8837
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 14:05:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B3B9C59788;
	Fri, 17 Oct 2025 12:05:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE425C58D7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d9jTQDhQk2sq6/ywD14bfuMdfO3PeHPuFANrREskUsM=; b=rGsKDn/J8XCdAhFdKXzOnyTu49
 PbTmExTfUSW5iyozaQ6Nnp6sX5vPln/Zv0DPMFEi/bos2sg4TljN4ohs0wilF1uwmfjjGlDkqSvEB
 0jUqfa9J5NFIgFUUgDbCJrwmntKPK/CYidSZpTWwAcpPxIHbYCf4TOOCCb6gUSkQloJGxWa8ObSoq
 kw3xhDAMd7bUYSfOcOOMKsxWe4uBMxnGFEWJUzFjgz+3istvRQm8AU8q49V/vRvq8kMqi6HBCm4Hu
 Ko1XOSsfsgeM5BVCriD+mJ4vtWj3iCazaR44MHGuBwiGlYixyLv09v8/vP1zo2TmE6G5lSFN/SbXx
 iSanOQyA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43530 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v9jCg-000000007qf-1rCD;
 Fri, 17 Oct 2025 13:05:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v9jCe-0000000B2QO-3PuJ; Fri, 17 Oct 2025 13:05:00 +0100
In-Reply-To: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v9jCe-0000000B2QO-3PuJ@rmk-PC.armlinux.org.uk>
Date: Fri, 17 Oct 2025 13:05:00 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: convert to
 phylink-managed Wake-on-Lan
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

Convert stmmac to use phylink-managed Wake-on-Lan support. To achieve
this, we implement the .mac_wol_set() method, which simply configures
the driver model's struct device wakeup for stmmac, and sets the
priv->wolopts appropriately.

When STMMAC_FLAG_USE_PHY_WOL is set, in the stmmac world this means to
only use the PHY's WoL support and ignore the MAC's WoL capabilities.
To preserve this behaviour, we enable phylink's legacy mode, and avoid
telling phylink that the MAC has any WoL support. This achieves the
same functionality for this case.

When STMMAC_FLAG_USE_PHY_WOL is not set, we provide the MAC's WoL
capabilities to phylink, which then allows phylink to choose between
the PHY and MAC for WoL depending on their individual capabilities
as described in the phylink commit. This only augments the WoL
functionality with PHYs that declare to the driver model that they are
wake-up capable. Currently, very few PHY drivers support this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  6 +---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 34 ++++---------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++++++++--
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  4 +--
 4 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index ec8bddc1c37f..f5628a6af7d3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -287,6 +287,7 @@ struct stmmac_priv {
 	int hw_cap_support;
 	int synopsys_id;
 	u32 msg_enable;
+	/* Our MAC Wake-on-Lan options */
 	int wolopts;
 	int wol_irq;
 	u32 gmii_address_bus_config;
@@ -375,11 +376,6 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
-static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
-{
-	return priv->plat->pmt && device_may_wakeup(priv->device);
-}
-
 static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
 {
 	return !priv->plat->pmt && device_may_wakeup(priv->device);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 39fa1ec92f82..fd29b551a082 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -787,41 +787,19 @@ static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!priv->plat->pmt)
-		return phylink_ethtool_get_wol(priv->phylink, wol);
-
-	mutex_lock(&priv->lock);
-	if (device_can_wakeup(priv->device)) {
-		wol->supported = WAKE_MAGIC | WAKE_UCAST;
-		if (priv->hw_cap_support && !priv->dma_cap.pmt_magic_frame)
-			wol->supported &= ~WAKE_MAGIC;
-		wol->wolopts = priv->wolopts;
-	}
-	mutex_unlock(&priv->lock);
+	return phylink_ethtool_get_wol(priv->phylink, wol);
 }
 
 static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	int ret;
 
-	if (!device_can_wakeup(priv->device))
-		return -EOPNOTSUPP;
-
-	if (!priv->plat->pmt) {
-		int ret = phylink_ethtool_set_wol(priv->phylink, wol);
-
-		if (!ret)
-			device_set_wakeup_enable(priv->device, !!wol->wolopts);
-		return ret;
-	}
-
-	device_set_wakeup_enable(priv->device, !!wol->wolopts);
+	ret = phylink_ethtool_set_wol(priv->phylink, wol);
+	if (!ret)
+		device_set_wakeup_enable(priv->device, !!wol->wolopts);
 
-	mutex_lock(&priv->lock);
-	priv->wolopts = wol->wolopts;
-	mutex_unlock(&priv->lock);
-
-	return 0;
+	return ret;
 }
 
 static int stmmac_ethtool_op_get_eee(struct net_device *dev,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c9fa965c8566..a959a4949282 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1065,6 +1065,20 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	return 0;
 }
 
+static int stmmac_mac_wol_set(struct phylink_config *config, u32 wolopts,
+			      const u8 *sopass)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	device_set_wakeup_enable(priv->device, !!wolopts);
+
+	mutex_lock(&priv->lock);
+	priv->wolopts = wolopts;
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
@@ -1074,6 +1088,7 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_link_up = stmmac_mac_link_up,
 	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
 	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
+	.mac_wol_set = stmmac_mac_wol_set,
 };
 
 /**
@@ -1250,6 +1265,15 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 		config->eee_enabled_default = true;
 	}
 
+	if (priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
+		config->wol_phy_legacy = true;
+	} else {
+		if (priv->dma_cap.pmt_remote_wake_up)
+			config->wol_mac_support |= WAKE_UCAST;
+		if (priv->dma_cap.pmt_magic_frame)
+			config->wol_mac_support |= WAKE_MAGIC;
+	}
+
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
@@ -7760,7 +7784,7 @@ int stmmac_suspend(struct device *dev)
 		priv->plat->serdes_powerdown(ndev, priv->plat->bsp_priv);
 
 	/* Enable Power down mode by programming the PMT regs */
-	if (stmmac_wol_enabled_mac(priv)) {
+	if (priv->wolopts) {
 		stmmac_pmt(priv, priv->hw, priv->wolopts);
 		priv->irq_wake = 1;
 	} else {
@@ -7774,7 +7798,7 @@ int stmmac_suspend(struct device *dev)
 	if (stmmac_wol_enabled_phy(priv))
 		phylink_speed_down(priv->phylink, false);
 
-	phylink_suspend(priv->phylink, stmmac_wol_enabled_mac(priv));
+	phylink_suspend(priv->phylink, !!priv->wolopts);
 	rtnl_unlock();
 
 	if (stmmac_fpe_supported(priv))
@@ -7850,7 +7874,7 @@ int stmmac_resume(struct device *dev)
 	 * this bit because it can generate problems while resuming
 	 * from another devices (e.g. serial console).
 	 */
-	if (stmmac_wol_enabled_mac(priv)) {
+	if (priv->wolopts) {
 		mutex_lock(&priv->lock);
 		stmmac_pmt(priv, priv->hw, 0);
 		mutex_unlock(&priv->lock);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 27bcaae07a7f..ed38925eb6f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -970,7 +970,7 @@ static int __maybe_unused stmmac_pltfr_noirq_suspend(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
-	if (!stmmac_wol_enabled_mac(priv)) {
+	if (!priv->wolopts) {
 		/* Disable clock in case of PWM is off */
 		clk_disable_unprepare(priv->plat->clk_ptp_ref);
 
@@ -991,7 +991,7 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
-	if (!stmmac_wol_enabled_mac(priv)) {
+	if (!priv->wolopts) {
 		/* enable the clk previously disabled */
 		ret = pm_runtime_force_resume(dev);
 		if (ret)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
