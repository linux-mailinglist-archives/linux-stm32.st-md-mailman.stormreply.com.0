Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B917903F8C
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 17:04:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 349B0C78004;
	Tue, 11 Jun 2024 15:04:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 734BAC78003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 15:04:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7796016F3;
 Tue, 11 Jun 2024 08:04:49 -0700 (PDT)
Received: from e127643.arm.com (unknown [10.57.41.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 054703F64C;
 Tue, 11 Jun 2024 08:04:20 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Tue, 11 Jun 2024 16:02:24 +0100
Message-Id: <20240611150228.1802828-14-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611150228.1802828-1-james.clark@arm.com>
References: <20240611150228.1802828-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v3 13/14] coresight: Emit sink ID in the HW_ID
	packets
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

For Perf to be able to decode when per-sink trace IDs are used, emit the
sink that's being written to for each ETM.

Perf currently errors out if it sees a newer packet version so instead
of bumping it, add a new minor version field. This can be used to
signify new versions that have backwards compatible fields. Considering
this change is only for high core count machines, it doesn't make sense
to make a breaking change for everyone.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 26 ++++++++++---------
 .../hwtracing/coresight/coresight-etm-perf.c  | 16 ++++++++----
 drivers/hwtracing/coresight/coresight-priv.h  |  1 +
 include/linux/coresight-pmu.h                 | 17 +++++++++---
 4 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index faf560ba8d64..c427e9344a84 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -487,23 +487,25 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
 	return csdev;
 }
 
+u32 coresight_get_sink_id(struct coresight_device *csdev)
+{
+	if (!csdev->ea)
+		return 0;
+
+	/*
+	 * See function etm_perf_add_symlink_sink() to know where
+	 * this comes from.
+	 */
+	return (u32) (unsigned long) csdev->ea->var;
+}
+
 static int coresight_sink_by_id(struct device *dev, const void *data)
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
-	unsigned long hash;
 
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
-	     csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
-
-		if (!csdev->ea)
-			return 0;
-		/*
-		 * See function etm_perf_add_symlink_sink() to know where
-		 * this comes from.
-		 */
-		hash = (unsigned long)csdev->ea->var;
-
-		if ((u32)hash == *(u32 *)data)
+	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
+		if (coresight_get_sink_id(csdev) == *(u32 *)data)
 			return 1;
 	}
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17fa29969643..9bbc41f4b0af 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -453,6 +453,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
 	struct list_head *path;
 	u64 hw_id;
+	u8 trace_id;
 
 	if (!csdev)
 		goto fail;
@@ -505,11 +506,16 @@ static void etm_event_start(struct perf_event *event, int flags)
 	 */
 	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
 		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
-		hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
-				   CS_AUX_HW_ID_CURR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
-				    coresight_trace_id_read_cpu_id_map(cpu,
-								       &sink->perf_sink_id_map));
+
+		trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
+
+		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
+				CS_AUX_HW_ID_MAJOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
+				CS_AUX_HW_ID_MINOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
+
 		perf_report_aux_output_id(event, hw_id);
 	}
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 61a46d3bdcc8..05f891ca6b5c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -148,6 +148,7 @@ int coresight_make_links(struct coresight_device *orig,
 			 struct coresight_device *target);
 void coresight_remove_links(struct coresight_device *orig,
 			    struct coresight_connection *conn);
+u32 coresight_get_sink_id(struct coresight_device *csdev);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 extern int etm_readl_cp14(u32 off, unsigned int *val);
diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index 51ac441a37c3..89b0ac0014b0 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -49,12 +49,21 @@
  * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
  * Used to associate a CPU with the CoreSight Trace ID.
  * [07:00] - Trace ID - uses 8 bits to make value easy to read in file.
- * [59:08] - Unused (SBZ)
- * [63:60] - Version
+ * [39:08] - Sink ID - as reported in /sys/bus/event_source/devices/cs_etm/sinks/
+ *	      Added in minor version 1.
+ * [55:40] - Unused (SBZ)
+ * [59:56] - Minor Version - previously existing fields are compatible with
+ *	      all minor versions.
+ * [63:60] - Major Version - previously existing fields mean different things
+ *	      in new major versions.
  */
 #define CS_AUX_HW_ID_TRACE_ID_MASK	GENMASK_ULL(7, 0)
-#define CS_AUX_HW_ID_VERSION_MASK	GENMASK_ULL(63, 60)
+#define CS_AUX_HW_ID_SINK_ID_MASK	GENMASK_ULL(39, 8)
 
-#define CS_AUX_HW_ID_CURR_VERSION 0
+#define CS_AUX_HW_ID_MINOR_VERSION_MASK	GENMASK_ULL(59, 56)
+#define CS_AUX_HW_ID_MAJOR_VERSION_MASK	GENMASK_ULL(63, 60)
+
+#define CS_AUX_HW_ID_MAJOR_VERSION 0
+#define CS_AUX_HW_ID_MINOR_VERSION 1
 
 #endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
