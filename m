Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1286A42860
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 17:53:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 662A2C7803B;
	Mon, 24 Feb 2025 16:53:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8BA7C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=umYeIPet2tcZyz4GzEekGgRyYmU8ulrysbDkXqBk+Z8=; b=aYpPnCOzBaiW1h9FMViYsO37xl
 uAu9j110cWm/Xiq3L68vMVAL/DIQ+DgbH+Ai8s/Ke4BGIaXTgd01H+Tg0YhFLyrf7okYzaMstmIak
 bwtexRyX/keJy4Fd2U2+3Un/R7HvbQX6GbTfyIs9qDHK5NyBSJiHSv4xLzJnKZc7KcwEuvCWj1b4t
 RSFhlZUsTxvnG6tV9CAJclg6sBxk9uE6ZQ1+3RHN/0miGmM2UY6R+jjUQfn5EBSNWG+e0yAcHpqZi
 ycg5BJmJ5e/AhnaY5qTjU+/7yUYHJ1wTgLNsXV3to29zatZqDhT6QHK3GMsJ999r2LnAFdT68dvpe
 cX9BzIGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36038 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tmbi3-00070W-2M;
 Mon, 24 Feb 2025 16:53:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tmbhj-004vSz-Pt; Mon, 24 Feb 2025 16:53:15 +0000
In-Reply-To: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tmbhj-004vSz-Pt@rmk-PC.armlinux.org.uk>
Date: Mon, 24 Feb 2025 16:53:15 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: dwc-qos: clean
 up clock initialisation
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

Clean up the clock initialisation by providing a helper to find a
named clock in the bulk clocks, and provide the name of the stmmac
clock in match data so we can locate the stmmac clock in generic
code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index acb0a2e1664f..6cadf24a575c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -35,6 +35,16 @@ struct tegra_eqos {
 	struct gpio_desc *reset;
 };
 
+static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
+				    const char *name)
+{
+	for (int i = 0; i < plat_dat->num_clks; i++)
+		if (strcmp(plat_dat->clks[i].id, name) == 0)
+			return plat_dat->clks[i].clk;
+
+	return NULL;
+}
+
 static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 				   struct plat_stmmacenet_data *plat_dat)
 {
@@ -121,12 +131,7 @@ static int dwc_qos_probe(struct platform_device *pdev,
 			 struct plat_stmmacenet_data *plat_dat,
 			 struct stmmac_resources *stmmac_res)
 {
-	for (int i = 0; i < plat_dat->num_clks; i++) {
-		if (strcmp(plat_dat->clks[i].id, "apb_pclk") == 0)
-			plat_dat->stmmac_clk = plat_dat->clks[i].clk;
-		else if (strcmp(plat_dat->clks[i].id, "phy_ref_clk") == 0)
-			plat_dat->pclk = plat_dat->clks[i].clk;
-	}
+	plat_dat->pclk = dwc_eth_find_clk(plat_dat, "phy_ref_clk");
 
 	return 0;
 }
@@ -237,18 +242,12 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 	eqos->dev = &pdev->dev;
 	eqos->regs = res->addr;
+	eqos->clk_slave = plat_dat->stmmac_clk;
 
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	for (int i = 0; i < plat_dat->num_clks; i++) {
-		if (strcmp(plat_dat->clks[i].id, "slave_bus") == 0) {
-			eqos->clk_slave = plat_dat->clks[i].clk;
-			plat_dat->stmmac_clk = eqos->clk_slave;
-		} else if (strcmp(plat_dat->clks[i].id, "tx") == 0) {
-			eqos->clk_tx = plat_dat->clks[i].clk;
-		}
-	}
+	eqos->clk_tx = dwc_eth_find_clk(plat_dat, "tx");
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(eqos->reset)) {
@@ -312,15 +311,18 @@ struct dwc_eth_dwmac_data {
 		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
 	void (*remove)(struct platform_device *pdev);
+	const char *stmmac_clk_name;
 };
 
 static const struct dwc_eth_dwmac_data dwc_qos_data = {
 	.probe = dwc_qos_probe,
+	.stmmac_clk_name = "apb_pclk",
 };
 
 static const struct dwc_eth_dwmac_data tegra_eqos_data = {
 	.probe = tegra_eqos_probe,
 	.remove = tegra_eqos_remove,
+	.stmmac_clk_name = "slave_bus",
 };
 
 static int dwc_eth_dwmac_probe(struct platform_device *pdev)
@@ -360,6 +362,9 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
 
+	plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
+						data->stmmac_clk_name);
+
 	ret = data->probe(pdev, plat_dat, &stmmac_res);
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
