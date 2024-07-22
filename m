Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7593FA0F
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51400C78F85;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B4E0C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:12:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-368440b073bso1851742f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643154; x=1722247954;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkQSmEJS+t8PI7d2qYJdf6z1Fx7Gi/uVI/oujEUZvqI=;
 b=NNY6z1nCnZdXkToLfxF5KacsLtA4saIlwxnKswwXv7nQ+FSr4W6wV4gvxNTbrJano3
 ree4CStpJ3/uEmq/YisDQYn3SE4ONicsvEvv4XSqzO+9jcEx2IA/vypiiKAl8Hc+N3n5
 jJ7p3/NobbGVXojqmSjRM7tNqsFp9EsDZw71VtBXbzU7uEWBdn9rQyRgekShnKmP8f3X
 HnAi40r2Kbt14Mw7urq7VQcBXkwb6lalMv2l/+n3UTi5zk4Xi9aicaxwz5jVUGEOkq7Q
 Gdvh5bRJlpTH9oAvei6WXD3NML3JVzM9u4WqPfIxz6bIVWKASticaOvVL+xoJzBdYz4Q
 RQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643154; x=1722247954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkQSmEJS+t8PI7d2qYJdf6z1Fx7Gi/uVI/oujEUZvqI=;
 b=HNvd6log2PXK63I1M4NCmzNCUnsYV0SbJURwwvwxbXOtKe1yCUzM+NNZvV2vLnZhit
 V0SeL1eNBGXH7Vl5qn9zQleYAVEY5BuTP9DAJm+/C0Lxv1UxduLbMYOLzseIh9IkHeRY
 3WxVirB3Qx6SvAMvgu2MTgYcP+te+0tbWdqIIWd/DxnwURZxL3jKoPEnAHvHOnz2L3St
 LGOjgq+xGEQJzzezma/QpXOQfiUvNA4Ic4xcKxUyOR43p8BI4ueb4EbV1lv0OwY7lwGM
 QLrPc4dEft4x4IRS43aNxWId/x+9ihfSfikFAmc0LhVhGNg2xshkWqmOhuDvnkGMnJQu
 yNmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/R+mQorWx61NQHrLHWo54qX143A810f+BXoIXSmuTUArpxMn8NIPQSAMv5lzsixq+88AKKAFp8/RsrejS9jR+62Y0N0XujYCzBeWjaUzfh1EeKmLZ5xMw
X-Gm-Message-State: AOJu0YxNkeXvmN2zdZXFzt5OUB2GQUEs7tffWjRyetkMdYMgKK64dL4u
 7Fmv6UTT2ytFdFS0YdAhrDSPUI2gbUPEx2DpexPs2UGy3WFKuqpiZ/2vLFymGXo=
X-Google-Smtp-Source: AGHT+IHaH2YPtNhqmGIdGUn2Rz8Y3/TRQlQzrPvH5PCPU/tFrburbnXfon+bZ/y+MdEK0Yaa82czPQ==
X-Received: by 2002:adf:f34c:0:b0:363:337a:3e0 with SMTP id
 ffacd0b85a97d-36873dc1f2dmr6268468f8f.1.1721643153600; 
 Mon, 22 Jul 2024 03:12:33 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:12:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:43 +0100
Message-Id: <20240722101202.26915-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722101202.26915-1-james.clark@linaro.org>
References: <20240722101202.26915-1-james.clark@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v6 01/17] perf: cs-etm: Create decoders after
	both AUX and HW_ID search passes
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

From: James Clark <james.clark@arm.com>

Both of these passes gather information about how to create the
decoders. AUX records determine formatted/unformatted, and the HW_IDs
determine the traceID/metadata mappings. Therefore it makes sense to
cache the information and wait until both passes are over until creating
the decoders, rather than creating them at the first HW_ID found. This
will allow a simplification of the creation process where
cs_etm_queue->traceid_list will exclusively used to create the decoders,
rather than the current two methods depending on whether the trace is
formatted or not.

Previously the sample CPU from the AUX record was used to initialize
the decoder CPU, but actually sample CPU == AUX queue index in per-CPU
mode, so saving the sample CPU isn't required. Similarly
formatted/unformatted was used upfront to create the decoders, but now
it's cached until later.

Signed-off-by: James Clark <james.clark@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Tested-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 182 ++++++++++++++++++++++++---------------
 1 file changed, 113 insertions(+), 69 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 32818bd7cd17..f4a378cb66f6 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -97,12 +97,19 @@ struct cs_etm_traceid_queue {
 	struct cs_etm_packet_queue packet_queue;
 };
 
