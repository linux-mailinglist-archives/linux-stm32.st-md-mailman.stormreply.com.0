Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87FCC669F
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 08:50:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 740AEC58D79;
	Wed, 17 Dec 2025 07:50:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3502C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 07:50:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so65618725e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 23:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765957821; x=1766562621;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mEDspWRxu8ev/Lf8BHmK/EnPiZCfkr2HvPb/NoKe5Q=;
 b=AljNdiFrYpaq4j6ugWGlQViNp5GbbcDudhgJ+kISPI7iVaZPoAP+zNrplJwiX5pfN4
 isCTZdjUgx9JFuK/DsWleFHkg1nXKMdRkyBPWbFcbtGY2wk64eGumqH3TfWRH501bLq2
 pXLGzlXB0uJqVY189EMh1LCIqGfj3/g7eR7VJacX8l68rPKRaMcPlrttIBXcKdjOsTmV
 KUHDGUOHTlNTyBhkFsp9abOGfWMDj0U+iRWXdKxoPHU/1gkdW5Xb9k8evl3ydTeL+VHh
 DnIKwVp+iIyRtjYvoONUWjuG1xHFes1Cip/PaP3Nr/QTcOLN42uzaqEyzDLG05WgOh91
 Maxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765957821; x=1766562621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3mEDspWRxu8ev/Lf8BHmK/EnPiZCfkr2HvPb/NoKe5Q=;
 b=KEA9nWi3uAKcxm/Q2O1K19+DvjSLU443vGxsWH2BQX6jdFCuP8Cp+KGtIgrgjoXjns
 Mk+jihe/aSDgrRknNq1uhTj8fcGPwOgxpQYE2vHY6GyUdCzsSS0Qn2ieogbQ1/SCh+wO
 7BzuD6b2hmh+f5pyFeN0roTD7zTYx5qWzC4gKMk6BjHznuJL6Q+aGxuF2sLXJtEc9TMe
 HjwKJkRxpjDkCUnDUV0529GuzYXpNLuKsKKGjG6FuMGLu42opaU7XlorUMnDR6XPvq+0
 aDwW5wVCjXIEdwkKIQS5NHelI4745gTXWBwe/3TM6aIMxnifzsOqjpDUAID6V2NJIkxU
 yJMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXctvfPdBXhxLYR8yMCPjTlHSzLU2k16oQa5NeQowLNkmqTCGI4m6eXhMO83pXQCZHg7zks5JDdh/r/IQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzbwPsllPRcLDCsv9afpxABQt/TPxHAP48HeQdbaJKe3D2/GzYk
 ZAD1Pu4+IsRGGHl51sEtOiv8+xVhWPwBFcnFnHkvE17833XKr//lYAfRXJao8h6UOWc=
X-Gm-Gg: AY/fxX664Udxre9/mGNVPinl0b8tY6ZUhh0zueISFRjNz8ULO5DURkex3sDghqaMu2p
 Xoz2sTrtH8/bbZrVdMitlEz/06r82iMJMrvYs5rSbPeGKRoOMBWFqcinG/fKXaruqfa8Xwt3ivq
 OS0WmEWi47iuUII7B/yVFDR6+63KkofYt/SUTImx64iD8lafAJdOgQxJatvSmmtU1K3e4RFNcwi
 zm2AqQrVHJ3X0Wsl31oI3XMvDnP8jEjiYxVF8mGxwx1o+o8Ze/XJz6KO9UahEhHP5HKh9XSBh7d
 KW3miQnj7rhnWxp2WDizQUbn+puiaxO5poQ4mEg8O4fiW7U6l1M10YHM9MAiHTvdURXun8ZULfz
 HrFpSotjE1TKSnMHYym5zQNf6qu/Vdm2yF4Tat6F2WZFAlOo4zxm6LH1+lrVzhDl1RffsDFc7F/
 83ndAisUZsg0JGF8DeqjDdrpqMthpfBKs=
X-Google-Smtp-Source: AGHT+IE5wiDfaK/vzIGieNFAGeN1n7bTb5hWPHvlVtjJbKESFVmmsC3/l1Mw+mozuxMdTSpQ8GYC6A==
X-Received: by 2002:a05:600c:4e54:b0:477:9eb8:97d2 with SMTP id
 5b1f17b1804b1-47a8f8a7092mr197954635e9.8.1765957821327; 
 Tue, 16 Dec 2025 23:50:21 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc1edff5sm26094315e9.14.2025.12.16.23.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 23:50:20 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wbg@kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
