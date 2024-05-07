Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D09CD8BE330
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 15:12:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95F75C78004;
	Tue,  7 May 2024 13:12:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22E51C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 13:12:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447C601u005842;
 Tue, 7 May 2024 15:12:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=bXxkzTW4QOxeZ1W/fy4oEoPOwCf1R8czlhEkwm8Z9DE=; b=C5
 VPJi11C/Q8nXrg9onmlvYCzCgQv5/3r8JMEnbeA8naupI3Rp4QHOUGLCq0aMBfBe
 HFHsxKGQowLq/u8KaXo2KIYOzfcJwnonUOK8nFBkvvZpSLE9hPR2WDJKo7NQOTJ8
 PMcKP6iIkmv8jArle5ySTF6xgjA9CfNRpv4SASLa6fceYDrvCIcfhjZdblneNml1
 ivr5iXG8TbGXkzH6wXHZ+RVhqhtRde3w0/TV1Gj3ZUEt48p8AB0O2RjEJ2rUjRUC
 R2TPFYMFKBOWTWaRHuvMK7mmZBjr0CNpEacH5E4Ke2ozwV4xBzPK3Coi5J/0k6Rp
 Roo8iHMXzU/7CvOwgBnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xwbwckrxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 15:12:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 17EA240044;
 Tue,  7 May 2024 15:12:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4144321B53C;
 Tue,  7 May 2024 15:12:01 +0200 (CEST)
Received: from localhost (10.48.87.171) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 15:12:00 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 7 May 2024 15:10:49 +0200
Message-ID: <20240507131051.980313-7-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507131051.980313-1-antonio.borneo@foss.st.com>
References: <20240507131051.980313-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.171]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_06,2024-05-06_02,2023-05-22_02
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 6/8] irqchip/stm32mp-exti: allow build as
	module
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

Allow build the driver as a module by adding the necessarily hooks
in Kconfig and in the driver's code.

Since all the probe dependencies linked to this driver has already
been fixed, ignore the no more relevant 'arch_initcall'.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/irqchip/Kconfig            |  8 ++++++--
 drivers/irqchip/irq-stm32mp-exti.c | 15 ++++-----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 486022fb7806e..b804da28dccf5 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -393,9 +393,13 @@ config PARTITION_PERCPU
 	bool
 
 config STM32MP_EXTI
-	bool
-	select IRQ_DOMAIN
+	tristate "STM32MP extended interrupts and event controller"
+	depends on (ARCH_STM32 && !ARM_SINGLE_ARMV7M) || COMPILE_TEST
+	default y
+	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_CHIP
+	help
+	  Support STM32MP EXTI (extended interrupts and event) controller.
 
 config STM32_EXTI
 	bool
diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index 3ceff6d25b702..2958fbcfbda12 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -730,15 +730,8 @@ static struct platform_driver stm32mp_exti_driver = {
 	},
 };
 
-static int __init stm32mp_exti_arch_init(void)
-{
-	return platform_driver_register(&stm32mp_exti_driver);
-}
-
-static void __exit stm32mp_exti_arch_exit(void)
-{
-	return platform_driver_unregister(&stm32mp_exti_driver);
-}
+module_platform_driver(stm32mp_exti_driver);
 
-arch_initcall(stm32mp_exti_arch_init);
-module_exit(stm32mp_exti_arch_exit);
+MODULE_AUTHOR("Maxime Coquelin <mcoquelin.stm32@gmail.com>");
+MODULE_DESCRIPTION("STM32MP EXTI driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
