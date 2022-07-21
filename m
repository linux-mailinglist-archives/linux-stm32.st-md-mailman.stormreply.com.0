Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868357CD0B
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 16:14:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15247C640EF;
	Thu, 21 Jul 2022 14:14:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCCE9C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 14:14:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48C7CB824FE;
 Thu, 21 Jul 2022 14:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A67C341C6;
 Thu, 21 Jul 2022 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658412862;
 bh=xSF7hzPJVI8vZgmefEvm+ojl1+e1t9UBEWYp+B7jNEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PAZlMiK6/fIAPMgORVZD88nxHvhawxUjRD3gGqbA6no4j2RBsoHFxSnNo8gTfWYXY
 PkZCDwIkcHFmtDmvsRyhrlCQZLhD7kQYC6ouEMmnfHmHKrpZf3ke7VZ0Wi95A2m+gA
 X/vgg7dPlWZvIRLaDZPTEHjrXa5DhiOQBrRQ+OWED/y1sjwDEPdcLvWXTrdRwzBVLX
 DZ/+AQTd0Wo7llS4g/3iln07kylG0Onx2fd2kg2x+bRl2Z5O17l3NdDmYX+MNkQqHT
 n5pSCdhs/5R8qADsLcUDuYQvUcMGv+g4tRzkOqSiOcTDid0H0awinFu3m5g0+zHmWq
 vjKM10Zvznh3g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 21 Jul 2022 16:13:23 +0200
Message-Id: <20220721141325.2413920-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220721141325.2413920-1-arnd@kernel.org>
References: <20220721141325.2413920-1-arnd@kernel.org>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [Linux-stm32] [PATCH 4/6] ARM: defconfig: address renamed
	CONFIG_DEBUG_INFO=y
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

From: Arnd Bergmann <arnd@arndb.de>

CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.

This was actually not what I had in mind when I suggested making
it a 'choice' statement, but it's too late to change again now,
and the Kconfig logic is more sensible in the new form.

Change any defconfig file that had CONFIG_DEBUG_INFO enabled
but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
default.

Fixes: f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable from a choice")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/aspeed_g4_defconfig      | 1 -
 arch/arm/configs/aspeed_g5_defconfig      | 1 -
 arch/arm/configs/axm55xx_defconfig        | 2 +-
 arch/arm/configs/badge4_defconfig         | 2 +-
 arch/arm/configs/bcm2835_defconfig        | 2 +-
 arch/arm/configs/colibri_pxa270_defconfig | 2 +-
 arch/arm/configs/colibri_pxa300_defconfig | 2 +-
 arch/arm/configs/dove_defconfig           | 2 +-
 arch/arm/configs/exynos_defconfig         | 2 +-
 arch/arm/configs/keystone_defconfig       | 2 +-
 arch/arm/configs/lpc18xx_defconfig        | 2 +-
 arch/arm/configs/lpc32xx_defconfig        | 2 +-
 arch/arm/configs/lpd270_defconfig         | 2 +-
 arch/arm/configs/lubbock_defconfig        | 2 +-
 arch/arm/configs/mainstone_defconfig      | 2 +-
 arch/arm/configs/mini2440_defconfig       | 2 +-
 arch/arm/configs/mmp2_defconfig           | 2 +-
 arch/arm/configs/moxart_defconfig         | 2 +-
 arch/arm/configs/mps2_defconfig           | 2 +-
 arch/arm/configs/multi_v5_defconfig       | 2 +-
 arch/arm/configs/mv78xx0_defconfig        | 2 +-
 arch/arm/configs/mvebu_v5_defconfig       | 2 +-
 arch/arm/configs/mvebu_v7_defconfig       | 2 +-
 arch/arm/configs/mxs_defconfig            | 2 +-
 arch/arm/configs/nhk8815_defconfig        | 2 +-
 arch/arm/configs/omap1_defconfig          | 2 +-
 arch/arm/configs/omap2plus_defconfig      | 1 -
 arch/arm/configs/orion5x_defconfig        | 2 +-
 arch/arm/configs/pxa168_defconfig         | 2 +-
 arch/arm/configs/pxa255-idp_defconfig     | 2 +-
 arch/arm/configs/pxa910_defconfig         | 2 +-
 arch/arm/configs/pxa_defconfig            | 2 +-
 arch/arm/configs/qcom_defconfig           | 2 +-
 arch/arm/configs/s3c2410_defconfig        | 2 +-
 arch/arm/configs/s3c6400_defconfig        | 2 +-
 arch/arm/configs/s5pv210_defconfig        | 2 +-
 arch/arm/configs/socfpga_defconfig        | 2 +-
 arch/arm/configs/spear13xx_defconfig      | 2 +-
 arch/arm/configs/spear3xx_defconfig       | 2 +-
 arch/arm/configs/spear6xx_defconfig       | 2 +-
 arch/arm/configs/stm32_defconfig          | 2 +-
 arch/arm/configs/tegra_defconfig          | 2 +-
 arch/arm/configs/vexpress_defconfig       | 2 +-
 arch/arm64/configs/defconfig              | 2 +-
 44 files changed, 41 insertions(+), 44 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index dfb803753ea1..67feb060bb19 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -244,7 +244,6 @@ CONFIG_CRYPTO_USER_API_HASH=y
 # CONFIG_XZ_DEC_SPARC is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_GDB_SCRIPTS=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 7586fb475a1b..247ab72b2590 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -273,7 +273,6 @@ CONFIG_CRYPTO_USER_API_HASH=y
 # CONFIG_XZ_DEC_SPARC is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_GDB_SCRIPTS=y
diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 263490e59250..bfbaa2df3be5 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -224,7 +224,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_XCBC=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/arm/configs/badge4_defconfig b/arch/arm/configs/badge4_defconfig
index 4e3490798d6d..179788073afd 100644
--- a/arch/arm/configs/badge4_defconfig
+++ b/arch/arm/configs/badge4_defconfig
@@ -97,7 +97,7 @@ CONFIG_NFS_V3=y
 CONFIG_SMB_FS=m
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index 445f38bc340d..c4d2e2334b6e 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -176,7 +176,7 @@ CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
 CONFIG_BOOT_PRINTK_DELAY=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_LOCKUP_DETECTOR=y
 CONFIG_DEBUG_FS=y
diff --git a/arch/arm/configs/colibri_pxa270_defconfig b/arch/arm/configs/colibri_pxa270_defconfig
index c3d15b8dfc39..ad745f5bfbb1 100644
--- a/arch/arm/configs/colibri_pxa270_defconfig
+++ b/arch/arm/configs/colibri_pxa270_defconfig
@@ -134,7 +134,7 @@ CONFIG_NLS_ISO8859_1=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
 CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_KEYS=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_PCBC=m
diff --git a/arch/arm/configs/colibri_pxa300_defconfig b/arch/arm/configs/colibri_pxa300_defconfig
index 1aaab3d01be0..d63469284b0b 100644
--- a/arch/arm/configs/colibri_pxa300_defconfig
+++ b/arch/arm/configs/colibri_pxa300_defconfig
@@ -52,7 +52,7 @@ CONFIG_CRYPTO_ECB=y
 CONFIG_CRYPTO_AES=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
 CONFIG_CRYPTO_ARC4=y
diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index 683ad6466919..16ed5c110e8d 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -116,7 +116,7 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_2=y
 CONFIG_NLS_UTF8=y
 CONFIG_TIMER_STATS=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_CRYPTO_NULL=y
 CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_PCBC=m
diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index a85c220487f9..1ce74f46e114 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -374,7 +374,7 @@ CONFIG_FONTS=y
 CONFIG_FONT_7x14=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index f40b969b486e..68b89b90ca29 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -224,7 +224,7 @@ CONFIG_NFSD=y
 CONFIG_NFSD_V3_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_AUTHENC=y
 CONFIG_CRYPTO_CBC=y
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index 0f44c7428396..142c1700f450 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -150,7 +150,7 @@ CONFIG_JFFS2_FS=y
 CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index ca510e18b7d8..8a41fe4e62f1 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -185,7 +185,7 @@ CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRC_CCITT=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
