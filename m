Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4293F9FC
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AE70C7803B;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 634B6C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:23:18 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4266ed6c691so11409415e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779798; x=1721384598;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gw3JiXl0fak9J6G8VyzP7DMJZdcF5dgcCnVpK8zfVIg=;
 b=HtAeM4ntiKwJO09VGKXtWDQPvWzeLv87cr0W6URoFdRu8ib+J8UE7rXieEUT/EMwP8
 U8A0/JLXbSfjJzj3+C+M/DG9zOTEk9l55lLPb2Ja6Y+rI/LCoLkG67tRmvfYPjYyBU6s
 Z3FJKYVM/Ao78cQtxEz7ba6AfDx9DEwg5r4nk+iA6KTg3BYWm+g8icbayBt1YKrTVynG
 AL/WXGCGvJHyAf2SqG/GViPyIKwJ7u5odH62X/+rlpTNezukKzoDkRKKGgDvnH91iRRJ
 YDKuWAR6DdrPFeTHRZZA7umfzkFndKufGtZEjxsxtowoU9p2CJtA0wAaKOp7L9hxPqOa
 uyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779798; x=1721384598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gw3JiXl0fak9J6G8VyzP7DMJZdcF5dgcCnVpK8zfVIg=;
 b=TCQ6HEcmZuDq0leuiiNInF15y+Q5q/WndXhuz/OYu6Oc/h1bNe4e84NsVT9uTfaD/V
 VQndHhv8YQ1O6cKIhrKow3uChbsl4SXn2JMO/B9syd75Pjldq4i6jXlOdYsXs99nfikl
 489/wocXyXhzXVwdXyJe41b1f2db4Fs00w2+q1AgdF9pLdTP20sleSyfPvGMgsP42z+I
 Ea6WmNAlqWTjxYq355MqcKOzTKnWbC+aMQJg/qO9+DMpDr0YHne9/UlHuXO3OpvULHAn
 7OUq6/EILj3E6GSyrAzRY90xScK1vuCnC7PprKDexe7EzjxCiiPeD6o9wAYt+qvG7KQ5
 rGPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDgt2l8hpOqK+o4nP8vD+Js4lwIz1Uc8XNmQ3qByLgEeAQWvPuRt1c7LI8fvrJpwmzL3bjtnm38Glcg8YFZOrkvv961yzAsqdvbiyW7MqHASpz2uVFK4m+
X-Gm-Message-State: AOJu0YyRTTE6aU6vchFSb+LtIZkRAiZL5eiQVuyulW31PgmbZIW9pSax
 iQQzj6aIjaSFYEf6dO+ahVk/GvMC/6P19Dan1uLN8ypqEwCt667Oa6bGKUK3BAk=
X-Google-Smtp-Source: AGHT+IHpzA6uuDW6rC4LyxVfILMxHzzD7mKtov3wJzqFs4ReHp/D8E/RFpGHGqfQyzBqwMqjZ3C2Aw==
X-Received: by 2002:a05:6000:188e:b0:367:97e9:1121 with SMTP id
 ffacd0b85a97d-367cea966fdmr8425170f8f.39.1720779797921; 
 Fri, 12 Jul 2024 03:23:17 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:23:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:24 +0100
Message-Id: <20240712102029.3697965-16-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH v5 15/17] coresight: Remove pending trace ID
	release mechanism
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

Pending the release of IDs was a way of managing concurrent sysfs and
Perf sessions in a single global ID map. Perf may have finished while
sysfs hadn't, and Perf shouldn't release the IDs in use by sysfs and
vice versa.

Now that Perf uses its own exclusive ID maps, pending release doesn't
result in any different behavior than just releasing all IDs when the
last Perf session finishes. As part of the per-sink trace ID change, we
would have still had to make the pending mechanism work on a per-sink
basis, due to the overlapping ID allocations, so instead of making that
more complicated, just remove it.

Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../hwtracing/coresight/coresight-etm-perf.c  | 18 +++--
 .../hwtracing/coresight/coresight-trace-id.c  | 67 +++++--------------
 .../hwtracing/coresight/coresight-trace-id.h  | 31 ++++-----
 include/linux/coresight.h                     |  6 +-
 4 files changed, 43 insertions(+), 79 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 7fb55dafb639..70c99f0409b2 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -232,15 +232,21 @@ static void free_event_data(struct work_struct *work)
 		if (!(IS_ERR_OR_NULL(*ppath))) {
 			struct coresight_device *sink = coresight_get_sink(*ppath);
 
-			coresight_trace_id_put_cpu_id_map(cpu, &sink->perf_sink_id_map);
+			/*
+			 * Mark perf event as done for trace id allocator, but don't call
+			 * coresight_trace_id_put_cpu_id_map() on individual IDs. Perf sessions
+			 * never free trace IDs to ensure that the ID associated with a CPU
+			 * cannot change during their and other's concurrent sessions. Instead,
+			 * a refcount is used so that the last event to call
+			 * coresight_trace_id_perf_stop() frees all IDs.
+			 */
+			coresight_trace_id_perf_stop(&sink->perf_sink_id_map);
+
 			coresight_release_path(*ppath);
 		}
 		*ppath = NULL;
 	}
 
