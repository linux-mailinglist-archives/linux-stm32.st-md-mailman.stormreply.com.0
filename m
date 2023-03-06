Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F46AFF47
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DE2CC6B446;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67D94C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132541; x=1709668541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDvZyVrBDVc7Nwzs9i+qoHy3DJw3++NSTTOOF+lSAxI=;
 b=Djioo/Sfb6eJHXVwm2bWrmGPP53dC6fnbObBHXTF5oty9yk3jDj53Xq4
 GF3DOVrTtOo1kxOBuRPOzInvgwyYIiNXXozpWVg9jJJ7/+QVa4xDiHk+C
 smZQnNUwRImtZbH3IgCQytofuKoghftMYZL6Yf7aHHVZjL3S5PTFTQpHx
 29V1/+kpP8ASwY1bjykRZDLMSV71lD6E10c/EPLTvEt5ojrMISe2pbr47
 3xG4wew4dbXMU3qBGAHydQFTkj+ySyJ4eUB1bt/i7euWUTcHTfji5J0/V
 qpNs6U+VMa+EX2RKoQ0Ik1YFPWsHMQdPbLVscUd4MjOTvI0lbf/se/jK2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400483932"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="400483932"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005549582"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="1005549582"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 11:55:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C33FB5F8; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:52 +0200
Message-Id: <20230306195556.55475-13-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v1 12/16] gpio: stmpe: Utilize helpers from
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
 drivers/gpio/gpio-stmpe.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 0fa4f0a93378..ca8a98b252c2 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/stmpe.h>
 #include <linux/seq_file.h>
 #include <linux/bitops.h>
+#include <linux/string_choices.h>
 
 /*
  * These registers are modified under the irq bus lock and cached to avoid
@@ -264,12 +265,12 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 	ret = stmpe_reg_read(stmpe, dir_reg);
 	if (ret < 0)
 		return;
-	dir = !!(ret & mask);
 
+	dir = !!(ret & mask);
+	seq_printf(s, " gpio-%-3d (%-20.20s) %-3.3s %-2.2s ", gpio,
+		   label ?: "(none)", str_out_in(dir), str_hi_lo(val));
 	if (dir) {
-		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
-			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo");
+		seq_putc(s, '\n');
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -336,11 +337,9 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 			return;
 		irqen = !!(ret & mask);
 
-		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
-			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo",
+		seq_printf(s, "%13s IRQ-%9s %25s %25s\n",
 			   edge_det_values[edge_det],
-			   irqen ? "IRQ-enabled" : "IRQ-disabled",
+			   str_enabled_disabled(irqen),
 			   rise_values[rise],
 			   fall_values[fall]);
 	}
@@ -351,10 +350,8 @@ static void stmpe_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 	unsigned i;
 	unsigned gpio = gc->base;
 
-	for (i = 0; i < gc->ngpio; i++, gpio++) {
+	for (i = 0; i < gc->ngpio; i++, gpio++)
 		stmpe_dbg_show_one(s, gc, i, gpio);
-		seq_putc(s, '\n');
-	}
 }
 
 static struct irq_chip stmpe_gpio_irq_chip = {
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
