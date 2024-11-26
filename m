Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD179D979F
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:53:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55809C78023;
	Tue, 26 Nov 2024 12:53:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6877C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=86MjfvWnJQi9fO+/XaHjcVwzFGECVkyvIJk5JlTA9Ng=; b=Tq9xLNz5Iv73eyLH2Ytn/cIzsx
 YfvGjrxg9xdpmuM0WM+BtmX8GB6VU5q1VYm+l30Yt6TJ7GbFt3NTyge0H86nPjPbMU071gNRbRCKY
 JmsTplmSzYHslrlvVVUh7asrgkb+CN9uw5GgmLLddEArELQkaS+nEtQNdRp+GGeOKqrwhDf+J09RP
 j+t1Xz0VM/4HzxYv/+MKSLU4FPT7y4XOVmMFu1Wy+az3FSj7Hm+U3th8JHFakaZc0GjWMGUpmhfd/
 3yKACXvmWQ7afsC0MnQl0wcv7XW40cbAO7707kfKmvRGr6j0xZYmnnGjdluNteFQPq3b1AWEyqzUL
 Bt9XTzvA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40382 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv4Q-0006wS-12;
 Tue, 26 Nov 2024 12:53:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv4O-005yiw-St; Tue, 26 Nov 2024 12:53:32 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv4O-005yiw-St@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:32 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 16/23] net: lan743x: convert to
 phylink managed EEE
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

Convert lan743x to phylink managed EEE:
- Set the lpi_capabilties.
- Move the call to lan743x_mac_eee_enable() into the enable/disable
  tx_lpi functions.
- Ensure that EEEEN is clear during probe.
- Move the setting of the LPI timer into mac_enable_tx_lpi().
- Move reading of LPI timer to phylink initialisation to set the
  default timer value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/microchip/lan743x_ethtool.c  | 21 -----------
 drivers/net/ethernet/microchip/lan743x_main.c | 37 ++++++++++++++++---
 drivers/net/ethernet/microchip/lan743x_main.h |  1 -
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_ethtool.c b/drivers/net/ethernet/microchip/lan743x_ethtool.c
index 1a1cbd034eda..1459acfb1e61 100644
--- a/drivers/net/ethernet/microchip/lan743x_ethtool.c
+++ b/drivers/net/ethernet/microchip/lan743x_ethtool.c
@@ -1055,9 +1055,6 @@ static int lan743x_ethtool_get_eee(struct net_device *netdev,
 {
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
 
-	eee->tx_lpi_timer = lan743x_csr_read(adapter,
-					     MAC_EEE_TX_LPI_REQ_DLY_CNT);
-
 	return phylink_ethtool_get_eee(adapter->phylink, eee);
 }
 
@@ -1065,24 +1062,6 @@ static int lan743x_ethtool_set_eee(struct net_device *netdev,
 				   struct ethtool_keee *eee)
 {
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
-	u32 tx_lpi_timer;
-
-	tx_lpi_timer = lan743x_csr_read(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT);
-	if (tx_lpi_timer != eee->tx_lpi_timer) {
-		u32 mac_cr = lan743x_csr_read(adapter, MAC_CR);
-
-		/* Software should only change this field when Energy Efficient
-		 * Ethernet Enable (EEEEN) is cleared.
-		 * This function will trigger an autonegotiation restart and
-		 * eee will be reenabled during link up if eee was negotiated.
-		 */
-		lan743x_mac_eee_enable(adapter, false);
-		lan743x_csr_write(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT,
-				  eee->tx_lpi_timer);
-
-		if (mac_cr & MAC_CR_EEE_EN_)
-			lan743x_mac_eee_enable(adapter, true);
-	}
 
 	return phylink_ethtool_set_eee(adapter->phylink, eee);
 }
diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 8d7ad021ac70..25d37a2cb4a6 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -2966,7 +2966,7 @@ static int lan743x_phylink_2500basex_config(struct lan743x_adapter *adapter)
 	return lan743x_pcs_power_reset(adapter);
 }
 
