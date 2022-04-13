Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3834FFE46
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Apr 2022 20:57:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05702C6049B;
	Wed, 13 Apr 2022 18:57:04 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47052C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649876222; x=1681412222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lAetsBuWgswU7u+YkwA4as4H1nfbpfGF8R6Greju+tw=;
 b=fjLkNU0SW3XtwH5xD2llmUFD0bwXU6KFD+HUuUGgJADYjliNR3+62FxE
 x5RIE6xpAKmyutkrW5j2mPj0Ch3UqC2DImhmrBi+WbJ6na1fw8FccsuQ/
 kPoWqicXSHi7w9ca5e9GN+xHt+p5VzePn9gD6OBv3clVjKgQLmNB+aiJD
 SRUyxxxHf1uRuhQRAw+XrSwW8hZu9SS4RW2SOD8qxxX28wdpuUqekEvP5
 MWUfXmdY1qLfjVRdBd9oDyQ4melLSTyo95Dms0+oMzYu2AgwlZQSG5LdY
 mqexsNknrJNZ07r0sgp3WTwF/d+7r8J0INlwDeHMkjNbVzBohb6CAYI31 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262501306"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="262501306"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 11:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="612002913"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2022 11:56:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 66F9512C; Wed, 13 Apr 2022 21:56:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 13 Apr 2022 21:56:56 +0300
Message-Id: <20220413185656.21994-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v1 1/1] iio: trigger: stm32-lptimer-trigger:
	Make use of device properties
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
 drivers/iio/trigger/stm32-lptimer-trigger.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
index 98cdc7e47f3d..af46c10cea92 100644
--- a/drivers/iio/trigger/stm32-lptimer-trigger.c
+++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/stm32-lptimer.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 /* List Low-Power Timer triggers */
 static const char * const stm32_lptim_triggers[] = {
@@ -77,7 +78,7 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	if (of_property_read_u32(pdev->dev.of_node, "reg", &index))
+	if (device_property_read_u32(&pdev->dev, "reg", &index))
 		return -EINVAL;
 
 	if (index >= ARRAY_SIZE(stm32_lptim_triggers))
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
