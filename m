Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E6D14B3F1
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 13:07:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58B08C36B0B;
	Tue, 28 Jan 2020 12:07:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1537DC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 12:07:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00SBwwBe024147; Tue, 28 Jan 2020 13:07:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5HkE9jfFUL3lZo9YbC9rUgBgIoZQNdPFXYTRrcSw0Vs=;
 b=q6w0gOwk3DMFsylGHjahwQMM3p2glaF4AMzG8YhalLVSLhR5PdxlqUgZVNLblr/U/SKu
 F9alK61gayooZbq2lMizxAkloVMCw8emZBVO91OdnqcGeFdIVz1/zvyDkM9n3+knRFCw
 4gARJAURsiYkpjatFxU61ts8l7sFcrWqUqqw3ZONYlKsspP8on5nJXJZDLT1PKCcvbzO
 juRckU/eTkCwaHmMAJCE1eN4YEMKAuSBd59X2oIrl3oKBNRYOYiCx7ycnURQBN/ROCg4
 9wfao+w4QqUwxBI1Rw+wboDeWM8mX3ucOHj/SmQGl62zdY39mBQrZcCWyacIKtD41piF Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcaxwp98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 13:07:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0717210003B;
 Tue, 28 Jan 2020 13:07:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA0BF2A4D96;
 Tue, 28 Jan 2020 13:07:07 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jan 2020 13:07:07
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <linux@armlinux.org.uk>, <p.paillet@st.com>,
 <linus.walleij@linaro.org>
Date: Tue, 28 Jan 2020 13:07:02 +0100
Message-ID: <20200128120702.26166-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200128120702.26166-1-benjamin.gaignard@st.com>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_03:2020-01-24,
 2020-01-28 signatures=0
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/2] clocksource: Add Low Power STM32
	timers driver
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

From: Benjamin Gaignard <benjamin.gaignard@linaro.org>

Implement clock event driver using low power STM32 timers.
Low power timers counter s running even in when CPU is in stop mode.
It could be used as clock event broadcaster to wake up CPUs but not like
a clocksource because each it rise an interrupt the counter restart from 0.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
version 3:
- fix timer set sequence
- don't forget to free irq on remove function
- use devm_kzalloc to simplify errors handling in probe function

 drivers/clocksource/Kconfig          |   4 +
 drivers/clocksource/Makefile         |   1 +
 drivers/clocksource/timer-stm32-lp.c | 248 +++++++++++++++++++++++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 drivers/clocksource/timer-stm32-lp.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 5fdd76cb1768..d9d06c14777d 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -292,6 +292,10 @@ config CLKSRC_STM32
 	select CLKSRC_MMIO
 	select TIMER_OF
 
+config CLKSRC_STM32_LP
+	bool "Low power clocksource for STM32 SoCs"
+	depends on OF && ARM && (MACH_STM32MP157 || COMPILE_TEST)
+
 config CLKSRC_MPS2
 	bool "Clocksource for MPS2 SoCs" if COMPILE_TEST
 	depends on GENERIC_SCHED_CLOCK
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 4dfe4225ece7..c6eef37be9cc 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
 obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
 obj-$(CONFIG_CLKSRC_EFM32)	+= timer-efm32.o
 obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
+obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
 obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
 obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
 obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
