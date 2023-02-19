Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03969BFAB
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:35:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32DFFC6A5FE;
	Sun, 19 Feb 2023 09:35:14 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 640F0C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:35:12 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-53688fe539aso16861907b3.16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IR4cGxiP4ebyr+2RzCBvW6JFNP0fEMbIUpwuvhKV1BY=;
 b=NUcPy4ZHCiZDAbpqYYOc5JdSudhcF9l9kvtbJC+/xwt6fI8QeNC4WkMTcvQQ6804AT
 YF/xZ2bSpjDIgQdlfWHY/eHe3WKnEpPAPIMT7q5iIrd9Sn14jdygINYb7VGjPcgh8nCF
 trMCEbNSzgK3iAHSpUdlMuCCMauBc/SxT+NSFCPELU6vvdlM8J62FYawyLz3LzLGC5KK
 oUyaye5uBSEFDs6oNM8SAhzfix1YWJzevbaptGaf5BqcNtP47rHHphmVSl3Fb5Vw1PHF
 +L9HwzS3oieL/2/SVOgkIe6RBEYtywm/BAF3tZcvH8plHZ82czV8C5Pc6C6EUryLjpM7
 YatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IR4cGxiP4ebyr+2RzCBvW6JFNP0fEMbIUpwuvhKV1BY=;
 b=BN+z1/qD0ny+H3Nr46V5KhbI3nsYKLeMI3BXdBc7AP2ocMKNdDQcrwZZY0mzw1YE4Q
 XGIyrf8KXmVjh2yNPFwEEd64oSC7HLi7biaqsGIKdi7qbllf00pqhry0unBGcojKuTG9
 nSztMrI6e0yD0WKv2d2e1p9n+xKrikxHa9kkzPONYhvKZiv9SVta0h5moVr/HCuKPebd
 qeecK9JLCElNJ/1QJfrKrI1YqyX6SbO/CEBXSJaUAaZYPC9MLOPddT9WfqDHcNKinEyg
 r2s3six1CWctjxJwZ2USSIbu7BusLOEiC5yoX8P1eNgUVKst8LtWBWYDtvY1AtZdAUHF
 hDCw==
X-Gm-Message-State: AO0yUKWy/DFb6w3ugQvG+LDw9eFTyTT87Bs8w6lvntFmkqPjTo3cRi4z
 m0Is1F4iFp43o31xHGqaUrSQCV9iftha
X-Google-Smtp-Source: AK7set8dREUd48ldthm4G/cBwOOEaH0I+ZdYEzIr6WRbBTblxrP4saZKVOoIkrVw7eoOMt2hU/Yd1jyJKC9N
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a5b:4c8:0:b0:8c2:3263:da34 with SMTP id
 u8-20020a5b04c8000000b008c23263da34mr1547079ybp.209.1676799311364; Sun, 19
 Feb 2023 01:35:11 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:41 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-45-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 44/51] perf stat: Use metrics for --smi-cost
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

