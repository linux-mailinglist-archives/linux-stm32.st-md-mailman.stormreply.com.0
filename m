Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E219D9794
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:53:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C359C78023;
	Tue, 26 Nov 2024 12:53:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 781DCC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=om8YKPOfUOqLgRGMKjayCyghU8YpyfqYf7cp1coSSXI=; b=YfglRCn4JdJDe8nSXaCwGaj4ij
 DQxl5RtB0LgU6Q6vzul1xyAm8cxbKsLDYtdTVZH0RE4K3WXBTxzkGmoq9zeRPswe1H0LlRge9G6tD
 38p74162xWdUjZsaJ9t/Canzv9FF1u82/UKDSLBxXOMZ3pm3aMX2XBrQ4hIsrTU67XI4tV6lFoRg/
 /fioVRzQv/9SQGHoNJt7wDKJLONio6ffBlo93iyWmKZuwC49zoGNTVjqyj9foly4roCvUHNr6jvyS
 wpPWRDjO3O6J7y8xk816uMepyZtOBrwHulgJ09YKtmKwacS8k1GkFpofJlqXd4YoQhspxgBIQxQnD
 FKUlmd7Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51130 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv40-0006ub-1W;
 Tue, 26 Nov 2024 12:53:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv3z-005yiL-Ab; Tue, 26 Nov 2024 12:53:07 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv3z-005yiL-Ab@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:07 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 11/23] net: phylink: add EEE
	management
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

Add EEE management to phylink, making use of the phylib implementation.
This will only be used where a MAC driver populates the methods and
capabilities bitfield, otherwise we keep our old behaviour.

Phylink will keep track of the EEE configuration, including the clock
stop abilities at each end of the MAC to PHY link, programming the PHY
appropriately and preserving the EEE configuration should the PHY go
away.

It will also call into the MAC driver when LPI needs to be enabled or
disabled, with the expectation that the MAC have LPI disabled during
probe.

Support for phylink managed EEE is enabled by populating both tx_lpi
MAC operations method pointers.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 123 ++++++++++++++++++++++++++++++++++++--
 include/linux/phylink.h   |  44 ++++++++++++++
 2 files changed, 163 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1d68809403de..d8d288b121a8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -79,12 +79,19 @@ struct phylink {
 	unsigned int pcs_state;
 
 	bool link_failed;
+	bool mac_supports_eee;
+	bool phy_enable_tx_lpi;
+	bool mac_enable_tx_lpi;
+	bool mac_tx_clk_stop;
+	u32 mac_tx_lpi_timer;
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
 	DECLARE_PHY_INTERFACE_MASK(sfp_interfaces);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
 	u8 sfp_port;
+
+	struct eee_config eee_cfg;
 };
 
 #define phylink_printk(level, pl, fmt, ...) \
@@ -1375,6 +1382,47 @@ static const char *phylink_pause_to_str(int pause)
 	}
 }
 
