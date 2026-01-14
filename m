Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A4D1D821
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 10:28:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A1F1C8F261;
	Wed, 14 Jan 2026 09:28:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12591C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768382896; x=1799918896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dx8wdyZ1+Rq3DObPX6zf0dh3NrSxxmnlPzpX3UXG2ec=;
 b=ecfuO/5dRkpgwF1TlfGQJAeQNeztu8iYklcdC8iIMq8taFqTrRvBIWoz
 1cVG9iHszaFeziAAAHsRR4aPzauL1If/MpoLdy0myBMaaobnamJY+xIpI
 96lel05ODueKo+0+aJYbfUpgGf93BzUDFqEqPSOrj6sNexH1d9B6OYEpo
 OwaYOw5f69DXV7OXuum+YiP+7PjhzKcVcForcELBgHuQzXpbXzPtVRIsc
 ktmmxtjmn0bVnC5f32VCRJBD720CJnKSSzeHRVSVH7mbBxV3EeVptwaBo
 VsXN3M923spJT/P/MzTA/S/DclmnXBtS4DMIifHrxAZK4OKCNormjDozd Q==;
X-CSE-ConnectionGUID: i3ys2mJ5SpWto5PC6bRKcg==
X-CSE-MsgGUID: 1VhrWilRTNenkBKBNd1rjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87258429"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="87258429"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 01:28:14 -0800
X-CSE-ConnectionGUID: bRaxQtijQleZaZYRzDl9dg==
X-CSE-MsgGUID: PoJBeXJ0T52sf7c7XXKeZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209474968"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP; 14 Jan 2026 01:28:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 9737998; Wed, 14 Jan 2026 10:28:10 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 14 Jan 2026 10:28:08 +0100
Message-ID: <20260114092808.273695-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: [Linux-stm32] [PATCH v1 1/1] thermal: stm32: Use predefined
	HZ_PER_MHZ instead of a custom one
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

Use predefined HZ_PER_MHZ instead of a custom one. No functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/thermal/st/stm_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 6e90eb9f414d..5d8170bfb382 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/thermal.h>
+#include <linux/units.h>
 
 #include "../thermal_hwmon.h"
 
@@ -76,7 +77,6 @@
 
 /* Constants */
 #define ADJUST			100
-#define ONE_MHZ			1000000
 #define POLL_TIMEOUT		5000
 #define STARTUP_TIME		40
 #define TS1_T0_VAL0		30000  /* 30 celsius */
@@ -205,7 +205,7 @@ static int stm_thermal_calibration(struct stm_thermal_sensor *sensor)
 		return -EINVAL;
 
 	prescaler = 0;
-	clk_freq /= ONE_MHZ;
+	clk_freq /= HZ_PER_MHZ;
 	if (clk_freq) {
 		while (prescaler <= clk_freq)
 			prescaler++;
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
