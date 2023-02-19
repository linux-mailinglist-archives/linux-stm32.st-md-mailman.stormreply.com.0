Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3200469BFA6
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:34:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB184C6A5FE;
	Sun, 19 Feb 2023 09:34:47 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B028C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:34:46 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 s78-20020a257751000000b008f257b16d71so20551ybc.15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IJ9mpKEII8b9zP7ZWkBkiRr3d/wqZ7eKUUGAHl4KRMM=;
 b=Wq7kd9AzZfERH/Wm96yVGtChfJIxX+Hq45TeTzrKqX6FBA90UqzrHKNaRhJjgtar5/
 bhimsNdCsV5BYLK61cgfvHH1vhKfftVlyZ0hn+nA1cQcUXu1UKlJVhj9lMHk5M6FLuvM
 vNTfKd0izX9zt/h4iW3ALc3gSdLjLzCbUyNUnDg4Z3VCd1vDmdhXFdZgrkePkoQ/dEtS
 jK+sZatpxHnfOSjYx2XD6a/9cOoznt6WeG8PHDMQk90hC7bbXgYcy0GaACirsuMbCXoi
 hhOzFVvuyY2zoB6AUilSgOvhEvFH/siKENcL+09Vk0Xo2eRaQSbzj7mKSMywxjG4M9iv
 d8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJ9mpKEII8b9zP7ZWkBkiRr3d/wqZ7eKUUGAHl4KRMM=;
 b=fb/+i4UZyM7GcZD7RlTWz3Y4q4cNA0FQdojKVc2B3izHSwKzrLz/uUIKIuCL/9yEf2
 tzp5H+gsbj3iiVQAcw6oo4vcVdCgMHl0txud7eql9N3q/d1T6IaQtAhNS9DCaPsagFg+
 9qmsNh0XmkQRC7ZV+KMkAMEueXTzd8i1QZVqm9qIbgEwhT+nniQr45vDC/iB15RWSGTs
 91L8wAvqZ9CVm1UnRb2HeMksh+8HBptQDps9q0YjXmAQHJ96czBTKVlU2ywwmmUNnFDs
 sAvriN6Y4bvxiIC/Sfli8itVdmOQxd8BgRPjrDToo7+zvEpabuJi/mbetw76y8/FMuDj
 hIbA==
X-Gm-Message-State: AO0yUKVPcr2esrRwRHW79M1bPww6Sk9NuEZJK1Jguw0HyT4vSybcar1T
 9ZVrY7HVFWcVR3wBHECJIJP1YP+TqbnR
X-Google-Smtp-Source: AK7set8Tfv0BGuNfYq9cLusfn9nZpJWmqZP80mZ6E4lzSQLSRdjiaMTyjRCebHBWxidVypB+0faDUTBwUM0L
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a81:ae0a:0:b0:52e:f66d:b70d with SMTP id
 m10-20020a81ae0a000000b0052ef66db70dmr22944ywh.0.1676799285601; Sun, 19 Feb
 2023 01:34:45 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:38 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-42-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 41/51] perf stat: Remove topdown event
	special handling
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

Now the events are computed from json metrics, the hard coded logic
can be removed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/stat-shadow.c | 346 ----------------------------------
 tools/perf/util/stat.c        |  13 --
 tools/perf/util/stat.h        |  26 ---
 3 files changed, 385 deletions(-)

diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index 77483eeda0d8..5189756bf16d 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -241,45 +241,6 @@ void perf_stat__update_shadow_stats(struct evsel *counter, u64 count,
 		update_runtime_stat(st, STAT_TRANSACTION, map_idx, count, &rsd);
 	else if (perf_stat_evsel__is(counter, ELISION_START))
 		update_runtime_stat(st, STAT_ELISION, map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_TOTAL_SLOTS))
