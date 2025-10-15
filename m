Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17177BDF94C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 18:10:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D09E5C57163;
	Wed, 15 Oct 2025 16:10:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 123B2C5663F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EOOQYLd96M6BO1COUjospMceQ2X16bQTz+GpJfxe6dU=; b=VoghqnzDrcZJxEVOdC2xWrRT3X
 nHqifRzkO528MOkPURnD8VoPgtrmjyps5vYoKwyCM53/zeoJ32ZpDbiZ4k7tcqkFfKsjHuOL2C8Cz
 9TowXX+ukPT+1uZU55H5Nipu259oleebKCdZ6F0NX6pSrHUZ1XGRUhsDX0Btseg1KoU3tAv7HgGRb
 OSpZiABMKfd4KNw34C6qAUvWAcjQ+aPuoCpvlovKR7ipGJ377Saz8Mmwg4EGJSm0x/mu5DKnckY3k
 +OKiu3pSIhiMaE0fiZAKXBAv/KU/8extcC5uz4NyJixKji+wvMz16A0G1y4vXpNoFP7WwCNeG/BCI
 YOFZlz0w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38624 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v945P-000000005A0-23CF;
 Wed, 15 Oct 2025 17:10:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v945O-0000000AmeP-1k0t; Wed, 15 Oct 2025 17:10:46 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:10:46 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: place .mac_finish()
 method more appropriately
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

Place the .mac_finish() initialiser and implementation after the
.mac_config() initialiser and method which reflects the order that
they appear in struct phylink_mac_ops, and the order in which they
are called. This keeps logically similar code together.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 650d75b73e0b..3728afa701c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -859,6 +859,18 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
 	/* Nothing to do, xpcs_config() handles everything */
 }
 
+static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
+			     phy_interface_t interface)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (priv->plat->mac_finish)
+		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
+
+	return 0;
+}
+
 static void stmmac_mac_link_down(struct phylink_config *config,
 				 unsigned int mode, phy_interface_t interface)
 {
@@ -1053,27 +1065,15 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	return 0;
 }
 
-static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
-			     phy_interface_t interface)
-{
-	struct net_device *ndev = to_net_dev(config->dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	if (priv->plat->mac_finish)
-		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
-
-	return 0;
-}
-
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
+	.mac_finish = stmmac_mac_finish,
 	.mac_link_down = stmmac_mac_link_down,
 	.mac_link_up = stmmac_mac_link_up,
 	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
 	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
-	.mac_finish = stmmac_mac_finish,
 };
 
 /**
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
