Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B43117C23C
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Mar 2020 16:55:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8A1FC36B0B;
	Fri,  6 Mar 2020 15:55:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A1E7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 15:55:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026FsGah030759; Fri, 6 Mar 2020 16:54:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=8+YFUYs96OeEzRQg1qbRyqAhuHAgY/sTMrlNmK3AxsI=;
 b=f2tyXami/1p6FmsCHOVees/qhHxaYS4rhcgqOyY7Ozm3RVuTVzafSKpqQMgFisDshQqz
 MmIvYDy6PB//YsqyU3JSLDpCIzEQ4QgZKWnQAUimGG9Vq+EeNP2Edy9DtJ06KcDF/zYL
 ekAbQJi5mqbj1JA3uDWvrVjby5li7mkpRCRmB04T+W+2f1y+nvzP8VVjhVItQVqHOmI4
 wZ05pH9HqAQn26U5GEEtDvhmBgEFwdzEtJ/V+eUubnp6ezufaWcboNOqZDQ568yllIxY
 UjS6sGgXgvsUG3JM9zzMnZ1NMHmMt8ZohwPB5UD+ANFs70vggTaV+YiF+/Czt1cHhTGm PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem1g9ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 16:54:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F20810003A;
 Fri,  6 Mar 2020 16:54:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C9522BE23F;
 Fri,  6 Mar 2020 16:54:45 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 6 Mar 2020 16:54:44 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <jic23@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <alexandre.torgue@st.com>,
 <fabrice.gasnier@st.com>, <benjamin.gaignard@st.com>,
 <olivier.moysan@st.com>
Date: Fri, 6 Mar 2020 16:53:35 +0100
Message-ID: <20200306155335.6019-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_05:2020-03-06,
 2020-03-06 signatures=0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: fix sleep in atomic
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

This commit fixes the following error:
"BUG: sleeping function called from invalid context at kernel/irq/chip.c"

In DMA mode suppress the trigger irq handler, and make the buffer
transfers directly in DMA callback, instead.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
This solution has been already discussed in the thread
https://lkml.org/lkml/2019/3/30/171, and applied in STM32 DFSDM driver:
e19ac9d9a978 ("iio: adc: stm32-dfsdm: fix sleep in atomic context")
---
 drivers/iio/adc/stm32-adc.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 80c3f963527b..ae622ee6d08c 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1418,8 +1418,30 @@ static unsigned int stm32_adc_dma_residue(struct stm32_adc *adc)
 static void stm32_adc_dma_buffer_done(void *data)
 {
 	struct iio_dev *indio_dev = data;
+	struct stm32_adc *adc = iio_priv(indio_dev);
+	int residue = stm32_adc_dma_residue(adc);
+
+	/*
+	 * In DMA mode the trigger services of IIO are not used
+	 * (e.g. no call to iio_trigger_poll).
+	 * Calling irq handler associated to the hardware trigger is not
+	 * relevant as the conversions have already been done. Data
+	 * transfers are performed directly in DMA callback instead.
+	 * This implementation avoids to call trigger irq handler that
+	 * may sleep, in an atomic context (DMA irq handler context).
+	 */
+	dev_dbg(&indio_dev->dev, "%s bufi=%d\n", __func__, adc->bufi);
 
-	iio_trigger_poll_chained(indio_dev->trig);
+	while (residue >= indio_dev->scan_bytes) {
+		u16 *buffer = (u16 *)&adc->rx_buf[adc->bufi];
+
+		iio_push_to_buffers(indio_dev, buffer);
+
+		residue -= indio_dev->scan_bytes;
+		adc->bufi += indio_dev->scan_bytes;
+		if (adc->bufi >= adc->rx_buf_sz)
+			adc->bufi = 0;
+	}
 }
 
 static int stm32_adc_dma_start(struct iio_dev *indio_dev)
@@ -1845,6 +1867,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev;
 	struct device *dev = &pdev->dev;
+	irqreturn_t (*handler)(int irq, void *p) = NULL;
 	struct stm32_adc *adc;
 	int ret;
 
@@ -1911,9 +1934,11 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	if (!adc->dma_chan)
+		handler = &stm32_adc_trigger_handler;
+
 	ret = iio_triggered_buffer_setup(indio_dev,
-					 &iio_pollfunc_store_time,
-					 &stm32_adc_trigger_handler,
+					 &iio_pollfunc_store_time, handler,
 					 &stm32_adc_buffer_setup_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "buffer setup failed\n");
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
