Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D46EC42D9FF
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 15:15:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 974EAC5C837;
	Thu, 14 Oct 2021 13:15:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5247FC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 13:15:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19E9OHuI029344; 
 Thu, 14 Oct 2021 15:14:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=CT5zbzBiiSRHC6LhkJDSwTwmipMVPrFZ/bhglUOKZt4=;
 b=0Nj/2gj/+w/3agmCCknx/p1rc4FoQ5EUodQonBAMTLtAofsIpw+RqBrytmaU9/1VNwUb
 PfqHPB8jKzK/Hne57aYfFhqj0vX3XvWBv1JJ0/jnjSaNgtzA6ikkQV/ltKfWwNRmYQua
 s5UxjLnPpsiCshhAo41LkhcAwCUfpj3zWRh1Br701rL4rfauFsoCsY5argPrI8jphsU9
 SBnuKfOJhTDdcJblTeWVzHmYSXQQ12XoRHQsK1S2i6gK7otNSIpaHDIa0RLo5unaKidq
 rvEz6Q2AG2smK2p/KQJjXOHfc2wGvVpHdO5999iQo8QQ/RnO3cTjodh23FIMUSNyqzEO sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bpdrek9qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 15:14:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70AFE10002A;
 Thu, 14 Oct 2021 15:14:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 686F221B50B;
 Thu, 14 Oct 2021 15:14:51 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct 2021 15:14:50
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Oct 2021 15:12:25 +0200
Message-ID: <20211014131228.4692-5-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211014131228.4692-1-olivier.moysan@foss.st.com>
References: <20211014131228.4692-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_08,2021-10-14_02,2020-04-07_01
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 4/7] iio: adc: stm32-adc: add support of
	generic channels binding
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

Add support of generic IIO channel binding:
./devicetree/bindings/iio/adc/adc.yaml
Keep support of st,adc-channels and st,adc-diff-channels
for backward compatibility.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 95 +++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 2f137d14f141..85d09cbd41ae 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -35,7 +35,7 @@
 #define STM32H7_BOOST_CLKRATE		20000000UL
 
 #define STM32_ADC_CH_MAX		20	/* max number of channels */
-#define STM32_ADC_CH_SZ			10	/* max channel name size */
+#define STM32_ADC_CH_SZ			16	/* max channel name size */
 #define STM32_ADC_MAX_SQ		16	/* SQ1..SQ16 */
 #define STM32_ADC_MAX_SMP		7	/* SMPx range is [0..7] */
 #define STM32_ADC_TIMEOUT_US		100000
@@ -1792,6 +1792,73 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
 	return scan_index;
 }
 
+static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
+				       struct stm32_adc *adc,
+				       struct iio_chan_spec *channels)
+{
+	struct device_node *node = indio_dev->dev.of_node;
+	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
+	struct device_node *child;
+	const char *name;
+	int val, scan_index = 0, ret;
+	bool differential;
+	u32 vin[2];
+
+	for_each_available_child_of_node(node, child) {
+		ret = of_property_read_u32(child, "reg", &val);
+		if (ret) {
+			dev_err(&indio_dev->dev, "Missing channel index %d\n", ret);
+			goto err;
+		}
+
+		ret = of_property_read_string(child, "label", &name);
+		/* label is optional */
+		if (!ret) {
+			if (strlen(name) >= STM32_ADC_CH_SZ) {
+				dev_err(&indio_dev->dev, "Label %s exceeds %d characters\n",
+					name, STM32_ADC_CH_SZ);
+				return -EINVAL;
+			}
+			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
+		} else if (ret != -EINVAL) {
+			dev_err(&indio_dev->dev, "Invalid label %d\n", ret);
+			goto err;
+		}
+
+		if (val >= adc_info->max_channels) {
+			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		differential = false;
+		ret = of_property_read_u32_array(child, "diff-channels", vin, 2);
+		/* diff-channels is optional */
+		if (!ret) {
+			differential = true;
+			if (vin[0] != val || vin[1] >= adc_info->max_channels) {
+				dev_err(&indio_dev->dev, "Invalid channel in%d-in%d\n",
+					vin[0], vin[1]);
+				goto err;
+			}
+		} else if (ret != -EINVAL) {
+			dev_err(&indio_dev->dev, "Invalid diff-channels property %d\n", ret);
+			goto err;
+		}
+
+		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
+					vin[1], scan_index, differential);
+		scan_index++;
+	}
+
+	return scan_index;
+
+err:
+	of_node_put(child);
+
+	return ret;
+}
+
 static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 {
 	struct device_node *node = indio_dev->dev.of_node;
@@ -1800,15 +1867,22 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	struct iio_chan_spec *channels;
 	int scan_index = 0, num_channels = 0, ret, i;
 	u32 smp = 0;
+	bool legacy = false;
 
-	ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
-	if (ret < 0)
-		return ret;
-	num_channels = ret;
-
+	num_channels = of_get_available_child_count(node);
+	/* If no channels have been found, fallback to channels legacy properties. */
 	if (!num_channels) {
-		dev_err(&indio_dev->dev, "No channels configured\n");
-		return -ENODATA;
+		legacy = true;
+
+		ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
+		if (!ret) {
+			dev_err(indio_dev->dev.parent, "No channel found\n");
+			return -ENODATA;
+		} else if (ret < 0) {
+			return ret;
+		}
+
+		num_channels = ret;
 	}
 
 	if (num_channels > adc_info->max_channels) {
@@ -1832,7 +1906,10 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
 	if (!channels)
 		return -ENOMEM;
 
-	ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
+	if (legacy)
+		ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
+	else
+		ret = stm32_adc_generic_chan_init(indio_dev, adc, channels);
 	if (ret < 0)
 		return ret;
 	scan_index = ret;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
