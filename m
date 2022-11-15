Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E86295FB
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Nov 2022 11:35:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31375C65065;
	Tue, 15 Nov 2022 10:35:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83102C65041
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Nov 2022 10:35:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFA98s2007401; Tue, 15 Nov 2022 11:34:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=hIRd56RJEPsYoe2M/RxriY/Cri8HJyV+94pW088mtLc=;
 b=GiP3oC2Ij8aYXoCYqNIF4asqEr9kzlst//gEGyr1+H54Q/lHFDyqsCZ8GxTNiUdGpjf4
 q22kay7Tq7Es+N5nl47k7ojvc5qeFSrZs08Awz3rpJONuR77MpG7VowseCUIo9evu4Jb
 FtEcgEdwsYviknqUJqDYTDNN+EbToZMKebztniKXkslrXYd56Iz/mTjQKsnolMzmvwGM
 qFVldb+LHcnuPmeAedF0mVUHvsx3rBafQRN9EePjWf4BIcvtgM/fwUgonQ/hgpSYUlrx
 QnW228kKFtsJ5IPh3WjER6F5N5kcmbwM4u4SzZK+1Xxdp0EBbIUrtnbAa+TCMAT1YS7R Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ktq2ynee2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 11:34:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02FA0100039;
 Tue, 15 Nov 2022 11:34:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F01CF21A206;
 Tue, 15 Nov 2022 11:34:33 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Tue, 15 Nov
 2022 11:34:33 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 15 Nov 2022 11:31:23 +0100
Message-ID: <20221115103124.70074-4-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115103124.70074-1-olivier.moysan@foss.st.com>
References: <20221115103124.70074-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_05,2022-11-15_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] iio: adc: stm32-adc: add debugfs to read
	raw calibration result
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

Add debugfs to read linear ADC STM32 self calibration results.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 65dd45537505..45d4e79f8e55 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
@@ -1879,6 +1880,23 @@ static const struct iio_chan_spec_ext_info stm32_adc_ext_info[] = {
 	{},
 };
 
+static void stm32_adc_debugfs_init(struct iio_dev *indio_dev)
+{
+	struct stm32_adc *adc = iio_priv(indio_dev);
+	struct dentry *d = iio_get_debugfs_dentry(indio_dev);
+	struct stm32_adc_calib *cal = &adc->cal;
+	char buf[16];
+	unsigned int i;
+
+	if (!adc->cfg->has_linearcal)
+		return;
+
+	for (i = 0; i < STM32H7_LINCALFACT_NUM; i++) {
+		snprintf(buf, sizeof(buf), "lincalfact%d", i + 1);
+		debugfs_create_u32(buf, 0444, d, &cal->lincalfact[i]);
+	}
+}
+
 static int stm32_adc_fw_get_resolution(struct iio_dev *indio_dev)
 {
 	struct device *dev = &indio_dev->dev;
@@ -2465,6 +2483,9 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		stm32_adc_debugfs_init(indio_dev);
+
 	return 0;
 
 err_hw_stop:
@@ -2493,6 +2514,7 @@ static int stm32_adc_remove(struct platform_device *pdev)
 	struct stm32_adc *adc = iio_priv(indio_dev);
 
 	pm_runtime_get_sync(&pdev->dev);
+	/* iio_device_unregister() also removes debugfs entries */
 	iio_device_unregister(indio_dev);
 	stm32_adc_hw_stop(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
