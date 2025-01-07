Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D5A0464A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 17:30:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82254C78026;
	Tue,  7 Jan 2025 16:30:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9054EC78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k4h4DvLs6eIAMMB+SiDt1jAxdP1YqbY0pFewk/QkNZQ=; b=KWm+xDqUuNYy43JeQyW+mp8Lhd
 AGblvifSnlJllc1Awi+zNSYef4lfrfaOat9RjHoyoJHs/pSaL+dVB0PfAu4HXuzCuorYorOoUaMI6
 Tb5sBGwfKk0wM10xecW7rYGrlQCR/+wsl9xxjUQyVxu7CpklL2DTKZ/kZMiCxg32uz+j6nLV2EkgU
 Q9dO+yiwiOI9tm0jZBLwoGBDjPL8Ru0wn6EER36W88l8zLtkt0UWeHdElnygY0pEiLrovqyUKzLoL
 OxXXDWBz/w2UYAg0yUdbEPkAiZoZBDAQz0dprPHaMKPKbtJtfxIisKtwvo8VKHbCbwbzj4QjhnpHT
 +K8P5/rA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50608 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tVCSw-0007pe-1G;
 Tue, 07 Jan 2025 16:30:02 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tVCSt-007Y4d-5y; Tue, 07 Jan 2025 16:29:59 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tVCSt-007Y4d-5y@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:59 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 18/18] net: stmmac: remove
 stmmac_lpi_entry_timer_config()
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

Remove stmmac_lpi_entry_timer_config(), setting priv->eee_sw_timer_en
at the original call sites, and calling the appropriate
stmmac_xxx_hw_lpi_timer() function. No functional change.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5b2ce5305b4b..250e1e7df050 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -400,16 +400,6 @@ static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
 }
 
-static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
-{
-	/* Clear/set the SW EEE timer flag based on LPI ET enablement */
-	priv->eee_sw_timer_en = en ? 0 : 1;
-	if (en)
-		stmmac_enable_hw_lpi_timer(priv);
-	else
-		stmmac_disable_hw_lpi_timer(priv);
-}
-
 /**
  * stmmac_enable_eee_mode - check and enter in LPI mode
  * @priv: driver private structure
@@ -489,7 +479,8 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 	if (!priv->eee_active) {
 		if (priv->eee_enabled) {
 			netdev_dbg(priv->dev, "disable EEE\n");
-			stmmac_lpi_entry_timer_config(priv, 0);
+			priv->eee_sw_timer_en = true;
+			stmmac_disable_hw_lpi_timer(priv);
 			del_timer_sync(&priv->eee_ctrl_timer);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
@@ -513,11 +504,15 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 	}
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
+		/* Use hardware LPI mode */
 		del_timer_sync(&priv->eee_ctrl_timer);
 		priv->tx_path_in_lpi_mode = false;
-		stmmac_lpi_entry_timer_config(priv, 1);
+		priv->eee_sw_timer_en = false;
+		stmmac_enable_hw_lpi_timer(priv);
 	} else {
-		stmmac_lpi_entry_timer_config(priv, 0);
+		/* Use software LPI mode */
+		priv->eee_sw_timer_en = true;
+		stmmac_disable_hw_lpi_timer(priv);
 		mod_timer(&priv->eee_ctrl_timer,
 			  STMMAC_LPI_T(priv->tx_lpi_timer));
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
