Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E1A423B1
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 15:47:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F00DC7803B;
	Mon, 24 Feb 2025 14:47:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A889C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mi3v7W3xohiNhzfx1zdXOCiB1GcuHJ50d4F7oExM8oE=; b=n1xkgTjyl1qyBZRbsSJiIJsPev
 O6Y2AI4lKUm7saWzGEkr5vvnkQZ87JxDiky3DcW+lpBUBlfkGFa40nFWR9GIuPS4xtaNt9LU4BdTv
 Dhq9OHFUDpo+sH17osaHDAgUaRA9NqzOYic62KqlqpGJNRcTBUk+DncrFa5g+Oiurlfa/l9OmOLff
 y5Q31IYusmAvpIs7/3OlUQnwcX8KbFUKNgHWedGS3OUSl7mIP6i2BgbgEI9H8A/BIVa4T2FEB2StM
 Lv3dnY7fSzRxzfE2dDd4ljR+MmEgCJygs3HtTfcIUSrQCOtJ54J7ZVdZ19JeSEiJ6qB/um3OaeQaz
 WHVB1NKQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42810 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tmZk5-0006fi-3D;
 Mon, 24 Feb 2025 14:47:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tmZjm-004uJJ-4e; Mon, 24 Feb 2025 14:47:14 +0000
In-Reply-To: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
References: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tmZjm-004uJJ-4e@rmk-PC.armlinux.org.uk>
Date: Mon, 24 Feb 2025 14:47:14 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: dwc-qos: name
 struct plat_stmmacenet_data consistently
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

Most of the stmmac driver uses "plat_dat" to name the platform data,
and "data" is used for the glue driver data. make dwc-qos follow
this pattern to avoid silly mistakes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 392574bdd4a4..acb0a2e1664f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -224,7 +224,7 @@ static int tegra_eqos_init(struct platform_device *pdev, void *priv)
 }
 
 static int tegra_eqos_probe(struct platform_device *pdev,
-			    struct plat_stmmacenet_data *data,
+			    struct plat_stmmacenet_data *plat_dat,
 			    struct stmmac_resources *res)
 {
 	struct device *dev = &pdev->dev;
@@ -241,12 +241,12 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	for (int i = 0; i < data->num_clks; i++) {
-		if (strcmp(data->clks[i].id, "slave_bus") == 0) {
-			eqos->clk_slave = data->clks[i].clk;
-			data->stmmac_clk = eqos->clk_slave;
-		} else if (strcmp(data->clks[i].id, "tx") == 0) {
-			eqos->clk_tx = data->clks[i].clk;
+	for (int i = 0; i < plat_dat->num_clks; i++) {
+		if (strcmp(plat_dat->clks[i].id, "slave_bus") == 0) {
+			eqos->clk_slave = plat_dat->clks[i].clk;
+			plat_dat->stmmac_clk = eqos->clk_slave;
+		} else if (strcmp(plat_dat->clks[i].id, "tx") == 0) {
+			eqos->clk_tx = plat_dat->clks[i].clk;
 		}
 	}
 
@@ -260,7 +260,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	gpiod_set_value(eqos->reset, 0);
 
 	/* MDIO bus was already reset just above */
-	data->mdio_bus_data->needs_reset = false;
+	plat_dat->mdio_bus_data->needs_reset = false;
 
 	eqos->rst = devm_reset_control_get(&pdev->dev, "eqos");
 	if (IS_ERR(eqos->rst)) {
@@ -281,10 +281,10 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	usleep_range(2000, 4000);
 
 bypass_clk_reset_gpio:
-	data->fix_mac_speed = tegra_eqos_fix_speed;
-	data->init = tegra_eqos_init;
-	data->bsp_priv = eqos;
-	data->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->fix_mac_speed = tegra_eqos_fix_speed;
+	plat_dat->init = tegra_eqos_init;
+	plat_dat->bsp_priv = eqos;
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
 
 	err = tegra_eqos_init(pdev, eqos);
 	if (err < 0)
@@ -309,7 +309,7 @@ static void tegra_eqos_remove(struct platform_device *pdev)
 
 struct dwc_eth_dwmac_data {
 	int (*probe)(struct platform_device *pdev,
-		     struct plat_stmmacenet_data *data,
+		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
 	void (*remove)(struct platform_device *pdev);
 };
@@ -387,15 +387,15 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 {
 	const struct dwc_eth_dwmac_data *data = device_get_match_data(&pdev->dev);
-	struct plat_stmmacenet_data *plat_data = dev_get_platdata(&pdev->dev);
+	struct plat_stmmacenet_data *plat_dat = dev_get_platdata(&pdev->dev);
 
 	stmmac_dvr_remove(&pdev->dev);
 
 	if (data->remove)
 		data->remove(pdev);
 
-	if (plat_data)
-		clk_bulk_disable_unprepare(plat_data->num_clks, plat_data->clks);
+	if (plat_dat)
+		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
 }
 
 static const struct of_device_id dwc_eth_dwmac_match[] = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