+enum cs_etm_format {
+	UNSET,
+	FORMATTED,
+	UNFORMATTED
+};
+
 struct cs_etm_queue {
 	struct cs_etm_auxtrace *etm;
 	struct cs_etm_decoder *decoder;
 	struct auxtrace_buffer *buffer;
 	unsigned int queue_nr;
 	u8 pending_timestamp_chan_id;
+	enum cs_etm_format format;
 	u64 offset;
 	const unsigned char *buf;
 	size_t buf_len, buf_used;
@@ -696,7 +703,7 @@ static void cs_etm__set_trace_param_ete(struct cs_etm_trace_params *t_params,
 
 static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
 				     struct cs_etm_auxtrace *etm,
-				     bool formatted,
+				     enum cs_etm_format format,
 				     int sample_cpu,
 				     int decoders)
 {
@@ -705,7 +712,7 @@ static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
 	u64 architecture;
 
 	for (t_idx = 0; t_idx < decoders; t_idx++) {
-		if (formatted)
+		if (format == FORMATTED)
 			m_idx = t_idx;
 		else {
 			m_idx = get_cpu_data_idx(etm, sample_cpu);
@@ -738,8 +745,7 @@ static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
 
 static int cs_etm__init_decoder_params(struct cs_etm_decoder_params *d_params,
 				       struct cs_etm_queue *etmq,
-				       enum cs_etm_decoder_operation mode,
-				       bool formatted)
+				       enum cs_etm_decoder_operation mode)
 {
 	int ret = -EINVAL;
 
@@ -749,7 +755,7 @@ static int cs_etm__init_decoder_params(struct cs_etm_decoder_params *d_params,
 	d_params->packet_printer = cs_etm__packet_dump;
 	d_params->operation = mode;
 	d_params->data = etmq;
-	d_params->formatted = formatted;
+	d_params->formatted = etmq->format == FORMATTED;
 	d_params->fsyncs = false;
 	d_params->hsyncs = false;
 	d_params->frame_aligned = true;
@@ -1041,81 +1047,34 @@ static u32 cs_etm__mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
 	return ret;
 }
 
-static struct cs_etm_queue *cs_etm__alloc_queue(struct cs_etm_auxtrace *etm,
-						bool formatted, int sample_cpu)
+static struct cs_etm_queue *cs_etm__alloc_queue(void)
 {
-	struct cs_etm_decoder_params d_params;
-	struct cs_etm_trace_params  *t_params = NULL;
-	struct cs_etm_queue *etmq;
-	/*
-	 * Each queue can only contain data from one CPU when unformatted, so only one decoder is
-	 * needed.
-	 */
-	int decoders = formatted ? etm->num_cpu : 1;
-
-	etmq = zalloc(sizeof(*etmq));
+	struct cs_etm_queue *etmq = zalloc(sizeof(*etmq));
 	if (!etmq)
 		return NULL;
 
 	etmq->traceid_queues_list = intlist__new(NULL);
 	if (!etmq->traceid_queues_list)
-		goto out_free;
-
-	/* Use metadata to fill in trace parameters for trace decoder */
-	t_params = zalloc(sizeof(*t_params) * decoders);
-
-	if (!t_params)
-		goto out_free;
-
-	if (cs_etm__init_trace_params(t_params, etm, formatted, sample_cpu, decoders))
-		goto out_free;
-
-	/* Set decoder parameters to decode trace packets */
-	if (cs_etm__init_decoder_params(&d_params, etmq,
-					dump_trace ? CS_ETM_OPERATION_PRINT :
-						     CS_ETM_OPERATION_DECODE,
-					formatted))
-		goto out_free;
-
-	etmq->decoder = cs_etm_decoder__new(decoders, &d_params,
-					    t_params);
-
-	if (!etmq->decoder)
-		goto out_free;
-
-	/*
-	 * Register a function to handle all memory accesses required by
-	 * the trace decoder library.
-	 */
-	if (cs_etm_decoder__add_mem_access_cb(etmq->decoder,
-					      0x0L, ((u64) -1L),
-					      cs_etm__mem_access))
-		goto out_free_decoder;
+		free(etmq);
 
-	zfree(&t_params);
 	return etmq;
-
-out_free_decoder:
-	cs_etm_decoder__free(etmq->decoder);
-out_free:
-	intlist__delete(etmq->traceid_queues_list);
-	free(etmq);
-
-	return NULL;
 }
 
 static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 			       struct auxtrace_queue *queue,
-			       unsigned int queue_nr,
-			       bool formatted,
-			       int sample_cpu)
+			       unsigned int queue_nr, enum cs_etm_format format)
 {
 	struct cs_etm_queue *etmq = queue->priv;
 
+	if (etmq && format != etmq->format) {
+		pr_err("CS_ETM: mixed formatted and unformatted trace not supported\n");
+		return -EINVAL;
+	}
+
 	if (list_empty(&queue->head) || etmq)
 		return 0;
 
-	etmq = cs_etm__alloc_queue(etm, formatted, sample_cpu);
+	etmq = cs_etm__alloc_queue();
 
 	if (!etmq)
 		return -ENOMEM;
@@ -1123,7 +1082,9 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 	queue->priv = etmq;
 	etmq->etm = etm;
 	etmq->queue_nr = queue_nr;
+	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
 	etmq->offset = 0;
+	etmq->format = format;
 
 	return 0;
 }
@@ -2843,7 +2804,7 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 		 * formatted in piped mode (true).
 		 */
 		err = cs_etm__setup_queue(etm, &etm->queues.queue_array[idx],
-					  idx, true, -1);
+					  idx, FORMATTED);
 		if (err)
 			return err;
 
@@ -2964,7 +2925,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	union perf_event auxtrace_fragment;
 	__u64 aux_offset, aux_size;
 	__u32 idx;
-	bool formatted;
+	enum cs_etm_format format;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
@@ -3047,9 +3008,10 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 			return err;
 
 		idx = auxtrace_event->idx;
-		formatted = !(aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
-		return cs_etm__setup_queue(etm, &etm->queues.queue_array[idx],
-					   idx, formatted, sample->cpu);
+		format = (aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW) ?
+				UNFORMATTED : FORMATTED;
+
+		return cs_etm__setup_queue(etm, &etm->queues.queue_array[idx], idx, format);
 	}
 
 	/* Wasn't inside this buffer, but there were no parse errors. 1 == 'not found' */
@@ -3233,6 +3195,84 @@ static int cs_etm__clear_unused_trace_ids_metadata(int num_cpu, u64 **metadata)
 	return 0;
 }
 
