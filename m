Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DC7E2698
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 15:23:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBF12C6B47B;
	Mon,  6 Nov 2023 14:23:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7138DC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Nov 2023 14:23:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A6CfNux000794; Mon, 6 Nov 2023 15:23:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=rkHoTntJC29nPNdgPKNfEyJLt/Ru5H+gyk6qO+rfScA=; b=QY
 I44LuXgG73qkryyh4Hsg/VKOdU394M74DkwKqniOXP4QENujMjGBcnE0Pyq4xJ1K
 xsePpe3xYoUPTkWWnPzHfMQnaAX/u0PPHWj1i1gpC4/BeK6mXar3zM3YH4qL9cgN
 UxEuCXiRWQPTuMYd3SAdCivti6XK1MVZPHshHSZ2IfeZI9wY8Nf7dwCgtVtIXodT
 AmuS11NAqXy8+yoD3RLYN8EkIyf5uOvXjY80gUttnyxrJWnFuzpX4iKdqg/3v/MV
 12HF5LBG1aDm48SdOUY+AEQ/Tdhh6WP4VMxNjZPKRjS2sG0+MXX4eKJfg9YfHD7f
 abEEjP1vPZiqtwlAbSCg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u5eqrqhgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Nov 2023 15:23:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 964B710005E;
 Mon,  6 Nov 2023 15:23:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DFAC257A92;
 Mon,  6 Nov 2023 15:23:17 +0100 (CET)
Received: from localhost (10.201.21.240) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 6 Nov
 2023 15:23:17 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
Date: Mon, 6 Nov 2023 15:18:44 +0100
Message-ID: <20231106141845.102648-4-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231106141845.102648-1-gabriel.fernandez@foss.st.com>
References: <20231106141845.102648-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.240]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_12,2023-11-02_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/4] clk: stm32mp1: move stm32mp1 clock driver
	into stm32 directory
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

Move all STM32MP clock drivers into same directory (stm32).

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/Kconfig                    | 4 ----
 drivers/clk/Makefile                   | 1 -
 drivers/clk/stm32/Kconfig              | 7 +++++++
 drivers/clk/stm32/Makefile             | 1 +
 drivers/clk/{ => stm32}/clk-stm32mp1.c | 0
 5 files changed, 8 insertions(+), 5 deletions(-)
 rename drivers/clk/{ => stm32}/clk-stm32mp1.c (100%)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 61a68a241152..472bf4a43ce5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -414,10 +414,6 @@ config COMMON_CLK_VC7
 	  Renesas Versaclock7 is a family of configurable clock generator
 	  and jitter attenuator ICs with fractional and integer dividers.
 
-config COMMON_CLK_STM32MP157
-	def_bool COMMON_CLK && MACH_STM32MP157
-	help
-	  Support for stm32mp157 SoC family clocks
 
 config COMMON_CLK_STM32F
 	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index ed71f2e0ee36..14fa8d4ecc1f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -70,7 +70,6 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
-obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 0755fbee3356..b8a34d07864c 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -17,6 +17,13 @@ config COMMON_CLK_STM32MP135
 	help
 	  Support for stm32mp13x SoC family clocks.
 
+config COMMON_CLK_STM32MP157
+	bool "Clock driver for stm32mp15x clocks"
+	depends on ARM || COMPILE_TEST
+	default y
+	help
+	  Support for stm32mp15x SoC family clocks.
+
 config COMMON_CLK_STM32MP257
 	bool "Clock driver for stm32mp25x clocks"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index ee592f562e86..e4bcc215fdf3 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
 obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
similarity index 100%
rename from drivers/clk/clk-stm32mp1.c
rename to drivers/clk/stm32/clk-stm32mp1.c
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
