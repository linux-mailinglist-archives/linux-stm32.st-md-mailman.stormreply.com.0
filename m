Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBACAFDB9A
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 01:12:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FC39C36B3C;
	Tue,  8 Jul 2025 23:12:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D2F0C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 23:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752016320; x=1783552320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F43DrlOFqpVCv/gcMSySHNfblub8XfWCe+WeSdLWo7M=;
 b=hJPCQoXQCGci0tgo46Xjfq7F5INDB918FnYwBVJCEMkh9rcsc/o9awdX
 lACu9pMEz71p6TeBtcXUHVQyKNMCWIqGDax1SB8yvNEhbQ6Irt/5q+CTg
 nrQUgsA4ztFlR9hf8UafJl6r2N19HfOvq10hGHAvglbWCvrhJ0BoNnY/j
 k0Cl1LC1SFoFIRcn+acm5rra+nOihmy6yDIsOSEoYRW7I373+K/73C/mF
 Rai+M2wJfCNbqyCAMO2t0pF6ZX1wqjs3AummiM68bsaJN5r4GDbP63nXg
 41TirXhz+VTtoAgRnGWwN0Ytz5vRYcJgYlf2FxfqrLcDGd2ND0OxTokk4 g==;
X-CSE-ConnectionGUID: aknJQ419T+iosSWQSnuH4w==
X-CSE-MsgGUID: FwwY02EDTz+1XWTN4v9rBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53986890"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53986890"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 16:11:58 -0700
X-CSE-ConnectionGUID: 6ayOncwjQAmKapZsXhhAqQ==
X-CSE-MsgGUID: a2iii1U6R8SgIWzW2rSfoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186622612"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.102])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 16:11:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 9DBD21211BE;
 Wed,  9 Jul 2025 02:11:52 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1uZHTc-0044kN-1z;
 Wed, 09 Jul 2025 02:11:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Wed,  9 Jul 2025 02:11:52 +0300
Message-Id: <20250708231152.971550-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 05/12] iio: dac: Remove redundant
	pm_runtime_mark_last_busy() calls
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/iio/dac/stm32-dac.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index 344388338d9b..0988c991cf60 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -95,18 +95,14 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 	if (en && dac->common->hfsel)
 		udelay(1);
 
-	if (!enable) {
-		pm_runtime_mark_last_busy(dev);
+	if (!enable)
 		pm_runtime_put_autosuspend(dev);
-	}
 
 	return 0;
 
 err_put_pm:
-	if (enable) {
-		pm_runtime_mark_last_busy(dev);
+	if (enable)
 		pm_runtime_put_autosuspend(dev);
-	}
 
 	return ret;
 }
@@ -349,7 +345,6 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_put;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
