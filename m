Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC388B5D93
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:25:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29E2EC71285;
	Mon, 29 Apr 2024 15:25:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52E5DC71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:25:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F2E22F4;
 Mon, 29 Apr 2024 08:26:18 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B42FB3F793;
 Mon, 29 Apr 2024 08:25:48 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: linux-perf-users@vger.kernel.org, gankulkarni@os.amperecomputing.com,
 scclevenger@os.amperecomputing.com, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, mike.leach@linaro.org
Date: Mon, 29 Apr 2024 16:22:02 +0100
Message-Id: <20240429152207.479221-18-james.clark@arm.com>
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
Subject: [Linux-stm32] [PATCH 16/17] coresight: Re-emit trace IDs when the
	sink changes in per-thread mode
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

In per-cpu mode there are multiple aux buffers and each one has a
fixed sink, so the hw ID mappings which only need to be emitted once
for each buffer, even with the new per-sink trace ID pools.

But in per-thread mode there is only a single buffer which can be
written to from any sink with now potentially overlapping trace IDs, so
hw ID mappings need to be re-emitted every time the sink changes.

This will require a change in Perf to track this so it knows which
decode tree to use for each segment of the buffer. In theory it's also
possible to look at the CPU ID on the AUX records, but this is more
consistent with the existing system, and allows for correct decode using
either mechanism.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 14 ++++++++++++++
 drivers/hwtracing/coresight/coresight-etm-perf.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f07173aa4d66..08f3958f9367 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -499,6 +499,20 @@ static void etm_event_start(struct perf_event *event, int flags)
 				      &sink->perf_id_map))
 		goto fail_disable_path;
 
+	/*
+	 * In per-cpu mode there are multiple aux buffers and each one has a
+	 * fixed sink, so the hw ID mappings which only need to be emitted once
+	 * for each buffer.
+	 *
+	 * But in per-thread mode there is only a single buffer which can be
+	 * written to from any sink with potentially overlapping trace IDs, so
+	 * hw ID mappings need to be re-emitted every time the sink changes.
+	 */
+	if (event->cpu == -1 && event_data->last_sink_hwid != sink) {
+		cpumask_clear(&event_data->aux_hwid_done);
+		event_data->last_sink_hwid = sink;
+	}
+
 	/*
 	 * output cpu / trace ID in perf record, once for the lifetime
 	 * of the event.
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 744531158d6b..bd4553b2a1ec 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -52,6 +52,7 @@ struct etm_filters {
  * @snk_config:		The sink configuration.
  * @cfg_hash:		The hash id of any coresight config selected.
  * @path:		An array of path, each slot for one CPU.
+ * @last_sink_hwid:	Last sink that a hwid was emitted for.
  */
 struct etm_event_data {
 	struct work_struct work;
@@ -60,6 +61,7 @@ struct etm_event_data {
 	void *snk_config;
 	u32 cfg_hash;
 	struct list_head * __percpu *path;
+	struct coresight_device *last_sink_hwid;
 };
 
 int etm_perf_symlink(struct coresight_device *csdev, bool link);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
