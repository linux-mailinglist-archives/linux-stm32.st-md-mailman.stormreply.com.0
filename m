Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D018A95EDB9
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 11:53:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 980E4C7801B;
	Mon, 26 Aug 2024 09:53:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A9AC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724665993; x=1756201993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FM0aUTLDtyB6gqzlabbXPTBd7yBelmI/W35+tx3U+aE=;
 b=Cs8pqdxK2L4pDy/WyF0ficHi0yEK1oW8kIHDjMT5pgPUXj63UmWwRbQQ
 hI0YJm+xEZsoxJgRQnXe3aNpg1Vu9L/izrMyAfigvqx5KiofCwKYvMmff
 MT8wHIfXjSDYEFOXIdnv2mmK0NDUB9/7y5eozScd6e1ldZi+MGVtLe3Pf
 0Q7DKj2fas0FHSnHf0HfSpunbT9/VzrDy1L9yYJE7hzMRM3VK2Hg/49A1
 sZeUOB9mqWojjCPDjlRqsTXdDjItiM5hxduHMyomV4ggutAqId1o7RKd8
 +5dWOkl9NbafPn/2yikWPXEqcoHJpUgeNX+GK4u5VCJUa7o4cHVO2zBGc A==;
X-CSE-ConnectionGUID: FOzfWfHbRS6a+NpmPu54uQ==
X-CSE-MsgGUID: EtahNJtrQI24BFHdOqCzYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="40548501"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="40548501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:53:11 -0700
X-CSE-ConnectionGUID: rUaLih7UTVWeA32VhCL20Q==
X-CSE-MsgGUID: U5e3Kgi+S5SFPDGvTftcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62295820"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 26 Aug 2024 02:53:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7715A502; Mon, 26 Aug 2024 12:53:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Aug 2024 12:53:06 +0300
Message-ID: <20240826095306.1420628-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 1/1] pinctrl: stmfx: Use string_choices API
	instead of ternary operator
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

Use modern string_choices API instead of manually determining the
output using ternary operator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 6313be370eb7..d2c5321dd025 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
@@ -369,14 +370,14 @@ static void stmfx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 		return;
 
 	if (dir == GPIO_LINE_DIRECTION_OUT) {
-		seq_printf(s, "output %s ", val ? "high" : "low");
+		seq_printf(s, "output %s ", str_high_low(val));
 		if (type)
 			seq_printf(s, "open drain %s internal pull-up ",
 				   pupd ? "with" : "without");
 		else
 			seq_puts(s, "push pull no pull ");
 	} else {
-		seq_printf(s, "input %s ", val ? "high" : "low");
+		seq_printf(s, "input %s ", str_high_low(val));
 		if (type)
 			seq_printf(s, "with internal pull-%s ",
 				   pupd ? "up" : "down");
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
