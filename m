Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07B8BCF06
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 15:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46FE6C78002;
	Mon,  6 May 2024 13:35:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 952ADC78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2024 13:35:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446COdj4013556;
 Mon, 6 May 2024 15:34:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=ENp31Aoj+1iAyPGLI1TozsgW72FhLbR+BTuc22gWLE8=; b=fP
 Czj99gs0DhCkIYVTQDOGqAy0lLXad+ePFc96shy3fZfY05itjGfNFNrEY6Kn8nzD
 2deenqhjjhchM5tpIiTpfJNnjjgfK1YcSf8kRPsUkyTPO4gPX12ZwL8wUCKBf6JK
 DHBhMvzgA5siQDt5zgp278eaedvOviY7EIDMatvqZkeoqfkPDqwctAlg/klg3a3F
 sYsYrx0HW8E8VjMr2qSCIWVRKCQ9QXXVNZw2Y9fmlmHJg3FksC5eGUVNCF6lc/9o
 0AWtbfR0mEEIyelU+ZblnIZoKmVjILO7WiN6xXAolZOMUsXZmt/xGdXIE/kDlDvf
 vTAnjHZ7V2cBpkJRjDrw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xwbwcf763-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 May 2024 15:34:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1FF2740045;
 Mon,  6 May 2024 15:34:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4661421A8F7;
 Mon,  6 May 2024 15:34:12 +0200 (CEST)
Received: from localhost (10.48.87.171) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 15:34:11 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 6 May 2024 15:32:53 +0200
Message-ID: <20240506133256.948712-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506133256.948712-1-antonio.borneo@foss.st.com>
References: <20240506133256.948712-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.171]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_08,2024-05-06_02,2023-05-22_02
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/8] irqchip/stm32mp-exti: rename internal
	symbols
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

Rename all the internal symbols accordingly to the new name of the
driver.
Renaming done automatically through sed rules:
	s/stm32_exti_set_type/stm32mp_exti_convert_type/g
	s/stm32_exti_h_/stm32mp_exti_/g
	s/stm32_exti/stm32mp_exti/g
	s/stm32_bank/bank/g
	s/stm32_/stm32mp_/g
	s/STM32_/STM32MP_/g
	s/STM32MP1_/STM32MP_/g
	s/stm32mp1_exti_/stm32mp_exti_/g
	s/stm32-exti-h/stm32mp-exti/g

Manually fix some indentation after the rename.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/irqchip/irq-stm32mp-exti.c | 272 ++++++++++++++---------------
 1 file changed, 136 insertions(+), 136 deletions(-)

diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index 8a45ece2e198f..3ceff6d25b702 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -38,7 +38,7 @@
 
 #define EXTI_CID1			1
 
