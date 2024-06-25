Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7AB9168F3
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 15:34:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25887C78006;
	Tue, 25 Jun 2024 13:34:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A23BCC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 13:33:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01B58DA7;
 Tue, 25 Jun 2024 06:34:23 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5A9F3F73B;
 Tue, 25 Jun 2024 06:33:54 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com, jszu@nvidia.com,
 bwicaksono@nvidia.com
Date: Tue, 25 Jun 2024 14:30:55 +0100
Message-Id: <20240625133105.671245-13-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625133105.671245-1-james.clark@arm.com>
References: <20240625133105.671245-1-james.clark@arm.com>
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
Subject: [Linux-stm32] [PATCH v4 12/17] coresight: Expose map arguments in
	trace ID API
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

The trace ID API is currently hard coded to always use the global map.
Add public versions that allow the map to be passed in so that Perf
mode can use per-sink maps. Keep the non-map versions so that sysfs
mode can continue to use the default global map.

System ID functions are unchanged because they will always use the
default map.

Signed-off-by: James Clark <james.clark@arm.com>
---
 .../hwtracing/coresight/coresight-trace-id.c  | 36 ++++++++++++++-----
 .../hwtracing/coresight/coresight-trace-id.h  | 20 +++++++++--
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index 19005b5b4dc4..5561989a03fa 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -12,7 +12,7 @@
 
 #include "coresight-trace-id.h"
 
-/* Default trace ID map. Used on systems that don't require per sink mappings */
+/* Default trace ID map. Used in sysfs mode and for system sources */
 static struct coresight_trace_id_map id_map_default;
 
 /* maintain a record of the mapping of IDs and pending releases per cpu */
@@ -47,7 +47,7 @@ static void coresight_trace_id_dump_table(struct coresight_trace_id_map *id_map,
 #endif
 
 /* unlocked read of current trace ID value for given CPU */
-static int _coresight_trace_id_read_cpu_id(int cpu)
+static int _coresight_trace_id_read_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
 {
 	return atomic_read(&per_cpu(cpu_id, cpu));
 }
@@ -152,7 +152,7 @@ static void coresight_trace_id_release_all_pending(void)
 	DUMP_ID_MAP(id_map);
 }
 
-static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
+static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
 {
 	unsigned long flags;
 	int id;
@@ -160,7 +160,7 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
 	spin_lock_irqsave(&id_map_lock, flags);
 
 	/* check for existing allocation for this CPU */
-	id = _coresight_trace_id_read_cpu_id(cpu);
+	id = _coresight_trace_id_read_cpu_id(cpu, id_map);
 	if (id)
 		goto get_cpu_id_clr_pend;
 
@@ -196,13 +196,13 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
 	return id;
 }
 
-static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
+static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
 {
 	unsigned long flags;
 	int id;
 
 	/* check for existing allocation for this CPU */
-	id = _coresight_trace_id_read_cpu_id(cpu);
+	id = _coresight_trace_id_read_cpu_id(cpu, id_map);
 	if (!id)
 		return;
 
@@ -254,22 +254,40 @@ static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *
 
 int coresight_trace_id_get_cpu_id(int cpu)
 {
-	return coresight_trace_id_map_get_cpu_id(cpu, &id_map_default);
+	return _coresight_trace_id_get_cpu_id(cpu, &id_map_default);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_get_cpu_id);
 
+int coresight_trace_id_get_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map)
+{
+	return _coresight_trace_id_get_cpu_id(cpu, id_map);
+}
+EXPORT_SYMBOL_GPL(coresight_trace_id_get_cpu_id_map);
+
 void coresight_trace_id_put_cpu_id(int cpu)
 {
-	coresight_trace_id_map_put_cpu_id(cpu, &id_map_default);
+	_coresight_trace_id_put_cpu_id(cpu, &id_map_default);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id);
 
+void coresight_trace_id_put_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map)
+{
+	_coresight_trace_id_put_cpu_id(cpu, id_map);
+}
+EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id_map);
+
 int coresight_trace_id_read_cpu_id(int cpu)
 {
-	return _coresight_trace_id_read_cpu_id(cpu);
+	return _coresight_trace_id_read_cpu_id(cpu, &id_map_default);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
 
+int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map)
+{
+	return _coresight_trace_id_read_cpu_id(cpu, id_map);
+}
+EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
+
 int coresight_trace_id_get_system_id(void)
 {
 	return coresight_trace_id_map_get_system_id(&id_map_default);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 49438a96fcc6..840babdd0794 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -42,8 +42,6 @@
 #define IS_VALID_CS_TRACE_ID(id)	\
 	((id > CORESIGHT_TRACE_ID_RES_0) && (id < CORESIGHT_TRACE_ID_RES_TOP))
 
-/* Allocate and release IDs for a single default trace ID map */
-
 /**
  * Read and optionally allocate a CoreSight trace ID and associate with a CPU.
  *
@@ -59,6 +57,12 @@
  */
 int coresight_trace_id_get_cpu_id(int cpu);
 
+/**
+ * Version of coresight_trace_id_get_cpu_id() that allows the ID map to operate
+ * on to be provided.
+ */
+int coresight_trace_id_get_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map);
+
 /**
  * Release an allocated trace ID associated with the CPU.
  *
@@ -72,6 +76,12 @@ int coresight_trace_id_get_cpu_id(int cpu);
  */
 void coresight_trace_id_put_cpu_id(int cpu);
 
+/**
+ * Version of coresight_trace_id_put_cpu_id() that allows the ID map to operate
+ * on to be provided.
+ */
+void coresight_trace_id_put_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map);
+
 /**
  * Read the current allocated CoreSight Trace ID value for the CPU.
  *
@@ -92,6 +102,12 @@ void coresight_trace_id_put_cpu_id(int cpu);
  */
 int coresight_trace_id_read_cpu_id(int cpu);
 
+/**
+ * Version of coresight_trace_id_read_cpu_id() that allows the ID map to operate
+ * on to be provided.
+ */
+int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map);
+
 /**
  * Allocate a CoreSight trace ID for a system component.
  *
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
