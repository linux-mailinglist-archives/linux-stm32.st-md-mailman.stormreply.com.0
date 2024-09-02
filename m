Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E5F9688DD
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 15:32:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E500FC78013;
	Mon,  2 Sep 2024 13:32:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FBC2C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725283928; x=1756819928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f+HzvJdgV9PfmdoJ0kwbhBMaeKBv9YJV29ZR+z0+n+c=;
 b=EYqJWErbQfklSEdDf/TgHi1OqUQT50BIYPeYVByTKeLXEAeVPJJgMUrr
 6nT5rdqOJ3WBcKUhkorey62OHpR38kt+J/c/F8N4QzUNPP4F4VZCwzjte
 FI783iCS4Z2Gm8TW/JIBBR5tbG05TgxgcEnyvLrAPHER1N27OwO+rB9T0
 2SC4NaNU27NUOo0p8h866RigNakYYKZ/UXQ1VSHNPC7uv6oRr862q0OpP
 CBS1SMYmDqll+nUvMHBwZtaeY4AQBUYul67dh1HXpOLiwoxCpjYaU6det
 /PMa9DuTyg+QBHRmowq3vg0xLCYMLLfSkeWpdR0cs0nd0T0ZmzBduYxz1 A==;
X-CSE-ConnectionGUID: X/rEoVoRQhKHvaDrnMAJLQ==
X-CSE-MsgGUID: xD4sYxJMTci0WamC8nIYAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35022560"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="35022560"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: 8M/PgchhQveOGHNJhOHeFw==
X-CSE-MsgGUID: 6hIwSaeFQmqwfnCItnBdhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65114778"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 669EC48D; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Sep 2024 16:30:43 +0300
Message-ID: <20240902133148.2569486-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 4/5] gpio: stmpe: Make use of device
	properties
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

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 7f2911c478ea..c1fb06925e09 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -11,8 +11,8 @@
 #include <linux/slab.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
-#include <linux/of.h>
 #include <linux/mfd/stmpe.h>
+#include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/bitops.h>
 
@@ -465,7 +465,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stmpe *stmpe = dev_get_drvdata(dev->parent);
-	struct device_node *np = dev->of_node;
 	struct stmpe_gpio *stmpe_gpio;
 	int ret, irq;
 
@@ -489,8 +488,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
                 stmpe_gpio->chip.dbg_show = stmpe_dbg_show;
 
-	of_property_read_u32(np, "st,norequest-mask",
-			&stmpe_gpio->norequest_mask);
+	device_property_read_u32(dev, "st,norequest-mask", &stmpe_gpio->norequest_mask);
 
 	ret = stmpe_enable(stmpe, STMPE_BLOCK_GPIO);
 	if (ret)
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