-struct stm32_exti_bank {
+struct stm32mp_exti_bank {
 	u32 imr_ofst;
 	u32 rtsr_ofst;
 	u32 ftsr_ofst;
@@ -49,15 +49,15 @@ struct stm32_exti_bank {
 	u32 seccfgr_ofst;
 };
 
-struct stm32_exti_drv_data {
-	const struct stm32_exti_bank **exti_banks;
+struct stm32mp_exti_drv_data {
+	const struct stm32mp_exti_bank **exti_banks;
 	const u8 *desc_irqs;
 	u32 bank_nr;
 };
 
-struct stm32_exti_chip_data {
-	struct stm32_exti_host_data *host_data;
-	const struct stm32_exti_bank *reg_bank;
+struct stm32mp_exti_chip_data {
+	struct stm32mp_exti_host_data *host_data;
+	const struct stm32mp_exti_bank *reg_bank;
 	struct raw_spinlock rlock;
 	u32 wake_active;
 	u32 mask_cache;
@@ -66,16 +66,16 @@ struct stm32_exti_chip_data {
 	u32 event_reserved;
 };
 
-struct stm32_exti_host_data {
+struct stm32mp_exti_host_data {
 	void __iomem *base;
 	struct device *dev;
-	struct stm32_exti_chip_data *chips_data;
-	const struct stm32_exti_drv_data *drv_data;
+	struct stm32mp_exti_chip_data *chips_data;
+	const struct stm32mp_exti_drv_data *drv_data;
 	struct hwspinlock *hwlock;
 	bool dt_has_irqs_desc; /* skip internal desc_irqs array and get it from DT */
 };
 
-static const struct stm32_exti_bank stm32mp1_exti_b1 = {
+static const struct stm32mp_exti_bank stm32mp_exti_b1 = {
 	.imr_ofst	= 0x80,
 	.rtsr_ofst	= 0x00,
 	.ftsr_ofst	= 0x04,
@@ -86,7 +86,7 @@ static const struct stm32_exti_bank stm32mp1_exti_b1 = {
 	.seccfgr_ofst	= 0x14,
 };
 
-static const struct stm32_exti_bank stm32mp1_exti_b2 = {
+static const struct stm32mp_exti_bank stm32mp_exti_b2 = {
 	.imr_ofst	= 0x90,
 	.rtsr_ofst	= 0x20,
 	.ftsr_ofst	= 0x24,
@@ -97,7 +97,7 @@ static const struct stm32_exti_bank stm32mp1_exti_b2 = {
 	.seccfgr_ofst	= 0x34,
 };
 
-static const struct stm32_exti_bank stm32mp1_exti_b3 = {
+static const struct stm32mp_exti_bank stm32mp_exti_b3 = {
 	.imr_ofst	= 0xA0,
 	.rtsr_ofst	= 0x40,
 	.ftsr_ofst	= 0x44,
@@ -108,17 +108,17 @@ static const struct stm32_exti_bank stm32mp1_exti_b3 = {
 	.seccfgr_ofst	= 0x54,
 };
 
-static const struct stm32_exti_bank *stm32mp1_exti_banks[] = {
-	&stm32mp1_exti_b1,
-	&stm32mp1_exti_b2,
-	&stm32mp1_exti_b3,
+static const struct stm32mp_exti_bank *stm32mp_exti_banks[] = {
+	&stm32mp_exti_b1,
+	&stm32mp_exti_b2,
+	&stm32mp_exti_b3,
 };
 
-static struct irq_chip stm32_exti_h_chip;
-static struct irq_chip stm32_exti_h_chip_direct;
+static struct irq_chip stm32mp_exti_chip;
+static struct irq_chip stm32mp_exti_chip_direct;
 
 #define EXTI_INVALID_IRQ       U8_MAX
-#define STM32MP1_DESC_IRQ_SIZE (ARRAY_SIZE(stm32mp1_exti_banks) * IRQS_PER_BANK)
+#define STM32MP_DESC_IRQ_SIZE  (ARRAY_SIZE(stm32mp_exti_banks) * IRQS_PER_BANK)
 
 /*
  * Use some intentionally tricky logic here to initialize the whole array to
@@ -132,7 +132,7 @@ __diag_ignore_all("-Woverride-init",
 
 static const u8 stm32mp1_desc_irq[] = {
 	/* default value */
-	[0 ... (STM32MP1_DESC_IRQ_SIZE - 1)] = EXTI_INVALID_IRQ,
+	[0 ... (STM32MP_DESC_IRQ_SIZE - 1)] = EXTI_INVALID_IRQ,
 
 	[0] = 6,
 	[1] = 7,
@@ -181,7 +181,7 @@ static const u8 stm32mp1_desc_irq[] = {
 
 static const u8 stm32mp13_desc_irq[] = {
 	/* default value */
-	[0 ... (STM32MP1_DESC_IRQ_SIZE - 1)] = EXTI_INVALID_IRQ,
+	[0 ... (STM32MP_DESC_IRQ_SIZE - 1)] = EXTI_INVALID_IRQ,
 
 	[0] = 6,
 	[1] = 7,
@@ -226,20 +226,20 @@ static const u8 stm32mp13_desc_irq[] = {
 
 __diag_pop();
 
-static const struct stm32_exti_drv_data stm32mp1_drv_data = {
-	.exti_banks = stm32mp1_exti_banks,
-	.bank_nr = ARRAY_SIZE(stm32mp1_exti_banks),
+static const struct stm32mp_exti_drv_data stm32mp1_drv_data = {
+	.exti_banks = stm32mp_exti_banks,
+	.bank_nr = ARRAY_SIZE(stm32mp_exti_banks),
 	.desc_irqs = stm32mp1_desc_irq,
 };
 
-static const struct stm32_exti_drv_data stm32mp13_drv_data = {
-	.exti_banks = stm32mp1_exti_banks,
-	.bank_nr = ARRAY_SIZE(stm32mp1_exti_banks),
+static const struct stm32mp_exti_drv_data stm32mp13_drv_data = {
+	.exti_banks = stm32mp_exti_banks,
+	.bank_nr = ARRAY_SIZE(stm32mp_exti_banks),
 	.desc_irqs = stm32mp13_desc_irq,
 };
 
-static int stm32_exti_set_type(struct irq_data *d,
-			       unsigned int type, u32 *rtsr, u32 *ftsr)
+static int stm32mp_exti_convert_type(struct irq_data *d,
+				     unsigned int type, u32 *rtsr, u32 *ftsr)
 {
 	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
 
@@ -263,45 +263,45 @@ static int stm32_exti_set_type(struct irq_data *d,
 	return 0;
 }
 
-static void stm32_chip_suspend(struct stm32_exti_chip_data *chip_data,
-			       u32 wake_active)
+static void stm32mp_chip_suspend(struct stm32mp_exti_chip_data *chip_data,
+				 u32 wake_active)
 {
-	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	const struct stm32mp_exti_bank *bank = chip_data->reg_bank;
 	void __iomem *base = chip_data->host_data->base;
 
 	/* save rtsr, ftsr registers */
-	chip_data->rtsr_cache = readl_relaxed(base + stm32_bank->rtsr_ofst);
-	chip_data->ftsr_cache = readl_relaxed(base + stm32_bank->ftsr_ofst);
+	chip_data->rtsr_cache = readl_relaxed(base + bank->rtsr_ofst);
+	chip_data->ftsr_cache = readl_relaxed(base + bank->ftsr_ofst);
 
-	writel_relaxed(wake_active, base + stm32_bank->imr_ofst);
+	writel_relaxed(wake_active, base + bank->imr_ofst);
 }
 
-static void stm32_chip_resume(struct stm32_exti_chip_data *chip_data,
-			      u32 mask_cache)
+static void stm32mp_chip_resume(struct stm32mp_exti_chip_data *chip_data,
+				u32 mask_cache)
 {
-	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	const struct stm32mp_exti_bank *bank = chip_data->reg_bank;
 	void __iomem *base = chip_data->host_data->base;
 
 	/* restore rtsr, ftsr, registers */
-	writel_relaxed(chip_data->rtsr_cache, base + stm32_bank->rtsr_ofst);
-	writel_relaxed(chip_data->ftsr_cache, base + stm32_bank->ftsr_ofst);
+	writel_relaxed(chip_data->rtsr_cache, base + bank->rtsr_ofst);
+	writel_relaxed(chip_data->ftsr_cache, base + bank->ftsr_ofst);
 
-	writel_relaxed(mask_cache, base + stm32_bank->imr_ofst);
+	writel_relaxed(mask_cache, base + bank->imr_ofst);
 }
 
 /* directly set the target bit without reading first. */
-static inline void stm32_exti_write_bit(struct irq_data *d, u32 reg)
+static inline void stm32mp_exti_write_bit(struct irq_data *d, u32 reg)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
 	void __iomem *base = chip_data->host_data->base;
 	u32 val = BIT(d->hwirq % IRQS_PER_BANK);
 
 	writel_relaxed(val, base + reg);
 }
 
-static inline u32 stm32_exti_set_bit(struct irq_data *d, u32 reg)
+static inline u32 stm32mp_exti_set_bit(struct irq_data *d, u32 reg)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
 	void __iomem *base = chip_data->host_data->base;
 	u32 val;
 
@@ -312,9 +312,9 @@ static inline u32 stm32_exti_set_bit(struct irq_data *d, u32 reg)
 	return val;
 }
 
-static inline u32 stm32_exti_clr_bit(struct irq_data *d, u32 reg)
+static inline u32 stm32mp_exti_clr_bit(struct irq_data *d, u32 reg)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
 	void __iomem *base = chip_data->host_data->base;
 	u32 val;
 
@@ -325,15 +325,15 @@ static inline u32 stm32_exti_clr_bit(struct irq_data *d, u32 reg)
 	return val;
 }
 
-static void stm32_exti_h_eoi(struct irq_data *d)
+static void stm32mp_exti_eoi(struct irq_data *d)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
-	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	const struct stm32mp_exti_bank *bank = chip_data->reg_bank;
 
 	raw_spin_lock(&chip_data->rlock);
 
-	stm32_exti_write_bit(d, stm32_bank->rpr_ofst);
-	stm32_exti_write_bit(d, stm32_bank->fpr_ofst);
+	stm32mp_exti_write_bit(d, bank->rpr_ofst);
+	stm32mp_exti_write_bit(d, bank->fpr_ofst);
 
 	raw_spin_unlock(&chip_data->rlock);
 
@@ -341,36 +341,36 @@ static void stm32_exti_h_eoi(struct irq_data *d)
 		irq_chip_eoi_parent(d);
 }
 
-static void stm32_exti_h_mask(struct irq_data *d)
+static void stm32mp_exti_mask(struct irq_data *d)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
-	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	const struct stm32mp_exti_bank *bank = chip_data->reg_bank;
 
 	raw_spin_lock(&chip_data->rlock);
-	chip_data->mask_cache = stm32_exti_clr_bit(d, stm32_bank->imr_ofst);
+	chip_data->mask_cache = stm32mp_exti_clr_bit(d, bank->imr_ofst);
 	raw_spin_unlock(&chip_data->rlock);
 
 	if (d->parent_data->chip)
 		irq_chip_mask_parent(d);
 }
 
-static void stm32_exti_h_unmask(struct irq_data *d)
+static void stm32mp_exti_unmask(struct irq_data *d)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
-	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	const struct stm32mp_exti_bank *bank = chip_data->reg_bank;
 
 	raw_spin_lock(&chip_data->rlock);
-	chip_data->mask_cache = stm32_exti_set_bit(d, stm32_bank->imr_ofst);
+	chip_data->mask_cache = stm32mp_exti_set_bit(d, bank->imr_ofst);
 	raw_spin_unlock(&chip_data->rlock);
 
 	if (d->parent_data->chip)
 		irq_chip_unmask_parent(d);
 }
 
-static int stm32_exti_h_set_type(struct irq_data *d, unsigned int type)
+static int stm32mp_exti_set_type(struct irq_data *d, unsigned int type)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
-	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	const struct stm32mp_exti_bank *bank = chip_data->reg_bank;
 	struct hwspinlock *hwlock = chip_data->host_data->hwlock;
 	void __iomem *base = chip_data->host_data->base;
 	u32 rtsr, ftsr;
@@ -386,15 +386,15 @@ static int stm32_exti_h_set_type(struct irq_data *d, unsigned int type)
 		}
 	}
 
-	rtsr = readl_relaxed(base + stm32_bank->rtsr_ofst);
-	ftsr = readl_relaxed(base + stm32_bank->ftsr_ofst);
+	rtsr = readl_relaxed(base + bank->rtsr_ofst);
+	ftsr = readl_relaxed(base + bank->ftsr_ofst);
 
-	err = stm32_exti_set_type(d, type, &rtsr, &ftsr);
+	err = stm32mp_exti_convert_type(d, type, &rtsr, &ftsr);
 	if (err)
 		goto unspinlock;
 
-	writel_relaxed(rtsr, base + stm32_bank->rtsr_ofst);
-	writel_relaxed(ftsr, base + stm32_bank->ftsr_ofst);
+	writel_relaxed(rtsr, base + bank->rtsr_ofst);
+	writel_relaxed(ftsr, base + bank->ftsr_ofst);
 
 unspinlock:
 	if (hwlock)
@@ -405,9 +405,9 @@ static int stm32_exti_h_set_type(struct irq_data *d, unsigned int type)
 	return err;
 }
 
-static int stm32_exti_h_set_wake(struct irq_data *d, unsigned int on)
+static int stm32mp_exti_set_wake(struct irq_data *d, unsigned int on)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
 	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
 
 	raw_spin_lock(&chip_data->rlock);
@@ -422,7 +422,7 @@ static int stm32_exti_h_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
-static int stm32_exti_h_set_affinity(struct irq_data *d,
+static int stm32mp_exti_set_affinity(struct irq_data *d,
 				     const struct cpumask *dest, bool force)
 {
 	if (d->parent_data->chip)
@@ -431,77 +431,77 @@ static int stm32_exti_h_set_affinity(struct irq_data *d,
 	return IRQ_SET_MASK_OK_DONE;
 }
 
-static int stm32_exti_h_suspend(struct device *dev)
+static int stm32mp_exti_suspend(struct device *dev)
 {
-	struct stm32_exti_host_data *host_data = dev_get_drvdata(dev);
-	struct stm32_exti_chip_data *chip_data;
+	struct stm32mp_exti_host_data *host_data = dev_get_drvdata(dev);
+	struct stm32mp_exti_chip_data *chip_data;
 	int i;
 
 	for (i = 0; i < host_data->drv_data->bank_nr; i++) {
 		chip_data = &host_data->chips_data[i];
-		stm32_chip_suspend(chip_data, chip_data->wake_active);
+		stm32mp_chip_suspend(chip_data, chip_data->wake_active);
 	}
 
 	return 0;
 }
 
-static int stm32_exti_h_resume(struct device *dev)
+static int stm32mp_exti_resume(struct device *dev)
 {
-	struct stm32_exti_host_data *host_data = dev_get_drvdata(dev);
-	struct stm32_exti_chip_data *chip_data;
+	struct stm32mp_exti_host_data *host_data = dev_get_drvdata(dev);
+	struct stm32mp_exti_chip_data *chip_data;
 	int i;
 
 	for (i = 0; i < host_data->drv_data->bank_nr; i++) {
 		chip_data = &host_data->chips_data[i];
-		stm32_chip_resume(chip_data, chip_data->mask_cache);
+		stm32mp_chip_resume(chip_data, chip_data->mask_cache);
 	}
 
 	return 0;
 }
 
-static int stm32_exti_h_retrigger(struct irq_data *d)
+static int stm32mp_exti_retrigger(struct irq_data *d)
 {
-	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
-	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct stm32mp_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	const struct stm32mp_exti_bank *bank = chip_data->reg_bank;
 	void __iomem *base = chip_data->host_data->base;
 	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
 
-	writel_relaxed(mask, base + stm32_bank->swier_ofst);
+	writel_relaxed(mask, base + bank->swier_ofst);
 
 	return 0;
 }
 
-static struct irq_chip stm32_exti_h_chip = {
-	.name			= "stm32-exti-h",
-	.irq_eoi		= stm32_exti_h_eoi,
-	.irq_mask		= stm32_exti_h_mask,
-	.irq_unmask		= stm32_exti_h_unmask,
-	.irq_retrigger		= stm32_exti_h_retrigger,
-	.irq_set_type		= stm32_exti_h_set_type,
-	.irq_set_wake		= stm32_exti_h_set_wake,
+static struct irq_chip stm32mp_exti_chip = {
+	.name			= "stm32mp-exti",
+	.irq_eoi		= stm32mp_exti_eoi,
+	.irq_mask		= stm32mp_exti_mask,
+	.irq_unmask		= stm32mp_exti_unmask,
+	.irq_retrigger		= stm32mp_exti_retrigger,
+	.irq_set_type		= stm32mp_exti_set_type,
+	.irq_set_wake		= stm32mp_exti_set_wake,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND,
-	.irq_set_affinity	= IS_ENABLED(CONFIG_SMP) ? stm32_exti_h_set_affinity : NULL,
+	.irq_set_affinity	= IS_ENABLED(CONFIG_SMP) ? stm32mp_exti_set_affinity : NULL,
 };
 
-static struct irq_chip stm32_exti_h_chip_direct = {
-	.name			= "stm32-exti-h-direct",
+static struct irq_chip stm32mp_exti_chip_direct = {
+	.name			= "stm32mp-exti-direct",
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_ack		= irq_chip_ack_parent,
-	.irq_mask		= stm32_exti_h_mask,
-	.irq_unmask		= stm32_exti_h_unmask,
+	.irq_mask		= stm32mp_exti_mask,
+	.irq_unmask		= stm32mp_exti_unmask,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= irq_chip_set_type_parent,
-	.irq_set_wake		= stm32_exti_h_set_wake,
+	.irq_set_wake		= stm32mp_exti_set_wake,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND,
 	.irq_set_affinity	= IS_ENABLED(CONFIG_SMP) ? irq_chip_set_affinity_parent : NULL,
 };
 
-static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
+static int stm32mp_exti_domain_alloc(struct irq_domain *dm,
 				     unsigned int virq,
 				     unsigned int nr_irqs, void *data)
 {
-	struct stm32_exti_host_data *host_data = dm->host_data;
-	struct stm32_exti_chip_data *chip_data;
+	struct stm32mp_exti_host_data *host_data = dm->host_data;
+	struct stm32mp_exti_chip_data *chip_data;
 	u8 desc_irq;
 	struct irq_fwspec *fwspec = data;
 	struct irq_fwspec p_fwspec;
@@ -525,7 +525,7 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
 
 	event_trg = readl_relaxed(host_data->base + chip_data->reg_bank->trg_ofst);
 	chip = (event_trg & BIT(hwirq % IRQS_PER_BANK)) ?
-	       &stm32_exti_h_chip : &stm32_exti_h_chip_direct;
+	       &stm32mp_exti_chip : &stm32mp_exti_chip_direct;
 
 	irq_domain_set_hwirq_and_chip(dm, virq, hwirq, chip, chip_data);
 
@@ -564,18 +564,18 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
 }
 
 static struct
-stm32_exti_chip_data *stm32_exti_chip_init(struct stm32_exti_host_data *h_data,
-					   u32 bank_idx,
-					   struct device_node *node)
+stm32mp_exti_chip_data *stm32mp_exti_chip_init(struct stm32mp_exti_host_data *h_data,
+					       u32 bank_idx,
+					       struct device_node *node)
 {
-	const struct stm32_exti_bank *stm32_bank;
-	struct stm32_exti_chip_data *chip_data;
+	const struct stm32mp_exti_bank *bank;
+	struct stm32mp_exti_chip_data *chip_data;
 	void __iomem *base = h_data->base;
 
-	stm32_bank = h_data->drv_data->exti_banks[bank_idx];
+	bank = h_data->drv_data->exti_banks[bank_idx];
 	chip_data = &h_data->chips_data[bank_idx];
 	chip_data->host_data = h_data;
-	chip_data->reg_bank = stm32_bank;
+	chip_data->reg_bank = bank;
 
 	raw_spin_lock_init(&chip_data->rlock);
 
@@ -583,23 +583,23 @@ stm32_exti_chip_data *stm32_exti_chip_init(struct stm32_exti_host_data *h_data,
 	 * This IP has no reset, so after hot reboot we should
 	 * clear registers to avoid residue
 	 */
-	writel_relaxed(0, base + stm32_bank->imr_ofst);
+	writel_relaxed(0, base + bank->imr_ofst);
 
 	/* reserve Secure events */
-	chip_data->event_reserved = readl_relaxed(base + stm32_bank->seccfgr_ofst);
+	chip_data->event_reserved = readl_relaxed(base + bank->seccfgr_ofst);
 
 	pr_info("%pOF: bank%d\n", node, bank_idx);
 
 	return chip_data;
 }
 
-static const struct irq_domain_ops stm32_exti_h_domain_ops = {
-	.alloc	= stm32_exti_h_domain_alloc,
+static const struct irq_domain_ops stm32mp_exti_domain_ops = {
+	.alloc	= stm32mp_exti_domain_alloc,
 	.free	= irq_domain_free_irqs_common,
 	.xlate = irq_domain_xlate_twocell,
 };
 
-static void stm32_exti_check_rif(struct stm32_exti_host_data *host_data)
+static void stm32mp_exti_check_rif(struct stm32mp_exti_host_data *host_data)
 {
 	unsigned int bank, i, event;
 	u32 cid, cidcfgr, hwcfgr1;
@@ -620,21 +620,21 @@ static void stm32_exti_check_rif(struct stm32_exti_host_data *host_data)
 	}
 }
 
-static void stm32_exti_remove_irq(void *data)
+static void stm32mp_exti_remove_irq(void *data)
 {
 	struct irq_domain *domain = data;
 
 	irq_domain_remove(domain);
 }
 
-static int stm32_exti_probe(struct platform_device *pdev)
+static int stm32mp_exti_probe(struct platform_device *pdev)
 {
 	int ret, i;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct irq_domain *parent_domain, *domain;
-	struct stm32_exti_host_data *host_data;
-	const struct stm32_exti_drv_data *drv_data;
+	struct stm32mp_exti_host_data *host_data;
+	const struct stm32mp_exti_drv_data *drv_data;
 
 	host_data = devm_kzalloc(dev, sizeof(*host_data), GFP_KERNEL);
 	if (!host_data)
@@ -680,9 +680,9 @@ static int stm32_exti_probe(struct platform_device *pdev)
 		return PTR_ERR(host_data->base);
 
 	for (i = 0; i < drv_data->bank_nr; i++)
-		stm32_exti_chip_init(host_data, i, np);
+		stm32mp_exti_chip_init(host_data, i, np);
 
-	stm32_exti_check_rif(host_data);
+	stm32mp_exti_check_rif(host_data);
 
 	parent_domain = irq_find_host(of_irq_find_parent(np));
 	if (!parent_domain) {
@@ -692,7 +692,7 @@ static int stm32_exti_probe(struct platform_device *pdev)
 
 	domain = irq_domain_add_hierarchy(parent_domain, 0,
 					  drv_data->bank_nr * IRQS_PER_BANK,
-					  np, &stm32_exti_h_domain_ops,
+					  np, &stm32mp_exti_domain_ops,
 					  host_data);
 
 	if (!domain) {
@@ -700,7 +700,7 @@ static int stm32_exti_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	ret = devm_add_action_or_reset(dev, stm32_exti_remove_irq, domain);
+	ret = devm_add_action_or_reset(dev, stm32mp_exti_remove_irq, domain);
 	if (ret)
 		return ret;
 
@@ -710,35 +710,35 @@ static int stm32_exti_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id stm32_exti_ids[] = {
+static const struct of_device_id stm32mp_exti_ids[] = {
 	{ .compatible = "st,stm32mp1-exti", .data = &stm32mp1_drv_data},
 	{ .compatible = "st,stm32mp13-exti", .data = &stm32mp13_drv_data},
 	{},
 };
-MODULE_DEVICE_TABLE(of, stm32_exti_ids);
+MODULE_DEVICE_TABLE(of, stm32mp_exti_ids);
 
-static const struct dev_pm_ops stm32_exti_dev_pm_ops = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_exti_h_suspend, stm32_exti_h_resume)
+static const struct dev_pm_ops stm32mp_exti_dev_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32mp_exti_suspend, stm32mp_exti_resume)
 };
 
-static struct platform_driver stm32_exti_driver = {
-	.probe		= stm32_exti_probe,
+static struct platform_driver stm32mp_exti_driver = {
+	.probe		= stm32mp_exti_probe,
 	.driver		= {
-		.name		= "stm32_exti",
-		.of_match_table	= stm32_exti_ids,
-		.pm		= &stm32_exti_dev_pm_ops,
+		.name		= "stm32mp_exti",
+		.of_match_table	= stm32mp_exti_ids,
+		.pm		= &stm32mp_exti_dev_pm_ops,
 	},
 };
 
-static int __init stm32_exti_arch_init(void)
+static int __init stm32mp_exti_arch_init(void)
 {
-	return platform_driver_register(&stm32_exti_driver);
+	return platform_driver_register(&stm32mp_exti_driver);
 }
 
-static void __exit stm32_exti_arch_exit(void)
+static void __exit stm32mp_exti_arch_exit(void)
 {
-	return platform_driver_unregister(&stm32_exti_driver);
+	return platform_driver_unregister(&stm32mp_exti_driver);
 }
 
-arch_initcall(stm32_exti_arch_init);
-module_exit(stm32_exti_arch_exit);
+arch_initcall(stm32mp_exti_arch_init);
+module_exit(stm32mp_exti_arch_exit);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
