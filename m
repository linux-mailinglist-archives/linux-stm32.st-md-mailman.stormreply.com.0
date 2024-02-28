Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B542786B87E
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 20:46:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65958C6B460;
	Wed, 28 Feb 2024 19:46:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C01DEC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709149599; x=1740685599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B8cB0QnIPUowOgUL1pi+u6srQ+WF28YcOhJoR7HcGCY=;
 b=DCe3C07fKzMAsumcR2Ge2Ao0Uj0j+a/ulAPELstkNSoCHzPdCRfwerK8
 XbS7W8cKbvtugZxNHoDga4AdPtFSNUHpmR6dLn4Hr40xJVugCXzLjoVFW
 iG/1CTWDb/qK31y7LTO29u6lxUBJkFMAw132XPbtT86nt/eh0qnPednyL
 aSJmlUqPWSd7XABvYS+Dmb07fe3EkxdlTxjzWE/HR1W/SAzB8fy8su/OU
 sGCTEUH9a26jc/+QzxfJQViwh9ItQWC+w0UX+RDo8y3pY524eitluuk4+
 e380derZDaN18qlgKn9lIIiYrx7kmstxWCrtrrsL6izICGPUY7rmZNOXh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14991938"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="14991938"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 11:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937034610"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="937034610"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2024 11:46:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6DD241C5; Wed, 28 Feb 2024 21:46:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Feb 2024 21:46:32 +0200
Message-ID: <20240228194632.3606563-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 1/1] spi: stm32-qspi: Replace of_gpio.h by
	proper one
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

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it directly, replace it
with what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-stm32-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 385832030459..f1e922fd362a 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -8,13 +8,13 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
-- 
2.43.0.rc1.1.gbec44491f096

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
