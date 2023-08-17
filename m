Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DA784718
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5656BC6C853;
	Tue, 22 Aug 2023 16:25:02 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7722DC6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 02:45:39 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RR8Tq4PPFz1GDc3;
 Thu, 17 Aug 2023 10:44:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:35 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
Date: Thu, 17 Aug 2023 10:45:07 +0800
Message-ID: <20230817024509.3951629-10-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH -next 09/11] mtd: rawnand: sunxi: Use helper
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

After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
prepared and enabled clocks"), it can replace the pair of functions,
devm_clk_get() and clk_prepare_enable() with a single helper function
devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
(or enabled) during the whole lifetime of the driver, it is unnecessary to
unprepare and disable clock explicitly when remove driver or in the error
handling path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 64c09eae951d..9abf38049d35 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2094,37 +2094,26 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	nfc->ahb_clk = devm_clk_get(dev, "ahb");
+	nfc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
 	if (IS_ERR(nfc->ahb_clk)) {
 		dev_err(dev, "failed to retrieve ahb clk\n");
 		return PTR_ERR(nfc->ahb_clk);
 	}
 
-	ret = clk_prepare_enable(nfc->ahb_clk);
-	if (ret)
-		return ret;
-
-	nfc->mod_clk = devm_clk_get(dev, "mod");
+	nfc->mod_clk = devm_clk_get_enabled(dev, "mod");
 	if (IS_ERR(nfc->mod_clk)) {
 		dev_err(dev, "failed to retrieve mod clk\n");
-		ret = PTR_ERR(nfc->mod_clk);
-		goto out_ahb_clk_unprepare;
+		return PTR_ERR(nfc->mod_clk);
 	}
 
-	ret = clk_prepare_enable(nfc->mod_clk);
-	if (ret)
-		goto out_ahb_clk_unprepare;
-
 	nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
-	if (IS_ERR(nfc->reset)) {
-		ret = PTR_ERR(nfc->reset);
-		goto out_mod_clk_unprepare;
-	}
+	if (IS_ERR(nfc->reset))
+		return PTR_ERR(nfc->reset);
 
 	ret = reset_control_deassert(nfc->reset);
 	if (ret) {
 		dev_err(dev, "reset err %d\n", ret);
-		goto out_mod_clk_unprepare;
+		return ret;
 	}
 
 	nfc->caps = of_device_get_match_data(&pdev->dev);
@@ -2163,10 +2152,6 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 out_ahb_reset_reassert:
 	reset_control_assert(nfc->reset);
-out_mod_clk_unprepare:
-	clk_disable_unprepare(nfc->mod_clk);
-out_ahb_clk_unprepare:
-	clk_disable_unprepare(nfc->ahb_clk);
 
 	return ret;
 }
@@ -2181,8 +2166,6 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
 
 	if (nfc->dmac)
 		dma_release_channel(nfc->dmac);
-	clk_disable_unprepare(nfc->mod_clk);
-	clk_disable_unprepare(nfc->ahb_clk);
 }
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
