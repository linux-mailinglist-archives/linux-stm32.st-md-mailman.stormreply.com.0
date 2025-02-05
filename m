Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64427A28BEF
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 14:40:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24E33C78F8C;
	Wed,  5 Feb 2025 13:40:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21C61C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vaDFuiHoKMcPrOZiBb6rulduVuXzLC4QmK70UITNdZQ=; b=hXSDb5RzVOMORA7oA3m7Gk9yoJ
 sdnvxU1ei9G8Rc+Jk3gFM+WeLRJSD3PB2apF5WZNZphSfDoXImvadOtqQXEJxR6apNv4ylcZcgukB
 EcDa06geEagbKtYLCT59qxUu+O7WmsT3Iq6hdY0uMp6usEWS7+Bjhg+C2p0jqSghVFWrhUoujh3ii
 C44eXvFgnrRBycBdFMberHj+sKOntbTL3hqVF04VyGsb02xlmvlKOUo8C+VNoviBIRYHyKbHqXzGh
 DOUmu+6K/ToeVajL3XHAIl8N8DUsrdWsb9xmkGMPfnB8mvbzkF7EvkgYBYt8m8jkAsEzRGxi3bxhs
 MUJ2FmDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58650 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tffdc-0007Ab-0X;
 Wed, 05 Feb 2025 13:40:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tffdI-003ZHn-Iz; Wed, 05 Feb 2025 13:40:00 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tffdI-003ZHn-Iz@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:00 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/14] net: stmmac: split
 stmmac_init_eee() and move to phylink methods
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

Move the appropriate parts of stmmac_init_eee() into the phylink
mac_enable_tx_lpi() and mac_disable_tx_lpi() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 133 +++++++++---------
 1 file changed, 63 insertions(+), 70 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c0472738bc76..8f2624de592d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -466,74 +466,6 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 	stmmac_try_to_start_sw_lpi(priv);
 }
 
-/**
- * stmmac_eee_init - init EEE
- * @priv: driver private structure
- * @active: indicates whether EEE should be enabled.
- * Description:
- *  if the GMAC supports the EEE (from the HW cap reg) and the phy device
- *  can also manage EEE, this function enable the LPI state and start related
- *  timer.
- */
-static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
-{
-	priv->eee_active = active;
-
-	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee) {
-		priv->eee_enabled = false;
-		return;
-	}
-
-	mutex_lock(&priv->lock);
-
-	/* Check if it needs to be deactivated */
-	if (!priv->eee_active) {
-		if (priv->eee_enabled) {
-			netdev_dbg(priv->dev, "disable EEE\n");
-			priv->eee_sw_timer_en = false;
-			del_timer_sync(&priv->eee_ctrl_timer);
-			stmmac_reset_eee_mode(priv, priv->hw);
-			stmmac_set_eee_timer(priv, priv->hw, 0,
-					     STMMAC_DEFAULT_TWT_LS);
-			if (priv->hw->xpcs)
-				xpcs_config_eee(priv->hw->xpcs,
-						priv->plat->mult_fact_100ns,
-						false);
-		}
-		priv->eee_enabled = false;
-		mutex_unlock(&priv->lock);
-		return;
-	}
-
-	if (priv->eee_active && !priv->eee_enabled) {
-		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
-				     STMMAC_DEFAULT_TWT_LS);
-		if (priv->hw->xpcs)
-			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns,
-					true);
-	}
-
-	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
-		/* Use hardware LPI mode */
-		del_timer_sync(&priv->eee_ctrl_timer);
-		priv->tx_path_in_lpi_mode = false;
-		priv->eee_sw_timer_en = false;
-		stmmac_enable_hw_lpi_timer(priv);
-	} else {
-		/* Use software LPI mode */
-		priv->eee_sw_timer_en = true;
-		stmmac_disable_hw_lpi_timer(priv);
-		stmmac_restart_sw_lpi_timer(priv);
-	}
-
-	priv->eee_enabled = true;
-
-	mutex_unlock(&priv->lock);
-	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
-}
-
 /* stmmac_get_tx_hwtstamp - get HW TX timestamps
  * @priv: driver private structure
  * @p : descriptor pointer
@@ -1110,7 +1042,33 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
-	stmmac_eee_init(priv, false);
+	priv->eee_active = false;
+
+	/* Check if MAC core supports the EEE feature. */
+	if (!priv->dma_cap.eee) {
+		priv->eee_enabled = false;
+		return;
+	}
+
+	mutex_lock(&priv->lock);
+
+	/* Check if it needs to be deactivated */
+	if (!priv->eee_active) {
+		if (priv->eee_enabled) {
+			netdev_dbg(priv->dev, "disable EEE\n");
+			priv->eee_sw_timer_en = false;
+			del_timer_sync(&priv->eee_ctrl_timer);
+			stmmac_reset_eee_mode(priv, priv->hw);
+			stmmac_set_eee_timer(priv, priv->hw, 0,
+					     STMMAC_DEFAULT_TWT_LS);
+			if (priv->hw->xpcs)
+				xpcs_config_eee(priv->hw->xpcs,
+						priv->plat->mult_fact_100ns,
+						false);
+		}
+		priv->eee_enabled = false;
+	}
+	mutex_unlock(&priv->lock);
 }
 
 static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
@@ -1119,7 +1077,42 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
 	priv->tx_lpi_timer = timer;
-	stmmac_eee_init(priv, true);
+	priv->eee_active = true;
+
+	/* Check if MAC core supports the EEE feature. */
+	if (!priv->dma_cap.eee) {
+		priv->eee_enabled = false;
+		return 0;
+	}
+
+	mutex_lock(&priv->lock);
+
+	if (priv->eee_active && !priv->eee_enabled) {
+		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
+				     STMMAC_DEFAULT_TWT_LS);
+		if (priv->hw->xpcs)
+			xpcs_config_eee(priv->hw->xpcs,
+					priv->plat->mult_fact_100ns,
+					true);
+	}
+
+	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
+		/* Use hardware LPI mode */
+		del_timer_sync(&priv->eee_ctrl_timer);
+		priv->tx_path_in_lpi_mode = false;
+		priv->eee_sw_timer_en = false;
+		stmmac_enable_hw_lpi_timer(priv);
+	} else {
+		/* Use software LPI mode */
+		priv->eee_sw_timer_en = true;
+		stmmac_disable_hw_lpi_timer(priv);
+		stmmac_restart_sw_lpi_timer(priv);
+	}
+
+	priv->eee_enabled = true;
+
+	mutex_unlock(&priv->lock);
+	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
 
 	return 0;
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
