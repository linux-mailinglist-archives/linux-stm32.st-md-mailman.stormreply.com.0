Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74384B95A30
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 13:26:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D777C3F92E;
	Tue, 23 Sep 2025 11:26:07 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E221AC36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RlGoGEht7ZRuLU+Ywhrh7DNB0TyNx63riRsUGVVjf2s=; b=PNAy1DJiSOzjGYwtVAnDewa46v
 9AV04v8lddEsGD3QGpPPKPll7T6X+Y5qTMTRfSvt7orVeOxfgPiyzrcPB8punQphn7R8owD2ajo8C
 F8z2VzIk/wNRFEztHgng0Zf2lA/+Awq1hY4/SS48REejkFMUDbdR+bTNt80cmAX7xiL2KWPHWsJPh
 58ol3bWI/a4gUMyRlFqNVPF6WLYY1FPL12G2+rXbWuHiL+Gj81LSPpxz+wh73uGed+BgPgFsWZJIk
 VluYW8Mdfgu3ueQUkn17EagSlzuJ2GOHUNWb153xG45O2rYJlHfWEy+eqNQFJCQ5XSgnLBTC4mgzI
 UnMDCCuw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38064 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v119k-00000000789-0PxJ;
 Tue, 23 Sep 2025 12:26:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v119j-0000000773s-1R2v; Tue, 23 Sep 2025 12:25:59 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v119j-0000000773s-1R2v@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:25:59 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: move
 stmmac_bus_clks_config() to stmmac_platform.c
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

stmmac_bus_clks_config() is only used by stmmac_platform.c, so rather
than having it in stmmac_main.c and needing to export the symbol,
move it to where it's used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 -------------------
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 32 ++++++++++++++++++
 3 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 151f08e5e85d..7ca5477be390 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -404,7 +404,6 @@ int stmmac_dvr_probe(struct device *device,
 		     struct stmmac_resources *res);
 int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
-int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
 int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 			   phy_interface_t interface, int speed);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d17820d9e7f1..517b25b2bcae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -147,39 +147,6 @@ static void stmmac_exit_fs(struct net_device *dev);
 
 #define STMMAC_COAL_TIMER(x) (ns_to_ktime((x) * NSEC_PER_USEC))
 
-int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
-{
-	struct plat_stmmacenet_data *plat_dat = priv->plat;
-	int ret;
-
-	if (enabled) {
-		ret = clk_prepare_enable(plat_dat->stmmac_clk);
-		if (ret)
-			return ret;
-		ret = clk_prepare_enable(plat_dat->pclk);
-		if (ret) {
-			clk_disable_unprepare(plat_dat->stmmac_clk);
-			return ret;
-		}
-		if (plat_dat->clks_config) {
-			ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
-			if (ret) {
-				clk_disable_unprepare(plat_dat->stmmac_clk);
-				clk_disable_unprepare(plat_dat->pclk);
-				return ret;
-			}
-		}
-	} else {
-		clk_disable_unprepare(plat_dat->stmmac_clk);
-		clk_disable_unprepare(plat_dat->pclk);
-		if (plat_dat->clks_config)
-			plat_dat->clks_config(plat_dat->bsp_priv, enabled);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
-
 /**
  * stmmac_set_clk_tx_rate() - set the clock rate for the MAC transmit clock
  * @bsp_priv: BSP private data structure (unused)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 712ef235f0f4..27bcaae07a7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -911,6 +911,38 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 
+static int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
+{
+	struct plat_stmmacenet_data *plat_dat = priv->plat;
+	int ret;
+
+	if (enabled) {
+		ret = clk_prepare_enable(plat_dat->stmmac_clk);
+		if (ret)
+			return ret;
+		ret = clk_prepare_enable(plat_dat->pclk);
+		if (ret) {
+			clk_disable_unprepare(plat_dat->stmmac_clk);
+			return ret;
+		}
+		if (plat_dat->clks_config) {
+			ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
+			if (ret) {
+				clk_disable_unprepare(plat_dat->stmmac_clk);
+				clk_disable_unprepare(plat_dat->pclk);
+				return ret;
+			}
+		}
+	} else {
+		clk_disable_unprepare(plat_dat->stmmac_clk);
+		clk_disable_unprepare(plat_dat->pclk);
+		if (plat_dat->clks_config)
+			plat_dat->clks_config(plat_dat->bsp_priv, enabled);
+	}
+
+	return 0;
+}
+
 static int __maybe_unused stmmac_runtime_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
