Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CCD25277B
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 08:39:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F169C32EA6;
	Wed, 26 Aug 2020 06:39:11 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADFB6C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 06:39:08 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07Q6UQDL027131; Wed, 26 Aug 2020 02:39:02 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com with ESMTP id 332w764k56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 02:39:01 -0400
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 07Q6d0qo014968
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
 verify=FAIL); Wed, 26 Aug 2020 02:39:00 -0400
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 25 Aug 2020 23:38:58 -0700
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 25 Aug 2020 23:38:58 -0700
Received: from saturn.ad.analog.com ([10.48.65.100])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 07Q6cs7n018839;
 Wed, 26 Aug 2020 02:38:55 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 26 Aug 2020 09:38:50 +0300
Message-ID: <20200826063850.47625-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_03:2020-08-25,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=506 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008260050
Cc: Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>, fabrice.gasnier@st.com,
 jic23@kernel.org
Subject: [Linux-stm32] [PATCH] iio: stm32-dac: Replace indio_dev->mlock with
	own device lock
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

From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>

As part of the general cleanup of indio_dev->mlock, this change replaces
it with a local lock on the device's state structure.

The patch also does a minor whitespace change to align the 'lock' with the
'common' field via tabs.

Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/iio/dac/stm32-dac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index 092c796fa3d9..fc636812c17e 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -26,9 +26,11 @@
 /**
  * struct stm32_dac - private data of DAC driver
  * @common:		reference to DAC common data
+ * @lock:		lock to protect the data buffer during regmap ops
  */
 struct stm32_dac {
-	struct stm32_dac_common *common;
+	struct stm32_dac_common	*common;
+	struct mutex		lock;
 };
 
 static int stm32_dac_is_enabled(struct iio_dev *indio_dev, int channel)
@@ -58,10 +60,10 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 	int ret;
 
 	/* already enabled / disabled ? */
-	mutex_lock(&indio_dev->mlock);
+	mutex_lock(&dac->lock);
 	ret = stm32_dac_is_enabled(indio_dev, ch);
 	if (ret < 0 || enable == !!ret) {
-		mutex_unlock(&indio_dev->mlock);
+		mutex_unlock(&dac->lock);
 		return ret < 0 ? ret : 0;
 	}
 
@@ -69,13 +71,13 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 		ret = pm_runtime_get_sync(dev);
 		if (ret < 0) {
 			pm_runtime_put_noidle(dev);
-			mutex_unlock(&indio_dev->mlock);
+			mutex_unlock(&dac->lock);
 			return ret;
 		}
 	}
 
 	ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
-	mutex_unlock(&indio_dev->mlock);
+	mutex_unlock(&dac->lock);
 	if (ret < 0) {
 		dev_err(&indio_dev->dev, "%s failed\n", en ?
 			"Enable" : "Disable");
@@ -327,6 +329,8 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	indio_dev->info = &stm32_dac_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
+	mutex_init(&dac->lock);
+
 	ret = stm32_dac_chan_of_init(indio_dev);
 	if (ret < 0)
 		return ret;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
