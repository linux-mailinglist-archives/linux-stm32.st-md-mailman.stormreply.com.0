Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B916BB6673
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 16:55:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 729A9C35E01;
	Wed, 18 Sep 2019 14:55:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D869C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 14:55:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8IEpeiv022237; Wed, 18 Sep 2019 16:55:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9JOJ2TsRWVhbIDBX7FANflmQ/WbPtN42tDZpO1ACUm8=;
 b=ammdUUjNhFmB7C61NGAV2eBct2GpEeJnt181h53rEp/0Y6pIpzgIXtRbdAh3gFyM0chF
 j06LwrJA5uHbJ3JnF4iitCvp8ISzrGnYZfV4OL8XPAKAsxectRpNaYyA3IqlpaAOKfvv
 IEnedujShI1RAKLYb2AYCuVnmg4l8igQJbk6MMpFK+Scj3HeiKG1eacO5NHYu/IrYiQv
 XnoIosHgPthm1GLUuxtJZ6LmU/Rgkfh1UWPUjqoSLVLD8XDOQyY86Yt95x0dj0ntYsr/
 It6wgohabQZ2lZXa6/RbwG0IQU7N3SJygrZPdqIaUBRhiW+5wUC7DdPdQ7fy4Zd0rWXq yg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v37kjcx1u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 18 Sep 2019 16:55:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8013923;
 Wed, 18 Sep 2019 14:54:57 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B39562A822D;
 Wed, 18 Sep 2019 16:54:56 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 18 Sep
 2019 16:54:56 +0200
Received: from localhost (10.48.1.232) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 18 Sep 2019 16:54:56 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <thierry.reding@gmail.com>
Date: Wed, 18 Sep 2019 16:54:21 +0200
Message-ID: <1568818461-19995-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.1.232]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_08:2019-09-18,2019-09-18 signatures=0
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] pwm: stm32-lp: add check in case requested
	period cannot be achieved
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

LPTimer can use a 32KHz clock for counting. It depends on clock tree
configuration. In such a case, PWM output frequency range is limited.
Although unlikely, nothing prevents user from requesting a PWM frequency
above counting clock (32KHz for instance):
- This causes (prd - 1) = 0xffff to be written in ARR register later in
the apply() routine.
This results in badly configured PWM period (and also duty_cycle).
Add a check to report an error is such a case.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
Changes in v2:
- remarks from Uwe: update the comment, use dev_dbg() and print period that
  cannot be reached
---
 drivers/pwm/pwm-stm32-lp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 2211a64..97a9afa 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -59,6 +59,12 @@ static int stm32_pwm_lp_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	/* Calculate the period and prescaler value */
 	div = (unsigned long long)clk_get_rate(priv->clk) * state->period;
 	do_div(div, NSEC_PER_SEC);
+	if (!div) {
+		/* Clock is too slow to achieve requested period. */
+		dev_dbg(priv->chip.dev, "Can't reach %u ns\n",	state->period);
+		return -EINVAL;
+	}
+
 	prd = div;
 	while (div > STM32_LPTIM_MAX_ARR) {
 		presc++;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
