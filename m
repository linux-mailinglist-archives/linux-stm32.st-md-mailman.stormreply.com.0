Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E579A64B33E
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Dec 2022 11:28:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89298C65E74;
	Tue, 13 Dec 2022 10:28:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08DADC03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 10:28:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDAJBHq020788; Tue, 13 Dec 2022 11:27:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=BWg+HDZmgPHQRKWNccXLhmf8oUCWCRsnu09e0ZlymTo=;
 b=4mrgnWCizqeYbazHpFTds6hvlbnjWXTOQSLaJkeucw+0yoMJPbrXB35y2FRLxvNlSXWN
 Bk00nf/CUxuFFm6cH86wDxIjyF/AzDZ21uJAO5iuGwMqZzMpzYynbvTOjC1LINyMiZcP
 VVwj/kZARciT8gH+86iAaYkQt8knT/DdudfsSXI4q4tkKfZ65dYHOaD1qPH23DSUyVNf
 m5Z+b4dtl23+4tb2ADK5AdSOPVBeA29IOTlrZgVxIF5wkKGt2nXwNlJC1634y0GqoE8v
 cB+P9BoNZ7yr81QFE+PZvU1OgytmjgRtP2ISM5RjrVxleBQY0GwT8/E5Kl80tCPk4mvM ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mcgdphmf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 11:27:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E76610002A;
 Tue, 13 Dec 2022 11:27:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 841A321A211;
 Tue, 13 Dec 2022 11:27:49 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 13 Dec
 2022 11:27:49 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Thierry Reding
 <thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lee Jones <lee@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 13 Dec 2022 11:27:07 +0100
Message-ID: <20221213102707.1096345-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] pwm: stm32: enforce settings for pwm capture
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

The PWM capture assumes that the input selector is set to default
input and that the slave mode is disabled. Force reset state for
TISEL and SMCR registers to match this requirement.

Note that slave mode disabling is not a pre-requisite by itself
for capture mode, as hardware supports it for PWM capture.
However, the current implementation of the driver does not
allow slave mode for PWM capture. Setting slave mode for PWM
capture results in wrong capture values.

Fixes: 53e38fe73f94 ("pwm: stm32: Add capture support")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/pwm/pwm-stm32.c          | 4 ++++
 include/linux/mfd/stm32-timers.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 794ca5b02968..24aab0450c78 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -207,6 +207,10 @@ static int stm32_pwm_capture(struct pwm_chip *chip, struct pwm_device *pwm,
 	regmap_write(priv->regmap, TIM_ARR, priv->max_arr);
 	regmap_write(priv->regmap, TIM_PSC, psc);
 
+	/* Reset input selector to its default input and disable slave mode */
+	regmap_write(priv->regmap, TIM_TISEL, 0x0);
+	regmap_write(priv->regmap, TIM_SMCR, 0x0);
+
 	/* Map TI1 or TI2 PWM input to IC1 & IC2 (or TI3/4 to IC3 & IC4) */
 	regmap_update_bits(priv->regmap,
 			   pwm->hwpwm < 2 ? TIM_CCMR1 : TIM_CCMR2,
diff --git a/include/linux/mfd/stm32-timers.h b/include/linux/mfd/stm32-timers.h
index 5f5c43fd69dd..1b94325febb3 100644
--- a/include/linux/mfd/stm32-timers.h
+++ b/include/linux/mfd/stm32-timers.h
@@ -31,6 +31,7 @@
 #define TIM_BDTR	0x44	/* Break and Dead-Time Reg */
 #define TIM_DCR		0x48	/* DMA control register    */
 #define TIM_DMAR	0x4C	/* DMA register for transfer */
+#define TIM_TISEL	0x68	/* Input Selection         */
 
 #define TIM_CR1_CEN	BIT(0)	/* Counter Enable	   */
 #define TIM_CR1_DIR	BIT(4)  /* Counter Direction	   */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
