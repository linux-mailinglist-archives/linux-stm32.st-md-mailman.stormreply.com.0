Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839DA28BFA
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 14:41:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ED9FC78F95;
	Wed,  5 Feb 2025 13:40:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D92CFC78F92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HapMKEDwluimEXPuPk+qD/5tw9RztvwWMl7+HqoD6wo=; b=howcuFCqo4EhehmK5FI0Xffgiw
 YTu67hn3iXNCeCrxvLDyS9q8igh6mdsaVlnoqKKnLniiplKLSAZ/qlzUyYVGdMKEUpjVxb9zonIav
 xCLnfWFKrHV+V5l3wbRG9uKHUaoTrQglXxHoPvUHkNHPPpRNzUVitT0xfTLKoPAx/Ckm5E0zUgtmS
 AOSQb07EsstsijXH1k5JkhRmxfiJts1wAtj+8Jf41G9OuS9GzjNNMVzJTUvAmeE+1PDzyQdDY154/
 hAgIjsUqAPFtMxKHdZGUkWjeGpMEa2nBXgrWVkDl5zTlzaw7+W1RRX+JL1iTg7OBW7lLVyhPflQGd
 09XNH7sg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51742 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tffe1-0007Bv-22;
 Wed, 05 Feb 2025 13:40:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tffdi-003ZIH-5h; Wed, 05 Feb 2025 13:40:26 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tffdi-003ZIH-5h@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 09/14] net: stmmac: remove
 unnecessary LPI disable when enabling LPI
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

Remove the unnecessary LPI disable when enabling LPI - as noted in
previous commits, there will never be two consecutive calls to
stmmac_mac_enable_tx_lpi() without an intervening
stmmac_mac_disable_tx_lpi.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3cb5645673cb..921c4badd5fb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -390,11 +390,6 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 	return dirty;
 }
 
-static void stmmac_disable_hw_lpi_timer(struct stmmac_priv *priv)
-{
-	stmmac_set_eee_lpi_timer(priv, priv->hw, 0);
-}
-
 static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 {
 	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
@@ -1082,14 +1077,10 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
 		/* Use hardware LPI mode */
-		del_timer_sync(&priv->eee_ctrl_timer);
-		priv->tx_path_in_lpi_mode = false;
-		priv->eee_sw_timer_en = false;
 		stmmac_enable_hw_lpi_timer(priv);
 	} else {
 		/* Use software LPI mode */
 		priv->eee_sw_timer_en = true;
-		stmmac_disable_hw_lpi_timer(priv);
 		stmmac_restart_sw_lpi_timer(priv);
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
