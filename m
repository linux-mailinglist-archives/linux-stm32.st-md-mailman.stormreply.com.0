Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA069552180
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jun 2022 17:48:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A19D4C5EC76;
	Mon, 20 Jun 2022 15:48:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09199C5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 15:48:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KEiC4u002735;
 Mon, 20 Jun 2022 17:48:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=zPr/nDv+NqgCll4/QE6301YdTarimLKEYjm6hZt54cU=;
 b=3QrMbbUQhJfejLee/ZUMrRps4gsh9KU/5BNqES9+Y1FM8bHXgXX3LfDRplf3l4mjVHon
 1DNovKqTAHNFtTJ6gMbtb/ncA5PoiDf4gIWlecpfU63y/qjmQeXt3eXHxNTfSxKG0QsV
 A4e94mhm5/JFdYG6AuPhPUj1A8acMdkMpMC7b/aqhU8lmDwfqPTuLoenH+3eNR/g+kNI
 w9qpwgTzjBZSu6IU6L2oJKxuFX0szRfGgrlDFuJgAioXHhGbLh11juTXP+Vj+DCz9JlK
 u4o6kXi3xeZGTVs3WnqSI4+J+X9VKwGcJApVv1rZ6L2vhD05NrLhdsZZmp+Yc4RdZ8n+ ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gs71tmchc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 17:48:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96F42100038;
 Mon, 20 Jun 2022 17:48:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90F7722ECEF;
 Mon, 20 Jun 2022 17:48:13 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 17:48:13 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>, Wan Jiabing <wanjiabing@vivo.com>
Date: Mon, 20 Jun 2022 17:47:38 +0200
Message-ID: <20220620154738.801706-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620154738.801706-1-olivier.moysan@foss.st.com>
References: <20220620154738.801706-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] iio: adc: stm32-adc: disable adc before
	calibration
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

The calibration is launched from prepare callback.
The ADC state when entering this function may be unknown as the
ADC may have been left enabled by boot stage.
One prerequisite for ADC calibration is to have ADC in disabled state.
If the calibration is started when ADC is still enabled, the behavior is
unpredictable, and the calibration may fail with a timeout error.

Force ADC to disabled state in stm32h7_adc_selfcalib().
ADC enabling is ensured by stm32h7_adc_enable() call,
before leaving prepare callback.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-adc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 80e333f65ddd..3985fe972892 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1019,6 +1019,9 @@ static int stm32h7_adc_selfcalib(struct iio_dev *indio_dev)
 	if (adc->cal.calibrated)
 		return true;
 
+	/* ADC must be disabled for calibration */
+	stm32h7_adc_disable(indio_dev);
+
 	/*
 	 * Select calibration mode:
 	 * - Offset calibration for single ended inputs
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
