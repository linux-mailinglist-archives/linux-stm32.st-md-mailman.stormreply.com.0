Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47297784764
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 065FCC7800C;
	Tue, 22 Aug 2023 16:26:17 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E57D7C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 03:18:08 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTcyw6BrvzNn3M;
 Mon, 21 Aug 2023 11:14:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:18:05 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
Date: Mon, 21 Aug 2023 11:17:36 +0800
Message-ID: <20230821031737.1973183-12-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-1-lizetao1@huawei.com>
References: <20230818101004.4f2cd343@xps-13>
 <20230821031737.1973183-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: heiko@sntech.de, geert+renesas@glider.be, lizetao1@huawei.com,
 stefan@agner.ch, paul@crapouillou.net, linux-mtd@lists.infradead.org,
 jernej.skrabec@gmail.com, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, vigneshr@ti.com, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, wens@csie.org,
 christophe.leroy@csgroup.eu, tudor.ambarus@linaro.org,
 u.kleine-koenig@pengutronix.de, linux-sunxi@lists.linux.dev, frank.li@vivo.com,
 martin.blumenstingl@googlemail.com, yangyingliang@huawei.com, vz@mleia.com,
 rogerq@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, philmd@linaro.org,
 dmitry.torokhov@gmail.com, michael@walle.cc, mcoquelin.stm32@gmail.com,
 pratyush@kernel.org
Subject: [Linux-stm32] [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi: Use
	helper function devm_clk_get_enabled()
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly, so drop
the label "dis_clks" and "dis_clk_reg".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-12-lizetao1@huawei.com/
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-12-lizetao1@huawei.com/

 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 33 ++++-----------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 337e83bf3362..5d8f47ab146f 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -394,30 +394,18 @@ static int nxp_spifi_probe(struct platform_device *pdev)
 	if (IS_ERR(spifi->flash_base))
 		return PTR_ERR(spifi->flash_base);
 
-	spifi->clk_spifi = devm_clk_get(&pdev->dev, "spifi");
+	spifi->clk_spifi = devm_clk_get_enabled(&pdev->dev, "spifi");
 	if (IS_ERR(spifi->clk_spifi)) {
-		dev_err(&pdev->dev, "spifi clock not found\n");
+		dev_err(&pdev->dev, "spifi clock not found or unable to enable\n");
 		return PTR_ERR(spifi->clk_spifi);
 	}
 
-	spifi->clk_reg = devm_clk_get(&pdev->dev, "reg");
+	spifi->clk_reg = devm_clk_get_enabled(&pdev->dev, "reg");
 	if (IS_ERR(spifi->clk_reg)) {
-		dev_err(&pdev->dev, "reg clock not found\n");
+		dev_err(&pdev->dev, "reg clock not found or unable to enable\n");
 		return PTR_ERR(spifi->clk_reg);
 	}
 
-	ret = clk_prepare_enable(spifi->clk_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable reg clock\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(spifi->clk_spifi);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable spifi clock\n");
-		goto dis_clk_reg;
-	}
-
 	spifi->dev = &pdev->dev;
 	platform_set_drvdata(pdev, spifi);
 
@@ -430,24 +418,17 @@ static int nxp_spifi_probe(struct platform_device *pdev)
 	flash_np = of_get_next_available_child(pdev->dev.of_node, NULL);
 	if (!flash_np) {
 		dev_err(&pdev->dev, "no SPI flash device to configure\n");
-		ret = -ENODEV;
-		goto dis_clks;
+		return -ENODEV;
 	}
 
 	ret = nxp_spifi_setup_flash(spifi, flash_np);
 	of_node_put(flash_np);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to setup flash chip\n");
-		goto dis_clks;
+		return ret;
 	}
 
 	return 0;
-
-dis_clks:
-	clk_disable_unprepare(spifi->clk_spifi);
-dis_clk_reg:
-	clk_disable_unprepare(spifi->clk_reg);
-	return ret;
 }
 
 static int nxp_spifi_remove(struct platform_device *pdev)
@@ -455,8 +436,6 @@ static int nxp_spifi_remove(struct platform_device *pdev)
 	struct nxp_spifi *spifi = platform_get_drvdata(pdev);
 
 	mtd_device_unregister(&spifi->nor.mtd);
-	clk_disable_unprepare(spifi->clk_spifi);
-	clk_disable_unprepare(spifi->clk_reg);
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
