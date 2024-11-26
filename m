Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABBA9D979C
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:53:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4135CC78023;
	Tue, 26 Nov 2024 12:53:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 166F3C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLFwFQfkV/Q/tnq9Gw5ZVDWmfdZj3gbeL6lxdqVEHq4=; b=bjDlUVSJbKJNPwJCiz1FvwypK0
 oGFNUgK0VdCWzNRsxYphPnVGPlMKF6a2NSg/7T2p4EZEiSwMAthOcrFfWW3+WkbxeB4CaFNepe5LI
 XR/Uae4BBAge8uYvAzqc5V0JnXXkwqo6N6D+KUZBb6yGNUh6mg2znXFQDMaW5sSARtVc1ODnFSPWc
 HY+Ish5Uvky2ZP2LsRO8xfjKlQZuKYTr/HorapgectnVzvoPrxb+BwYl5jI6PQhHEy/jODjfpGZ0R
 RQZI5vfZ7Tz0Dv6P7ElsXmNJXn+HxDvcNXLGClJIxaLHbFOqMEZHJZzdL3IQzz5CZiFGl6YSo9g9B
 JItSfVJA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47332 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv4G-0006vi-1F;
 Tue, 26 Nov 2024 12:53:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv4E-005yif-LM; Tue, 26 Nov 2024 12:53:22 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv4E-005yif-LM@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:22 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 14/23] net: mvpp2: add EEE
	implementation
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

Add EEE support for mvpp2, using phylink's EEE implementation, which
means we just need to implement the two methods for LPI control, and
with the initial configuration. Only SGMII mode is supported, so only
100M and 1G speeds.

Disabling LPI requires clearing a single bit. Enabling LPI needs a full
configuration of several values, as the timer values are dependent on
the MAC operating speed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  5 ++
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 88 +++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
index 9e02e4367bec..364d038da7ea 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
@@ -481,6 +481,11 @@
 #define MVPP22_GMAC_INT_SUM_MASK		0xa4
 #define     MVPP22_GMAC_INT_SUM_MASK_LINK_STAT	BIT(1)
 #define	    MVPP22_GMAC_INT_SUM_MASK_PTP	BIT(2)