Date: Wed, 17 Dec 2025 08:49:57 +0100
Message-ID: <20251217075000.2592966-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217075000.2592966-1-daniel.lezcano@linaro.org>
References: <20251217075000.2592966-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, s32@nxp.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v3 3/3] counter: Add STM based counter
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

The NXP S32G2 automotive platform integrates four Cortex-A53 cores and
three Cortex-M7 cores, along with a large number of timers and
counters. These hardware blocks can be used as clocksources or
clockevents, or as timestamp counters shared across the various
subsystems running alongside the Linux kernel, such as firmware
components. Their actual usage depends on the overall platform
software design.

In a Linux-based system, the kernel controls the counter, which is a
read-only shared resource for the other subsystems. One of its primary
purposes is to act as a common timestamp source for messages or
traces, allowing correlation of events occurring in different
operating system contexts.

These changes introduce a basic counter driver that can start, stop,
and reset the counter. It also handles overflow accounting and
configures the prescaler value.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/counter/Kconfig       |  10 +
 drivers/counter/Makefile      |   1 +
 drivers/counter/nxp-stm-cnt.c | 386 ++++++++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 drivers/counter/nxp-stm-cnt.c

diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
index d30d22dfe577..bf5b281f194c 100644
--- a/drivers/counter/Kconfig
+++ b/drivers/counter/Kconfig
@@ -90,6 +90,16 @@ config MICROCHIP_TCB_CAPTURE
 	  To compile this driver as a module, choose M here: the
 	  module will be called microchip-tcb-capture.
 
+config NXP_STM_CNT
+	tristate "NXP System Timer Module Counter driver"
+	depends on ARCH_S32 || COMPILE_TEST
+	help
+	  Select this option to enable the NXP System Timer Module
+	  Counter driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called nxp_stm_cnt.
+
 config RZ_MTU3_CNT
 	tristate "Renesas RZ/G2L MTU3a counter driver"
 	depends on RZ_MTU3
diff --git a/drivers/counter/Makefile b/drivers/counter/Makefile
index 40e644948e7a..196b3c216875 100644
--- a/drivers/counter/Makefile
+++ b/drivers/counter/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_I8254)			+= i8254.o
 obj-$(CONFIG_INTEL_QEP)			+= intel-qep.o
 obj-$(CONFIG_INTERRUPT_CNT)		+= interrupt-cnt.o
 obj-$(CONFIG_MICROCHIP_TCB_CAPTURE)	+= microchip-tcb-capture.o
+obj-$(CONFIG_NXP_STM_CNT)		+= nxp-stm-cnt.o
 obj-$(CONFIG_RZ_MTU3_CNT)		+= rz-mtu3-cnt.o
 obj-$(CONFIG_STM32_TIMER_CNT)		+= stm32-timer-cnt.o
 obj-$(CONFIG_STM32_LPTIMER_CNT)		+= stm32-lptimer-cnt.o
