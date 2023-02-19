Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4AF69BFA0
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:34:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1534C6A5FE;
	Sun, 19 Feb 2023 09:34:21 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F315C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:34:20 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 l125-20020a25cc83000000b0083fa6f15c2fso1936610ybf.16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XBygbP2AnKfDbpz1krdMAZIvQLAdvtaCB6XLYUmfQds=;
 b=PkbnNXwAZ7dASxCbIk3PSOXIwA56PiTDT2BrHJWvqt8nqcL3bSxaHP0HjREpFP4pBE
 zmCKIb+9FhlwQ8T9T3hD1DWUTG0iZf0+D8Fg5gEw/6kW81MXr3SCY3kj3ZCNZJM79rEm
 Z62LtGdZMOWbkEO42PWyNmuN/kx7l7fYGF+pskPCUg8W0RWDaNemZLiFYJpBXAf1moZy
 UpDKxP3KBGDK6CwystAwBk4I9aM2uCdMXGtMenYofayeUMOzV5RGtLImtFxLETRLxQfL
 FHBnkZN/j8gx2E/zhsgX1YogOTj0NgsRmfp+VgFEhl3UoSV3sPJ8dji7jQmoLUTBvZKF
 78sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XBygbP2AnKfDbpz1krdMAZIvQLAdvtaCB6XLYUmfQds=;
 b=RLvhd6/7IVarrOmpxqAdVM5qufVCwUDpu5Xy6ongZOUxnYdvXo9l2gqdbwVBEEcf4u
 UyVqvVvRG1JLzvUMOC0O9yFFMhGcYu4er6zxIjTk42l9TPzjrUc5ba0+qoRaog355Bhk
 tcpjkbI6rwf6LwYx51p10aaiqpA4wky5b9573QCjQgybk+PY4oruCKHlmvaee+5kDF20
 vXjBJXJnLVBh6+R5si07Qn0CcYRiM7093QTOL5cJnxWvvW4BL0HkCDYYYzgYsfIWI3/e
 o+uBE62Dh1Dr3Z2jRTyL/P/zKsTSDG/YVJPMKyasOEKCyrRgjtcukKRFfUwSNeAnnZkj
 8S+Q==
X-Gm-Message-State: AO0yUKXjjo8SW/vi67jEv5pV65Zp02qbNz2vbhzHqbhGNDsyP39/vdc7
 r1u8kYuAKDCI5lqhP6vZbdR2RhmbRTvf
X-Google-Smtp-Source: AK7set+UJL29LpId9cYnoZsgaDIdCVm2Q8RTzyhbCy2UqAjEI7S9r3tmbOx9Jx+VYq9UTHEoDVtaR9fIJ5bP
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:11cd:b0:90d:a6c0:6870 with SMTP
 id n13-20020a05690211cd00b0090da6c06870mr391398ybu.2.1676799259452; Sun, 19
 Feb 2023 01:34:19 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:35 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-39-irogers@google.com>
Mime-Version: 1.0
References: <20230219092848.639226-1-irogers@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Zhengjun Xing <zhengjun.xing@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>, 
 James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
 John Garry <john.g.garry@oracle.com>, Kan Liang <kan.liang@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Suzuki Poulouse <suzuki.poulose@arm.com>,
 Leo Yan <leo.yan@linaro.org>, 
 Florian Fischer <florian.fischer@muhq.space>,
 Ravi Bangoria <ravi.bangoria@amd.com>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>,
 Sean Christopherson <seanjc@google.com>, 
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Perry Taylor <perry.taylor@intel.com>, 
 Caleb Biggers <caleb.biggers@intel.com>
Cc: Ian Rogers <irogers@google.com>, Stephane Eranian <eranian@google.com>
Subject: [Linux-stm32] [PATCH v1 38/51] perf metric: Add
	--metric-no-threshold option
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

