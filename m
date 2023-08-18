Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A78E78474A
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D37A9C6DD9E;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5050EC6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 07:47:16 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv4l0ZKRztS0n;
 Fri, 18 Aug 2023 15:43:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:12 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Date: Fri, 18 Aug 2023 15:46:37 +0800
Message-ID: <20230818074642.308166-8-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818074642.308166-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:58 +0000
Cc: heiko@sntech.de, geert+renesas@glider.be, stefan@agner.ch,
 paul@crapouillou.net, linux-mtd@lists.infradead.org, jernej.skrabec@gmail.com,
 miquel.raynal@bootlin.com, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, vigneshr@ti.com, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, wens@csie.org,
 christophe.leroy@csgroup.eu, tudor.ambarus@linaro.org,
 u.kleine-koenig@pengutronix.de, linux-sunxi@lists.linux.dev, frank.li@vivo.com,
 martin.blumenstingl@googlemail.com, yangyingliang@huawei.com, vz@mleia.com,
 rogerq@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, philmd@linaro.org,
 dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 mcoquelin.stm32@gmail.com, pratyush@kernel.org
Subject: [Linux-stm32] [PATCH -next v2 07/12] mtd: rawnand: mtk: Use helper
	function devm_clk_get_enabled()
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
replaced by devm_clk_get_enabled() when driver enable (and possibly
prepare) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clock explicitly, so drop
the label "clk_disable". And both mtk_nfc_enable_clk() and
mtk_nfc_disable_clk() now have a single user, which is the resume or
suspend callback, so drop this two helper function and just move related
operations in the resume or suspend function.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message and drop two helper functions
mtk_nfc_enable_clk() and mtk_nfc_disable_clk().
v1: https://lore.kernel.org/all/20230817024509.3951629-8-lizetao1@huawei.com/

 drivers/mtd/nand/raw/mtk_nand.c | 62 ++++++++++-----------------------
 1 file changed, 19 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6eb8cb6b5e9..29c8bddde67f 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1118,32 +1118,6 @@ static irqreturn_t mtk_nfc_irq(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
-static int mtk_nfc_enable_clk(struct device *dev, struct mtk_nfc_clk *clk)
-{
-	int ret;
-
-	ret = clk_prepare_enable(clk->nfi_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable nfi clk\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(clk->pad_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable pad clk\n");
-		clk_disable_unprepare(clk->nfi_clk);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void mtk_nfc_disable_clk(struct mtk_nfc_clk *clk)
-{
-	clk_disable_unprepare(clk->nfi_clk);
-	clk_disable_unprepare(clk->pad_clk);
-}
-
 static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oob_region)
 {
@@ -1545,40 +1519,36 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 		goto release_ecc;
 	}
 
-	nfc->clk.nfi_clk = devm_clk_get(dev, "nfi_clk");
+	nfc->clk.nfi_clk = devm_clk_get_enabled(dev, "nfi_clk");
 	if (IS_ERR(nfc->clk.nfi_clk)) {
 		dev_err(dev, "no clk\n");
 		ret = PTR_ERR(nfc->clk.nfi_clk);
 		goto release_ecc;
 	}
 
-	nfc->clk.pad_clk = devm_clk_get(dev, "pad_clk");
+	nfc->clk.pad_clk = devm_clk_get_enabled(dev, "pad_clk");
 	if (IS_ERR(nfc->clk.pad_clk)) {
 		dev_err(dev, "no pad clk\n");
 		ret = PTR_ERR(nfc->clk.pad_clk);
 		goto release_ecc;
 	}
 
-	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
-	if (ret)
-		goto release_ecc;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -EINVAL;
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	ret = devm_request_irq(dev, irq, mtk_nfc_irq, 0x0, "mtk-nand", nfc);
 	if (ret) {
 		dev_err(dev, "failed to request nfi irq\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "failed to set dma mask\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	platform_set_drvdata(pdev, nfc);
@@ -1586,14 +1556,11 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	ret = mtk_nfc_nand_chips_init(dev, nfc);
 	if (ret) {
 		dev_err(dev, "failed to init nand chips\n");
-		goto clk_disable;
+		goto release_ecc;
 	}
 
 	return 0;
 
-clk_disable:
-	mtk_nfc_disable_clk(&nfc->clk);
-
 release_ecc:
 	mtk_ecc_release(nfc->ecc);
 
@@ -1618,7 +1585,6 @@ static void mtk_nfc_remove(struct platform_device *pdev)
 	}
 
 	mtk_ecc_release(nfc->ecc);
-	mtk_nfc_disable_clk(&nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1626,7 +1592,8 @@ static int mtk_nfc_suspend(struct device *dev)
 {
 	struct mtk_nfc *nfc = dev_get_drvdata(dev);
 
-	mtk_nfc_disable_clk(&nfc->clk);
+	clk_disable_unprepare(nfc->clk.nfi_clk);
+	clk_disable_unprepare(nfc->clk.pad_clk);
 
 	return 0;
 }
@@ -1641,9 +1608,18 @@ static int mtk_nfc_resume(struct device *dev)
 
 	udelay(200);
 
-	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
-	if (ret)
+	ret = clk_prepare_enable(nfc->clk.nfi_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable nfi clk\n");
 		return ret;
+	}
+
+	ret = clk_prepare_enable(nfc->clk.pad_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable pad clk\n");
+		clk_disable_unprepare(nfc->clk.nfi_clk);
+		return ret;
+	}
 
 	/* reset NAND chip if VCC was powered off */
 	list_for_each_entry(chip, &nfc->chips, node) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
