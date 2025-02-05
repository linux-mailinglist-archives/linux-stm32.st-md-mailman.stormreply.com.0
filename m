Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A6A28BF7
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 14:40:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41660C78F91;
	Wed,  5 Feb 2025 13:40:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7239AC78F8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wzqVEG4YmhcZfFsDxnn0J/g7QtnEP23oOLAdp01iVs=; b=oR0F+Qr/FX41EyBCkqh5BDGZQH
 pgJPnC55/0iaRAD0jkEnCBcQH8roQU7OmkVUXRRIQGiN5m6TuzIg86w1iFj9k2wqneP2AY2yMmSLQ
 G2imYbim+1lHJ0lmBB68B/jzPhEsGaYoBnwMiHRL5uXizfbTEjHDarK9jV4mFnNTEOpcZkBlm1Y/U
 7ITYstp/6X8YU+d3c42Hg4iW/GBmAIf1mX7eBI7SDfK0/JjaKAKxmmvJ/OQspITZWcui4hFtVT0Ro
 9gXihcjSnteIp7thSZnH4S7rvIcp6zZOWOJp9vgzlBe7KYMsuZ1rm8tCnm1jAfpbBNqqWd2ftRMDk
 ZNnMFhpg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60762 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tffdr-0007BR-1W;
 Wed, 05 Feb 2025 13:40:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tffdX-003ZI5-UV; Wed, 05 Feb 2025 13:40:15 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tffdX-003ZI5-UV@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:15 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/14] net: stmmac: remove
 unnecessary priv->eee_enabled tests
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

Phylink will not call the mac_disable_tx_lpi() and mac_enable_tx_lpi()
methods randomly - the first method to be called will be the enable
method, and then after, the disable method will be called once between
subsequent enable calls. Thus there is a guaranteed ordering.

Therefore, we know the previous state of priv->eee_enabled, and can
remove it from both methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 +++++++++----------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6c8685c30022..695e75de41b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1046,18 +1046,17 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 
 	mutex_lock(&priv->lock);
 
-	/* Check if it needs to be deactivated */
-	if (priv->eee_enabled) {
-		netdev_dbg(priv->dev, "disable EEE\n");
-		priv->eee_sw_timer_en = false;
-		del_timer_sync(&priv->eee_ctrl_timer);
-		stmmac_reset_eee_mode(priv, priv->hw);
-		stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
-		if (priv->hw->xpcs)
-			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns, false);
-	}
 	priv->eee_enabled = false;
+
+	netdev_dbg(priv->dev, "disable EEE\n");
+	priv->eee_sw_timer_en = false;
+	del_timer_sync(&priv->eee_ctrl_timer);
+	stmmac_reset_eee_mode(priv, priv->hw);
+	stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
+	if (priv->hw->xpcs)
+		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
+				false);
+
 	mutex_unlock(&priv->lock);
 }
 
@@ -1071,13 +1070,13 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	mutex_lock(&priv->lock);
 
-	if (!priv->eee_enabled) {
-		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
-				     STMMAC_DEFAULT_TWT_LS);
-		if (priv->hw->xpcs)
-			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns, true);
-	}
+	priv->eee_enabled = true;
+
+	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
+			     STMMAC_DEFAULT_TWT_LS);
+	if (priv->hw->xpcs)
+		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
+				true);
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
 		/* Use hardware LPI mode */
@@ -1092,8 +1091,6 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 		stmmac_restart_sw_lpi_timer(priv);
 	}
 
-	priv->eee_enabled = true;
-
 	mutex_unlock(&priv->lock);
 	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
