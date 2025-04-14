Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E8A887C6
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 17:51:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D495C78028;
	Mon, 14 Apr 2025 15:51:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 119A0C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bbXV7Jz6WVrITK8Rs8Q4HW4Bd6iCFtQ/awDMcDecl1w=; b=qhVjvgGHXjNDAvZ4HJXz0AbBNl
 RiHSjoIDbWdlCw2DVdJuC04xFJXIbLimHZTYMOp3IB1Acqtyl2KkqQPeT2uSyT10Rm/djAuowFmQ3
 peHZeVjM2K9bVfAQVmq/NFO7/9lAdYr5iEGgjgNYf4i9VOoeIkDDIVfOsV1tifk64oQIij1sbnH2d
 4XhoWlUlJ7hx86y4A0QUQM9WSKfhJtYEuLke63itNtl/mxQFggZ0Jiu0G2OqfNEpkxNrkZcn2WzuT
 Cm0A9riejTsK3Vg2+eqxL6AW/5ib6InnZfMZa6ECE/olhIrDVDUM0qZdSQTMFi7HX1uBJfd21TLRK
 YLZDWqOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47054 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4M5y-0006o9-1L;
 Mon, 14 Apr 2025 16:51:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4M5N-000YGD-5i; Mon, 14 Apr 2025 16:51:01 +0100
In-Reply-To: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4M5N-000YGD-5i@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 16:51:01 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: ingenic: convert to
 stmmac_pltfr_pm_ops
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

Convert the Ingenic glue driver to use the generic stmmac platform
power management operations.

In order to do this, we need to make ingenic_mac_init() arguments
compatible with plat_dat->init() by adding a plat_dat member to struct
ingenic_mac. This allows the custom suspend/resume operations to be
removed, and the PM ops pointer replaced with stmmac_pltfr_pm_ops.

This will adds runtime PM and noirq suspend/resume ops to this driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 41 ++++---------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 066783d66422..607e467324a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -56,6 +56,7 @@ enum ingenic_mac_version {
 
 struct ingenic_mac {
 	const struct ingenic_soc_info *soc_info;
+	struct plat_stmmacenet_data *plat_dat;
 	struct device *dev;
 	struct regmap *regmap;
 
@@ -70,13 +71,13 @@ struct ingenic_soc_info {
 	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
 };
 
-static int ingenic_mac_init(struct plat_stmmacenet_data *plat_dat)
+static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
+	struct ingenic_mac *mac = bsp_priv;
 	int ret;
 
 	if (mac->soc_info->set_mode) {
-		ret = mac->soc_info->set_mode(plat_dat);
+		ret = mac->soc_info->set_mode(mac->plat_dat);
 		if (ret)
 			return ret;
 	}
@@ -284,44 +285,18 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 
 	mac->soc_info = data;
 	mac->dev = &pdev->dev;
+	mac->plat_dat = plat_dat;
 
 	plat_dat->bsp_priv = mac;
+	plat_dat->init = ingenic_mac_init;
 
-	ret = ingenic_mac_init(plat_dat);
+	ret = ingenic_mac_init(pdev, mac);
 	if (ret)
 		return ret;
 
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int ingenic_mac_suspend(struct device *dev)
-{
-	int ret;
-
-	ret = stmmac_suspend(dev);
-
-	return ret;
-}
-
-static int ingenic_mac_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	int ret;
-
-	ret = ingenic_mac_init(priv->plat);
-	if (ret)
-		return ret;
-
-	ret = stmmac_resume(dev);
-
-	return ret;
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(ingenic_mac_pm_ops, ingenic_mac_suspend, ingenic_mac_resume);
-
 static struct ingenic_soc_info jz4775_soc_info = {
 	.version = ID_JZ4775,
 	.mask = MACPHYC_TXCLK_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
@@ -373,7 +348,7 @@ static struct platform_driver ingenic_mac_driver = {
 	.remove		= stmmac_pltfr_remove,
 	.driver		= {
 		.name	= "ingenic-mac",
-		.pm		= pm_ptr(&ingenic_mac_pm_ops),
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table = ingenic_mac_of_matches,
 	},
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
