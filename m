Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 877186295FD
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Nov 2022 11:35:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 467A7C6506C;
	Tue, 15 Nov 2022 10:35:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD631C6506C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Nov 2022 10:35:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFA0DEu007359; Tue, 15 Nov 2022 11:34:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=lQpIOKYpc+Dxu48ZbINg3+W2yJFLZFkRBfz6KvFtNwI=;
 b=qvRVe31l4CfjXLhjlkpq+l3BvCqA34USuAPIOWq72lYzeAWe22rTP3hfXc85tyXJ1D0J
 P/FGRLdlhI89oZgrBNsDcb0Q+hOzGHB7CUZGqBnx8LOZJJ2jGBCIVtFUOzlierx+LTWB
 tW9aCBEzNBDBqQiaGAR7B5xQn9kkzpR3hqPmj7We6wqtS/9nOYFWPo98Ms+u4LJGDhFP
 NHbygsov/JinEsdl1PReCTHn3gvELxkGbgr1mmhF5MhExzaXJVcg0vNo8r2UAL63g/LQ
 zJ3HjAjRmDSa7MFjPedeGWQwiQyWmMSO7e/FYXGRQlTmcDqkFyCc98V0+FlG/S3GrEA6 Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ktq2ynee1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 11:34:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0AA7F100038;
 Tue, 15 Nov 2022 11:34:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0326621A206;
 Tue, 15 Nov 2022 11:34:33 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Tue, 15 Nov
 2022 11:34:32 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 15 Nov 2022 11:31:22 +0100
Message-ID: <20221115103124.70074-3-olivier.moysan@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 2/3] iio: adc: stm32-adc: improve calibration
	error log
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

Add more information in calibration error log to differentiate
single-ended and differential calibration.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 2b2b55eb130e..65dd45537505 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1109,7 +1109,7 @@ static int stm32h7_adc_selfcalib(struct iio_dev *indio_dev, int do_lincal)
 					   !(val & STM32H7_ADCAL), 100,
 					   STM32H7_ADC_CALIB_TIMEOUT_US);
 	if (ret) {
-		dev_err(&indio_dev->dev, "calibration failed\n");
+		dev_err(&indio_dev->dev, "calibration (single-ended) error %d\n", ret);
 		goto out;
 	}
 
@@ -1125,7 +1125,8 @@ static int stm32h7_adc_selfcalib(struct iio_dev *indio_dev, int do_lincal)
 					   !(val & STM32H7_ADCAL), 100,
 					   STM32H7_ADC_CALIB_TIMEOUT_US);
 	if (ret) {
-		dev_err(&indio_dev->dev, "calibration failed\n");
+		dev_err(&indio_dev->dev, "calibration (diff%s) error %d\n",
+			(msk & STM32H7_ADCALLIN) ? "+linear" : "", ret);
 		goto out;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
