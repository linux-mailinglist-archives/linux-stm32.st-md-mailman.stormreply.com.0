Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52946340038
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 08:25:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09970C57B79;
	Thu, 18 Mar 2021 07:25:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39CA0C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 07:25:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12I7LxaQ026406; Thu, 18 Mar 2021 08:24:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=L6hFjRfW38kA/3DDVvaywuHi1CE85UA4QEQ5HDfFuqQ=;
 b=S28fc1q7ySmJ5ulkisVhFlqcZTtLyeyiFq6KUa5oqFJKP0CWW/Pl/dtwmdnsnIHOS/Vy
 niCpoAhbXmnXy1ch+aqzh/W+yY/k7+yAEOoByqtfS2WRADYLUU64Or+onYwpSscepDX6
 KP9ZvkueMQFeyxsjE8l4TToKJ6He2lXzjqHym73GVwdPQWuGCaQB32MzumKo4Qp2jM89
 /jSO9E1+eAaXTA6STisEvNgkrfmQlMP3Q2FYvai8uIAW3Cin/MxqkbH14IYTJEfKpB3/
 JYVHYm2s0pcoCwr5HpFt0zItfXKyfxfF1Z1/vVj6ejIvMLOdzhRQfODd3koLQtvqEZkv fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37a8pr9kue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 08:24:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A1F510002A;
 Thu, 18 Mar 2021 08:24:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83936220FC0;
 Thu, 18 Mar 2021 08:24:50 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 08:24:50
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <broonie@kernel.org>, <amelie.delaunay@foss.st.com>
Date: Thu, 18 Mar 2021 08:24:50 +0100
Message-ID: <1616052290-10887-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_02:2021-03-17,
 2021-03-18 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: Fix use-after-free on unbind
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

stm32_spi_remove() accesses the driver's private data after calling
spi_unregister_master() even though that function releases the last
reference on the spi_master and thereby frees the private data.

Fix by switching over to the new devm_spi_alloc_master() helper which
keeps the private data accessible until the driver has unbound.

Fixes: 8d559a64f00b ("spi: stm32: drop devres version of spi_register_master")

Reported-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 97cf3a2d4180..7f0244a246e9 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1803,7 +1803,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	struct reset_control *rst;
 	int ret;
 
-	master = spi_alloc_master(&pdev->dev, sizeof(struct stm32_spi));
+	master = devm_spi_alloc_master(&pdev->dev, sizeof(struct stm32_spi));
 	if (!master) {
 		dev_err(&pdev->dev, "spi master allocation failed\n");
 		return -ENOMEM;
@@ -1821,18 +1821,16 @@ static int stm32_spi_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	spi->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(spi->base)) {
-		ret = PTR_ERR(spi->base);
-		goto err_master_put;
-	}
+	if (IS_ERR(spi->base))
+		return PTR_ERR(spi->base);
 
 	spi->phys_addr = (dma_addr_t)res->start;
 
 	spi->irq = platform_get_irq(pdev, 0);
-	if (spi->irq <= 0) {
-		ret = dev_err_probe(&pdev->dev, spi->irq, "failed to get irq\n");
-		goto err_master_put;
-	}
+	if (spi->irq <= 0)
+		return dev_err_probe(&pdev->dev, spi->irq,
+				     "failed to get irq\n");
+
 	ret = devm_request_threaded_irq(&pdev->dev, spi->irq,
 					spi->cfg->irq_handler_event,
 					spi->cfg->irq_handler_thread,
@@ -1840,20 +1838,20 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "irq%d request failed: %d\n", spi->irq,
 			ret);
-		goto err_master_put;
+		return ret;
 	}
 
 	spi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk)) {
 		ret = PTR_ERR(spi->clk);
 		dev_err(&pdev->dev, "clk get failed: %d\n", ret);
-		goto err_master_put;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(spi->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "clk enable failed: %d\n", ret);
-		goto err_master_put;
+		return ret;
 	}
 	spi->clk_rate = clk_get_rate(spi->clk);
 	if (!spi->clk_rate) {
@@ -1949,8 +1947,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
 		dma_release_channel(spi->dma_rx);
 err_clk_disable:
 	clk_disable_unprepare(spi->clk);
-err_master_put:
-	spi_master_put(master);
 
 	return ret;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
