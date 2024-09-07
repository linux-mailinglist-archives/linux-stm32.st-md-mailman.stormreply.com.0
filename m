Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D896FF87
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 05:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 439F8C78013;
	Sat,  7 Sep 2024 03:10:47 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60F32C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2024 03:10:42 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X0ykW2XRmzyRGh;
 Sat,  7 Sep 2024 11:09:39 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 885A01800CF;
 Sat,  7 Sep 2024 11:10:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:39 +0800
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
Date: Sat, 7 Sep 2024 11:19:19 +0800
Message-ID: <20240907031926.3591353-4-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 03/10] net: ethernet: arc: Convert
	using devm_clk_get_enabled() in emac_probe()
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
the out_clk_disable_unprepare label, and the original error process can
changed to the out_dispose_mapping error path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/arc/emac_rockchip.c | 34 +++++-------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/arc/emac_rockchip.c b/drivers/net/ethernet/arc/emac_rockchip.c
index 493d6356c8ca..22b3ebe059d9 100644
--- a/drivers/net/ethernet/arc/emac_rockchip.c
+++ b/drivers/net/ethernet/arc/emac_rockchip.c
@@ -144,7 +144,7 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 		goto out_netdev;
 	}
 
-	priv->refclk = devm_clk_get(dev, "macref");
+	priv->refclk = devm_clk_get_enabled(dev, "macref");
 	if (IS_ERR(priv->refclk)) {
 		dev_err(dev, "failed to retrieve reference clock (%ld)\n",
 			PTR_ERR(priv->refclk));
@@ -152,18 +152,12 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 		goto out_netdev;
 	}
 
-	err = clk_prepare_enable(priv->refclk);
-	if (err) {
-		dev_err(dev, "failed to enable reference clock (%d)\n", err);
-		goto out_netdev;
-	}
-
 	/* Optional regulator for PHY */
 	priv->regulator = devm_regulator_get_optional(dev, "phy");
 	if (IS_ERR(priv->regulator)) {
 		if (PTR_ERR(priv->regulator) == -EPROBE_DEFER) {
 			err = -EPROBE_DEFER;
-			goto out_clk_disable;
+			goto out_netdev;
 		}
 		dev_err(dev, "no regulator found\n");
 		priv->regulator = NULL;
@@ -173,7 +167,7 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 		err = regulator_enable(priv->regulator);
 		if (err) {
 			dev_err(dev, "failed to enable phy-supply (%d)\n", err);
-			goto out_clk_disable;
+			goto out_netdev;
 		}
 	}
 
@@ -200,7 +194,7 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 	}
 
 	if (priv->soc_data->need_div_macclk) {
-		priv->macclk = devm_clk_get(dev, "macclk");
+		priv->macclk = devm_clk_get_enabled(dev, "macclk");
 		if (IS_ERR(priv->macclk)) {
 			dev_err(dev, "failed to retrieve mac clock (%ld)\n",
 				PTR_ERR(priv->macclk));
@@ -208,37 +202,26 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 			goto out_regulator_disable;
 		}
 
-		err = clk_prepare_enable(priv->macclk);
-		if (err) {
-			dev_err(dev, "failed to enable mac clock (%d)\n", err);
-			goto out_regulator_disable;
-		}
-
 		/* RMII TX/RX needs always a rate of 25MHz */
 		err = clk_set_rate(priv->macclk, 25000000);
 		if (err) {
 			dev_err(dev,
 				"failed to change mac clock rate (%d)\n", err);
-			goto out_clk_disable_macclk;
+			goto out_regulator_disable;
 		}
 	}
 
 	err = arc_emac_probe(ndev, interface);
 	if (err) {
 		dev_err(dev, "failed to probe arc emac (%d)\n", err);
-		goto out_clk_disable_macclk;
+		goto out_regulator_disable;
 	}
 
 	return 0;
 
-out_clk_disable_macclk:
-	if (priv->soc_data->need_div_macclk)
-		clk_disable_unprepare(priv->macclk);
 out_regulator_disable:
 	if (priv->regulator)
 		regulator_disable(priv->regulator);
-out_clk_disable:
-	clk_disable_unprepare(priv->refclk);
 out_netdev:
 	free_netdev(ndev);
 	return err;
@@ -251,14 +234,9 @@ static void emac_rockchip_remove(struct platform_device *pdev)
 
 	arc_emac_remove(ndev);
 
-	clk_disable_unprepare(priv->refclk);
-
 	if (priv->regulator)
 		regulator_disable(priv->regulator);
 
-	if (priv->soc_data->need_div_macclk)
-		clk_disable_unprepare(priv->macclk);
-
 	free_netdev(ndev);
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
