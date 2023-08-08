Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392478471C
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B55C3C6C826;
	Tue, 22 Aug 2023 16:25:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61071C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 16:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691512717; x=1723048717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/xmEuNUa1F857kBIWG/rzmWse5hqaes6dViG2uDIUl0=;
 b=dvQ9btwORD6I1srjua3Gh2++AXc46oz/eM1NE92mUWzMLnte3iBof66V
 1waPXyUPJFKtbJ5qnXGwHYplF6nu+Jt1RwuG19CnRfMmsIiDZfkOK9NW/
 +MPjC4bDYlq7RHohoXC6F/IofYZgfaOU5r2LqWXj3kBNVG3uk1JFxlszO
 uvjEoeNlMFE+shb0xKcI4AtuheFeeD7Arw0Ra6Fdez2BZS8+htPOyw0VR
 3y/FFhKGN4CpOmBtOsApV7oV3ejwgkoaxxSDi1DmQL9fhKI3aFYHFngb9
 ngYLuQtspYmoWvCqCkTplbASwGL05r0T0cry+Y9hn3pv/sclrrgnHUCtO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369777249"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="369777249"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734623035"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="734623035"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2023 09:38:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5A8B515C; Tue,  8 Aug 2023 19:41:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue,  8 Aug 2023 19:41:37 +0300
Message-Id: <20230808164137.66663-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v1 1/1] iio: dac: stm32-dac: Use correct
	header(s) instead of string_helpers.h
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

There is nothing from string_helpers.h used in the driver, correct
the header inclusion block accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iio/dac/stm32-dac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index 15eb44075107..3cab28c7ee3b 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -11,12 +11,13 @@
 #include <linux/delay.h>
 #include <linux/iio/iio.h>
 #include <linux/kernel.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
-#include <linux/string_helpers.h>
+#include <linux/string_choices.h>
 
 #include "stm32-dac-core.h"
 
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
