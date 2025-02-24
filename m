Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639EA429D5
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 18:33:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A5EC7803B;
	Mon, 24 Feb 2025 17:33:53 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37021C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 17:33:53 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OE6a8p019227;
 Mon, 24 Feb 2025 18:33:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=aM49dtU5bK9q5PUsk/o5Ph
 DwC7TRmbnftSFkh2mjTtw=; b=w9s1lCrwhPCUAMJgO3nO5qZZm0Yc5TstgWsUI+
 9UH+dVEKjCQV+rYFE6B/aiyj1HqHldtVYdQAtNI9UFm5pwSmDbwMPa3b9uvurhaN
 baU4pF0yCv9IC6dwug+RHYBl7eUbSlRxW4UbARHD9hgulHY0MmrANR/WZP23Um/p
 S/HtGavs4JCyQ+PgV8w9nOiLN52EXRu4Eo9XO83AuSXLDZX6QHYShwu8hP3j/HcF
 XIIlenVUTcWGwAY16ZjnSDyOsny8pgMW+nhst9zL3YLzAwAhEBbLLP+Krttpr2jI
 YKRup0tVixvo+F2dX6WbGMIEsZsBIsUg8r0fOk26aMLKYXLw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ytdn64g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2025 18:33:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52B4140059;
 Mon, 24 Feb 2025 18:32:19 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7B204F3E81;
 Mon, 24 Feb 2025 18:21:25 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 18:21:25 +0100
Received: from localhost (10.252.23.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 18:21:25 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
Date: Mon, 24 Feb 2025 18:21:01 +0100
Message-ID: <20250224172101.3448398-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.23.75]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] clocksource: stm32-lptimer: add support for PM
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

Add support for power management on STM32 LPTIMER clocksource driver:
- Upon clockevents_suspend(), shutdown the LPTIMER, and balance the
clk_prepare_enable() from the probe routine.
- Upon clockevents_resume(), restore the prescaler that may have been lost
during low power mode, and restore the clock.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/clocksource/timer-stm32-lp.c | 32 +++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index a4c95161cb22..9cd487dd5a3a 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -24,7 +24,9 @@ struct stm32_lp_private {
 	struct regmap *reg;
 	struct clock_event_device clkevt;
 	unsigned long period;
+	u32 psc;
 	struct device *dev;
+	struct clk *clk;
 };
 
 static struct stm32_lp_private*
@@ -120,6 +122,27 @@ static void stm32_clkevent_lp_set_prescaler(struct stm32_lp_private *priv,
 	/* Adjust rate and period given the prescaler value */
 	*rate = DIV_ROUND_CLOSEST(*rate, (1 << i));
 	priv->period = DIV_ROUND_UP(*rate, HZ);
+	priv->psc = i;
+}
+
+static void stm32_clkevent_lp_suspend(struct clock_event_device *clkevt)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	stm32_clkevent_lp_shutdown(clkevt);
+
+	/* balance clk_prepare_enable() from the probe */
+	clk_disable_unprepare(priv->clk);
+}
+
+static void stm32_clkevent_lp_resume(struct clock_event_device *clkevt)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	clk_prepare_enable(priv->clk);
+
+	/* restore prescaler */
+	regmap_write(priv->reg, STM32_LPTIM_CFGR, priv->psc << CFGR_PSC_OFFSET);
 }
 
 static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
@@ -134,6 +157,8 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
 	priv->clkevt.set_state_oneshot = stm32_clkevent_lp_set_oneshot;
 	priv->clkevt.set_next_event = stm32_clkevent_lp_set_next_event;
 	priv->clkevt.rating = STM32_LP_RATING;
+	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
+	priv->clkevt.resume = stm32_clkevent_lp_resume;
 
 	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
 					STM32_LPTIM_MAX_ARR);
@@ -151,11 +176,12 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->reg = ddata->regmap;
-	ret = clk_prepare_enable(ddata->clk);
+	priv->clk = ddata->clk;
+	ret = clk_prepare_enable(priv->clk);
 	if (ret)
 		return -EINVAL;
 
-	rate = clk_get_rate(ddata->clk);
+	rate = clk_get_rate(priv->clk);
 	if (!rate) {
 		ret = -EINVAL;
 		goto out_clk_disable;
@@ -191,7 +217,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 	return 0;
 
 out_clk_disable:
-	clk_disable_unprepare(ddata->clk);
+	clk_disable_unprepare(priv->clk);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
