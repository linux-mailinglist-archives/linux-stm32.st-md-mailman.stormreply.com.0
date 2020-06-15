Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E93381F96DA
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 14:45:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C265C36B14;
	Mon, 15 Jun 2020 12:45:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F148C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 12:44:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FChqHm015449; Mon, 15 Jun 2020 14:44:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=OeFeiQXSPoFz1zGDNRLnx/pg+w7M3JAqmjkNz+4d8C0=;
 b=hRp6vYCuTFSCYfa3cTf3Gg9rzRHJX8mWUpwsApmZlwiQ5uM915KS9jKUtZWK7R7MZT7Y
 saynVOqKkDnogwO5JhHsC+CgMpirImKgGFH2aDd2JIMAR0CWhPgFfRZxcZhgLqKZRrWA
 1YNQNfqEP05rsNgC6WDgBwuklLdm5znfuEY5EVr496WIuhQie3HAKthhH6QiV61FRe2I
 YAK7CY9T+fN3n6LFir3foro/A62oD65IHf6C/gK8uIDCowP0HK9xgk8udeJlJRYyp4vv
 0P6b+Pdp8T0p0fUwUqRwsc2L+F4Mnz10E+52r68+MeGIgMY/7MSqi4b8uRSiE9Y5PJKh 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mm91hqeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 14:44:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 388EB10002A;
 Mon, 15 Jun 2020 14:44:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A8EA2B45D9;
 Mon, 15 Jun 2020 14:44:57 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:44:56
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Jun 2020 14:44:56 +0200
Message-ID: <20200615124456.27328-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: use the
	hwspin_lock_timeout_in_atomic() API
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

From: Fabien Dessenne <fabien.dessenne@st.com>

Use the hwspin_lock_timeout_in_atomic() API which is the most appropriated
here. Indeed:
- hwspin_lock_() is called after spin_lock_irqsave()
- the hwspin_lock_timeout() API relies on jiffies count which won't work
  if IRQs are disabled which is the case here.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index a657cd829ce6..1f7fff84aa9d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -64,7 +64,7 @@
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
-#define HWSPINLOCK_TIMEOUT	5 /* msec */
+#define HWSPNLCK_TIMEOUT	1000 /* usec */
 
 static const char * const stm32_gpio_functions[] = {
 	"gpio", "af0", "af1",
@@ -420,12 +420,14 @@ static int stm32_gpio_domain_activate(struct irq_domain *d,
 	 * to avoid overriding.
 	 */
 	spin_lock_irqsave(&pctl->irqmux_lock, flags);
-	if (pctl->hwlock)
-		ret = hwspin_lock_timeout(pctl->hwlock, HWSPINLOCK_TIMEOUT);
 
-	if (ret) {
-		dev_err(pctl->dev, "Can't get hwspinlock\n");
-		goto unlock;
+	if (pctl->hwlock) {
+		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
+						    HWSPNLCK_TIMEOUT);
+		if (ret) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
 	}
 
 	if (pctl->irqmux_map & BIT(irq_data->hwirq)) {
@@ -433,7 +435,7 @@ static int stm32_gpio_domain_activate(struct irq_domain *d,
 			irq_data->hwirq);
 		ret = -EBUSY;
 		if (pctl->hwlock)
-			hwspin_unlock(pctl->hwlock);
+			hwspin_unlock_in_atomic(pctl->hwlock);
 		goto unlock;
 	} else {
 		pctl->irqmux_map |= BIT(irq_data->hwirq);
@@ -442,7 +444,7 @@ static int stm32_gpio_domain_activate(struct irq_domain *d,
 	regmap_field_write(pctl->irqmux[irq_data->hwirq], bank->bank_ioport_nr);
 
 	if (pctl->hwlock)
-		hwspin_unlock(pctl->hwlock);
+		hwspin_unlock_in_atomic(pctl->hwlock);
 
 unlock:
 	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
@@ -750,12 +752,13 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 	clk_enable(bank->clk);
 	spin_lock_irqsave(&bank->lock, flags);
 
-	if (pctl->hwlock)
-		err = hwspin_lock_timeout(pctl->hwlock, HWSPINLOCK_TIMEOUT);
-
-	if (err) {
-		dev_err(pctl->dev, "Can't get hwspinlock\n");
-		goto unlock;
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
+						    HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
 	}
 
 	val = readl_relaxed(bank->base + alt_offset);
@@ -769,7 +772,7 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 	writel_relaxed(val, bank->base + STM32_GPIO_MODER);
 
 	if (pctl->hwlock)
-		hwspin_unlock(pctl->hwlock);
+		hwspin_unlock_in_atomic(pctl->hwlock);
 
 	stm32_gpio_backup_mode(bank, pin, mode, alt);
 
@@ -869,12 +872,13 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 	clk_enable(bank->clk);
 	spin_lock_irqsave(&bank->lock, flags);
 
-	if (pctl->hwlock)
-		err = hwspin_lock_timeout(pctl->hwlock, HWSPINLOCK_TIMEOUT);
-
-	if (err) {
-		dev_err(pctl->dev, "Can't get hwspinlock\n");
-		goto unlock;
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
+						    HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
 	}
 
 	val = readl_relaxed(bank->base + STM32_GPIO_TYPER);
@@ -883,7 +887,7 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 	writel_relaxed(val, bank->base + STM32_GPIO_TYPER);
 
 	if (pctl->hwlock)
-		hwspin_unlock(pctl->hwlock);
+		hwspin_unlock_in_atomic(pctl->hwlock);
 
 	stm32_gpio_backup_driving(bank, offset, drive);
 
@@ -923,12 +927,13 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 	clk_enable(bank->clk);
 	spin_lock_irqsave(&bank->lock, flags);
 
-	if (pctl->hwlock)
-		err = hwspin_lock_timeout(pctl->hwlock, HWSPINLOCK_TIMEOUT);
-
-	if (err) {
-		dev_err(pctl->dev, "Can't get hwspinlock\n");
-		goto unlock;
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
+						    HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
 	}
 
 	val = readl_relaxed(bank->base + STM32_GPIO_SPEEDR);
@@ -937,7 +942,7 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 	writel_relaxed(val, bank->base + STM32_GPIO_SPEEDR);
 
 	if (pctl->hwlock)
-		hwspin_unlock(pctl->hwlock);
+		hwspin_unlock_in_atomic(pctl->hwlock);
 
 	stm32_gpio_backup_speed(bank, offset, speed);
 
@@ -977,12 +982,13 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 	clk_enable(bank->clk);
 	spin_lock_irqsave(&bank->lock, flags);
 
-	if (pctl->hwlock)
-		err = hwspin_lock_timeout(pctl->hwlock, HWSPINLOCK_TIMEOUT);
-
-	if (err) {
-		dev_err(pctl->dev, "Can't get hwspinlock\n");
-		goto unlock;
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
+						    HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
 	}
 
 	val = readl_relaxed(bank->base + STM32_GPIO_PUPDR);
@@ -991,7 +997,7 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 	writel_relaxed(val, bank->base + STM32_GPIO_PUPDR);
 
 	if (pctl->hwlock)
-		hwspin_unlock(pctl->hwlock);
+		hwspin_unlock_in_atomic(pctl->hwlock);
 
 	stm32_gpio_backup_bias(bank, offset, bias);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
