Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974DA8B568
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 11:32:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C39DC78F81;
	Wed, 16 Apr 2025 09:32:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCD11C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VbzIJjZ9JRmtU3xRpmTgeptOfjJrc8wP+yXsF4MdjLc=; b=hOvvGwKaNJrI53vdcENdKi+/f/
 yli82WgrZJstnsuP4VqAc1IK1x10JwdCgV1ozWc0ly0BmMLKVC4W++4qs6v2OHa0ln86L16N7CgBj
 Cn20lqaGxOT8YlqVm0jS14Ohj+zDZZfvAq4ZOE97Jnia6MvmpKkyzMrfTH48ae/v1b0jkJLYebYgj
 1EqxIifcWd41+XtKhGLwzrxSk0BCx8AEOtCcTO1j/PEFwZ9t6SpuoIrY9/tT8ko4zgYauOb8i3cXq
 Sk/3sMt5wJAG8M+3+xSc+nAsxZybhnM4+HMzOMaVEIE0XcWZOm4Tqo0sVYQ4s0yFAX8ZLfH4q3n4J
 D2tMWjgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38772 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4z7q-0000z3-24;
 Wed, 16 Apr 2025 10:32:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4z7F-000xBo-26; Wed, 16 Apr 2025 10:31:33 +0100
In-Reply-To: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
References: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4z7F-000xBo-26@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 10:31:33 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/5] net: stmmac: socfpga: convert
 to stmmac_pltfr_pm_ops
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

Convert socfpga to use the generic stmmac_pltfr_pm_ops, which can be
achieved by adding an appropriate plat_dat->init function to do the
setup.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 39 +------------------
 1 file changed, 2 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 000d349a6d4c..69ffc52c0275 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -493,6 +493,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
+	plat_dat->init = socfpga_dwmac_init;
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
@@ -516,42 +517,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int socfpga_dwmac_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct socfpga_dwmac *dwmac_priv = get_stmmac_bsp_priv(dev);
-
-	socfpga_dwmac_init(to_platform_device(dev), dwmac_priv);
-
-	return stmmac_resume(dev);
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static int __maybe_unused socfpga_dwmac_runtime_suspend(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	stmmac_bus_clks_config(priv, false);
-
-	return 0;
-}
-
-static int __maybe_unused socfpga_dwmac_runtime_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	return stmmac_bus_clks_config(priv, true);
-}
-
-static const struct dev_pm_ops socfpga_dwmac_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stmmac_suspend, socfpga_dwmac_resume)
-	SET_RUNTIME_PM_OPS(socfpga_dwmac_runtime_suspend, socfpga_dwmac_runtime_resume, NULL)
-};
-
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
 	.set_phy_mode = socfpga_gen5_set_phy_mode,
 };
@@ -572,7 +537,7 @@ static struct platform_driver socfpga_dwmac_driver = {
 	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "socfpga-dwmac",
-		.pm		= &socfpga_dwmac_pm_ops,
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table = socfpga_dwmac_match,
 	},
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