+static void phylink_deactivate_lpi(struct phylink *pl)
+{
+	if (pl->mac_enable_tx_lpi) {
+		pl->mac_enable_tx_lpi = false;
+
+		phylink_dbg(pl, "disabling LPI\n");
+
+		pl->mac_ops->mac_disable_tx_lpi(pl->config);
+	}
+}
+
+static void phylink_activate_lpi(struct phylink *pl)
+{
+	if (!test_bit(pl->cur_interface, pl->config->lpi_interfaces)) {
+		phylink_dbg(pl, "MAC does not support LPI with %s\n",
+			    phy_modes(pl->cur_interface));
+		return;
+	}
+
+	phylink_dbg(pl, "LPI timer %uus, tx clock stop %u\n",
+		    pl->mac_tx_lpi_timer, pl->mac_tx_clk_stop);
+
+	pl->mac_ops->mac_enable_tx_lpi(pl->config, pl->mac_tx_lpi_timer,
+				       pl->mac_tx_clk_stop);
+
+	pl->mac_enable_tx_lpi = true;
+}
+
+static void phylink_phy_restrict_eee(struct phylink *pl, struct phy_device *phy)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(eee_supported);
+
+	/* Convert the MAC's LPI capabilities to linkmodes */
+	linkmode_zero(eee_supported);
+	phylink_caps_to_linkmodes(eee_supported, pl->config->lpi_capabilities);
+
+	/* Mask out EEE modes that are not supported */
+	linkmode_and(phy->supported_eee, phy->supported_eee, eee_supported);
+	linkmode_and(phy->advertising_eee, phy->advertising_eee, eee_supported);
+}
+
 static void phylink_link_up(struct phylink *pl,
 			    struct phylink_link_state link_state)
 {
@@ -1421,6 +1469,9 @@ static void phylink_link_up(struct phylink *pl,
 				 pl->cur_interface, speed, duplex,
 				 !!(link_state.pause & MLO_PAUSE_TX), rx_pause);
 
+	if (pl->mac_supports_eee && pl->phy_enable_tx_lpi)
+		phylink_activate_lpi(pl);
+
 	if (ndev)
 		netif_carrier_on(ndev);
 
@@ -1437,6 +1488,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	if (ndev)
 		netif_carrier_off(ndev);
+
+	phylink_deactivate_lpi(pl);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->cur_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
@@ -1700,6 +1754,14 @@ struct phylink *phylink_create(struct phylink_config *config,
 		return ERR_PTR(-EINVAL);
 	}
 
+	pl->mac_supports_eee = mac_ops->mac_disable_tx_lpi &&
+			       mac_ops->mac_enable_tx_lpi;
+
+	/* Set the default EEE configuration */
+	pl->eee_cfg.eee_enabled = pl->config->eee_enabled_default;
+	pl->eee_cfg.tx_lpi_enabled = pl->eee_cfg.eee_enabled;
+	pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;
+
 	pl->phy_state.interface = iface;
 	pl->link_interface = iface;
 	if (iface == PHY_INTERFACE_MODE_MOCA)
@@ -1804,16 +1866,22 @@ static void phylink_phy_change(struct phy_device *phydev, bool up)
 	pl->phy_state.link = up;
 	if (!up)
 		pl->link_failed = true;
+
+	/* Get the LPI state from phylib */
+	pl->phy_enable_tx_lpi = phydev->enable_tx_lpi;
+	pl->mac_tx_lpi_timer = phydev->eee_cfg.tx_lpi_timer;
 	mutex_unlock(&pl->state_mutex);
 
 	phylink_run_resolve(pl);
 
-	phylink_dbg(pl, "phy link %s %s/%s/%s/%s/%s\n", up ? "up" : "down",
+	phylink_dbg(pl, "phy link %s %s/%s/%s/%s/%s/%slpi\n",
+		    up ? "up" : "down",
 		    phy_modes(phydev->interface),
 		    phy_speed_to_str(phydev->speed),
 		    phy_duplex_to_str(phydev->duplex),
 		    phy_rate_matching_to_str(phydev->rate_matching),
-		    phylink_pause_to_str(pl->phy_state.pause));
+		    phylink_pause_to_str(pl->phy_state.pause),
+		    phydev->enable_tx_lpi ? "" : "no");
 }
 
 static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
@@ -1943,6 +2011,28 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 
 	/* Restrict the phy advertisement according to the MAC support. */
 	linkmode_copy(phy->advertising, config.advertising);
+
+	/* If the MAC supports phylink managed EEE, restrict the EEE
+	 * advertisement according to the MAC's LPI capabilities.
+	 */
+	if (pl->mac_supports_eee) {
+		phy->eee_cfg.eee_enabled = pl->eee_cfg.eee_enabled;
+
+		/* If EEE is enabled, then we need to call phy_support_eee()
+		 * to ensure that the advertising mask is appropriately set.
+		 */
+		if (pl->eee_cfg.eee_enabled)
+			phy_support_eee(phy);
+
+		phy->eee_cfg.tx_lpi_enabled = pl->eee_cfg.tx_lpi_enabled;
+		phy->eee_cfg.tx_lpi_timer = pl->eee_cfg.tx_lpi_timer;
+
+		/* Restrict the PHYs EEE support/advertisement to the modes
+		 * that the MAC supports.
+		 */
+		phylink_phy_restrict_eee(pl, phy);
+	}
+
 	mutex_unlock(&pl->state_mutex);
 	mutex_unlock(&phy->lock);
 
@@ -1958,7 +2048,13 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	if (pl->config->mac_managed_pm)
 		phy->mac_managed_pm = true;
 
-	return 0;
+	/* Allow the MAC to stop its clock if the PHY has the capability */
+	pl->mac_tx_clk_stop = phy_eee_tx_clock_stop_capable(phy) > 0;
+
+	/* Explicitly configure whether the PHY is allowed to stop it's
+	 * receive clock.
+	 */
+	return phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
 }
 
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
@@ -2115,6 +2211,8 @@ void phylink_disconnect_phy(struct phylink *pl)
 		mutex_lock(&phy->lock);
 		mutex_lock(&pl->state_mutex);
 		pl->phydev = NULL;
+		pl->phy_enable_tx_lpi = false;
+		pl->mac_tx_clk_stop = false;
 		mutex_unlock(&pl->state_mutex);
 		mutex_unlock(&phy->lock);
 		flush_work(&pl->resolve);
