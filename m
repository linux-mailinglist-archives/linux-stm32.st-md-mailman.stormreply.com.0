Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C5FA20D72
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 16:47:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CA7FC78031;
	Tue, 28 Jan 2025 15:47:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE409C78026
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 15:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RdaJHDcetawhw7n/tKdXgSJrOfxgqAK1m9UgeH2faDY=; b=DUoJvcMNtYWYHhnUOG2+m3iGt+
 mh0kg9EQjZsMkN0tcXxx5jOE+j6mkcveB1SZXSIf6JsPVg10V5bNRMxXGwhqQZbsCqH+Gg70y9D55
 ogY9tG1X7hK5MJEq4qn1jyUb5P8EfJVreJugMzX2i2389hJaksgvxcmdy+VgpR8s/iTUEhWi24YYl
 ZGlp2FBeC9ByMclEpVkel4GTKeK34cYFSPiP8CmMpMssP92iAx/68KS1EDDhLZVYVConBlRoHv2UN
 VfpRqXRrwicQlrf7zFUEUMwIM5shpWuOV9BRfptBzfuxMKHJHFoTJUOC4PlzCvPv6+uQ/5e7B8MkX
 rxQg27dQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45790 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tcnoM-0007UD-35;
 Tue, 28 Jan 2025 15:47:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tcno3-0037Gc-Is; Tue, 28 Jan 2025 15:47:15 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tcno3-0037Gc-Is@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:15 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 06/22] net: stmmac: remove
 unnecessary priv->eee_active tests
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

Since priv->eee_active is assigned with a constant value in each of
these methods, there is no need to test its value later. Remove these
unnecessary tests.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 ++++++++-----------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c2cc75624a8c..f63946eb6747 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1047,21 +1047,17 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 	mutex_lock(&priv->lock);
 
 	/* Check if it needs to be deactivated */
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
+	if (priv->eee_enabled) {
+		netdev_dbg(priv->dev, "disable EEE\n");
+		priv->eee_sw_timer_en = false;
+		del_timer_sync(&priv->eee_ctrl_timer);
+		stmmac_reset_eee_mode(priv, priv->hw);
+		stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
+		if (priv->hw->xpcs)
+			xpcs_config_eee(priv->hw->xpcs,
+					priv->plat->mult_fact_100ns, false);
 	}
+	priv->eee_enabled = false;
 	mutex_unlock(&priv->lock);
 }
 
@@ -1075,13 +1071,12 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	mutex_lock(&priv->lock);
 
-	if (priv->eee_active && !priv->eee_enabled) {
+	if (!priv->eee_enabled) {
 		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 				     STMMAC_DEFAULT_TWT_LS);
 		if (priv->hw->xpcs)
 			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns,
-					true);
+					priv->plat->mult_fact_100ns, true);
 	}
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