-	/* mark perf event as done for trace id allocator */
-	coresight_trace_id_perf_stop();
-
 	free_percpu(event_data->path);
 	kfree(event_data);
 }
@@ -328,9 +334,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		sink = user_sink = coresight_get_sink_by_id(id);
 	}
 
-	/* tell the trace ID allocator that a perf event is starting up */
-	coresight_trace_id_perf_start();
-
 	/* check if user wants a coresight configuration selected */
 	cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
 	if (cfg_hash) {
@@ -411,6 +414,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 			continue;
 		}
 
+		coresight_trace_id_perf_start(&sink->perf_sink_id_map);
 		*etm_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index 8a777c0af6ea..bddaed3e5cf8 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -18,12 +18,6 @@ static struct coresight_trace_id_map id_map_default = {
 	.cpu_map = &id_map_default_cpu_ids
 };
 
-/* maintain a record of the pending releases per cpu */
-static cpumask_t cpu_id_release_pending;
-
-/* perf session active counter */
-static atomic_t perf_cs_etm_session_active = ATOMIC_INIT(0);
-
 /* lock to protect id_map and cpu data  */
 static DEFINE_SPINLOCK(id_map_lock);
 
@@ -35,7 +29,6 @@ static void coresight_trace_id_dump_table(struct coresight_trace_id_map *id_map,
 {
 	pr_debug("%s id_map::\n", func_name);
 	pr_debug("Used = %*pb\n", CORESIGHT_TRACE_IDS_MAX, id_map->used_ids);
-	pr_debug("Pend = %*pb\n", CORESIGHT_TRACE_IDS_MAX, id_map->pend_rel_ids);
 }
 #define DUMP_ID_MAP(map)   coresight_trace_id_dump_table(map, __func__)
 #define DUMP_ID_CPU(cpu, id) pr_debug("%s called;  cpu=%d, id=%d\n", __func__, cpu, id)
@@ -122,34 +115,18 @@ static void coresight_trace_id_free(int id, struct coresight_trace_id_map *id_ma
 	clear_bit(id, id_map->used_ids);
 }
 
-static void coresight_trace_id_set_pend_rel(int id, struct coresight_trace_id_map *id_map)
-{
-	if (WARN(!IS_VALID_CS_TRACE_ID(id), "Invalid Trace ID %d\n", id))
-		return;
-	set_bit(id, id_map->pend_rel_ids);
-}
-
 /*
- * release all pending IDs for all current maps & clear CPU associations
- *
- * This currently operates on the default id map, but may be extended to
- * operate on all registered id maps if per sink id maps are used.
+ * Release all IDs and clear CPU associations.
  */
-static void coresight_trace_id_release_all_pending(void)
+static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map)
 {
-	struct coresight_trace_id_map *id_map = &id_map_default;
 	unsigned long flags;
-	int cpu, bit;
+	int cpu;
 
 	spin_lock_irqsave(&id_map_lock, flags);
-	for_each_set_bit(bit, id_map->pend_rel_ids, CORESIGHT_TRACE_ID_RES_TOP) {
-		clear_bit(bit, id_map->used_ids);
-		clear_bit(bit, id_map->pend_rel_ids);
-	}
-	for_each_cpu(cpu, &cpu_id_release_pending) {
-		atomic_set(per_cpu_ptr(id_map_default.cpu_map, cpu), 0);
-		cpumask_clear_cpu(cpu, &cpu_id_release_pending);
-	}
+	bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
+	for_each_possible_cpu(cpu)
+		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
 	spin_unlock_irqrestore(&id_map_lock, flags);
 	DUMP_ID_MAP(id_map);
 }
@@ -164,7 +141,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 	/* check for existing allocation for this CPU */
 	id = _coresight_trace_id_read_cpu_id(cpu, id_map);
 	if (id)
-		goto get_cpu_id_clr_pend;
+		goto get_cpu_id_out_unlock;
 
 	/*
 	 * Find a new ID.
@@ -185,11 +162,6 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 	/* allocate the new id to the cpu */
 	atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
 
-get_cpu_id_clr_pend:
-	/* we are (re)using this ID - so ensure it is not marked for release */
-	cpumask_clear_cpu(cpu, &cpu_id_release_pending);
-	clear_bit(id, id_map->pend_rel_ids);
-
 get_cpu_id_out_unlock:
 	spin_unlock_irqrestore(&id_map_lock, flags);
 
