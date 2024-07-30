Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A1940C4D
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2024 10:51:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 699F7C6C841;
	Tue, 30 Jul 2024 08:51:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A89A2C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2024 08:51:27 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U7ujZ8015052;
 Tue, 30 Jul 2024 10:51:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Zc9/X4j3vJ2t4CaIU7+DDvgCjlFR9hhyzjbmNEqyg0M=; b=jEgth1jhjhsLQhQf
 UZV8ZARAIAhzDebr3GVK5fPKsKr7roYphjsebtKYBIqgawwXZZ+WmA4M5H89ZeEy
 ne/oxfMseiUtMclc4WiGefSdhrqnvSV4p914g4pz1rFCH0os6lvxGXz9K8vtADyD
 w4vufZt8CmqgDQ64/n103+S5O4G/XqBr0t+oXYWsH03mJML5cpFcUBJ8LcAQFQAg
 fiVrAEAhu9EPD3GOMlEf0U6qZIDYta1E8qwZoCOauPuu/EhqByUEr9U0OAzc9/Qg
 BjQUdOUDOjAA4bKRuDty3n/ygiVJVJ8MoED01lZzxiAIzNO/o+PBquPzyhF9N5iR
 OlEhMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40naf29e8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 10:51:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C67D240044;
 Tue, 30 Jul 2024 10:50:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3571121ADDB;
 Tue, 30 Jul 2024 10:50:25 +0200 (CEST)
Received: from localhost (10.252.3.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 30 Jul
 2024 10:50:24 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 30 Jul 2024 10:46:39 +0200
Message-ID: <20240730084640.1307938-10-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
References: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.3.32]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_09,2024-07-26_01,2024-05-17_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nuno Sa <nuno.sa@analog.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 9/9] iio: adc: stm32-dfsdm: add scaling
	support to dfsdm
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

Add scaling support to STM32 DFSDM.

When used in an analog context, a DFSDM filter typically converts the data
from a sigma delta modulator. The IIO device associated to the DFSDM
filter provides these data as raw data.
The IIO device can provide scaling information (voltage and offset) to
allow conversion of raw data into physical values.

With the new binding based on IIO backend framework, the sigma delta
modulators are defined as backends providing scaling information.

The scaling is not supported with legacy binding.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Acked-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/iio/adc/Kconfig           |   1 +
 drivers/iio/adc/stm32-dfsdm-adc.c | 105 +++++++++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 43ff8182b2ea..f4f25a4b4719 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1250,6 +1250,7 @@ config STM32_DFSDM_ADC
 	select IIO_BUFFER
 	select IIO_BUFFER_HW_CONSUMER
 	select IIO_TRIGGERED_BUFFER
+	select IIO_BACKEND
 	help
 	  Select this option to support ADCSigma delta modulator for
 	  STMicroelectronics STM32 digital filter for sigma delta converter.
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index ebfeefebf698..1a24d496fc61 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -9,6 +9,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/iio/adc/stm32-dfsdm-adc.h>
+#include <linux/iio/backend.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/hw-consumer.h>
 #include <linux/iio/sysfs.h>
