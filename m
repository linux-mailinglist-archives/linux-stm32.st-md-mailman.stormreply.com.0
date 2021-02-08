Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F59E3133EF
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 14:56:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C82AAC57B69;
	Mon,  8 Feb 2021 13:56:21 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFCEBC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:56:19 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 16:55:56 +0300
Message-ID: <20210208135609.7685-13-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 12/24] net: stmmac: Directly call reverse
	methods in stmmac_probe_config_dt()
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

Calling an antagonistic method from the corresponding protagonist isn't
good from maintainability point of view, since prevents us from directly
adding a functionality in the later, which needs to be reverted in the
former. Since that's what we are about to do in order to fix the commit
573c0b9c4e0 ("stmmac: move stmmac_clk, pclk, clk_ptp_ref and stmmac_rst to
platform structure"), let's replace the stmmac_remove_config_dt() method
invocation in stmmac_probe_config_dt() with direct reversal procedures.

Fixes: f573c0b9c4e0 ("stmmac: move stmmac_clk, pclk, clk_ptp_ref and stmmac_rst to platform structure")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 1815fe36b62f..c9feac70ca77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -402,7 +402,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	struct device_node *np = pdev->dev.of_node;
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_dma_cfg *dma_cfg;
-	void *ret;
 	int rc;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
@@ -458,7 +457,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	/* To Configure PHY by using all device-tree supported properties */
 	rc = stmmac_dt_phy(plat, np, &pdev->dev);
 	if (rc)
-		return ERR_PTR(rc);
+		goto error_dt_phy_parse;
 
 	of_property_read_u32(np, "tx-fifo-depth", &plat->tx_fifo_size);
 
@@ -536,8 +535,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
 			       GFP_KERNEL);
 	if (!dma_cfg) {
-		stmmac_remove_config_dt(pdev, plat);
-		return ERR_PTR(-ENOMEM);
+		rc = -ENOMEM;
+		goto error_dma_cfg_alloc;
 	}
 	plat->dma_cfg = dma_cfg;
 
@@ -564,10 +563,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	plat->axi = stmmac_axi_setup(pdev);
 
 	rc = stmmac_mtl_setup(pdev, plat);
-	if (rc) {
-		stmmac_remove_config_dt(pdev, plat);
-		return ERR_PTR(rc);
-	}
+	if (rc)
+		goto error_dma_cfg_alloc;
 
 	/* clock setup */
 	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
@@ -582,7 +579,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 
 	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
 	if (IS_ERR(plat->pclk)) {
-		ret = plat->pclk;
+		rc = PTR_ERR(plat->pclk);
 		goto error_pclk_get;
 	}
 	clk_prepare_enable(plat->pclk);
@@ -601,7 +598,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
 							   STMMAC_RESOURCE_NAME);
 	if (IS_ERR(plat->stmmac_rst)) {
-		ret = plat->stmmac_rst;
+		rc = PTR_ERR(plat->stmmac_rst);
 		goto error_hw_init;
 	}
 
@@ -611,8 +608,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	clk_disable_unprepare(plat->pclk);
 error_pclk_get:
 	clk_disable_unprepare(plat->stmmac_clk);
+error_dma_cfg_alloc:
+	of_node_put(plat->mdio_node);
+error_dt_phy_parse:
+	of_node_put(plat->phy_node);
 
-	return ret;
+	return ERR_PTR(rc);
 }
 
 /**
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
