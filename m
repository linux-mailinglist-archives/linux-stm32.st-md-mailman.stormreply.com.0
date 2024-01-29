Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F98841DF1
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 09:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4636C6C855;
	Tue, 30 Jan 2024 08:36:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CE97C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 15:42:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C84EEDA7;
 Mon, 29 Jan 2024 07:43:23 -0800 (PST)
Received: from e127643.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DF813F738;
 Mon, 29 Jan 2024 07:42:37 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Mon, 29 Jan 2024 15:40:41 +0000
Message-Id: <20240129154050.569566-11-james.clark@arm.com>
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
Subject: [Linux-stm32] [PATCH v2 10/12] coresight: Add helper for atomically
	taking the device
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

Now that mode is in struct coresight_device, this pattern can be wrapped
in a helper.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  8 +++-----
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  8 +++-----
 drivers/hwtracing/coresight/coresight-stm.c        |  8 +++-----
 include/linux/coresight.h                          | 11 +++++++++++
 4 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a8be115636f0..ce2b3ed90fb9 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -556,14 +556,12 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      enum cs_mode mode)
 {
 	int ret;
-	u32 val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	val = local_cmpxchg(&drvdata->csdev->mode, CS_MODE_DISABLED, mode);
-
-	/* Someone is already using the tracer */
-	if (val)
+	if (!coresight_take_mode(csdev, mode)) {
+		/* Someone is already using the tracer */
 		return -EBUSY;
+	}
 
 	switch (mode) {
 	case CS_MODE_SYSFS:
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 3480b563981c..8fca7fc379e6 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -840,13 +840,11 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 		       enum cs_mode mode)
 {
 	int ret;
-	u32 val;
 
-	val = local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, mode);
-
-	/* Someone is already using the tracer */
-	if (val)
+	if (!coresight_take_mode(csdev, mode)) {
+		/* Someone is already using the tracer */
 		return -EBUSY;
+	}
 
 	switch (mode) {
 	case CS_MODE_SYSFS:
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index af9b21224246..80fed4c377f1 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -193,17 +193,15 @@ static void stm_enable_hw(struct stm_drvdata *drvdata)
 static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      enum cs_mode mode)
 {
-	u32 val;
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	if (mode != CS_MODE_SYSFS)
 		return -EINVAL;
 
-	val = local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, mode);
-
-	/* Someone is already using the tracer */
-	if (val)
+	if (!coresight_take_mode(csdev, mode)) {
+		/* Someone is already using the tracer */
 		return -EBUSY;
+	}
 
 	pm_runtime_get_sync(csdev->dev.parent);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c5be46d7f85c..175d184b3a1b 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -580,6 +580,17 @@ static inline bool coresight_is_percpu_sink(struct coresight_device *csdev)
 	       (csdev->subtype.sink_subtype == CORESIGHT_DEV_SUBTYPE_SINK_PERCPU_SYSMEM);
 }
 
+/*
+ * Atomically try to take the device and set a new mode. Returns true on
+ * success, false if the device is already taken by someone else.
+ */
+static inline bool coresight_take_mode(struct coresight_device *csdev,
+				       enum cs_mode new_mode)
+{
+	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
+	       CS_MODE_DISABLED;
+}
+
 extern struct coresight_device *
 coresight_register(struct coresight_desc *desc);
 extern void coresight_unregister(struct coresight_device *csdev);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
