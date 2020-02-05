Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF143152967
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 11:49:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77B22C36B0B;
	Wed,  5 Feb 2020 10:49:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23AA5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 10:49:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 015AhQR8020225; Wed, 5 Feb 2020 11:49:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=6nWcubbJcTb/v+QZhKnKIkzKmQoSurHo8oVRf6+XpXM=;
 b=Qb8a2pvCcgCQuiIgxFMQg/GM0mYu42OhVkYpk+kJ9oAK375nqc9s/bEWmWWc1FjkFAya
 07HCqeHO1cy6Pc3xEpcA6AaAjSudozxw8SIy2bgOhDRE0cIQj9acVWNe308+8v8QFKqs
 fhOgJspOss2TXypsftkrlEMThuIAnkVZZ+PjpEWLwVpQ9olqO+zHemwgg8lv094p4Eym
 hwWQtQUthYd22CVkbl/3a6YE0Q3ZjY+2AupiCxF6J16arW2N2BtV6FVgyNTPJ0+aF4v6
 dTqtNfjZWAlM8oujpXKuUzFDv20zio0jC8G0I5J95rlNzlMKr3Iqh4fFWkB9Dorf8tOU 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhkycp4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2020 11:49:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57DD310002A;
 Wed,  5 Feb 2020 11:48:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A8522AD9FA;
 Wed,  5 Feb 2020 11:48:53 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 5 Feb 2020 11:48:52 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <vilhelm.gray@gmail.com>, <jic23@kernel.org>
Date: Wed, 5 Feb 2020 11:47:58 +0100
Message-ID: <1580899678-26393-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_03:2020-02-04,
 2020-02-05 signatures=0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: add power
	management support
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

Add suspend/resume PM sleep ops. When going to low power, enforce the
counter isn't active.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/counter/stm32-timer-cnt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 3eafcce..3b84503 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -12,6 +12,7 @@
 #include <linux/iio/types.h>
 #include <linux/mfd/stm32-timers.h>
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #define TIM_CCMR_CCXS	(BIT(8) | BIT(0))
@@ -358,10 +359,33 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 	priv->counter.num_signals = ARRAY_SIZE(stm32_signals);
 	priv->counter.priv = priv;
 
+	platform_set_drvdata(pdev, priv);
+
 	/* Register Counter device */
 	return devm_counter_register(dev, &priv->counter);
 }
 
+static int __maybe_unused stm32_timer_cnt_suspend(struct device *dev)
+{
+	struct stm32_timer_cnt *priv = dev_get_drvdata(dev);
+	u32 cr1;
+
+	/* Check for active counter */
+	regmap_read(priv->regmap, TIM_CR1, &cr1);
+	if (cr1 & TIM_CR1_CEN)
+		return -EBUSY;
+
+	return pinctrl_pm_select_sleep_state(dev);
+}
+
+static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
+{
+	return pinctrl_pm_select_default_state(dev);
+}
+
+static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
+			 stm32_timer_cnt_resume);
+
 static const struct of_device_id stm32_timer_cnt_of_match[] = {
 	{ .compatible = "st,stm32-timer-counter", },
 	{},
@@ -373,6 +397,7 @@ static struct platform_driver stm32_timer_cnt_driver = {
 	.driver = {
 		.name = "stm32-timer-counter",
 		.of_match_table = stm32_timer_cnt_of_match,
+		.pm = &stm32_timer_cnt_pm_ops,
 	},
 };
 module_platform_driver(stm32_timer_cnt_driver);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
