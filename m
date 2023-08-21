Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27678475C
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BA17C7129C;
	Tue, 22 Aug 2023 16:26:16 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15E31C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 03:18:00 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTcyb5stCztRjV;
 Mon, 21 Aug 2023 11:14:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:17:56 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
Date: Mon, 21 Aug 2023 11:17:28 +0800
Message-ID: <20230821031737.1973183-4-lizetao1@huawei.com>
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
Subject: [Linux-stm32] [PATCH -next v3 03/12] mtd: rawnand: fsmc: Use helper
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
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly. The
label "disable_clk" no longer makes sense, rename it to "disable_fsmc".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-4-lizetao1@huawei.com/
v1 -> v2: Modify commit message and rename the label "disable_clk" to "disable_fsmc"
v1: https://lore.kernel.org/all/20230817024509.3951629-4-lizetao1@huawei.com/

 drivers/mtd/nand/raw/fsmc_nand.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 7b4742420dfc..7d587284c9a5 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1066,16 +1066,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	host->regs_va = base + FSMC_NOR_REG_SIZE +
 		(host->bank * FSMC_NAND_BANK_SZ);
 
-	host->clk = devm_clk_get(&pdev->dev, NULL);
+	host->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "failed to fetch block clock\n");
 		return PTR_ERR(host->clk);
 	}
 
-	ret = clk_prepare_enable(host->clk);
-	if (ret)
-		return ret;
-
 	/*
 	 * This device ID is actually a common AMBA ID as used on the
 	 * AMBA PrimeCell bus. However it is not a PrimeCell.
@@ -1111,7 +1107,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		if (!host->read_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get read dma channel\n");
 			ret = -ENODEV;
-			goto disable_clk;
+			goto disable_fsmc;
 		}
 		host->write_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->write_dma_chan) {
@@ -1155,9 +1151,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 release_dma_read_chan:
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->read_dma_chan);
-disable_clk:
+disable_fsmc:
 	fsmc_nand_disable(host);
-	clk_disable_unprepare(host->clk);
 
 	return ret;
 }
@@ -1182,7 +1177,6 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
-		clk_disable_unprepare(host->clk);
 	}
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
