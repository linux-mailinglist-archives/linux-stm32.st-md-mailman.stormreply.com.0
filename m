Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD069BFA1
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:34:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C21C2C6A5FE;
	Sun, 19 Feb 2023 09:34:29 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A950FC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:34:28 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 l125-20020a25cc83000000b0083fa6f15c2fso1936782ybf.16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ivvDzCiOjMDLj/gcFt7rd0F2g23q1K7jFLZUP1Bknc=;
 b=pYOV+yD5JlC63LIjHOEgCbCoVbA5/K+27F7L88dBNxpq0XtFj0mZZlqIwBeS92aa/g
 4kDUIW6Ukpzk0fFBdMUaZQ9gpbxcONzq+Wex72Os29VOJJeKmMByz2aAyDl1kZOJhSvz
 gMyXVIcQ66hX6vSSMEXC6o0ZfK1beKFKsed7fXcseehPo4dxwSPM0pj09N90AAhkjkgC
 RqmIIPmMTskb/OWIeVf6wOoMaMNj2sJEn+pKMsU2ZwLxQqfbvK/cKpI5GR39iETOkuxK
 apz9HUvn1dPJ6d+YgJ5aG1cft6QskyAlLCTBnyeqR6tQvJk1kYio9jElUCO1VUWcZ9I6
 YNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4ivvDzCiOjMDLj/gcFt7rd0F2g23q1K7jFLZUP1Bknc=;
 b=38vmA2Io4oSby0Uu/sxBanEl4ffqj+JkC4iHDXjjqPJXh/llM7SOy25kbIhJOSyyCg
 U6am1P3ku51xGqEWp7hIjlFZcg8G8/PIW3f04mjNaf5Sl0rXr74/RsoH+ghSZ11Fp5W/
 4B09pb/o/vF8iY8UGYuYu6rISoSR4ifCKkFKNzkUpAwirqlMebu0ArTm5LMKyz8sK6fV
 xR8xcOikXGy2LzSxviJeITbKfemhsTXuRoBY9ncDX3gSB/O0NrfxqJxWRi5seAentIPo
 jTUTKJFDH5kRgc1kJUsS18OT6lEGXuQtT90vTrWOqOQVswBX9D9MBVIUe/hq55dl9+qA
 6YDQ==
X-Gm-Message-State: AO0yUKVbA/oUyk8L6p5HR7mzUWxENyzS6hP0hOKuCuATS5N4heqbPU6R
 H6B41SFG7SMueBKZy8uy5ALFxfQct7dT
X-Google-Smtp-Source: AK7set8yN+kBbD9ri+YxCMZN5KWjv18FQjaq/9X1tHGt8jIhLEZWXlDKUsXy15DHn+Gq5dx+2iMz3JjgRtb3
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:291:b0:9a0:1d7b:707b with SMTP id
 v17-20020a056902029100b009a01d7b707bmr49325ybh.4.1676799268239; Sun, 19 Feb
 2023 01:34:28 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:36 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-40-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 39/51] perf stat: Add TopdownL1 metric as a
	default if present
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

When there are no events and on Intel, the topdown events will be
added by default if present. To display the metrics associated with
these request special handling in stat-shadow.c. To more easily update
these metrics use the json metric version via the TopdownL1
group. This makes the handling less platform specific.

Modify the metricgroup__has_metric code to also cover metric groups.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/x86/util/evlist.c  |  6 +++---
 tools/perf/arch/x86/util/topdown.c | 30 ------------------------------
 tools/perf/arch/x86/util/topdown.h |  1 -
 tools/perf/builtin-stat.c          | 14 ++++++++++++++
 tools/perf/util/metricgroup.c      |  6 ++----
 5 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/tools/perf/arch/x86/util/evlist.c b/tools/perf/arch/x86/util/evlist.c
index cb59ce9b9638..8a7ae4162563 100644
--- a/tools/perf/arch/x86/util/evlist.c
+++ b/tools/perf/arch/x86/util/evlist.c
@@ -59,10 +59,10 @@ int arch_evlist__add_default_attrs(struct evlist *evlist,
 				   struct perf_event_attr *attrs,
 				   size_t nr_attrs)
 {
-	if (nr_attrs)
-		return ___evlist__add_default_attrs(evlist, attrs, nr_attrs);
+	if (!nr_attrs)
+		return 0;
 
-	return topdown_parse_events(evlist);
+	return ___evlist__add_default_attrs(evlist, attrs, nr_attrs);
 }
 
 struct evsel *arch_evlist__leader(struct list_head *list)
diff --git a/tools/perf/arch/x86/util/topdown.c b/tools/perf/arch/x86/util/topdown.c
index 54810f9acd6f..eb3a7d9652ab 100644
--- a/tools/perf/arch/x86/util/topdown.c
+++ b/tools/perf/arch/x86/util/topdown.c
@@ -9,11 +9,6 @@
 #include "topdown.h"
 #include "evsel.h"
 