@@ -210,15 +182,8 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
 
 	spin_lock_irqsave(&id_map_lock, flags);
 
-	if (atomic_read(&perf_cs_etm_session_active)) {
-		/* set release at pending if perf still active */
-		coresight_trace_id_set_pend_rel(id, id_map);
-		cpumask_set_cpu(cpu, &cpu_id_release_pending);
-	} else {
-		/* otherwise clear id */
-		coresight_trace_id_free(id, id_map);
-		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
-	}
+	coresight_trace_id_free(id, id_map);
+	atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
 
 	spin_unlock_irqrestore(&id_map_lock, flags);
 	DUMP_ID_CPU(cpu, id);
@@ -302,17 +267,17 @@ void coresight_trace_id_put_system_id(int id)
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_put_system_id);
 
-void coresight_trace_id_perf_start(void)
+void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map)
 {
-	atomic_inc(&perf_cs_etm_session_active);
-	PERF_SESSION(atomic_read(&perf_cs_etm_session_active));
+	atomic_inc(&id_map->perf_cs_etm_session_active);
+	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_perf_start);
 
-void coresight_trace_id_perf_stop(void)
+void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map)
 {
-	if (!atomic_dec_return(&perf_cs_etm_session_active))
-		coresight_trace_id_release_all_pending();
-	PERF_SESSION(atomic_read(&perf_cs_etm_session_active));
+	if (!atomic_dec_return(&id_map->perf_cs_etm_session_active))
+		coresight_trace_id_release_all(id_map);
+	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_perf_stop);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 840babdd0794..9aae50a553ca 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -17,9 +17,10 @@
  * released when done.
  *
  * In order to ensure that a consistent cpu / ID matching is maintained
- * throughout a perf cs_etm event session - a session in progress flag will
- * be maintained, and released IDs not cleared until the perf session is
- * complete. This allows the same CPU to be re-allocated its prior ID.
+ * throughout a perf cs_etm event session - a session in progress flag will be
+ * maintained for each sink, and IDs are cleared when all the perf sessions
+ * complete. This allows the same CPU to be re-allocated its prior ID when
+ * events are scheduled in and out.
  *
  *
  * Trace ID maps will be created and initialised to prevent architecturally
@@ -66,11 +67,7 @@ int coresight_trace_id_get_cpu_id_map(int cpu, struct coresight_trace_id_map *id
 /**
  * Release an allocated trace ID associated with the CPU.
  *
- * This will release the CoreSight trace ID associated with the CPU,
- * unless a perf session is in operation.
- *
- * If a perf session is in operation then the ID will be marked as pending
- * release.
+ * This will release the CoreSight trace ID associated with the CPU.
  *
  * @cpu: The CPU index to release the associated trace ID.
  */
@@ -133,21 +130,21 @@ void coresight_trace_id_put_system_id(int id);
 /**
  * Notify the Trace ID allocator that a perf session is starting.
  *
- * Increase the perf session reference count - called by perf when setting up
- * a trace event.
+ * Increase the perf session reference count - called by perf when setting up a
+ * trace event.
  *
- * This reference count is used by the ID allocator to ensure that trace IDs
- * associated with a CPU cannot change or be released during a perf session.
+ * Perf sessions never free trace IDs to ensure that the ID associated with a
+ * CPU cannot change during their and other's concurrent sessions. Instead,
+ * this refcount is used so that the last event to finish always frees all IDs.
  */
-void coresight_trace_id_perf_start(void);
+void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map);
 
 /**
  * Notify the ID allocator that a perf session is stopping.
  *
- * Decrease the perf session reference count.
- * if this causes the count to go to zero, then all Trace IDs marked as pending
- * release, will be released.
+ * Decrease the perf session reference count. If this causes the count to go to
+ * zero, then all Trace IDs will be released.
  */
-void coresight_trace_id_perf_stop(void);
+void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map);
 
 #endif /* _CORESIGHT_TRACE_ID_H */
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 9c3067e2e38b..197949fd2c35 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -227,14 +227,12 @@ struct coresight_sysfs_link {
  * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
  *		Initialised so that the reserved IDs are permanently marked as
  *		in use.
- * @pend_rel_ids: CPU IDs that have been released by the trace source but not
- *		  yet marked as available, to allow re-allocation to the same
- *		  CPU during a perf session.
+ * @perf_cs_etm_session_active: Number of Perf sessions using this ID map.
  */
 struct coresight_trace_id_map {
 	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
-	DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
 	atomic_t __percpu *cpu_map;
+	atomic_t perf_cs_etm_session_active;
 };
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