Thresholds may need additional events, this can impact things like
sharing groups of events to avoid multiplexing. Add a flag to make the
threshold calculations optional. The threshold will still be computed
if no additional events are necessary.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-stat.c        |  4 +++
 tools/perf/tests/expand-cgroup.c |  3 +-
 tools/perf/tests/parse-metric.c  |  1 -
 tools/perf/tests/pmu-events.c    |  4 +--
 tools/perf/util/metricgroup.c    | 62 ++++++++++++++++++++------------
 tools/perf/util/metricgroup.h    |  3 +-
 tools/perf/util/stat-shadow.c    |  3 +-
 tools/perf/util/stat.h           |  1 +
 8 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 5d18a5a6f662..5e13171a7bba 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -1256,6 +1256,8 @@ static struct option stat_options[] = {
 		       "don't group metric events, impacts multiplexing"),
 	OPT_BOOLEAN(0, "metric-no-merge", &stat_config.metric_no_merge,
 		       "don't try to share events between metrics in a group"),
+	OPT_BOOLEAN(0, "metric-no-threshold", &stat_config.metric_no_threshold,
+		       "don't try to share events between metrics in a group  "),
 	OPT_BOOLEAN(0, "topdown", &topdown_run,
 			"measure top-down statistics"),
 	OPT_UINTEGER(0, "td-level", &stat_config.topdown_level,
@@ -1852,6 +1854,7 @@ static int add_default_attributes(void)
 			return metricgroup__parse_groups(evsel_list, "transaction",
 							 stat_config.metric_no_group,
 							 stat_config.metric_no_merge,
+							 stat_config.metric_no_threshold,
 							 stat_config.user_requested_cpu_list,
 							 stat_config.system_wide,
 							 &stat_config.metric_events);
@@ -2519,6 +2522,7 @@ int cmd_stat(int argc, const char **argv)
 		metricgroup__parse_groups(evsel_list, metrics,
 					stat_config.metric_no_group,
 					stat_config.metric_no_merge,
+					stat_config.metric_no_threshold,
 					stat_config.user_requested_cpu_list,
 					stat_config.system_wide,
 					&stat_config.metric_events);
diff --git a/tools/perf/tests/expand-cgroup.c b/tools/perf/tests/expand-cgroup.c
index 672a27f37060..ec340880a848 100644
--- a/tools/perf/tests/expand-cgroup.c
+++ b/tools/perf/tests/expand-cgroup.c
@@ -187,8 +187,7 @@ static int expand_metric_events(void)
 
 	rblist__init(&metric_events);
 	pme_test = find_core_metrics_table("testarch", "testcpu");
-	ret = metricgroup__parse_groups_test(evlist, pme_test, metric_str,
-					     false, false, &metric_events);
+	ret = metricgroup__parse_groups_test(evlist, pme_test, metric_str, &metric_events);
 	if (ret < 0) {
 		pr_debug("failed to parse '%s' metric\n", metric_str);
 		goto out;
diff --git a/tools/perf/tests/parse-metric.c b/tools/perf/tests/parse-metric.c
index 9fec6040950c..132c9b945a42 100644
--- a/tools/perf/tests/parse-metric.c
+++ b/tools/perf/tests/parse-metric.c
@@ -98,7 +98,6 @@ static int __compute_metric(const char *name, struct value *vals,
 	/* Parse the metric into metric_events list. */
 	pme_test = find_core_metrics_table("testarch", "testcpu");
 	err = metricgroup__parse_groups_test(evlist, pme_test, name,
-					     false, false,
 					     &metric_events);
 	if (err)
 		goto out;
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index db2fed0c6993..50b99a0f8f59 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -846,9 +846,7 @@ static int test__parsing_callback(const struct pmu_metric *pm,
 	perf_evlist__set_maps(&evlist->core, cpus, NULL);
 	runtime_stat__init(&st);
 
-	err = metricgroup__parse_groups_test(evlist, table, pm->metric_name,
-					     false, false,
-					     &metric_events);
+	err = metricgroup__parse_groups_test(evlist, table, pm->metric_name, &metric_events);
 	if (err) {
 		if (!strcmp(pm->metric_name, "M1") || !strcmp(pm->metric_name, "M2") ||
 		    !strcmp(pm->metric_name, "M3")) {
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index d83885697125..afb6f2fdc24e 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -771,6 +771,7 @@ struct metricgroup_add_iter_data {
 	int *ret;
 	bool *has_match;
 	bool metric_no_group;
+	bool metric_no_threshold;
 	const char *user_requested_cpu_list;
 	bool system_wide;
 	struct metric *root_metric;
@@ -786,6 +787,7 @@ static int add_metric(struct list_head *metric_list,
 		      const struct pmu_metric *pm,
 		      const char *modifier,
 		      bool metric_no_group,
+		      bool metric_no_threshold,
 		      const char *user_requested_cpu_list,
 		      bool system_wide,
 		      struct metric *root_metric,
@@ -813,6 +815,7 @@ static int add_metric(struct list_head *metric_list,
 static int resolve_metric(struct list_head *metric_list,
 			  const char *modifier,
 			  bool metric_no_group,
+			  bool metric_no_threshold,
 			  const char *user_requested_cpu_list,
 			  bool system_wide,
 			  struct metric *root_metric,
@@ -861,8 +864,8 @@ static int resolve_metric(struct list_head *metric_list,
 	 */
 	for (i = 0; i < pending_cnt; i++) {
 		ret = add_metric(metric_list, &pending[i].pm, modifier, metric_no_group,
-				 user_requested_cpu_list, system_wide, root_metric, visited,
-				 table);
+				 metric_no_threshold, user_requested_cpu_list, system_wide,
+				 root_metric, visited, table);
 		if (ret)
 			break;
 	}
@@ -879,6 +882,7 @@ static int resolve_metric(struct list_head *metric_list,
  * @metric_no_group: Should events written to events be grouped "{}" or
  *                   global. Grouping is the default but due to multiplexing the
  *                   user may override.
+ * @metric_no_threshold: Should threshold expressions be ignored?
  * @runtime: A special argument for the parser only known at runtime.
  * @user_requested_cpu_list: Command line specified CPUs to record on.
  * @system_wide: Are events for all processes recorded.
@@ -894,6 +898,7 @@ static int __add_metric(struct list_head *metric_list,
 			const struct pmu_metric *pm,
 			const char *modifier,
 			bool metric_no_group,
+			bool metric_no_threshold,
 			int runtime,
 			const char *user_requested_cpu_list,
 			bool system_wide,
@@ -974,10 +979,12 @@ static int __add_metric(struct list_head *metric_list,
 		 * Threshold expressions are built off the actual metric. Switch
 		 * to use that in case of additional necessary events. Change
 		 * the visited node name to avoid this being flagged as
-		 * recursion.
+		 * recursion. If the threshold events are disabled, just use the
+		 * metric's name as a reference. This allows metric threshold
+		 * computation if there are sufficient events.
 		 */
 		assert(strstr(pm->metric_threshold, pm->metric_name));
-		expr = pm->metric_threshold;
+		expr = metric_no_threshold ? pm->metric_name : pm->metric_threshold;
 		visited_node.name = "__threshold__";
 	}
 	if (expr__find_ids(expr, NULL, root_metric->pctx) < 0) {
@@ -987,8 +994,8 @@ static int __add_metric(struct list_head *metric_list,
 	if (!ret) {
 		/* Resolve referenced metrics. */
 		ret = resolve_metric(metric_list, modifier, metric_no_group,
-				     user_requested_cpu_list, system_wide,
-				     root_metric, &visited_node, table);
+				     metric_no_threshold, user_requested_cpu_list,
+				     system_wide, root_metric, &visited_node, table);
 	}
 	if (ret) {
 		if (is_root)
@@ -1035,6 +1042,7 @@ static int add_metric(struct list_head *metric_list,
 		      const struct pmu_metric *pm,
 		      const char *modifier,
 		      bool metric_no_group,
+		      bool metric_no_threshold,
 		      const char *user_requested_cpu_list,
 		      bool system_wide,
 		      struct metric *root_metric,
@@ -1046,9 +1054,9 @@ static int add_metric(struct list_head *metric_list,
 	pr_debug("metric expr %s for %s\n", pm->metric_expr, pm->metric_name);
 
 	if (!strstr(pm->metric_expr, "?")) {
-		ret = __add_metric(metric_list, pm, modifier, metric_no_group, 0,
-				   user_requested_cpu_list, system_wide, root_metric,
-				   visited, table);
+		ret = __add_metric(metric_list, pm, modifier, metric_no_group,
+				   metric_no_threshold, 0, user_requested_cpu_list,
+				   system_wide, root_metric, visited, table);
 	} else {
 		int j, count;
 
@@ -1060,9 +1068,9 @@ static int add_metric(struct list_head *metric_list,
 		 */
 
 		for (j = 0; j < count && !ret; j++)
-			ret = __add_metric(metric_list, pm, modifier, metric_no_group, j,
-					   user_requested_cpu_list, system_wide,
-					   root_metric, visited, table);
+			ret = __add_metric(metric_list, pm, modifier, metric_no_group,
+					   metric_no_threshold, j, user_requested_cpu_list,
+					   system_wide, root_metric, visited, table);
 	}
 
 	return ret;
@@ -1079,8 +1087,8 @@ static int metricgroup__add_metric_sys_event_iter(const struct pmu_metric *pm,
 		return 0;
 
 	ret = add_metric(d->metric_list, pm, d->modifier, d->metric_no_group,
-			 d->user_requested_cpu_list, d->system_wide,
-			 d->root_metric, d->visited, d->table);
+			 d->metric_no_threshold, d->user_requested_cpu_list,
+			 d->system_wide, d->root_metric, d->visited, d->table);
 	if (ret)
 		goto out;
 
@@ -1124,6 +1132,7 @@ struct metricgroup__add_metric_data {
 	const char *modifier;
 	const char *user_requested_cpu_list;
 	bool metric_no_group;
+	bool metric_no_threshold;
 	bool system_wide;
 	bool has_match;
 };
@@ -1141,8 +1150,9 @@ static int metricgroup__add_metric_callback(const struct pmu_metric *pm,
 
 		data->has_match = true;
 		ret = add_metric(data->list, pm, data->modifier, data->metric_no_group,
-				 data->user_requested_cpu_list, data->system_wide,
-				 /*root_metric=*/NULL, /*visited_metrics=*/NULL, table);
+				 data->metric_no_threshold, data->user_requested_cpu_list,
+				 data->system_wide, /*root_metric=*/NULL,
+				 /*visited_metrics=*/NULL, table);
 	}
 	return ret;
 }
@@ -1163,7 +1173,7 @@ static int metricgroup__add_metric_callback(const struct pmu_metric *pm,
  *       architecture perf is running upon.
  */
 static int metricgroup__add_metric(const char *metric_name, const char *modifier,
-				   bool metric_no_group,
+				   bool metric_no_group, bool metric_no_threshold,
 				   const char *user_requested_cpu_list,
 				   bool system_wide,
 				   struct list_head *metric_list,
@@ -1179,6 +1189,7 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
 			.metric_name = metric_name,
 			.modifier = modifier,
 			.metric_no_group = metric_no_group,
+			.metric_no_threshold = metric_no_threshold,
 			.user_requested_cpu_list = user_requested_cpu_list,
 			.system_wide = system_wide,
 			.has_match = false,
@@ -1241,6 +1252,7 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
  *       architecture perf is running upon.
  */
 static int metricgroup__add_metric_list(const char *list, bool metric_no_group,
+					bool metric_no_threshold,
 					const char *user_requested_cpu_list,
 					bool system_wide, struct list_head *metric_list,
 					const struct pmu_metrics_table *table)
@@ -1259,7 +1271,8 @@ static int metricgroup__add_metric_list(const char *list, bool metric_no_group,
 			*modifier++ = '\0';
 
 		ret = metricgroup__add_metric(metric_name, modifier,
-					      metric_no_group, user_requested_cpu_list,
+					      metric_no_group, metric_no_threshold,
+					      user_requested_cpu_list,
 					      system_wide, metric_list, table);
 		if (ret == -EINVAL)
 			pr_err("Cannot find metric or group `%s'\n", metric_name);
@@ -1449,6 +1462,7 @@ static int parse_ids(bool metric_no_merge, struct perf_pmu *fake_pmu,
 static int parse_groups(struct evlist *perf_evlist, const char *str,
 			bool metric_no_group,
 			bool metric_no_merge,
+			bool metric_no_threshold,
 			const char *user_requested_cpu_list,
 			bool system_wide,
 			struct perf_pmu *fake_pmu,
@@ -1463,7 +1477,7 @@ static int parse_groups(struct evlist *perf_evlist, const char *str,
 
 	if (metric_events_list->nr_entries == 0)
 		metricgroup__rblist_init(metric_events_list);
-	ret = metricgroup__add_metric_list(str, metric_no_group,
+	ret = metricgroup__add_metric_list(str, metric_no_group, metric_no_threshold,
 					   user_requested_cpu_list,
 					   system_wide, &metric_list, table);
 	if (ret)
@@ -1598,6 +1612,7 @@ int metricgroup__parse_groups(struct evlist *perf_evlist,
 			      const char *str,
 			      bool metric_no_group,
 			      bool metric_no_merge,
+			      bool metric_no_threshold,
 			      const char *user_requested_cpu_list,
 			      bool system_wide,
 			      struct rblist *metric_events)
@@ -1608,18 +1623,19 @@ int metricgroup__parse_groups(struct evlist *perf_evlist,
 		return -EINVAL;
 
 	return parse_groups(perf_evlist, str, metric_no_group, metric_no_merge,
-			    user_requested_cpu_list, system_wide,
+			    metric_no_threshold, user_requested_cpu_list, system_wide,
 			    /*fake_pmu=*/NULL, metric_events, table);
 }
 
 int metricgroup__parse_groups_test(struct evlist *evlist,
 				   const struct pmu_metrics_table *table,
 				   const char *str,
-				   bool metric_no_group,
-				   bool metric_no_merge,
 				   struct rblist *metric_events)
 {
-	return parse_groups(evlist, str, metric_no_group, metric_no_merge,
+	return parse_groups(evlist, str,
+			    /*metric_no_group=*/false,
+			    /*metric_no_merge=*/false,
+			    /*metric_no_threshold=*/false,
 			    /*user_requested_cpu_list=*/NULL,
 			    /*system_wide=*/false,
 			    &perf_pmu__fake, metric_events, table);
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index 32eb3a5381fb..8d50052c5b4c 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -70,14 +70,13 @@ int metricgroup__parse_groups(struct evlist *perf_evlist,
 			      const char *str,
 			      bool metric_no_group,
 			      bool metric_no_merge,
+			      bool metric_no_threshold,
 			      const char *user_requested_cpu_list,
 			      bool system_wide,
 			      struct rblist *metric_events);
 int metricgroup__parse_groups_test(struct evlist *evlist,
 				   const struct pmu_metrics_table *table,
 				   const char *str,
-				   bool metric_no_group,
-				   bool metric_no_merge,
 				   struct rblist *metric_events);
 
 void metricgroup__print(const struct print_callbacks *print_cb, void *print_state);
diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index a41f186c6ec8..77483eeda0d8 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -814,7 +814,8 @@ static void generic_metric(struct perf_stat_config *config,
 			char metric_bf[64];
 
 			if (metric_threshold &&
-			    expr__parse(&threshold, pctx, metric_threshold) == 0) {
+			    expr__parse(&threshold, pctx, metric_threshold) == 0 &&
+			    !isnan(threshold)) {
 				color = fpclassify(threshold) == FP_ZERO
 					? PERF_COLOR_GREEN : PERF_COLOR_RED;
 			}
diff --git a/tools/perf/util/stat.h b/tools/perf/util/stat.h
index b1c29156c560..cf2d8aa445f3 100644
--- a/tools/perf/util/stat.h
+++ b/tools/perf/util/stat.h
@@ -159,6 +159,7 @@ struct perf_stat_config {
 	bool			 no_csv_summary;
 	bool			 metric_no_group;
 	bool			 metric_no_merge;
+	bool			 metric_no_threshold;
 	bool			 stop_read_counter;
 	bool			 iostat_run;
 	char			 *user_requested_cpu_list;
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
