Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 664DC54ECFC
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jun 2022 00:00:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 132AAC56630;
	Thu, 16 Jun 2022 22:00:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28E64C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416825; x=1686952825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FTSAuZio06yo2Ofn9Nn8yskW+7vnLgH3CDz569XEMjg=;
 b=QOzJnVgn7jkPNy4EbAN86BLYFK59uTDPU8ZIi0umf0B0v1eJzrbrq7AU
 eQCZavS90Pf7af3n1z3T7YAUBmPnb7LHDLu91qxT768LrpqexLBoHisXc
 icmW2sk34ON11fFsvS5klE6qDDmkR5XRpLs4MU8vouwJETbej+PY9VSJR
 jdhVqCXdBknV/MaUCCfzDIZ0TxzPfsx4qZtxxk5moZnQL8MXJgTGEbznN
 F2IPbu6a7lQ8sBHmgzZETtnoXrrI4MLlawTLHNgpBBs48m5hV3+2hVf5X
 jZmwpbmZXqR7Hr1PpMJQ8PcZ9wSLFXbb2roJ8jSpmNLm5i3ZJbkt7xl4o A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279419614"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="279419614"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583799914"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 16 Jun 2022 15:00:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EF431109; Fri, 17 Jun 2022 01:00:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 17 Jun 2022 01:00:23 +0300
Message-Id: <20220616220023.9894-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v1 1/1] iio: dac: stm32-dac: Replace open
	coded str_enable_disable()
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

Replace open coded str_enable_disable() in error message in
stm32_dac_set_enable_state().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iio/dac/stm32-dac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index e842c15c674d..315d66648210 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_helpers.h>
 
 #include "stm32-dac-core.h"
 
@@ -79,8 +80,7 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 	ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
 	mutex_unlock(&dac->lock);
 	if (ret < 0) {
-		dev_err(&indio_dev->dev, "%s failed\n", en ?
-			"Enable" : "Disable");
+		dev_err(&indio_dev->dev, "%s failed\n", str_enable_disable(en));
 		goto err_put_pm;
 	}
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
