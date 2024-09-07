Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196096FF91
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 05:10:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDC2AC78034;
	Sat,  7 Sep 2024 03:10:49 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0D96C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2024 03:10:47 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4X0ylm10dwz69NV;
 Sat,  7 Sep 2024 11:10:44 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 906F0180064;
 Sat,  7 Sep 2024 11:10:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:44 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <florian.fainelli@broadcom.com>, <andrew@lunn.ch>,
 <olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
 <yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>, 
 <ilpo.jarvinen@linux.intel.com>, <ruanjinjie@huawei.com>,
 <lizetao1@huawei.com>, <hverkuil-cisco@xs4all.nl>,
 <u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
 <jacob.e.keller@intel.com>
Date: Sat, 7 Sep 2024 11:19:24 +0800
Message-ID: <20240907031926.3591353-9-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907031926.3591353-1-lizetao1@huawei.com>
References: <20240907031926.3591353-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 08/10] net: stmmac:
	dwmac-dwc-qos-eth: Convert using devm_clk_get_enabled() in
	dwc_qos_probe()
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

Use devm_clk_get_enabled() instead of devm_clk_get() +
clk_prepare_enable(), which can make the clk consistent with the device
life cycle and reduce the risk of unreleased clk resources. Since the
device framework has automatically released the clk resource, there is
no need to execute clk_disable_unprepare(clk) on the error path, drop
the disable label, and the original error process can return directly.

The tegra_eqos_probe() also has similar modifications.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 98 ++++---------------
 1 file changed, 17 insertions(+), 81 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index ec924c6c76c6..d6e9a93771f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -123,49 +123,24 @@ static int dwc_qos_probe(struct platform_device *pdev,
 			 struct plat_stmmacenet_data *plat_dat,
 			 struct stmmac_resources *stmmac_res)
 {
-	int err;
-
-	plat_dat->stmmac_clk = devm_clk_get(&pdev->dev, "apb_pclk");
+	plat_dat->stmmac_clk = devm_clk_get_enabled(&pdev->dev, "apb_pclk");
 	if (IS_ERR(plat_dat->stmmac_clk)) {
 		dev_err(&pdev->dev, "apb_pclk clock not found.\n");
 		return PTR_ERR(plat_dat->stmmac_clk);
 	}
 
-	err = clk_prepare_enable(plat_dat->stmmac_clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable apb_pclk clock: %d\n",
-			err);
-		return err;
-	}
-
-	plat_dat->pclk = devm_clk_get(&pdev->dev, "phy_ref_clk");
+	plat_dat->pclk = devm_clk_get_enabled(&pdev->dev, "phy_ref_clk");
 	if (IS_ERR(plat_dat->pclk)) {
 		dev_err(&pdev->dev, "phy_ref_clk clock not found.\n");
-		err = PTR_ERR(plat_dat->pclk);
-		goto disable;
-	}
-
-	err = clk_prepare_enable(plat_dat->pclk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable phy_ref clock: %d\n",
-			err);
-		goto disable;
+		return PTR_ERR(plat_dat->pclk);
 	}
 
 	return 0;
-
-disable:
-	clk_disable_unprepare(plat_dat->stmmac_clk);
-	return err;
 }
 
 static void dwc_qos_remove(struct platform_device *pdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	clk_disable_unprepare(priv->plat->pclk);
-	clk_disable_unprepare(priv->plat->stmmac_clk);
 }
 
 #define SDMEMCOMPPADCTRL 0x8800
@@ -283,53 +258,27 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	eqos->clk_master = devm_clk_get(&pdev->dev, "master_bus");
-	if (IS_ERR(eqos->clk_master)) {
-		err = PTR_ERR(eqos->clk_master);
-		goto error;
-	}
+	eqos->clk_master = devm_clk_get_enabled(&pdev->dev, "master_bus");
+	if (IS_ERR(eqos->clk_master))
+		return PTR_ERR(eqos->clk_master);
 
-	err = clk_prepare_enable(eqos->clk_master);
-	if (err < 0)
-		goto error;
-
-	eqos->clk_slave = devm_clk_get(&pdev->dev, "slave_bus");
-	if (IS_ERR(eqos->clk_slave)) {
-		err = PTR_ERR(eqos->clk_slave);
-		goto disable_master;
-	}
+	eqos->clk_slave = devm_clk_get_enabled(&pdev->dev, "slave_bus");
+	if (IS_ERR(eqos->clk_slave))
+		return PTR_ERR(eqos->clk_slave);
 
 	data->stmmac_clk = eqos->clk_slave;
 
-	err = clk_prepare_enable(eqos->clk_slave);
-	if (err < 0)
-		goto disable_master;
-
-	eqos->clk_rx = devm_clk_get(&pdev->dev, "rx");
-	if (IS_ERR(eqos->clk_rx)) {
-		err = PTR_ERR(eqos->clk_rx);
-		goto disable_slave;
-	}
-
-	err = clk_prepare_enable(eqos->clk_rx);
-	if (err < 0)
-		goto disable_slave;
+	eqos->clk_rx = devm_clk_get_enabled(&pdev->dev, "rx");
+	if (IS_ERR(eqos->clk_rx))
+		return PTR_ERR(eqos->clk_rx);
 
-	eqos->clk_tx = devm_clk_get(&pdev->dev, "tx");
-	if (IS_ERR(eqos->clk_tx)) {
-		err = PTR_ERR(eqos->clk_tx);
-		goto disable_rx;
-	}
-
-	err = clk_prepare_enable(eqos->clk_tx);
-	if (err < 0)
-		goto disable_rx;
+	eqos->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(eqos->clk_tx))
+		return PTR_ERR(eqos->clk_tx);
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(eqos->reset)) {
-		err = PTR_ERR(eqos->reset);
-		goto disable_tx;
-	}
+	if (IS_ERR(eqos->reset))
+		return PTR_ERR(eqos->reset);
 
 	usleep_range(2000, 4000);
 	gpiod_set_value(eqos->reset, 0);
@@ -370,15 +319,6 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	reset_control_assert(eqos->rst);
 reset_phy:
 	gpiod_set_value(eqos->reset, 1);
-disable_tx:
-	clk_disable_unprepare(eqos->clk_tx);
-disable_rx:
-	clk_disable_unprepare(eqos->clk_rx);
-disable_slave:
-	clk_disable_unprepare(eqos->clk_slave);
-disable_master:
-	clk_disable_unprepare(eqos->clk_master);
-error:
 	return err;
 }
 
@@ -388,10 +328,6 @@ static void tegra_eqos_remove(struct platform_device *pdev)
 
 	reset_control_assert(eqos->rst);
 	gpiod_set_value(eqos->reset, 1);
-	clk_disable_unprepare(eqos->clk_tx);
-	clk_disable_unprepare(eqos->clk_rx);
-	clk_disable_unprepare(eqos->clk_slave);
-	clk_disable_unprepare(eqos->clk_master);
 }
 
 struct dwc_eth_dwmac_data {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
