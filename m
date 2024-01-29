Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14228840A41
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 16:41:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1F8FC6B463;
	Mon, 29 Jan 2024 15:41:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0047C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 15:41:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10BE1DA7;
 Mon, 29 Jan 2024 07:42:09 -0800 (PST)
Received: from e127643.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C3F33F738;
 Mon, 29 Jan 2024 07:41:22 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Mon, 29 Jan 2024 15:40:33 +0000
Message-Id: <20240129154050.569566-3-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129154050.569566-1-james.clark@arm.com>
References: <20240129154050.569566-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v2 02/12] coresight: Make language around
	"activated" sinks consistent
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

Activated has the specific meaning of a sink that's selected for use by
the user via sysfs. But comments in some code that's shared by Perf use
the same word, so in those cases change them to just say "selected"
instead. With selected implying either via Perf or "activated" via
sysfs.

coresight_get_enabled_sink() doesn't actually get an enabled sink, it
only gets an activated one, so change that too.

And change the activated variable name to include "sysfs" so it can't
be confused as a general status.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 ++++++++------------
 drivers/hwtracing/coresight/coresight-priv.h |  2 -
 include/linux/coresight.h                    | 14 +++---
 3 files changed, 27 insertions(+), 40 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 965bb6d4e1bf..2bb74ad8f68b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -500,7 +500,7 @@ static void coresight_disable_path_from(struct list_head *path,
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
-		 * "activated" it will be configured as a sink, otherwise
+		 * selected as a sink it will be configured as a sink, otherwise
 		 * go ahead with the link configuration.
 		 */
 		if (type == CORESIGHT_DEV_TYPE_LINKSINK)
@@ -578,7 +578,7 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
-		 * "activated" it will be configured as a sink, otherwise
+		 * selected as a sink it will be configured as a sink, otherwise
 		 * go ahead with the link configuration.
 		 */
 		if (type == CORESIGHT_DEV_TYPE_LINKSINK)
@@ -635,15 +635,21 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
 	return csdev;
 }
 
+/**
+ * coresight_find_activated_sysfs_sink - returns the first sink activated via
+ * sysfs using connection based search starting from the source reference.
+ *
+ * @csdev: Coresight source device reference
+ */
 static struct coresight_device *
-coresight_find_enabled_sink(struct coresight_device *csdev)
+coresight_find_activated_sysfs_sink(struct coresight_device *csdev)
 {
 	int i;
 	struct coresight_device *sink = NULL;
 
 	if ((csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	     csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) &&
-	     csdev->activated)
+	     csdev->sysfs_sink_activated)
 		return csdev;
 
 	/*
@@ -654,7 +660,7 @@ coresight_find_enabled_sink(struct coresight_device *csdev)
 
 		child_dev = csdev->pdata->out_conns[i]->dest_dev;
 		if (child_dev)
-			sink = coresight_find_enabled_sink(child_dev);
+			sink = coresight_find_activated_sysfs_sink(child_dev);
 		if (sink)
 			return sink;
 	}
@@ -662,21 +668,6 @@ coresight_find_enabled_sink(struct coresight_device *csdev)
 	return NULL;
 }
 
-/**
- * coresight_get_enabled_sink - returns the first enabled sink using
- * connection based search starting from the source reference
- *
- * @source: Coresight source device reference
- */
-struct coresight_device *
-coresight_get_enabled_sink(struct coresight_device *source)
-{
-	if (!source)
-		return NULL;
-
-	return coresight_find_enabled_sink(source);
-}
-
 static int coresight_sink_by_id(struct device *dev, const void *data)
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
@@ -810,11 +801,10 @@ static void coresight_drop_device(struct coresight_device *csdev)
  * @sink:	The final sink we want in this path.
  * @path:	The list to add devices to.
  *
- * The tree of Coresight device is traversed until an activated sink is
- * found.  From there the sink is added to the list along with all the
- * devices that led to that point - the end result is a list from source
- * to sink. In that list the source is the first device and the sink the
- * last one.
+ * The tree of Coresight device is traversed until @sink is found.
+ * From there the sink is added to the list along with all the devices that led
+ * to that point - the end result is a list from source to sink. In that list
+ * the source is the first device and the sink the last one.
  */
 static int _coresight_build_path(struct coresight_device *csdev,
 				 struct coresight_device *sink,
@@ -824,7 +814,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
 	bool found = false;
 	struct coresight_node *node;
 
-	/* An activated sink has been found.  Enqueue the element */
+	/* The sink has been found.  Enqueue the element */
 	if (csdev == sink)
 		goto out;
 
@@ -1145,7 +1135,7 @@ int coresight_enable(struct coresight_device *csdev)
 		goto out;
 	}
 
-	sink = coresight_get_enabled_sink(csdev);
+	sink = coresight_find_activated_sysfs_sink(csdev);
 	if (!sink) {
 		ret = -EINVAL;
 		goto out;
@@ -1259,7 +1249,7 @@ static ssize_t enable_sink_show(struct device *dev,
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", csdev->activated);
+	return scnprintf(buf, PAGE_SIZE, "%u\n", csdev->sysfs_sink_activated);
 }
 
 static ssize_t enable_sink_store(struct device *dev,
@@ -1274,10 +1264,7 @@ static ssize_t enable_sink_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (val)
-		csdev->activated = true;
-	else
-		csdev->activated = false;
+	csdev->sysfs_sink_activated = !!val;
 
 	return size;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 30c051055e54..ced5be05a527 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -130,8 +130,6 @@ void coresight_disable_path(struct list_head *path);
 int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 			  void *sink_data);
 struct coresight_device *coresight_get_sink(struct list_head *path);
-struct coresight_device *
-coresight_get_enabled_sink(struct coresight_device *source);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
 coresight_find_default_sink(struct coresight_device *csdev);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index a4cb7dd6ca23..65131bfbd904 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -229,10 +229,12 @@ struct coresight_sysfs_link {
  * @refcnt:	keep track of what is in use.
  * @orphan:	true if the component has connections that haven't been linked.
  * @enable:	'true' if component is currently part of an active path.
- * @activated:	'true' only if a _sink_ has been activated.  A sink can be
- *		activated but not yet enabled.  Enabling for a _sink_
- *		happens when a source has been selected and a path is enabled
- *		from source to that sink.
+ * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
+ *		by writing a 1 to the 'enable_sink' file.  A sink can be
+ *		activated but not yet enabled.  Enabling for a _sink_ happens
+ *		when a source has been selected and a path is enabled from
+ *		source to that sink. A sink can also become enabled but not
+ *		activated if it's used via Perf.
  * @ea:		Device attribute for sink representation under PMU directory.
  * @def_sink:	cached reference to default sink found for this device.
  * @nr_links:   number of sysfs links created to other components from this
@@ -252,9 +254,9 @@ struct coresight_device {
 	struct device dev;
 	atomic_t refcnt;
 	bool orphan;
-	bool enable;	/* true only if configured as part of a path */
+	bool enable;
 	/* sink specific fields */
-	bool activated;	/* true only if a sink is part of a path */
+	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;
 	struct coresight_device *def_sink;
 	/* sysfs links between components */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
