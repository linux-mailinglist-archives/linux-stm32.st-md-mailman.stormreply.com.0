Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17A490885
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jan 2022 13:18:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54798C5C82B;
	Mon, 17 Jan 2022 12:18:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8E2EC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 12:18:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HB8SZj003347;
 Mon, 17 Jan 2022 13:17:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=eAGtpLGxSBUIlXwyUQAhV0dqyriUuuNNn2oh2mbZPlM=;
 b=DgNwH5wkS7WR5MsVB12K4Hb0y95syoI73hW3Hz1yatctkv9FKEEVO9/sBLdXUcb8NxpX
 PxmpDHxk5GTZ4/XkippKkmIYortMSjixxKXym0a+16yktuzeTrKd28NmYAq3PckEd2Z8
 jRxlaD2f34CBPLxWbxyhBmzYPHErJfvqZwFVTO8P2fkUINMp670qDpRjaaVlXnnlReel
 yROuzJrW40UviuGdsjgkOYWPM9XCLuRjAtl7Rya3rqdOMahZOrh+F68RKgDTO8KDTNy4
 S5xoigD63gMP+WHXx4b78cgWphAhSCbWQZIXj1utwlr55BGORQM8U59/2TULiWjsLp3K DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmq5g4gkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 13:17:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F45110002A;
 Mon, 17 Jan 2022 13:17:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94AEF214D28;
 Mon, 17 Jan 2022 13:17:57 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 13:17:57
 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Mon, 17 Jan 2022 13:17:44 +0100
Message-ID: <20220117121744.29729-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_05,2022-01-14_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] spi: stm32-qspi: Update spi registering
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Some device driver need to communicate to qspi device during the remove
process, qspi controller must be functional when spi_unregister_master()
is called.

To ensure this, replace devm_spi_register_master() by spi_register_master()
and spi_unregister_master() is called directly in .remove callback before
stopping the qspi controller.

This issue was put in evidence using kernel v5.11 and later
with a spi-nor which supports the software reset feature introduced
by commit d73ee7534cc5 ("mtd: spi-nor: core: perform a Soft Reset on
shutdown")

Fixes: c530cd1d9d5e ("spi: spi-mem: add stm32 qspi controller")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: <stable@vger.kernel.org> # 5.8.x
---

v3: 
  _ Update error path due to devm_spi_alloc_master() usage

v2: 
  _ update commit message
  _ make usage of devm_spi_alloc_master() instead of spi_alloc_master()

 drivers/spi/spi-stm32-qspi.c | 47 +++++++++++++-----------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 514337c86d2c..ffdc55f87e82 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -688,7 +688,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret, irq;
 
-	ctrl = spi_alloc_master(dev, sizeof(*qspi));
+	ctrl = devm_spi_alloc_master(dev, sizeof(*qspi));
 	if (!ctrl)
 		return -ENOMEM;
 
@@ -697,58 +697,46 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi");
 	qspi->io_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(qspi->io_base)) {
-		ret = PTR_ERR(qspi->io_base);
-		goto err_master_put;
-	}
+	if (IS_ERR(qspi->io_base))
+		return PTR_ERR(qspi->io_base);
 
 	qspi->phys_base = res->start;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mm");
 	qspi->mm_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(qspi->mm_base)) {
-		ret = PTR_ERR(qspi->mm_base);
-		goto err_master_put;
-	}
+	if (IS_ERR(qspi->mm_base))
+		return PTR_ERR(qspi->mm_base);
 
 	qspi->mm_size = resource_size(res);
-	if (qspi->mm_size > STM32_QSPI_MAX_MMAP_SZ) {
-		ret = -EINVAL;
-		goto err_master_put;
-	}
+	if (qspi->mm_size > STM32_QSPI_MAX_MMAP_SZ)
+		return -EINVAL;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_master_put;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_irq(dev, irq, stm32_qspi_irq, 0,
 			       dev_name(dev), qspi);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
-		goto err_master_put;
+		return ret;
 	}
 
 	init_completion(&qspi->data_completion);
 	init_completion(&qspi->match_completion);
 
 	qspi->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(qspi->clk)) {
-		ret = PTR_ERR(qspi->clk);
-		goto err_master_put;
-	}
+	if (IS_ERR(qspi->clk))
+		return PTR_ERR(qspi->clk);
 
 	qspi->clk_rate = clk_get_rate(qspi->clk);
-	if (!qspi->clk_rate) {
-		ret = -EINVAL;
-		goto err_master_put;
-	}
+	if (!qspi->clk_rate)
+		return -EINVAL;
 
 	ret = clk_prepare_enable(qspi->clk);
 	if (ret) {
 		dev_err(dev, "can not enable the clock\n");
-		goto err_master_put;
+		return ret;
 	}
 
 	rstc = devm_reset_control_get_exclusive(dev, NULL);
@@ -784,7 +772,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_noresume(dev);
 
-	ret = devm_spi_register_master(dev, ctrl);
+	ret = spi_register_master(ctrl);
 	if (ret)
 		goto err_pm_runtime_free;
 
@@ -806,8 +794,6 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	stm32_qspi_dma_free(qspi);
 err_clk_disable:
 	clk_disable_unprepare(qspi->clk);
-err_master_put:
-	spi_master_put(qspi->ctrl);
 
 	return ret;
 }
@@ -817,6 +803,7 @@ static int stm32_qspi_remove(struct platform_device *pdev)
 	struct stm32_qspi *qspi = platform_get_drvdata(pdev);
 
 	pm_runtime_get_sync(qspi->dev);
+	spi_unregister_master(qspi->ctrl);
 	/* disable qspi */
 	writel_relaxed(0, qspi->io_base + QSPI_CR);
 	stm32_qspi_dma_free(qspi);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
