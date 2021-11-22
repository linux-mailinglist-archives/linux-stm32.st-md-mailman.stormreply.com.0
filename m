Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E3945905A
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Nov 2021 15:39:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4974DC5A4FD;
	Mon, 22 Nov 2021 14:39:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3670C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 14:39:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMDXEST003144;
 Mon, 22 Nov 2021 15:39:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=qzuzXnps8uoSg/5ew9p+2cb+8oRWmDxyBUwVDf0JQFk=;
 b=LDLlWUJxqdFImWXoAb0qbfbYMpq+V6bq9Dg7wKPpgxsumRcp/g0c6ya59q3fe8IaiICB
 06DBqVbrwvXKZ/9j8inUeBB/P1E+ohezfv5DCPxNN8K8qFNF5bMnfxJLC4P5Sepsiz0b
 6GoDetiSly76xNjt0A+Rrcwp2ZTQAJvaVR8ZiqosIb+wVu7a/da+4ko+lM/UqSWRjjZ8
 02P3supEAj95/PdGiCsQ0bqQd1SZAkiEOaQIj2A8ylxj+TQaoS4X8naaDxFYDaV+xsWS
 re07pz3h6c/6d7fg7ihLeeJreEvEiAf4QTdIgC8TMD5tFUD9i/RVsR1uNYfrWM9G2v2c Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cgc6p0c2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 15:39:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C00B10002A;
 Mon, 22 Nov 2021 15:39:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3276821AAAC;
 Mon, 22 Nov 2021 15:39:08 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:39:07
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Xu Wang <vulab@iscas.ac.cn>
Date: Mon, 22 Nov 2021 15:38:09 +0100
Message-ID: <20211122143809.2332-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_07,2021-11-22_02,2020-04-07_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] iio: adc: stm32: fix null pointer on
	defer_probe error
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

dev_err_probe() calls __device_set_deferred_probe_reason()
on -EPROBE_DEFER error. If device pointer to driver core
private structure is not initialized, an null pointer error occurs.
This pointer is set on iio_device_register() call for iio device.

dev_err_probe() must be called with the device which is probing.
Replace iio device by its parent device.

Fixes: 0e346b2cfa85 ("iio: adc: stm32-adc: add vrefint calibration support")

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
Changes in v2:
- Use parent device from indio_dev instead of private structure
---
 drivers/iio/adc/stm32-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 7f1fb36c747c..341afdd342cc 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1986,7 +1986,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
 			/* Get calibration data for vrefint channel */
 			ret = nvmem_cell_read_u16(&indio_dev->dev, "vrefint", &vrefint);
 			if (ret && ret != -ENOENT) {
-				return dev_err_probe(&indio_dev->dev, ret,
+				return dev_err_probe(indio_dev->dev.parent, ret,
 						     "nvmem access error\n");
 			}
 			if (ret == -ENOENT)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