@@ -2856,12 +2954,29 @@ EXPORT_SYMBOL_GPL(phylink_ethtool_get_eee);
  */
 int phylink_ethtool_set_eee(struct phylink *pl, struct ethtool_keee *eee)
 {
+	bool mac_eee = pl->mac_supports_eee;
 	int ret = -EOPNOTSUPP;
 
 	ASSERT_RTNL();
 
-	if (pl->phydev)
+	phylink_dbg(pl, "mac %s phylink EEE%s, adv %*pbl, LPI%s timer %uus\n",
+		    mac_eee ? "supports" : "does not support",
+		    eee->eee_enabled ? ", enabled" : "",
+		    __ETHTOOL_LINK_MODE_MASK_NBITS, eee->advertised,
+		    eee->tx_lpi_enabled ? " enabled" : "", eee->tx_lpi_timer);
+
+	/* Clamp the LPI timer maximum value */
+	if (mac_eee && eee->tx_lpi_timer > pl->config->lpi_timer_limit_us) {
+		eee->tx_lpi_timer = pl->config->lpi_timer_limit_us;
+		phylink_dbg(pl, "LPI timer limited to %uus\n",
+			    eee->tx_lpi_timer);
+	}
+
+	if (pl->phydev) {
 		ret = phy_ethtool_set_eee(pl->phydev, eee);
+		if (ret == 0)
+			eee_to_eeecfg(&pl->eee_cfg, eee);
+	}
 
 	return ret;
 }
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 5c01048860c4..df469fdda040 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -5,6 +5,8 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
+#include <net/eee.h>
+
 struct device_node;
 struct ethtool_cmd;
 struct fwnode_handle;
@@ -143,11 +145,17 @@ enum phylink_op_type {
  *                    possible and avoid stopping it during suspend events.
  * @default_an_inband: if true, defaults to MLO_AN_INBAND rather than
  *		       MLO_AN_PHY. A fixed-link specification will override.
+ * @eee_rx_clk_stop_enable: if true, PHY can stop the receive clock during LPI
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
  * @supported_interfaces: bitmap describing which PHY_INTERFACE_MODE_xxx
  *                        are supported by the MAC/PCS.
+ * @lpi_interfaces: bitmap describing which PHY interface modes can support
+ *		    LPI signalling.
  * @mac_capabilities: MAC pause/speed/duplex capabilities.
+ * @lpi_capabilities: MAC speeds which can support LPI signalling
+ * @eee: default EEE configuration.
+ * @lpi_timer_limit_us: Maximum (inclusive) value of the EEE LPI timer.
  */
 struct phylink_config {
 	struct device *dev;
@@ -156,10 +164,16 @@ struct phylink_config {
 	bool mac_managed_pm;
 	bool mac_requires_rxc;
 	bool default_an_inband;
+	bool eee_rx_clk_stop_enable;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+	DECLARE_PHY_INTERFACE_MASK(lpi_interfaces);
 	unsigned long mac_capabilities;
+	unsigned long lpi_capabilities;
+	u32 lpi_timer_limit_us;
+	u32 lpi_timer_default;
+	bool eee_enabled_default;
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
@@ -173,6 +187,8 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
  * @mac_finish: finish a major reconfiguration of the interface.
  * @mac_link_down: take the link down.
  * @mac_link_up: allow the link to come up.
+ * @mac_disable_tx_lpi: disable LPI.
+ * @mac_enable_tx_lpi: enable and configure LPI.
  *
  * The individual methods are described more fully below.
  */
@@ -193,6 +209,9 @@ struct phylink_mac_ops {
 			    struct phy_device *phy, unsigned int mode,
 			    phy_interface_t interface, int speed, int duplex,
 			    bool tx_pause, bool rx_pause);
+	void (*mac_disable_tx_lpi)(struct phylink_config *config);
+	void (*mac_enable_tx_lpi)(struct phylink_config *config, u32 timer,
+				  bool tx_clk_stop);
 };
 
 #if 0 /* For kernel-doc purposes only. */
@@ -387,6 +406,31 @@ void mac_link_down(struct phylink_config *config, unsigned int mode,
 void mac_link_up(struct phylink_config *config, struct phy_device *phy,
 		 unsigned int mode, phy_interface_t interface,
 		 int speed, int duplex, bool tx_pause, bool rx_pause);
+
+/**
+ * mac_disable_tx_lpi() - disable LPI generation at the MAC
+ * @config: a pointer to a &struct phylink_config.
+ *
+ * Disable generation of LPI at the MAC, effectively preventing the MAC
+ * from indicating that it is idle.
+ */
+void mac_disable_tx_lpi(struct phylink_config *config);
+
+/**
+ * mac_enable_tx_lpi() - configure and enable LPI generation at the MAC
+ * @config: a pointer to a &struct phylink_config.
+ * @timer: LPI timeout in microseconds.
+ * @tx_clk_stop: allow xMII transmit clock to be stopped during LPI
+ *
+ * Configure the LPI timeout accordingly. This will only be called when
+ * the link is already up, to cater for situations where the hardware
+ * needs to be programmed according to the link speed.
+ *
+ * Enable LPI generation at the MAC, and configure whether the xMII transmit
+ * clock may be stopped.
+ */
+void mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+		       bool tx_clk_stop);
 #endif
 
 struct phylink_pcs_ops;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
