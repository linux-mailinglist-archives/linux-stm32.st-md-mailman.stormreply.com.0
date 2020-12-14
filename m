Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B392D94BD
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 10:16:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CCFFC5716C;
	Mon, 14 Dec 2020 09:16:43 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1E49C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Dec 2020 09:16:41 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 14 Dec 2020 12:16:15 +0300
Message-ID: <20201214091616.13545-26-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH 25/25] net: stmmac: dwc-qos: Save master/slave
	clocks in the plat-data
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

Currently the "master_bus" clock of the DW QoS Eth controller isn't
preserved in the STMMAC platform data, while the "slave_bus" clock is
assigned to the stmmaceth clock pointer. It isn't correct from the
platform clock bindings point of view. The "stmmaceth" clock is supposed
to be the system clock, which is responsible for clocking the DMA
transfers from/to the controller FIFOs to/from the system memory and the
CSR interface if the later isn't separately clocked. If it's clocked
separately then the STMMAC platform code expects to also have "pclk"
specified. So in order to have the STMMAC platform data properly
initialized we need to set the "master_bus" clock handler to the
"stmmaceth" clock pointer, and the "slave_bus" clock handler to the "pclk"
clock pointer.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index f53a78448988..b90d7e4c3d4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -315,6 +315,8 @@ static void *tegra_eqos_probe(struct platform_device *pdev,
 	if (err < 0)
 		goto error;
 
+	data->stmmac_clk = eqos->clk_master;
+
 	eqos->clk_slave = devm_clk_get(&pdev->dev, "slave_bus");
 	if (IS_ERR(eqos->clk_slave)) {
 		err = PTR_ERR(eqos->clk_slave);
@@ -325,7 +327,7 @@ static void *tegra_eqos_probe(struct platform_device *pdev,
 	if (err < 0)
 		goto disable_master;
 
-	data->stmmac_clk = eqos->clk_slave;
+	data->pclk = eqos->clk_slave;
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(eqos->reset)) {
@@ -375,9 +377,10 @@ static void *tegra_eqos_probe(struct platform_device *pdev,
 	gpiod_set_value(eqos->reset, 1);
 disable_slave:
 	clk_disable_unprepare(eqos->clk_slave);
-	data->stmmac_clk = NULL;
+	data->pclk = NULL;
 disable_master:
 	clk_disable_unprepare(eqos->clk_master);
+	data->stmmac_clk = NULL;
 error:
 	eqos = ERR_PTR(err);
 	goto out;
@@ -397,6 +400,7 @@ static int tegra_eqos_remove(struct platform_device *pdev)
 	 * data so the stmmac_remove_config_dt() method wouldn't have disabled
 	 * the clocks too.
 	 */
+	priv->plat->pclk = NULL;
 	priv->plat->stmmac_clk = NULL;
 
 	return 0;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
