Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A8881A93
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Mar 2024 02:12:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C44FC6DD68;
	Thu, 21 Mar 2024 01:12:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FDB5C6DD60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 01:12:33 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6760387F3F;
 Thu, 21 Mar 2024 02:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1710983553;
 bh=ghEmQ/2k58GxFaDacJCmeN+aS/CuhEQtrc5z5YAU/1o=;
 h=From:To:Cc:Subject:Date:From;
 b=iVgKc0p2XL7RqlUb9HTN0vAHjsGM0tU/8e8CHe2jYOaDb035ZMBLE/8ROHnR/VAS6
 C6dBGELuwFR8NVMQkgUV/ykampd3jDx7VFR9ePzssF43WFxFaqjVQsHFwNskRs6D8R
 kQteg5AtkUj0LPxKcoT84lNBfa+xDffvmp+Xkrk6MvZ95K+gp2BIAp4VuMcQLSWVqY
 zkbtYbN3/9sJV4170zZWgcZ4myFIEKNmX+NYQoGsL/NNDy2bLSaDgz6zqnjWmtJmFT
 bfLJ+ke8UXFG6IW8CNOVSmE/wzzCoskF+bo6Jv/i4IPe+zIreB/4JsKANSEWSLiMhp
 WlYJzTbxj33zg==
From: Marek Vasut <marex@denx.de>
To: linux-watchdog@vger.kernel.org
Date: Thu, 21 Mar 2024 02:11:40 +0100
Message-ID: <20240321011207.45388-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Subject: [Linux-stm32] [PATCH v3] watchdog: stm32_iwdg: Add pretimeout
	support
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

The STM32MP15xx IWDG adds registers which permit this IP to generate
pretimeout interrupt. This interrupt can also be used to wake the CPU
from suspend. Implement support for generating this interrupt and let
userspace configure the pretimeout. In case the pretimeout is not
configured by user, set pretimeout to half of the WDT timeout cycle.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-watchdog@vger.kernel.org
---
V2: - Subtract the pretimeout value from timeout value before writing it
      into the IWDG pretimeout register, because the watchdog counter
      register is counting down, and the pretimeout interrupt triggers
      when watchdog counter register matches the pretimeout register
      content.
    - Set default pretimeout to 3/4 of timeout .
V3: - Use dev instead of pdev->dev
    - Swap order of ret/return 0
    - Split this from the DT changes, which are orthogonal
    - Uh, this patch got stuck in upstreaming queue, sorry
---
 drivers/watchdog/stm32_iwdg.c | 95 ++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 5404e03876202..d700e0d49bb95 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/watchdog.h>
 
 #define DEFAULT_TIMEOUT 10
@@ -28,6 +29,7 @@
 #define IWDG_RLR	0x08 /* ReLoad Register */
 #define IWDG_SR		0x0C /* Status Register */
 #define IWDG_WINR	0x10 /* Windows Register */
+#define IWDG_EWCR	0x14 /* Early Wake-up Register */
 
 /* IWDG_KR register bit mask */
 #define KR_KEY_RELOAD	0xAAAA /* reload counter enable */
@@ -47,22 +49,29 @@
 #define SR_PVU	BIT(0) /* Watchdog prescaler value update */
 #define SR_RVU	BIT(1) /* Watchdog counter reload value update */
 
+#define EWCR_EWIT	GENMASK(11, 0) /* Watchdog counter window value */
+#define EWCR_EWIC	BIT(14) /* Watchdog early interrupt acknowledge */
+#define EWCR_EWIE	BIT(15) /* Watchdog early interrupt enable */
+
 /* set timeout to 100000 us */
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
 
 struct stm32_iwdg_data {
 	bool has_pclk;
+	bool has_early_wakeup;
 	u32 max_prescaler;
 };
 
 static const struct stm32_iwdg_data stm32_iwdg_data = {
 	.has_pclk = false,
+	.has_early_wakeup = false,
 	.max_prescaler = 256,
 };
 
 static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
 	.has_pclk = true,
+	.has_early_wakeup = true,
 	.max_prescaler = 1024,
 };
 
