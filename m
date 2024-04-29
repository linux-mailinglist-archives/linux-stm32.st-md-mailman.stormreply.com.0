Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C38B5D82
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:24:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 983DBC71285;
	Mon, 29 Apr 2024 15:24:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00054C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:24:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E502F4;
 Mon, 29 Apr 2024 08:24:59 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 666D43F793;
 Mon, 29 Apr 2024 08:24:29 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: linux-perf-users@vger.kernel.org, gankulkarni@os.amperecomputing.com,
 scclevenger@os.amperecomputing.com, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, mike.leach@linaro.org
Date: Mon, 29 Apr 2024 16:21:52 +0100
Message-Id: <20240429152207.479221-8-james.clark@arm.com>
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
Subject: [Linux-stm32] [PATCH 07/17] perf: cs-etm: Support version 0.1 of
	HW_ID packets
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

v0.1 HW_ID packets have two new fields so that it's possible to describe
mappings that may be for a different CPU, but are valid in that queue.
Use the existing CPU field from the sample to decide which queue to
write the new mapping into, but use both of the new fields to create the
mapping.

When it becomes apparent that two queues share a sink by looking at
which CPUs are writing into that sink, make both queues share the same
traceid_list.

Also update the error message to show that overlapping IDs aren't an
error in per-thread mode, just not supported. In the future we can
use the CPU ID from the AUX record to place per-thread trace into the
correct queue which will solve the problem.

Signed-off-by: James Clark <james.clark@arm.com>
---
 tools/include/linux/coresight-pmu.h |  17 +++-
 tools/perf/util/cs-etm.c            | 122 +++++++++++++++++++++++++---
 2 files changed, 125 insertions(+), 14 deletions(-)

diff --git a/tools/include/linux/coresight-pmu.h b/tools/include/linux/coresight-pmu.h
index 51ac441a37c3..4a7fac6f66b9 100644
--- a/tools/include/linux/coresight-pmu.h
+++ b/tools/include/linux/coresight-pmu.h
@@ -49,12 +49,21 @@
  * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
  * Used to associate a CPU with the CoreSight Trace ID.
  * [07:00] - Trace ID - uses 8 bits to make value easy to read in file.
- * [59:08] - Unused (SBZ)
- * [63:60] - Version
+ * [15:08] - V2 Trace ID - ID for the ETM/CPU referenced by V2 CPU
+ * [31:16] - V2 CPU ID - CPU that corresponds to the trace ID in V2 trace ID
+ * [55:32] - Unused (SBZ)
+ * [59:56] - Minor Version - previously existing fields are compatible with
+ *	      all minor versions.
+ * [63:60] - Major Version - previously existing fields mean different things
+ *	      in new major versions.
  */
 #define CS_AUX_HW_ID_TRACE_ID_MASK	GENMASK_ULL(7, 0)
-#define CS_AUX_HW_ID_VERSION_MASK	GENMASK_ULL(63, 60)
+#define CS_AUX_HW_ID_V01_TRACE_ID_MASK	GENMASK_ULL(15, 8)
+#define CS_AUX_HW_ID_V01_CPU_MASK	GENMASK_ULL(31, 16)
+#define CS_AUX_HW_ID_MINOR_VERSION_MASK	GENMASK_ULL(59, 56)
+#define CS_AUX_HW_ID_MAJOR_VERSION_MASK	GENMASK_ULL(63, 60)
 
-#define CS_AUX_HW_ID_CURR_VERSION 0
+#define CS_AUX_HW_ID_MAJOR_VERSION 0
+#define CS_AUX_HW_ID_MINOR_VERSION 1
 
 #endif
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 73fc0ab2fb09..db459ce71b98 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -113,6 +113,8 @@ struct cs_etm_queue {
 	struct cs_etm_traceid_queue **traceid_queues;
 	/* Conversion between traceID and metadata pointers */
 	struct intlist *traceid_list;
+	/* Same as traceid_list, but traceid_list may be a reference to another queue's */
+	struct intlist *own_traceid_list;
 };
 
 static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm);
