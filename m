Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6645D10AD35
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 11:07:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E9EC36B0B;
	Wed, 27 Nov 2019 10:07:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7659BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 10:07:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARA7AGl032453; Wed, 27 Nov 2019 11:07:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=VAggDD7eOOudtLCJRIZWwLHbOcnWRF07mVpnmo9075g=;
 b=Xhl35aFk4FKmIqnDte+5HLyVlueiHnEO478B0pFnD948tio0UouOKZVf1p5ug0J3FF6b
 GQahQBaXYLsF+G0iXQFc3njAHBeXohOOjfLhHs0p92fjbeOaS0ZLvRpd+WmqPWTvSAs1
 3FayiqM255Dv43/6E3ndE+Bs4J3zqL/EhECsINQO6V652R7XCOJJ0qXxrwsDQuLkMsQB
 rc7tBT7uCKWG1CWsNe+JiRoht0vHA1y7lrf3jluG4vd2UsP2inL5RC5rmh3FlHfJMFtt
 lPO/oYlNdv+by9JGnpcen2O1AN07t5jyftnYezEnmHH2rHmgsbjtoo/afOASpM3NITTn aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxsax09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:07:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E14A100038;
 Wed, 27 Nov 2019 11:07:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C806E2B11EF;
 Wed, 27 Nov 2019 11:07:15 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 27 Nov 2019 11:07:15 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <jic23@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <fabrice.gasnier@st.com>,
 <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <olivier.moysan@st.com>
Date: Wed, 27 Nov 2019 11:07:12 +0100
Message-ID: <20191127100712.24558-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Subject: [Linux-stm32] [INTERNAL][PATCH] iio: adc: stm32-dfsdm: adapt
	sampling rate to oversampling ratio
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

Update sampling rate when oversampling ratio is changed
through the IIO ABI.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 0339ecdd06bd..87a842507509 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1221,14 +1221,32 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
 	unsigned int spi_freq;
 	int ret = -EINVAL;
 
+	switch (ch->src) {
+	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL:
+		spi_freq = adc->dfsdm->spi_master_freq;
+		break;
+	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_FALLING:
+	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_RISING:
+		spi_freq = adc->dfsdm->spi_master_freq / 2;
+		break;
+	default:
+		spi_freq = adc->spi_freq;
+	}
+
 	switch (mask) {
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
 		ret = iio_device_claim_direct_mode(indio_dev);
 		if (ret)
 			return ret;
+
 		ret = stm32_dfsdm_compute_all_osrs(indio_dev, val);
-		if (!ret)
+		if (!ret) {
+			dev_dbg(&indio_dev->dev,
+				"Sampling rate changed from (%u) to (%u)\n",
+				adc->sample_freq, spi_freq / val);
 			adc->oversamp = val;
+			adc->sample_freq = spi_freq / val;
+		}
 		iio_device_release_direct_mode(indio_dev);
 		return ret;
 
@@ -1240,18 +1258,6 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
 		if (ret)
 			return ret;
 
-		switch (ch->src) {
-		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL:
-			spi_freq = adc->dfsdm->spi_master_freq;
-			break;
-		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_FALLING:
-		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_RISING:
-			spi_freq = adc->dfsdm->spi_master_freq / 2;
-			break;
-		default:
-			spi_freq = adc->spi_freq;
-		}
-
 		ret = dfsdm_adc_set_samp_freq(indio_dev, val, spi_freq);
 		iio_device_release_direct_mode(indio_dev);
 		return ret;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
