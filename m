Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B2B6302
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 14:23:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F13DCC35E01;
	Wed, 18 Sep 2019 12:23:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB8A3C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 12:23:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8ICLfKJ027959; Wed, 18 Sep 2019 14:22:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LGMEcDX91zZnE3TyD/A9U4RClm8f/2smtj92YAYq+2o=;
 b=0K6bwiVHEwKLgTOJwkIYgMkN+54fiRzj4hvD9GdFbfe344+RAFN0oQmhhL/QWhUtErXh
 wNr/ZTCSXKfjy/PEBovS5zlOzy5P+CoDyrzs75hoOCqTI8yhp/QDTJODYe8vDifQA393
 LQcHMr81M3HHFDJ+M6e26dB9SYaVrudeLYAzwzU+ubT1j9jPRX4vAnnVo9zmt+T9Nnyi
 4ClYCJ/+CffzDxyiOnggSmBaAgCenoYQkmj/7nN1QwKP9mp5q39aRZIQQc1IVRUqviAI
 iJZc3/Yp5G0l4Sows3HEW38r49o10dUOkwAAvYQ3WSRL01rfr7fivmoWTk7ZmcU7S4ea +w== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v37kmc3mq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 18 Sep 2019 14:22:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1289023;
 Wed, 18 Sep 2019 12:22:51 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 713392C5B2F;
 Wed, 18 Sep 2019 14:22:50 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 18 Sep
 2019 14:22:50 +0200
Received: from localhost (10.48.1.232) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 18 Sep 2019 14:22:49 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <vilhelm.gray@gmail.com>
Date: Wed, 18 Sep 2019 14:22:41 +0200
Message-ID: <1568809361-26157-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.1.232]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_07:2019-09-17,2019-09-18 signatures=0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: fix a kernel-doc
	warning
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

Fix the following warnings when documentation is built:
drivers/counter/stm32-lptimer-cnt.c:354: warning: cannot understand
function prototype: 'enum stm32_lptim_cnt_function'

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index bbc930a..28b6364 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -347,7 +347,7 @@ static const struct iio_chan_spec stm32_lptim_cnt_channels = {
 };
 
 /**
- * stm32_lptim_cnt_function - enumerates stm32 LPTimer counter & encoder modes
+ * enum stm32_lptim_cnt_function - enumerates LPTimer counter & encoder modes
  * @STM32_LPTIM_COUNTER_INCREASE: up count on IN1 rising, falling or both edges
  * @STM32_LPTIM_ENCODER_BOTH_EDGE: count on both edges (IN1 & IN2 quadrature)
  */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
