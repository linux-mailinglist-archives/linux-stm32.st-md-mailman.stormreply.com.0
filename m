Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4411D0E3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 16:23:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AB82C36B27;
	Thu, 12 Dec 2019 15:23:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2B4AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 13:56:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCDuGqo009067;
 Thu, 12 Dec 2019 07:56:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576158976;
 bh=GufpDqc/JsjNnk5yJpyjIjNCslz2RxoV+SAcmiZ8xk8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Nz6TLqNez/VlFzVcmNAVmLTW+ivYsv/Hnj3n02im4EkIY3qdHIbhPWbNfp77t4onc
 nvjel4ZQAzU15S50IvRb0YyiWzLLU12uNlbRzATwx3XJR7NYh16KY/DMfS63M05i82
 TeM1akRUu76tlP4PvOR/ARz4t4F3VF8Znw5rA+Ys=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCDuFKS019946
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Dec 2019 07:56:16 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:56:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:56:15 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtdqY048444;
 Thu, 12 Dec 2019 07:56:11 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <nsaenzjulienne@suse.de>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <baohua@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Thu, 12 Dec 2019 15:55:49 +0200
Message-ID: <20191212135550.4634-9-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212135550.4634-1-peter.ujfalusi@ti.com>
References: <20191212135550.4634-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:23:13 +0000
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/9] spi: stm32-qspi: Use dma_request_chan()
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
 drivers/spi/spi-stm32-qspi.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 4e726929bb4f..4ef569b47aa6 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -470,10 +470,11 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	return 0;
 }
 
-static void stm32_qspi_dma_setup(struct stm32_qspi *qspi)
+static int stm32_qspi_dma_setup(struct stm32_qspi *qspi)
 {
 	struct dma_slave_config dma_cfg;
 	struct device *dev = qspi->dev;
+	int ret = 0;
 
 	memset(&dma_cfg, 0, sizeof(dma_cfg));
 
@@ -484,8 +485,13 @@ static void stm32_qspi_dma_setup(struct stm32_qspi *qspi)
 	dma_cfg.src_maxburst = 4;
 	dma_cfg.dst_maxburst = 4;
 
-	qspi->dma_chrx = dma_request_slave_channel(dev, "rx");
-	if (qspi->dma_chrx) {
+	qspi->dma_chrx = dma_request_chan(dev, "rx");
+	if (IS_ERR(qspi->dma_chrx)) {
+		ret = PTR_ERR(qspi->dma_chrx);
+		qspi->dma_chrx = NULL;
+		if (ret == -EPROBE_DEFER)
+			goto out;
+	} else {
 		if (dmaengine_slave_config(qspi->dma_chrx, &dma_cfg)) {
 			dev_err(dev, "dma rx config failed\n");
 			dma_release_channel(qspi->dma_chrx);
@@ -493,8 +499,11 @@ static void stm32_qspi_dma_setup(struct stm32_qspi *qspi)
 		}
 	}
 
-	qspi->dma_chtx = dma_request_slave_channel(dev, "tx");
-	if (qspi->dma_chtx) {
+	qspi->dma_chtx = dma_request_chan(dev, "tx");
+	if (IS_ERR(qspi->dma_chtx)) {
+		ret = PTR_ERR(qspi->dma_chtx);
+		qspi->dma_chtx = NULL;
+	} else {
 		if (dmaengine_slave_config(qspi->dma_chtx, &dma_cfg)) {
 			dev_err(dev, "dma tx config failed\n");
 			dma_release_channel(qspi->dma_chtx);
@@ -502,7 +511,13 @@ static void stm32_qspi_dma_setup(struct stm32_qspi *qspi)
 		}
 	}
 
+out:
 	init_completion(&qspi->dma_completion);
+
+	if (ret != -EPROBE_DEFER)
+		ret = 0;
+
+	return ret;
 }
 
 static void stm32_qspi_dma_free(struct stm32_qspi *qspi)
@@ -608,7 +623,10 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 
 	qspi->dev = dev;
 	platform_set_drvdata(pdev, qspi);
-	stm32_qspi_dma_setup(qspi);
+	ret = stm32_qspi_dma_setup(qspi);
+	if (ret)
+		goto err;
+
 	mutex_init(&qspi->lock);
 
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
