Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BF93F9EF
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 747FCC7801F;
	Mon, 29 Jul 2024 15:58:22 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 040D8C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:22:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-36799a67d9cso1358547f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779739; x=1721384539;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+pc5donmvg/OK1Bm2RLmni0QwXbiboabjfXClFm1K0=;
 b=l1BzFfqyz2uo0VyVNdRN2oToymx6sZ7gnTdfG1ndRC73VPhOGAtJG62fP9Ghb+h7wL
 M6dSAtrzsey7P43d2unfZgL2j7k6ylbspBK4FVFSFqgeHV+UunUFi6kd34hnmXCtX+3u
 88Owv6C4fnT5ivmWrQNmYsoi5BwfxVSZu53pwfEbeH+l0knzALlA969amGN6oZJC8G9v
 Me24QT1wGSRjvJFNpmXf7VOcCxatad0u9+bn/2cAwzECROHrUwyK+HOs92Osvw1Iraf7
 wQgnUpZ3Jk12Wu26asvhmJmf1SkCKW/P5DPvcR8yTFCnbJjZ/2X5uc1XDXAyGYIRylej
 4rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779739; x=1721384539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+pc5donmvg/OK1Bm2RLmni0QwXbiboabjfXClFm1K0=;
 b=FeKI26EhdoAp9kWHGJcRrXo3t5baJ3yQPdtT8zU7IDd60cJQHGPJGEdbmCatBbryjX
 C72vHfstvRQdRHbLPVvnPmyG389EDhq42PP3qDVvKuWA5z4PEu1Tz3fbUyG68BbZ+Hf8
 KwJh3q/PS6dMtjVNVEw2qDeeiUZfMYLJ+8sbVGEiLhrR12i9TE5Ka8Iso+YFH5o2RGHx
 bnZUS3IMxnHJtlOCKsyGHzvB9a7+3kOIsI76hdonJX3j+SCF4g3H25MmsmuRPHvrbS30
 VLS7+g/qvIVNlP2DSkOC5JmVKZpzM6ljvzKPannC0eKB/LhEjQpItiyrI4iFP328ljf/
 oDEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX32wANnTzP1SQVL0YBrP7qIUNiUpIO98M7ie5NjmQkn1UZHRjldPgVrFC0d5ptAVTzSn1RcBbgK39ZxFA7FgFssiy70FjSPXWHulIZ+35thNhmARN/HA7D
X-Gm-Message-State: AOJu0Yw5rzgcvhtKnKN1AnUmxmtfQeJavStSgadEFaA9X0Q9Ldfb8CzO
 vwZY+PPezt184XGf9PpoIBifjGi8ZyEJligXs4YdWl4/aExWCgY1I0CxE4yVkHo=
X-Google-Smtp-Source: AGHT+IHOAIOfCRod06OlcZ5ANlzMmFjjgRo8/bARChE6gnAyhunVZT4zaek6BiyD/faYihcGyWmF6g==
X-Received: by 2002:adf:ce12:0:b0:366:f34d:d0b7 with SMTP id
 ffacd0b85a97d-367cea8f9b2mr8886266f8f.29.1720779739395; 
 Fri, 12 Jul 2024 03:22:19 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:22:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:11 +0100
Message-Id: <20240712102029.3697965-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712102029.3697965-1-james.clark@linaro.org>
References: <20240712102029.3697965-1-james.clark@linaro.org>
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
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v5 02/17] perf: cs-etm: Allocate queues for
	all CPUs
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

Make cs_etm__setup_queue() setup a queue even if it's empty, and
pre-allocate queues based on the max CPU that was recorded. In per-CPU
mode aux queues are indexed based on CPU ID even if all CPUs aren't
recorded, sparse queue arrays aren't used.