+#define MVPP2_GMAC_LPI_CTRL0			0xc0
+#define     MVPP2_GMAC_LPI_CTRL0_TS_MASK	GENMASK(8, 8)
+#define MVPP2_GMAC_LPI_CTRL1			0xc4
+#define     MVPP2_GMAC_LPI_CTRL1_REQ_EN		BIT(0)
+#define     MVPP2_GMAC_LPI_CTRL1_TW_MASK	GENMASK(15, 4)
 
 /* Per-port XGMAC registers. PPv2.2 and PPv2.3, only for GOP port 0,
  * relative to port->base.
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 571631a30320..d840819abcd4 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -5757,6 +5757,28 @@ static int mvpp2_ethtool_set_rxfh(struct net_device *dev,
 	return mvpp2_modify_rxfh_context(dev, NULL, rxfh, extack);
 }
 
+static int mvpp2_ethtool_get_eee(struct net_device *dev,
+				 struct ethtool_keee *eee)
+{
+	struct mvpp2_port *port = netdev_priv(dev);
+
+	if (!port->phylink)
+		return -EOPNOTSUPP;
+
+	return phylink_ethtool_get_eee(port->phylink, eee);
+}
+
+static int mvpp2_ethtool_set_eee(struct net_device *dev,
+				 struct ethtool_keee *eee)
+{
+	struct mvpp2_port *port = netdev_priv(dev);
+
+	if (!port->phylink)
+		return -EOPNOTSUPP;
+
+	return phylink_ethtool_set_eee(port->phylink, eee);
+}
+
 /* Device ops */
 
 static const struct net_device_ops mvpp2_netdev_ops = {
@@ -5802,6 +5824,8 @@ static const struct ethtool_ops mvpp2_eth_tool_ops = {
 	.create_rxfh_context	= mvpp2_create_rxfh_context,
 	.modify_rxfh_context	= mvpp2_modify_rxfh_context,
 	.remove_rxfh_context	= mvpp2_remove_rxfh_context,
+	.get_eee		= mvpp2_ethtool_get_eee,
+	.set_eee		= mvpp2_ethtool_set_eee,
 };
 
 /* Used for PPv2.1, or PPv2.2 with the old Device Tree binding that
@@ -6665,6 +6689,56 @@ static void mvpp2_mac_link_down(struct phylink_config *config,
 	mvpp2_port_disable(port);
 }
 
+static void mvpp2_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct mvpp2_port *port = mvpp2_phylink_to_port(config);
+
+	mvpp2_modify(port->base + MVPP2_GMAC_LPI_CTRL1,
+		     MVPP2_GMAC_LPI_CTRL1_REQ_EN, 0);
+}
+
+static void mvpp2_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+				    bool tx_clk_stop)
+{
+	struct mvpp2_port *port = mvpp2_phylink_to_port(config);
+	u32 ts, tw, lpi1, status;
+
+	status = readl(port->base + MVPP2_GMAC_STATUS0);
+	if (status & MVPP2_GMAC_STATUS0_GMII_SPEED) {
+		/* At 1G speeds, the timer resolution are 1us, and
+		 * 802.3 says tw is 16.5us. Round up to 17us.
+		 */
+		tw = 17;
+		ts = timer;
+	} else {
+		/* At 100M speeds, the timer resolutions are 10us, and
+		 * 802.3 says tw is 30us.
+		 */
+		tw = 3;
+		ts = DIV_ROUND_UP(timer, 10);
+	}
+
+	if (ts > 255)
+		ts = 255;
+
+	/* Ensure LPI generation is disabled */
+	lpi1 = readl(port->base + MVPP2_GMAC_LPI_CTRL1);
+	writel(lpi1 & ~MVPP2_GMAC_LPI_CTRL1_REQ_EN,
+	       port->base + MVPP2_GMAC_LPI_CTRL1);
+
+	/* Configure ts */
+	mvpp2_modify(port->base + MVPP2_GMAC_LPI_CTRL0,
+		     MVPP2_GMAC_LPI_CTRL0_TS_MASK,
+		     FIELD_PREP(MVPP2_GMAC_LPI_CTRL0_TS_MASK, ts));
+
+	/* Configure tw */
+	lpi1 = u32_replace_bits(lpi1, MVPP2_GMAC_LPI_CTRL1_TW_MASK, tw);
+
+	/* Enable LPI generation */
+	writel(lpi1 | MVPP2_GMAC_LPI_CTRL1_REQ_EN,
+	       port->base + MVPP2_GMAC_LPI_CTRL1);
+}
+
 static const struct phylink_mac_ops mvpp2_phylink_ops = {
 	.mac_select_pcs = mvpp2_select_pcs,
 	.mac_prepare = mvpp2_mac_prepare,
@@ -6672,6 +6746,8 @@ static const struct phylink_mac_ops mvpp2_phylink_ops = {
 	.mac_finish = mvpp2_mac_finish,
 	.mac_link_up = mvpp2_mac_link_up,
 	.mac_link_down = mvpp2_mac_link_down,
+	.mac_enable_tx_lpi = mvpp2_mac_enable_tx_lpi,
+	.mac_disable_tx_lpi = mvpp2_mac_disable_tx_lpi,
 };
 
 /* Work-around for ACPI */
@@ -6950,6 +7026,16 @@ static int mvpp2_port_probe(struct platform_device *pdev,
 		port->phylink_config.mac_capabilities =
 			MAC_2500FD | MAC_1000FD | MAC_100 | MAC_10;
 
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  port->phylink_config.lpi_interfaces);
+
+		port->phylink_config.lpi_capabilities = MAC_1000FD | MAC_100FD;
+
+		/* Setup EEE.  Choose 250us idle. */
+		port->phylink_config.lpi_timer_limit_us = 255;
+		port->phylink_config.lpi_timer_default = 250;
+		port->phylink_config.eee_enabled_default = true;
+
 		if (port->priv->global_tx_fc)
 			port->phylink_config.mac_capabilities |=
 				MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
@@ -7024,6 +7110,8 @@ static int mvpp2_port_probe(struct platform_device *pdev,
 			goto err_free_port_pcpu;
 		}
 		port->phylink = phylink;
+
+		mvpp2_mac_disable_tx_lpi(&port->phylink_config);
 	} else {
 		dev_warn(&pdev->dev, "Use link irqs for port#%d. FW update required\n", port->id);
 		port->phylink = NULL;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
