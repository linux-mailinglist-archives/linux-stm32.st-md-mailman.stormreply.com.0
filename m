Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FC2A4E968
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 18:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 483F2C78F6A;
	Tue,  4 Mar 2025 17:40:44 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF2ADC78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 17:40:42 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524GGX8P004186;
 Tue, 4 Mar 2025 18:40:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7uA/kzsyL4bjC6IvsZ+YR8eSD63QBoHyAq5BR60Y4KQ=; b=oyM/lM9Ku8iFhh4J
 NU/pu+0IHRc+uRaA7460Dn+GbQ3WA8jL1BRaf4YD2G8MHN+OwilCqnNaG3+LB1ZL
 eJgLaL0gibwx8QjqoUOj//4yRV0WXGF3o+045O+yedg52lgFeApDLNS61SYDTqYB
 7BTFW5BM9OAiWdIHgaE85dRiOU88GN6B/aMC0y73tEXCqXp/laI3P16A7pWiJ261
 xo7oIyzMjoR9H07QYZJiu7P4/oTThNe+W2RTEHVKPG89XK2XR7PjgJZrvLVCwQDc
 aM16wUDA5H1yp8iTv0fOaeiISyM6nN63NS872DJG3qQTb8MOAzQn66mgQrenleYt
 BWcJLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454e2sf0pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Mar 2025 18:40:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3827F400B8;
 Tue,  4 Mar 2025 18:39:07 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C55A594037;
 Tue,  4 Mar 2025 18:32:48 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:48 +0100
Received: from localhost (10.252.16.143) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:48 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
Date: Tue, 4 Mar 2025 18:32:24 +0100
Message-ID: <20250304173229.3215445-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.16.143]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 wbg@kernel.org
Subject: [Linux-stm32] [PATCH v2 3/8] iio: trigger: stm32-lptimer: add
	support for stm32mp25
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

Add support for STM32MP25 SoC. Use newly introduced compatible to handle
this new HW variant. Add new trigger definitions that can be used by the
stm32 analog-to-digital converter. Use compatible data to identify them.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/iio/trigger/stm32-lptimer-trigger.c   | 109 +++++++++++++++---
 include/linux/iio/timer/stm32-lptim-trigger.h |   9 ++
 2 files changed, 99 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