@@ -236,7 +238,16 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
 		int err;
 
 		if (curr_cpu_data[CS_ETM_CPU] != cpu_metadata[CS_ETM_CPU]) {
-			pr_err("CS_ETM: map mismatch between HW_ID packet CPU and Trace ID\n");
+			/*
+			 * With > CORESIGHT_TRACE_IDS_MAX ETMs, overlapping IDs
+			 * are expected (but not supported) in per-thread mode,
+			 * rather than signifying an error.
+			 */
+			if (etmq->etm->per_thread_decoding)
+				pr_err("CS_ETM: overlapping Trace IDs aren't currently supported in per-thread mode\n");
+			else
+				pr_err("CS_ETM: map mismatch between HW_ID packet CPU and Trace ID\n");
+
 			return -EINVAL;
 		}
 
@@ -303,6 +314,92 @@ static int cs_etm__process_trace_id_v0(struct cs_etm_auxtrace *etm, int cpu,
 	return cs_etm__metadata_set_trace_id(trace_chan_id, cpu_data);
 }
 
+static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int this_cpu,
+					 u64 hw_id)
+{
+	struct auxtrace_queue *this_aq, *aq;
+	struct cs_etm_queue *this_etmq, *etmq;
+	int ret, cpu;
+	u8 trace_id;
+	u64 *cpu_data;
+	struct int_node *inode, *tmp;
+	struct intlist *old_list;
+
+	cpu = FIELD_GET(CS_AUX_HW_ID_V01_CPU_MASK, hw_id);
+	trace_id = FIELD_GET(CS_AUX_HW_ID_V01_TRACE_ID_MASK, hw_id);
+
+	/* In per thread mode (cpu == -1) there is only one queue and it's index 0 */
+	if (etm->queues.queue_array[0].cpu == -1)
+		this_aq = aq = &etm->queues.queue_array[0];
+	else {
+		aq = &etm->queues.queue_array[cpu];
+		this_aq = &etm->queues.queue_array[this_cpu];
+	}
+
+	this_etmq = this_aq->priv;
+	etmq = aq->priv;
+
+	/* Ignore HW_IDs on unformatted queues */
+	if (this_etmq->formatted_set && !this_etmq->formatted)
+		return 0;
+
+	cpu_data = get_cpu_data(etm, cpu);
+	ret = cs_etm__insert_trace_id_node(this_etmq, trace_id, cpu_data);
+	if (ret)
+		return ret;
+
+	ret = cs_etm__metadata_set_trace_id(trace_id, cpu_data);
+	if (ret)
+		return ret;
+
+	/*
+	 * With each HW_ID we can also deduce valid mappings that were not
+	 * published by the kernel because later events were not yet created.
+	 * For example below we see CPU 0 has valid mappings for buffer 0. Once
+	 * we receive a mapping linking CPU 1 to buffers 0 and 1, we know that
+	 * CPU 0's mappings also apply to buffer 1, even though we never
+	 * received an explicit mapping for it. Below we can also see HW_IDs
+	 * can be received incrementally, and the earlier ones don't contain all
+	 * 3 mappings:
+	 *
+	 * CPU 0 PERF_RECORD_AUX_OUTPUT_HW_ID hw_id: 0x100000000001010
+	 *
+	 * CPU 1 PERF_RECORD_AUX_OUTPUT_HW_ID hw_id: 0x100000000001012
+	 * CPU 1 PERF_RECORD_AUX_OUTPUT_HW_ID hw_id: 0x100000000011212
+	 *  - implied: CPU 0  PERF_RECORD_AUX_OUTPUT_HW_ID hw_id:
+	 *    0x100000000011212
+	 *
+	 * CPU 2 PERF_RECORD_AUX_OUTPUT_HW_ID hw_id: 0x100000000001014
+	 * CPU 2 PERF_RECORD_AUX_OUTPUT_HW_ID hw_id: 0x100000000011214
+	 * CPU 2 PERF_RECORD_AUX_OUTPUT_HW_ID hw_id: 0x100000000021414
+	 *
+	 */
+
+	/* Mapping was for this queue, or queues are already linked */
+	if (this_cpu == cpu || this_etmq->traceid_list == etmq->traceid_list)
+		return 0;
+
+	/*
+	 * Received a mapping for someone elses ETM signifying that the
+	 * sink is shared. Copy its entries into this queue, and then make
+	 * both queues use the same traceID map.
+	 */
+	intlist__for_each_entry(inode, etmq->traceid_list) {
+		ret = cs_etm__insert_trace_id_node(this_etmq, inode->i, inode->priv);
+		if (ret)
+			return ret;
+	}
+
+	old_list = etmq->traceid_list;
+	etmq->traceid_list = this_etmq->traceid_list;
+	etmq->own_traceid_list = NULL;
+	intlist__for_each_entry_safe(inode, tmp, old_list)
+		intlist__remove(old_list, inode);
+	intlist__delete(old_list);
+
+	return 0;
+}
+
 static int cs_etm__metadata_get_trace_id(u8 *trace_chan_id, u64 *cpu_metadata)
 {
 	u64 cs_etm_magic = cpu_metadata[CS_ETM_MAGIC];
@@ -392,10 +489,10 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 
 	/* extract and parse the HW ID */
 	hw_id = event->aux_output_hw_id.hw_id;
-	version = FIELD_GET(CS_AUX_HW_ID_VERSION_MASK, hw_id);
+	version = FIELD_GET(CS_AUX_HW_ID_MAJOR_VERSION_MASK, hw_id);
 
 	/* check that we can handle this version */
-	if (version > CS_AUX_HW_ID_CURR_VERSION) {
+	if (version > CS_AUX_HW_ID_MAJOR_VERSION) {
 		pr_err("CS ETM Trace: PERF_RECORD_AUX_OUTPUT_HW_ID version %d not supported. Please update Perf.\n",
 		       version);
 		return -EINVAL;
@@ -420,7 +517,10 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 		return -EINVAL;
 	}
 
-	return cs_etm__process_trace_id_v0(etm, cpu, hw_id);
+	if (FIELD_GET(CS_AUX_HW_ID_MINOR_VERSION_MASK, hw_id) == 0)
+		return cs_etm__process_trace_id_v0(etm, cpu, hw_id);
+	else
+		return cs_etm__process_trace_id_v0_1(etm, cpu, hw_id);
 }
 
 void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
@@ -860,12 +960,14 @@ static void cs_etm__free_queue(void *priv)
 	cs_etm_decoder__free(etmq->decoder);
 	cs_etm__free_traceid_queues(etmq);
 
-	/* First remove all traceID/metadata nodes for the RB tree */
-	intlist__for_each_entry_safe(inode, tmp, etmq->traceid_list)
-		intlist__remove(etmq->traceid_list, inode);
+	if (etmq->own_traceid_list) {
+		/* First remove all traceID/metadata nodes for the RB tree */
+		intlist__for_each_entry_safe(inode, tmp, etmq->own_traceid_list)
+			intlist__remove(etmq->own_traceid_list, inode);
 
-	/* Then the RB tree itself */
-	intlist__delete(etmq->traceid_list);
+		/* Then the RB tree itself */
+		intlist__delete(etmq->own_traceid_list);
+	}
 
 	free(etmq);
 }
@@ -1059,7 +1161,7 @@ static struct cs_etm_queue *cs_etm__alloc_queue(void)
 	 * has to be made for each packet that gets decoded, optimizing access
 	 * in anything other than a sequential array is worth doing.
 	 */
-	etmq->traceid_list = intlist__new(NULL);
+	etmq->traceid_list = etmq->own_traceid_list = intlist__new(NULL);
 	if (!etmq->traceid_list)
 		goto out_free;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
