Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17107A81F21
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 10:03:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEC73C78F98;
	Wed,  9 Apr 2025 08:03:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADE05C78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8/xV1cO2oXV+b6Bf/7SmXDB+ZKmv25NuBLYX/vUrYxc=; b=bfE9L77hrHJjWsg2AqAViMnX9S
 wwQqkHYlkwWowvtVlet1lLhxFkSHrLg3Et9ujnLIwKewuWLjiSpfBppTA3iuhEyc/JErOxBe/hICY
 /XE2gbvrCyqLxiW8mMlwD+oZIvurWpd4828MMpHQLnWaOQkDWE8DdaxuNmn7/PtsGG/pEj0vfCn2s
 77bqiSoh0iFcBFgyQQE1IadExhGiulwsLo8Bp0TLDxfOVscbA/UI6yocUG/SWciye7tO1aAqgJp64
 1AJVyZcR8+bF2FqRT/QxAfejVe8mAJFG/c9KWHHq1ykcxF1tb33y+Vd8sh6ldmVN0kLMuudt3P/ny
 sqnvG7bw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39196 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u2QOf-0000Cq-2h;
 Wed, 09 Apr 2025 09:02:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u2QO9-001Rp8-Ii; Wed, 09 Apr 2025 09:02:25 +0100
In-Reply-To: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
References: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u2QO9-001Rp8-Ii@rmk-PC.armlinux.org.uk>
Date: Wed, 09 Apr 2025 09:02:25 +0100
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: dwc-qos: use
 stmmac_pltfr_find_clk()
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c         | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index cd431f84f34f..5db318327d33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -34,16 +34,6 @@ struct tegra_eqos {
 	struct gpio_desc *reset;
 };
 
-static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
-				    const char *name)
-{
-	for (int i = 0; i < plat_dat->num_clks; i++)
-		if (strcmp(plat_dat->clks[i].id, name) == 0)
-			return plat_dat->clks[i].clk;
-
-	return NULL;
-}
-
 static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 				   struct plat_stmmacenet_data *plat_dat)
 {
@@ -132,7 +122,7 @@ static int dwc_qos_probe(struct platform_device *pdev,
 			 struct plat_stmmacenet_data *plat_dat,
 			 struct stmmac_resources *stmmac_res)
 {
-	plat_dat->pclk = dwc_eth_find_clk(plat_dat, "phy_ref_clk");
+	plat_dat->pclk = stmmac_pltfr_find_clk(plat_dat, "phy_ref_clk");
 
 	return 0;
 }
@@ -242,7 +232,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	plat_dat->clk_tx_i = dwc_eth_find_clk(plat_dat, "tx");
+	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(eqos->reset)) {
@@ -362,8 +352,8 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
 
-	plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
-						data->stmmac_clk_name);
+	plat_dat->stmmac_clk = stmmac_pltfr_find_clk(plat_dat,
+						     data->stmmac_clk_name);
 
 	if (data->probe)
 		ret = data->probe(pdev, plat_dat, &stmmac_res);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
