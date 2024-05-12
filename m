Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3CB8C3784
	for <lists+linux-stm32@lfdr.de>; Sun, 12 May 2024 18:29:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B94BAC62EFE;
	Sun, 12 May 2024 16:29:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94C35C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 May 2024 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=afPOCEWnaXq4StvbkwSPZO66D+Nn8dt1v0mNXaQzjQ8=; b=LXy/iGn6NdXkorsUdRC8yXNFY/
 7mc3aU9TmCY9TN/KO3j7KeH4x/mE9es6zz+pPocfiIl5VTXtzQu58XCdVjcCoj0uAksmLsxlLaULl
 +QKf4y8c480TelHoDZm21YL7kmMHQlkHqIfzAg8pWD4ACse9ImpAGchpLtv5v2QQo61x4SO3xGzfr
 1WpSya09jPZcRYctDGu7bOiSQt32nwOqXumCytgHgphqe7mXAR/k8BDJnqYQpIGtTBW7pnI1lN887
 YT0mN/jdu6xYm9Ynb31QBzI+y3ne2as8nbfHbbBZj2LgnRGoMXHL+onIBA84GlXa8YuoXYDBEAZr6
 p5idqhdw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44488 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1s6C4W-0000tj-2E;
 Sun, 12 May 2024 17:29:12 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1s6C4Y-00Ck6a-Gr; Sun, 12 May 2024 17:29:14 +0100
In-Reply-To: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1s6C4Y-00Ck6a-Gr@rmk-PC.armlinux.org.uk>
Date: Sun, 12 May 2024 17:29:14 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 4/6] net: stmmac: remove calls to
 stmmac_pcs_get_adv_lp()
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

phylink can handle the pause parameter ethtool ops; let it do so.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 2aaffa07977e..d8beeebe8745 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -429,15 +429,8 @@ stmmac_get_pauseparam(struct net_device *netdev,
 		      struct ethtool_pauseparam *pause)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
-	struct rgmii_adv adv_lp;
 
-	if (priv->hw->pcs && !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
-		pause->autoneg = 1;
-		if (!adv_lp.pause)
-			return;
-	} else {
-		phylink_ethtool_get_pauseparam(priv->phylink, pause);
-	}
+	phylink_ethtool_get_pauseparam(priv->phylink, pause);
 }
 
 static int
@@ -445,16 +438,8 @@ stmmac_set_pauseparam(struct net_device *netdev,
 		      struct ethtool_pauseparam *pause)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
-	struct rgmii_adv adv_lp;
 
-	if (priv->hw->pcs && !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
-		pause->autoneg = 1;
-		if (!adv_lp.pause)
-			return -EOPNOTSUPP;
-		return 0;
-	} else {
-		return phylink_ethtool_set_pauseparam(priv->phylink, pause);
-	}
+	return phylink_ethtool_set_pauseparam(priv->phylink, pause);
 }
 
 static u64 stmmac_get_rx_normal_irq_n(struct stmmac_priv *priv, int q)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