Rather than parsing events for --smi-cost, use the json metric group
'smi'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-stat.c     | 34 +++++++++++-----------------------
 tools/perf/util/stat-shadow.c | 30 ------------------------------
 tools/perf/util/stat.c        |  2 --
 tools/perf/util/stat.h        |  4 ----
 4 files changed, 11 insertions(+), 59 deletions(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index e6b60b058257..9c1fbf154ee3 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -100,14 +100,6 @@
 
 static void print_counters(struct timespec *ts, int argc, const char **argv);
 
-static const char *smi_cost_attrs = {
-	"{"
-	"msr/aperf/,"
-	"msr/smi/,"
-	"cycles"
-	"}"
-};
-
 static struct evlist	*evsel_list;
 static bool all_counters_use_bpf = true;
 
@@ -1666,7 +1658,6 @@ static int perf_stat_init_aggr_mode_file(struct perf_stat *st)
  */
 static int add_default_attributes(void)
 {
-	int err;
 	struct perf_event_attr default_attrs0[] = {
 
   { .type = PERF_TYPE_SOFTWARE, .config = PERF_COUNT_SW_TASK_CLOCK		},
@@ -1806,11 +1797,10 @@ static int add_default_attributes(void)
 	}
 
 	if (smi_cost) {
-		struct parse_events_error errinfo;
 		int smi;
 
 		if (sysfs__read_int(FREEZE_ON_SMI_PATH, &smi) < 0) {
-			fprintf(stderr, "freeze_on_smi is not supported.\n");
+			pr_err("freeze_on_smi is not supported.");
 			return -1;
 		}
 
@@ -1822,23 +1812,21 @@ static int add_default_attributes(void)
 			smi_reset = true;
 		}
 
-		if (!pmu_have_event("msr", "aperf") ||
-		    !pmu_have_event("msr", "smi")) {
-			fprintf(stderr, "To measure SMI cost, it needs "
-				"msr/aperf/, msr/smi/ and cpu/cycles/ support\n");
+		if (!metricgroup__has_metric("smi")) {
+			pr_err("Missing smi metrics");
 			return -1;
 		}
+
 		if (!force_metric_only)
 			stat_config.metric_only = true;
 
-		parse_events_error__init(&errinfo);
-		err = parse_events(evsel_list, smi_cost_attrs, &errinfo);
-		if (err) {
-			parse_events_error__print(&errinfo, smi_cost_attrs);
-			fprintf(stderr, "Cannot set up SMI cost events\n");
-		}
-		parse_events_error__exit(&errinfo);
-		return err ? -1 : 0;
+		return metricgroup__parse_groups(evsel_list, "smi",
+						stat_config.metric_no_group,
+						stat_config.metric_no_merge,
+						stat_config.metric_no_threshold,
+						stat_config.user_requested_cpu_list,
+						stat_config.system_wide,
+						&stat_config.metric_events);
 	}
 
 	if (topdown_run) {
diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index 3cfe4b4eb3de..d14fa531ee27 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -255,10 +255,6 @@ void perf_stat__update_shadow_stats(struct evsel *counter, u64 count,
 		update_runtime_stat(st, STAT_DTLB_CACHE, map_idx, count, &rsd);
 	else if (evsel__match(counter, HW_CACHE, HW_CACHE_ITLB))
 		update_runtime_stat(st, STAT_ITLB_CACHE, map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, SMI_NUM))
-		update_runtime_stat(st, STAT_SMI_NUM, map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, APERF))
-		update_runtime_stat(st, STAT_APERF, map_idx, count, &rsd);
 
 	if (counter->collect_stat) {
 		v = saved_value_lookup(counter, map_idx, true, STAT_NONE, 0, st,
@@ -479,30 +475,6 @@ static void print_ll_cache_misses(struct perf_stat_config *config,
 	out->print_metric(config, out->ctx, color, "%7.2f%%", "of all LL-cache accesses", ratio);
 }
 
-static void print_smi_cost(struct perf_stat_config *config, int map_idx,
-			   struct perf_stat_output_ctx *out,
-			   struct runtime_stat *st,
-			   struct runtime_stat_data *rsd)
-{
-	double smi_num, aperf, cycles, cost = 0.0;
-	const char *color = NULL;
-
-	smi_num = runtime_stat_avg(st, STAT_SMI_NUM, map_idx, rsd);
-	aperf = runtime_stat_avg(st, STAT_APERF, map_idx, rsd);
-	cycles = runtime_stat_avg(st, STAT_CYCLES, map_idx, rsd);
-
-	if ((cycles == 0) || (aperf == 0))
-		return;
-
-	if (smi_num)
-		cost = (aperf - cycles) / aperf * 100.00;
-
-	if (cost > 10)
-		color = PERF_COLOR_RED;
-	out->print_metric(config, out->ctx, color, "%8.1f%%", "SMI cycles%", cost);
-	out->print_metric(config, out->ctx, NULL, "%4.0f", "SMI#", smi_num);
-}
-
 static int prepare_metric(struct evsel **metric_events,
 			  struct metric_ref *metric_refs,
 			  struct expr_parse_ctx *pctx,
@@ -819,8 +791,6 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 		if (unit != ' ')
 			snprintf(unit_buf, sizeof(unit_buf), "%c/sec", unit);
 		print_metric(config, ctxp, NULL, "%8.3f", unit_buf, ratio);
-	} else if (perf_stat_evsel__is(evsel, SMI_NUM)) {
-		print_smi_cost(config, map_idx, out, st, &rsd);
 	} else {
 		num = 0;
 	}
diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
index b5b18d457254..d51d7457f12d 100644
--- a/tools/perf/util/stat.c
+++ b/tools/perf/util/stat.c
@@ -87,8 +87,6 @@ bool __perf_stat_evsel__is(struct evsel *evsel, enum perf_stat_evsel_id id)
 #define ID(id, name) [PERF_STAT_EVSEL_ID__##id] = #name
 static const char *id_str[PERF_STAT_EVSEL_ID__MAX] = {
 	ID(NONE,		x),
-	ID(SMI_NUM, msr/smi/),
-	ID(APERF, msr/aperf/),
 };
 #undef ID
 
diff --git a/tools/perf/util/stat.h b/tools/perf/util/stat.h
index c5fe847dd344..9af4af3bc3f2 100644
--- a/tools/perf/util/stat.h
+++ b/tools/perf/util/stat.h
@@ -21,8 +21,6 @@ struct stats {
 
 enum perf_stat_evsel_id {
 	PERF_STAT_EVSEL_ID__NONE = 0,
-	PERF_STAT_EVSEL_ID__SMI_NUM,
-	PERF_STAT_EVSEL_ID__APERF,
 	PERF_STAT_EVSEL_ID__MAX,
 };
 
@@ -88,8 +86,6 @@ enum stat_type {
 	STAT_LL_CACHE,
 	STAT_ITLB_CACHE,
 	STAT_DTLB_CACHE,
-	STAT_SMI_NUM,
-	STAT_APERF,
 	STAT_MAX
 };
 
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