-		update_runtime_stat(st, STAT_TOPDOWN_TOTAL_SLOTS,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_SLOTS_ISSUED))
-		update_runtime_stat(st, STAT_TOPDOWN_SLOTS_ISSUED,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_SLOTS_RETIRED))
-		update_runtime_stat(st, STAT_TOPDOWN_SLOTS_RETIRED,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_FETCH_BUBBLES))
-		update_runtime_stat(st, STAT_TOPDOWN_FETCH_BUBBLES,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_RECOVERY_BUBBLES))
-		update_runtime_stat(st, STAT_TOPDOWN_RECOVERY_BUBBLES,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_RETIRING))
-		update_runtime_stat(st, STAT_TOPDOWN_RETIRING,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_BAD_SPEC))
-		update_runtime_stat(st, STAT_TOPDOWN_BAD_SPEC,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_FE_BOUND))
-		update_runtime_stat(st, STAT_TOPDOWN_FE_BOUND,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_BE_BOUND))
-		update_runtime_stat(st, STAT_TOPDOWN_BE_BOUND,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_HEAVY_OPS))
-		update_runtime_stat(st, STAT_TOPDOWN_HEAVY_OPS,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_BR_MISPREDICT))
-		update_runtime_stat(st, STAT_TOPDOWN_BR_MISPREDICT,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_FETCH_LAT))
-		update_runtime_stat(st, STAT_TOPDOWN_FETCH_LAT,
-				    map_idx, count, &rsd);
-	else if (perf_stat_evsel__is(counter, TOPDOWN_MEM_BOUND))
-		update_runtime_stat(st, STAT_TOPDOWN_MEM_BOUND,
-				    map_idx, count, &rsd);
 	else if (evsel__match(counter, HARDWARE, HW_STALLED_CYCLES_FRONTEND))
 		update_runtime_stat(st, STAT_STALLED_CYCLES_FRONT,
 				    map_idx, count, &rsd);
@@ -524,156 +485,6 @@ static void print_ll_cache_misses(struct perf_stat_config *config,
 	out->print_metric(config, out->ctx, color, "%7.2f%%", "of all LL-cache accesses", ratio);
 }
 