@@ -88,13 +97,18 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
 static int stm32_iwdg_start(struct watchdog_device *wdd)
 {
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
-	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
+	u32 tout, ptot, presc, iwdg_rlr, iwdg_ewcr, iwdg_pr, iwdg_sr;
 	int ret;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
+	if (!wdd->pretimeout)
+		wdd->pretimeout = 3 * wdd->timeout / 4;
+
 	tout = clamp_t(unsigned int, wdd->timeout,
 		       wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
+	ptot = clamp_t(unsigned int, tout - wdd->pretimeout,
+		       wdd->min_timeout, tout);
 
 	presc = DIV_ROUND_UP(tout * wdt->rate, RLR_MAX + 1);
 
@@ -102,6 +116,7 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	presc = roundup_pow_of_two(presc);
 	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
 	iwdg_rlr = ((tout * wdt->rate) / presc) - 1;
+	iwdg_ewcr = ((ptot * wdt->rate) / presc) - 1;
 
 	/* enable write access */
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
@@ -109,6 +124,8 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	/* set prescaler & reload registers */
 	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
 	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
+	if (wdt->data->has_early_wakeup)
+		reg_write(wdt->regs, IWDG_EWCR, iwdg_ewcr | EWCR_EWIE);
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 
 	/* wait for the registers to be updated (max 100ms) */
@@ -151,6 +168,34 @@ static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int stm32_iwdg_set_pretimeout(struct watchdog_device *wdd,
+				     unsigned int pretimeout)
+{
+	dev_dbg(wdd->parent, "%s pretimeout: %d sec\n", __func__, pretimeout);
+
+	wdd->pretimeout = pretimeout;
+
+	if (watchdog_active(wdd))
+		return stm32_iwdg_start(wdd);
+
+	return 0;
+}
+
+static irqreturn_t stm32_iwdg_isr(int irq, void *wdog_arg)
+{
+	struct watchdog_device *wdd = wdog_arg;
+	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
+	u32 reg;
+
+	reg = reg_read(wdt->regs, IWDG_EWCR);
+	reg |= EWCR_EWIC;
+	reg_write(wdt->regs, IWDG_EWCR, reg);
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static void stm32_clk_disable_unprepare(void *data)
 {
 	clk_disable_unprepare(data);
@@ -207,11 +252,20 @@ static const struct watchdog_info stm32_iwdg_info = {
 	.identity	= "STM32 Independent Watchdog",
 };
 
+static const struct watchdog_info stm32_iwdg_preinfo = {
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_KEEPALIVEPING |
+			  WDIOF_PRETIMEOUT,
+	.identity	= "STM32 Independent Watchdog",
+};
+
 static const struct watchdog_ops stm32_iwdg_ops = {
 	.owner		= THIS_MODULE,
 	.start		= stm32_iwdg_start,
 	.ping		= stm32_iwdg_ping,
 	.set_timeout	= stm32_iwdg_set_timeout,
+	.set_pretimeout	= stm32_iwdg_set_pretimeout,
 };
 
 static const struct of_device_id stm32_iwdg_of_match[] = {
@@ -221,6 +275,40 @@ static const struct of_device_id stm32_iwdg_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
 
+static int stm32_iwdg_irq_init(struct platform_device *pdev,
+			       struct stm32_iwdg *wdt)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct watchdog_device *wdd = &wdt->wdd;
+	struct device *dev = &pdev->dev;
+	int irq, ret;
+
+	if (!wdt->data->has_early_wakeup)
+		return 0;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0)
+		return 0;
+
+	if (of_property_read_bool(np, "wakeup-source")) {
+		ret = device_init_wakeup(dev, true);
+		if (ret)
+			return ret;
+
+		ret = dev_pm_set_wake_irq(dev, irq);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_request_irq(dev, irq, stm32_iwdg_isr, 0,
+			       dev_name(dev), wdd);
+	if (ret)
+		return ret;
+
+	wdd->info = &stm32_iwdg_preinfo;
+	return 0;
+}
+
 static int stm32_iwdg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -255,6 +343,11 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
 				    1000) / wdt->rate;
 
+	/* Initialize IRQ, this might override wdd->info, hence it is here. */
+	ret = stm32_iwdg_irq_init(pdev, wdt);
+	if (ret)
+		return ret;
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
 	watchdog_init_timeout(wdd, 0, dev);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
