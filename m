Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860311D0DC
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 16:23:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 238FFC36B0E;
	Thu, 12 Dec 2019 15:23:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45B17C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 13:55:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtmCj130390;
 Thu, 12 Dec 2019 07:55:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576158948;
 bh=3gLGICxAzTQwTc/DkihTZhEXH6qumJS8Bb6FHHUYzCY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZqyfX6ql8GX4aJtV6oPEPl3Z5XmrYLPR/tKcuub+H+f5XcD2+sZbfxPHww3j1HtAk
 UROBweX/WDXlNJKJoN8bU5Z4BCYDe4KZ9OrtdyGsse4nIIYOLRKNhAnGBjkpdIA3Nv
 D1UWa6yx/NB7bmQPQT3EbftiiJt8c1PA2SU/k1RY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtmVE116297;
 Thu, 12 Dec 2019 07:55:48 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:55:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:55:47 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtdqR048444;
 Thu, 12 Dec 2019 07:55:44 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <nsaenzjulienne@suse.de>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <baohua@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Thu, 12 Dec 2019 15:55:42 +0200
Message-ID: <20191212135550.4634-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212135550.4634-1-peter.ujfalusi@ti.com>
References: <20191212135550.4634-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:23:13 +0000
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/9] spi: atmel: Use dma_request_chan()
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
 drivers/spi/spi-atmel.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 56f0ca361deb..013458cabe3c 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -514,26 +514,19 @@ static int atmel_spi_configure_dma(struct spi_master *master,
 	master->dma_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(master->dma_tx)) {
 		err = PTR_ERR(master->dma_tx);
-		if (err == -EPROBE_DEFER) {
-			dev_warn(dev, "no DMA channel available at the moment\n");
-			goto error_clear;
-		}
-		dev_err(dev,
-			"DMA TX channel not available, SPI unable to use DMA\n");
-		err = -EBUSY;
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "No TX DMA channel, DMA is disabled\n");
 		goto error_clear;
 	}
 
-	/*
-	 * No reason to check EPROBE_DEFER here since we have already requested
-	 * tx channel. If it fails here, it's for another reason.
-	 */
-	master->dma_rx = dma_request_slave_channel(dev, "rx");
-
-	if (!master->dma_rx) {
-		dev_err(dev,
-			"DMA RX channel not available, SPI unable to use DMA\n");
-		err = -EBUSY;
+	master->dma_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(master->dma_rx)) {
+		err = PTR_ERR(master->dma_rx);
+		/*
+		 * No reason to check EPROBE_DEFER here since we have already
+		 * requested tx channel.
+		 */
+		dev_err(dev, "No RX DMA channel, DMA is disabled\n");
 		goto error;
 	}
 
@@ -548,7 +541,7 @@ static int atmel_spi_configure_dma(struct spi_master *master,
 
 	return 0;
 error:
-	if (master->dma_rx)
+	if (!IS_ERR(master->dma_rx))
 		dma_release_channel(master->dma_rx);
 	if (!IS_ERR(master->dma_tx))
 		dma_release_channel(master->dma_tx);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
