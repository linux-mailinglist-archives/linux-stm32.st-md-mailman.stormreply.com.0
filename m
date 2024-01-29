Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A275840A43
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 16:41:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF4D8C6B463;
	Mon, 29 Jan 2024 15:41:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98843C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 15:41:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEEC4DA7;
 Mon, 29 Jan 2024 07:42:17 -0800 (PST)
Received: from e127643.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DB033F738;
 Mon, 29 Jan 2024 07:41:31 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Date: Mon, 29 Jan 2024 15:40:34 +0000
Message-Id: <20240129154050.569566-4-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129154050.569566-1-james.clark@arm.com>
References: <20240129154050.569566-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH v2 03/12] coresight: Remove ops callback checks
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

The check for the existence of callbacks before using them implies that
this happens and is supported. There are no devices without
enable/disable callbacks, and it wouldn't be possible to add a new
working device without adding them either, so just remove them.

Furthermore, there are more callbacks than just enable and disable that
are already used unguarded in other places.

The comment about new session compatibility doesn't seem to match up to
the line of code that it's on so remove it. I think it's alluding to the
fact that sinks will check if they were already enabled via sysfs or
Perf and fail the enable. But there are more detailed comments at those
places, and this one isn't very useful.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 51 +++++---------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 2bb74ad8f68b..37767656bf9d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -279,16 +279,8 @@ EXPORT_SYMBOL_GPL(coresight_add_helper);
 static int coresight_enable_sink(struct coresight_device *csdev,
 				 enum cs_mode mode, void *data)
 {
-	int ret;
-
-	/*
-	 * We need to make sure the "new" session is compatible with the
-	 * existing "mode" of operation.
-	 */
-	if (!sink_ops(csdev)->enable)
-		return -EINVAL;
+	int ret = sink_ops(csdev)->enable(csdev, mode, data);
 
-	ret = sink_ops(csdev)->enable(csdev, mode, data);
 	if (ret)
 		return ret;
 
@@ -299,12 +291,7 @@ static int coresight_enable_sink(struct coresight_device *csdev,
 
 static void coresight_disable_sink(struct coresight_device *csdev)
 {
-	int ret;
-
-	if (!sink_ops(csdev)->disable)
-		return;
-
-	ret = sink_ops(csdev)->disable(csdev);
+	int ret = sink_ops(csdev)->disable(csdev);
 	if (ret)
 		return;
 	csdev->enable = false;
@@ -330,11 +317,9 @@ static int coresight_enable_link(struct coresight_device *csdev,
 	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && IS_ERR(outconn))
 		return PTR_ERR(outconn);
 
-	if (link_ops(csdev)->enable) {
-		ret = link_ops(csdev)->enable(csdev, inconn, outconn);
-		if (!ret)
-			csdev->enable = true;
-	}
+	ret = link_ops(csdev)->enable(csdev, inconn, outconn);
+	if (!ret)
+		csdev->enable = true;
 
 	return ret;
 }
@@ -354,9 +339,7 @@ static void coresight_disable_link(struct coresight_device *csdev,
 	outconn = coresight_find_out_connection(csdev, child);
 	link_subtype = csdev->subtype.link_subtype;
 
-	if (link_ops(csdev)->disable) {
-		link_ops(csdev)->disable(csdev, inconn, outconn);
-	}
+	link_ops(csdev)->disable(csdev, inconn, outconn);
 
 	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG) {
 		for (i = 0; i < csdev->pdata->nr_inconns; i++)
@@ -382,11 +365,9 @@ int coresight_enable_source(struct coresight_device *csdev, enum cs_mode mode,
 	int ret;
 
 	if (!csdev->enable) {
-		if (source_ops(csdev)->enable) {
-			ret = source_ops(csdev)->enable(csdev, data, mode);
-			if (ret)
-				return ret;
-		}
+		ret = source_ops(csdev)->enable(csdev, data, mode);
+		if (ret)
+			return ret;
 		csdev->enable = true;
 	}
 
@@ -404,11 +385,8 @@ static bool coresight_is_helper(struct coresight_device *csdev)
 static int coresight_enable_helper(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data)
 {
-	int ret;
+	int ret = helper_ops(csdev)->enable(csdev, mode, data);
 
-	if (!helper_ops(csdev)->enable)
-		return 0;
-	ret = helper_ops(csdev)->enable(csdev, mode, data);
 	if (ret)
 		return ret;
 
@@ -418,12 +396,8 @@ static int coresight_enable_helper(struct coresight_device *csdev,
 
 static void coresight_disable_helper(struct coresight_device *csdev)
 {
-	int ret;
-
-	if (!helper_ops(csdev)->disable)
-		return;
+	int ret = helper_ops(csdev)->disable(csdev, NULL);
 
-	ret = helper_ops(csdev)->disable(csdev, NULL);
 	if (ret)
 		return;
 	csdev->enable = false;
@@ -453,8 +427,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
  */
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
-	if (source_ops(csdev)->disable)
-		source_ops(csdev)->disable(csdev, data);
+	source_ops(csdev)->disable(csdev, data);
 	coresight_disable_helpers(csdev);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
