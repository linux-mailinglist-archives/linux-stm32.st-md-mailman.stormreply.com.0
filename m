Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD33AAAD4
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 07:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10C6EC5A4C3;
	Thu, 17 Jun 2021 05:18:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 042C1C597B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 05:18:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H5H5q2032306; Thu, 17 Jun 2021 07:18:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=oSV9GPSahpnkVgE4VVMpQ3gfnBTqH9WB8kcmpz1Wt2A=;
 b=gEXtRQTWUDSU/uXu18Io/pI9O88bm2gUPjv50I1wc0kEEzJXpJ/Jvcg00Oa8Fj0/MkvL
 odu271WC1LCHUB8pVVa1xa/w6MS7v/O8dQ72u0FeZ0OP9+xHUrRjqgBk3vlxdoG2N7LT
 2DFppeo6+1p8AmB3F2xV9ZUUEYM7CGHuIPzBskPxXK6GZgZYXEc69GeEIGsBNEXWQUNo
 +y8ZTM5flwJA5gg6GHtpLXg+7AqDrJWW70f2QWfdOW0FO0uE0/BBIHHGpx1Nrnk7wg05
 K7LVRcInq62VU7XtKOEQjvT13PnnwEyXJHoDvfK8ZT9dGLAQWptgKXBF4uYQBgfA6ct1 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 397bxapeau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:18:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 804AA10002A;
 Thu, 17 Jun 2021 07:18:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70782211278;
 Thu, 17 Jun 2021 07:18:24 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun 2021 07:18:23
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Thu, 17 Jun 2021 07:18:09 +0200
Message-ID: <20210617051814.12018-7-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_01:2021-06-15,
 2021-06-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH v3 06/11] reset: stm32mp1: remove
	stm32mp1 reset
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

st32mp1 RCC reset driver was moved into stm32mp1 RCC clock driver.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/reset/Kconfig          |   6 --
 drivers/reset/Makefile         |   1 -
 drivers/reset/reset-stm32mp1.c | 115 ---------------------------------
 3 files changed, 122 deletions(-)
 delete mode 100644 drivers/reset/reset-stm32mp1.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 3e7f55e44d84..29fb33c0e26d 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -199,12 +199,6 @@ config RESET_SIMPLE
 	   - ZTE's zx2967 family
 	   - SiFive FU740 SoCs
 
-config RESET_STM32MP157
-	bool "STM32MP157 Reset Driver" if COMPILE_TEST
-	default MACH_STM32MP157
-	help
-	  This enables the RCC reset controller driver for STM32 MPUs.
-
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
 	default ARM && ARCH_INTEL_SOCFPGA
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 65a118a91b27..ac3e612ad953 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
 obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
-obj-$(CONFIG_RESET_STM32MP157) += reset-stm32mp1.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
diff --git a/drivers/reset/reset-stm32mp1.c b/drivers/reset/reset-stm32mp1.c
deleted file mode 100644
index b221a28041fa..000000000000
--- a/drivers/reset/reset-stm32mp1.c
+++ /dev/null
@@ -1,115 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
- * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
- */
-
-#include <linux/device.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/reset-controller.h>
-
-#define CLR_OFFSET 0x4
-
-struct stm32_reset_data {
-	struct reset_controller_dev	rcdev;
-	void __iomem			*membase;
-};
-
-static inline struct stm32_reset_data *
-to_stm32_reset_data(struct reset_controller_dev *rcdev)
-{
-	return container_of(rcdev, struct stm32_reset_data, rcdev);
-}
-
-static int stm32_reset_update(struct reset_controller_dev *rcdev,
-			      unsigned long id, bool assert)
-{
-	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
-	int reg_width = sizeof(u32);
-	int bank = id / (reg_width * BITS_PER_BYTE);
-	int offset = id % (reg_width * BITS_PER_BYTE);
-	void __iomem *addr;
-
-	addr = data->membase + (bank * reg_width);
-	if (!assert)
-		addr += CLR_OFFSET;
-
-	writel(BIT(offset), addr);
-
-	return 0;
-}
-
-static int stm32_reset_assert(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	return stm32_reset_update(rcdev, id, true);
-}
-
-static int stm32_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return stm32_reset_update(rcdev, id, false);
-}
-
-static int stm32_reset_status(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
-	int reg_width = sizeof(u32);
-	int bank = id / (reg_width * BITS_PER_BYTE);
-	int offset = id % (reg_width * BITS_PER_BYTE);
-	u32 reg;
-
-	reg = readl(data->membase + (bank * reg_width));
-
-	return !!(reg & BIT(offset));
-}
-
-static const struct reset_control_ops stm32_reset_ops = {
-	.assert		= stm32_reset_assert,
-	.deassert	= stm32_reset_deassert,
-	.status		= stm32_reset_status,
-};
-
-static const struct of_device_id stm32_reset_dt_ids[] = {
-	{ .compatible = "st,stm32mp1-rcc"},
-	{ /* sentinel */ },
-};
-
-static int stm32_reset_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct stm32_reset_data *data;
-	void __iomem *membase;
-	struct resource *res;
-
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	membase = devm_ioremap_resource(dev, res);
-	if (IS_ERR(membase))
-		return PTR_ERR(membase);
-
-	data->membase = membase;
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = resource_size(res) * BITS_PER_BYTE;
-	data->rcdev.ops = &stm32_reset_ops;
-	data->rcdev.of_node = dev->of_node;
-
-	return devm_reset_controller_register(dev, &data->rcdev);
-}
-
-static struct platform_driver stm32_reset_driver = {
-	.probe	= stm32_reset_probe,
-	.driver = {
-		.name		= "stm32mp1-reset",
-		.of_match_table	= stm32_reset_dt_ids,
-	},
-};
-
-builtin_platform_driver(stm32_reset_driver);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
