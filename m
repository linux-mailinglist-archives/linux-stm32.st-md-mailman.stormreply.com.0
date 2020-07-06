Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B42153BB
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jul 2020 10:11:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E7E6C36B2D;
	Mon,  6 Jul 2020 08:11:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6E68C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 08:11:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0667nfax026406; Mon, 6 Jul 2020 10:11:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Pk+cDdJ7oIDzG0JvUk3M7XBbJ5RUhAZpiO1CeKz+Ey0=;
 b=peRvNPTBUcgOernZ3MMRGB+3JONlT0YGEeRGSfzRr520LPxnuCitx4mO7UaCVwh0Z4mQ
 A4F4DoGNx3ymvffOYC4RotB6nqRDpNUqiLK+eUK5wGKMtzNoSAwqnnf/v1eXoEQohkJU
 poNmzfunrkM6cncxO5nyT0fM0wgzcJWzA0errR3aAQSYRMxKrPjrQBeFvKS/a9rYQQ4V
 Wy/7wX8ikUhWXroRAyIaKbbN+scdaXPJr5oQY2C9qmPvZ5TGMhXpYkXHc2yjRA9z+Sng
 VBT8EryByMS6BqMKGOefQzCbEeBL4RfkN48bogMyH1sHytlGv7qMXAc9FdUUNjdZ6wjt zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnf9rvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 10:11:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1254910002A;
 Mon,  6 Jul 2020 10:11:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAE692ADA0B;
 Mon,  6 Jul 2020 10:11:06 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jul 2020 10:11:06
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>
Date: Mon, 6 Jul 2020 10:11:06 +0200
Message-ID: <20200706081106.25125-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_04:2020-07-06,
 2020-07-06 signatures=0
Cc: marex@denx.de, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] irqchip/stm32-exti: map direct event to irq
	parent
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

EXTI lines are mainly used to wake-up system from CStop low power mode.
Currently, if a device wants to use a EXTI (direct) line as wakeup line,
it has to declare 2 interrupts:
 - one for EXTI used to wake-up system (with dedicated_wake_irq api).
 - one for GIC used to get the wake up reason inside the concerned IP.

