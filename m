Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD408784719
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EF27C6C84F;
	Tue, 22 Aug 2023 16:25:02 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FCC6C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 02:45:40 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RR8Rz442wzFqjg;
 Thu, 17 Aug 2023 10:42:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:36 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
Date: Thu, 17 Aug 2023 10:45:08 +0800
Message-ID: <20230817024509.3951629-11-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:58 +0000
Cc: robh@kernel.org, paul@crapouillou.net, dmitry.torokhov@gmail.com,
 philmd@linaro.org, geert+renesas@glider.be, martin.blumenstingl@googlemail.com,
 yangyingliang@huawei.com, lizetao1@huawei.com, nicolas.ferre@microchip.com,
 christophe.leroy@csgroup.eu, linux-sunxi@lists.linux.dev, rogerq@kernel.org,
 linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 linux-mediatek@lists.infradead.org, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
Subject: [Linux-stm32] [PATCH -next 10/11] mtd: rawnand: vf610_nfc: Use
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

After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
prepared and enabled clocks"), it can replace the pair of functions,
devm_clk_get() and clk_prepare_enable() with a single helper function
devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
(or enabled) during the whole lifetime of the driver, it is unnecessary to
unprepare and disable clock explicitly when remove driver or in the error
handling path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index dcdf33dbaef2..1ce9d5c2b1f7 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -834,21 +834,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->regs))
 		return PTR_ERR(nfc->regs);
 
-	nfc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(nfc->clk))
+	nfc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(nfc->clk)) {
+		dev_err(nfc->dev, "Unable to get and enable clock!\n");
 		return PTR_ERR(nfc->clk);
-
-	err = clk_prepare_enable(nfc->clk);
-	if (err) {
-		dev_err(nfc->dev, "Unable to enable clock!\n");
-		return err;
 	}
 
 	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
-	if (!of_id) {
-		err = -ENODEV;
-		goto err_disable_clk;
-	}
+	if (!of_id)
+		return -ENODEV;
 
 	nfc->variant = (enum vf610_nfc_variant)of_id->data;
 
@@ -858,9 +852,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				err = -EINVAL;
 				of_node_put(child);
-				goto err_disable_clk;
+				return -EINVAL;
 			}
 
 			nand_set_flash_node(chip, child);
@@ -869,8 +862,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	if (!nand_get_flash_node(chip)) {
 		dev_err(nfc->dev, "NAND chip sub-node missing!\n");
-		err = -ENODEV;
-		goto err_disable_clk;
+		return -ENODEV;
 	}
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
@@ -880,7 +872,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, nfc);
 	if (err) {
 		dev_err(nfc->dev, "Error requesting IRQ!\n");
-		goto err_disable_clk;
+		return err;
 	}
 
 	vf610_nfc_preinit_controller(nfc);
@@ -892,7 +884,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	/* Scan the NAND chip */
 	err = nand_scan(chip, 1);
 	if (err)
-		goto err_disable_clk;
+		return err;
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -904,8 +896,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 err_cleanup_nand:
 	nand_cleanup(chip);
-err_disable_clk:
-	clk_disable_unprepare(nfc->clk);
 	return err;
 }
 
@@ -918,7 +908,6 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	clk_disable_unprepare(nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
