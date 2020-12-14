Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9282D94B5
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 10:16:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37266C57163;
	Mon, 14 Dec 2020 09:16:39 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45FC8C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Dec 2020 09:16:35 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 14 Dec 2020 12:16:08 +0300
Message-ID: <20201214091616.13545-19-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 18/25] net: stmmac: dwc-qos: Cleanup STMMAC
	platform data clock pointers
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

The pointers need to be nullified otherwise the stmmac_remove_config_dt()
method called after them being initialized will disable the clocks. That
then will cause a WARN() backtrace being printed since the clocks would be
also disabled in the locally defined remove method.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 42 ++++++++++++++-----
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 2342d497348e..31ca299a1cfd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -123,39 +123,46 @@ static void *dwc_qos_probe(struct platform_device *pdev,
 			   struct plat_stmmacenet_data *plat_dat,
 			   struct stmmac_resources *stmmac_res)
 {
+	struct clk *clk;
 	int err;
 
-	plat_dat->stmmac_clk = devm_clk_get(&pdev->dev, "apb_pclk");
-	if (IS_ERR(plat_dat->stmmac_clk)) {
+	clk = devm_clk_get(&pdev->dev, "apb_pclk");
+	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "apb_pclk clock not found.\n");
-		return ERR_CAST(plat_dat->stmmac_clk);
+		return ERR_CAST(clk);
 	}
 
-	err = clk_prepare_enable(plat_dat->stmmac_clk);
+	err = clk_prepare_enable(clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable apb_pclk clock: %d\n",
 			err);
 		return ERR_PTR(err);
 	}
 
-	plat_dat->pclk = devm_clk_get(&pdev->dev, "phy_ref_clk");
-	if (IS_ERR(plat_dat->pclk)) {
+	plat_dat->stmmac_clk = clk;
+
+	clk = devm_clk_get(&pdev->dev, "phy_ref_clk");
+	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "phy_ref_clk clock not found.\n");
-		err = PTR_ERR(plat_dat->pclk);
+		err = PTR_ERR(clk);
 		goto disable;
 	}
 
-	err = clk_prepare_enable(plat_dat->pclk);
+	err = clk_prepare_enable(clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable phy_ref clock: %d\n",
 			err);
 		goto disable;
 	}
 
+	plat_dat->pclk = clk;
+
 	return NULL;
 
 disable:
 	clk_disable_unprepare(plat_dat->stmmac_clk);
+	plat_dat->stmmac_clk = NULL;
+
 	return ERR_PTR(err);
 }
 
@@ -164,8 +171,15 @@ static int dwc_qos_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
+	/* Cleanup the pointers to the clock handlers hidden in the platform
+	 * data so the stmmac_remove_config_dt() method wouldn't have disabled
+	 * the clocks too.
+	 */
 	clk_disable_unprepare(priv->plat->pclk);
+	priv->plat->pclk = NULL;
+
 	clk_disable_unprepare(priv->plat->stmmac_clk);
+	priv->plat->stmmac_clk = NULL;
 
 	return 0;
 }
@@ -303,12 +317,12 @@ static void *tegra_eqos_probe(struct platform_device *pdev,
 		goto disable_master;
 	}
 
-	data->stmmac_clk = eqos->clk_slave;
-
 	err = clk_prepare_enable(eqos->clk_slave);
 	if (err < 0)
 		goto disable_master;
 
+	data->stmmac_clk = eqos->clk_slave;
+
 	eqos->clk_rx = devm_clk_get(&pdev->dev, "rx");
 	if (IS_ERR(eqos->clk_rx)) {
 		err = PTR_ERR(eqos->clk_rx);
@@ -381,6 +395,7 @@ static void *tegra_eqos_probe(struct platform_device *pdev,
 	clk_disable_unprepare(eqos->clk_rx);
 disable_slave:
 	clk_disable_unprepare(eqos->clk_slave);
+	data->stmmac_clk = NULL;
 disable_master:
 	clk_disable_unprepare(eqos->clk_master);
 error:
@@ -390,6 +405,7 @@ static void *tegra_eqos_probe(struct platform_device *pdev,
 
 static int tegra_eqos_remove(struct platform_device *pdev)
 {
+	struct stmmac_priv *priv = netdev_priv(platform_get_drvdata(pdev));
 	struct tegra_eqos *eqos = get_stmmac_bsp_priv(&pdev->dev);
 
 	reset_control_assert(eqos->rst);
@@ -399,6 +415,12 @@ static int tegra_eqos_remove(struct platform_device *pdev)
 	clk_disable_unprepare(eqos->clk_slave);
 	clk_disable_unprepare(eqos->clk_master);
 
+	/* Cleanup the pointers to the clock handlers hidden in the platform
+	 * data so the stmmac_remove_config_dt() method wouldn't have disabled
+	 * the clocks too.
+	 */
+	priv->plat->stmmac_clk = NULL;
+
 	return 0;
 }
 
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
