Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D497693FA14
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E9FDC78F8F;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C755CC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:12:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso29267155e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643178; x=1722247978;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+T7+pXiF7yMfs8Ra5yXYj2ssuWqnilsrImn3ybG45I=;
 b=L6s32tlOpsIBpLK6rpAq/PW7FMQPxQrlnyx5R/yqJYOpFfx/uQPfopSTH6TkyDpa3T
 og2qbXSx6TqhsSfClw9g2Xl5ys3cvlTkVCVme17RwS1tt/HNBznOBUt7GPVeDSnWpbrV
 MahOchdhM08ONff27Z2grpJmC9GXCqy4s6864rr+uPQWBCo5s9ZjbNVzuvvQR0TwQN1Q
 D+1pRXeX7auxVYit/b5mUCzb/ybHgGHtXghQoITuLy6orS3NIs3/JDpTUYFDRMSk1gd4
 djdcRJwxdSKA5vyjGS5NzKrEZS+JJ7t0I8Js4AWD8oF6rMNkfKJslYmZbwN4scYjrX/4
 +w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643178; x=1722247978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+T7+pXiF7yMfs8Ra5yXYj2ssuWqnilsrImn3ybG45I=;
 b=qyw/evIxrWTEqLY3ucbkq+wvBfkihL052bI6fa/72ApnXNITHEyF4LR5tkbNBbeli1
 Xz1ffWLYLIxJPwaDr0ETK44l99ghrnC4cFjS/vOKozVZpU0FffrZhwBHnSMgf7oOCU13
 5A6512tLyu0HyxNGco8BthoMQRRo6yOK7nYTRDD7wuIzukYI7TMthEVeyk0UZPwDhGS9
 IPG7YDU5TJH3WPJJctpFoPid8ZBhsy+aElbGv7bmsB2oUEr5KZMkWonOn/FW7W7OnIrK
 t/BPa9GXxFxsfnJqpQI+/zZs6IqiRUtoQyUwvV6PhvZ2IPS8L0xWPMC22aDxDVHpKrsx
 nxrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrAL4Sfv9Vl7MUOhemIwSwXYFEY0qoZXWBm/vBRFV2FRposwAIdQiRcew09+83ntjVQbRzgkktiYC35mdXFpT5bIeUYHNnxFjX/hQVwV0ETAmpFrArn4zu
X-Gm-Message-State: AOJu0YwfqoVW3Qhp9VVKqCPIFBJ/4rVfZesuq99w3+hm1saUmKlaHqQ4
 gyan5dDrjYoeoj3mQpeYI8MaC++J4yuPzxFwHnTxuFV6Ug0jh/cEvAyE2+T8G9g=
X-Google-Smtp-Source: AGHT+IHyNXXfk/HrfhveqJ02cNHdCkruCeq4FRjg04KZTngcUohmX3j/WQtGWJDIrrIRKyBl7EzFjA==
X-Received: by 2002:a05:600c:1906:b0:426:6379:3b56 with SMTP id
 5b1f17b1804b1-427dc529091mr40404035e9.15.1721643178308; 
 Mon, 22 Jul 2024 03:12:58 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:12:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:48 +0100
Message-Id: <20240722101202.26915-7-james.clark@linaro.org>
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
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v6 06/17] perf: cs-etm: Support version 0.1 of
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

From: James Clark <james.clark@arm.com>

v0.1 HW_ID packets have a new field that describes which sink each CPU
writes to. Use the sink ID to link trace ID maps to each other so that
mappings are shared wherever the sink is shared.

Also update the error message to show that overlapping IDs aren't an
error in per-thread mode, just not supported. In the future we can
use the CPU ID from the AUX records, or watch for changing sink IDs on
HW_ID packets to use the correct decoders.

Signed-off-by: James Clark <james.clark@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/linux/coresight-pmu.h |  17 +++--
 tools/perf/util/cs-etm.c            | 100 +++++++++++++++++++++++++---
 2 files changed, 103 insertions(+), 14 deletions(-)

diff --git a/tools/include/linux/coresight-pmu.h b/tools/include/linux/coresight-pmu.h
index 51ac441a37c3..89b0ac0014b0 100644
--- a/tools/include/linux/coresight-pmu.h
+++ b/tools/include/linux/coresight-pmu.h
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
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 7cce58dca33c..b11b0cae608e 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -118,6 +118,12 @@ struct cs_etm_queue {
 	struct cs_etm_traceid_queue **traceid_queues;
 	/* Conversion between traceID and metadata pointers */
 	struct intlist *traceid_list;
+	/*
+	 * Same as traceid_list, but traceid_list may be a reference to another
+	 * queue's which has a matching sink ID.
+	 */
+	struct intlist *own_traceid_list;
+	u32 sink_id;
 };
 
 static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm);