@@ -78,6 +79,7 @@ struct stm32_dfsdm_adc {
 	/* ADC specific */
 	unsigned int oversamp;
 	struct iio_hw_consumer *hwc;
+	struct iio_backend **backend;
 	struct completion completion;
 	u32 *buffer;
 
@@ -672,6 +674,8 @@ static int stm32_dfsdm_generic_channel_parse_of(struct stm32_dfsdm *dfsdm,
 						struct fwnode_handle *node)
 {
 	struct stm32_dfsdm_channel *df_ch;
+	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
+	struct iio_backend *backend;
 	const char *of_str;
 	int ret, val;
 
@@ -721,6 +725,14 @@ static int stm32_dfsdm_generic_channel_parse_of(struct stm32_dfsdm *dfsdm,
 	if (ret != -EINVAL)
 		df_ch->alt_si = 0;
 
+	if (adc->dev_data->type == DFSDM_IIO) {
+		backend = devm_iio_backend_fwnode_get(&indio_dev->dev, NULL, node);
+		if (IS_ERR(backend))
+			return dev_err_probe(&indio_dev->dev, PTR_ERR(backend),
+					     "Failed to get backend\n");
+		adc->backend[ch->scan_index] = backend;
+	}
+
 	return 0;
 }
 
@@ -1056,6 +1068,7 @@ static int stm32_dfsdm_update_scan_mode(struct iio_dev *indio_dev,
 static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
 {
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
+	int i = 0;
 	int ret;
 
 	/* Reset adc buffer index */
@@ -1067,6 +1080,15 @@ static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
 			return ret;
 	}
 
+	if (adc->backend) {
+		while (adc->backend[i]) {
+			ret = iio_backend_enable(adc->backend[i]);
+			if (ret < 0)
+				return ret;
+			i++;
+		}
+	}
+
 	ret = stm32_dfsdm_start_dfsdm(adc->dfsdm);
 	if (ret < 0)
 		goto err_stop_hwc;
@@ -1099,6 +1121,7 @@ static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
 static int stm32_dfsdm_predisable(struct iio_dev *indio_dev)
 {
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
+	int i = 0;
 
 	stm32_dfsdm_stop_conv(indio_dev);
 
@@ -1106,6 +1129,13 @@ static int stm32_dfsdm_predisable(struct iio_dev *indio_dev)
 
 	stm32_dfsdm_stop_dfsdm(adc->dfsdm);
 
+	if (adc->backend) {
+		while (adc->backend[i]) {
+			iio_backend_disable(adc->backend[i]);
+			i++;
+		}
+	}
+
 	if (adc->hwc)
 		iio_hw_consumer_disable(adc->hwc);
 
@@ -1278,8 +1308,16 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
 				int *val2, long mask)
 {
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
+
+	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
+	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fl->fast];
+	u32 max = flo->max << (flo->lshift - chan->scan_type.shift);
+	int idx = chan->scan_index;
 	int ret;
 
+	if (flo->lshift < chan->scan_type.shift)
+		max = flo->max >> (chan->scan_type.shift - flo->lshift);
+
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		ret = iio_device_claim_direct_mode(indio_dev);
@@ -1287,6 +1325,8 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
 			return ret;
 		if (adc->hwc)
 			ret = iio_hw_consumer_enable(adc->hwc);
+		if (adc->backend)
+			ret = iio_backend_enable(adc->backend[idx]);
 		if (ret < 0) {
 			dev_err(&indio_dev->dev,
 				"%s: IIO enable failed (channel %d)\n",
@@ -1297,6 +1337,8 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
 		ret = stm32_dfsdm_single_conv(indio_dev, chan, val);
 		if (adc->hwc)
 			iio_hw_consumer_disable(adc->hwc);
+		if (adc->backend)
+			iio_backend_disable(adc->backend[idx]);
 		if (ret < 0) {
 			dev_err(&indio_dev->dev,
 				"%s: Conversion failed (channel %d)\n",
@@ -1316,6 +1358,50 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
 		*val = adc->sample_freq;
 
 		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		/*
+		 * Scale is expressed in mV.
+		 * When fast mode is disabled, actual resolution may be lower
+		 * than 2^n, where n = realbits - 1.
+		 * This leads to underestimating the input voltage.
+		 * To compensate this deviation, the voltage reference can be
+		 * corrected with a factor = realbits resolution / actual max
+		 */
+		if (adc->backend) {
+			ret = iio_backend_read_scale(adc->backend[idx], chan, val, NULL);
+			if (ret < 0)
+				return ret;
+
+			*val = div_u64((u64)*val * (u64)BIT(DFSDM_DATA_RES - 1), max);
+			*val2 = chan->scan_type.realbits;
+			if (chan->differential)
+				*val *= 2;
+		}
+		return IIO_VAL_FRACTIONAL_LOG2;
+
+	case IIO_CHAN_INFO_OFFSET:
+		/*
+		 * DFSDM output data are in the range [-2^n, 2^n],
+		 * with n = realbits - 1.
+		 * - Differential modulator:
+		 * Offset correspond to SD modulator offset.
+		 * - Single ended modulator:
+		 * Input is in [0V, Vref] range,
+		 * where 0V corresponds to -2^n, and Vref to 2^n.
+		 * Add 2^n to offset. (i.e. middle of input range)
+		 * offset = offset(sd) * vref / res(sd) * max / vref.
+		 */
+		if (adc->backend) {
+			ret = iio_backend_read_offset(adc->backend[idx], chan, val, NULL);
+			if (ret < 0)
+				return ret;
+
+			*val = div_u64((u64)max * *val, BIT(*val2 - 1));
+			if (!chan->differential)
+				*val += max;
+		}
+		return IIO_VAL_INT;
 	}
 
 	return -EINVAL;
@@ -1442,7 +1528,15 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev, struct iio_c
 	 * IIO_CHAN_INFO_RAW: used to compute regular conversion
 	 * IIO_CHAN_INFO_OVERSAMPLING_RATIO: used to set oversampling
 	 */
-	ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+	if (child) {
+		ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+					 BIT(IIO_CHAN_INFO_SCALE) |
+					 BIT(IIO_CHAN_INFO_OFFSET);
+	} else {
+		/* Legacy. Scaling not supported */
+		ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+	}
+
 	ch->info_mask_shared_by_all = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
 					BIT(IIO_CHAN_INFO_SAMP_FREQ);
 
@@ -1571,6 +1665,14 @@ static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)
 		if (IS_ERR(adc->hwc))
 			return dev_err_probe(&indio_dev->dev, -EPROBE_DEFER,
 					     "waiting for SD modulator\n");
+	} else {
+		/* Generic binding. SD modulator IIO device not used. Use SD modulator backend. */
+		adc->hwc = NULL;
+
+		adc->backend = devm_kcalloc(&indio_dev->dev, num_ch, sizeof(*adc->backend),
+					    GFP_KERNEL);
+		if (!adc->backend)
+			return -ENOMEM;
 	}
 
 	ch = devm_kcalloc(&indio_dev->dev, num_ch, sizeof(*ch), GFP_KERNEL);
@@ -1795,3 +1897,4 @@ module_platform_driver(stm32_dfsdm_adc_driver);
 MODULE_DESCRIPTION("STM32 sigma delta ADC");
 MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(IIO_BACKEND);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
