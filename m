Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42047916C24
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 17:11:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF07C71287;
	Tue, 25 Jun 2024 15:11:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AB2DC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 15:11:26 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PCZSM4006217;
 Tue, 25 Jun 2024 17:11:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 sya546o/j0qAdmPghowB/Eht7ONMIhA6kC33KlKtK/g=; b=xALHQu7A8R59j4uJ
 T8Obh9JiVKhPh025LzlStVs4CLlwbCLx3t9OqvY2PVmfdfMcso0WMBXyG8it8OhM
 BkSqO1Nztza5mRrhKi7TLzbClrQKEMGhEjMpHKfItxMYpL8CHBcllAU9O/+isxIJ
 G4HRFeQf987XD5IINS0fqfznAA1yBpPp4O2soaMMh99Nqmiu3ZhMTeQ/exwVynzX
 WZcX9H8mMV2kWQZHct4Aeh2L5f1nGLRaDqBvTiLI7tS0t8LlBURGUb+OD5WYL5JN
 48jmtF1sq0WF0C4+/o1zpc01CObfkfG78USRCPkja/7Z4vjahSVdgM1JHOid8rpS
 N0FxXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx860je35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 17:11:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1283040044;
 Tue, 25 Jun 2024 17:11:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53F89218631;
 Tue, 25 Jun 2024 17:10:33 +0200 (CEST)
Received: from localhost (10.252.26.63) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 25 Jun
 2024 17:10:32 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 25 Jun 2024 17:07:14 +0200
Message-ID: <20240625150717.1038212-7-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625150717.1038212-1-olivier.moysan@foss.st.com>
References: <20240625150717.1038212-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.26.63]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_10,2024-06-25_01,2024-05-17_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/8] iio: adc: stm32-dfsdm: adopt generic
	channels bindings
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

Move to generic channels binding to ease new backend framework adoption
and prepare the convergence with MDF IP support on STM32MP2 SoC family.

Legacy binding:
DFSDM is an IIO channel consumer.
SD modulator is an IIO channels provider.
The channel phandles are provided in DT through io-channels property
and channel indexes through st,adc-channels property.

New binding:
DFSDM is an IIO channel provider.
The channel indexes are given by reg property in channel child node.

This new binding is intended to be used with SD modulator IIO backends.
It does not support SD modulator legacy IIO devices.
The st,adc-channels property presence is used to discriminate
between legacy and backend bindings.

The support of the DFSDM legacy channels and SD modulator IIO devices
is kept for backward compatibility.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 208 ++++++++++++++++++++++++------
 1 file changed, 171 insertions(+), 37 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index fabd654245f5..0df28c9dfa40 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -666,6 +666,64 @@ static int stm32_dfsdm_channel_parse_of(struct stm32_dfsdm *dfsdm,
 	return 0;
 }
 