+/*
+ * Use the data gathered by the peeks for HW_ID (trace ID mappings) and AUX
+ * (formatted or not) packets to create the decoders.
+ */
+static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
+{
+	struct cs_etm_decoder_params d_params;
+
+	/*
+	 * Each queue can only contain data from one CPU when unformatted, so only one decoder is
+	 * needed.
+	 */
+	int decoders = etmq->format == FORMATTED ? etmq->etm->num_cpu : 1;
+
+	/* Use metadata to fill in trace parameters for trace decoder */
+	struct cs_etm_trace_params  *t_params = zalloc(sizeof(*t_params) * decoders);
+
+	if (!t_params)
+		goto out_free;
+
+	if (cs_etm__init_trace_params(t_params, etmq->etm, etmq->format,
+				      etmq->queue_nr, decoders))
+		goto out_free;
+
+	/* Set decoder parameters to decode trace packets */
+	if (cs_etm__init_decoder_params(&d_params, etmq,
+					dump_trace ? CS_ETM_OPERATION_PRINT :
+						     CS_ETM_OPERATION_DECODE))
+		goto out_free;
+
+	etmq->decoder = cs_etm_decoder__new(decoders, &d_params,
+					    t_params);
+
+	if (!etmq->decoder)
+		goto out_free;
+
+	/*
+	 * Register a function to handle all memory accesses required by
+	 * the trace decoder library.
+	 */
+	if (cs_etm_decoder__add_mem_access_cb(etmq->decoder,
+					      0x0L, ((u64) -1L),
+					      cs_etm__mem_access))
+		goto out_free_decoder;
+
+	zfree(&t_params);
+	return 0;
+
+out_free_decoder:
+	cs_etm_decoder__free(etmq->decoder);
+out_free:
+	zfree(&t_params);
+	return -EINVAL;
+}
+
+static int cs_etm__create_decoders(struct cs_etm_auxtrace *etm)
+{
+	struct auxtrace_queues *queues = &etm->queues;
+
+	for (unsigned int i = 0; i < queues->nr_queues; i++) {
+		bool empty = list_empty(&queues->queue_array[i].head);
+		struct cs_etm_queue *etmq = queues->queue_array[i].priv;
+		int ret;
+
+		/*
+		 * Don't create decoders for empty queues, mainly because
+		 * etmq->format is unknown for empty queues.
+		 */
+		if (empty)
+			continue;
+
+		ret = cs_etm__create_queue_decoders(etmq);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 int cs_etm__process_auxtrace_info_full(union perf_event *event,
 				       struct perf_session *session)
 {
@@ -3396,6 +3436,10 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	if (err)
 		goto err_free_queues;
 
+	err = cs_etm__queue_aux_records(session);
+	if (err)
+		goto err_free_queues;
+
 	/*
 	 * Map Trace ID values to CPU metadata.
 	 *
@@ -3418,7 +3462,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	 * flags if present.
 	 */
 
-	/* first scan for AUX_OUTPUT_HW_ID records to map trace ID values to CPU metadata */
+	/* Scan for AUX_OUTPUT_HW_ID records to map trace ID values to CPU metadata */
 	aux_hw_id_found = 0;
 	err = perf_session__peek_events(session, session->header.data_offset,
 					session->header.data_size,
@@ -3436,7 +3480,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	if (err)
 		goto err_free_queues;
 
-	err = cs_etm__queue_aux_records(session);
+	err = cs_etm__create_decoders(etm);
 	if (err)
 		goto err_free_queues;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
