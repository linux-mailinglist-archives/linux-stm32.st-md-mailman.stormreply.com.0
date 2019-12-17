Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623312293E
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 11:52:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E661BC36B0B;
	Tue, 17 Dec 2019 10:52:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5347C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 10:52:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHAqSQ7021780;
 Tue, 17 Dec 2019 04:52:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576579948;
 bh=MnppYqWFagjABTCEaRtDQDACXWEBFJi+7m0e6X3GYEg=;
 h=From:To:CC:Subject:Date;
 b=Shbo92/qOmBGGLk11XqpYELmm0D1uRJRMJ9jCixaDdvt/SF+hVm12KhOJNKX0pUvP
 Uti6aZhRY8dfh0OpBi4Bzib0b6MVhex7jbCc+HdJB69nu4BcnwpgJQ5w+JPnrN6fBO
 d6hlpBLbcLhP20nUW4n9vMEfpK5HiZN+oKDIqAjQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHAqSPP068295
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Dec 2019 04:52:28 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 04:52:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 04:52:28 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHAqP6G047872;
 Tue, 17 Dec 2019 04:52:26 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <fabrice.gasnier@st.com>, <lee.jones@linaro.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 17 Dec 2019 12:52:40 +0200
Message-ID: <20191217105240.25648-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: vkoul@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] mfd: stm32-timers: Use dma_request_chan()
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
 drivers/mfd/stm32-timers.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
index efcd4b980c94..34747e8a4a40 100644
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
@@ -179,14 +180,22 @@ static void stm32_timers_dma_probe(struct device *dev,
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
+			if (PTR_ERR(ddata->dma.chans[i]) == -EPROBE_DEFER)
+				ret = -EPROBE_DEFER;
+
+			ddata->dma.chans[i] = NULL;
+		}
+	}
+
+	return ret;
 }
 
 static void stm32_timers_dma_remove(struct device *dev,
@@ -230,7 +239,11 @@ static int stm32_timers_probe(struct platform_device *pdev)
 
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
