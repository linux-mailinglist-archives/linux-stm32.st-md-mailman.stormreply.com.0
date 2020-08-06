Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA923E042
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Aug 2020 20:21:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D88B0C36B3A;
	Thu,  6 Aug 2020 18:21:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3B9DC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Aug 2020 18:21:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43C5322CBB;
 Thu,  6 Aug 2020 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596738071;
 bh=gWYszA3rqYV5erGGQ6aQA0zIEaoB7n1mGCk9zgFoZXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AIR9gMTObfVKOk1mNw4+1PtKpiDvpZD872ty8wZ52lKCqk+nchkm9FWjkDoLRb9SX
 7oL2+EA4FLv9a3eLDkmMfSGrvp10LYrRawaish4kA220msiXFBhp8ekOrFAnl1k20s
 LCbmZGqoUOJNWT+pwqSMFKXeRUs1YZk9n6G0751c=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu,  6 Aug 2020 20:20:18 +0200
Message-Id: <20200806182059.2431-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/41] ARM: s3c: Remove unneeded machine
	header includes
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

Not all units use the contents of mach/hardware.h and
mach/dma.h.  Remove these includes when not needed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/bast-irq.c        | 1 -
 arch/arm/mach-s3c24xx/common-smdk.c     | 1 -
 arch/arm/mach-s3c24xx/h1940-bluetooth.c | 1 -
 arch/arm/mach-s3c24xx/mach-amlm5900.c   | 1 -
 arch/arm/mach-s3c24xx/mach-anubis.c     | 1 -
 arch/arm/mach-s3c24xx/mach-at2440evb.c  | 1 -
 arch/arm/mach-s3c24xx/mach-bast.c       | 1 -
 arch/arm/mach-s3c24xx/mach-gta02.c      | 1 -
 arch/arm/mach-s3c24xx/mach-mini2440.c   | 1 -
 arch/arm/mach-s3c24xx/mach-nexcoder.c   | 1 -
 arch/arm/mach-s3c24xx/mach-osiris.c     | 1 -
 arch/arm/mach-s3c24xx/mach-otom.c       | 1 -
 arch/arm/mach-s3c24xx/mach-qt2410.c     | 1 -
 arch/arm/mach-s3c24xx/mach-rx3715.c     | 1 -
 arch/arm/mach-s3c24xx/mach-smdk2410.c   | 1 -
 arch/arm/mach-s3c24xx/mach-smdk2440.c   | 1 -
 arch/arm/mach-s3c24xx/mach-smdk2443.c   | 1 -
 arch/arm/mach-s3c24xx/mach-tct_hammer.c | 1 -
 arch/arm/mach-s3c24xx/mach-vr1000.c     | 1 -
 arch/arm/mach-s3c24xx/mach-vstms.c      | 1 -
 arch/arm/mach-s3c24xx/pm-s3c2410.c      | 1 -
 arch/arm/mach-s3c24xx/pm-s3c2412.c      | 1 -
 arch/arm/mach-s3c24xx/s3c2440.c         | 1 -
 arch/arm/mach-s3c24xx/s3c2442.c         | 1 -
 arch/arm/mach-s3c24xx/setup-i2c.c       | 1 -
 arch/arm/mach-s3c24xx/setup-ts.c        | 1 -
 arch/arm/mach-s3c24xx/simtec-audio.c    | 1 -
 arch/arm/mach-s3c24xx/simtec-pm.c       | 2 --
 arch/arm/mach-s3c24xx/simtec-usb.c      | 1 -
 arch/arm/mach-s3c64xx/dev-audio.c       | 1 -
 arch/arm/plat-samsung/devs.c            | 1 -
 31 files changed, 32 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/bast-irq.c b/arch/arm/mach-s3c24xx/bast-irq.c
index 03728058d58d..03209fefa5db 100644
--- a/arch/arm/mach-s3c24xx/bast-irq.c
+++ b/arch/arm/mach-s3c24xx/bast-irq.c
@@ -15,7 +15,6 @@
 #include <asm/mach-types.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-irq.h>
 
 #include "bast.h"
diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 75064dfaceb1..c0c176651f96 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -29,7 +29,6 @@
 #include <asm/mach/irq.h>
 
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 
 #include <mach/regs-gpio.h>
diff --git a/arch/arm/mach-s3c24xx/h1940-bluetooth.c b/arch/arm/mach-s3c24xx/h1940-bluetooth.c
index 186b5321658e..8533e7521b50 100644
--- a/arch/arm/mach-s3c24xx/h1940-bluetooth.c
+++ b/arch/arm/mach-s3c24xx/h1940-bluetooth.c
@@ -14,7 +14,6 @@
 #include <linux/rfkill.h>
 
 #include <plat/gpio-cfg.h>
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c24xx/mach-amlm5900.c
index 623c320f8253..6324e608dcda 100644
--- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
+++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
@@ -26,7 +26,6 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/flash.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 #include <mach/fb.h>
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 44338dfb5470..753a314f4493 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -24,7 +24,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 02ac2e240bd7..6da4dcfd5c0f 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -24,7 +24,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/fb.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index cd67d00a46e4..9eef0f80175f 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -41,7 +41,6 @@
 #include <asm/mach-types.h>
 
 #include <mach/fb.h>
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 81d94a75d1c2..346a158f9960 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -58,7 +58,6 @@
 #include <linux/platform_data/usb-s3c2410_udc.h>
 
 #include <mach/fb.h>
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-irq.h>
 #include <mach/gpio-samsung.h>
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 936f7e3b7213..5bfe9ef62716 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -30,7 +30,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/hardware.h>
 #include <mach/fb.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c24xx/mach-nexcoder.c
