Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F01C6C88
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 11:12:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ED39C32EA8;
	Wed,  6 May 2020 09:12:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2176CC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 09:12:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04697NJC015640; Wed, 6 May 2020 11:12:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MMKMMyzzzPUYk6uvJXUW0sOtOYv8aZUtFOljFKKKfZg=;
 b=UIrOEqnuUC+yuNFdoPB8dBgMASgXas4z6QxHym5lOBNBrWmVjVtzMy17WjLskv9qSNBB
 lVqvlem1iOauARZUIANl/xI8oIl869Clf83jR6oyIWwNrUEEoCtxyHJu77bZ9aidLAtK
 Ipn+lwb+9dO1uWNIbSAZw+TSCRfc1xnciHWkB4vj77KHw07aHDJ/+kmVnDXnHEtj2Zc8
 JTclOO1Giym/oNpU05R+bwqa5Om8GjeA2VVaYdc+09kV3WKOUO6MhFYHKj5L2oClM6j/
 qgrekzbtrEsM51/dMn6N0aKUg1DGIujwv37PiUp7m8hcb7nqDe8D3yIpLwAOod9Bc43j Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxmvn2q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 11:12:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46AF210002A;
 Wed,  6 May 2020 11:12:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 350132AB47E;
 Wed,  6 May 2020 11:12:35 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 6 May 2020 11:12:34 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <gregkh@linuxfoundation.org>, <boris.brezillon@collabora.com>
Date: Wed, 6 May 2020 11:11:19 +0200
Message-ID: <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_03:2020-05-04,
 2020-05-06 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get
	resources from parent node
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

FMC2 EBI support has been added. Common resources (registers base
and clock) are now shared between the 2 drivers. It means that the
common resources should now be found in the parent device when EBI
node is available.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 drivers/mtd/nand/raw/Kconfig           |  3 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 89 +++++++++++++++++++++++-----------
 2 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 12b715a..28dccd5 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -419,8 +419,7 @@ config MTD_NAND_TEGRA
 config MTD_NAND_STM32_FMC2
 	tristate "Support for NAND controller on STM32MP SoCs"
 	depends on MACH_STM32MP157 || COMPILE_TEST
-	select REGMAP
-	select REGMAP_MMIO
+	select MFD_SYSCON
 	help
 	  Enables support for NAND Flash chips on SoCs containing the FMC2
 	  NAND controller. This controller is found on STM32MP SoCs.
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 76571da..dfab6b1 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -11,8 +11,10 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mtd/rawnand.h>
+#include <linux/of_address.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -204,16 +206,6 @@
 #define FMC2_BCHDSR4_EBP7		GENMASK(12, 0)
 #define FMC2_BCHDSR4_EBP8		GENMASK(28, 16)
 
-/* Regmap registers configuration */
-#define FMC2_MAX_REGISTER		0x3fc
-
-static const struct regmap_config stm32_fmc2_regmap_cfg = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = sizeof(u32),
-	.max_register = FMC2_MAX_REGISTER,
-};
-
 enum stm32_fmc2_ecc {
 	FMC2_ECC_HAM = 1,
 	FMC2_ECC_BCH4 = 4,
@@ -261,6 +253,7 @@ struct stm32_fmc2_nfc {
 	phys_addr_t data_phys_addr[FMC2_MAX_CE];
 	struct clk *clk;
 	u8 irq_state;
+	bool has_parent;
 
 	struct dma_chan *dma_tx_ch;
 	struct dma_chan *dma_rx_ch;
@@ -1384,8 +1377,9 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr |= FIELD_PREP(FMC2_PCR_TAR, FMC2_PCR_TAR_DEFAULT);
 
 	/* Enable FMC2 controller */
-	regmap_update_bits(nfc->regmap, FMC2_BCR1,
-			   FMC2_BCR1_FMC2EN, FMC2_BCR1_FMC2EN);
+	if (!nfc->has_parent)
+		regmap_update_bits(nfc->regmap, FMC2_BCR1,
+				   FMC2_BCR1_FMC2EN, FMC2_BCR1_FMC2EN);
 
 	regmap_write(nfc->regmap, FMC2_PCR, pcr);
 	regmap_write(nfc->regmap, FMC2_PMEM, FMC2_PMEM_DEFAULT);
@@ -1815,6 +1809,53 @@ static int stm32_fmc2_nfc_parse_dt(struct stm32_fmc2_nfc *nfc)
 	return ret;
 }
 
+static int stm32_fmc2_nfc_set_regmap_clk(struct platform_device *pdev,
+					 struct stm32_fmc2_nfc *nfc)
+{
+	struct device *dev = &pdev->dev;
+	struct resource res;
+	int ret;
+
+	if (nfc->has_parent)
+		dev = dev->parent;
+
+	ret = of_address_to_resource(dev->of_node, 0, &res);
+	if (ret)
+		return ret;
+
+	nfc->io_phys_addr = res.start;
+
+	nfc->regmap = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(nfc->regmap))
+		return PTR_ERR(nfc->regmap);
+
+	nfc->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(nfc->clk))
+		return PTR_ERR(nfc->clk);
+
+	return 0;
+}
+
+static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
+{
+	u32 i;
+	int nb_resources = 0;
+
+	/* Count the number of resources in reg property */
+	for (i = 0; i < pdev->num_resources; i++) {
+		struct resource *res = &pdev->resource[i];
+
+		if (resource_type(res) == IORESOURCE_MEM)
+			nb_resources++;
+	}
+
+	/* Each CS needs 3 resources defined (data, cmd and addr) */
+	if (nb_resources % 3)
+		return false;
+
+	return true;
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1824,8 +1865,8 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
-	void __iomem *mmio;
 	int chip_cs, mem_region, ret, irq;
+	int num_region = 1;
 
 	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
 	if (!nfc)
@@ -1834,23 +1875,19 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
+	nfc->has_parent = stm32_fmc2_nfc_check_for_parent(pdev);
+	if (nfc->has_parent)
+		num_region = 0;
 
 	ret = stm32_fmc2_nfc_parse_dt(nfc);
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mmio = devm_ioremap_resource(dev, res);
-	if (IS_ERR(mmio))
-		return PTR_ERR(mmio);
-
-	nfc->regmap = devm_regmap_init_mmio(dev, mmio, &stm32_fmc2_regmap_cfg);
-	if (IS_ERR(nfc->regmap))
-		return PTR_ERR(nfc->regmap);
-
-	nfc->io_phys_addr = res->start;
+	ret = stm32_fmc2_nfc_set_regmap_clk(pdev, nfc);
+	if (ret)
+		return ret;
 
-	for (chip_cs = 0, mem_region = 1; chip_cs < FMC2_MAX_CE;
+	for (chip_cs = 0, mem_region = num_region; chip_cs < FMC2_MAX_CE;
 	     chip_cs++, mem_region += 3) {
 		if (!(nfc->cs_assigned & BIT(chip_cs)))
 			continue;
@@ -1888,10 +1925,6 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 
 	init_completion(&nfc->complete);
 
-	nfc->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(nfc->clk))
-		return PTR_ERR(nfc->clk);
-
 	ret = clk_prepare_enable(nfc->clk);
 	if (ret) {
 		dev_err(dev, "can not enable the clock\n");
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
