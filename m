Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB491DE4BE
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 12:46:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35718C36B25;
	Fri, 22 May 2020 10:46:58 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67BF4C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 10:46:55 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04MAkjCC023175; Fri, 22 May 2020 06:46:45 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com with ESMTP id 312a17e5wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 May 2020 06:46:45 -0400
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 04MAki6W064254
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL); 
 Fri, 22 May 2020 06:46:44 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 22 May
 2020 06:46:43 -0400
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Fri, 22 May 2020 06:46:43 -0400
Received: from saturn.ad.analog.com ([10.48.65.112])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 04MAkaQq011641;
 Fri, 22 May 2020 06:46:39 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 22 May 2020 13:46:31 +0300
Message-ID: <20200522104632.517470-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522104632.517470-1-alexandru.ardelean@analog.com>
References: <20200522104632.517470-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-22_05:2020-05-22,
 2020-05-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=870 spamscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 cotscore=-2147483648
 suspectscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005220088
Cc: linus.walleij@linaro.org, songqiang1304521@gmail.com,
 mcoquelin.stm32@gmail.com, lorenzo.bianconi83@gmail.com,
 Alexandru Ardelean <alexandru.ardelean@analog.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jic23@kernel.org
Subject: [Linux-stm32] [PATCH 2/3] iio: adc: at91-sama5d2_adc: remove
	predisable/postenable hooks
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

This should be squashed into the first patch, but it's the more peculiar of
the changes.
I am not sure whether this is correct. The touchscreen channels shouldn't
be enabled by the IIO framework. So, we may need a different way to handle
those if needed.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 9abbbdcc7420..f71071096392 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -937,14 +937,6 @@ static int at91_adc_buffer_preenable(struct iio_dev *indio_dev)
 	return 0;
 }
 
-static int at91_adc_buffer_postenable(struct iio_dev *indio_dev)
-{
-	if (at91_adc_current_chan_is_touch(indio_dev))
-		return 0;
-
-	return iio_triggered_buffer_postenable(indio_dev);
-}
-
 static int at91_adc_buffer_postdisable(struct iio_dev *indio_dev)
 {
 	struct at91_adc_state *st = iio_priv(indio_dev);
@@ -995,19 +987,9 @@ static int at91_adc_buffer_postdisable(struct iio_dev *indio_dev)
 	return 0;
 }
 
-static int at91_adc_buffer_predisable(struct iio_dev *indio_dev)
-{
-	if (at91_adc_current_chan_is_touch(indio_dev))
-		return 0;
-
-	return iio_triggered_buffer_predisable(indio_dev);
-}
-
 static const struct iio_buffer_setup_ops at91_buffer_setup_ops = {
 	.preenable = &at91_adc_buffer_preenable,
 	.postdisable = &at91_adc_buffer_postdisable,
-	.postenable = &at91_adc_buffer_postenable,
-	.predisable = &at91_adc_buffer_predisable,
 };
 
 static struct iio_trigger *at91_adc_allocate_trigger(struct iio_dev *indio,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
