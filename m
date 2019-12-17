Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D41225E0
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 08:52:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4669CC36B0B;
	Tue, 17 Dec 2019 07:52:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF06CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 07:52:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH7q8a8082887;
 Tue, 17 Dec 2019 01:52:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576569128;
 bh=JVOtlzp4SCMmIRdgV0Dwkwtw1zBJBOLFQP857cg/zhQ=;
 h=From:To:CC:Subject:Date;
 b=DQagl2Z9mA1II7/LrIfOiy+kvnFSvq3LR3YTlC9lD84Uor6OTYU0zqJ5QNAkjXRS5
 IqFGPMfHchR75vQ7BqWh0VTz+v6B76K3TtXcE1DJupzGuHCBVn16BaYcag7sw8h2k5
 rGBNOjHJ1PoW29Y8SrgJfYWZE47i88SCielTyrJY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH7q8jP049798
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Dec 2019 01:52:08 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 01:52:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 01:52:08 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH7q5MV115230;
 Tue, 17 Dec 2019 01:52:06 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <jic23@kernel.org>, <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 17 Dec 2019 09:52:21 +0200
Message-ID: <20191217075221.23895-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-iio@vger.kernel.org, vkoul@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: Use dma_request_chan()
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
 drivers/iio/adc/stm32-dfsdm-adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index e493242c266e..3aac1a21f9d0 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1383,9 +1383,9 @@ static int stm32_dfsdm_dma_request(struct iio_dev *indio_dev)
 {
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
 
-	adc->dma_chan = dma_request_slave_channel(&indio_dev->dev, "rx");
-	if (!adc->dma_chan)
-		return -EINVAL;
+	adc->dma_chan = dma_request_chan(&indio_dev->dev, "rx");
+	if (IS_ERR(adc->dma_chan))
+		return PTR_ERR(adc->dma_chan);
 
 	adc->rx_buf = dma_alloc_coherent(adc->dma_chan->device->dev,
 					 DFSDM_DMA_BUFFER_SIZE,
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
