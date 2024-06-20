Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54090FEE8
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 10:33:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 068BEC7128D;
	Thu, 20 Jun 2024 08:33:23 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 404FEC71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:33:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K6H860015603;
 Thu, 20 Jun 2024 10:33:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 bXxkzTW4QOxeZ1W/fy4oEoPOwCf1R8czlhEkwm8Z9DE=; b=lsVBQw5DGQXYL9cd
 eOG9aPWuY8rTvgzwpI7JQ2IFCUZ+7Xdg99LmejwBjxvFD39wkMJ/kfnMPuKlPUbO
 AOWetxTUddmM0N48k9VwpBO5HLArS/mm3U7z65c85S3XNywv8RMkqfrsW/6ywjZu
 rMjKYZZVxuhjHCgy1RKSAGPapypa6sJWzkjskvjXu1mG8p971B+RhyC0p7Mbjk81
 P2KDs+dMHxs5zz+n4/Or9Y9JxaSqsS3BSpUGSBQA4lfIORCoMRodGaLMkt89T74J
 oBRY2ijmhlFMMttfQYoTiQSLjIOJyYsuogmt9zInYXFm1UcXQw/fzmpzxfxxwh6D
 flE/oQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9s75bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 10:33:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5762040045;
 Thu, 20 Jun 2024 10:32:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92386212FB7;
 Thu, 20 Jun 2024 10:32:25 +0200 (CEST)
Received: from localhost (10.48.87.171) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 20 Jun
 2024 10:32:25 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 20 Jun 2024 10:31:13 +0200
Message-ID: <20240620083115.204362-7-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620083115.204362-1-antonio.borneo@foss.st.com>
References: <20240620083115.204362-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.171]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_06,2024-06-19_01,2024-05-17_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 6/8] irqchip/stm32mp-exti: allow build as
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
