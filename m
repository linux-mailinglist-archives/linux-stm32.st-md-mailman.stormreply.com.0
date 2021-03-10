Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB1C3339D8
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 11:21:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93146C58D43;
	Wed, 10 Mar 2021 10:21:07 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8563C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 08:38:52 +0000 (UTC)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lJuMl-0003ih-Sv
 for linux-stm32@st-md-mailman.stormreply.com; Wed, 10 Mar 2021 08:38:52 +0000
Received: by mail-wr1-f72.google.com with SMTP id f3so7648062wrt.14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXnbdve+zJOcbawv0EbHEJ5Jfc5lGWVMModTUJmANNk=;
 b=aNoF9YffkaK1lsRZgj5Xp3WAg/NGgcY6qcdocg4+v5QRVZ2wXzoNTOXlENAZSIbzli
 wn4046b2k8iAO2M4fCp0MLWpnXoH30+C7xrA+3Kg544voNdnYBTsJIqHQL8+Gc4jNdqR
 gxmSbJwGoilWZE5VY0U5T8LF2arYO/+yLLO4t8kYv4UEBbEdrt+c5CbGnwDydv+SJinx
 T1KW/RSZm4ttwovgVXW1jWn8qGs9m4qQEy6EfM3HV1nYIwY2yRilvJZov0yraNtsdVWa
 7XK3inOdZKW9/ZyJuQJ1PI33GAz0tLFE1aPGnELaqjbiuIt9fHUNsz+k9Py4fUuMg6aj
 j3fA==
X-Gm-Message-State: AOAM532poOALlTru1QDmGfbZjxsWRWZGWbjLx0fQS+2oNQDZ12YQvhF+
 /l1KqGesUe4LvYoQAKPgba+aOr/Hj6HJCgogben1lI51LB0BShfBDcSMb8FhRWrWtQVqBStW2p3
 Srofrq/vcI5KSQ/fVRaLCUY4iA/SkWV2GSOPbrCnrPVMHvaQcchSh25V7EQ==
X-Received: by 2002:adf:e34f:: with SMTP id n15mr2291943wrj.224.1615365531631; 
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSnw2dWyhCg8S1XsnqpMXZq1fKjQTwwKkJAQ63GButlbWJPKDpMI8YiY40X10GBbtFiL7M/A==
X-Received: by 2002:adf:e34f:: with SMTP id n15mr2291911wrj.224.1615365531457; 
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id u20sm32781061wru.6.2021.03.10.00.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 00:38:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Date: Wed, 10 Mar 2021 09:38:38 +0100
Message-Id: <20210310083840.481615-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Mar 2021 10:21:03 +0000
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [Linux-stm32] [RFC v2 4/5] arm64: intel: merge Agilex and N5X into
	ARCH_SOCFPGA64
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

Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
the Linux kernel point of view these are flavors of the same
architecture so there is no need for three top-level arm64
architectures.  Simplify this by merging all three architectures into
ARCH_SOCFPGA64.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/Kconfig.platforms       | 10 ----------
 arch/arm64/boot/dts/intel/Makefile |  6 +++---
 arch/arm64/configs/defconfig       |  1 -
 drivers/clk/socfpga/Kconfig        |  4 ++--
 drivers/firmware/Kconfig           |  2 +-
 drivers/reset/Kconfig              |  2 +-
 6 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 78bba3633eab..754738029cc6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -8,16 +8,6 @@ config ARCH_ACTIONS
 	help
 	  This enables support for the Actions Semiconductor S900 SoC family.
 
-config ARCH_AGILEX
-	bool "Intel's Agilex SoCFPGA Family"
-	help
-	  This enables support for Intel's Agilex SoCFPGA Family.
-
-config ARCH_N5X
-	bool "Intel's eASIC N5X SoCFPGA Family"
-	help
-	  This enables support for Intel's eASIC N5X SoCFPGA Family.
-
 config ARCH_SUNXI
 	bool "Allwinner sunxi 64-bit SoC Family"
 	select ARCH_HAS_RESET_CONTROLLER
diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 3a052540605b..bb340584785c 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_AGILEX) += socfpga_agilex_socdk.dtb \
-			     socfpga_agilex_socdk_nand.dtb
+dtb-$(CONFIG_ARCH_SOCFPGA64) += socfpga_agilex_socdk.dtb \
+				socfpga_agilex_socdk_nand.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
-dtb-$(CONFIG_ARCH_N5X) += socfpga_n5x_socdk.dtb
+dtb-$(CONFIG_ARCH_SOCFPGA64) += socfpga_n5x_socdk.dtb
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ee742900a150..4968d4b3d89d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -28,7 +28,6 @@ CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_ACTIONS=y
-CONFIG_ARCH_AGILEX=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_BCM2835=y
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index 8cf3dfdba255..834797c68cb2 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -2,5 +2,5 @@
 config COMMON_CLK_SOCFPGA64
 	bool
 	# Intel Stratix / Agilex / N5X clock controller support
-	default y if ARCH_AGILEX || ARCH_N5X || ARCH_SOCFPGA64
-	depends on ARCH_AGILEX || ARCH_N5X || ARCH_SOCFPGA64
+	default y if ARCH_SOCFPGA64
+	depends on ARCH_SOCFPGA64
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 59660798f05f..f290fad41731 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -206,7 +206,7 @@ config FW_CFG_SYSFS_CMDLINE
 
 config INTEL_STRATIX10_SERVICE
 	tristate "Intel Stratix10 Service Layer"
-	depends on (ARCH_SOCFPGA64 || ARCH_AGILEX) && HAVE_ARM_SMCCC
+	depends on ARCH_SOCFPGA64 && HAVE_ARM_SMCCC
 	default n
 	help
 	  Intel Stratix10 service layer runs at privileged exception level,
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index fa7f1394697b..796c9e3e5e81 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -183,7 +183,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_SOCFPGA64 || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_SOCFPGA64 || ARCH_SUNXI || ARC
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