-#define TOPDOWN_L1_EVENTS       "{slots,topdown-retiring,topdown-bad-spec,topdown-fe-bound,topdown-be-bound}"
-#define TOPDOWN_L1_EVENTS_CORE  "{slots,cpu_core/topdown-retiring/,cpu_core/topdown-bad-spec/,cpu_core/topdown-fe-bound/,cpu_core/topdown-be-bound/}"
-#define TOPDOWN_L2_EVENTS       "{slots,topdown-retiring,topdown-bad-spec,topdown-fe-bound,topdown-be-bound,topdown-heavy-ops,topdown-br-mispredict,topdown-fetch-lat,topdown-mem-bound}"
-#define TOPDOWN_L2_EVENTS_CORE  "{slots,cpu_core/topdown-retiring/,cpu_core/topdown-bad-spec/,cpu_core/topdown-fe-bound/,cpu_core/topdown-be-bound/,cpu_core/topdown-heavy-ops/,cpu_core/topdown-br-mispredict/,cpu_core/topdown-fetch-lat/,cpu_core/topdown-mem-bound/}"
-
 /* Check whether there is a PMU which supports the perf metrics. */
 bool topdown_sys_has_perf_metrics(void)
 {
@@ -99,28 +94,3 @@ const char *arch_get_topdown_pmu_name(struct evlist *evlist, bool warn)
 
 	return pmu_name;
 }
-
-int topdown_parse_events(struct evlist *evlist)
-{
-	const char *topdown_events;
-	const char *pmu_name;
-
-	if (!topdown_sys_has_perf_metrics())
-		return 0;
-
-	pmu_name = arch_get_topdown_pmu_name(evlist, false);
-
-	if (pmu_have_event(pmu_name, "topdown-heavy-ops")) {
-		if (!strcmp(pmu_name, "cpu_core"))
-			topdown_events = TOPDOWN_L2_EVENTS_CORE;
-		else
-			topdown_events = TOPDOWN_L2_EVENTS;
-	} else {
-		if (!strcmp(pmu_name, "cpu_core"))
-			topdown_events = TOPDOWN_L1_EVENTS_CORE;
-		else
-			topdown_events = TOPDOWN_L1_EVENTS;
-	}
-
-	return parse_event(evlist, topdown_events);
-}
diff --git a/tools/perf/arch/x86/util/topdown.h b/tools/perf/arch/x86/util/topdown.h
index 7eb81f042838..46bf9273e572 100644
--- a/tools/perf/arch/x86/util/topdown.h
+++ b/tools/perf/arch/x86/util/topdown.h
@@ -3,6 +3,5 @@
 #define _TOPDOWN_H 1
 
 bool topdown_sys_has_perf_metrics(void);
-int topdown_parse_events(struct evlist *evlist);
 
 #endif
diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 5e13171a7bba..796e98e453f6 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -1996,6 +1996,7 @@ static int add_default_attributes(void)
 		stat_config.topdown_level = TOPDOWN_MAX_LEVEL;
 
 	if (!evsel_list->core.nr_entries) {
+		/* No events so add defaults. */
 		if (target__has_cpu(&target))
 			default_attrs0[0].config = PERF_COUNT_SW_CPU_CLOCK;
 
@@ -2011,6 +2012,19 @@ static int add_default_attributes(void)
 		}
 		if (evlist__add_default_attrs(evsel_list, default_attrs1) < 0)
 			return -1;
+		/*
+		 * Add TopdownL1 metrics if they exist. To minimize
+		 * multiplexing, don't request threshold computation.
+		 */
+		if (metricgroup__has_metric("TopdownL1") &&
+		    metricgroup__parse_groups(evsel_list, "TopdownL1",
+					    /*metric_no_group=*/false,
+					    /*metric_no_merge=*/false,
+					    /*metric_no_threshold=*/true,
+					    stat_config.user_requested_cpu_list,
+					    stat_config.system_wide,
+					    &stat_config.metric_events) < 0)
+			return -1;
 		/* Platform specific attrs */
 		if (evlist__add_default_attrs(evsel_list, default_null_attrs) < 0)
 			return -1;
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index afb6f2fdc24e..64a35f2787dc 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -1647,10 +1647,8 @@ static int metricgroup__has_metric_callback(const struct pmu_metric *pm,
 {
 	const char *metric = vdata;
 
-	if (!pm->metric_expr)
-		return 0;
-
-	if (match_metric(pm->metric_name, metric))
+	if (match_metric(pm->metric_name, metric) ||
+	    match_metric(pm->metric_group, metric))
 		return 1;
 
 	return 0;
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
