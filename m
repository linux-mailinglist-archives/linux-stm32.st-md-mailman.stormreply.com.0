Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22763A6B073
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 23:11:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D526DC78F64;
	Thu, 20 Mar 2025 22:11:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CDC5C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 22:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ChKjIakwJND4vOY0HyYOFQnBjQelfpLov4gGDNWana8=; b=MRYYPRdyTwUz3nT4aAgnzm0Y2k
 kVDyf+2rnB58GjD2Bzo5h1hwIUtvpN9zS8jDV8rlJa/HyFN3ILfN+IyxfusH8JPfsu4HAh3oDtgQI
 NnLNEyEPztmLX1MeZrXQCkv9q0cQQ9m9WmETsy8Op3y0MoQs2AuIH+bSYft1XWfJHAK9GQGgCx5FH
 4V/2VUotn4nz3LJ8zatUSd9R0HDdSf7dylORraDcjozSw/3fz4KTsFo1cJrBb0lJVmovUIPxfSb3E
 DeYyK6KkLmcBoz6peqBWOArcHr1n8/YTckvZmYc7mZpwN26RIfyWDjv/CrXNAWttM2Zr3/Sa29fOI
 PK5W/Apg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59052 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tvO7A-0008Eb-1P;
 Thu, 20 Mar 2025 22:11:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tvO6p-008Vjz-Qy; Thu, 20 Mar 2025 22:11:27 +0000
In-Reply-To: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
References: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tvO6p-008Vjz-Qy@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Mar 2025 22:11:27 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: block PHY RXC
	clock-stop
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

The DesignWare core requires the receive clock to be running during
certain operations. Ensure that we block PHY RXC clock-stop during
these operations.

This is a best-efforts change - not everywhere can be covered by this
because of net's core locking, which means we can't access the MDIO
bus to configure the PHY to disable RXC clock-stop in certain areas.
These are marked with FIXME comments.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 860f800cd014..a4f2c98e851a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3484,9 +3484,18 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	if (priv->hw->phylink_pcs)
 		phylink_pcs_pre_init(priv->phylink, priv->hw->phylink_pcs);
 
+	/* Note that clk_rx_i must be running for reset to complete. This
+	 * clock may also be required when setting the MAC address.
+	 *
+	 * Block the receive clock stop for LPI mode at the PHY in case
+	 * the link is established with EEE mode active.
+	 */
+	phylink_rx_clk_stop_block(priv->phylink);
+
 	/* DMA initialization and SW reset */
 	ret = stmmac_init_dma_engine(priv);
 	if (ret < 0) {
+		phylink_rx_clk_stop_unblock(priv->phylink);
 		netdev_err(priv->dev, "%s: DMA engine initialization failed\n",
 			   __func__);
 		return ret;
@@ -3494,6 +3503,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	/* Copy the MAC addr into the HW  */
 	stmmac_set_umac_addr(priv, priv->hw, dev->dev_addr, 0);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 
 	/* PS and related bits will be programmed according to the speed */
 	if (priv->hw->pcs) {
@@ -3604,7 +3614,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
+	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 
 	return 0;
 }
@@ -5888,6 +5900,9 @@ static void stmmac_tx_timeout(struct net_device *dev, unsigned int txqueue)
  *  whenever multicast addresses must be enabled/disabled.
  *  Return value:
  *  void.
+ *
+ *  FIXME: This may need RXC to be running, but it may be called with BH
+ *  disabled, which means we can't call phylink_rx_clk_stop*().
  */
 static void stmmac_set_rx_mode(struct net_device *dev)
 {
@@ -6020,7 +6035,9 @@ static int stmmac_set_features(struct net_device *netdev,
 	else
 		priv->hw->hw_vlan_en = false;
 
+	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 
 	return 0;
 }
@@ -6304,7 +6321,9 @@ static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
 	if (ret)
 		goto set_mac_error;
 
+	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_umac_addr(priv, priv->hw, ndev->dev_addr, 0);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 
 set_mac_error:
 	pm_runtime_put(priv->device);
@@ -6660,6 +6679,9 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
 }
 
+/* FIXME: This may need RXC to be running, but it may be called with BH
+ * disabled, which means we can't call phylink_rx_clk_stop*().
+ */
 static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
@@ -6691,6 +6713,9 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	return ret;
 }
 
+/* FIXME: This may need RXC to be running, but it may be called with BH
+ * disabled, which means we can't call phylink_rx_clk_stop*().
+ */
 static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
@@ -7951,9 +7976,11 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_hw_setup(ndev, false);
 	stmmac_init_coalesce(priv);
+	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
 
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
