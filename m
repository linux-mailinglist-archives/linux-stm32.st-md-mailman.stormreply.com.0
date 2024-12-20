Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB99F8F8F
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 11:02:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1D7DC78F62;
	Fri, 20 Dec 2024 10:02:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCED4C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 10:02:23 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK9vSX4021487;
 Fri, 20 Dec 2024 11:02:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 N3C8rceQvNLCTnp4R4jP0Qcw1lYh/5LQgAq0XYaxj88=; b=1sAG1S2ZMyrudzfG
 4bPaQ3vRTfBjSyw7wU5eSJhEraleciA/S+hDkOURRKSQ46a/3pmGugsqZZQ0CRWG
 cWv7QCYTDs3/H65WQVpc+FZ7jfwYr0emIj/EF5v0MEWcm7FoR292kYlDNkHBlpkc
 2SenonfC+1GZ4t3/WvPzRAH64PQwAaBomGTFJypFXxAqze6lQIje9dXobu8OgbcK
 pUbs52RfEVVmKemk9+TKSughhSdgib/qb0Cc9OsUTTjbvN6D4Vy2rOjQ74Oap4Dg
 uVOlQWcxo00tkU1svreNM86KG3LeSdE++lUfk3G+3/DEbBOnHae8cdiZkkZJ5MTi
 T460xg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n6dcr0qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 11:02:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D546240052;
 Fri, 20 Dec 2024 11:01:13 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C08F25F500;
 Fri, 20 Dec 2024 11:00:09 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:09 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:08 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
 <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
Date: Fri, 20 Dec 2024 10:59:21 +0100
Message-ID: <20241220095927.1122782-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
References: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/9] iio: trigger: stm32-timer: add support
	for stm32mp25
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

Add support for STM32MP25 SoC. Use newly introduced compatible to handle
this new HW variant. Add TIM20 trigger definitions that can be used by
the stm32 analog-to-digital converter. Use compatible data to identify
it.
As the counter framework is now superseding the deprecated IIO counter
interface (IIO_COUNT), don't support it. Only register IIO trigger
devices for ADC usage. So, make the valids_table a cfg option.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/iio/trigger/stm32-timer-trigger.c     | 21 +++++++++++++++++--
 include/linux/iio/timer/stm32-timer-trigger.h |  6 ++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index bb60b2d7b2ec..8aaf3abf044e 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -38,6 +38,9 @@ static const void *triggers_table[][MAX_TRIGGERS] = {
 	{ TIM15_TRGO,},
 	{ TIM16_OC1,},
 	{ TIM17_OC1,},
+	{ }, /* timer 18 */
+	{ }, /* timer 19 */
+	{ TIM20_TRGO, TIM20_TRGO2, TIM20_OC1, TIM20_OC2, TIM20_OC3, },
 };
 
 /* List the triggers accepted by each timer */
@@ -781,7 +784,7 @@ static int stm32_timer_trigger_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	/* Create an IIO device only if we have triggers to be validated */
-	if (*cfg->valids_table[index])
+	if (cfg->valids_table && *cfg->valids_table[index])
 		priv = stm32_setup_counter_device(dev);
 	else
 		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -794,7 +797,8 @@ static int stm32_timer_trigger_probe(struct platform_device *pdev)
 	priv->clk = ddata->clk;
 	priv->max_arr = ddata->max_arr;
 	priv->triggers = triggers_table[index];
-	priv->valids = cfg->valids_table[index];
+	if (cfg->valids_table && *cfg->valids_table[index])
+		priv->valids = cfg->valids_table[index];
 	stm32_timer_detect_trgo2(priv);
 	mutex_init(&priv->lock);
 
@@ -886,6 +890,16 @@ static const struct stm32_timer_trigger_cfg stm32h7_timer_trg_cfg = {
 	.num_valids_table = ARRAY_SIZE(stm32h7_valids_table),
 };
 
+static const struct stm32_timer_trigger_cfg stm32mp25_timer_trg_cfg = {
+	/*
+	 * valids_table not used: counter framework is now superseding the deprecated IIO
+	 * counter interface (IIO_COUNT), so don't support it. num_valids_table is only
+	 * kept here to register the IIO HW triggers. valids_table should be moved at some
+	 * point to the stm32-timer-cnt driver instead.
+	 */
+	.num_valids_table = ARRAY_SIZE(triggers_table),
+};
+
 static const struct of_device_id stm32_trig_of_match[] = {
 	{
 		.compatible = "st,stm32-timer-trigger",
@@ -893,6 +907,9 @@ static const struct of_device_id stm32_trig_of_match[] = {
 	}, {
 		.compatible = "st,stm32h7-timer-trigger",
 		.data = (void *)&stm32h7_timer_trg_cfg,
+	}, {
+		.compatible = "st,stm32mp25-timer-trigger",
+		.data = (void *)&stm32mp25_timer_trg_cfg,
 	},
 	{ /* end node */ },
 };
diff --git a/include/linux/iio/timer/stm32-timer-trigger.h b/include/linux/iio/timer/stm32-timer-trigger.h
index 37572e4dc73a..1ee237b56183 100644
--- a/include/linux/iio/timer/stm32-timer-trigger.h
+++ b/include/linux/iio/timer/stm32-timer-trigger.h
@@ -72,6 +72,12 @@
 
 #define TIM17_OC1	"tim17_oc1"
 
+#define TIM20_OC1	"tim20_oc1"
+#define TIM20_OC2	"tim20_oc2"
+#define TIM20_OC3	"tim20_oc3"
+#define TIM20_TRGO	"tim20_trgo"
+#define TIM20_TRGO2	"tim20_trgo2"
+
 #if IS_REACHABLE(CONFIG_IIO_STM32_TIMER_TRIGGER)
 bool is_stm32_timer_trigger(struct iio_trigger *trig);
 #else
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