This will allow HW_IDs to be saved even if no aux data was received in
that queue without having to call cs_etm__setup_queue() from two
different places.

Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 76 +++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index f09004c4ba44..1a95c4bb898f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -97,13 +97,19 @@ struct cs_etm_traceid_queue {
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
-	bool formatted;
+	enum cs_etm_format format;
 	u64 offset;
 	const unsigned char *buf;
 	size_t buf_len, buf_used;
@@ -697,7 +703,7 @@ static void cs_etm__set_trace_param_ete(struct cs_etm_trace_params *t_params,
 
 static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
 				     struct cs_etm_auxtrace *etm,
-				     bool formatted,
+				     enum cs_etm_format format,
 				     int sample_cpu,
 				     int decoders)
 {
@@ -706,7 +712,7 @@ static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
 	u64 architecture;
 
 	for (t_idx = 0; t_idx < decoders; t_idx++) {
-		if (formatted)
+		if (format == FORMATTED)
 			m_idx = t_idx;
 		else {
 			m_idx = get_cpu_data_idx(etm, sample_cpu);
@@ -749,7 +755,7 @@ static int cs_etm__init_decoder_params(struct cs_etm_decoder_params *d_params,
 	d_params->packet_printer = cs_etm__packet_dump;
 	d_params->operation = mode;
 	d_params->data = etmq;
-	d_params->formatted = etmq->formatted;
+	d_params->formatted = etmq->format == FORMATTED;
 	d_params->fsyncs = false;
 	d_params->hsyncs = false;
 	d_params->frame_aligned = true;
@@ -1056,16 +1062,11 @@ static struct cs_etm_queue *cs_etm__alloc_queue(void)
 
 static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 			       struct auxtrace_queue *queue,
-			       unsigned int queue_nr, bool formatted)
+			       unsigned int queue_nr)
 {
 	struct cs_etm_queue *etmq = queue->priv;
 
-	if (etmq && formatted != etmq->formatted) {
-		pr_err("CS_ETM: mixed formatted and unformatted trace not supported\n");
-		return -EINVAL;
-	}
-
-	if (list_empty(&queue->head) || etmq)
+	if (etmq)
 		return 0;
 
 	etmq = cs_etm__alloc_queue();
@@ -1078,7 +1079,6 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 	etmq->queue_nr = queue_nr;
 	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
 	etmq->offset = 0;
-	etmq->formatted = formatted;
 
 	return 0;
 }
@@ -2791,17 +2791,6 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 		if (err)
 			return err;
 
-		/*
-		 * Knowing if the trace is formatted or not requires a lookup of
-		 * the aux record so only works in non-piped mode where data is
-		 * queued in cs_etm__queue_aux_records(). Always assume
-		 * formatted in piped mode (true).
-		 */
-		err = cs_etm__setup_queue(etm, &etm->queues.queue_array[idx],
-					  idx, true);
-		if (err)
-			return err;
-
 		if (dump_trace)
 			if (auxtrace_buffer__get_data(buffer, fd)) {
 				cs_etm__dump_event(etm->queues.queue_array[idx].priv, buffer);
@@ -2918,8 +2907,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	struct perf_record_auxtrace *auxtrace_event;
 	union perf_event auxtrace_fragment;
 	__u64 aux_offset, aux_size;
-	__u32 idx;
-	bool formatted;
+	enum cs_etm_format format;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
@@ -2985,6 +2973,8 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
+		struct cs_etm_queue *etmq = etm->queues.queue_array[auxtrace_event->idx].priv;
+
 		/*
 		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
 		 * based on the sizes of the aux event, and queue that fragment.
@@ -3001,10 +2991,14 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		if (err)
 			return err;
 
-		idx = auxtrace_event->idx;
-		formatted = !(aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
-
-		return cs_etm__setup_queue(etm, &etm->queues.queue_array[idx], idx, formatted);
+		format = (aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW) ?
+				UNFORMATTED : FORMATTED;
+		if (etmq->format != UNSET && format != etmq->format) {
+			pr_err("CS_ETM: mixed formatted and unformatted trace not supported\n");
+			return -EINVAL;
+		}
+		etmq->format = format;
+		return 0;
 	}
 
 	/* Wasn't inside this buffer, but there were no parse errors. 1 == 'not found' */
@@ -3200,7 +3194,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 	 * Each queue can only contain data from one CPU when unformatted, so only one decoder is
 	 * needed.
 	 */
-	int decoders = etmq->formatted ? etmq->etm->num_cpu : 1;
+	int decoders = etmq->format == FORMATTED ? etmq->etm->num_cpu : 1;
 
 	/* Use metadata to fill in trace parameters for trace decoder */
 	struct cs_etm_trace_params  *t_params = zalloc(sizeof(*t_params) * decoders);
@@ -3208,7 +3202,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 	if (!t_params)
 		goto out_free;
 
-	if (cs_etm__init_trace_params(t_params, etmq->etm, etmq->formatted,
+	if (cs_etm__init_trace_params(t_params, etmq->etm, etmq->format,
 				      etmq->queue_nr, decoders))
 		goto out_free;
 
@@ -3256,6 +3250,7 @@ static int cs_etm__create_decoders(struct cs_etm_auxtrace *etm)
 		 * Don't create decoders for empty queues, mainly because
 		 * etmq->formatted is unknown for empty queues.
 		 */
+		assert(empty == (etmq->format == UNSET));
 		if (empty)
 			continue;
 
@@ -3275,10 +3270,10 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	int event_header_size = sizeof(struct perf_event_header);
 	int total_size = auxtrace_info->header.size;
 	int priv_size = 0;
-	int num_cpu;
+	int num_cpu, max_cpu = 0;
 	int err = 0;
 	int aux_hw_id_found;
-	int i, j;
+	int i;
 	u64 *ptr = NULL;
 	u64 **metadata = NULL;
 
@@ -3309,7 +3304,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	 * required by the trace decoder to properly decode the trace due
 	 * to its highly compressed nature.
 	 */
-	for (j = 0; j < num_cpu; j++) {
+	for (int j = 0; j < num_cpu; j++) {
 		if (ptr[i] == __perf_cs_etmv3_magic) {
 			metadata[j] =
 				cs_etm__create_meta_blk(ptr, &i,
@@ -3333,6 +3328,9 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 			err = -ENOMEM;
 			goto err_free_metadata;
 		}
+
+		if ((int) metadata[j][CS_ETM_CPU] > max_cpu)
+			max_cpu = metadata[j][CS_ETM_CPU];
 	}
 
 	/*
@@ -3362,10 +3360,16 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	 */
 	etm->pid_fmt = cs_etm__init_pid_fmt(metadata[0]);
 
-	err = auxtrace_queues__init(&etm->queues);
+	err = auxtrace_queues__init_nr(&etm->queues, max_cpu + 1);
 	if (err)
 		goto err_free_etm;
 
+	for (unsigned int j = 0; j < etm->queues.nr_queues; ++j) {
+		err = cs_etm__setup_queue(etm, &etm->queues.queue_array[j], j);
+		if (err)
+			goto err_free_queues;
+	}
+
 	if (session->itrace_synth_opts->set) {
 		etm->synth_opts = *session->itrace_synth_opts;
 	} else {
@@ -3487,7 +3491,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	zfree(&etm);
 err_free_metadata:
 	/* No need to check @metadata[j], free(NULL) is supported */
-	for (j = 0; j < num_cpu; j++)
+	for (int j = 0; j < num_cpu; j++)
 		zfree(&metadata[j]);
 	zfree(&metadata);
 err_free_traceid_list:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
