Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F62B939F
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Sep 2019 17:01:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5D5BC35E01;
	Fri, 20 Sep 2019 15:01:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68381C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 15:01:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8KEkiJj029770; Fri, 20 Sep 2019 17:00:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=oN0Ax4lbm8sphTOWdTDGK6SWkUe4Md0Mb1/rUapNH9A=;
 b=uPQqAmfNkYWi1r1JZK+EtXG9FXviggq1tThrcve0oFOTlnxOK3uQ7OIqA50wipTg4SRc
 iYekMVwt+OwDzXOYRVolZVRYsht5EUdyJ2WB/iWoJHq7S5nChZLMYA2xi5zzKGseQ6QT
 J5aIjfllyOQQbpniNQigUSj8UydenJpxkQPdSC97oG9FWCT/YUvfprGNXJYWgKgQB1/h
 77jdN3o7ZXTmSgptjVhcCyj5rc4vbImFqIt4mWGaPW6QTWUbrLebewGNUbFlTXfSEjp2
 vT570KghSzBxFdDVsZwO1ISy2An9dOzSK36D+m6iofOnl3ZMeewFRJ7cZEaHd/ikJ3ER cA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v3vc4kcsw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 20 Sep 2019 17:00:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F1584B;
 Fri, 20 Sep 2019 15:00:49 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B850A2D3798;
 Fri, 20 Sep 2019 17:00:48 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 20 Sep
 2019 17:00:48 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 20 Sep 2019 17:00:48
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <marc.zyngier@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 20 Sep 2019 17:00:43 +0200
Message-ID: <1568991643-7549-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-20_05:2019-09-20,2019-09-20 signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH] irqchip/stm32-exti: Use the
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

Now that the hwspin_lock_timeout_in_atomic() API is available use it.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/irqchip/irq-stm32-exti.c | 65 +++++++++++++---------------------------
 1 file changed, 20 insertions(+), 45 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index e00f2fa..7fc0d1f 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -25,7 +25,6 @@
 #define IRQS_PER_BANK 32
 
 #define HWSPNLCK_TIMEOUT	1000 /* usec */
-#define HWSPNLCK_RETRY_DELAY	100  /* usec */
 
 struct stm32_exti_bank {
 	u32 imr_ofst;
@@ -277,55 +276,24 @@ static int stm32_exti_set_type(struct irq_data *d,
 	return 0;
 }
 
-static int stm32_exti_hwspin_lock(struct stm32_exti_chip_data *chip_data)
-{
-	int ret, timeout = 0;
-
-	if (!chip_data->host_data->hwlock)
-		return 0;
-
-	/*
-	 * Use the x_raw API since we are under spin_lock protection.
-	 * Do not use the x_timeout API because we are under irq_disable
-	 * mode (see __setup_irq())
-	 */
-	do {
-		ret = hwspin_trylock_raw(chip_data->host_data->hwlock);
-		if (!ret)
-			return 0;
-
-		udelay(HWSPNLCK_RETRY_DELAY);
-		timeout += HWSPNLCK_RETRY_DELAY;
-	} while (timeout < HWSPNLCK_TIMEOUT);
-
-	if (ret == -EBUSY)
-		ret = -ETIMEDOUT;
-
-	if (ret)
-		pr_err("%s can't get hwspinlock (%d)\n", __func__, ret);
-
-	return ret;
-}
-
-static void stm32_exti_hwspin_unlock(struct stm32_exti_chip_data *chip_data)
-{
-	if (chip_data->host_data->hwlock)
-		hwspin_unlock_raw(chip_data->host_data->hwlock);
-}
-
 static int stm32_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct stm32_exti_chip_data *chip_data = gc->private;
 	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct hwspinlock *hwlock = chip_data->host_data->hwlock;
 	u32 rtsr, ftsr;
 	int err;
 
 	irq_gc_lock(gc);
 
-	err = stm32_exti_hwspin_lock(chip_data);
-	if (err)
-		goto unlock;
+	if (hwlock) {
+		err = hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			pr_err("%s can't get hwspinlock (%d)\n", __func__, err);
+			goto unlock;
+		}
+	}
 
 	rtsr = irq_reg_readl(gc, stm32_bank->rtsr_ofst);
 	ftsr = irq_reg_readl(gc, stm32_bank->ftsr_ofst);
@@ -338,7 +306,8 @@ static int stm32_irq_set_type(struct irq_data *d, unsigned int type)
 	irq_reg_writel(gc, ftsr, stm32_bank->ftsr_ofst);
 
 unspinlock:
-	stm32_exti_hwspin_unlock(chip_data);
+	if (hwlock)
+		hwspin_unlock_in_atomic(hwlock);
 unlock:
 	irq_gc_unlock(gc);
 
@@ -504,15 +473,20 @@ static int stm32_exti_h_set_type(struct irq_data *d, unsigned int type)
 {
 	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
 	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct hwspinlock *hwlock = chip_data->host_data->hwlock;
 	void __iomem *base = chip_data->host_data->base;
 	u32 rtsr, ftsr;
 	int err;
 
 	raw_spin_lock(&chip_data->rlock);
 
-	err = stm32_exti_hwspin_lock(chip_data);
-	if (err)
-		goto unlock;
+	if (hwlock) {
+		err = hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			pr_err("%s can't get hwspinlock (%d)\n", __func__, err);
+			goto unlock;
+		}
+	}
 
 	rtsr = readl_relaxed(base + stm32_bank->rtsr_ofst);
 	ftsr = readl_relaxed(base + stm32_bank->ftsr_ofst);
@@ -525,7 +499,8 @@ static int stm32_exti_h_set_type(struct irq_data *d, unsigned int type)
 	writel_relaxed(ftsr, base + stm32_bank->ftsr_ofst);
 
 unspinlock:
-	stm32_exti_hwspin_unlock(chip_data);
+	if (hwlock)
+		hwspin_unlock_in_atomic(hwlock);
 unlock:
 	raw_spin_unlock(&chip_data->rlock);
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
