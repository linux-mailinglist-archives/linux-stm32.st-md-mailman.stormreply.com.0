Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE51E1593D0
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 16:51:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C78C36B0B;
	Tue, 11 Feb 2020 15:51:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45E74C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 15:51:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8376930E;
 Tue, 11 Feb 2020 07:51:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08B753F68E;
 Tue, 11 Feb 2020 07:51:47 -0800 (PST)
Date: Tue, 11 Feb 2020 15:51:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Lionel Debieve <lionel.debieve@st.com>
In-Reply-To: <20200203135048.1299-3-patrice.chotard@st.com>
Message-Id: <applied-20200203135048.1299-3-patrice.chotard@st.com>
X-Patchwork-Hint: ignore
Cc: Etienne Carriere <etienne.carriere@st.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "spi: stm32-qspi: properly manage probe
	errors" to the spi tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The patch

   spi: stm32-qspi: properly manage probe errors

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4a08d6c8662472121b0ddc29180ab3c94c34f586 Mon Sep 17 00:00:00 2001
From: Lionel Debieve <lionel.debieve@st.com>
Date: Mon, 3 Feb 2020 14:50:48 +0100
Subject: [PATCH] spi: stm32-qspi: properly manage probe errors

Fix resource release issues when driver probe operation fails.

Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Link: https://lore.kernel.org/r/20200203135048.1299-3-patrice.chotard@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-stm32-qspi.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 13bb64bf4c8f..d066f5144c3e 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -565,7 +565,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	qspi->io_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(qspi->io_base)) {
 		ret = PTR_ERR(qspi->io_base);
-		goto err;
+		goto err_master_put;
 	}
 
 	qspi->phys_base = res->start;
@@ -574,24 +574,26 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	qspi->mm_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(qspi->mm_base)) {
 		ret = PTR_ERR(qspi->mm_base);
-		goto err;
+		goto err_master_put;
 	}
 
 	qspi->mm_size = resource_size(res);
 	if (qspi->mm_size > STM32_QSPI_MAX_MMAP_SZ) {
 		ret = -EINVAL;
-		goto err;
+		goto err_master_put;
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto err_master_put;
+	}
 
 	ret = devm_request_irq(dev, irq, stm32_qspi_irq, 0,
 			       dev_name(dev), qspi);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
-		goto err;
+		goto err_master_put;
 	}
 
 	init_completion(&qspi->data_completion);
@@ -599,26 +601,26 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	qspi->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(qspi->clk)) {
 		ret = PTR_ERR(qspi->clk);
-		goto err;
+		goto err_master_put;
 	}
 
 	qspi->clk_rate = clk_get_rate(qspi->clk);
 	if (!qspi->clk_rate) {
 		ret = -EINVAL;
-		goto err;
+		goto err_master_put;
 	}
 
 	ret = clk_prepare_enable(qspi->clk);
 	if (ret) {
 		dev_err(dev, "can not enable the clock\n");
-		goto err;
+		goto err_master_put;
 	}
 
 	rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		if (ret == -EPROBE_DEFER)
-			goto err;
+			goto err_qspi_release;
 	} else {
 		reset_control_assert(rstc);
 		udelay(2);
@@ -629,7 +631,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, qspi);
 	ret = stm32_qspi_dma_setup(qspi);
 	if (ret)
-		goto err;
+		goto err_qspi_release;
 
 	mutex_init(&qspi->lock);
 
@@ -645,8 +647,9 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	if (!ret)
 		return 0;
 
-err:
+err_qspi_release:
 	stm32_qspi_release(qspi);
+err_master_put:
 	spi_master_put(qspi->ctrl);
 
 	return ret;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
