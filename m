Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E354A20D7F
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 16:48:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA157C78031;
	Tue, 28 Jan 2025 15:48:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67809C78026
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TiDJSvJNzK27YwKwilomGm2u5RweY/NCsbPGAL9OV2I=; b=X/7G3ku2yXh8QSbbTwmW+wYkcp
 UPyJnO9Xj1Hkbq82GIq4vdZkqgwOH56Y2+Q4UjSp2EwHuLvfnEvuSf17f9c33TqiHPVCIU01sLn4o
 HsCyZMCXAE/ovdye2juvZvowFaN8m8BnHMPSfBjtB7DY6EDvV7pzTIWzWzUmIjcGGOj7cGAfQiu0I
 +y2rHotrK+Ub/8cyRWmb8e7qyVpoTebEg1uwOjiGFQ+uUl6dMC5owdeli8ws1PUThlNDIwgfMgelx
 jgxBVLqWiGpFU7RYOTBOFd8VDksHUeWhMS8seEw5zT21yETbhxjHfRBtS3a327DI91d5pGS4aYnN6
 OXKgEGIA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50184 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tcnow-0007WB-2K;
 Tue, 28 Jan 2025 15:48:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tcnod-0037HK-Di; Tue, 28 Jan 2025 15:47:51 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tcnod-0037HK-Di@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:51 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 13/22] net: stmmac: use
	stmmac_set_lpi_mode()
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

Use the new stmmac_set_lpi_mode() API to configure the parameters of
the desired LPI mode rather than the older methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index aafd9cee304e..5b47b2ad6b49 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -390,11 +390,6 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 	return dirty;
 }
 
-static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
-{
-	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
-}
-
 static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
 {
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
@@ -431,8 +426,9 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
-		stmmac_set_eee_mode(priv, priv->hw,
-			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING);
+		stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_FORCED,
+			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING,
+			0);
 }
 
 /**
@@ -443,7 +439,7 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 static void stmmac_stop_sw_lpi(struct stmmac_priv *priv)
 {
 	del_timer_sync(&priv->eee_ctrl_timer);
-	stmmac_reset_eee_mode(priv, priv->hw);
+	stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_DISABLE, false, 0);
 	priv->tx_path_in_lpi_mode = false;
 }
 
@@ -1046,7 +1042,7 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 	netdev_dbg(priv->dev, "disable EEE\n");
 	priv->eee_sw_timer_en = false;
 	del_timer_sync(&priv->eee_ctrl_timer);
-	stmmac_reset_eee_mode(priv, priv->hw);
+	stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_DISABLE, false, 0);
 	priv->tx_path_in_lpi_mode = false;
 
 	stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
@@ -1061,6 +1057,7 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 				    bool tx_clk_stop)
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+	int ret;
 
 	priv->tx_lpi_timer = timer;
 	priv->eee_active = true;
@@ -1075,11 +1072,15 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
 				true);
 
-	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
-		/* Use hardware LPI mode */
-		stmmac_enable_hw_lpi_timer(priv);
-	} else {
-		/* Use software LPI mode */
+	/* Try to cnfigure the hardware timer. */
+	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
+				  priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING,
+				  priv->tx_lpi_timer);
+
+	if (ret) {
+		/* Hardware timer mode not supported, or value out of range.
+		 * Fall back to using software LPI mode
+		 */
 		priv->eee_sw_timer_en = true;
 		stmmac_restart_sw_lpi_timer(priv);
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