+static int stm32_dfsdm_generic_channel_parse_of(struct stm32_dfsdm *dfsdm,
+						struct iio_dev *indio_dev,
+						struct iio_chan_spec *ch,
+						struct fwnode_handle *node)
+{
+	struct stm32_dfsdm_channel *df_ch;
+	const char *of_str;
+	int ret, val;
+
+	ret = fwnode_property_read_u32(node, "reg", &ch->channel);
+	if (ret < 0) {
+		dev_err(&indio_dev->dev, "Missing channel index %d\n", ret);
+		return ret;
+	}
+
+	if (ch->channel >= dfsdm->num_chs) {
+		dev_err(&indio_dev->dev, " Error bad channel number %d (max = %d)\n",
+			ch->channel, dfsdm->num_chs);
+		return -EINVAL;
+	}
+
+	ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
+	if (ret < 0) {
+		dev_err(&indio_dev->dev,
+			" Error parsing 'label' for idx %d\n", ch->channel);
+		return ret;
+	}
+
+	df_ch =  &dfsdm->ch_list[ch->channel];
+	df_ch->id = ch->channel;
+
+	ret = fwnode_property_read_string(node, "st,adc-channel-type", &of_str);
+	if (!ret) {
+		val = stm32_dfsdm_str2val(of_str, stm32_dfsdm_chan_type);
+		if (val < 0)
+			return val;
+	} else {
+		val = 0;
+	}
+	df_ch->type = val;
+
+	ret = fwnode_property_read_string(node, "st,adc-channel-clk-src", &of_str);
+	if (!ret) {
+		val = stm32_dfsdm_str2val(of_str, stm32_dfsdm_chan_src);
+		if (val < 0)
+			return val;
+	} else {
+		val = 0;
+	}
+	df_ch->src = val;
+
+	ret = fwnode_property_read_u32(node, "st,adc-alt-channel", &df_ch->alt_si);
+	if (ret != -EINVAL)
+		df_ch->alt_si = 0;
+
+	return 0;
+}
+
 static ssize_t dfsdm_adc_audio_get_spiclk(struct iio_dev *indio_dev,
 					  uintptr_t priv,
 					  const struct iio_chan_spec *chan,
@@ -1227,7 +1285,8 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
 		ret = iio_device_claim_direct_mode(indio_dev);
 		if (ret)
 			return ret;
-		ret = iio_hw_consumer_enable(adc->hwc);
+		if (adc->hwc)
+			ret = iio_hw_consumer_enable(adc->hwc);
 		if (ret < 0) {
 			dev_err(&indio_dev->dev,
 				"%s: IIO enable failed (channel %d)\n",
@@ -1236,7 +1295,8 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
 			return ret;
 		}
 		ret = stm32_dfsdm_single_conv(indio_dev, chan, val);
-		iio_hw_consumer_disable(adc->hwc);
+		if (adc->hwc)
+			iio_hw_consumer_disable(adc->hwc);
 		if (ret < 0) {
 			dev_err(&indio_dev->dev,
 				"%s: Conversion failed (channel %d)\n",
@@ -1362,15 +1422,20 @@ static int stm32_dfsdm_dma_request(struct device *dev,
 	return 0;
 }
 
-static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
-					 struct iio_chan_spec *ch)
+static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev, struct iio_chan_spec *ch,
+					 struct fwnode_handle *child)
 {
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
 	int ret;
 
-	ret = stm32_dfsdm_channel_parse_of(adc->dfsdm, indio_dev, ch);
-	if (ret < 0)
+	if (child)
+		ret = stm32_dfsdm_generic_channel_parse_of(adc->dfsdm, indio_dev, ch, child);
+	else /* Legacy binding */
+		ret = stm32_dfsdm_channel_parse_of(adc->dfsdm, indio_dev, ch);
+	if (ret < 0) {
+		dev_err(&indio_dev->dev, "Failed to parse channel\n");
 		return ret;
+	}
 
 	ch->type = IIO_VOLTAGE;
 	ch->indexed = 1;
@@ -1385,6 +1450,7 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
 
 	if (adc->dev_data->type == DFSDM_AUDIO) {
 		ch->ext_info = dfsdm_adc_audio_ext_info;
+		ch->scan_index = 0;
 	} else {
 		ch->scan_type.shift = 8;
 	}
@@ -1392,8 +1458,51 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
 	ch->scan_type.realbits = 24;
 	ch->scan_type.storagebits = 32;
 
-	return stm32_dfsdm_chan_configure(adc->dfsdm,
-					  &adc->dfsdm->ch_list[ch->channel]);
+	return stm32_dfsdm_chan_configure(adc->dfsdm, &adc->dfsdm->ch_list[ch->channel]);
+}
+
+static int stm32_dfsdm_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
+{
+	int num_ch = indio_dev->num_channels;
+	int chan_idx = 0, ret = 0;
+
+	for (chan_idx = 0; chan_idx < num_ch; chan_idx++) {
+		channels[chan_idx].scan_index = chan_idx;
+		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], NULL);
+		if (ret < 0) {
+			dev_err(&indio_dev->dev, "Channels init failed\n");
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int stm32_dfsdm_generic_chan_init(struct iio_dev *indio_dev, struct iio_chan_spec *channels)
+{
+	struct fwnode_handle *child;
+	int chan_idx = 0, ret;
+
+	device_for_each_child_node(&indio_dev->dev, child) {
+		/* Skip DAI node in DFSDM audio nodes */
+		if (fwnode_property_present(child, "compatible"))
+			continue;
+
+		channels[chan_idx].scan_index = chan_idx;
+		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &channels[chan_idx], child);
+		if (ret < 0) {
+			dev_err(&indio_dev->dev, "Channels init failed\n");
+			goto err;
+		}
+
+		chan_idx++;
+	}
+	return chan_idx;
+
+err:
+	fwnode_handle_put(child);
+
+	return ret;
 }
 
 static int stm32_dfsdm_audio_init(struct device *dev, struct iio_dev *indio_dev)
@@ -1401,15 +1510,26 @@ static int stm32_dfsdm_audio_init(struct device *dev, struct iio_dev *indio_dev)
 	struct iio_chan_spec *ch;
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
 	struct stm32_dfsdm_channel *d_ch;
-	int ret;
+	bool legacy = false;
+	int num_ch, ret;
+
+	/* If st,adc-channels is defined legacy binding is used. Else assume generic binding. */
+	num_ch = of_property_count_u32_elems(indio_dev->dev.of_node, "st,adc-channels");
+	if (num_ch == 1)
+		legacy = true;
 
 	ch = devm_kzalloc(&indio_dev->dev, sizeof(*ch), GFP_KERNEL);
 	if (!ch)
 		return -ENOMEM;
 
-	ch->scan_index = 0;
+	indio_dev->num_channels = 1;
+	indio_dev->channels = ch;
+
+	if (legacy)
+		ret = stm32_dfsdm_chan_init(indio_dev, ch);
+	else
+		ret = stm32_dfsdm_generic_chan_init(indio_dev, ch);
 
-	ret = stm32_dfsdm_adc_chan_init_one(indio_dev, ch);
 	if (ret < 0) {
 		dev_err(&indio_dev->dev, "Channels init failed\n");
 		return ret;
@@ -1420,9 +1540,6 @@ static int stm32_dfsdm_audio_init(struct device *dev, struct iio_dev *indio_dev)
 	if (d_ch->src != DFSDM_CHANNEL_SPI_CLOCK_EXTERNAL)
 		adc->spi_freq = adc->dfsdm->spi_master_freq;
 
-	indio_dev->num_channels = 1;
-	indio_dev->channels = ch;
-
 	return stm32_dfsdm_dma_request(dev, indio_dev);
 }
 
@@ -1430,43 +1547,60 @@ static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)
 {
 	struct iio_chan_spec *ch;
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
-	int num_ch;
-	int ret, chan_idx;
+	int num_ch, ret;
+	bool legacy = false;
 
 	adc->oversamp = DFSDM_DEFAULT_OVERSAMPLING;
 	ret = stm32_dfsdm_compute_all_osrs(indio_dev, adc->oversamp);
 	if (ret < 0)
 		return ret;
 
-	num_ch = of_property_count_u32_elems(indio_dev->dev.of_node,
-					     "st,adc-channels");
-	if (num_ch < 0 || num_ch > adc->dfsdm->num_chs) {
-		dev_err(&indio_dev->dev, "Bad st,adc-channels\n");
-		return num_ch < 0 ? num_ch : -EINVAL;
+	num_ch = device_get_child_node_count(&indio_dev->dev);
+	if (!num_ch) {
+		/* No channels nodes found. Assume legacy binding */
+		num_ch = of_property_count_u32_elems(indio_dev->dev.of_node, "st,adc-channels");
+		if (num_ch < 0) {
+			dev_err(&indio_dev->dev, "Bad st,adc-channels\n");
+			return num_ch;
+		}
+
+		legacy = true;
 	}
 
-	/* Bind to SD modulator IIO device */
-	adc->hwc = devm_iio_hw_consumer_alloc(&indio_dev->dev);
-	if (IS_ERR(adc->hwc))
-		return -EPROBE_DEFER;
+	if (num_ch > adc->dfsdm->num_chs) {
+		dev_err(&indio_dev->dev, "Number of channel [%d] exceeds [%d]\n",
+			num_ch, adc->dfsdm->num_chs);
+		return -EINVAL;
+	}
+	indio_dev->num_channels = num_ch;
 
-	ch = devm_kcalloc(&indio_dev->dev, num_ch, sizeof(*ch),
-			  GFP_KERNEL);
-	if (!ch)
-		return -ENOMEM;
+	if (legacy) {
+		/* Bind to SD modulator IIO device. */
+		adc->hwc = devm_iio_hw_consumer_alloc(&indio_dev->dev);
+		if (IS_ERR(adc->hwc))
+			return -EPROBE_DEFER;
+	} else {
+		/* Generic binding. SD modulator IIO device not used. Use SD modulator backend. */
+		adc->hwc = NULL;
 
-	for (chan_idx = 0; chan_idx < num_ch; chan_idx++) {
-		ch[chan_idx].scan_index = chan_idx;
-		ret = stm32_dfsdm_adc_chan_init_one(indio_dev, &ch[chan_idx]);
-		if (ret < 0) {
-			dev_err(&indio_dev->dev, "Channels init failed\n");
-			return ret;
-		}
+		adc->backend = devm_kzalloc(&indio_dev->dev, sizeof(*adc->backend) * num_ch,
+					    GFP_KERNEL);
+		if (!adc->backend)
+			return -ENOMEM;
 	}
 
-	indio_dev->num_channels = num_ch;
+	ch = devm_kcalloc(&indio_dev->dev, num_ch, sizeof(*ch), GFP_KERNEL);
+	if (!ch)
+		return -ENOMEM;
 	indio_dev->channels = ch;
 
+	if (legacy)
+		ret = stm32_dfsdm_chan_init(indio_dev, ch);
+	else
+		ret = stm32_dfsdm_generic_chan_init(indio_dev, ch);
+	if (ret < 0)
+		return ret;
+
 	init_completion(&adc->completion);
 
 	/* Optionally request DMA */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