diff --git a/arch/arm/configs/lpd270_defconfig b/arch/arm/configs/lpd270_defconfig
index f47c8c4ae2a5..b43938e30d77 100644
--- a/arch/arm/configs/lpd270_defconfig
+++ b/arch/arm/configs/lpd270_defconfig
@@ -52,7 +52,7 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/lubbock_defconfig b/arch/arm/configs/lubbock_defconfig
index efddb63f9387..2b1aec0afba0 100644
--- a/arch/arm/configs/lubbock_defconfig
+++ b/arch/arm/configs/lubbock_defconfig
@@ -45,7 +45,7 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/mainstone_defconfig b/arch/arm/configs/mainstone_defconfig
index d29a07628b09..6aac785c5696 100644
--- a/arch/arm/configs/mainstone_defconfig
+++ b/arch/arm/configs/mainstone_defconfig
@@ -43,7 +43,7 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
index 4da0055409e5..5b4ab5bf5c5f 100644
--- a/arch/arm/configs/mini2440_defconfig
+++ b/arch/arm/configs/mini2440_defconfig
@@ -328,7 +328,7 @@ CONFIG_LIBCRC32C=m
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_MINI_4x6=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_KERNEL=y
 CONFIG_STRIP_ASM_SYMS=y
diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
index 8c6ed151dfe6..1b6b41a36888 100644
--- a/arch/arm/configs/mmp2_defconfig
+++ b/arch/arm/configs/mmp2_defconfig
@@ -77,7 +77,7 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_DEBUG_PREEMPT is not set
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_DYNAMIC_DEBUG is not set
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/moxart_defconfig b/arch/arm/configs/moxart_defconfig
index a4c2bb37fe5a..082a38a14c12 100644
--- a/arch/arm/configs/moxart_defconfig
+++ b/arch/arm/configs/moxart_defconfig
@@ -121,7 +121,7 @@ CONFIG_KEYS=y
 CONFIG_CRC32_BIT=y
 CONFIG_DMA_API_DEBUG=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_KGDB=y
 CONFIG_DEBUG_PAGEALLOC=y
diff --git a/arch/arm/configs/mps2_defconfig b/arch/arm/configs/mps2_defconfig
index 0d3049208964..700568474549 100644
--- a/arch/arm/configs/mps2_defconfig
+++ b/arch/arm/configs/mps2_defconfig
@@ -94,7 +94,7 @@ CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_DEBUG_FS=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index eecec57260cd..c6dc1509bc77 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -307,7 +307,7 @@ CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=y
 CONFIG_CRC_CCITT=y
 CONFIG_LIBCRC32C=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index 202fd7a6abea..89699b015396 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -122,7 +122,7 @@ CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_SLUB_DEBUG is not set
 CONFIG_SCHEDSTATS=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index e31a1c5d9ffe..456457fa7d16 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -192,7 +192,7 @@ CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_2=y
 CONFIG_NLS_UTF8=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_CRYPTO_CBC=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=y
diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
index ea86d88cc3d4..68a18264f31b 100644
--- a/arch/arm/configs/mvebu_v7_defconfig
+++ b/arch/arm/configs/mvebu_v7_defconfig
@@ -147,7 +147,7 @@ CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_DEV_MARVELL_CESA=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_DEBUG_USER=y
diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index eb204eb98a42..b745cc6bb43f 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -162,7 +162,7 @@ CONFIG_CRC_ITU_T=m
 CONFIG_CRC7=m
 CONFIG_FONTS=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_FRAME_WARN=2048
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
index 1d0e47b2ae32..d5881de42018 100644
--- a/arch/arm/configs/nhk8815_defconfig
+++ b/arch/arm/configs/nhk8815_defconfig
@@ -135,7 +135,7 @@ CONFIG_CRYPTO_MD5=y
 CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_DES=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 0cb4a4f9445f..e7aab2d3dd55 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -229,7 +229,7 @@ CONFIG_NLS_KOI8_R=y
 CONFIG_NLS_UTF8=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_ECB=y
 CONFIG_CRYPTO_PCBC=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index db16d71592dd..99d015cf8919 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -726,7 +726,6 @@ CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_DEBUG_INFO_SPLIT=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/arm/configs/orion5x_defconfig b/arch/arm/configs/orion5x_defconfig
