Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B8B37E24
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 10:55:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B520C3F957;
	Wed, 27 Aug 2025 08:55:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6B2CC349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K7HaJk396OO093SxPHpUQb4seLkO7bxlhi3QdP8wBr4=; b=NSQxECPtX7C8dbMwGLyP+ulZGG
 nmPrcJ3zBoC0HPaOQA+Q8HyRz/Vvegz770b9uvYukTd7GO4uphNs/Qd8HOiNJCNOY5JdcrUD64XgQ
 G0PWImYty0TG6jzGQC+a8z7YUJhvZ2eBOaapcQ24ZrONV2gavsycOmR4rWaZNdRld0cHg10FUGkdI
 eUZpYaCVNsg8l6gvEulFCQ5oLvMGeyThNNn2TJZk/1rLrmNEWjVZv10gKCE72cU7QFjKA8/UGHVje
 TZt2zHacB08u68Ma3nx7FPW9m3WbamOSFIQqPY8WL4p/v2IwFeYW//mKB4o/k/t+UPE7wlNyNHxt+
 TfxY4yKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51196 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1urBvg-000000000G1-23Bx;
 Wed, 27 Aug 2025 09:54:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1urBvf-000000002ii-37Ce; Wed, 27 Aug 2025 09:54:51 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
Date: Wed, 27 Aug 2025 09:54:51 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: minor cleanups to
 stmmac_bus_clks_config()
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

stmmac_bus_clks_config() doesn't need to repeatedly on dereference
priv->plat as this remains the same throughout this function. Not only
does this detract from the function's readability, but it could cause
the value to be reloaded each time. Use a local variable.

Also, the final return can simply return zero, and we can dispense
with the initialiser for 'ret'.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 429a871d7378..88f5d637f033 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -149,33 +149,34 @@ static void stmmac_exit_fs(struct net_device *dev);
 
 int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
 {
-	int ret = 0;
+	struct plat_stmmacenet_data *plat_dat = priv->plat;
+	int ret;
 
 	if (enabled) {
-		ret = clk_prepare_enable(priv->plat->stmmac_clk);
+		ret = clk_prepare_enable(plat_dat->stmmac_clk);
 		if (ret)
 			return ret;
-		ret = clk_prepare_enable(priv->plat->pclk);
+		ret = clk_prepare_enable(plat_dat->pclk);
 		if (ret) {
-			clk_disable_unprepare(priv->plat->stmmac_clk);
+			clk_disable_unprepare(plat_dat->stmmac_clk);
 			return ret;
 		}
-		if (priv->plat->clks_config) {
-			ret = priv->plat->clks_config(priv->plat->bsp_priv, enabled);
+		if (plat_dat->clks_config) {
+			ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
 			if (ret) {
-				clk_disable_unprepare(priv->plat->stmmac_clk);
-				clk_disable_unprepare(priv->plat->pclk);
+				clk_disable_unprepare(plat_dat->stmmac_clk);
+				clk_disable_unprepare(plat_dat->pclk);
 				return ret;
 			}
 		}
 	} else {
-		clk_disable_unprepare(priv->plat->stmmac_clk);
-		clk_disable_unprepare(priv->plat->pclk);
-		if (priv->plat->clks_config)
-			priv->plat->clks_config(priv->plat->bsp_priv, enabled);
+		clk_disable_unprepare(plat_dat->stmmac_clk);
+		clk_disable_unprepare(plat_dat->pclk);
+		if (plat_dat->clks_config)
+			plat_dat->clks_config(plat_dat->bsp_priv, enabled);
 	}
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
 
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
