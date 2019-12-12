Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2238411D0DE
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 16:23:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD075C36B14;
	Thu, 12 Dec 2019 15:23:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ED84C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 13:56:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtuq9122218;
 Thu, 12 Dec 2019 07:55:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576158956;
 bh=IBaNIEvB7cLy+PukAGb/PB35woOhPXfCWf9nooovf4U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hvJhHLwWXHgDXi8I2PKoplyV4NlRhLSYaKZSD5ecFI12PY000rSxd80+xnDLjX3/j
 R76TQfyc7cdegWYRwFYOAWUCOnEnWnBP5KHIgtJijGpSU54xAzMIbJ2KUNyDSJnZ5u
 2WCe2sL51i1kmpO1+tkP9wImu9aiKsxfFq4A8Y38=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCDtu6s044382
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Dec 2019 07:55:56 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:55:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:55:55 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtdqT048444;
 Thu, 12 Dec 2019 07:55:52 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <nsaenzjulienne@suse.de>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <baohua@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Thu, 12 Dec 2019 15:55:44 +0200
Message-ID: <20191212135550.4634-4-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212135550.4634-1-peter.ujfalusi@ti.com>
References: <20191212135550.4634-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:23:13 +0000
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/9] spi: bcm2835: Use dma_request_chan()
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
 drivers/spi/spi-bcm2835.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 662d55e9f21d..69df79914504 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -888,8 +888,8 @@ static void bcm2835_dma_release(struct spi_controller *ctlr,
 	}
 }
 
-static void bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
-			     struct bcm2835_spi *bs)
+static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
+			    struct bcm2835_spi *bs)
 {
 	struct dma_slave_config slave_config;
 	const __be32 *addr;
@@ -900,19 +900,24 @@ static void bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	addr = of_get_address(ctlr->dev.of_node, 0, NULL, NULL);
 	if (!addr) {
 		dev_err(dev, "could not get DMA-register address - not using dma mode\n");
-		goto err;
+		/* Fall back to interrupt mode */
+		return 0;
 	}
 	dma_reg_base = be32_to_cpup(addr);
 
 	/* get tx/rx dma */
-	ctlr->dma_tx = dma_request_slave_channel(dev, "tx");
-	if (!ctlr->dma_tx) {
+	ctlr->dma_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(ctlr->dma_tx)) {
 		dev_err(dev, "no tx-dma configuration found - not using dma mode\n");
+		ret = PTR_ERR(ctlr->dma_tx);
+		ctlr->dma_tx = NULL;
 		goto err;
 	}
-	ctlr->dma_rx = dma_request_slave_channel(dev, "rx");
-	if (!ctlr->dma_rx) {
+	ctlr->dma_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(ctlr->dma_rx)) {
 		dev_err(dev, "no rx-dma configuration found - not using dma mode\n");
+		ret = PTR_ERR(ctlr->dma_rx);
+		ctlr->dma_rx = NULL;
 		goto err_release;
 	}
 
@@ -997,7 +1002,7 @@ static void bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	/* all went well, so set can_dma */
 	ctlr->can_dma = bcm2835_spi_can_dma;
 
-	return;
+	return 0;
 
 err_config:
 	dev_err(dev, "issue configuring dma: %d - not using DMA mode\n",
@@ -1005,7 +1010,14 @@ static void bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 err_release:
 	bcm2835_dma_release(ctlr, bs);
 err:
-	return;
+	/*
+	 * Only report error for deferred probing, otherwise fall back to
+	 * interrupt mode
+	 */
+	if (ret != -EPROBE_DEFER)
+		ret = 0;
+
+	return ret;
 }
 
 static int bcm2835_spi_transfer_one_poll(struct spi_controller *ctlr,
@@ -1317,7 +1329,9 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 
 	clk_prepare_enable(bs->clk);
 
-	bcm2835_dma_init(ctlr, &pdev->dev, bs);
+	err = bcm2835_dma_init(ctlr, &pdev->dev, bs);
+	if (err)
+		goto out_clk_disable;
 
 	/* initialise the hardware with the default polarities */
 	bcm2835_wr(bs, BCM2835_SPI_CS,
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