new file mode 100644
index 000000000000..b6de1ca9e115
--- /dev/null
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Authors: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
+ *	    Pascal Paillet <p.paillet@st.com> for STMicroelectronics.
+ */
+
+#include <linux/clk.h>
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/delay.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mfd/stm32-lptimer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define LPTIM_ICR		0x04
+#define ICR_ARRMCF		BIT(1)
+
+#define LPTIM_IER		0x08
+#define IER_ARRMIE		BIT(1)
+
+#define LPTIM_CFGR		0x0C
+#define CFGR_PSC_OFFSET		9
+
+#define LPTIM_CR		0x10
+#define CR_ENABLE		BIT(0)
+#define CR_SNGSTRT		BIT(1)
+#define CR_CNTSTRT		BIT(2)
+
+#define LPTIM_CMP		0x14
+#define LPTIM_ARR		0x18
+
+#define STM32_LP_BITS		16
+#define STM32_LP_RATING		400
+#define STM32_CLKRATE		(32000 * HZ)
+#define TIMER_MAX_VAL		(BIT(STM32_LP_BITS) - 1)
+#define STM32_LP_MAX_PSC	7
+
+struct stm32_lp_private {
+	struct regmap *reg;
+	struct clk *clk;
+	struct clock_event_device clkevt;
+	unsigned long rate;
+	unsigned long period;
+};
+
+static struct stm32_lp_private*
+to_priv(struct clock_event_device *clkevt)
+{
+	return container_of(clkevt, struct stm32_lp_private, clkevt);
+}
+
+static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	regmap_write(priv->reg, LPTIM_CR, 0);
+	regmap_write(priv->reg, LPTIM_IER, 0);
+	/* clear pending flags */
+	regmap_write(priv->reg, LPTIM_ICR, ICR_ARRMCF);
+
+	return 0;
+}
+
+static int stm32_clkevent_lp_set_timer(unsigned long evt,
+				       struct clock_event_device *clkevt,
+				       int is_periodic)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	/* disable TIMER */
+	regmap_write(priv->reg, LPTIM_CR, 0);
+	/* enable ARR interrupt */
+	regmap_write(priv->reg, LPTIM_IER, IER_ARRMIE);
+	/* enable LPTIMER*/
+	regmap_write(priv->reg, LPTIM_CR, CR_ENABLE);
+	/* set nex event counter */
+	regmap_write(priv->reg, LPTIM_ARR, evt);
+	/* reset counter */
+	regmap_write(priv->reg, LPTIM_CMP, 0);
+
+	/* start counter */
+	if (is_periodic)
+		regmap_write(priv->reg, LPTIM_CR, CR_CNTSTRT | CR_ENABLE);
+	else
+		regmap_write(priv->reg, LPTIM_CR, CR_SNGSTRT | CR_ENABLE);
+
+	return 0;
+}
+
+static int stm32_clkevent_lp_set_next_event(unsigned long evt,
+					    struct clock_event_device *clkevt)
+{
+	return stm32_clkevent_lp_set_timer(evt, clkevt,
+					   clockevent_state_periodic(clkevt));
+}
+
+static int stm32_clkevent_lp_set_periodic(struct clock_event_device *clkevt)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	return stm32_clkevent_lp_set_timer(priv->period, clkevt, true);
+}
+
+static int stm32_clkevent_lp_set_oneshot(struct clock_event_device *clkevt)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	return stm32_clkevent_lp_set_timer(priv->period, clkevt, false);
+}
+
+static irqreturn_t stm32_clkevent_lp_irq_handler(int irq, void *dev_id)
+{
+	struct clock_event_device *clkevt = (struct clock_event_device *)dev_id;
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	regmap_write(priv->reg, LPTIM_ICR, ICR_ARRMCF);
+
+	clkevt->event_handler(clkevt);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * stm32_clkevent_lp_set_prescaler - Compute and set the prescaler register
+ * @priv: a pointer to a timer-of structure
+ *
+ * Compute the prescaler to always target a 32Khz timer rate
+ */
+static void stm32_clkevent_lp_set_prescaler(struct stm32_lp_private *priv)
+{
+	int i;
+
+	for (i = 0; i <= STM32_LP_MAX_PSC; i++) {
+		if (DIV_ROUND_CLOSEST(priv->rate, 1 << i) < STM32_CLKRATE)
+			break;
+	}
+
+	regmap_write(priv->reg, LPTIM_CFGR, i << CFGR_PSC_OFFSET);
+
+	/* Adjust rate and period given the prescaler value */
+	priv->rate = DIV_ROUND_CLOSEST(priv->rate, (1 << i));
+	priv->period = DIV_ROUND_UP(priv->rate, HZ);
+}
+
+static int stm32_clkevent_lp_init(struct stm32_lp_private *priv,
+				  struct device_node *np)
+{
+	int ret;
+
+	priv->clkevt.name = np->full_name;
+	priv->clkevt.cpumask = cpu_possible_mask;
+	priv->clkevt.features = CLOCK_EVT_FEAT_PERIODIC |
+				CLOCK_EVT_FEAT_ONESHOT;
+	priv->clkevt.set_state_shutdown = stm32_clkevent_lp_shutdown;
+	priv->clkevt.set_state_periodic = stm32_clkevent_lp_set_periodic;
+	priv->clkevt.set_state_oneshot = stm32_clkevent_lp_set_oneshot;
+	priv->clkevt.set_next_event = stm32_clkevent_lp_set_next_event;
+	priv->clkevt.rating = STM32_LP_RATING;
+
+	priv->clkevt.irq = irq_of_parse_and_map(np, 0);
+	if (!priv->clkevt.irq)
+		return -EINVAL;
+
+	ret = request_irq(priv->clkevt.irq, stm32_clkevent_lp_irq_handler,
+			  IRQF_TIMER, np->full_name, &priv->clkevt);
+	if (ret)
+		return ret;
+
+	clockevents_config_and_register(&priv->clkevt, priv->rate, 0x1,
+					TIMER_MAX_VAL);
+
+	return 0;
+}
+
+static int stm32_clkevent_lp_probe(struct platform_device *pdev)
+{
+	struct stm32_lptimer *ddata = dev_get_drvdata(pdev->dev.parent);
+	struct stm32_lp_private *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg = ddata->regmap;
+	priv->clk = ddata->clk;
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		return -EINVAL;
+
+	priv->rate = clk_get_rate(priv->clk);
+	if (!priv->rate)
+		goto out_clk_disable;
+
+	stm32_clkevent_lp_set_prescaler(priv);
+
+	ret = stm32_clkevent_lp_init(priv, pdev->dev.parent->of_node);
+	if (ret)
+		goto out_clk_disable;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+out_clk_disable:
+	clk_disable_unprepare(priv->clk);
+
+	return -EINVAL;
+}
+
+static int stm32_clkevent_lp_remove(struct platform_device *pdev)
+{
+	struct stm32_lp_private *priv = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(priv->clk);
+	free_irq(priv->clkevt.irq, &priv->clkevt);
+
+	return 0;
+}
+
+static const struct of_device_id stm32_clkevent_lp_of_match[] = {
+	{ .compatible = "st,stm32-clkevent-lp", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, stm32_clkevent_lp_of_match);
+
+static struct platform_driver stm32_clkevent_lp_driver = {
+	.probe	= stm32_clkevent_lp_probe,
+	.remove = stm32_clkevent_lp_remove,
+	.driver	= {
+		.name = "stm32-clkevent-lp",
+		.of_match_table = of_match_ptr(stm32_clkevent_lp_of_match),
+	},
+};
+module_platform_driver(stm32_clkevent_lp_driver);
+
+MODULE_ALIAS("platform:stm32-clkevent-lp");
+MODULE_DESCRIPTION("STMicroelectronics STM32 clockevent LP driver");
+MODULE_LICENSE("GPL v2");
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