index 92ecc15c4320..5385437ef464 100644
--- a/arch/arm/mach-s3c24xx/mach-nexcoder.c
+++ b/arch/arm/mach-s3c24xx/mach-nexcoder.c
@@ -28,7 +28,6 @@
 #include <asm/mach/irq.h>
 
 #include <asm/setup.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index ed03928dffe4..03595144126b 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -41,7 +41,6 @@
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/mach-otom.c
index d65c65ca1a38..e7eec5ccddb3 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -22,7 +22,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 2f3c8b31a08a..4ac3d0531992 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -28,7 +28,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index 740865ef8e23..617392de01ac 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -35,7 +35,6 @@
 #include <asm/mach-types.h>
 
 #include <mach/fb.h>
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2410.c b/arch/arm/mach-s3c24xx/mach-smdk2410.c
index 1c2f20ab0520..1d4d8735f283 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2410.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2410.c
@@ -24,7 +24,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index ebc184cd9aba..bd6a35105518 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -23,7 +23,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index dcc4e446938a..8a1f2580c6c7 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -22,7 +22,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-tct_hammer.c b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
index e334ddf0832f..fd51a098e443 100644
--- a/arch/arm/mach-s3c24xx/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
@@ -24,7 +24,6 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/flash.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24xx/mach-vr1000.c
index 2f00217fa44e..638e53ec1e4f 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -35,7 +35,6 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index 9f479e28b8fd..f0acbaa6dfd6 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -24,7 +24,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-s3c24xx/pm-s3c2410.c b/arch/arm/mach-s3c24xx/pm-s3c2410.c
index 2d8ea701380a..ffd0d6c2324f 100644
--- a/arch/arm/mach-s3c24xx/pm-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/pm-s3c2410.c
@@ -16,7 +16,6 @@
 
 #include <asm/mach-types.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 
diff --git a/arch/arm/mach-s3c24xx/pm-s3c2412.c b/arch/arm/mach-s3c24xx/pm-s3c2412.c
index 2dfdaab0aa1f..b1d0ad07301b 100644
--- a/arch/arm/mach-s3c24xx/pm-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/pm-s3c2412.c
@@ -19,7 +19,6 @@
 #include <asm/cacheflush.h>
 #include <asm/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2440.c b/arch/arm/mach-s3c24xx/s3c2440.c
index 451d9851b0a7..bbe1f9cf5cf0 100644
--- a/arch/arm/mach-s3c24xx/s3c2440.c
+++ b/arch/arm/mach-s3c24xx/s3c2440.c
@@ -23,7 +23,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
 #include <asm/irq.h>
 
diff --git a/arch/arm/mach-s3c24xx/s3c2442.c b/arch/arm/mach-s3c24xx/s3c2442.c
index 432d68325c9d..5b8751506d02 100644
--- a/arch/arm/mach-s3c24xx/s3c2442.c
+++ b/arch/arm/mach-s3c24xx/s3c2442.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
diff --git a/arch/arm/mach-s3c24xx/setup-i2c.c b/arch/arm/mach-s3c24xx/setup-i2c.c
index 1a01d44b5910..1be5372e0261 100644
--- a/arch/arm/mach-s3c24xx/setup-i2c.c
+++ b/arch/arm/mach-s3c24xx/setup-i2c.c
@@ -12,7 +12,6 @@ struct platform_device;
 
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/i2c-s3c2410.h>
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 
diff --git a/arch/arm/mach-s3c24xx/setup-ts.c b/arch/arm/mach-s3c24xx/setup-ts.c
index 272d65400b71..65ec67e0759f 100644
--- a/arch/arm/mach-s3c24xx/setup-ts.c
+++ b/arch/arm/mach-s3c24xx/setup-ts.c
@@ -13,7 +13,6 @@ struct platform_device; /* don't need the contents */
 #include <linux/platform_data/touchscreen-s3c2410.h>
 
 #include <plat/gpio-cfg.h>
-#include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
 
 /**
diff --git a/arch/arm/mach-s3c24xx/simtec-audio.c b/arch/arm/mach-s3c24xx/simtec-audio.c
index 12e17f82dae3..cfe78bf8cc9b 100644
--- a/arch/arm/mach-s3c24xx/simtec-audio.c
+++ b/arch/arm/mach-s3c24xx/simtec-audio.c
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
diff --git a/arch/arm/mach-s3c24xx/simtec-pm.c b/arch/arm/mach-s3c24xx/simtec-pm.c
index c19074d81389..bc939dfce488 100644
--- a/arch/arm/mach-s3c24xx/simtec-pm.c
+++ b/arch/arm/mach-s3c24xx/simtec-pm.c
@@ -19,8 +19,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/hardware.h>
-
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c24xx/simtec-usb.c b/arch/arm/mach-s3c24xx/simtec-usb.c
index dc1016ffed94..3488988316a8 100644
--- a/arch/arm/mach-s3c24xx/simtec-usb.c
+++ b/arch/arm/mach-s3c24xx/simtec-usb.c
@@ -23,7 +23,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
 #include <asm/irq.h>
 
diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64xx/dev-audio.c
index e3c49b5d1355..1d3124db6afc 100644
--- a/arch/arm/mach-s3c64xx/dev-audio.c
+++ b/arch/arm/mach-s3c64xx/dev-audio.c
@@ -12,7 +12,6 @@
 
 #include <mach/irqs.h>
 #include <mach/map.h>
-#include <mach/dma.h>
 
 #include <plat/devs.h>
 #include <linux/platform_data/asoc-s3c.h>
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 089a17687104..2ed3ef604a25 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -37,7 +37,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/dma.h>
 #include <mach/irqs.h>
 #include <mach/map.h>
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
