Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D7416DF6
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Sep 2021 10:35:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDFABC5A4FA;
	Fri, 24 Sep 2021 08:35:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48C58C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 08:35:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18O7wDOA001590; 
 Fri, 24 Sep 2021 10:35:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=7c/a7QYZhvYe13U6jCTLYsPuBAp1wOiYKgfl2jIFVcY=;
 b=j0pZZgUPEuUzbTO74JRHIdixCHidZIlNebU5rc2TGieVbKUu2mKdXN0xnfsG1Pb7SMbu
 Ebae+CqCVUfhDi3ft8UQsGwRMHD2i2JdT0O5rm5D1ZdyJYYh1rJnu1I8DQ6lRIZB1DaU
 q6ySro1vQnbwOYjpP/Shw9JPuuy/Y8CwvyDRiSF6HNJvM6HW0ai9yPLN0kcTM9Cp4VEc
 WuSZlpwzG0H31Z+di9A5z6KHiVwsXS8nITUEJoeQYBMkQxsaWIL6SGPHzGXuO4EyITgh
 RyiU0OLvmMtxMVFOOdMAapJDdH/bx3i3rMCZMdNDhluJ9sGmXJEulyG1eu2vTk1366ia +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b93dxae0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 10:35:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D14010002A;
 Fri, 24 Sep 2021 10:35:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 928EF226FB0;
 Fri, 24 Sep 2021 10:35:27 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep 2021 10:35:27
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 24 Sep 2021 10:34:06 +0200
Message-ID: <20210924083410.12332-4-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210924083410.12332-1-olivier.moysan@foss.st.com>
References: <20210924083410.12332-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_02,2021-09-23_01,2020-04-07_01
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 3/7] iio: adc: stm32-adc: split channel
	init into several routines
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

Split stm32_adc_chan_of_init channel initialization function into
several routines to increase readability and prepare channel
generic binding handling.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 131 ++++++++++++++++++++++++------------
 1 file changed, 87 insertions(+), 44 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 5088de835bb1..2f137d14f141 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -194,6 +194,7 @@ struct stm32_adc_cfg {
  * @smpr_val:		sampling time settings (e.g. smpr1 / smpr2)
  * @cal:		optional calibration data on some devices
  * @chan_name:		channel name array
+ * @num_diff:		number of differential channels
  */
 struct stm32_adc {
 	struct stm32_adc_common	*common;
@@ -217,6 +218,7 @@ struct stm32_adc {
 	u32			smpr_val[2];
 	struct stm32_adc_calib	cal;
 	char			chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
+	u32			num_diff;
 };
 
 struct stm32_adc_diff_channel {
@@ -1706,17 +1708,11 @@ static void stm32_adc_chan_init_one(struct iio_dev *indio_dev,
 	}
 }
 
-static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
+static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm32_adc *adc)
 {
 	struct device_node *node = indio_dev->dev.of_node;
-	struct stm32_adc *adc = iio_priv(indio_dev);
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
-	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
-	struct property *prop;
-	const __be32 *cur;
-	struct iio_chan_spec *channels;
-	int scan_index = 0, num_channels = 0, num_diff = 0, ret, i;
-	u32 val, smp = 0;
+	int num_channels = 0, ret;
 
 	ret = of_property_count_u32_elems(node, "st,adc-channels");
 	if (ret > adc_info->max_channels) {
@@ -1727,41 +1723,54 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	}
 
 	ret = of_property_count_elems_of_size(node, "st,adc-diff-channels",
-					      sizeof(*diff));
+					      sizeof(struct stm32_adc_diff_channel));
 	if (ret > adc_info->max_channels) {
 		dev_err(&indio_dev->dev, "Bad st,adc-diff-channels?\n");
 		return -EINVAL;
 	} else if (ret > 0) {
-		int size = ret * sizeof(*diff) / sizeof(u32);
-
-		num_diff = ret;
+		adc->num_diff = ret;
 		num_channels += ret;
+	}
+
+	return num_channels;
+}
+
+static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
+				      struct stm32_adc *adc,
+				      struct iio_chan_spec *channels)
+{
+	struct device_node *node = indio_dev->dev.of_node;
+	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
+	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
+	u32 num_diff = adc->num_diff;
+	int size = num_diff * sizeof(*diff) / sizeof(u32);
+	int scan_index = 0, val, ret, i;
+	struct property *prop;
+	const __be32 *cur;
+
+	if (num_diff) {
 		ret = of_property_read_u32_array(node, "st,adc-diff-channels",
 						 (u32 *)diff, size);
-		if (ret)
+		if (ret) {
+			dev_err(&indio_dev->dev, "Failed to get diff channels %d\n", ret);
 			return ret;
-	}
+		}
 
-	if (!num_channels) {
-		dev_err(&indio_dev->dev, "No channels configured\n");
-		return -ENODATA;
-	}
+		for (i = 0; i < num_diff; i++) {
+			if (diff[i].vinp >= adc_info->max_channels ||
+			    diff[i].vinn >= adc_info->max_channels) {
+				dev_err(&indio_dev->dev, "Invalid channel in%d-in%d\n",
+					diff[i].vinp, diff[i].vinn);
+				return -EINVAL;
+			}
 
-	/* Optional sample time is provided either for each, or all channels */
-	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
-	if (ret > 1 && ret != num_channels) {
-		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
-		return -EINVAL;
+			stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
+						diff[i].vinp, diff[i].vinn,
+						scan_index, true);
+			scan_index++;
+		}
 	}
 