index 59cfda53b5c8..e3e97eea8cec 100644
--- a/arch/arm/configs/orion5x_defconfig
+++ b/arch/arm/configs/orion5x_defconfig
@@ -153,7 +153,7 @@ CONFIG_CRC_T10DIF=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_SLUB_DEBUG is not set
 CONFIG_LATENCYTOP=y
 # CONFIG_FTRACE is not set
diff --git a/arch/arm/configs/pxa168_defconfig b/arch/arm/configs/pxa168_defconfig
index 772d92905199..70d327895ccf 100644
--- a/arch/arm/configs/pxa168_defconfig
+++ b/arch/arm/configs/pxa168_defconfig
@@ -52,7 +52,7 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_DEBUG_PREEMPT is not set
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/arch/arm/configs/pxa255-idp_defconfig b/arch/arm/configs/pxa255-idp_defconfig
index eb0111ab3caf..b73ce035b20a 100644
--- a/arch/arm/configs/pxa255-idp_defconfig
+++ b/arch/arm/configs/pxa255-idp_defconfig
@@ -47,7 +47,7 @@ CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
 CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/pxa910_defconfig b/arch/arm/configs/pxa910_defconfig
index f04197f3da1f..5072bde71508 100644
--- a/arch/arm/configs/pxa910_defconfig
+++ b/arch/arm/configs/pxa910_defconfig
@@ -60,7 +60,7 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_DEBUG_PREEMPT is not set
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_USER=y
 CONFIG_DEBUG_LL=y
 CONFIG_DEBUG_MMP_UART2=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index ad9d1d764b54..d115f7e8aa36 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -701,7 +701,7 @@ CONFIG_NLS_ASCII=m
 CONFIG_NLS_ISO8859_1=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_TIMER_STATS=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_MANAGER=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index e7b9d6d6212e..8a59441701a8 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -310,7 +310,7 @@ CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SLUB_DEBUG is not set
diff --git a/arch/arm/configs/s3c2410_defconfig b/arch/arm/configs/s3c2410_defconfig
index 26d9c8410923..2789e96e4ef6 100644
--- a/arch/arm/configs/s3c2410_defconfig
+++ b/arch/arm/configs/s3c2410_defconfig
@@ -428,7 +428,7 @@ CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_NLS_UTF8=m
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_MUTEXES=y
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index fad45f32180d..300f5a7febf0 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -71,7 +71,7 @@ CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_CRAMFS=y
 CONFIG_ROMFS_FS=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_RT_MUTEXES=y
diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
index fa3ca4642719..789e900a8a08 100644
--- a/arch/arm/configs/s5pv210_defconfig
+++ b/arch/arm/configs/s5pv210_defconfig
@@ -115,7 +115,7 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRC_CCITT=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index 82932da2cec1..d91ae3f0d698 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -152,7 +152,7 @@ CONFIG_NFSD_V4=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_DETECT_HUNG_TASK=y
diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
index bcfef1c7befe..0227dd566c28 100644
--- a/arch/arm/configs/spear13xx_defconfig
+++ b/arch/arm/configs/spear13xx_defconfig
@@ -101,4 +101,4 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index a46fc0adb284..254d970a4011 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -81,4 +81,4 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
index a4d6470a0ed9..2809c4eb77e7 100644
--- a/arch/arm/configs/spear6xx_defconfig
+++ b/arch/arm/configs/spear6xx_defconfig
@@ -70,4 +70,4 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 0dbdf4d2f29f..1f5446cda8b6 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -74,7 +74,7 @@ CONFIG_NLS=y
 CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index ed4685589e38..71400af6cef4 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -343,7 +343,7 @@ CONFIG_CRYPTO_TWOFISH=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_SLAB=y
 CONFIG_DEBUG_VM=y
diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index 9722c237f600..4e3a0133e4d3 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -133,7 +133,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_DMA_CMA=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DETECT_HUNG_TASK=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a09501d64c0f..008a14bddab2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1317,7 +1317,7 @@ CONFIG_CRYPTO_DEV_HISI_HPRE=m
 CONFIG_CRYPTO_DEV_HISI_TRNG=m
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
