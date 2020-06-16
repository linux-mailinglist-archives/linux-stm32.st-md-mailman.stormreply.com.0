Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4171FAF2E
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 13:31:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38AE3C36B11;
	Tue, 16 Jun 2020 11:31:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EC54C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 11:30:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GBO12D019879; Tue, 16 Jun 2020 13:30:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Is1HFAKxrRK4M9wTQ7ky+YcCCVHYlPfvKWxElD41J9I=;
 b=hdVbR5ll8P9IF/DCqIP9G5yC0gyORLZAtaFpHlEHLAYcrss21imUCGZ672jRtxl1+Lbv
 RrlD5NcLkRJFxGMc+1djtYauSv8oaE7GPkkMiOG4ROcdaRWtG9gvv4B6/3B6/AKj6M+L
 8IMSsICY8SWe4DyVBdCJqEWXO4q0uM3T7+CMkHkpbqFNc44SOkWFYo4k2dbLjjm7GX15
 VELNUaORbZjL19mUTbAuCVaKPreTimyaNv845pe8Y+WAOwWSkTQWzNYonkdx3ygbXpHF
 05zTm2Tq5WRs10obXx5TShs2TPOruCcqhInCUxeCXhLvjSzxxFc/1SAyLA3t2d2xMoqK qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mm91q2v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 13:30:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB1EB10002A;
 Tue, 16 Jun 2020 13:30:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD57D2C0D26;
 Tue, 16 Jun 2020 13:30:44 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 13:30:44 +0200
From: <patrice.chotard@st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 16 Jun 2020 13:30:35 +0200
Message-ID: <20200616113035.4514-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-16,
 2020-06-16 signatures=0
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] spi: stm32-qspi: Fix error path in case of
	-EPROBE_DEFER
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

From: Patrice Chotard <patrice.chotard@st.com>

In case of -EPROBE_DEFER, stm32_qspi_release() was called
in any case which unregistered driver from pm_runtime framework
even if it has not been registered yet to it. This leads to:

stm32-qspi 58003000.spi: can't setup spi0.0, status -13
spi_master spi0: spi_device register error /soc/spi@58003000/mx66l51235l@0
spi_master spi0: Failed to create SPI device for /soc/spi@58003000/mx66l51235l@0
stm32-qspi 58003000.spi: can't setup spi0.1, status -13
spi_master spi0: spi_device register error /soc/spi@58003000/mx66l51235l@1
spi_master spi0: Failed to create SPI device for /soc/spi@58003000/mx66l51235l@1

On v5.7 kernel,this issue was not "visible", qspi driver was probed
successfully.

Fixes: 9d282c17b023 ("spi: stm32-qspi: Add pm_runtime support")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 drivers/spi/spi-stm32-qspi.c | 46 ++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 3c44bb2fd9b1..a900962b4336 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -553,20 +553,6 @@ static const struct spi_controller_mem_ops stm32_qspi_mem_ops = {
 	.exec_op = stm32_qspi_exec_op,
 };
 
-static void stm32_qspi_release(struct stm32_qspi *qspi)
-{
-	pm_runtime_get_sync(qspi->dev);
-	/* disable qspi */
-	writel_relaxed(0, qspi->io_base + QSPI_CR);
-	stm32_qspi_dma_free(qspi);
-	mutex_destroy(&qspi->lock);
-	pm_runtime_put_noidle(qspi->dev);
-	pm_runtime_disable(qspi->dev);
-	pm_runtime_set_suspended(qspi->dev);
-	pm_runtime_dont_use_autosuspend(qspi->dev);
-	clk_disable_unprepare(qspi->clk);
-}
-
 static int stm32_qspi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -642,7 +628,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		if (ret == -EPROBE_DEFER)
-			goto err_qspi_release;
+			goto err_clk_disable;
 	} else {
 		reset_control_assert(rstc);
 		udelay(2);
@@ -653,7 +639,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, qspi);
 	ret = stm32_qspi_dma_setup(qspi);
 	if (ret)
-		goto err_qspi_release;
+		goto err_dma_free;
 
 	mutex_init(&qspi->lock);
 
@@ -673,15 +659,26 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 
 	ret = devm_spi_register_master(dev, ctrl);
 	if (ret)
-		goto err_qspi_release;
+		goto err_pm_runtime_free;
 
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
-err_qspi_release:
-	stm32_qspi_release(qspi);
+err_pm_runtime_free:
+	pm_runtime_get_sync(qspi->dev);
+	/* disable qspi */
+	writel_relaxed(0, qspi->io_base + QSPI_CR);
+	mutex_destroy(&qspi->lock);
+	pm_runtime_put_noidle(qspi->dev);
+	pm_runtime_disable(qspi->dev);
+	pm_runtime_set_suspended(qspi->dev);
+	pm_runtime_dont_use_autosuspend(qspi->dev);
+err_dma_free:
+	stm32_qspi_dma_free(qspi);
+err_clk_disable:
+	clk_disable_unprepare(qspi->clk);
 err_master_put:
 	spi_master_put(qspi->ctrl);
 
@@ -692,7 +689,16 @@ static int stm32_qspi_remove(struct platform_device *pdev)
 {
 	struct stm32_qspi *qspi = platform_get_drvdata(pdev);
 
-	stm32_qspi_release(qspi);
+	pm_runtime_get_sync(qspi->dev);
+	/* disable qspi */
+	writel_relaxed(0, qspi->io_base + QSPI_CR);
+	stm32_qspi_dma_free(qspi);
+	mutex_destroy(&qspi->lock);
+	pm_runtime_put_noidle(qspi->dev);
+	pm_runtime_disable(qspi->dev);
+	pm_runtime_set_suspended(qspi->dev);
+	pm_runtime_dont_use_autosuspend(qspi->dev);
+	clk_disable_unprepare(qspi->clk);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
