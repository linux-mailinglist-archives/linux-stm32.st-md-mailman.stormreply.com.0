Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F1966EBC
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 04:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EA25C7801A;
	Sat, 31 Aug 2024 02:05:28 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8825CC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Aug 2024 02:05:24 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WwddH3YQZz1j5Wh;
 Sat, 31 Aug 2024 10:05:07 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 07782140158;
 Sat, 31 Aug 2024 10:05:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 10:05:20 +0800
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
Date: Sat, 31 Aug 2024 10:13:26 +0800
Message-ID: <20240831021334.1907921-5-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH net-next 04/12] net: ethernet: ethoc: Convert
	using devm_clk_get_enabled() in ethoc_probe()
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
the free2 label, and the meaning of the free3 label is not clear, Changing
it to free_mdiobus will make it more understandable.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/ethoc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/ethoc.c b/drivers/net/ethernet/ethoc.c
index ad41c9019018..1a56e20cb679 100644
--- a/drivers/net/ethernet/ethoc.c
+++ b/drivers/net/ethernet/ethoc.c
@@ -1172,13 +1172,10 @@ static int ethoc_probe(struct platform_device *pdev)
 
 	/* Allow the platform setup code to adjust MII management bus clock. */
 	if (!eth_clkfreq) {
-		struct clk *clk = devm_clk_get(&pdev->dev, NULL);
+		priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 
-		if (!IS_ERR(clk)) {
-			priv->clk = clk;
-			clk_prepare_enable(clk);
-			eth_clkfreq = clk_get_rate(clk);
-		}
+		if (!IS_ERR(priv->clk))
+			eth_clkfreq = clk_get_rate(priv->clk);
 	}
 	if (eth_clkfreq) {
 		u32 clkdiv = MIIMODER_CLKDIV(eth_clkfreq / 2500000 + 1);
@@ -1195,7 +1192,7 @@ static int ethoc_probe(struct platform_device *pdev)
 	priv->mdio = mdiobus_alloc();
 	if (!priv->mdio) {
 		ret = -ENOMEM;
-		goto free2;
+		goto free;
 	}
 
 	priv->mdio->name = "ethoc-mdio";
@@ -1208,7 +1205,7 @@ static int ethoc_probe(struct platform_device *pdev)
 	ret = mdiobus_register(priv->mdio);
 	if (ret) {
 		dev_err(&netdev->dev, "failed to register MDIO bus\n");
-		goto free3;
+		goto free_mdiobus;
 	}
 
 	ret = ethoc_mdio_probe(netdev);
@@ -1240,10 +1237,8 @@ static int ethoc_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 error:
 	mdiobus_unregister(priv->mdio);
-free3:
+free_mdiobus:
 	mdiobus_free(priv->mdio);
-free2:
-	clk_disable_unprepare(priv->clk);
 free:
 	free_netdev(netdev);
 out:
@@ -1267,7 +1262,6 @@ static void ethoc_remove(struct platform_device *pdev)
 			mdiobus_unregister(priv->mdio);
 			mdiobus_free(priv->mdio);
 		}
-		clk_disable_unprepare(priv->clk);
 		unregister_netdev(netdev);
 		free_netdev(netdev);
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
