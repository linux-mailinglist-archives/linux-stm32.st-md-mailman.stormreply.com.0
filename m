Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA5B214EB
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 20:52:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF699C32E92;
	Mon, 11 Aug 2025 18:52:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EED3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 18:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kgCvgUS1eQnSBH48NMi+KNzNK1rq2y+DzfaY3NytqvA=; b=Cz8BBGgHAJHQ/tYQmz6RFf6SeJ
 eqNth5e0ze9DbEqG/ItbXMvwknOe49tawRBHWLORiEc0j0TMChfBwvOr6JFx3zv1SwAx6nB3baoZh
 495v7ulilMG6BfB8ntswfdT/4Qb8M6n9B1brUl4VbjbcdXeVqEMQG1X7/gAJBv0fXABD7+Vdb8n5y
 b6Uvy08vgvi0/iH53B6kW71ARvwIxEwgFj7D/ryWTf6QB8aYjU6J4MI99IBGt+HcAMoBhqT0W+tG1
 h2heG9sNlndj78WkQh+b9z+j3wM+6W0OZQpJ/42qENdebcmUUo/D/uK+TpYtHirSv0aVP06CT26F4
 yC+AtWMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38358 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ulXcl-0003c3-0l;
 Mon, 11 Aug 2025 19:51:59 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ulXc2-008grB-9k; Mon, 11 Aug 2025 19:51:14 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ulXc2-008grB-9k@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:51:14 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 7/9] net: stmmac: rk: convert to
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

Convert rk to use the new suspend() and resume() methods rather than
implementing these in custom wrappers around the main driver's
suspend/resume methods. This allows this driver to use the simmac
simple PM ops structure.

We can further simplify the driver as there is no need to track whether
the device was suspended, we only need to check whether the device is
wakeup capable in the resume method. This is because the resume method
will only be called after the suspend method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 58 ++++++++-----------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 79b92130a03f..ac8288301994 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -71,7 +71,6 @@ struct rk_priv_data {
 	phy_interface_t phy_iface;
 	int id;
 	struct regulator *regulator;
-	bool suspended;
 	const struct rk_gmac_ops *ops;
 
 	bool clk_enabled;
@@ -1706,6 +1705,28 @@ static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
 	return -EINVAL;
 }
 
+static int rk_gmac_suspend(struct device *dev, void *bsp_priv_)
+{
+	struct rk_priv_data *bsp_priv = bsp_priv_;
+
+	/* Keep the PHY up if we use Wake-on-Lan. */
+	if (!device_may_wakeup(dev))
+		rk_gmac_powerdown(bsp_priv);
+
+	return 0;
+}
+
+static int rk_gmac_resume(struct device *dev, void *bsp_priv_)
+{
+	struct rk_priv_data *bsp_priv = bsp_priv_;
+
+	/* The PHY was up for Wake-on-Lan. */
+	if (!device_may_wakeup(dev))
+		rk_gmac_powerup(bsp_priv);
+
+	return 0;
+}
+
 static int rk_gmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -1738,6 +1759,8 @@ static int rk_gmac_probe(struct platform_device *pdev)
 
 	plat_dat->get_interfaces = rk_get_interfaces;
 	plat_dat->set_clk_tx_rate = rk_set_clk_tx_rate;
+	plat_dat->suspend = rk_gmac_suspend;
+	plat_dat->resume = rk_gmac_resume;
 
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
 	if (IS_ERR(plat_dat->bsp_priv))
@@ -1772,37 +1795,6 @@ static void rk_gmac_remove(struct platform_device *pdev)
 	rk_gmac_powerdown(bsp_priv);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int rk_gmac_suspend(struct device *dev)
-{
-	struct rk_priv_data *bsp_priv = get_stmmac_bsp_priv(dev);
-	int ret = stmmac_suspend(dev);
-
-	/* Keep the PHY up if we use Wake-on-Lan. */
-	if (!device_may_wakeup(dev)) {
-		rk_gmac_powerdown(bsp_priv);
-		bsp_priv->suspended = true;
-	}
-
-	return ret;
-}
-
-static int rk_gmac_resume(struct device *dev)
-{
-	struct rk_priv_data *bsp_priv = get_stmmac_bsp_priv(dev);
-
-	/* The PHY was up for Wake-on-Lan. */
-	if (bsp_priv->suspended) {
-		rk_gmac_powerup(bsp_priv);
-		bsp_priv->suspended = false;
-	}
-
-	return stmmac_resume(dev);
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(rk_gmac_pm_ops, rk_gmac_suspend, rk_gmac_resume);
-
 static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,px30-gmac",	.data = &px30_ops   },
 	{ .compatible = "rockchip,rk3128-gmac", .data = &rk3128_ops },
@@ -1828,7 +1820,7 @@ static struct platform_driver rk_gmac_dwmac_driver = {
 	.remove = rk_gmac_remove,
 	.driver = {
 		.name           = "rk_gmac-dwmac",
-		.pm		= &rk_gmac_pm_ops,
+		.pm		= &stmmac_simple_pm_ops,
 		.of_match_table = rk_gmac_dwmac_match,
 	},
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
