Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43392841DF0
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 09:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1930C6C820;
	Tue, 30 Jan 2024 08:36:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59AA3C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 15:41:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D9A4DA7;
 Mon, 29 Jan 2024 07:41:59 -0800 (PST)
Received: from e127643.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 578993F738;
 Mon, 29 Jan 2024 07:41:13 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Mon, 29 Jan 2024 15:40:32 +0000
Message-Id: <20240129154050.569566-2-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129154050.569566-1-james.clark@arm.com>
References: <20240129154050.569566-1-james.clark@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jan 2024 08:36:52 +0000
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v2 01/12] coresight: Fix issue where a source
	device's helpers aren't disabled
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

The linked commit reverts the change that accidentally used some sysfs
enable/disable functions from Perf which broke the refcounting, but it
also removes the fact that the sysfs disable function disabled the
helpers.

Add a new wrapper function that does both which is used by both Perf and
sysfs, and label the sysfs disable function appropriately. The naming of
all of the functions will be tidied up later to avoid this happening
again.

Fixes: 287e82cf69aa ("coresight: Fix crash when Perf and sysfs modes are used concurrently")
Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 30 ++++++++++++++-----
 .../hwtracing/coresight/coresight-etm-perf.c  |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d7f0e231feb9..965bb6d4e1bf 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -441,8 +441,26 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 	}
 }
 
+/*
+ * Helper function to call source_ops(csdev)->disable and also disable the
+ * helpers.
+ *
+ * There is an imbalance between coresight_enable_path() and
+ * coresight_disable_path(). Enabling also enables the source's helpers as part
+ * of the path, but disabling always skips the first item in the path (which is
+ * the source), so sources and their helpers don't get disabled as part of that
+ * function and we need the extra step here.
+ */
+void coresight_disable_source(struct coresight_device *csdev, void *data)
+{
+	if (source_ops(csdev)->disable)
+		source_ops(csdev)->disable(csdev, data);
+	coresight_disable_helpers(csdev);
+}
+EXPORT_SYMBOL_GPL(coresight_disable_source);
+
 /**
- *  coresight_disable_source - Drop the reference count by 1 and disable
+ *  coresight_disable_source_sysfs - Drop the reference count by 1 and disable
  *  the device if there are no users left.
  *
  *  @csdev: The coresight device to disable
@@ -451,17 +469,15 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
  *
  *  Returns true if the device has been disabled.
  */
-bool coresight_disable_source(struct coresight_device *csdev, void *data)
+static bool coresight_disable_source_sysfs(struct coresight_device *csdev,
+					   void *data)
 {
 	if (atomic_dec_return(&csdev->refcnt) == 0) {
-		if (source_ops(csdev)->disable)
-			source_ops(csdev)->disable(csdev, data);
-		coresight_disable_helpers(csdev);
+		coresight_disable_source(csdev, data);
 		csdev->enable = false;
 	}
 	return !csdev->enable;
 }
-EXPORT_SYMBOL_GPL(coresight_disable_source);
 
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
@@ -1204,7 +1220,7 @@ void coresight_disable(struct coresight_device *csdev)
 	if (ret)
 		goto out;
 
-	if (!csdev->enable || !coresight_disable_source(csdev, NULL))
+	if (!csdev->enable || !coresight_disable_source_sysfs(csdev, NULL))
 		goto out;
 
 	switch (csdev->subtype.source_subtype) {
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index a52cfcce25d6..c0c60e6a1703 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -589,7 +589,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 		return;
 
 	/* stop tracer */
-	source_ops(csdev)->disable(csdev, event);
+	coresight_disable_source(csdev, event);
 
 	/* tell the core */
 	event->hw.state = PERF_HES_STOPPED;
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 767076e07970..30c051055e54 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -233,6 +233,6 @@ void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
 int coresight_enable_source(struct coresight_device *csdev, enum cs_mode mode,
 			    void *data);
-bool coresight_disable_source(struct coresight_device *csdev, void *data);
+void coresight_disable_source(struct coresight_device *csdev, void *data);
 
 #endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
