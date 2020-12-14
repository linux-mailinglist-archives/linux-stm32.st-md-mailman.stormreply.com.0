Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1132D94B7
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 10:16:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 522FBC5716A;
	Mon, 14 Dec 2020 09:16:39 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EB3FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Dec 2020 09:16:37 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 14 Dec 2020 12:16:10 +0300
Message-ID: <20201214091616.13545-21-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH 20/25] net: stmmac: Add Tx/Rx platform clocks
	support
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

Depending on the DW *MAC configuration it can be at least connected to an
external Transmit clock, but in some cases to an external Receive clock
generator. In order to simplify/unify the sub-drivers code and to prevent
having the same clocks named differently add the Tx/Rx clocks support to
the generic STMMAC DT-based platform data initialization method under the
names "tx" and "rx" respectively. The bindings schema has already been
altered in accordance with that.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 24 +++++++++++++++++++
 include/linux/stmmac.h                        |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 38e8836861c4..943498d57e3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -588,6 +588,24 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 
 	clk_prepare_enable(plat->pclk);
 
+	plat->tx_clk = devm_clk_get_optional(&pdev->dev, "tx");
+	if (IS_ERR(plat->tx_clk)) {
+		rc = PTR_ERR(plat->tx_clk);
+		dev_err_probe(&pdev->dev, rc, "Cannot get Tx clock\n");
+		goto error_tx_clk_get;
+	}
+
+	clk_prepare_enable(plat->tx_clk);
+
+	plat->rx_clk = devm_clk_get_optional(&pdev->dev, "rx");
+	if (IS_ERR(plat->rx_clk)) {
+		rc = PTR_ERR(plat->rx_clk);
+		dev_err_probe(&pdev->dev, rc, "Cannot get Rx clock\n");
+		goto error_rx_clk_get;
+	}
+
+	clk_prepare_enable(plat->rx_clk);
+
 	/* Fall-back to main clock in case of no PTP ref is passed */
 	plat->clk_ptp_ref = devm_clk_get_optional(&pdev->dev, "ptp_ref");
 	if (IS_ERR(plat->clk_ptp_ref)) {
@@ -613,6 +631,10 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	return plat;
 
 error_hw_init:
+	clk_disable_unprepare(plat->rx_clk);
+error_rx_clk_get:
+	clk_disable_unprepare(plat->tx_clk);
+error_tx_clk_get:
 	clk_disable_unprepare(plat->pclk);
 error_pclk_get:
 	clk_disable_unprepare(plat->stmmac_clk);
@@ -634,6 +656,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 void stmmac_remove_config_dt(struct platform_device *pdev,
 			     struct plat_stmmacenet_data *plat)
 {
+	clk_disable_unprepare(plat->rx_clk);
+	clk_disable_unprepare(plat->tx_clk);
 	clk_disable_unprepare(plat->pclk);
 	clk_disable_unprepare(plat->stmmac_clk);
 	of_node_put(plat->phy_node);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 628e28903b8b..b75cf13d088c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -185,6 +185,8 @@ struct plat_stmmacenet_data {
 	void *bsp_priv;
 	struct clk *stmmac_clk;
 	struct clk *pclk;
+	struct clk *tx_clk;
+	struct clk *rx_clk;
 	struct clk *clk_ptp_ref;
 	unsigned int clk_ptp_rate;
 	unsigned int clk_ref_rate;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
