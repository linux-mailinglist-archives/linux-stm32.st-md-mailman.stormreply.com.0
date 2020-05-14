Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8031D2AC9
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 10:57:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 920B3C36B12;
	Thu, 14 May 2020 08:57:53 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AFD6C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 08:51:11 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E8lutC002591; Thu, 14 May 2020 04:50:45 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com with ESMTP id 3100y96grm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 04:50:45 -0400
Received: from SCSQMBX11.ad.analog.com (scsqmbx11.ad.analog.com [10.77.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 04E8ohxV063374
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
 verify=FAIL); Thu, 14 May 2020 04:50:43 -0400
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 14 May 2020 01:50:42 -0700
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 14 May 2020 01:50:42 -0700
Received: from localhost.localdomain ([10.48.65.12])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 04E8obas010241;
 Thu, 14 May 2020 04:50:37 -0400
From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
To: <linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>
Date: Thu, 14 May 2020 11:50:12 +0300
Message-ID: <20200514085018.79948-1-sergiu.cuciurean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_01:2020-05-13,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 cotscore=-2147483648
 phishscore=0 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 mlxlogscore=658 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005140079
X-Mailman-Approved-At: Thu, 14 May 2020 08:57:53 +0000
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
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

As part of the general cleanup of indio_dev->mlock, this change replaces
it with a local lock on the device's state structure.

Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
---
 drivers/iio/dac/stm32-dac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index f22c1d9129b2..74b9474c8590 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -26,9 +26,11 @@
 /**
  * struct stm32_dac - private data of DAC driver
  * @common:		reference to DAC common data
+ * @lock: lock to protect the data buffer during regmap ops
  */
 struct stm32_dac {
 	struct stm32_dac_common *common;
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
@@ -328,6 +330,8 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	indio_dev->info = &stm32_dac_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
+	mutex_init(&dac->lock);
+
 	ret = stm32_dac_chan_of_init(indio_dev);
 	if (ret < 0)
 		return ret;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
