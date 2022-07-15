Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18274576885
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 22:52:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD715C640EF;
	Fri, 15 Jul 2022 20:52:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5B38C08D1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657918322; x=1689454322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sQXlsF0dU0h7TKwhfyBx9K7vKWjShXkwHIUD/Ch8sf8=;
 b=NTeBJ4AHNysZ+ohkzwulHoIh/4VZWIDOmCy3RpoCFpxiG0Y45zsj98X9
 +y5ApyrsutoJt2lE6N4TGSTeYh3M6yl0sb3m8Jzg9ZZP32s+lYuH328ov
 SyJNGuaSdznPidNmFzx4zm5pHd4Tgo4P22meK/VKZhWOuwiHt+VBXUMOv
 30eCviBil4LQgCEcIn/XHF5MFueMjyIm2575jd+x55ODmjnx5F1y3Kg4q
 fHwWv0L/cg7AH0lVuXjGe4uDrF0PbyWFo4U0olKftS0fZHw2D917v4/YO
 TJ6dmoeDObxj3B045G2XzwfmmvVzup1x6aRdkGEVmOP5o8NgnTeo3TMeK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="268918698"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="268918698"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 13:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="654494812"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2022 13:51:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id AC51A1A0; Fri, 15 Jul 2022 23:52:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Zyngier <maz@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 15 Jul 2022 23:52:03 +0300
Message-Id: <20220715205203.82591-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 1/1] irqchip/stm32-exti: Use INVALID_HWIRQ
	definition
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

Use specific definition for invalid IRQ. It makes the
code uniform in respect to the constant used for that.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/irqchip/irq-stm32-exti.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index a73763d475f0..a6ae9f38aaf0 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -170,7 +170,7 @@ static const struct stm32_exti_bank *stm32mp1_exti_banks[] = {
 static struct irq_chip stm32_exti_h_chip;
 static struct irq_chip stm32_exti_h_chip_direct;
 
-#define EXTI_INVALID_IRQ       U8_MAX
+#define EXTI_INVALID_IRQ       ((u8)INVALID_HWIRQ)
 #define STM32MP1_DESC_IRQ_SIZE (ARRAY_SIZE(stm32mp1_exti_banks) * IRQS_PER_BANK)
 
 static const u8 stm32mp1_desc_irq[] = {
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
