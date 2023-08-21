Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C101178475E
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84313C712A2;
	Tue, 22 Aug 2023 16:26:16 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3030C6B47C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 03:18:02 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTcyp127mzNn2R;
 Mon, 21 Aug 2023 11:14:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:17:58 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
Date: Mon, 21 Aug 2023 11:17:30 +0800
Message-ID: <20230821031737.1973183-6-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH -next v3 05/12] mtd: rawnand: lpc32xx_slc: Use
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
the label "unprepare_clk".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-6-lizetao1@huawei.com/
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-6-lizetao1@huawei.com/

 drivers/mtd/nand/raw/lpc32xx_slc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 2201264d3c37..1c5fa855b9f2 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -871,15 +871,12 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	/* Get NAND clock */
-	host->clk = devm_clk_get(&pdev->dev, NULL);
+	host->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "Clock failure\n");
 		res = -ENOENT;
 		goto enable_wp;
 	}
-	res = clk_prepare_enable(host->clk);
-	if (res)
-		goto enable_wp;
 
 	/* Set NAND IO addresses and command/ready functions */
 	chip->legacy.IO_ADDR_R = SLC_DATA(host->io_base);
@@ -907,13 +904,13 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 				      GFP_KERNEL);
 	if (host->data_buf == NULL) {
 		res = -ENOMEM;
-		goto unprepare_clk;
+		goto enable_wp;
 	}
 
 	res = lpc32xx_nand_dma_setup(host);
 	if (res) {
 		res = -EIO;
-		goto unprepare_clk;
+		goto enable_wp;
 	}
 
 	/* Find NAND device */
@@ -934,8 +931,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	nand_cleanup(chip);
 release_dma:
 	dma_release_channel(host->dma_chan);
-unprepare_clk:
-	clk_disable_unprepare(host->clk);
 enable_wp:
 	lpc32xx_wp_enable(host);
 
@@ -962,7 +957,6 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	tmp &= ~SLCCFG_CE_LOW;
 	writel(tmp, SLC_CTRL(host->io_base));
 
-	clk_disable_unprepare(host->clk);
 	lpc32xx_wp_enable(host);
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