-/*
- * High level "TopDown" CPU core pipe line bottleneck break down.
- *
- * Basic concept following
- * Yasin, A Top Down Method for Performance analysis and Counter architecture
- * ISPASS14
- *
- * The CPU pipeline is divided into 4 areas that can be bottlenecks:
- *
- * Frontend -> Backend -> Retiring
- * BadSpeculation in addition means out of order execution that is thrown away
- * (for example branch mispredictions)
- * Frontend is instruction decoding.
- * Backend is execution, like computation and accessing data in memory
- * Retiring is good execution that is not directly bottlenecked
- *
- * The formulas are computed in slots.
- * A slot is an entry in the pipeline each for the pipeline width
- * (for example a 4-wide pipeline has 4 slots for each cycle)
- *
- * Formulas:
- * BadSpeculation = ((SlotsIssued - SlotsRetired) + RecoveryBubbles) /
- *			TotalSlots
- * Retiring = SlotsRetired / TotalSlots
- * FrontendBound = FetchBubbles / TotalSlots
- * BackendBound = 1.0 - BadSpeculation - Retiring - FrontendBound
- *
- * The kernel provides the mapping to the low level CPU events and any scaling
- * needed for the CPU pipeline width, for example:
- *
- * TotalSlots = Cycles * 4
- *
- * The scaling factor is communicated in the sysfs unit.
- *
- * In some cases the CPU may not be able to measure all the formulas due to
- * missing events. In this case multiple formulas are combined, as possible.
- *
- * Full TopDown supports more levels to sub-divide each area: for example
- * BackendBound into computing bound and memory bound. For now we only
- * support Level 1 TopDown.
- */
-
-static double sanitize_val(double x)
-{
-	if (x < 0 && x >= -0.02)
-		return 0.0;
-	return x;
-}
-
-static double td_total_slots(int map_idx, struct runtime_stat *st,
-			     struct runtime_stat_data *rsd)
-{
-	return runtime_stat_avg(st, STAT_TOPDOWN_TOTAL_SLOTS, map_idx, rsd);
-}
-
-static double td_bad_spec(int map_idx, struct runtime_stat *st,
-			  struct runtime_stat_data *rsd)
-{
-	double bad_spec = 0;
-	double total_slots;
-	double total;
-
-	total = runtime_stat_avg(st, STAT_TOPDOWN_SLOTS_ISSUED, map_idx, rsd) -
-		runtime_stat_avg(st, STAT_TOPDOWN_SLOTS_RETIRED, map_idx, rsd) +
-		runtime_stat_avg(st, STAT_TOPDOWN_RECOVERY_BUBBLES, map_idx, rsd);
-
-	total_slots = td_total_slots(map_idx, st, rsd);
-	if (total_slots)
-		bad_spec = total / total_slots;
-	return sanitize_val(bad_spec);
-}
-
-static double td_retiring(int map_idx, struct runtime_stat *st,
-			  struct runtime_stat_data *rsd)
-{
-	double retiring = 0;
-	double total_slots = td_total_slots(map_idx, st, rsd);
-	double ret_slots = runtime_stat_avg(st, STAT_TOPDOWN_SLOTS_RETIRED,
-					    map_idx, rsd);
-
-	if (total_slots)
-		retiring = ret_slots / total_slots;
-	return retiring;
-}
-
-static double td_fe_bound(int map_idx, struct runtime_stat *st,
-			  struct runtime_stat_data *rsd)
-{
-	double fe_bound = 0;
-	double total_slots = td_total_slots(map_idx, st, rsd);
-	double fetch_bub = runtime_stat_avg(st, STAT_TOPDOWN_FETCH_BUBBLES,
-					    map_idx, rsd);
-
-	if (total_slots)
-		fe_bound = fetch_bub / total_slots;
-	return fe_bound;
-}
-
-static double td_be_bound(int map_idx, struct runtime_stat *st,
-			  struct runtime_stat_data *rsd)
-{
-	double sum = (td_fe_bound(map_idx, st, rsd) +
-		      td_bad_spec(map_idx, st, rsd) +
-		      td_retiring(map_idx, st, rsd));
-	if (sum == 0)
-		return 0;
-	return sanitize_val(1.0 - sum);
-}
-
-/*
- * Kernel reports metrics multiplied with slots. To get back
- * the ratios we need to recreate the sum.
- */
-
-static double td_metric_ratio(int map_idx, enum stat_type type,
-			      struct runtime_stat *stat,
-			      struct runtime_stat_data *rsd)
-{
-	double sum = runtime_stat_avg(stat, STAT_TOPDOWN_RETIRING, map_idx, rsd) +
-		runtime_stat_avg(stat, STAT_TOPDOWN_FE_BOUND, map_idx, rsd) +
-		runtime_stat_avg(stat, STAT_TOPDOWN_BE_BOUND, map_idx, rsd) +
-		runtime_stat_avg(stat, STAT_TOPDOWN_BAD_SPEC, map_idx, rsd);
-	double d = runtime_stat_avg(stat, type, map_idx, rsd);
-
-	if (sum)
-		return d / sum;
-	return 0;
-}
-
-/*
- * ... but only if most of the values are actually available.
- * We allow two missing.
- */
-
-static bool full_td(int map_idx, struct runtime_stat *stat,
-		    struct runtime_stat_data *rsd)
-{
-	int c = 0;
-
-	if (runtime_stat_avg(stat, STAT_TOPDOWN_RETIRING, map_idx, rsd) > 0)
-		c++;
-	if (runtime_stat_avg(stat, STAT_TOPDOWN_BE_BOUND, map_idx, rsd) > 0)
-		c++;
-	if (runtime_stat_avg(stat, STAT_TOPDOWN_FE_BOUND, map_idx, rsd) > 0)
-		c++;
-	if (runtime_stat_avg(stat, STAT_TOPDOWN_BAD_SPEC, map_idx, rsd) > 0)
-		c++;
-	return c >= 2;
-}
-
 static void print_smi_cost(struct perf_stat_config *config, int map_idx,
 			   struct perf_stat_output_ctx *out,
 			   struct runtime_stat *st,
@@ -885,7 +696,6 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 	void *ctxp = out->ctx;
 	print_metric_t print_metric = out->print_metric;
 	double total, ratio = 0.0, total2;
-	const char *color = NULL;
 	struct runtime_stat_data rsd = {
 		.ctx = evsel_context(evsel),
 		.cgrp = evsel->cgrp,
@@ -1044,162 +854,6 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 				     avg / (ratio * evsel->scale));
 		else
 			print_metric(config, ctxp, NULL, NULL, "CPUs utilized", 0);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_FETCH_BUBBLES)) {
-		double fe_bound = td_fe_bound(map_idx, st, &rsd);
-
-		if (fe_bound > 0.2)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "frontend bound",
-				fe_bound * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_SLOTS_RETIRED)) {
-		double retiring = td_retiring(map_idx, st, &rsd);
-
-		if (retiring > 0.7)
-			color = PERF_COLOR_GREEN;
-		print_metric(config, ctxp, color, "%8.1f%%", "retiring",
-				retiring * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_RECOVERY_BUBBLES)) {
-		double bad_spec = td_bad_spec(map_idx, st, &rsd);
-
-		if (bad_spec > 0.1)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "bad speculation",
-				bad_spec * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_SLOTS_ISSUED)) {
-		double be_bound = td_be_bound(map_idx, st, &rsd);
-		const char *name = "backend bound";
-		static int have_recovery_bubbles = -1;
-
-		/* In case the CPU does not support topdown-recovery-bubbles */
-		if (have_recovery_bubbles < 0)
-			have_recovery_bubbles = pmu_have_event("cpu",
-					"topdown-recovery-bubbles");
-		if (!have_recovery_bubbles)
-			name = "backend bound/bad spec";
-
-		if (be_bound > 0.2)
-			color = PERF_COLOR_RED;
-		if (td_total_slots(map_idx, st, &rsd) > 0)
-			print_metric(config, ctxp, color, "%8.1f%%", name,
-					be_bound * 100.);
-		else
-			print_metric(config, ctxp, NULL, NULL, name, 0);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_RETIRING) &&
-		   full_td(map_idx, st, &rsd)) {
-		double retiring = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_RETIRING, st,
-						  &rsd);
-		if (retiring > 0.7)
-			color = PERF_COLOR_GREEN;
-		print_metric(config, ctxp, color, "%8.1f%%", "Retiring",
-				retiring * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_FE_BOUND) &&
-		   full_td(map_idx, st, &rsd)) {
-		double fe_bound = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_FE_BOUND, st,
-						  &rsd);
-		if (fe_bound > 0.2)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "Frontend Bound",
-				fe_bound * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_BE_BOUND) &&
-		   full_td(map_idx, st, &rsd)) {
-		double be_bound = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_BE_BOUND, st,
-						  &rsd);
-		if (be_bound > 0.2)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "Backend Bound",
-				be_bound * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_BAD_SPEC) &&
-		   full_td(map_idx, st, &rsd)) {
-		double bad_spec = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_BAD_SPEC, st,
-						  &rsd);
-		if (bad_spec > 0.1)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "Bad Speculation",
-				bad_spec * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_HEAVY_OPS) &&
-			full_td(map_idx, st, &rsd) && (config->topdown_level > 1)) {
-		double retiring = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_RETIRING, st,
-						  &rsd);
-		double heavy_ops = td_metric_ratio(map_idx,
-						   STAT_TOPDOWN_HEAVY_OPS, st,
-						   &rsd);
-		double light_ops = retiring - heavy_ops;
-
-		if (retiring > 0.7 && heavy_ops > 0.1)
-			color = PERF_COLOR_GREEN;
-		print_metric(config, ctxp, color, "%8.1f%%", "Heavy Operations",
-				heavy_ops * 100.);
-		if (retiring > 0.7 && light_ops > 0.6)
-			color = PERF_COLOR_GREEN;
-		else
-			color = NULL;
-		print_metric(config, ctxp, color, "%8.1f%%", "Light Operations",
-				light_ops * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_BR_MISPREDICT) &&
-			full_td(map_idx, st, &rsd) && (config->topdown_level > 1)) {
-		double bad_spec = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_BAD_SPEC, st,
-						  &rsd);
-		double br_mis = td_metric_ratio(map_idx,
-						STAT_TOPDOWN_BR_MISPREDICT, st,
-						&rsd);
-		double m_clears = bad_spec - br_mis;
-
-		if (bad_spec > 0.1 && br_mis > 0.05)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "Branch Mispredict",
-				br_mis * 100.);
-		if (bad_spec > 0.1 && m_clears > 0.05)
-			color = PERF_COLOR_RED;
-		else
-			color = NULL;
-		print_metric(config, ctxp, color, "%8.1f%%", "Machine Clears",
-				m_clears * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_FETCH_LAT) &&
-			full_td(map_idx, st, &rsd) && (config->topdown_level > 1)) {
-		double fe_bound = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_FE_BOUND, st,
-						  &rsd);
-		double fetch_lat = td_metric_ratio(map_idx,
-						   STAT_TOPDOWN_FETCH_LAT, st,
-						   &rsd);
-		double fetch_bw = fe_bound - fetch_lat;
-
-		if (fe_bound > 0.2 && fetch_lat > 0.15)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "Fetch Latency",
-				fetch_lat * 100.);
-		if (fe_bound > 0.2 && fetch_bw > 0.1)
-			color = PERF_COLOR_RED;
-		else
-			color = NULL;
-		print_metric(config, ctxp, color, "%8.1f%%", "Fetch Bandwidth",
-				fetch_bw * 100.);
-	} else if (perf_stat_evsel__is(evsel, TOPDOWN_MEM_BOUND) &&
-			full_td(map_idx, st, &rsd) && (config->topdown_level > 1)) {
-		double be_bound = td_metric_ratio(map_idx,
-						  STAT_TOPDOWN_BE_BOUND, st,
-						  &rsd);
-		double mem_bound = td_metric_ratio(map_idx,
-						   STAT_TOPDOWN_MEM_BOUND, st,
-						   &rsd);
-		double core_bound = be_bound - mem_bound;
-
-		if (be_bound > 0.2 && mem_bound > 0.2)
-			color = PERF_COLOR_RED;
-		print_metric(config, ctxp, color, "%8.1f%%", "Memory Bound",
-				mem_bound * 100.);
-		if (be_bound > 0.2 && core_bound > 0.1)
-			color = PERF_COLOR_RED;
-		else
-			color = NULL;
-		print_metric(config, ctxp, color, "%8.1f%%", "Core Bound",
-				core_bound * 100.);
 	} else if (runtime_stat_n(st, STAT_NSECS, map_idx, &rsd) != 0) {
 		char unit = ' ';
 		char unit_buf[10] = "/sec";
diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
index 534d36d26fc3..0b8c91ca13cd 100644
--- a/tools/perf/util/stat.c
+++ b/tools/perf/util/stat.c
@@ -91,19 +91,6 @@ static const char *id_str[PERF_STAT_EVSEL_ID__MAX] = {
 	ID(TRANSACTION_START,	cpu/tx-start/),
 	ID(ELISION_START,	cpu/el-start/),
 	ID(CYCLES_IN_TX_CP,	cpu/cycles-ct/),
-	ID(TOPDOWN_TOTAL_SLOTS, topdown-total-slots),
-	ID(TOPDOWN_SLOTS_ISSUED, topdown-slots-issued),
-	ID(TOPDOWN_SLOTS_RETIRED, topdown-slots-retired),
-	ID(TOPDOWN_FETCH_BUBBLES, topdown-fetch-bubbles),
-	ID(TOPDOWN_RECOVERY_BUBBLES, topdown-recovery-bubbles),
-	ID(TOPDOWN_RETIRING, topdown-retiring),
-	ID(TOPDOWN_BAD_SPEC, topdown-bad-spec),
-	ID(TOPDOWN_FE_BOUND, topdown-fe-bound),
-	ID(TOPDOWN_BE_BOUND, topdown-be-bound),
-	ID(TOPDOWN_HEAVY_OPS, topdown-heavy-ops),
-	ID(TOPDOWN_BR_MISPREDICT, topdown-br-mispredict),
-	ID(TOPDOWN_FETCH_LAT, topdown-fetch-lat),
-	ID(TOPDOWN_MEM_BOUND, topdown-mem-bound),
 	ID(SMI_NUM, msr/smi/),
 	ID(APERF, msr/aperf/),
 };
diff --git a/tools/perf/util/stat.h b/tools/perf/util/stat.h
index cf2d8aa445f3..42af350a96d9 100644
--- a/tools/perf/util/stat.h
+++ b/tools/perf/util/stat.h
@@ -25,19 +25,6 @@ enum perf_stat_evsel_id {
 	PERF_STAT_EVSEL_ID__TRANSACTION_START,
 	PERF_STAT_EVSEL_ID__ELISION_START,
 	PERF_STAT_EVSEL_ID__CYCLES_IN_TX_CP,
-	PERF_STAT_EVSEL_ID__TOPDOWN_TOTAL_SLOTS,
-	PERF_STAT_EVSEL_ID__TOPDOWN_SLOTS_ISSUED,
-	PERF_STAT_EVSEL_ID__TOPDOWN_SLOTS_RETIRED,
-	PERF_STAT_EVSEL_ID__TOPDOWN_FETCH_BUBBLES,
-	PERF_STAT_EVSEL_ID__TOPDOWN_RECOVERY_BUBBLES,
-	PERF_STAT_EVSEL_ID__TOPDOWN_RETIRING,
-	PERF_STAT_EVSEL_ID__TOPDOWN_BAD_SPEC,
-	PERF_STAT_EVSEL_ID__TOPDOWN_FE_BOUND,
-	PERF_STAT_EVSEL_ID__TOPDOWN_BE_BOUND,
-	PERF_STAT_EVSEL_ID__TOPDOWN_HEAVY_OPS,
-	PERF_STAT_EVSEL_ID__TOPDOWN_BR_MISPREDICT,
-	PERF_STAT_EVSEL_ID__TOPDOWN_FETCH_LAT,
-	PERF_STAT_EVSEL_ID__TOPDOWN_MEM_BOUND,
 	PERF_STAT_EVSEL_ID__SMI_NUM,
 	PERF_STAT_EVSEL_ID__APERF,
 	PERF_STAT_EVSEL_ID__MAX,
@@ -108,19 +95,6 @@ enum stat_type {
 	STAT_CYCLES_IN_TX,
 	STAT_TRANSACTION,
 	STAT_ELISION,
-	STAT_TOPDOWN_TOTAL_SLOTS,
-	STAT_TOPDOWN_SLOTS_ISSUED,
-	STAT_TOPDOWN_SLOTS_RETIRED,
-	STAT_TOPDOWN_FETCH_BUBBLES,
-	STAT_TOPDOWN_RECOVERY_BUBBLES,
-	STAT_TOPDOWN_RETIRING,
-	STAT_TOPDOWN_BAD_SPEC,
-	STAT_TOPDOWN_FE_BOUND,
-	STAT_TOPDOWN_BE_BOUND,
-	STAT_TOPDOWN_HEAVY_OPS,
-	STAT_TOPDOWN_BR_MISPREDICT,
-	STAT_TOPDOWN_FETCH_LAT,
-	STAT_TOPDOWN_MEM_BOUND,
 	STAT_SMI_NUM,
 	STAT_APERF,
 	STAT_MAX
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
