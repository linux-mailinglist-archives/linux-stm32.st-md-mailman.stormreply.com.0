Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED78FB552
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 16:32:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F3A3C7128E;
	Tue,  4 Jun 2024 14:32:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0468C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 14:32:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCDB21063;
 Tue,  4 Jun 2024 07:32:30 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 251373F64C;
 Tue,  4 Jun 2024 07:32:03 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Tue,  4 Jun 2024 15:30:15 +0100
Message-Id: <20240604143030.519906-7-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604143030.519906-1-james.clark@arm.com>
References: <20240604143030.519906-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 06/16] perf: cs-etm: Create decoders based
	on the trace ID mappings
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

Now that each queue has a unique set of trace ID mappings, use this
list to create the decoders. This also works the same way for
unformatted where a single dummy entry is added into the trace ID list.

Previously each queue would have a decoder created for each traced CPU
on the system but this won't work anymore because CPUs can have
overlapping trace IDs.

Signed-off-by: James Clark <james.clark@arm.com>
---
 tools/perf/util/cs-etm.c | 143 +++++++++++++++++++++++----------------
 1 file changed, 85 insertions(+), 58 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index be858aed26c4..73fc0ab2fb09 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -268,6 +268,10 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 		int ret;
 		struct cs_etm_queue *etmq = etm->queues.queue_array[i].priv;
 
+		/* Ignore HW_IDs on unformatted queues */
+		if (etmq->formatted_set && !etmq->formatted)
+			continue;
+
 		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,
 						   cpu_metadata);
 		if (ret)
@@ -673,80 +677,58 @@ static void cs_etm__packet_dump(const char *pkt_string)
 }
 
 static void cs_etm__set_trace_param_etmv3(struct cs_etm_trace_params *t_params,
-					  struct cs_etm_auxtrace *etm, int t_idx,
-					  int m_idx, u32 etmidr)
+					  u64 *metadata, u32 etmidr)
 {
-	u64 **metadata = etm->metadata;
-
-	t_params[t_idx].protocol = cs_etm__get_v7_protocol_version(etmidr);
-	t_params[t_idx].etmv3.reg_ctrl = metadata[m_idx][CS_ETM_ETMCR];
-	t_params[t_idx].etmv3.reg_trc_id = metadata[m_idx][CS_ETM_ETMTRACEIDR];
+	t_params->protocol = cs_etm__get_v7_protocol_version(etmidr);
+	t_params->etmv3.reg_ctrl = metadata[CS_ETM_ETMCR];
+	t_params->etmv3.reg_trc_id = metadata[CS_ETM_ETMTRACEIDR];
 }
 
 static void cs_etm__set_trace_param_etmv4(struct cs_etm_trace_params *t_params,
-					  struct cs_etm_auxtrace *etm, int t_idx,
-					  int m_idx)
+					  u64 *metadata)
 {
-	u64 **metadata = etm->metadata;
-
-	t_params[t_idx].protocol = CS_ETM_PROTO_ETMV4i;
-	t_params[t_idx].etmv4.reg_idr0 = metadata[m_idx][CS_ETMV4_TRCIDR0];
-	t_params[t_idx].etmv4.reg_idr1 = metadata[m_idx][CS_ETMV4_TRCIDR1];
-	t_params[t_idx].etmv4.reg_idr2 = metadata[m_idx][CS_ETMV4_TRCIDR2];
-	t_params[t_idx].etmv4.reg_idr8 = metadata[m_idx][CS_ETMV4_TRCIDR8];
-	t_params[t_idx].etmv4.reg_configr = metadata[m_idx][CS_ETMV4_TRCCONFIGR];
-	t_params[t_idx].etmv4.reg_traceidr = metadata[m_idx][CS_ETMV4_TRCTRACEIDR];
+	t_params->protocol = CS_ETM_PROTO_ETMV4i;
+	t_params->etmv4.reg_idr0 = metadata[CS_ETMV4_TRCIDR0];
+	t_params->etmv4.reg_idr1 = metadata[CS_ETMV4_TRCIDR1];
+	t_params->etmv4.reg_idr2 = metadata[CS_ETMV4_TRCIDR2];
+	t_params->etmv4.reg_idr8 = metadata[CS_ETMV4_TRCIDR8];
+	t_params->etmv4.reg_configr = metadata[CS_ETMV4_TRCCONFIGR];
+	t_params->etmv4.reg_traceidr = metadata[CS_ETMV4_TRCTRACEIDR];
 }
 
 static void cs_etm__set_trace_param_ete(struct cs_etm_trace_params *t_params,
-					  struct cs_etm_auxtrace *etm, int t_idx,
-					  int m_idx)
+					u64 *metadata)
 {
-	u64 **metadata = etm->metadata;
-
-	t_params[t_idx].protocol = CS_ETM_PROTO_ETE;
-	t_params[t_idx].ete.reg_idr0 = metadata[m_idx][CS_ETE_TRCIDR0];
-	t_params[t_idx].ete.reg_idr1 = metadata[m_idx][CS_ETE_TRCIDR1];
-	t_params[t_idx].ete.reg_idr2 = metadata[m_idx][CS_ETE_TRCIDR2];
-	t_params[t_idx].ete.reg_idr8 = metadata[m_idx][CS_ETE_TRCIDR8];
-	t_params[t_idx].ete.reg_configr = metadata[m_idx][CS_ETE_TRCCONFIGR];
-	t_params[t_idx].ete.reg_traceidr = metadata[m_idx][CS_ETE_TRCTRACEIDR];
-	t_params[t_idx].ete.reg_devarch = metadata[m_idx][CS_ETE_TRCDEVARCH];
+	t_params->protocol = CS_ETM_PROTO_ETE;
+	t_params->ete.reg_idr0 = metadata[CS_ETE_TRCIDR0];
+	t_params->ete.reg_idr1 = metadata[CS_ETE_TRCIDR1];
+	t_params->ete.reg_idr2 = metadata[CS_ETE_TRCIDR2];
+	t_params->ete.reg_idr8 = metadata[CS_ETE_TRCIDR8];
+	t_params->ete.reg_configr = metadata[CS_ETE_TRCCONFIGR];
+	t_params->ete.reg_traceidr = metadata[CS_ETE_TRCTRACEIDR];
+	t_params->ete.reg_devarch = metadata[CS_ETE_TRCDEVARCH];
 }
 
 static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