diff --git a/drivers/counter/nxp-stm-cnt.c b/drivers/counter/nxp-stm-cnt.c
new file mode 100644
index 000000000000..36463fcbc9df
--- /dev/null
+++ b/drivers/counter/nxp-stm-cnt.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2018,2021-2025 NXP
+ * Copyright 2025 Linaro Limited
+ *
+ * Author: Daniel Lezcano <daniel.lezcano@linaro.org>
+ *
+ * NXP S32G System Timer Module counters:
+ *
+ *  STM supports commonly required system and application software
+ *  timing functions. STM includes a 32-bit count-up timer and four
+ *  32-bit compare channels with a separate interrupt source for each
+ *  channel. The timer is driven by the STM module clock divided by an
+ *  8-bit prescale value (1 to 256). It has ability to stop the timer
+ *  in Debug mode
+ *
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/counter.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define STM_CR(__base)		(__base)
+#define STM_CR_TEN		BIT(0)
+#define STM_CR_FRZ		BIT(1)
+#define STM_CR_CPS_MASK         GENMASK(15, 8)
+
+#define STM_CCR0(__base)	((__base) + 0x10)
+#define STM_CCR_CEN		BIT(0)
+
+#define STM_CIR0(__base)	((__base) + 0x14)
+#define STM_CIR_CIF		BIT(0)
+
+#define STM_CMP0(__base)	((__base) + 0x18)
+
+#define STM_CNT(__base)		((__base) + 0x04)
+
+#define STM_ENABLE_MASK	(STM_CR_FRZ | STM_CR_TEN)
+
+struct nxp_stm_cnt {
+	spinlock_t lock;
+	void __iomem *base;
+	u64 overflow;
+	u32 counter;
+	u8 prescaler;
+	bool is_started;
+};
+
+static void nxp_stm_cnt_enable(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	reg |= STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_disable(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	reg &= ~STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_ccr_disable(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(0, STM_CCR0(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_ccr_enable(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(STM_CCR_CEN, STM_CCR0(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_set_overflow(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(UINT_MAX, STM_CMP0(stm_cnt->base));
+}
+
+static u32 nxp_stm_cnt_get_counter(struct nxp_stm_cnt *stm_cnt)
+{
+	return readl(STM_CNT(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_set_counter(struct nxp_stm_cnt *stm_cnt, u32 counter)
+{
+	writel(counter, STM_CNT(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_set_prescaler(struct nxp_stm_cnt *stm_cnt, u8 prescaler)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	FIELD_MODIFY(STM_CR_CPS_MASK, &reg, prescaler);
+
+	writel(reg, STM_CR(stm_cnt->base));
+}
+
+static u8 nxp_stm_cnt_get_prescaler(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg = readl(STM_CR(stm_cnt->base));
+
+	return FIELD_GET(STM_CR_CPS_MASK, reg);
+}
+
+static bool nxp_stm_cnt_is_started(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	return !!FIELD_GET(STM_CR_TEN, reg);
+}
+
+static void nxp_stm_cnt_irq_ack(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(STM_CIR_CIF, STM_CIR0(stm_cnt->base));
+}
+
+static irqreturn_t nxp_stm_cnt_irq(int irq, void *dev_id)
+{
+	struct nxp_stm_cnt *stm_cnt = dev_id;
+
+	nxp_stm_cnt_irq_ack(stm_cnt);
+
+	spin_lock(&stm_cnt->lock);
+	stm_cnt->overflow++;
+	spin_unlock(&stm_cnt->lock);
+
+	return IRQ_HANDLED;
+}
+
+static void nxp_stm_cnt_start(struct nxp_stm_cnt *stm_cnt)
+{
+	nxp_stm_cnt_ccr_enable(stm_cnt);
+	nxp_stm_cnt_set_overflow(stm_cnt);
+	nxp_stm_cnt_enable(stm_cnt);
+}
+
+static void nxp_stm_cnt_stop(struct nxp_stm_cnt *stm_cnt)
+{
+	nxp_stm_cnt_disable(stm_cnt);
+	nxp_stm_cnt_irq_ack(stm_cnt);
+	nxp_stm_cnt_ccr_disable(stm_cnt);
+}
+
+static int nxp_stm_cnt_overflow_read(struct counter_device *counter,
+				     struct counter_count *count, u64 *val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&stm_cnt->lock, irqflags);
+	*val = stm_cnt->overflow;
+	spin_unlock_irqrestore(&stm_cnt->lock, irqflags);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_overflow_write(struct counter_device *counter,
+				      struct counter_count *count, u64 val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&stm_cnt->lock, irqflags);
+	stm_cnt->overflow = val;
+	spin_unlock_irqrestore(&stm_cnt->lock, irqflags);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_reset_write(struct counter_device *counter,
+				   struct counter_count *count, u8 val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	nxp_stm_cnt_set_counter(stm_cnt, 0);
+	spin_lock(&stm_cnt->lock);
+	stm_cnt->overflow = 0;
+	spin_unlock(&stm_cnt->lock);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_prescaler_read(struct counter_device *counter,
+				      struct counter_count *count, u8 *val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	*val = nxp_stm_cnt_get_prescaler(stm_cnt);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_prescaler_write(struct counter_device *counter,
+				       struct counter_count *count, u8 val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	nxp_stm_cnt_set_prescaler(stm_cnt, val);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_count_enable_write(struct counter_device *counter,
+					  struct counter_count *count, u8 enable)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	if (enable)
+		nxp_stm_cnt_start(stm_cnt);
+	else
+		nxp_stm_cnt_stop(stm_cnt);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_count_enable_read(struct counter_device *counter,
+					 struct counter_count *count, u8 *enable)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	*enable = nxp_stm_cnt_is_started(stm_cnt);
+
+	return 0;
+}
+
+static struct counter_comp stm_cnt_count_ext[] = {
+	COUNTER_COMP_COUNT_BOOL("reset",  NULL, nxp_stm_cnt_reset_write),
+	COUNTER_COMP_COUNT_U8("prescaler", nxp_stm_cnt_prescaler_read, nxp_stm_cnt_prescaler_write),
+	COUNTER_COMP_COUNT_U64("overflows", nxp_stm_cnt_overflow_read, nxp_stm_cnt_overflow_write),
+	COUNTER_COMP_ENABLE(nxp_stm_cnt_count_enable_read, nxp_stm_cnt_count_enable_write),
+};
+
+static int nxp_stm_cnt_count_read(struct counter_device *dev,
+				  struct counter_count *count, u64 *val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(dev);
+
+	*val = nxp_stm_cnt_get_counter(stm_cnt);
+
+	return 0;
+}
+
+static const struct counter_ops nxp_stm_cnt_counter_ops = {
+	.count_read  = nxp_stm_cnt_count_read,
+};
+
+static struct counter_count nxp_stm_cnt_counts[] = {
+	{
+		.id = 0,
+		.name = "stm_cnt",
+		.ext = stm_cnt_count_ext,
+		.num_ext = ARRAY_SIZE(stm_cnt_count_ext),
+	},
+};
+
+static int nxp_stm_cnt_suspend(struct device *dev)
+{
+	struct nxp_stm_cnt *stm_cnt = dev_get_drvdata(dev);
+
+	stm_cnt->is_started = nxp_stm_cnt_is_started(stm_cnt);
+
+	if (stm_cnt->is_started) {
+		nxp_stm_cnt_stop(stm_cnt);
+		stm_cnt->prescaler = nxp_stm_cnt_get_prescaler(stm_cnt);
+		stm_cnt->counter = nxp_stm_cnt_get_counter(stm_cnt);
+	}
+
+	return 0;
+}
+
+static int nxp_stm_cnt_resume(struct device *dev)
+{
+	struct nxp_stm_cnt *stm_cnt = dev_get_drvdata(dev);
+
+	if (stm_cnt->is_started) {
+		nxp_stm_cnt_set_counter(stm_cnt, stm_cnt->counter);
+		nxp_stm_cnt_set_prescaler(stm_cnt, stm_cnt->prescaler);
+		nxp_stm_cnt_start(stm_cnt);
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(nxp_stm_cnt_pm_ops, nxp_stm_cnt_suspend,
+				nxp_stm_cnt_resume);
+
+static int nxp_stm_cnt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct counter_device *counter;
+	struct nxp_stm_cnt *stm_cnt;
+	struct clk *clk;
+	void __iomem *base;
+	int irq, ret;
+
+	base = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base), "Failed to iomap %pOFn\n", np);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Clock not found\n");
+
+	counter = devm_counter_alloc(dev, sizeof(*stm_cnt));
+	if (!counter)
+		return -ENOMEM;
+
+	stm_cnt = counter_priv(counter);
+
+	stm_cnt->base = base;
+	stm_cnt->overflow = 0;
+	spin_lock_init(&stm_cnt->lock);
+
+	counter->name       = "stm_counter";
+	counter->parent     = &pdev->dev;
+	counter->ops        = &nxp_stm_cnt_counter_ops;
+	counter->counts     = nxp_stm_cnt_counts;
+	counter->num_counts = ARRAY_SIZE(nxp_stm_cnt_counts);
+
+	ret = devm_request_irq(dev, irq, nxp_stm_cnt_irq, IRQF_TIMER | IRQF_NOBALANCING,
+			       dev_name(&counter->dev), stm_cnt);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to allocate interrupt line\n");
+
+	ret = devm_counter_add(dev, counter);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register counter\n");
+
+	platform_set_drvdata(pdev, stm_cnt);
+
+	return 0;
+}
+
+static void nxp_stm_cnt_remove(struct platform_device *pdev)
+{
+	struct nxp_stm_cnt *stm_cnt = platform_get_drvdata(pdev);
+
+	if (nxp_stm_cnt_is_started(stm_cnt))
+		nxp_stm_cnt_stop(stm_cnt);
+}
+
+static const struct of_device_id nxp_stm_cnt_of_match[] = {
+	{ .compatible = "nxp,s32g2-stm-cnt", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nxp_stm_cnt_of_match);
+
+static struct platform_driver nxp_stm_cnt_driver = {
+	.probe  = nxp_stm_cnt_probe,
+	.remove = nxp_stm_cnt_remove,
+	.driver = {
+		.name           = "nxp-stm-cnt",
+		.pm		= pm_sleep_ptr(&nxp_stm_cnt_pm_ops),
+		.of_match_table = nxp_stm_cnt_of_match,
+	},
+};
+module_platform_driver(nxp_stm_cnt_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Daniel Lezcano");
+MODULE_DESCRIPTION("NXP System Timer Module counter driver");
+MODULE_IMPORT_NS("COUNTER");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
