Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D552C69BF9C
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:34:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89384C6A5FE;
	Sun, 19 Feb 2023 09:34:04 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38C2AC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:34:03 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 e194-20020a2537cb000000b0095d2ada3d26so1953648yba.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3kQG0KGeqgW06OPnyih1uXZZsO66wdHBjTbqSiX//SI=;
 b=gb2QuI/Q7UTLV03j+31SjEjAnQVplGs47YvBd6d72MRsfNX5u2GV1bClVFw/KPr/DJ
 j9VkCa6qiHYUKeSUlqAMjhUyepIsSaIdmc6/CDEnDH5Bg1MruzsNaUi1GrFe/RCHG4Ou
 3/q2BxglwECD4NUkzFALnQWIey/UfoJLpkpUM2tCH8Ez4guaASLykOSuwFHIjrha8Gnb
 tc4FH3ZiS6wOvY2zokF6JUyq2nSs+yVikyByMBdQkxY+ijcxCjlGZ3MBC7jpOELRI0HS
 mHhwWScV1zH7rzz0rESS6LPTwCbYIbbRMDs+jv17YMGgoYXr5r8mpP8HO3oNUdzQHy/o
 ZZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3kQG0KGeqgW06OPnyih1uXZZsO66wdHBjTbqSiX//SI=;
 b=CmHnzz7R0rF0Rz60EWTUQEoy1GwUKrJrnz77bw+K+7x9E6d6XD6foCj07cNhnweCdC
 8nKB1CFtko+1OY0DF1zecnabAQjnPHUJJ0OIbeUTc1krMkAp2iFgZMbejfpOci2xy/H0
 Ct4KteD+dIL8a9FCRc296Ns6GB5sDdagyKNnUqILA+EgLmO7oKezIK6oztBruM1epaJC
 3WJRKQk1dUe3pWzFQ98DPCsyzT2cqYZ+5Y/siIADX+sRDlAtIOLkL6QhwjqN5f+MStLh
 FS63l+Jo1y8F3bWMVTYV3Mj29NmlnaUqJ2+kgvpa/8HarsMNB8fyhs5jcanBSoG8xe5d
 GW7A==
X-Gm-Message-State: AO0yUKVjlek/zaCipZplt7FdAo4sgnqYL4hc1eyW7VU5lLelQLUrvyL2
 wqUiUr0DwfWL0Y0lkw1AYrtWWKzOQPLu
X-Google-Smtp-Source: AK7set9iZ4GNz6X424ocjjFR9ly/Nzr3yu49B3uQN0Li0fYihqizLYz+cos7UMisC/Dk4m8f82PPVOIM/5Y8
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a25:6408:0:b0:911:cc15:db74 with SMTP id
 y8-20020a256408000000b00911cc15db74mr28488ybb.13.1676799242175; Sun, 19 Feb
 2023 01:34:02 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:33 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-37-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 36/51] perf metric: Compute and print
	threshold values
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

