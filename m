Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D76232239
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 18:11:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6A94C36B29;
	Wed, 29 Jul 2020 16:11:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7457C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 16:11:05 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15DD4208A9;
 Wed, 29 Jul 2020 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596039064;
 bh=gAyLpOZYDu8tG7gPMVs7XDjNmD+CKe0ZmTsojRr4Vr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ktVE9NWSRB2ds+ZQ3nVplOFB15l4g5AUaqpRaFKKl7u6bxP070LZ74x8jC+Qyq05d
 PIo1owA5o2YkaVnx3yye+kXTa8FpoasD9VaP6HbOdAnEZeoB8ukckc3J88t9Hjt/B2
 fGqr5iLg/Ymes421syzCp108YL644AFBk9PPOIKQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vincent Sanders <vince@simtec.co.uk>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
Date: Wed, 29 Jul 2020 18:09:36 +0200
Message-Id: <20200729160942.28867-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729160942.28867-1-krzk@kernel.org>
References: <20200729160942.28867-1-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH 1/7] clk: samsung: s3c64xx: Declare
	s3c64xx_clk_init() in shared header
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The s3c64xx_clk_init() is defined and used by clk-s3c64xx driver and
also used in mach-s3c64xx machine code.  Move the declaration to a
header to fix W=1 build warning:

    drivers/clk/samsung/clk-s3c64xx.c:391:13: warning: no previous prototype for 's3c64xx_clk_init' [-Wmissing-prototypes]
      391 | void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS                       |  1 +
 arch/arm/mach-s3c64xx/common.c    |  1 +
 arch/arm/mach-s3c64xx/common.h    |  2 --
 drivers/clk/samsung/clk-s3c64xx.c |  1 +
 include/linux/clk/samsung.h       | 21 +++++++++++++++++++++
 5 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/clk/samsung.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f8c6e41a364..f5d7cf3c3aaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15294,6 +15294,7 @@ F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
 F:	include/dt-bindings/clock/exynos*.h
+F:	include/linux/clk/samsung.h
 
 SAMSUNG SPI DRIVERS
 M:	Kukjin Kim <kgene@kernel.org>
diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index 13e91074308a..a655bf0c7802 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/io.h>
+#include <linux/clk/samsung.h>
 #include <linux/dma-mapping.h>
 #include <linux/irq.h>
 #include <linux/gpio.h>
diff --git a/arch/arm/mach-s3c64xx/common.h b/arch/arm/mach-s3c64xx/common.h
index 03670887a764..f4eca42cdc86 100644
--- a/arch/arm/mach-s3c64xx/common.h
+++ b/arch/arm/mach-s3c64xx/common.h
@@ -22,8 +22,6 @@ void s3c64xx_init_io(struct map_desc *mach_desc, int size);
 void s3c64xx_restart(enum reboot_mode mode, const char *cmd);
 
 struct device_node;
-void s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
-	unsigned long xusbxti_f, bool is_s3c6400, void __iomem *reg_base);
 void s3c64xx_set_xtal_freq(unsigned long freq);
 void s3c64xx_set_xusbxti_freq(unsigned long freq);
 
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index b96d33e5eb45..56f95b63f71f 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -7,6 +7,7 @@
 
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/samsung.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
new file mode 100644
index 000000000000..b6b253c46c22
--- /dev/null
+++ b/include/linux/clk/samsung.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
+ */
+
+#ifndef __LINUX_CLK_SAMSUNG_H_
+#define __LINUX_CLK_SAMSUNG_H_
+
+#ifdef CONFIG_ARCH_S3C64XX
+void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
+			     unsigned long xusbxti_f, bool s3c6400,
+			     void __iomem *base);
+#else
+static inline void __init s3c64xx_clk_init(struct device_node *np,
+					   unsigned long xtal_f,
+					   unsigned long xusbxti_f,
+					   bool s3c6400,
+					   void __iomem *base) { }
+#endif /* CONFIG_ARCH_S3C64XX */
+
+#endif /* __LINUX_CLK_SAMSUNG_H_ */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