@@ -142,6 +148,7 @@ static int cs_etm__metadata_set_trace_id(u8 trace_chan_id, u64 *cpu_metadata);
 		      (queue_nr << 16 | trace_chan_id)
 #define TO_QUEUE_NR(cs_queue_nr) (cs_queue_nr >> 16)
 #define TO_TRACE_CHAN_ID(cs_queue_nr) (cs_queue_nr & 0x0000ffff)
+#define SINK_UNSET ((u32) -1)
 
 static u32 cs_etm__get_v7_protocol_version(u32 etmidr)
 {
@@ -241,7 +248,16 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
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
 
@@ -326,6 +342,64 @@ static int cs_etm__process_trace_id_v0(struct cs_etm_auxtrace *etm, int cpu,
 	return cs_etm__metadata_set_trace_id(trace_chan_id, cpu_data);
 }
 
+static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
+					 u64 hw_id)
+{
+	struct cs_etm_queue *etmq = cs_etm__get_queue(etm, cpu);
+	int ret;
+	u64 *cpu_data;
+	u32 sink_id = FIELD_GET(CS_AUX_HW_ID_SINK_ID_MASK, hw_id);
+	u8 trace_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
+
+	/*
+	 * Check sink id hasn't changed in per-cpu mode. In per-thread mode,
+	 * let it pass for now until an actual overlapping trace ID is hit. In
+	 * most cases IDs won't overlap even if the sink changes.
+	 */
+	if (!etmq->etm->per_thread_decoding && etmq->sink_id != SINK_UNSET &&
+	    etmq->sink_id != sink_id) {
+		pr_err("CS_ETM: mismatch between sink IDs\n");
+		return -EINVAL;
+	}
+
+	etmq->sink_id = sink_id;
+
+	/* Find which other queues use this sink and link their ID maps */
+	for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
+		struct cs_etm_queue *other_etmq = etm->queues.queue_array[i].priv;
+
+		/* Different sinks, skip */
+		if (other_etmq->sink_id != etmq->sink_id)
+			continue;
+
+		/* Already linked, skip */
+		if (other_etmq->traceid_list == etmq->traceid_list)
+			continue;
+
+		/* At the point of first linking, this one should be empty */
+		if (!intlist__empty(etmq->traceid_list)) {
+			pr_err("CS_ETM: Can't link populated trace ID lists\n");
+			return -EINVAL;
+		}
+
+		etmq->own_traceid_list = NULL;
+		intlist__delete(etmq->traceid_list);
+		etmq->traceid_list = other_etmq->traceid_list;
+		break;
+	}
+
+	cpu_data = get_cpu_data(etm, cpu);
+	ret = cs_etm__insert_trace_id_node(etmq, trace_id, cpu_data);
+	if (ret)
+		return ret;
+
+	ret = cs_etm__metadata_set_trace_id(trace_id, cpu_data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int cs_etm__metadata_get_trace_id(u8 *trace_chan_id, u64 *cpu_metadata)
 {
 	u64 cs_etm_magic = cpu_metadata[CS_ETM_MAGIC];
@@ -414,10 +488,10 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 
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
@@ -442,7 +516,10 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 		return -EINVAL;
 	}
 
-	return cs_etm__process_trace_id_v0(etm, cpu, hw_id);
+	if (FIELD_GET(CS_AUX_HW_ID_MINOR_VERSION_MASK, hw_id) == 0)
+		return cs_etm__process_trace_id_v0(etm, cpu, hw_id);
+
+	return cs_etm__process_trace_id_v0_1(etm, cpu, hw_id);
 }
 
 void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
@@ -882,12 +959,14 @@ static void cs_etm__free_queue(void *priv)
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
@@ -1081,7 +1160,7 @@ static struct cs_etm_queue *cs_etm__alloc_queue(void)
 	 * has to be made for each packet that gets decoded, optimizing access
 	 * in anything other than a sequential array is worth doing.
 	 */
-	etmq->traceid_list = intlist__new(NULL);
+	etmq->traceid_list = etmq->own_traceid_list = intlist__new(NULL);
 	if (!etmq->traceid_list)
 		goto out_free;
 
@@ -1113,6 +1192,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 	etmq->queue_nr = queue_nr;
 	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
 	etmq->offset = 0;
+	etmq->sink_id = SINK_UNSET;
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