This split is not really needed as each EXTI line is actually "linked " to
a GIC. So to avoid this useless double interrupt management in each
wake-up driver, this patch lets the STM32 EXTI driver abstract it by
mapping each EXTI line to his corresponding GIC.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index faa8482c8246..26aaaae812aa 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -42,6 +42,7 @@ struct stm32_exti_bank {
 struct stm32_desc_irq {
 	u32 exti;
 	u32 irq_parent;
+	struct irq_chip *chip;
 };
 
 struct stm32_exti_drv_data {
@@ -166,27 +167,41 @@ static const struct stm32_exti_bank *stm32mp1_exti_banks[] = {
 	&stm32mp1_exti_b3,
 };
 
+static struct irq_chip stm32_exti_h_chip;
+static struct irq_chip stm32_exti_h_chip_direct;
+
 static const struct stm32_desc_irq stm32mp1_desc_irq[] = {
-	{ .exti = 0, .irq_parent = 6 },
-	{ .exti = 1, .irq_parent = 7 },
-	{ .exti = 2, .irq_parent = 8 },
-	{ .exti = 3, .irq_parent = 9 },
-	{ .exti = 4, .irq_parent = 10 },
-	{ .exti = 5, .irq_parent = 23 },
-	{ .exti = 6, .irq_parent = 64 },
-	{ .exti = 7, .irq_parent = 65 },
-	{ .exti = 8, .irq_parent = 66 },
-	{ .exti = 9, .irq_parent = 67 },
-	{ .exti = 10, .irq_parent = 40 },
-	{ .exti = 11, .irq_parent = 42 },
-	{ .exti = 12, .irq_parent = 76 },
-	{ .exti = 13, .irq_parent = 77 },
-	{ .exti = 14, .irq_parent = 121 },
-	{ .exti = 15, .irq_parent = 127 },
-	{ .exti = 16, .irq_parent = 1 },
-	{ .exti = 65, .irq_parent = 144 },
-	{ .exti = 68, .irq_parent = 143 },
-	{ .exti = 73, .irq_parent = 129 },
+	{ .exti = 0, .irq_parent = 6, .chip = &stm32_exti_h_chip },
+	{ .exti = 1, .irq_parent = 7, .chip = &stm32_exti_h_chip },
+	{ .exti = 2, .irq_parent = 8, .chip = &stm32_exti_h_chip },
+	{ .exti = 3, .irq_parent = 9, .chip = &stm32_exti_h_chip },
+	{ .exti = 4, .irq_parent = 10, .chip = &stm32_exti_h_chip },
+	{ .exti = 5, .irq_parent = 23, .chip = &stm32_exti_h_chip },
+	{ .exti = 6, .irq_parent = 64, .chip = &stm32_exti_h_chip },
+	{ .exti = 7, .irq_parent = 65, .chip = &stm32_exti_h_chip },
+	{ .exti = 8, .irq_parent = 66, .chip = &stm32_exti_h_chip },
+	{ .exti = 9, .irq_parent = 67, .chip = &stm32_exti_h_chip },
+	{ .exti = 10, .irq_parent = 40, .chip = &stm32_exti_h_chip },
+	{ .exti = 11, .irq_parent = 42, .chip = &stm32_exti_h_chip },
+	{ .exti = 12, .irq_parent = 76, .chip = &stm32_exti_h_chip },
+	{ .exti = 13, .irq_parent = 77, .chip = &stm32_exti_h_chip },
+	{ .exti = 14, .irq_parent = 121, .chip = &stm32_exti_h_chip },
+	{ .exti = 15, .irq_parent = 127, .chip = &stm32_exti_h_chip },
+	{ .exti = 16, .irq_parent = 1, .chip = &stm32_exti_h_chip },
+	{ .exti = 19, .irq_parent = 3, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 21, .irq_parent = 31, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 22, .irq_parent = 33, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 23, .irq_parent = 72, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 24, .irq_parent = 95, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 25, .irq_parent = 107, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 30, .irq_parent = 52, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 47, .irq_parent = 93, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 54, .irq_parent = 135, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 61, .irq_parent = 100, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 65, .irq_parent = 144, .chip = &stm32_exti_h_chip },
+	{ .exti = 68, .irq_parent = 143, .chip = &stm32_exti_h_chip },
+	{ .exti = 70, .irq_parent = 62, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 73, .irq_parent = 129, .chip = &stm32_exti_h_chip },
 };
 
 static const struct stm32_exti_drv_data stm32mp1_drv_data = {
@@ -196,22 +211,23 @@ static const struct stm32_exti_drv_data stm32mp1_drv_data = {
 	.irq_nr = ARRAY_SIZE(stm32mp1_desc_irq),
 };
 
-static int stm32_exti_to_irq(const struct stm32_exti_drv_data *drv_data,
-			     irq_hw_number_t hwirq)
+static const struct
+stm32_desc_irq *stm32_exti_get_desc(const struct stm32_exti_drv_data *drv_data,
+				    irq_hw_number_t hwirq)
 {
-	const struct stm32_desc_irq *desc_irq;
+	const struct stm32_desc_irq *desc = NULL;
 	int i;
 
 	if (!drv_data->desc_irqs)
-		return -EINVAL;
+		return NULL;
 
 	for (i = 0; i < drv_data->irq_nr; i++) {
-		desc_irq = &drv_data->desc_irqs[i];
-		if (desc_irq->exti == hwirq)
-			return desc_irq->irq_parent;
+		desc = &drv_data->desc_irqs[i];
+		if (desc->exti == hwirq)
+			break;
 	}
 
-	return -EINVAL;
+	return desc;
 }
 
 static unsigned long stm32_exti_pending(struct irq_chip_generic *gc)
@@ -628,30 +644,47 @@ static struct irq_chip stm32_exti_h_chip = {
 	.irq_set_affinity	= IS_ENABLED(CONFIG_SMP) ? stm32_exti_h_set_affinity : NULL,
 };
 
+static struct irq_chip stm32_exti_h_chip_direct = {
+	.name			= "stm32-exti-h-direct",
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_ack		= irq_chip_ack_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= irq_chip_set_type_parent,
+	.irq_set_wake		= stm32_exti_h_set_wake,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND,
+	.irq_set_affinity	= IS_ENABLED(CONFIG_SMP) ? irq_chip_set_affinity_parent : NULL,
+};
+
 static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
 				     unsigned int virq,
 				     unsigned int nr_irqs, void *data)
 {
 	struct stm32_exti_host_data *host_data = dm->host_data;
 	struct stm32_exti_chip_data *chip_data;
+	const struct stm32_desc_irq *desc;
 	struct irq_fwspec *fwspec = data;
 	struct irq_fwspec p_fwspec;
 	irq_hw_number_t hwirq;
-	int p_irq, bank;
+	int bank;
 
 	hwirq = fwspec->param[0];
 	bank  = hwirq / IRQS_PER_BANK;
 	chip_data = &host_data->chips_data[bank];
 
-	irq_domain_set_hwirq_and_chip(dm, virq, hwirq,
-				      &stm32_exti_h_chip, chip_data);
 
-	p_irq = stm32_exti_to_irq(host_data->drv_data, hwirq);
-	if (p_irq >= 0) {
+	desc = stm32_exti_get_desc(host_data->drv_data, hwirq);
+	if (!desc)
+		return -EINVAL;
+
+	irq_domain_set_hwirq_and_chip(dm, virq, hwirq, desc->chip,
+				      chip_data);
+	if (desc->irq_parent >= 0) {
 		p_fwspec.fwnode = dm->parent->fwnode;
 		p_fwspec.param_count = 3;
 		p_fwspec.param[0] = GIC_SPI;
-		p_fwspec.param[1] = p_irq;
+		p_fwspec.param[1] = desc->irq_parent;
 		p_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
 
 		return irq_domain_alloc_irqs_parent(dm, virq, 1, &p_fwspec);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
