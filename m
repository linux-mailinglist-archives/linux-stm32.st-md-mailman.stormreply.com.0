Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774B9688DA
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 15:32:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C22ECC7801A;
	Mon,  2 Sep 2024 13:32:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7CF5C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725283926; x=1756819926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BSXDsgKfV65tn6E/T8L5w0XQjbUaQBnlDePaCFf+QeQ=;
 b=EfoTAfyrkEVBObQJKDwprB3LLgN8vqgQQZuN4JI3qxvDCL/JegeoUMVU
 xCpqFEvLTt4vtzK2G/mcu0YGYJE77vaT8Tvfr43cm/sGtj5s0IIxKeh4L
 pbGN6uQng4fP9tZN3quHUZLzjwKvvljeRmmrL4Rnh80NZ+yyZ38FESkAH
 bSe0WJEfYtxFZUxPkeN+kkeWPPmvB9sQ7jXfMdzEBINtyyZ1aKXR418pX
 1LXmOLBsIJha9Jcw+i8iCzmUwr0/4mynN9xrk0rqoMbToc8tCwMjEsJGt
 GMjygWyHtDYUIhz/NzcqEZOnqidg/r0Cnho3L6PLaqLPDZvzrvqakh4/C w==;
X-CSE-ConnectionGUID: 3uVnYVzHT+uHYcgjRExoWg==
X-CSE-MsgGUID: c1Z8JHKnST+9p7SkOXRvEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41364556"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41364556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: Xo8z+4PHS7eblkAJoP8AUg==
X-CSE-MsgGUID: BkoQAzn0TTGgZ3P7+2BLEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64293993"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 792E4AF3; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Sep 2024 16:30:44 +0300
Message-ID: <20240902133148.2569486-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 5/5] gpio: stmpe: Sort headers
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

Sort the headers in alphabetic order in order to ease
the maintenance for this part.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index c1fb06925e09..75a3633ceddb 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -5,16 +5,16 @@
  * Author: Rabin Vincent <rabin.vincent@stericsson.com> for ST-Ericsson
  */
 
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <linux/gpio/driver.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/stmpe.h>
 #include <linux/property.h>
+#include <linux/platform_device.h>
 #include <linux/seq_file.h>
-#include <linux/bitops.h>
+#include <linux/slab.h>
 
 /*
  * These registers are modified under the irq bus lock and cached to avoid
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
