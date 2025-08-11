Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F25B214ED
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 20:52:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED8D7C32E92;
	Mon, 11 Aug 2025 18:52:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A80F3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=59Pd3FU0tcgcZ3oC56LVLpviVCaL5pk/DSBzMzvKgwE=; b=yXD4KX0j8xo623pGxJVTZTRYHu
 25/rTAlri/YlutoT09fF6Owx1hT5gqnP4Mb6y9rVyJdpin0pKKG0JXFsVDzVe04qJuINH1vBr6Ofv
 vmv2lIMrqXIwXhQ0Zr3lYGxBzYm/Z6m1aUvOxGIwULnxN8zBHi4pjIWRahP9B9e0hlxGVeOMatIYj
 9YXhozyeVcbM925UT8YwwpBfou0buxSKEsP3ak4+gxArONBuLOc9Q3LZAxRAk/EF29fYlxbWP8GGW
 Y395LXE1XkSH7ARA9jjfkLiNGdfu2gytHu2cazkre7nytNssV+Waco/tBHOScMoDAhE+a2iWdojcp
 ZnzpaOhg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38374 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ulXcs-0003cJ-1I;
 Mon, 11 Aug 2025 19:52:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ulXc7-008grH-Dh; Mon, 11 Aug 2025 19:51:19 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ulXc7-008grH-Dh@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:51:19 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 8/9] net: stmmac: stm32: convert to
 suspend()/resume() methods
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

Convert stm32 to use the new suspend() and resume() methods rather
than implementing these in custom wrappers around the main driver's
suspend/resume methods. This allows this driver to use the stmmac
simple PM ops structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 68 +++++++------------
 1 file changed, 23 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1eb16eec9c0d..77a04c4579c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -498,6 +498,26 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 	return err;
 }
 
+static int stm32_dwmac_suspend(struct device *dev, void *bsp_priv)
+{
+	struct stm32_dwmac *dwmac = bsp_priv;
+
+	stm32_dwmac_clk_disable(dwmac);
+
+	return dwmac->ops->suspend ? dwmac->ops->suspend(dwmac) : 0;
+}
+
+static int stm32_dwmac_resume(struct device *dev, void *bsp_priv)
+{
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
+	struct stm32_dwmac *dwmac = bsp_priv;
+
+	if (dwmac->ops->resume)
+		dwmac->ops->resume(dwmac);
+
+	return stm32_dwmac_init(priv->plat);
+}
+
 static int stm32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -535,6 +555,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 	plat_dat->bsp_priv = dwmac;
+	plat_dat->suspend = stm32_dwmac_suspend;
+	plat_dat->resume = stm32_dwmac_resume;
 
 	ret = stm32_dwmac_init(plat_dat);
 	if (ret)
@@ -600,50 +622,6 @@ static void stm32mp1_resume(struct stm32_dwmac *dwmac)
 	clk_disable_unprepare(dwmac->clk_ethstp);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int stm32_dwmac_suspend(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct stm32_dwmac *dwmac = priv->plat->bsp_priv;
-
-	int ret;
-
-	ret = stmmac_suspend(dev);
-	if (ret)
-		return ret;
-
-	stm32_dwmac_clk_disable(dwmac);
-
-	if (dwmac->ops->suspend)
-		ret = dwmac->ops->suspend(dwmac);
-
-	return ret;
-}
-
-static int stm32_dwmac_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct stm32_dwmac *dwmac = priv->plat->bsp_priv;
-	int ret;
-
-	if (dwmac->ops->resume)
-		dwmac->ops->resume(dwmac);
-
-	ret = stm32_dwmac_init(priv->plat);
-	if (ret)
-		return ret;
-
-	ret = stmmac_resume(dev);
-
-	return ret;
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(stm32_dwmac_pm_ops,
-	stm32_dwmac_suspend, stm32_dwmac_resume);
-
 static struct stm32_ops stm32mcu_dwmac_data = {
 	.set_mode = stm32mcu_set_mode
 };
@@ -691,7 +669,7 @@ static struct platform_driver stm32_dwmac_driver = {
 	.remove = stm32_dwmac_remove,
 	.driver = {
 		.name           = "stm32-dwmac",
-		.pm		= &stm32_dwmac_pm_ops,
+		.pm		= &stmmac_simple_pm_ops,
 		.of_match_table = stm32_dwmac_match,
 	},
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
