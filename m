Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3157CD0D
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 16:14:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39F0CC640F0;
	Thu, 21 Jul 2022 14:14:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1112EC640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 14:14:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0ADCC61F82;
 Thu, 21 Jul 2022 14:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AEEC341CF;
 Thu, 21 Jul 2022 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658412883;
 bh=/vCEI1AOH7tR3gZ6O+JPQGMF/sAoVLZ3uWMA0Iwt7XE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HpAfec0gFYqrVoSkCO4sXEAZJj6a7nlvE9MtI6Bg2ZjZhO6xVNE5quhHoG9li1pjF
 dGObm8xrzgq4ef8BeBWO9p0Y3XnwDJ71BuO+mZqCa4gQaN28AnWIjM0fqBQ26CKh1i
 fFUV5YrvKJZ0MPXfwtZMAsEiYHOEHSmrqqLMz6oBwgK2XiplJwIP/279I8/8/fWfsK
 UJCNwGf+jgv3N07sbLEucaE472RJauzJvp7ZbQT3qINfcJn3zwzntEBwzWDHWGNPSw
 yRH3zSGjDl53RqZJvdkqUsW/avaFiy4vRQI5KRxGCXi7g/ybxdkaafzM/nP3mm7qpF
 I6uhohtuiVY/g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 21 Jul 2022 16:13:25 +0200
Message-Id: <20220721141325.2413920-7-arnd@kernel.org>
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
Subject: [Linux-stm32] [PATCH 6/6] ARM: defconfig: kill remnants of
	CONFIG_LEDS
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

CONFIG_LEDS was replaced by CONFIG_NEW_LEDS over ten years ago with commit
fa8bbb13ab49 ("ARM: use new LEDS CPU trigger stub to replace old one"),
but some defconfig files still reference it.

Replace it and its sub-options with the corresponding new versions.

Some of these machines may not actually have a new-style LED driver,
and I did not check them individually as most of the machines are
going away soon anyway.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/assabet_defconfig    | 6 ++++--
 arch/arm/configs/cerfcube_defconfig   | 6 ++++--
 arch/arm/configs/footbridge_defconfig | 6 ++++--
 arch/arm/configs/hackkit_defconfig    | 6 ++++--
 arch/arm/configs/lart_defconfig       | 6 ++++--
 arch/arm/configs/lubbock_defconfig    | 6 ++++--
 arch/arm/configs/mainstone_defconfig  | 6 ++++--
 arch/arm/configs/neponset_defconfig   | 6 ++++--
 arch/arm/configs/netwinder_defconfig  | 6 ++++--
 arch/arm/configs/omap1_defconfig      | 1 -
 arch/arm/configs/pxa255-idp_defconfig | 6 ++++--
 arch/arm/configs/simpad_defconfig     | 3 ++-
 12 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/arch/arm/configs/assabet_defconfig b/arch/arm/configs/assabet_defconfig
index da5284a8f374..801383e4135d 100644
--- a/arch/arm/configs/assabet_defconfig
+++ b/arch/arm/configs/assabet_defconfig
@@ -3,8 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_ASSABET=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="mem=32M console=ttySA0,38400n8 initrd=0xc0800000,3M root=/dev/ram"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
@@ -42,6 +40,10 @@ CONFIG_FB=y
 CONFIG_FB_SA1100=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_SOUND=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_TMPFS=y
diff --git a/arch/arm/configs/cerfcube_defconfig b/arch/arm/configs/cerfcube_defconfig
index c42e39b011df..d4f3f9a8cd97 100644
--- a/arch/arm/configs/cerfcube_defconfig
+++ b/arch/arm/configs/cerfcube_defconfig
@@ -4,8 +4,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_CERF=y
 CONFIG_SA1100_CERF_FLASH_16MB=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="console=ttySA0,38400 root=/dev/mtdblock3 rootfstype=jffs2 rw mem=32M init=/linuxrc"
 CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=m
@@ -46,6 +44,10 @@ CONFIG_SERIAL_SA1100_CONSOLE=y
 CONFIG_WATCHDOG=y
 CONFIG_SA1100_WATCHDOG=m
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=m
 CONFIG_EXT3_FS=m
 CONFIG_MSDOS_FS=m
diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
index af7d3120cc9c..5c0c88ce9bc5 100644
--- a/arch/arm/configs/footbridge_defconfig
+++ b/arch/arm/configs/footbridge_defconfig
@@ -8,8 +8,6 @@ CONFIG_ARCH_FOOTBRIDGE=y
 CONFIG_ARCH_CATS=y
 CONFIG_ARCH_EBSA285_HOST=y
 CONFIG_ARCH_NETWINDER=y
-CONFIG_LEDS=y
-CONFIG_LEDS_TIMER=y
 CONFIG_FPE_NWFPE=y
 CONFIG_FPE_NWFPE_XP=y
 CONFIG_BINFMT_AOUT=y
@@ -91,6 +89,10 @@ CONFIG_SOUND=m
 CONFIG_USB=m
 CONFIG_USB_MON=m
 CONFIG_USB_PRINTER=m
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_EXT2_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_ISO9660_FS=m
diff --git a/arch/arm/configs/hackkit_defconfig b/arch/arm/configs/hackkit_defconfig
index e0ea332a4cf4..19bc294c2767 100644
--- a/arch/arm/configs/hackkit_defconfig
+++ b/arch/arm/configs/hackkit_defconfig
@@ -3,8 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_HACKKIT=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="console=ttySA0,115200 root=/dev/ram0 initrd=0xc0400000,8M init=/rootshell"
 CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
 CONFIG_FPE_NWFPE=y
