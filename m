Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB3C96FF92
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 05:10:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9A75C78036;
	Sat,  7 Sep 2024 03:10:49 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94F38C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2024 03:10:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4X0yln13H6z69WR;
 Sat,  7 Sep 2024 11:10:45 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 90FCB1800CF;
 Sat,  7 Sep 2024 11:10:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:45 +0800
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
Date: Sat, 7 Sep 2024 11:19:25 +0800
Message-ID: <20240907031926.3591353-10-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 09/10] net: ethernet: sunplus:
	Convert using devm_clk_get_enabled() in spl2sw_probe()
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
the out_clk_disable label, and the original error process can return
directly. Some comments have also been adjusted.

After this modification , it is no longer necessary to use clk, so delete
the clk member of the spl2sw_common structure.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Delete the clk member of the spl2sw_common structure
v1:
https://lore.kernel.org/all/20240831021334.1907921-10-lizetao1@huawei.com/

 drivers/net/ethernet/sunplus/spl2sw_define.h |  1 -
 drivers/net/ethernet/sunplus/spl2sw_driver.c | 25 +++++++-------------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/sunplus/spl2sw_define.h b/drivers/net/ethernet/sunplus/spl2sw_define.h
index acc6c1228ebc..6318eccc6c4e 100644
--- a/drivers/net/ethernet/sunplus/spl2sw_define.h
+++ b/drivers/net/ethernet/sunplus/spl2sw_define.h
@@ -224,7 +224,6 @@ struct spl2sw_common {
 
 	struct platform_device *pdev;
 	struct reset_control *rstc;
-	struct clk *clk;
 
 	void *desc_base;
 	dma_addr_t desc_dma;
diff --git a/drivers/net/ethernet/sunplus/spl2sw_driver.c b/drivers/net/ethernet/sunplus/spl2sw_driver.c
index 391a1bc7f446..887da05bc204 100644
--- a/drivers/net/ethernet/sunplus/spl2sw_driver.c
+++ b/drivers/net/ethernet/sunplus/spl2sw_driver.c
@@ -327,6 +327,7 @@ static int spl2sw_probe(struct platform_device *pdev)
 	struct net_device *ndev;
 	struct spl2sw_mac *mac;
 	u8 mac_addr[ETH_ALEN];
+	struct clk *clk;
 	int irq, i, ret;
 
 	if (platform_get_drvdata(pdev))
@@ -355,12 +356,12 @@ static int spl2sw_probe(struct platform_device *pdev)
 		return ret;
 	irq = ret;
 
-	/* Get clock controller. */
-	comm->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(comm->clk)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(comm->clk),
+	/* Get and enable clock controller. */
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err_probe(&pdev->dev, PTR_ERR(clk),
 			      "Failed to retrieve clock controller!\n");
-		return PTR_ERR(comm->clk);
+		return PTR_ERR(clk);
 	}
 
 	/* Get reset controller. */
@@ -371,10 +372,6 @@ static int spl2sw_probe(struct platform_device *pdev)
 		return PTR_ERR(comm->rstc);
 	}
 
-	/* Enable clock. */
-	ret = clk_prepare_enable(comm->clk);
-	if (ret)
-		return ret;
 	udelay(1);
 
 	/* Reset MAC */
@@ -388,7 +385,7 @@ static int spl2sw_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), comm);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq #%d!\n", irq);
-		goto out_clk_disable;
+		return ret;
 	}
 
 	/* Initialize TX and RX descriptors. */
@@ -396,7 +393,7 @@ static int spl2sw_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Fail to initialize mac descriptors!\n");
 		spl2sw_descs_free(comm);
-		goto out_clk_disable;
+		return ret;
 	}
 
 	/* Initialize MAC. */
@@ -406,7 +403,7 @@ static int spl2sw_probe(struct platform_device *pdev)
 	ret = spl2sw_mdio_init(comm);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize mdio bus!\n");
-		goto out_clk_disable;
+		return ret;
 	}
 
 	/* Get child node ethernet-ports. */
@@ -506,8 +503,6 @@ static int spl2sw_probe(struct platform_device *pdev)
 out_free_mdio:
 	spl2sw_mdio_remove(comm);
 
-out_clk_disable:
-	clk_disable_unprepare(comm->clk);
 	return ret;
 }
 
@@ -536,8 +531,6 @@ static void spl2sw_remove(struct platform_device *pdev)
 	netif_napi_del(&comm->tx_napi);
 
 	spl2sw_mdio_remove(comm);
-
-	clk_disable_unprepare(comm->clk);
 }
 
 static const struct of_device_id spl2sw_of_match[] = {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
