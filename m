Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DDC966EB9
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 04:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17BFAC71287;
	Sat, 31 Aug 2024 02:05:28 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BEF4C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Aug 2024 02:05:25 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WwdWy5b4Sz20nGk;
 Sat, 31 Aug 2024 10:00:30 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 0BFFB140109;
 Sat, 31 Aug 2024 10:05:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 10:05:21 +0800
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
Date: Sat, 31 Aug 2024 10:13:27 +0800
Message-ID: <20240831021334.1907921-6-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH net-next 05/12] net: ftgmac100: Convert using
	devm_clk_get_enabled() in ftgmac100_setup_clk()
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
the cleanup_clk label, and the original error process can return directly.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 27 ++++++------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 4c546c3aef0f..eb57c822c5ac 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1752,13 +1752,10 @@ static int ftgmac100_setup_clk(struct ftgmac100 *priv)
 	struct clk *clk;
 	int rc;
 
-	clk = devm_clk_get(priv->dev, NULL /* MACCLK */);
+	clk = devm_clk_get_enabled(priv->dev, NULL /* MACCLK */);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 	priv->clk = clk;
-	rc = clk_prepare_enable(priv->clk);
-	if (rc)
-		return rc;
 
 	/* Aspeed specifies a 100MHz clock is required for up to
 	 * 1000Mbit link speeds. As NCSI is limited to 100Mbit, 25MHz
@@ -1767,21 +1764,17 @@ static int ftgmac100_setup_clk(struct ftgmac100 *priv)
 	rc = clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
 			  FTGMAC_100MHZ);
 	if (rc)
-		goto cleanup_clk;
+		return rc;
 
 	/* RCLK is for RMII, typically used for NCSI. Optional because it's not
 	 * necessary if it's the AST2400 MAC, or the MAC is configured for
 	 * RGMII, or the controller is not an ASPEED-based controller.
 	 */
-	priv->rclk = devm_clk_get_optional(priv->dev, "RCLK");
-	rc = clk_prepare_enable(priv->rclk);
-	if (!rc)
-		return 0;
+	priv->rclk = devm_clk_get_optional_enabled(priv->dev, "RCLK");
+	if (IS_ERR(priv->rclk))
+		return PTR_ERR(priv->rclk);
 
-cleanup_clk:
-	clk_disable_unprepare(priv->clk);
-
-	return rc;
+	return 0;
 }
 
 static bool ftgmac100_has_child_node(struct device_node *np, const char *name)
@@ -1996,16 +1989,13 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	err = register_netdev(netdev);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to register netdev\n");
-		goto err_register_netdev;
+		goto err_phy_connect;
 	}
 
 	netdev_info(netdev, "irq %d, mapped at %p\n", netdev->irq, priv->base);
 
 	return 0;
 
-err_register_netdev:
-	clk_disable_unprepare(priv->rclk);
-	clk_disable_unprepare(priv->clk);
 err_phy_connect:
 	ftgmac100_phy_disconnect(netdev);
 err_ncsi_dev:
@@ -2034,9 +2024,6 @@ static void ftgmac100_remove(struct platform_device *pdev)
 		ncsi_unregister_dev(priv->ndev);
 	unregister_netdev(netdev);
 
-	clk_disable_unprepare(priv->rclk);
-	clk_disable_unprepare(priv->clk);
-
 	/* There's a small chance the reset task will have been re-queued,
 	 * during stop, make sure it's gone before we free the structure.
 	 */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
