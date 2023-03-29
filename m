Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6AC6CD8CA
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 13:53:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 045ECC69069;
	Wed, 29 Mar 2023 11:53:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFA79C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 11:53:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BD24AD7;
 Wed, 29 Mar 2023 04:54:41 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F8FF3F6C4;
 Wed, 29 Mar 2023 04:53:55 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, quic_jinlmao@quicinc.com,
 mike.leach@linaro.org, suzuki.poulose@arm.com
Date: Wed, 29 Mar 2023 12:53:15 +0100
Message-Id: <20230329115329.2747724-3-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329115329.2747724-1-james.clark@arm.com>
References: <20230329115329.2747724-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 02/13] coresight: Change name of
	pdata->conns
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

conns is actually for output connections. Change the name to make it
clearer and so that we can add input connections later.

No functional changes.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 26 +++++++++----------
 .../hwtracing/coresight/coresight-platform.c  | 12 ++++-----
 .../hwtracing/coresight/coresight-tmc-etr.c   |  2 +-
 include/linux/coresight.h                     |  4 +--
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e3b63fd52b9c..c0eda7407fb8 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -119,7 +119,7 @@ static int coresight_find_link_inport(struct coresight_device *csdev,
 	struct coresight_connection *conn;
 
 	for (i = 0; i < parent->pdata->nr_outport; i++) {
-		conn = &parent->pdata->conns[i];
+		conn = &parent->pdata->out_conns[i];
 		if (conn->child_dev == csdev)
 			return conn->child_port;
 	}
@@ -137,7 +137,7 @@ static int coresight_find_link_outport(struct coresight_device *csdev,
 	struct coresight_connection *conn;
 
 	for (i = 0; i < csdev->pdata->nr_outport; i++) {
-		conn = &csdev->pdata->conns[i];
+		conn = &csdev->pdata->out_conns[i];
 		if (conn->child_dev == child)
 			return conn->outport;
 	}
@@ -606,7 +606,7 @@ coresight_find_enabled_sink(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outport; i++) {
 		struct coresight_device *child_dev;
 
-		child_dev = csdev->pdata->conns[i].child_dev;
+		child_dev = csdev->pdata->out_conns[i].child_dev;
 		if (child_dev)
 			sink = coresight_find_enabled_sink(child_dev);
 		if (sink)
@@ -722,7 +722,7 @@ static int coresight_grab_device(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outport; i++) {
 		struct coresight_device *child;
 
-		child  = csdev->pdata->conns[i].child_dev;
+		child = csdev->pdata->out_conns[i].child_dev;
 		if (child && child->type == CORESIGHT_DEV_TYPE_HELPER)
 			if (!coresight_get_ref(child))
 				goto err;
@@ -733,7 +733,7 @@ static int coresight_grab_device(struct coresight_device *csdev)
 	for (i--; i >= 0; i--) {
 		struct coresight_device *child;
 
-		child  = csdev->pdata->conns[i].child_dev;
+		child = csdev->pdata->out_conns[i].child_dev;
 		if (child && child->type == CORESIGHT_DEV_TYPE_HELPER)
 			coresight_put_ref(child);
 	}
@@ -752,7 +752,7 @@ static void coresight_drop_device(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outport; i++) {
 		struct coresight_device *child;
 
-		child  = csdev->pdata->conns[i].child_dev;
+		child = csdev->pdata->out_conns[i].child_dev;
 		if (child && child->type == CORESIGHT_DEV_TYPE_HELPER)
 			coresight_put_ref(child);
 	}
@@ -794,7 +794,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
 	for (i = 0; i < csdev->pdata->nr_outport; i++) {
 		struct coresight_device *child_dev;
 
-		child_dev = csdev->pdata->conns[i].child_dev;
+		child_dev = csdev->pdata->out_conns[i].child_dev;
 		if (child_dev &&
 		    _coresight_build_path(child_dev, sink, path) == 0) {
 			found = true;
@@ -964,7 +964,7 @@ coresight_find_sink(struct coresight_device *csdev, int *depth)
 		struct coresight_device *child_dev, *sink = NULL;
 		int child_depth = curr_depth;
 
-		child_dev = csdev->pdata->conns[i].child_dev;
+		child_dev = csdev->pdata->out_conns[i].child_dev;
 		if (child_dev)
 			sink = coresight_find_sink(child_dev, &child_depth);
 
@@ -1334,7 +1334,7 @@ static int coresight_orphan_match(struct device *dev, void *data)
 	 * an orphan connection whose name matches @csdev, link it.
 	 */
 	for (i = 0; i < i_csdev->pdata->nr_outport; i++) {
-		conn = &i_csdev->pdata->conns[i];
+		conn = &i_csdev->pdata->out_conns[i];
 
 		/* Skip the port if FW doesn't describe it */
 		if (!conn->child_fwnode)
@@ -1375,7 +1375,7 @@ static int coresight_fixup_device_conns(struct coresight_device *csdev)
 	int i, ret = 0;
 
 	for (i = 0; i < csdev->pdata->nr_outport; i++) {
-		struct coresight_connection *conn = &csdev->pdata->conns[i];
+		struct coresight_connection *conn = &csdev->pdata->out_conns[i];
 
 		if (!conn->child_fwnode)
 			continue;
@@ -1412,7 +1412,7 @@ static int coresight_remove_match(struct device *dev, void *data)
 	 * a connection whose name matches @csdev, remove it.
 	 */
 	for (i = 0; i < iterator->pdata->nr_outport; i++) {
-		conn = &iterator->pdata->conns[i];
+		conn = &iterator->pdata->out_conns[i];
 
 		if (conn->child_dev == NULL || conn->child_fwnode == NULL)
 			continue;
@@ -1548,7 +1548,7 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 				     struct coresight_platform_data *pdata)
 {
 	int i;
-	struct coresight_connection *conns = pdata->conns;
+	struct coresight_connection *conns = pdata->out_conns;
 
 	for (i = 0; i < pdata->nr_outport; i++) {
 		/* If we have made the links, remove them now */
@@ -1560,7 +1560,7 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 		 */
 		if (conns[i].child_fwnode) {
 			fwnode_handle_put(conns[i].child_fwnode);
-			pdata->conns[i].child_fwnode = NULL;
+			pdata->out_conns[i].child_fwnode = NULL;
 		}
 	}
 	if (csdev)
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 475899714104..5085525a32bb 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -27,9 +27,9 @@ static int coresight_alloc_conns(struct device *dev,
 				 struct coresight_platform_data *pdata)
 {
 	if (pdata->nr_outport) {
-		pdata->conns = devm_kcalloc(dev, pdata->nr_outport,
-					    sizeof(*pdata->conns), GFP_KERNEL);
-		if (!pdata->conns)
+		pdata->out_conns = devm_kcalloc(dev, pdata->nr_outport,
+					    sizeof(*pdata->out_conns), GFP_KERNEL);
+		if (!pdata->out_conns)
 			return -ENOMEM;
 	}
 
@@ -251,7 +251,7 @@ static int of_coresight_parse_endpoint(struct device *dev,
 			break;
 		}
 
-		conn = &pdata->conns[endpoint.port];
+		conn = &pdata->out_conns[endpoint.port];
 		if (conn->child_fwnode) {
 			dev_warn(dev, "Duplicate output port %d\n",
 				 endpoint.port);
@@ -744,8 +744,8 @@ static int acpi_coresight_parse_graph(struct acpi_device *adev,
 		int port = conns[i].outport;
 
 		/* Duplicate output port */
-		WARN_ON(pdata->conns[port].child_fwnode);
-		pdata->conns[port] = conns[i];
+		WARN_ON(pdata->out_conns[port].child_fwnode);
+		pdata->out_conns[port] = conns[i];
 	}
 
 	devm_kfree(&adev->dev, conns);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ed589cfff1b5..86d4a08aa833 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -782,7 +782,7 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 		return NULL;
 
 	for (i = 0; i < etr->pdata->nr_outport; i++) {
-		tmp = etr->pdata->conns[i].child_dev;
+		tmp = etr->pdata->out_conns[i].child_dev;
 		if (tmp && coresight_is_catu_device(tmp))
 			return tmp;
 	}
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 1f878e8ed8c4..bf621d064ef8 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -104,12 +104,12 @@ union coresight_dev_subtype {
  *
  * @nr_inport:	Number of elements for the input connections.
  * @nr_outport:	Number of elements for the output connections.
- * @conns:	Sparse array of nr_outport connections from this component.
+ * @out_conns:	Sparse array of nr_outport connections from this component.
  */
 struct coresight_platform_data {
 	int nr_inport;
 	int nr_outport;
-	struct coresight_connection *conns;
+	struct coresight_connection *out_conns;
 };
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
