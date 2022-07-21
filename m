Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093657CD0C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 16:14:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23D80C640F0;
	Thu, 21 Jul 2022 14:14:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 043B5C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 14:14:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E625161F88;
 Thu, 21 Jul 2022 14:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5263BC341CB;
 Thu, 21 Jul 2022 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658412873;
 bh=cumhFmiays6TgZn0Zbw4CIMaOn7fmgsmxtoEhW9GssQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EiKveYT1xR/XvhPQJm3YQzkFARd2ROKHB/W7LCb1ggEsNtQ5WxOa6MJWcKSpuCIrx
 p6mP8ZHA3NxG5wmxqhlmeHjzV0o81VEKRoXC+w5nXFz3Dmxpm1XAWR/4fJv/SNRmKw
 rvDvf8B8oUn0RP5BtPB1wGL4zq1M2C3H5KEECPxRjyTaOANRHvvPz2r9tRq04ekQor
 ccozx1/y/512WpZ6d0SyhkKO9JKs+Hk/jadr2fcsphaoQqFzKcPW8z8ftn3Kihu8Ga
 5vrvrg6VP96PKVPtrc/ebo4gj+Ztje20kfHcTmFGU/djAlT8iOtVUp/Z31ty7UPe5r
 Y4HhnnCDlx0RA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 21 Jul 2022 16:13:24 +0200
Message-Id: <20220721141325.2413920-6-arnd@kernel.org>
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
Subject: [Linux-stm32] [PATCH 5/6] ARM: defconfig: remove broken
	CONFIG_THUMB disables
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

Since commit 1515b186c235 ("ARM: make configuration of userspace
Thumb support an expert option"), CONFIG_THUMB cannot be disabled
unless one turns on CONFIG_EXPERT first.

This is probably for the better, so remove the statements that
turn it off.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/eseries_pxa_defconfig | 1 -
 arch/arm/configs/iop32x_defconfig      | 1 -
 arch/arm/configs/ixp4xx_defconfig      | 1 -
 arch/arm/configs/lpd270_defconfig      | 1 -
 arch/arm/configs/lubbock_defconfig     | 1 -
 arch/arm/configs/mainstone_defconfig   | 1 -
 arch/arm/configs/omap1_defconfig       | 1 -
 arch/arm/configs/pxa255-idp_defconfig  | 1 -
 8 files changed, 8 deletions(-)

diff --git a/arch/arm/configs/eseries_pxa_defconfig b/arch/arm/configs/eseries_pxa_defconfig
index b8994bff3f62..f76432fbc3af 100644
--- a/arch/arm/configs/eseries_pxa_defconfig
+++ b/arch/arm/configs/eseries_pxa_defconfig
@@ -6,7 +6,6 @@ CONFIG_EXPERT=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_PXA_ESERIES=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_IWMMXT=y
 CONFIG_AEABI=y
 CONFIG_KEXEC=y
diff --git a/arch/arm/configs/iop32x_defconfig b/arch/arm/configs/iop32x_defconfig
index e4c563182dea..3bc51fb4ebc9 100644
--- a/arch/arm/configs/iop32x_defconfig
+++ b/arch/arm/configs/iop32x_defconfig
@@ -9,7 +9,6 @@ CONFIG_MACH_GLANTANK=y
 CONFIG_ARCH_IQ80321=y
 CONFIG_ARCH_IQ31244=y
 CONFIG_MACH_N2100=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_CMDLINE="console=ttyS0,115200 root=/dev/nfs ip=bootp cachepolicy=writealloc"
 CONFIG_FPE_NWFPE=y
 CONFIG_BINFMT_AOUT=y
diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 960978a23d16..6b65ac2a72e7 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -8,7 +8,6 @@ CONFIG_INITRAMFS_COMPRESSION_XZ=y
 CONFIG_EXPERT=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_IXP4XX=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_CPU_BIG_ENDIAN=y
 CONFIG_AEABI=y
 CONFIG_CMDLINE="console=ttyS0,115200"
diff --git a/arch/arm/configs/lpd270_defconfig b/arch/arm/configs/lpd270_defconfig
index b43938e30d77..fb74b0fc4761 100644
--- a/arch/arm/configs/lpd270_defconfig
+++ b/arch/arm/configs/lpd270_defconfig
@@ -3,7 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_LOGICPD_PXA270=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_CMDLINE="root=/dev/nfs ip=bootp console=ttyS0,115200 mem=64M"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
diff --git a/arch/arm/configs/lubbock_defconfig b/arch/arm/configs/lubbock_defconfig
index 2b1aec0afba0..95e937379a62 100644
--- a/arch/arm/configs/lubbock_defconfig
+++ b/arch/arm/configs/lubbock_defconfig
@@ -3,7 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_LUBBOCK=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_LEDS=y
 CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="root=/dev/nfs ip=bootp console=ttyS0,115200 mem=64M"
diff --git a/arch/arm/configs/mainstone_defconfig b/arch/arm/configs/mainstone_defconfig
index 6aac785c5696..f5c271631633 100644
--- a/arch/arm/configs/mainstone_defconfig
+++ b/arch/arm/configs/mainstone_defconfig
@@ -3,7 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_MAINSTONE=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_LEDS=y
 CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="root=/dev/nfs ip=bootp console=ttyS0,115200 mem=64M"
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index e7aab2d3dd55..e10febef3c43 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -40,7 +40,6 @@ CONFIG_MACH_SX1=y
 CONFIG_MACH_NOKIA770=y
 CONFIG_MACH_AMS_DELTA=y
 CONFIG_MACH_OMAP_GENERIC=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_AEABI=y
 CONFIG_LEDS=y
 CONFIG_CMDLINE="root=1f03 rootfstype=jffs2"
diff --git a/arch/arm/configs/pxa255-idp_defconfig b/arch/arm/configs/pxa255-idp_defconfig
index b73ce035b20a..feb840102a05 100644
--- a/arch/arm/configs/pxa255-idp_defconfig
+++ b/arch/arm/configs/pxa255-idp_defconfig
@@ -3,7 +3,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_PXA_IDP=y
-# CONFIG_ARM_THUMB is not set
 CONFIG_LEDS=y
 CONFIG_LEDS_CPU=y
 CONFIG_CMDLINE="root=/dev/nfs ip=dhcp console=ttyS0,115200 mem=64M"
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
