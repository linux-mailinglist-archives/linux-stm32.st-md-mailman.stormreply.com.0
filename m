Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 331018B5D8D
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:25:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF566C71285;
	Mon, 29 Apr 2024 15:25:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C180EC71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:25:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0B4F2F4;
 Mon, 29 Apr 2024 08:25:47 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E02F3F793;
 Mon, 29 Apr 2024 08:25:18 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: linux-perf-users@vger.kernel.org, gankulkarni@os.amperecomputing.com,
 scclevenger@os.amperecomputing.com, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, mike.leach@linaro.org
Date: Mon, 29 Apr 2024 16:21:58 +0100
Message-Id: <20240429152207.479221-14-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429152207.479221-1-james.clark@arm.com>
References: <20240429152207.479221-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Leo Yan <leo.yan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 12/17] coresight: Make CPU id map a property
	of a trace ID map
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

The global CPU ID mappings won't work for per-sink ID maps so move it to
the ID map struct. coresight_trace_id_release_all_pending() is hard
coded to operate on the default map, but once Perf sessions use their
own maps the pending release mechanism will be deleted. So it doesn't
need to be extended to accept a trace ID map argument at this point.

Signed-off-by: James Clark <james.clark@arm.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c  |  3 +-
 .../coresight/coresight-etm3x-core.c          |  3 +-
 .../coresight/coresight-etm4x-core.c          |  3 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 28 ++++++++-----------
 .../hwtracing/coresight/coresight-trace-id.h  |  2 +-
 include/linux/coresight.h                     |  1 +
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 4afb9d29f355..25f1f87c90d1 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -508,7 +508,8 @@ static void etm_event_start(struct perf_event *event, int flags)
 		hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
 				   CS_AUX_HW_ID_CURR_VERSION);
 		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
-				    coresight_trace_id_read_cpu_id(cpu));
+				    coresight_trace_id_read_cpu_id(cpu,
+						coresight_trace_id_map_default()));
 		perf_report_aux_output_id(event, hw_id);
 	}
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 4149e7675ceb..b21f5ad94e63 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -501,7 +501,8 @@ static int etm_enable_perf(struct coresight_device *csdev,
 	 * with perf locks - we know the ID cannot change until perf shuts down
 	 * the session
 	 */
-	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu);
+	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu,
+						  coresight_trace_id_map_default());
 	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
 		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
 			dev_name(&drvdata->csdev->dev), drvdata->cpu);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index f32c8cd7742d..d16d6efb26fa 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -776,7 +776,8 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	 * with perf locks - we know the ID cannot change until perf shuts down
 	 * the session
 	 */
-	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu);
+	trace_id = coresight_trace_id_read_cpu_id(drvdata->cpu,
+						  coresight_trace_id_map_default());
 	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
 		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
 			dev_name(&drvdata->csdev->dev), drvdata->cpu);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index 45ddd50d09a6..b393603dd713 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -13,10 +13,12 @@
 #include "coresight-trace-id.h"
 
 /* Default trace ID map. Used in sysfs mode and for system sources */
-static struct coresight_trace_id_map id_map_default;
+static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
+static struct coresight_trace_id_map id_map_default = {
+	.cpu_map = &id_map_default_cpu_ids
+};
 
-/* maintain a record of the mapping of IDs and pending releases per cpu */
-static DEFINE_PER_CPU(atomic_t, cpu_id) = ATOMIC_INIT(0);
+/* maintain a record of the pending releases per cpu */
 static cpumask_t cpu_id_release_pending;
 
 /* perf session active counter */
@@ -46,12 +48,6 @@ static void coresight_trace_id_dump_table(struct coresight_trace_id_map *id_map,
 #define PERF_SESSION(n)
 #endif
 
-/* unlocked read of current trace ID value for given CPU */
-static int _coresight_trace_id_read_cpu_id(int cpu)
-{
-	return atomic_read(&per_cpu(cpu_id, cpu));
-}
-
 /* look for next available odd ID, return 0 if none found */
 static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
 {
@@ -145,7 +141,7 @@ static void coresight_trace_id_release_all_pending(void)
 		clear_bit(bit, id_map->pend_rel_ids);
 	}
 	for_each_cpu(cpu, &cpu_id_release_pending) {
-		atomic_set(&per_cpu(cpu_id, cpu), 0);
+		atomic_set(per_cpu_ptr(id_map_default.cpu_map, cpu), 0);
 		cpumask_clear_cpu(cpu, &cpu_id_release_pending);
 	}
 	spin_unlock_irqrestore(&id_map_lock, flags);
@@ -160,7 +156,7 @@ int coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map
 	spin_lock_irqsave(&id_map_lock, flags);
 
 	/* check for existing allocation for this CPU */
-	id = _coresight_trace_id_read_cpu_id(cpu);
+	id = coresight_trace_id_read_cpu_id(cpu, id_map);
 	if (id)
 		goto get_cpu_id_clr_pend;
 
@@ -181,7 +177,7 @@ int coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map
 		goto get_cpu_id_out_unlock;
 
 	/* allocate the new id to the cpu */
-	atomic_set(&per_cpu(cpu_id, cpu), id);
+	atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
 
 get_cpu_id_clr_pend:
 	/* we are (re)using this ID - so ensure it is not marked for release */
@@ -203,7 +199,7 @@ void coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_ma
 	int id;
 
 	/* check for existing allocation for this CPU */
-	id = _coresight_trace_id_read_cpu_id(cpu);
+	id = coresight_trace_id_read_cpu_id(cpu, id_map);
 	if (!id)
 		return;
 
@@ -216,7 +212,7 @@ void coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_ma
 	} else {
 		/* otherwise clear id */
 		coresight_trace_id_free(id, id_map);
-		atomic_set(&per_cpu(cpu_id, cpu), 0);
+		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
 	}
 
 	spin_unlock_irqrestore(&id_map_lock, flags);
@@ -258,9 +254,9 @@ struct coresight_trace_id_map *coresight_trace_id_map_default(void)
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_map_default);
 
-int coresight_trace_id_read_cpu_id(int cpu)
+int coresight_trace_id_read_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
 {
-	return _coresight_trace_id_read_cpu_id(cpu);
+	return atomic_read(per_cpu_ptr(id_map->cpu_map, cpu));
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
 
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 54b9d8ed903b..ed2bc4b3ad2a 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -93,7 +93,7 @@ void coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_ma
  *
  * return: current value, will be 0 if unallocated.
  */
-int coresight_trace_id_read_cpu_id(int cpu);
+int coresight_trace_id_read_cpu_id(int cpu, struct coresight_trace_id_map *id_map);
 
 /**
  * Allocate a CoreSight trace ID for a system component.
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c16c61a8411d..7d62b88bfb5c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -234,6 +234,7 @@ struct coresight_sysfs_link {
 struct coresight_trace_id_map {
 	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
 	DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
+	atomic_t __percpu *cpu_map;
 };
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
