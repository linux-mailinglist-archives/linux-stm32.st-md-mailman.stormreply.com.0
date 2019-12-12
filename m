Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926E11D0E4
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 16:23:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39A04C36B2A;
	Thu, 12 Dec 2019 15:23:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB90CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 13:56:26 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCDuJC3130575;
 Thu, 12 Dec 2019 07:56:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576158979;
 bh=sT2GTlfLRw0eUXbETF9GVVQ6WAg3uD6MtSWiMfyqi+M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=RsOFgEThAZihJpqCZMapImij1AG0ZEd06hlyMRl5+UDp6U3N7xHaJORSvQZSyZayi
 vZH5625luHJSMUF9zXBaNVuWFpANZE6VQH0Wk4oJKqDWerLRmUQ2ShLOlWfYnFM/7m
 7/lAV2rm7YGPF653rxtp+GRYimudAe4wCXKsNIrE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCDuJM0045145
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Dec 2019 07:56:19 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:56:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:56:19 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtdqZ048444;
 Thu, 12 Dec 2019 07:56:15 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <nsaenzjulienne@suse.de>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <baohua@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Thu, 12 Dec 2019 15:55:50 +0200
Message-ID: <20191212135550.4634-10-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212135550.4634-1-peter.ujfalusi@ti.com>
References: <20191212135550.4634-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:23:13 +0000
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 9/9] spi: stm32: Use dma_request_chan()
	instead dma_request_slave_channel()
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

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/spi/spi-stm32.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 7d75632c4151..e041f9c4ec47 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1879,17 +1879,29 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	master->transfer_one = stm32_spi_transfer_one;
 	master->unprepare_message = stm32_spi_unprepare_msg;
 
-	spi->dma_tx = dma_request_slave_channel(spi->dev, "tx");
-	if (!spi->dma_tx)
+	spi->dma_tx = dma_request_chan(spi->dev, "tx");
+	if (IS_ERR(spi->dma_tx)) {
+		ret = PTR_ERR(spi->dma_tx);
+		spi->dma_tx = NULL;
+		if (ret == -EPROBE_DEFER)
+			goto err_clk_disable;
+
 		dev_warn(&pdev->dev, "failed to request tx dma channel\n");
-	else
+	} else {
 		master->dma_tx = spi->dma_tx;
+	}
+
+	spi->dma_rx = dma_request_chan(spi->dev, "rx");
+	if (IS_ERR(spi->dma_rx)) {
+		ret = PTR_ERR(spi->dma_rx);
+		spi->dma_rx = NULL;
+		if (ret == -EPROBE_DEFER)
+			goto err_dma_release;
 
-	spi->dma_rx = dma_request_slave_channel(spi->dev, "rx");
-	if (!spi->dma_rx)
 		dev_warn(&pdev->dev, "failed to request rx dma channel\n");
-	else
+	} else {
 		master->dma_rx = spi->dma_rx;
+	}
 
 	if (spi->dma_tx || spi->dma_rx)
 		master->can_dma = stm32_spi_can_dma;
@@ -1901,26 +1913,26 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "spi master registration failed: %d\n",
 			ret);
-		goto err_dma_release;
+		goto err_pm_disable;
 	}
 
 	if (!master->cs_gpiods) {
 		dev_err(&pdev->dev, "no CS gpios available\n");
 		ret = -EINVAL;
-		goto err_dma_release;
+		goto err_pm_disable;
 	}
 
 	dev_info(&pdev->dev, "driver initialized\n");
 
 	return 0;
 
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
 err_dma_release:
 	if (spi->dma_tx)
 		dma_release_channel(spi->dma_tx);
 	if (spi->dma_rx)
 		dma_release_channel(spi->dma_rx);
-
-	pm_runtime_disable(&pdev->dev);
 err_clk_disable:
 	clk_disable_unprepare(spi->clk);
 err_master_put:
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
