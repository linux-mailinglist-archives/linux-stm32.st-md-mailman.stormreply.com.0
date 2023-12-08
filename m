Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6E80A5AF
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 15:37:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3F59C6B47F;
	Fri,  8 Dec 2023 14:37:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7398FC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 14:37:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3B88QQi8015630; Fri, 8 Dec 2023 15:37:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=1qGFaBcs+OGg0vqscD04cfo2vPPfTvTMkHJAI0v67YY=; b=kQ
 sHEKLe97AdfndAcSUTwW1/oV78VVyuGFibEpEOqMYBBgYa2VsythhW+U7xiXaPQR
 dQw3MV7htqlU5zvjcoFSu6mre7DaOlUATQFGpEbl3G09o4o+IKNpREMzV3BVhCAB
 Cu7QSJEh4777InTQgdpqd4wtJKf9u2nydZfTu6cn/kedOY9lwrrihFXD6Bji+I3c
 ysDjBZ6DDOMAW8rHS1uyo4uX3CbKv2+S69YzDyVLksQtComtcLivGRpp7HlhuIlo
 Uml0z8CTmQUc/ZcKiBUD5aX6CAcFMPndU9XcEIIc+kwWY8yjS0o9bxBbTnQrH/5V
 1L/k3EpDmRcxxjTh6xrw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2gn37m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 15:37:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 85B17100058;
 Fri,  8 Dec 2023 15:37:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7BBF3229A76;
 Fri,  8 Dec 2023 15:37:03 +0100 (CET)
Received: from localhost (10.252.31.8) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 15:37:03 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 8 Dec 2023 15:36:56 +0100
Message-ID: <20231208143700.354785-2-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
References: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.31.8]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_09,2023-12-07_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 1/5] clk: stm32mp1: move stm32mp1 clock
	driver into stm32 directory
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
 drivers/clk/Kconfig                    | 11 +---------
 drivers/clk/Makefile                   |  1 -
 drivers/clk/stm32/Kconfig              | 29 ++++++++++++++++++++++++++
 drivers/clk/stm32/Makefile             |  1 +
 drivers/clk/{ => stm32}/clk-stm32mp1.c |  0
 5 files changed, 31 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/stm32/Kconfig
 rename drivers/clk/{ => stm32}/clk-stm32mp1.c (100%)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c30d0d396f7a..50af5fc7f570 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -414,16 +414,6 @@ config COMMON_CLK_VC7
 	  Renesas Versaclock7 is a family of configurable clock generator
 	  and jitter attenuator ICs with fractional and integer dividers.
 
-config COMMON_CLK_STM32MP135
-	def_bool COMMON_CLK && MACH_STM32MP13
-	help
-	  Support for stm32mp135 SoC family clocks
-
-config COMMON_CLK_STM32MP157
-	def_bool COMMON_CLK && MACH_STM32MP157
-	help
-	  Support for stm32mp157 SoC family clocks
-
 config COMMON_CLK_STM32F
 	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
 	help
@@ -504,6 +494,7 @@ source "drivers/clk/starfive/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
 source "drivers/clk/tegra/Kconfig"
+source "drivers/clk/stm32/Kconfig"
 source "drivers/clk/ti/Kconfig"
 source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/visconti/Kconfig"
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
new file mode 100644
index 000000000000..3c8493a94a11
--- /dev/null
+++ b/drivers/clk/stm32/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# common clock support for STMicroelectronics SoC family.
+
+menuconfig COMMON_CLK_STM32MP
+	bool "Clock support for common STM32MP clocks"
+	depends on ARCH_STM32 || COMPILE_TEST
+	default y
+	select RESET_CONTROLLER
+	help
+	  Support for STM32MP SoC family clocks.
+
+if COMMON_CLK_STM32MP
+
+config COMMON_CLK_STM32MP135
+	bool "Clock driver for stm32mp13x clocks"
+	depends on ARM || COMPILE_TEST
+	default y
+	help
+	  Support for stm32mp13x SoC family clocks.
+
+config COMMON_CLK_STM32MP157
+	bool "Clock driver for stm32mp15x clocks"
+	depends on ARM || COMPILE_TEST
+	default y
+	help
+	  Support for stm32mp15x SoC family clocks.
+
+endif
+
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index 95bd2230bba0..c154ef3e88f9 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
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