-				     struct cs_etm_auxtrace *etm,
-				     bool formatted,
-				     int sample_cpu,
-				     int decoders)
-{
-	int t_idx, m_idx;
-	u32 etmidr;
-	u64 architecture;
-
-	for (t_idx = 0; t_idx < decoders; t_idx++) {
-		if (formatted)
-			m_idx = t_idx;
-		else {
-			m_idx = get_cpu_data_idx(etm, sample_cpu);
-			if (m_idx == -1) {
-				pr_warning("CS_ETM: unknown CPU, falling back to first metadata\n");
-				m_idx = 0;
-			}
-		}
+				     struct cs_etm_queue *etmq)
+{
+	struct int_node *inode;
 
-		architecture = etm->metadata[m_idx][CS_ETM_MAGIC];
+	intlist__for_each_entry(inode, etmq->traceid_list) {
+		u64 *metadata = inode->priv;
+		u64 architecture = metadata[CS_ETM_MAGIC];
+		u32 etmidr;
 
 		switch (architecture) {
 		case __perf_cs_etmv3_magic:
-			etmidr = etm->metadata[m_idx][CS_ETM_ETMIDR];
-			cs_etm__set_trace_param_etmv3(t_params, etm, t_idx, m_idx, etmidr);
+			etmidr = metadata[CS_ETM_ETMIDR];
+			cs_etm__set_trace_param_etmv3(t_params++, metadata, etmidr);
 			break;
 		case __perf_cs_etmv4_magic:
-			cs_etm__set_trace_param_etmv4(t_params, etm, t_idx, m_idx);
+			cs_etm__set_trace_param_etmv4(t_params++, metadata);
 			break;
 		case __perf_cs_ete_magic:
-			cs_etm__set_trace_param_ete(t_params, etm, t_idx, m_idx);
+			cs_etm__set_trace_param_ete(t_params++, metadata);
 			break;
 		default:
 			return -EINVAL;
@@ -2918,6 +2900,42 @@ static u64 *cs_etm__create_meta_blk(u64 *buff_in, int *buff_in_offset,
 	return metadata;
 }
 
+/*
+ * traceid_list is used to create decoders and give them the trace ID
+ * mappings. In unformatted mode just insert one entry for the sample
+ * CPU so the decoder knows which settings to use.
+ */
+static int cs_etm__map_trace_ids_unformatted(struct cs_etm_auxtrace *etm)
+{
+	for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
+		int ret;
+		struct cs_etm_queue *etmq;
+		u8 trace_chan_id;
+		u64 *cpu_data;
+
+		etmq = etm->queues.queue_array[i].priv;
+		if (!etmq->formatted_set || etmq->formatted)
+			continue;
+
+		/* Giving it a real ID doesn't do much but can help with debugging */
+		trace_chan_id = CORESIGHT_LEGACY_CPU_TRACE_ID(i);
+		cpu_data = get_cpu_data(etm, i);
+		if (cpu_data == NULL) {
+			pr_warning("CS_ETM: unknown CPU, falling back to first metadata\n");
+			cpu_data = etm->metadata[0];
+		}
+
+		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id, cpu_data);
+		if (ret)
+			return ret;
+
+		ret = cs_etm__metadata_set_trace_id(trace_chan_id, cpu_data);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * Puts a fragment of an auxtrace buffer into the auxtrace queues based
  * on the bounds of aux_event, if it matches with the buffer that's at
@@ -3220,21 +3238,26 @@ static int cs_etm__clear_unused_trace_ids_metadata(int num_cpu, u64 **metadata)
 static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 {
 	struct cs_etm_decoder_params d_params;
+	struct cs_etm_trace_params  *t_params;
+	int decoders = intlist__nr_entries(etmq->traceid_list);
 
 	/*
 	 * Each queue can only contain data from one CPU when unformatted, so only one decoder is
 	 * needed.
 	 */
-	int decoders = etmq->formatted ? etmq->etm->num_cpu : 1;
+	if (etmq->formatted_set && !etmq->formatted)
+		assert(decoders == 1);
+
+	if (decoders == 0)
+		return 0;
 
 	/* Use metadata to fill in trace parameters for trace decoder */
-	struct cs_etm_trace_params  *t_params = zalloc(sizeof(*t_params) * decoders);
+	t_params = zalloc(sizeof(*t_params) * decoders);
 
 	if (!t_params)
 		goto out_free;
 
-	if (cs_etm__init_trace_params(t_params, etmq->etm, etmq->formatted,
-				      etmq->queue_nr, decoders))
+	if (cs_etm__init_trace_params(t_params, etmq))
 		goto out_free;
 
 	/* Set decoder parameters to decode trace packets */
@@ -3497,6 +3520,10 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	if (err)
 		goto err_free_queues;
 
+	err = cs_etm__map_trace_ids_unformatted(etm);
+	if (err)
+		goto err_free_queues;
+
 	err = cs_etm__create_decoders(etm);
 	if (err)
 		goto err_free_queues;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
