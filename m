Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50106966EB7
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 04:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 008A2C6DD9A;
	Sat, 31 Aug 2024 02:05:28 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84870C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Aug 2024 02:05:26 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wwdcy6129zyRFP;
 Sat, 31 Aug 2024 10:04:50 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 144511800A7;
 Sat, 31 Aug 2024 10:05:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 10:05:22 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <florian.fainelli@broadcom.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <heiko@sntech.de>, <yisen.zhuang@huawei.com>,
 <salil.mehta@huawei.com>, <hauke@hauke-m.de>, <alexandre.torgue@foss.st.com>, 
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>,
 <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>, <kvalo@kernel.org>,
 <lizetao1@huawei.com>, <u.kleine-koenig@pengutronix.de>,
 <jacky_chou@aspeedtech.com>
Date: Sat, 31 Aug 2024 10:13:28 +0800
Message-ID: <20240831021334.1907921-7-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240831021334.1907921-1-lizetao1@huawei.com>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 06/12] net: ethernet: hisilicon:
	Convert using devm_clk_get_enabled() in hisi_femac_drv_probe()
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
the out_disable_clk label, and the original error process can change to
the out_free_netdev error path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/hisilicon/hisi_femac.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hisi_femac.c b/drivers/net/ethernet/hisilicon/hisi_femac.c
index 2406263c9dd3..ffb6f4751d8b 100644
--- a/drivers/net/ethernet/hisilicon/hisi_femac.c
+++ b/drivers/net/ethernet/hisilicon/hisi_femac.c
@@ -797,23 +797,17 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
 		goto out_free_netdev;
 	}
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "failed to get clk\n");
 		ret = -ENODEV;
 		goto out_free_netdev;
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable clk %d\n", ret);
-		goto out_free_netdev;
-	}
-
 	priv->mac_rst = devm_reset_control_get(dev, "mac");
 	if (IS_ERR(priv->mac_rst)) {
 		ret = PTR_ERR(priv->mac_rst);
-		goto out_disable_clk;
+		goto out_free_netdev;
 	}
 	hisi_femac_core_reset(priv);
 
@@ -826,7 +820,7 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
 						 priv->phy_reset_delays,
 						 DELAYS_NUM);
 		if (ret)
-			goto out_disable_clk;
+			goto out_free_netdev;
 		hisi_femac_phy_reset(priv);
 	}
 
@@ -834,7 +828,7 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
 	if (!phy) {
 		dev_err(dev, "connect to PHY failed!\n");
 		ret = -ENODEV;
-		goto out_disable_clk;
+		goto out_free_netdev;
 	}
 
 	phy_attached_print(phy, "phy_id=0x%.8lx, phy_mode=%s\n",
@@ -885,8 +879,6 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
 out_disconnect_phy:
 	netif_napi_del(&priv->napi);
 	phy_disconnect(phy);
-out_disable_clk:
-	clk_disable_unprepare(priv->clk);
 out_free_netdev:
 	free_netdev(ndev);
 
@@ -902,7 +894,6 @@ static void hisi_femac_drv_remove(struct platform_device *pdev)
 	unregister_netdev(ndev);
 
 	phy_disconnect(ndev->phydev);
-	clk_disable_unprepare(priv->clk);
 	free_netdev(ndev);
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
