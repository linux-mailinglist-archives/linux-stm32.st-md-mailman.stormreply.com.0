Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A676AFF45
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F930C6A61C;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C05CCC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132536; x=1709668536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tShFWIVCdDeqrNoh0yuO5Gnio4e4ieLf0f/Lj6I9KNA=;
 b=iWklsGNCdF7Ojl6Kg8e0oXm2Nx7aPDdgCHsQh1fJKxL2Lh07gg47Kq2d
 8VFTbdrUsY+CgTuyiHJjAfsTEsKMEdWtODqG18yOTPLl0y3/klNgkON2K
 tx91bJ0jUUXz0eZ91VDs8cSwEvvTaWoCvt5V8P1+fIqgc8/G8hMi1bf0b
 DHAH5CdwLW4rSqvf91WpJYwMbI0Re5I7sLtOYFXoDG7T9HPyG4VRhYKrQ
 riZgxayVbjdEHRGLIijYZB17T8YZSitikw8Hbn4XUI9iP0jTdpCgL0etm
 18IKiTRXw7QZxzpiHTdeeHFPd7sYjRHNtB34bLPBu9ZJvye5npleBB/Vb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400483870"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="400483870"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005549565"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="1005549565"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 11:55:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8366246E; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:46 +0200
Message-Id: <20230306195556.55475-7-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v1 06/16] gpio: adnp: Utilize helpers from
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
 drivers/gpio/gpio-adnp.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index a6439e3daff0..823cad855ee8 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -11,6 +11,7 @@
 #include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #define GPIO_DDR(gpio) (0x00 << (gpio)->reg_shift)
 #define GPIO_PLR(gpio) (0x01 << (gpio)->reg_shift)
@@ -211,25 +212,12 @@ static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		for (j = 0; j < 8; j++) {
 			unsigned int bit = (i << adnp->reg_shift) + j;
-			const char *direction = "input ";
-			const char *level = "low ";
-			const char *interrupt = "disabled";
-			const char *pending = "";
 
-			if (ddr & BIT(j))
-				direction = "output";
-
-			if (plr & BIT(j))
-				level = "high";
-
-			if (ier & BIT(j))
-				interrupt = "enabled ";
-
-			if (isr & BIT(j))
-				pending = "pending";
-
-			seq_printf(s, "%2u: %s %s IRQ %s %s\n", bit,
-				   direction, level, interrupt, pending);
+			seq_printf(s, "%2u: %-6.6s %-4.4s IRQ %-8.8s %s\n", bit,
+				   str_output_input(ddr & BIT(j)),
+				   str_high_low(plr & BIT(j)),
+				   str_enabled_disabled(ier & BIT(j)),
+				   (isr & BIT(j)) ? "pending" : "");
 		}
 	}
 
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