@@ -31,6 +29,10 @@ CONFIG_DUMMY=y
 CONFIG_SERIAL_SA1100=y
 CONFIG_SERIAL_SA1100_CONSOLE=y
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
diff --git a/arch/arm/configs/lart_defconfig b/arch/arm/configs/lart_defconfig
index 76ea89716184..3dad6adabb43 100644
--- a/arch/arm/configs/lart_defconfig
+++ b/arch/arm/configs/lart_defconfig
@@ -3,8 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_LART=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="console=ttySA0,9600 root=/dev/ram"
 CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
@@ -37,6 +35,10 @@ CONFIG_SERIAL_SA1100=y
 CONFIG_SERIAL_SA1100_CONSOLE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_SOUND=m
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=m
 CONFIG_REISERFS_FS=m
diff --git a/arch/arm/configs/lubbock_defconfig b/arch/arm/configs/lubbock_defconfig
index 95e937379a62..ca226bce5025 100644
--- a/arch/arm/configs/lubbock_defconfig
+++ b/arch/arm/configs/lubbock_defconfig
@@ -3,8 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_LUBBOCK=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="root=/dev/nfs ip=bootp console=ttyS0,115200 mem=64M"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
@@ -37,6 +35,10 @@ CONFIG_SERIAL_PXA_CONSOLE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_USB_GADGET=y
 CONFIG_USB_G_SERIAL=m
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_JFFS2_FS=y
diff --git a/arch/arm/configs/mainstone_defconfig b/arch/arm/configs/mainstone_defconfig
index f5c271631633..dc1a88ed4de4 100644
--- a/arch/arm/configs/mainstone_defconfig
+++ b/arch/arm/configs/mainstone_defconfig
@@ -3,8 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_MAINSTONE=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="root=/dev/nfs ip=bootp console=ttyS0,115200 mem=64M"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
@@ -35,6 +33,10 @@ CONFIG_FB_PXA=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_JFFS2_FS=y
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index bc70ca29a166..907403529e30 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -4,8 +4,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_ASSABET=y
 CONFIG_ASSABET_NEPONSET=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
@@ -70,6 +68,10 @@ CONFIG_USB=m
 CONFIG_USB_MON=m
 CONFIG_USB_OHCI_HCD=m
 CONFIG_USB_STORAGE=m
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_MSDOS_FS=m
 CONFIG_VFAT_FS=m
diff --git a/arch/arm/configs/netwinder_defconfig b/arch/arm/configs/netwinder_defconfig
index d870524e87bf..cf7bbcf9d98a 100644
--- a/arch/arm/configs/netwinder_defconfig
+++ b/arch/arm/configs/netwinder_defconfig
@@ -2,8 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_ARCH_FOOTBRIDGE=y
 CONFIG_ARCH_NETWINDER=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_DEPRECATED_PARAM_STRUCT=y
 CONFIG_CMDLINE="root=0x801"
 CONFIG_FPE_NWFPE=y
@@ -58,6 +56,10 @@ CONFIG_SOUND_TRACEINIT=y
 CONFIG_SOUND_DMAP=y
 CONFIG_SOUND_YM3812=y
 CONFIG_SOUND_WAVEARTIST=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index e10febef3c43..3f72d2ff7644 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -41,7 +41,6 @@ CONFIG_MACH_NOKIA770=y
 CONFIG_MACH_AMS_DELTA=y
 CONFIG_MACH_OMAP_GENERIC=y
 CONFIG_AEABI=y
-CONFIG_LEDS=y
 CONFIG_CMDLINE="root=1f03 rootfstype=jffs2"
 CONFIG_FPE_NWFPE=y
 # CONFIG_SUSPEND is not set
diff --git a/arch/arm/configs/pxa255-idp_defconfig b/arch/arm/configs/pxa255-idp_defconfig
index feb840102a05..d141cc786145 100644
--- a/arch/arm/configs/pxa255-idp_defconfig
+++ b/arch/arm/configs/pxa255-idp_defconfig
@@ -3,8 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_PXA_IDP=y
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="root=/dev/nfs ip=dhcp console=ttyS0,115200 mem=64M"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
@@ -36,6 +34,10 @@ CONFIG_FB_PXA=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_JFFS2_FS=y
diff --git a/arch/arm/configs/simpad_defconfig b/arch/arm/configs/simpad_defconfig
index b81e5decd147..7956f0da0bf9 100644
--- a/arch/arm/configs/simpad_defconfig
+++ b/arch/arm/configs/simpad_defconfig
@@ -7,7 +7,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_KALLSYMS_EXTRA_PASS=y
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_SIMPAD=y
-CONFIG_LEDS=y
 CONFIG_CMDLINE="mtdparts=sa1100:512k(boot),1m(kernel),-(root) console=ttySA0 root=1f02 noinitrd mem=64M jffs2_orphaned_inodes=delete rootfstype=jffs2"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
@@ -75,6 +74,8 @@ CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
 CONFIG_EXT2_FS=m
 CONFIG_EXT3_FS=m
 CONFIG_REISERFS_FS=m
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