index f1e18913236a..995234c1e7d5 100644
--- a/drivers/iio/trigger/stm32-lptimer-trigger.c
+++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
@@ -16,16 +16,44 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
-/* List Low-Power Timer triggers */
-static const char * const stm32_lptim_triggers[] = {
-	LPTIM1_OUT,
-	LPTIM2_OUT,
-	LPTIM3_OUT,
+/* Maximum triggers + one trailing null entry to indicate the end of array */
+#define MAX_TRIGGERS 3
+
+struct stm32_lptim_cfg {
+	const char * const (*triggers)[MAX_TRIGGERS];
+	unsigned int nb_triggers;
+};
+
+/* List Low-Power Timer triggers for H7, MP13, MP15 */
+static const char * const stm32_lptim_triggers[][MAX_TRIGGERS] = {
+	{ LPTIM1_OUT,},
+	{ LPTIM2_OUT,},
+	{ LPTIM3_OUT,},
+};
+
+/* List Low-Power Timer triggers for STM32MP25 */
+static const char * const stm32mp25_lptim_triggers[][MAX_TRIGGERS] = {
+	{ LPTIM1_CH1, LPTIM1_CH2, },
+	{ LPTIM2_CH1, LPTIM2_CH2, },
+	{ LPTIM3_CH1,},
+	{ LPTIM4_CH1,},
+	{ LPTIM5_OUT,},
+};
+
+static const struct stm32_lptim_cfg stm32mp15_lptim_cfg = {
+	.triggers = stm32_lptim_triggers,
+	.nb_triggers = ARRAY_SIZE(stm32_lptim_triggers),
+};
+
+static const struct stm32_lptim_cfg stm32mp25_lptim_cfg = {
+	.triggers = stm32mp25_lptim_triggers,
+	.nb_triggers = ARRAY_SIZE(stm32mp25_lptim_triggers),
 };
 
 struct stm32_lptim_trigger {
 	struct device *dev;
-	const char *trg;
+	const char * const *triggers;
+	struct list_head tr_list;
 };
 
 static int stm32_lptim_validate_device(struct iio_trigger *trig,
@@ -54,25 +82,49 @@ bool is_stm32_lptim_trigger(struct iio_trigger *trig)
 }
 EXPORT_SYMBOL(is_stm32_lptim_trigger);
 
-static int stm32_lptim_setup_trig(struct stm32_lptim_trigger *priv)
+static void stm32_lptim_unregister_triggers(struct stm32_lptim_trigger *priv)
 {
-	struct iio_trigger *trig;
+	struct iio_trigger *tr;
 
-	trig = devm_iio_trigger_alloc(priv->dev, "%s", priv->trg);
-	if  (!trig)
-		return -ENOMEM;
+	list_for_each_entry(tr, &priv->tr_list, alloc_list)
+		iio_trigger_unregister(tr);
+}
+
+static int stm32_lptim_register_triggers(struct stm32_lptim_trigger *priv)
+{
+	const char * const *cur = priv->triggers;
+	int ret;
 
-	trig->dev.parent = priv->dev->parent;
-	trig->ops = &stm32_lptim_trigger_ops;
-	iio_trigger_set_drvdata(trig, priv);
+	INIT_LIST_HEAD(&priv->tr_list);
 
-	return devm_iio_trigger_register(priv->dev, trig);
+	while (cur && *cur) {
+		struct iio_trigger *trig;
+
+		trig = devm_iio_trigger_alloc(priv->dev, "%s", *cur);
+		if  (!trig)
+			return -ENOMEM;
+
+		trig->dev.parent = priv->dev->parent;
+		trig->ops = &stm32_lptim_trigger_ops;
+		iio_trigger_set_drvdata(trig, priv);
+
+		ret = iio_trigger_register(trig);
+		if (ret)
+			return ret;
+
+		list_add_tail(&trig->alloc_list, &priv->tr_list);
+		cur++;
+	}
+
+	return 0;
 }
 
 static int stm32_lptim_trigger_probe(struct platform_device *pdev)
 {
 	struct stm32_lptim_trigger *priv;
+	struct stm32_lptim_cfg const *lptim_cfg;
 	u32 index;
+	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -81,23 +133,42 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
 	if (device_property_read_u32(&pdev->dev, "reg", &index))
 		return -EINVAL;
 
-	if (index >= ARRAY_SIZE(stm32_lptim_triggers))
+	lptim_cfg = device_get_match_data(&pdev->dev);
+
+	if (index >= lptim_cfg->nb_triggers)
 		return -EINVAL;
 
 	priv->dev = &pdev->dev;
-	priv->trg = stm32_lptim_triggers[index];
+	priv->triggers = lptim_cfg->triggers[index];
+
+	ret = stm32_lptim_register_triggers(priv);
+	if (ret) {
+		stm32_lptim_unregister_triggers(priv);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static void stm32_lptim_trigger_remove(struct platform_device *pdev)
+{
+	struct stm32_lptim_trigger *priv = platform_get_drvdata(pdev);
 
-	return stm32_lptim_setup_trig(priv);
+	stm32_lptim_unregister_triggers(priv);
 }
 
 static const struct of_device_id stm32_lptim_trig_of_match[] = {
-	{ .compatible = "st,stm32-lptimer-trigger", },
+	{ .compatible = "st,stm32-lptimer-trigger", .data = (void *)&stm32mp15_lptim_cfg },
+	{ .compatible = "st,stm32mp25-lptimer-trigger", .data = (void *)&stm32mp25_lptim_cfg},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_lptim_trig_of_match);
 
 static struct platform_driver stm32_lptim_trigger_driver = {
 	.probe = stm32_lptim_trigger_probe,
+	.remove = stm32_lptim_trigger_remove,
 	.driver = {
 		.name = "stm32-lptimer-trigger",
 		.of_match_table = stm32_lptim_trig_of_match,
diff --git a/include/linux/iio/timer/stm32-lptim-trigger.h b/include/linux/iio/timer/stm32-lptim-trigger.h
index a34dcf6a6001..ce3cf0addb2e 100644
--- a/include/linux/iio/timer/stm32-lptim-trigger.h
+++ b/include/linux/iio/timer/stm32-lptim-trigger.h
@@ -14,6 +14,15 @@
 #define LPTIM1_OUT	"lptim1_out"
 #define LPTIM2_OUT	"lptim2_out"
 #define LPTIM3_OUT	"lptim3_out"
+#define LPTIM4_OUT	"lptim4_out"
+#define LPTIM5_OUT	"lptim5_out"
+
+#define LPTIM1_CH1	"lptim1_ch1"
+#define LPTIM1_CH2	"lptim1_ch2"
+#define LPTIM2_CH1	"lptim2_ch1"
+#define LPTIM2_CH2	"lptim2_ch2"
+#define LPTIM3_CH1	"lptim3_ch1"
+#define LPTIM4_CH1	"lptim4_ch1"
 
 #if IS_REACHABLE(CONFIG_IIO_STM32_LPTIMER_TRIGGER)
 bool is_stm32_lptim_trigger(struct iio_trigger *trig);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
