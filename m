Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761078475B
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49386C71299;
	Tue, 22 Aug 2023 16:26:16 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B83C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 03:17:59 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTcyk6d6XzNmyS;
 Mon, 21 Aug 2023 11:14:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:17:55 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
Date: Mon, 21 Aug 2023 11:17:27 +0800
Message-ID: <20230821031737.1973183-3-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH -next v3 02/12] mtd: rawnand: arasan: Use
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
the label "disable_bus_clk" and "disable_controller_clk".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-3-lizetao1@huawei.com/
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-3-lizetao1@huawei.com/

 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 ++++---------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 906eef70cb6d..4621ec549cc7 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1440,45 +1440,29 @@ static int anfc_probe(struct platform_device *pdev)
 
 	anfc_reset(nfc);
 
-	nfc->controller_clk = devm_clk_get(&pdev->dev, "controller");
+	nfc->controller_clk = devm_clk_get_enabled(&pdev->dev, "controller");
 	if (IS_ERR(nfc->controller_clk))
 		return PTR_ERR(nfc->controller_clk);
 
-	nfc->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	nfc->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 	if (IS_ERR(nfc->bus_clk))
 		return PTR_ERR(nfc->bus_clk);
 
-	ret = clk_prepare_enable(nfc->controller_clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(nfc->bus_clk);
-	if (ret)
-		goto disable_controller_clk;
-
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	ret = anfc_parse_cs(nfc);
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	ret = anfc_chips_init(nfc);
 	if (ret)
-		goto disable_bus_clk;
+		return ret;
 
 	platform_set_drvdata(pdev, nfc);
 
 	return 0;
-
-disable_bus_clk:
-	clk_disable_unprepare(nfc->bus_clk);
-
-disable_controller_clk:
-	clk_disable_unprepare(nfc->controller_clk);
-
-	return ret;
 }
 
 static void anfc_remove(struct platform_device *pdev)
@@ -1486,9 +1470,6 @@ static void anfc_remove(struct platform_device *pdev)
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
 	anfc_chips_cleanup(nfc);
-
-	clk_disable_unprepare(nfc->bus_clk);
-	clk_disable_unprepare(nfc->controller_clk);
 }
 
 static const struct of_device_id anfc_ids[] = {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
