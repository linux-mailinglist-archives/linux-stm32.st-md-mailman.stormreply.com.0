Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 533BA2495CD
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Aug 2020 08:58:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 169AEC32E8F;
	Wed, 19 Aug 2020 06:58:52 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 372F0C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 02:23:22 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F059788C4DA54FD433DF;
 Wed, 19 Aug 2020 10:23:18 +0800 (CST)
Received: from huawei.com (10.90.52.227) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 19 Aug 2020
 10:23:12 +0800
From: qiuguorui1 <qiuguorui1@huawei.com>
To: <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Wed, 19 Aug 2020 10:39:31 +0800
Message-ID: <20200819023931.28997-1-qiuguorui1@huawei.com>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
X-Originating-IP: [10.90.52.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:58:48 +0000
Cc: chenjianguo3@huawei.com, qiuguorui1@huawei.com,
 linux-kernel@vger.kernel.org, zengweilin@huawei.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] irqchip/stm32-exti: avoid interrupts losing
	due to clearing pending bit by mistake
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

In the previous code, when the eoi handle of the exti clears the pending
bit of the current interrupt, it will first read the values of fpr and
rpr, then logically OR the corresponding bit of the interrupt number,
and finally write back to fpr and rpr.

We found through experiments that if two exti interrupts,
we call them int1/int2, arrive almost at the same time. in our scenario,
the time difference is 30 microseconds, assuming int1 is triggered first.

there will be an extreme scenario: both int's pending bit are set to 1,
the irq handle of int1 is executed first, and eoi handle is then executed,
at this moment, all pending bits are cleared, but the int 2 has not
finally been reported to the cpu yet, which eventually lost int2.

According to stm32's TRM description about rpr and fpr: Writing a 1 to this
bit will trigger a rising edge event on event x, Writing 0 has no
effect.

Therefore, when clearing the pending bit, we only need to clear the
pending bit of the irq.

Signed-off-by: qiuguorui1 <qiuguorui1@huawei.com>
---
 drivers/irqchip/irq-stm32-exti.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 03a36be757d8..ee4faf5c90b8 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -26,6 +26,11 @@
 
 #define HWSPNLCK_TIMEOUT	1000 /* usec */
 
+enum reg_ops {
+	REG_WRITE_ONLY,
+	REG_READ_WRITE
+};
+
 struct stm32_exti_bank {
 	u32 imr_ofst;
 	u32 emr_ofst;
@@ -416,13 +421,14 @@ static void stm32_irq_ack(struct irq_data *d)
 	irq_gc_unlock(gc);
 }
 
-static inline u32 stm32_exti_set_bit(struct irq_data *d, u32 reg)
+static inline u32 stm32_exti_set_bit(struct irq_data *d, u32 reg, enum reg_ops op)
 {
 	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
 	void __iomem *base = chip_data->host_data->base;
-	u32 val;
+	u32 val = 0;
 
-	val = readl_relaxed(base + reg);
+	if (op == REG_READ_WRITE)
+		val = readl_relaxed(base + reg);
 	val |= BIT(d->hwirq % IRQS_PER_BANK);
 	writel_relaxed(val, base + reg);
 
@@ -449,9 +455,9 @@ static void stm32_exti_h_eoi(struct irq_data *d)
 
 	raw_spin_lock(&chip_data->rlock);
 
-	stm32_exti_set_bit(d, stm32_bank->rpr_ofst);
+	stm32_exti_set_bit(d, stm32_bank->rpr_ofst, REG_WRITE_ONLY);
 	if (stm32_bank->fpr_ofst != UNDEF_REG)
-		stm32_exti_set_bit(d, stm32_bank->fpr_ofst);
+		stm32_exti_set_bit(d, stm32_bank->fpr_ofst, REG_WRITE_ONLY);
 
 	raw_spin_unlock(&chip_data->rlock);
 
@@ -478,7 +484,7 @@ static void stm32_exti_h_unmask(struct irq_data *d)
 	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
 
 	raw_spin_lock(&chip_data->rlock);
-	chip_data->mask_cache = stm32_exti_set_bit(d, stm32_bank->imr_ofst);
+	chip_data->mask_cache = stm32_exti_set_bit(d, stm32_bank->imr_ofst, REG_READ_WRITE);
 	raw_spin_unlock(&chip_data->rlock);
 
 	if (d->parent_data->chip)
-- 
2.12.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