Compute the threshold metric and use it to color the metric value as
red or green. The threshold expression is used to generate the set of
events as the threshold may require additional events. A later patch
make this behavior optional with a --metric-no-threshold flag.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/metricgroup.c | 24 +++++++++++++++++++++---
 tools/perf/util/metricgroup.h |  1 +
 tools/perf/util/stat-shadow.c | 24 ++++++++++++++++--------
 3 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index b1d56a73223d..d83885697125 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -129,6 +129,8 @@ struct metric {
 	const char *modifier;
 	/** The expression to parse, for example, "instructions/cycles". */
 	const char *metric_expr;
+	/** Optional threshold expression where zero value is green, otherwise red. */
+	const char *metric_threshold;
 	/**
 	 * The "ScaleUnit" that scales and adds a unit to the metric during
 	 * output.
@@ -222,6 +224,7 @@ static struct metric *metric__new(const struct pmu_metric *pm,
 			goto out_err;
 	}
 	m->metric_expr = pm->metric_expr;
+	m->metric_threshold = pm->metric_threshold;
 	m->metric_unit = pm->unit;
 	m->pctx->sctx.user_requested_cpu_list = NULL;
 	if (user_requested_cpu_list) {
@@ -901,6 +904,7 @@ static int __add_metric(struct list_head *metric_list,
 	const struct visited_metric *vm;
 	int ret;
 	bool is_root = !root_metric;
+	const char *expr;
 	struct visited_metric visited_node = {
 		.name = pm->metric_name,
 		.parent = visited,
@@ -963,16 +967,29 @@ static int __add_metric(struct list_head *metric_list,
 	 * For both the parent and referenced metrics, we parse
 	 * all the metric's IDs and add it to the root context.
 	 */
-	if (expr__find_ids(pm->metric_expr, NULL, root_metric->pctx) < 0) {
+	ret = 0;
+	expr = pm->metric_expr;
+	if (is_root && pm->metric_threshold) {
+		/*
+		 * Threshold expressions are built off the actual metric. Switch
+		 * to use that in case of additional necessary events. Change
+		 * the visited node name to avoid this being flagged as
+		 * recursion.
+		 */
+		assert(strstr(pm->metric_threshold, pm->metric_name));
+		expr = pm->metric_threshold;
+		visited_node.name = "__threshold__";
+	}
+	if (expr__find_ids(expr, NULL, root_metric->pctx) < 0) {
 		/* Broken metric. */
 		ret = -EINVAL;
-	} else {
+	}
+	if (!ret) {
 		/* Resolve referenced metrics. */
 		ret = resolve_metric(metric_list, modifier, metric_no_group,
 				     user_requested_cpu_list, system_wide,
 				     root_metric, &visited_node, table);
 	}
-
 	if (ret) {
 		if (is_root)
 			metric__free(root_metric);
@@ -1554,6 +1571,7 @@ static int parse_groups(struct evlist *perf_evlist, const char *str,
 			free(metric_events);
 			goto out;
 		}
+		expr->metric_threshold = m->metric_threshold;
 		expr->metric_unit = m->metric_unit;
 		expr->metric_events = metric_events;
 		expr->runtime = m->pctx->sctx.runtime;
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index 84030321a057..32eb3a5381fb 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -47,6 +47,7 @@ struct metric_expr {
 	const char *metric_expr;
 	/** The name of the meric such as "IPC". */
 	const char *metric_name;
+	const char *metric_threshold;
 	/**
 	 * The "ScaleUnit" that scales and adds a unit to the metric during
 	 * output. For example, "6.4e-05MiB" means to scale the resulting metric
diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index 806b32156459..a41f186c6ec8 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -777,6 +777,7 @@ static int prepare_metric(struct evsel **metric_events,
 
 static void generic_metric(struct perf_stat_config *config,
 			   const char *metric_expr,
+			   const char *metric_threshold,
 			   struct evsel **metric_events,
 			   struct metric_ref *metric_refs,
 			   char *name,
@@ -789,9 +790,10 @@ static void generic_metric(struct perf_stat_config *config,
 {
 	print_metric_t print_metric = out->print_metric;
 	struct expr_parse_ctx *pctx;
-	double ratio, scale;
+	double ratio, scale, threshold;
 	int i;
 	void *ctxp = out->ctx;
+	const char *color = NULL;
 
 	pctx = expr__ctx_new();
 	if (!pctx)
@@ -811,6 +813,12 @@ static void generic_metric(struct perf_stat_config *config,
 			char *unit;
 			char metric_bf[64];
 
+			if (metric_threshold &&
+			    expr__parse(&threshold, pctx, metric_threshold) == 0) {
+				color = fpclassify(threshold) == FP_ZERO
+					? PERF_COLOR_GREEN : PERF_COLOR_RED;
+			}
+
 			if (metric_unit && metric_name) {
 				if (perf_pmu__convert_scale(metric_unit,
 					&unit, &scale) >= 0) {
@@ -823,22 +831,22 @@ static void generic_metric(struct perf_stat_config *config,
 					scnprintf(metric_bf, sizeof(metric_bf),
 					  "%s  %s", unit, metric_name);
 
-				print_metric(config, ctxp, NULL, "%8.1f",
+				print_metric(config, ctxp, color, "%8.1f",
 					     metric_bf, ratio);
 			} else {
-				print_metric(config, ctxp, NULL, "%8.2f",
+				print_metric(config, ctxp, color, "%8.2f",
 					metric_name ?
 					metric_name :
 					out->force_header ?  name : "",
 					ratio);
 			}
 		} else {
-			print_metric(config, ctxp, NULL, NULL,
+			print_metric(config, ctxp, color, /*unit=*/NULL,
 				     out->force_header ?
 				     (metric_name ? metric_name : name) : "", 0);
 		}
 	} else {
-		print_metric(config, ctxp, NULL, NULL,
+		print_metric(config, ctxp, color, /*unit=*/NULL,
 			     out->force_header ?
 			     (metric_name ? metric_name : name) : "", 0);
 	}
@@ -1214,9 +1222,9 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 		list_for_each_entry (mexp, &me->head, nd) {
 			if (num++ > 0)
 				out->new_line(config, ctxp);
-			generic_metric(config, mexp->metric_expr, mexp->metric_events,
-				       mexp->metric_refs, evsel->name, mexp->metric_name,
-				       mexp->metric_unit, mexp->runtime,
+			generic_metric(config, mexp->metric_expr, mexp->metric_threshold,
+				       mexp->metric_events, mexp->metric_refs, evsel->name,
+				       mexp->metric_name, mexp->metric_unit, mexp->runtime,
 				       map_idx, out, st);
 		}
 	}
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
