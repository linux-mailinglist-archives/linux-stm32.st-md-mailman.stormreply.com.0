Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8659AB307
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 17:59:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4AB2C78037;
	Tue, 22 Oct 2024 15:59:57 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FCA4C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 15:59:56 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBM6Jx009686;
 Tue, 22 Oct 2024 17:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 IPb8iKoLm6aPEXvEfhIiGG9B6WnT9HIMeAmj2PtezsA=; b=vT4FUUvNUXxUpmS0
 qyFwvGxHHc2pVAMtdZ4RHIF0egIT9xkKuVpb3QvS7hhrEHtr4vo5bUh8fP3iM+O+
 /TuAqZINkNQNw5VKfDPRBTB8O+v0hXi+AjtB26Sj/nMWEIMLjpez64HD55sHuCz5
 DqzMyMwYdXWXgj3Jy6j1stSEfE2TAEhA5hsTq27hUM5YeDLhvRI2TUCy2QqwW3xH
 vc70/+vKKog25+1X2bB14qdcj7ViURLJwnpyhFoPiJM0wa0EwU+WGrdPNO3XJO3J
 b0EwLS5uJUEvGU1OE3DAPArbYuBxR0bkeELydQ0LE+TwAZw+t38jWBwjaxjMZeaF
 qoa4Ww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cqqhuvb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2024 17:59:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D77BC40055;
 Tue, 22 Oct 2024 17:58:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A578B26E862;
 Tue, 22 Oct 2024 17:57:32 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:32 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 22 Oct 2024 17:56:53 +0200
Message-ID: <20241022155658.1647350-10-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Cheick Traore <cheick.traore@foss.st.com>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 09/14] pinctrl: stm32: Allow compile as module
	for stm32mp257
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

From: Stephane Danieau <stephane.danieau@foss.st.com>

Add ability to build pinctrl for stm32mp257 as a kernel module.
Add kernel-doc to the exported symbols.
Drop the Kconfig symbol MACH_STM32MP25, as it has never been
defined.

Signed-off-by: Stephane Danieau <stephane.danieau@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/Kconfig.platforms               |  1 -
 drivers/pinctrl/stm32/Kconfig              |  6 +++---
 drivers/pinctrl/stm32/pinctrl-stm32.c      |  7 +++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      | 14 ++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c | 11 ++++++-----
 5 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42e..ab77cc49b4ed7 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -308,7 +308,6 @@ config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
 	select PINCTRL
-	select PINCTRL_STM32MP257
 	select ARM_SMC_MBOX
 	select ARM_SCMI_PROTOCOL
 	select REGULATOR
diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 2656d3d3ae402..6c18ac9cdeec2 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -2,7 +2,7 @@
 if ARCH_STM32 || COMPILE_TEST
 
 config PINCTRL_STM32
-	bool
+	tristate
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
@@ -53,8 +53,8 @@ config PINCTRL_STM32MP157
 	select PINCTRL_STM32
 
 config PINCTRL_STM32MP257
-	bool "STMicroelectronics STM32MP257 pin control" if COMPILE_TEST && !MACH_STM32MP25
+	tristate "STMicroelectronics STM32MP257 pin control"
 	depends on OF && HAS_IOMEM
-	default MACH_STM32MP25
+	default ARM64 || COMPILE_TEST
 	select PINCTRL_STM32
 endif
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index b6e7e34508592..5da2114b81420 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1954,6 +1954,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL(stm32_pctl_probe);
 
 static int __maybe_unused stm32_pinctrl_restore_advcfgr(struct stm32_gpio_bank *bank,
 							int offset, u32 bpos)
@@ -2062,6 +2063,7 @@ int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL(stm32_pinctrl_suspend);
 
 int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
@@ -2077,3 +2079,8 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL(stm32_pinctrl_resume);
+
+MODULE_AUTHOR("Alexandre Torgue <alexandre.torgue@foss.st.com>");
+MODULE_DESCRIPTION("STM32 core pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index b8caebc55cfc5..d17cbdbba4482 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -68,8 +68,22 @@ struct stm32_pinctrl_match_data {
 	bool rif_control;
 };
 
+/**
+ * stm32_pctl_probe() - Common probe for stm32 pinctrl drivers.
+ * @pdev: Pinctrl platform device.
+ */
 int stm32_pctl_probe(struct platform_device *pdev);
+
+/**
+ * stm32_pinctrl_suspend() - Common suspend for stm32 pinctrl drivers.
+ * @dev: Pinctrl device.
+ */
 int stm32_pinctrl_suspend(struct device *dev);
+
+/**
+ * stm32_pinctrl_resume() - Common resume for stm32 pinctrl drivers.
+ * @dev: Pinctrl device.
+ */
 int stm32_pinctrl_resume(struct device *dev);
 
 #endif /* __PINCTRL_STM32_H */
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index a374918030788..6709bddd97186 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -4,6 +4,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
@@ -2566,6 +2567,7 @@ static const struct of_device_id stm32mp257_pctrl_match[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, stm32mp257_pctrl_match);
 
 static const struct dev_pm_ops stm32_pinctrl_dev_pm_ops = {
 	 SET_LATE_SYSTEM_SLEEP_PM_OPS(stm32_pinctrl_suspend, stm32_pinctrl_resume)
@@ -2579,9 +2581,8 @@ static struct platform_driver stm32mp257_pinctrl_driver = {
 		.pm = &stm32_pinctrl_dev_pm_ops,
 	},
 };
+module_platform_driver(stm32mp257_pinctrl_driver);
 
-static int __init stm32mp257_pinctrl_init(void)
-{
-	return platform_driver_register(&stm32mp257_pinctrl_driver);
-}
-arch_initcall(stm32mp257_pinctrl_init);
+MODULE_AUTHOR("Alexandre Torgue <alexandre.torgue@foss.st.com>");
+MODULE_DESCRIPTION("STM32MP257 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
