Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB21143B8E
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2020 12:03:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6C58C36B0C;
	Tue, 21 Jan 2020 11:03:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2587C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 11:03:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LAvnn7016644; Tue, 21 Jan 2020 12:03:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=acTKJs8fYmE1ommQlydH1CvCtyw2ASLm8YNtpOoq6fs=;
 b=0eeMhSuWDFasHv0P3bDmczLdHT6I9guO5H4awHuYKUpaV2o9aH6erH3HWUooyGap1nXp
 g15i7vaPIfb5VsTONUGM8WqVQElt9/cJrZ8NsPBiKjss57BB8mBENDZagDPWYa3x9YhD
 0uKblhTbwXKj1XX8c3/vd9HTtlT9ZVhbh79vSsNDVst0HSYd6qU/QReVY0+ZYeWXa1N+
 9iSJL8qc1jXEgTdJ/qfXEDgCAttK3GQKmZz5qpF5tkTS8XjCnmyuRHakdi14XV4cPQpw
 8mNblruN0sj6poqhP4gp4EZR75vE6go/kLBw8UQpXkmJ5MaW3jmGVJqU69HMApE6p6EI gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc4xb9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 12:03:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79028100038;
 Tue, 21 Jan 2020 12:03:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67CBB2BD3EE;
 Tue, 21 Jan 2020 12:03:04 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 21 Jan 2020 12:03:03 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <jic23@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <fabrice.gasnier@st.com>,
 <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <olivier.moysan@st.com>
Date: Tue, 21 Jan 2020 12:02:56 +0100
Message-ID: <20200121110256.12415-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_03:2020-01-21,
 2020-01-21 signatures=0
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: fix sleep in atomic
	context
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

This commit fixes the error message:
"BUG: sleeping function called from invalid context at kernel/irq/chip.c"
Suppress the trigger irq handler. Make the buffer transfers directly
in DMA callback, instead.
Push buffers without timestamps, as timestamps are not supported
in DFSDM driver.

Fixes: 11646e81d775 ("iio: adc: stm32-dfsdm: add support for buffer modes")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
There is the same issue on STM32 ADC driver.
The solution for ADC driver has been already discussed in the thread
https://lkml.org/lkml/2019/3/30/171
The current patch for STM32 DFSDM driver, bypasses the IIO IRQ trigger
handler, as proposed in this thread.
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 43 +++++++------------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 2aad2cda6943..76a60d93fe23 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -842,31 +842,6 @@ static inline void stm32_dfsdm_process_data(struct stm32_dfsdm_adc *adc,
 	}
 }
 
-static irqreturn_t stm32_dfsdm_adc_trigger_handler(int irq, void *p)
-{
-	struct iio_poll_func *pf = p;
-	struct iio_dev *indio_dev = pf->indio_dev;
-	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
-	int available = stm32_dfsdm_adc_dma_residue(adc);
-
-	while (available >= indio_dev->scan_bytes) {
-		s32 *buffer = (s32 *)&adc->rx_buf[adc->bufi];
-
-		stm32_dfsdm_process_data(adc, buffer);
-
-		iio_push_to_buffers_with_timestamp(indio_dev, buffer,
-						   pf->timestamp);
-		available -= indio_dev->scan_bytes;
-		adc->bufi += indio_dev->scan_bytes;
-		if (adc->bufi >= adc->buf_sz)
-			adc->bufi = 0;
-	}
-
-	iio_trigger_notify_done(indio_dev->trig);
-
-	return IRQ_HANDLED;
-}
-
 static void stm32_dfsdm_dma_buffer_done(void *data)
 {
 	struct iio_dev *indio_dev = data;
@@ -874,11 +849,6 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
 	int available = stm32_dfsdm_adc_dma_residue(adc);
 	size_t old_pos;
 
-	if (indio_dev->currentmode & INDIO_BUFFER_TRIGGERED) {
-		iio_trigger_poll_chained(indio_dev->trig);
-		return;
-	}
-
 	/*
 	 * FIXME: In Kernel interface does not support cyclic DMA buffer,and
 	 * offers only an interface to push data samples per samples.
@@ -906,7 +876,15 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
 			adc->bufi = 0;
 			old_pos = 0;
 		}
-		/* regular iio buffer without trigger */
+		/*
+		 * In DMA mode the trigger services of IIO are not used
+		 * (e.g. no call to iio_trigger_poll).
+		 * Calling irq handler associated to the hardware trigger is not
+		 * relevant as the conversions have already been done. Data
+		 * transfers are performed directly in DMA callback instead.
+		 * This implementation avoids to call trigger irq handler that
+		 * may sleep, in an atomic context (DMA irq handler context).
+		 */
 		if (adc->dev_data->type == DFSDM_IIO)
 			iio_push_to_buffers(indio_dev, buffer);
 	}
@@ -1536,8 +1514,7 @@ static int stm32_dfsdm_adc_init(struct iio_dev *indio_dev)
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev,
-					 &iio_pollfunc_store_time,
-					 &stm32_dfsdm_adc_trigger_handler,
+					 &iio_pollfunc_store_time, NULL,
 					 &stm32_dfsdm_buffer_setup_ops);
 	if (ret) {
 		stm32_dfsdm_dma_release(indio_dev);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
