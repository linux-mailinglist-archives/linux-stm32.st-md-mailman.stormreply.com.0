Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B485793F
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 10:50:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1122C71285;
	Fri, 16 Feb 2024 09:50:20 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0CD0C6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 09:50:19 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G4qEC7014621; Fri, 16 Feb 2024 10:50:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=wXNfPpiAtMSvOZBWcNaTSHdLVlAlOkosNoeNMWjNKJc=; b=BV
 Ds9+k9U0AGGVvR6N+eYzSsEFAtWb7HbUPITItNZOjlExTLWPfZoSSxjZ5KRjlx4X
 ZsKPJ/JgoJo6p3MxoyxYP/tarCqc9L21ZYsWHdjfMmstvFqPdTlzr6hBm4MxdeaO
 gFuKdr8b7IYBj3tvNAodkFiGCwmvwh+XGYMGeScoi1lh/stwL3SBeKf0eWqMFIVe
 zSW+tb8aI1UrrLAsHP0uBaqHCaVWweS6qrPt/0nlwbQ3vIYhksS8OpzwJCEdDxMb
 H9DqqAYZA3yeIgAQUG3qJBfrTKuac6ONTn71qkSxeOUaPR0FECFFDIqvUk77+nus
 DlRBcS2lz/PhavIpUk/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wa124gy80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 10:50:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D4F8A4002D;
 Fri, 16 Feb 2024 10:50:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38326237D78;
 Fri, 16 Feb 2024 10:49:22 +0100 (CET)
Received: from localhost (10.201.20.114) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 16 Feb
 2024 10:49:21 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Fri, 16 Feb 2024 10:47:50 +0100
Message-ID: <20240216094758.916722-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216094758.916722-1-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_08,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 05/12] irqchip/stm32-exti: Skip secure events
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

Secure OS can reserve some EXTI event, marking them as "secure" by
setting the corresponding bit in register SECCFGR (aka TZENR).
These events cannot be used by Linux.

Read the list of reserved events and check it during irq domain
allocation.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/irqchip/irq-stm32-exti.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index de18cddf6b88..85a40e07fbc3 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -36,6 +36,7 @@ struct stm32_exti_bank {
 	u32 rpr_ofst;
 	u32 fpr_ofst;
 	u32 trg_ofst;
+	u32 seccfgr_ofst;
 };
 
 #define UNDEF_REG ~0
@@ -54,10 +55,12 @@ struct stm32_exti_chip_data {
 	u32 mask_cache;
 	u32 rtsr_cache;
 	u32 ftsr_cache;
+	u32 event_reserved;
 };
 
 struct stm32_exti_host_data {
 	void __iomem *base;
+	struct device *dev;
 	struct stm32_exti_chip_data *chips_data;
 	const struct stm32_exti_drv_data *drv_data;
 	struct hwspinlock *hwlock;
@@ -73,6 +76,7 @@ static const struct stm32_exti_bank stm32f4xx_exti_b1 = {
 	.rpr_ofst	= 0x14,
 	.fpr_ofst	= UNDEF_REG,
 	.trg_ofst	= UNDEF_REG,
+	.seccfgr_ofst	= UNDEF_REG,
 };
 
 static const struct stm32_exti_bank *stm32f4xx_exti_banks[] = {
@@ -93,6 +97,7 @@ static const struct stm32_exti_bank stm32h7xx_exti_b1 = {
 	.rpr_ofst	= 0x88,
 	.fpr_ofst	= UNDEF_REG,
 	.trg_ofst	= UNDEF_REG,
+	.seccfgr_ofst	= UNDEF_REG,
 };
 
 static const struct stm32_exti_bank stm32h7xx_exti_b2 = {
@@ -104,6 +109,7 @@ static const struct stm32_exti_bank stm32h7xx_exti_b2 = {
 	.rpr_ofst	= 0x98,
 	.fpr_ofst	= UNDEF_REG,
 	.trg_ofst	= UNDEF_REG,
+	.seccfgr_ofst	= UNDEF_REG,
 };
 
 static const struct stm32_exti_bank stm32h7xx_exti_b3 = {
@@ -115,6 +121,7 @@ static const struct stm32_exti_bank stm32h7xx_exti_b3 = {
 	.rpr_ofst	= 0xA8,
 	.fpr_ofst	= UNDEF_REG,
 	.trg_ofst	= UNDEF_REG,
+	.seccfgr_ofst	= UNDEF_REG,
 };
 
 static const struct stm32_exti_bank *stm32h7xx_exti_banks[] = {
@@ -137,6 +144,7 @@ static const struct stm32_exti_bank stm32mp1_exti_b1 = {
 	.rpr_ofst	= 0x0C,
 	.fpr_ofst	= 0x10,
 	.trg_ofst	= 0x3EC,
+	.seccfgr_ofst	= 0x14,
 };
 
 static const struct stm32_exti_bank stm32mp1_exti_b2 = {
@@ -148,6 +156,7 @@ static const struct stm32_exti_bank stm32mp1_exti_b2 = {
 	.rpr_ofst	= 0x2C,
 	.fpr_ofst	= 0x30,
 	.trg_ofst	= 0x3E8,
+	.seccfgr_ofst	= 0x34,
 };
 
 static const struct stm32_exti_bank stm32mp1_exti_b3 = {
@@ -159,6 +168,7 @@ static const struct stm32_exti_bank stm32mp1_exti_b3 = {
 	.rpr_ofst	= 0x4C,
 	.fpr_ofst	= 0x50,
 	.trg_ofst	= 0x3E4,
+	.seccfgr_ofst	= 0x54,
 };
 
 static const struct stm32_exti_bank *stm32mp1_exti_banks[] = {
@@ -707,6 +717,12 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
 	bank  = hwirq / IRQS_PER_BANK;
 	chip_data = &host_data->chips_data[bank];
 
+	/* Check if event is reserved (Secure) */
+	if (chip_data->event_reserved & BIT(hwirq % IRQS_PER_BANK)) {
+		dev_err(host_data->dev, "event %lu is reserved, secure\n", hwirq);
+		return -EPERM;
+	}
+
 	event_trg = readl_relaxed(host_data->base + chip_data->reg_bank->trg_ofst);
 	chip = (event_trg & BIT(hwirq % IRQS_PER_BANK)) ?
 	       &stm32_exti_h_chip : &stm32_exti_h_chip_direct;
@@ -806,6 +822,10 @@ stm32_exti_chip_data *stm32_exti_chip_init(struct stm32_exti_host_data *h_data,
 	if (stm32_bank->emr_ofst != UNDEF_REG)
 		writel_relaxed(0, base + stm32_bank->emr_ofst);
 
+	/* reserve Secure events */
+	if (stm32_bank->seccfgr_ofst != UNDEF_REG)
+		chip_data->event_reserved = readl_relaxed(base + stm32_bank->seccfgr_ofst);
+
 	pr_info("%pOF: bank%d\n", node, bank_idx);
 
 	return chip_data;
@@ -911,6 +931,7 @@ static int stm32_exti_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, host_data);
+	host_data->dev = dev;
 
 	/* check for optional hwspinlock which may be not available yet */
 	ret = of_hwspin_lock_get_id(np, 0);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