-	if (timestamping)
-		num_channels++;
-
-	channels = devm_kcalloc(&indio_dev->dev, num_channels,
-				sizeof(struct iio_chan_spec), GFP_KERNEL);
-	if (!channels)
-		return -ENOMEM;
-
 	of_property_for_each_u32(node, "st,adc-channels", prop, cur, val) {
 		if (val >= adc_info->max_channels) {
 			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
@@ -1771,8 +1780,7 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 		/* Channel can't be configured both as single-ended & diff */
 		for (i = 0; i < num_diff; i++) {
 			if (val == diff[i].vinp) {
-				dev_err(&indio_dev->dev,
-					"channel %d miss-configured\n",	val);
+				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	val);
 				return -EINVAL;
 			}
 		}
@@ -1781,19 +1789,54 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 		scan_index++;
 	}
 
-	for (i = 0; i < num_diff; i++) {
-		if (diff[i].vinp >= adc_info->max_channels ||
-		    diff[i].vinn >= adc_info->max_channels) {
-			dev_err(&indio_dev->dev, "Invalid channel in%d-in%d\n",
-				diff[i].vinp, diff[i].vinn);
-			return -EINVAL;
-		}
-		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
-					diff[i].vinp, diff[i].vinn, scan_index,
-					true);
-		scan_index++;
+	return scan_index;
+}
+
+static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
+{
+	struct device_node *node = indio_dev->dev.of_node;
+	struct stm32_adc *adc = iio_priv(indio_dev);
+	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
+	struct iio_chan_spec *channels;
+	int scan_index = 0, num_channels = 0, ret, i;
+	u32 smp = 0;
+
+	ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
+	if (ret < 0)
+		return ret;
+	num_channels = ret;
+
+	if (!num_channels) {
+		dev_err(&indio_dev->dev, "No channels configured\n");
+		return -ENODATA;
 	}
 
+	if (num_channels > adc_info->max_channels) {
+		dev_err(&indio_dev->dev, "Channel number [%d] exceeds %d\n",
+			num_channels, adc_info->max_channels);
+		return -EINVAL;
+	}
+
+	/* Optional sample time is provided either for each, or all channels */
+	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
+	if (ret > 1 && ret != num_channels) {
+		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
+		return -EINVAL;
+	}
+
+	if (timestamping)
+		num_channels++;
+
+	channels = devm_kcalloc(&indio_dev->dev, num_channels,
+				sizeof(struct iio_chan_spec), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
+	if (ret < 0)
+		return ret;
+	scan_index = ret;
+
 	for (i = 0; i < scan_index; i++) {
 		/*
 		 * Using of_property_read_u32_index(), smp value will only be
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
