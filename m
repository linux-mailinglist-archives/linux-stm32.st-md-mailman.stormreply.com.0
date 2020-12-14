Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC702D94BC
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 10:16:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E7A3C57163;
	Mon, 14 Dec 2020 09:16:43 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BECCC57165
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Dec 2020 09:16:39 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 14 Dec 2020 12:16:12 +0300
Message-ID: <20201214091616.13545-23-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH 22/25] net: stmmac: dwmac-imx: Discard Tx
	clock request
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

Since the Tx clock is now requested and enabled/disabled in the STMMAC
DT-based platform config method, there is no need in duplicating the same
procedures in the DW MAC iMX sub-driver.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 21 +++++--------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index efef5476a577..7b4590670b4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -40,7 +40,6 @@ struct imx_dwmac_ops {
 
 struct imx_priv_data {
 	struct device *dev;
-	struct clk *clk_tx;
 	struct clk *clk_mem;
 	struct regmap *intf_regmap;
 	u32 intf_reg_off;
@@ -104,12 +103,6 @@ static int imx_dwmac_init(struct platform_device *pdev, void *priv)
 		return ret;
 	}
 
-	ret = clk_prepare_enable(dwmac->clk_tx);
-	if (ret) {
-		dev_err(&pdev->dev, "tx clock enable failed\n");
-		goto clk_tx_en_failed;
-	}
-
 	if (dwmac->ops->set_intf_mode) {
 		ret = dwmac->ops->set_intf_mode(plat_dat);
 		if (ret)
@@ -119,8 +112,6 @@ static int imx_dwmac_init(struct platform_device *pdev, void *priv)
 	return 0;
 
 intf_mode_failed:
-	clk_disable_unprepare(dwmac->clk_tx);
-clk_tx_en_failed:
 	clk_disable_unprepare(dwmac->clk_mem);
 	return ret;
 }
@@ -129,7 +120,6 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
 {
 	struct imx_priv_data *dwmac = priv;
 
-	clk_disable_unprepare(dwmac->clk_tx);
 	clk_disable_unprepare(dwmac->clk_mem);
 }
 
@@ -162,7 +152,7 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed)
 		return;
 	}
 
-	err = clk_set_rate(dwmac->clk_tx, rate);
+	err = clk_set_rate(plat_dat->tx_clk, rate);
 	if (err < 0)
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
@@ -176,10 +166,9 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 	if (of_get_property(np, "snps,rmii_refclk_ext", NULL))
 		dwmac->rmii_refclk_ext = true;
 
-	dwmac->clk_tx = devm_clk_get(dev, "tx");
-	if (IS_ERR(dwmac->clk_tx)) {
-		dev_err(dev, "failed to get tx clock\n");
-		return PTR_ERR(dwmac->clk_tx);
+	if (!dwmac->plat_dat->tx_clk) {
+		dev_err(dev, "no tx clock found\n");
+		return -EINVAL;
 	}
 
 	dwmac->clk_mem = NULL;
@@ -239,6 +228,7 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 
 	dwmac->ops = data;
 	dwmac->dev = &pdev->dev;
+	dwmac->plat_dat = plat_dat;
 
 	ret = imx_dwmac_parse_dt(dwmac, &pdev->dev);
 	if (ret) {
@@ -257,7 +247,6 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	plat_dat->exit = imx_dwmac_exit;
 	plat_dat->fix_mac_speed = imx_dwmac_fix_speed;
 	plat_dat->bsp_priv = dwmac;
-	dwmac->plat_dat = plat_dat;
 
 	ret = imx_dwmac_init(pdev, dwmac);
 	if (ret)
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
