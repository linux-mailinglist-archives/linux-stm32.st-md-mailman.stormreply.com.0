Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B29688DC
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 15:32:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAE31C78020;
	Mon,  2 Sep 2024 13:32:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D450C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725283927; x=1756819927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7XH+G1Xb/vD8vf0GcakPf1WizXUz/rhT3tCc+q7JEcU=;
 b=PxUhzckeLq1MXjf+g8GG0H65X2Kcmq9zn4d5p490mMCNzM93cABcGap8
 V15IyErP7D4JQboaZPOTMn8euOkTmzDnTf+dWCO5pm4U7Q51+7ZsMg+qd
 RG/mvsqJTVQqZrNYo/EdKAOlXgU9L6t3vrB41kY17lBFpUwVaP7/MNzIS
 i7yc2daKJ1tsCA2HzDk+xKl9F8bgmdoHCN//IQXbdW2e4lei1VVxP8jc6
 MkqkwFhaKhTGrhPeShjSmGXwncHQ44wCLUhqgKTZksJK5oODfOYDfu7/d
 DGWPNdoCGV9oOhv7RTIXob3hayIpMMzvR5yLH/vbdxvmWU/gMe6FpzNDq w==;
X-CSE-ConnectionGUID: tmNXPKJ+Sw+uiwFZ3KEqSQ==
X-CSE-MsgGUID: ljndKHAvTzWv3iVrkUNk3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35022567"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="35022567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: M+jjVR5wQYCMPQ+GdDN7Yw==
X-CSE-MsgGUID: fmyiHwNASM6OuAbg2JE87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65114779"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 48B883BA; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Sep 2024 16:30:41 +0300
Message-ID: <20240902133148.2569486-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 2/5] gpio: stmpe: Remove unused 'dev'
	member of struct stmpe_gpio
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

There is no evidence that the 'dev' member of struct stmpe_gpio
is used, drop it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 4e171f9075bf..99f1482b2ab3 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -31,7 +31,6 @@ enum { LSB, CSB, MSB };
 struct stmpe_gpio {
 	struct gpio_chip chip;
 	struct stmpe *stmpe;
-	struct device *dev;
 	struct mutex irq_lock;
 	u32 norequest_mask;
 	/* Caches of interrupt control registers for bus_lock */
@@ -481,7 +480,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 
 	mutex_init(&stmpe_gpio->irq_lock);
 
-	stmpe_gpio->dev = &pdev->dev;
 	stmpe_gpio->stmpe = stmpe;
 	stmpe_gpio->chip = template_chip;
 	stmpe_gpio->chip.ngpio = stmpe->num_gpios;
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
