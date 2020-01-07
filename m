Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1896132458
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 11:59:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62839C36B0B;
	Tue,  7 Jan 2020 10:59:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36DA5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 10:59:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007AxVUx059569;
 Tue, 7 Jan 2020 04:59:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578394771;
 bh=D7FXGxYVTAceLEBGDbCBjzOcuiBKOxf2M1bFoAUt/NE=;
 h=From:To:CC:Subject:Date;
 b=O6Et+GzsFIiL8cw6eGlrabPSKqFVATT2H4cd3hUkaMmPEUtKpPfMKJFD5ZtWRZGx0
 rz4k6ts+3nixhIrxoeL/4Vet36n+ON69/0fX5DQ4rR3RGj9wGuSqnmqY69+Ez77LHG
 whNlFgnP4hqfmfae4oxvfaCFS76MUUddmEOsCw8U=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007AxVbB040093
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Jan 2020 04:59:31 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 04:59:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 04:59:31 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007AxSIe111229;
 Tue, 7 Jan 2020 04:59:29 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <fabrice.gasnier@st.com>, <lee.jones@linaro.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 7 Jan 2020 12:59:59 +0200
Message-ID: <20200107105959.18920-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: vkoul@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] mfd: stm32-timers: Use dma_request_chan()
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
Hi,

Changes since v1:
- Fall back to PIO mode only in case of ENODEV and report all other errors

Regards,
Peter

 drivers/mfd/stm32-timers.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
index efcd4b980c94..add603359124 100644
--- a/drivers/mfd/stm32-timers.c
+++ b/drivers/mfd/stm32-timers.c
@@ -167,10 +167,11 @@ static void stm32_timers_get_arr_size(struct stm32_timers *ddata)
 	regmap_write(ddata->regmap, TIM_ARR, 0x0);
 }
 
-static void stm32_timers_dma_probe(struct device *dev,
+static int stm32_timers_dma_probe(struct device *dev,
 				   struct stm32_timers *ddata)
 {
 	int i;
+	int ret = 0;
 	char name[4];
 
 	init_completion(&ddata->dma.completion);
@@ -179,14 +180,23 @@ static void stm32_timers_dma_probe(struct device *dev,
 	/* Optional DMA support: get valid DMA channel(s) or NULL */
 	for (i = STM32_TIMERS_DMA_CH1; i <= STM32_TIMERS_DMA_CH4; i++) {
 		snprintf(name, ARRAY_SIZE(name), "ch%1d", i + 1);
-		ddata->dma.chans[i] = dma_request_slave_channel(dev, name);
+		ddata->dma.chans[i] = dma_request_chan(dev, name);
 	}
-	ddata->dma.chans[STM32_TIMERS_DMA_UP] =
-		dma_request_slave_channel(dev, "up");
-	ddata->dma.chans[STM32_TIMERS_DMA_TRIG] =
-		dma_request_slave_channel(dev, "trig");
-	ddata->dma.chans[STM32_TIMERS_DMA_COM] =
-		dma_request_slave_channel(dev, "com");
+	ddata->dma.chans[STM32_TIMERS_DMA_UP] = dma_request_chan(dev, "up");
+	ddata->dma.chans[STM32_TIMERS_DMA_TRIG] = dma_request_chan(dev, "trig");
+	ddata->dma.chans[STM32_TIMERS_DMA_COM] = dma_request_chan(dev, "com");
+
+	for (i = STM32_TIMERS_DMA_CH1; i < STM32_TIMERS_MAX_DMAS; i++) {
+		if (IS_ERR(ddata->dma.chans[i])) {
+			/* Save the first error code to return */
+			if (PTR_ERR(ddata->dma.chans[i]) != -ENODEV && !ret)
+				ret = PTR_ERR(ddata->dma.chans[i]);
+
+			ddata->dma.chans[i] = NULL;
+		}
+	}
+
+	return ret;
 }
 
 static void stm32_timers_dma_remove(struct device *dev,
@@ -230,7 +240,11 @@ static int stm32_timers_probe(struct platform_device *pdev)
 
 	stm32_timers_get_arr_size(ddata);
 
-	stm32_timers_dma_probe(dev, ddata);
+	ret = stm32_timers_dma_probe(dev, ddata);
+	if (ret) {
+		stm32_timers_dma_remove(dev, ddata);
+		return ret;
+	}
 
 	platform_set_drvdata(pdev, ddata);
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
