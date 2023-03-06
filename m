Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F566AFF48
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AC40C6B44D;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBED3C6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132542; x=1709668542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dt4pdLMszFVaAbdqwI08UXnnW0vBxyo1Sqmq45vpnHo=;
 b=Hq0zVvXV6cEPsqiJgOBVD2orcN10oz1huxUjKMqSoZLsZyc7M3+/bz7E
 SjJd/ivdQDxIu4JRfpj1m5c9OVi2xFmE294Aig4+JZYWO4n92zBxKbZ3t
 zO/GbFh1DO3GUiBt8a56rUatobFy4oyO4rD2YHq7VGcLzzUE2nkwwt9vQ
 RmxjEiUJrmmhxCf1wdmmfnMFoOjGzWU9Rp5wOzFJc7I7o3hwrtybMwDTc
 Y2zUjy22WGSJlTrc/NPdtc1rMFOTPFENluui0srG/c/JNcXxKZbdrzcHL
 xQH/RsMDEfg11HSMuyHlmJKKPzFSH3z+VYNBihgwRpjl9CHJg/NEMJBQA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398240786"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="398240786"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819423558"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="819423558"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2023 11:55:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7A2E93CB; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:45 +0200
Message-Id: <20230306195556.55475-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [Linux-stm32] [PATCH v1 05/16] gpiolib: Utilize helpers from
	string_choices.h
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

There are a few helpers available to convert a boolean variable
to the dedicated string literals depending on the application.
Use them in the driver.

While at, utilize specifier field for padding the strings where
it's required.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-sysfs.c |  3 ++-
 drivers/gpio/gpiolib.c       | 13 ++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c1cbf71329f0..54dc53b74dc4 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -82,7 +83,7 @@ static ssize_t direction_show(struct device *dev,
 
 	mutex_unlock(&data->mutex);
 
-	return sysfs_emit(buf, "%s\n", value ? "out" : "in");
+	return sysfs_emit(buf, "%s\n", str_out_in(value));
 }
 
 static ssize_t direction_store(struct device *dev,
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 700195a1faae..b554ad435245 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -20,6 +20,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -4198,6 +4199,8 @@ EXPORT_SYMBOL_GPL(gpiod_get_index_optional);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 	      unsigned long lflags, enum gpiod_flags dflags)
 {
+	bool out = dflags & GPIOD_FLAGS_BIT_DIR_OUT;
+	bool hi = dflags & GPIOD_FLAGS_BIT_DIR_VAL;
 	struct gpio_chip *gc;
 	struct gpio_desc *local_desc;
 	int hwnum;
@@ -4218,10 +4221,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	/* Mark GPIO as hogged so it can be identified and removed later */
 	set_bit(FLAG_IS_HOGGED, &desc->flags);
 
-	gpiod_info(desc, "hogged as %s%s\n",
-		(dflags & GPIOD_FLAGS_BIT_DIR_OUT) ? "output" : "input",
-		(dflags & GPIOD_FLAGS_BIT_DIR_OUT) ?
-		  (dflags & GPIOD_FLAGS_BIT_DIR_VAL) ? "/high" : "/low" : "");
+	gpiod_info(desc, "hogged as %s/%s\n", str_output_input(out), out ? str_high_low(hi) : "?");
 
 	return 0;
 }
@@ -4509,10 +4509,9 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 			value = gpio_chip_get_value(gc, desc);
 			is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
 			active_low = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
-			seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s%s\n",
+			seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %-3.3s %-2.2s %s%s\n",
 				   gpio, desc->name ?: "", desc->label,
-				   is_out ? "out" : "in ",
-				   value >= 0 ? (value ? "hi" : "lo") : "?  ",
+				   str_out_in(is_out), value < 0 ? "?" : str_hi_lo(value),
 				   is_irq ? "IRQ " : "",
 				   active_low ? "ACTIVE LOW" : "");
 		} else if (desc->name) {
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
