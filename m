Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D92973133F7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 14:56:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06F5BC57B55;
	Mon,  8 Feb 2021 13:56:29 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D49DDC57B56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:56:25 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 16:56:04 +0300
Message-ID: <20210208135609.7685-21-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH v2 20/24] net: stmmac: dwc-qos: Discard Tx/Rx
	clocks request
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

Since the Tx/Rx clocks with the same names are now requested and
enabled/disabled in the STMMAC DT-based platform config method, there is
no need in duplicating the same procedures in the DWC QoS Eth sub-driver.
Discard it then, but make sure the denoted clocks have been specified
for the platform.

Note also the deprecated clock "phy_ref_clk" have been defined as the Tx
clock in the DWC QoS Eth bindings. Let's use a pointer to the Tx clock
defined in the platform data then instead of the unrelated pclk pointer.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 44 +++++--------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index b71f0c3faebe..f315ca395e12 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -31,8 +31,6 @@ struct tegra_eqos {
 	struct reset_control *rst;
 	struct clk *clk_master;
 	struct clk *clk_slave;
-	struct clk *clk_tx;
-	struct clk *clk_rx;
 
 	struct gpio_desc *reset;
 };
@@ -155,7 +153,7 @@ static int dwc_qos_probe(struct platform_device *pdev,
 		goto disable;
 	}
 
-	plat_dat->pclk = clk;
+	plat_dat->tx_clk = clk;
 
 	return 0;
 
@@ -175,8 +173,8 @@ static int dwc_qos_remove(struct platform_device *pdev)
 	 * data so the stmmac_remove_config_dt() method wouldn't have disabled
 	 * the clocks too.
 	 */
-	clk_disable_unprepare(priv->plat->pclk);
-	priv->plat->pclk = NULL;
+	clk_disable_unprepare(priv->plat->tx_clk);
+	priv->plat->tx_clk = NULL;
 
 	clk_disable_unprepare(priv->plat->stmmac_clk);
 	priv->plat->stmmac_clk = NULL;
@@ -197,6 +195,7 @@ static int dwc_qos_remove(struct platform_device *pdev)
 static void tegra_eqos_fix_speed(void *priv, unsigned int speed)
 {
 	struct tegra_eqos *eqos = priv;
+	struct stmmac_priv *sp = netdev_priv(dev_get_drvdata(eqos->dev));
 	unsigned long rate = 125000000;
 	bool needs_calibration = false;
 	u32 value;
@@ -262,7 +261,7 @@ static void tegra_eqos_fix_speed(void *priv, unsigned int speed)
 		writel(value, eqos->regs + AUTO_CAL_CONFIG);
 	}
 
-	err = clk_set_rate(eqos->clk_tx, rate);
+	err = clk_set_rate(sp->plat->tx_clk, rate);
 	if (err < 0)
 		dev_err(eqos->dev, "failed to set TX rate: %d\n", err);
 }
@@ -299,6 +298,11 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
+	if (!data->tx_clk || !data->rx_clk) {
+		err = -EINVAL;
+		goto error;
+	}
+
 	eqos->clk_master = devm_clk_get(&pdev->dev, "master_bus");
 	if (IS_ERR(eqos->clk_master)) {
 		err = PTR_ERR(eqos->clk_master);
@@ -321,30 +325,10 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 	data->stmmac_clk = eqos->clk_slave;
 
-	eqos->clk_rx = devm_clk_get(&pdev->dev, "rx");
-	if (IS_ERR(eqos->clk_rx)) {
-		err = PTR_ERR(eqos->clk_rx);
-		goto disable_slave;
-	}
-
-	err = clk_prepare_enable(eqos->clk_rx);
-	if (err < 0)
-		goto disable_slave;
-
-	eqos->clk_tx = devm_clk_get(&pdev->dev, "tx");
-	if (IS_ERR(eqos->clk_tx)) {
-		err = PTR_ERR(eqos->clk_tx);
-		goto disable_rx;
-	}
-
-	err = clk_prepare_enable(eqos->clk_tx);
-	if (err < 0)
-		goto disable_rx;
-
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(eqos->reset)) {
 		err = PTR_ERR(eqos->reset);
-		goto disable_tx;
+		goto disable_slave;
 	}
 
 	usleep_range(2000, 4000);
@@ -385,10 +369,6 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	reset_control_assert(eqos->rst);
 reset_phy:
 	gpiod_set_value(eqos->reset, 1);
-disable_tx:
-	clk_disable_unprepare(eqos->clk_tx);
-disable_rx:
-	clk_disable_unprepare(eqos->clk_rx);
 disable_slave:
 	clk_disable_unprepare(eqos->clk_slave);
 	data->stmmac_clk = NULL;
@@ -405,8 +385,6 @@ static int tegra_eqos_remove(struct platform_device *pdev)
 
 	reset_control_assert(eqos->rst);
 	gpiod_set_value(eqos->reset, 1);
-	clk_disable_unprepare(eqos->clk_tx);
-	clk_disable_unprepare(eqos->clk_rx);
 	clk_disable_unprepare(eqos->clk_slave);
 	clk_disable_unprepare(eqos->clk_master);
 
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