-void lan743x_mac_eee_enable(struct lan743x_adapter *adapter, bool enable)
+static void lan743x_mac_eee_enable(struct lan743x_adapter *adapter, bool enable)
 {
 	u32 mac_cr;
 
@@ -3027,10 +3027,8 @@ static void lan743x_phylink_mac_link_down(struct phylink_config *config,
 					  phy_interface_t interface)
 {
 	struct net_device *netdev = to_net_dev(config->dev);
-	struct lan743x_adapter *adapter = netdev_priv(netdev);
 
 	netif_tx_stop_all_queues(netdev);
-	lan743x_mac_eee_enable(adapter, false);
 }
 
 static void lan743x_phylink_mac_link_up(struct phylink_config *config,
@@ -3072,16 +3070,32 @@ static void lan743x_phylink_mac_link_up(struct phylink_config *config,
 					  cap & FLOW_CTRL_TX,
 					  cap & FLOW_CTRL_RX);
 
-	if (phydev)
-		lan743x_mac_eee_enable(adapter, phydev->enable_tx_lpi);
-
 	netif_tx_wake_all_queues(netdev);
 }
 
+static void mac_disable_tx_lpi(struct phylink_config *config)
+{
+	lan743x_mac_eee_enable(adapter, false);
+}
+
+static void mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
+			      bool tx_clk_stop)
+{
+	/* Software should only change this field when Energy Efficient
+	 * Ethernet Enable (EEEEN) is cleared. We ensure that by clearing
+	 * EEEEN during probe, and phylink itself guarantees that
+	 * mac_disable_tx_lpi() will have been previously called.
+	 */
+	lan743x_csr_write(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT, timer);
+	lan743x_mac_eee_enable(adapter, true);
+}
+
 static const struct phylink_mac_ops lan743x_phylink_mac_ops = {
 	.mac_config = lan743x_phylink_mac_config,
 	.mac_link_down = lan743x_phylink_mac_link_down,
 	.mac_link_up = lan743x_phylink_mac_link_up,
+	.mac_disable_tx_lpi = lan743x_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = lan743x_mac_enable_tx_lpi,
 };
 
 static int lan743x_phylink_create(struct lan743x_adapter *adapter)
@@ -3095,6 +3109,10 @@ static int lan743x_phylink_create(struct lan743x_adapter *adapter)
 
 	adapter->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
 		MAC_SYM_PAUSE | MAC_10 | MAC_100 | MAC_1000FD;
+	adapter->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
+	adapter->phylink_config.lpi_timer_max = U32_MAX;
+	adapter->phylink_config.lpi_timer_default =
+		lan743x_csr_read(adapter, MAC_EEE_TX_LPI_REQ_DLY_CNT);
 
 	lan743x_phy_interface_select(adapter);
 
@@ -3120,6 +3138,10 @@ static int lan743x_phylink_create(struct lan743x_adapter *adapter)
 		phy_interface_set_rgmii(adapter->phylink_config.supported_interfaces);
 	}
 
+	memcpy(adapter->phylink_config.lpi_interfaces,
+	       adapter->phylink_config.supported_interfaces,
+	       sizeof(adapter->phylink_config.lpi_interfaces));
+
 	pl = phylink_create(&adapter->phylink_config, NULL,
 			    adapter->phy_interface, &lan743x_phylink_mac_ops);
 
@@ -3517,6 +3539,9 @@ static int lan743x_hardware_init(struct lan743x_adapter *adapter,
 		spin_lock_init(&tx->ring_lock);
 	}
 
+	/* Ensure EEEEN is clear */
+	lan743x_mac_eee_enable(adapter, false);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/microchip/lan743x_main.h b/drivers/net/ethernet/microchip/lan743x_main.h
index 8ef897c114d3..7f73d66854be 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.h
+++ b/drivers/net/ethernet/microchip/lan743x_main.h
@@ -1206,6 +1206,5 @@ void lan743x_hs_syslock_release(struct lan743x_adapter *adapter);
 void lan743x_mac_flow_ctrl_set_enables(struct lan743x_adapter *adapter,
 				       bool tx_enable, bool rx_enable);
 int lan743x_sgmii_read(struct lan743x_adapter *adapter, u8 mmd, u16 addr);
-void lan743x_mac_eee_enable(struct lan743x_adapter *adapter, bool enable);
 
 #endif /* _LAN743X_H */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
