Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCFC3FD49A
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Sep 2021 09:42:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3BDBC5A4F3;
	Wed,  1 Sep 2021 07:42:33 +0000 (UTC)
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EE99C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Sep 2021 07:42:31 +0000 (UTC)
Received: from BC-Mail-HQEX01.internal.baidu.com (unknown [172.31.51.57])
 by Forcepoint Email with ESMTPS id 0E86B127D52D4CDB4906;
 Wed,  1 Sep 2021 15:42:29 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-HQEX01.internal.baidu.com (172.31.51.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 15:42:28 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:42:28 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Date: Wed, 1 Sep 2021 15:42:22 +0800
Message-ID: <20210901074222.9433-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: Make use of the
	helper function devm_platform_ioremap_resource()
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 1c277fbb91f2..97b4e02e43e4 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1899,15 +1899,11 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 
 		nfc->data_phys_addr[chip_cs] = res->start;
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM,
-					    mem_region + 1);
-		nfc->cmd_base[chip_cs] = devm_ioremap_resource(dev, res);
+		nfc->cmd_base[chip_cs] = devm_platform_ioremap_resource(pdev, mem_region + 1);
 		if (IS_ERR(nfc->cmd_base[chip_cs]))
 			return PTR_ERR(nfc->cmd_base[chip_cs]);
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM,
-					    mem_region + 2);
-		nfc->addr_base[chip_cs] = devm_ioremap_resource(dev, res);
+		nfc->addr_base[chip_cs] = devm_platform_ioremap_resource(pdev, mem_region + 2);
 		if (IS_ERR(nfc->addr_base[chip_cs]))
 			return PTR_ERR(nfc->addr_base[chip_cs]);
 	}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
