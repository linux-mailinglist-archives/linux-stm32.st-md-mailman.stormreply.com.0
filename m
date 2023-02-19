Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1769BF65
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:29:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A025CC65E58;
	Sun, 19 Feb 2023 09:29:20 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D2FEC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:29:19 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 a9-20020a25bac9000000b00827819f87e5so72912ybk.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sNT3gLbGiThQ7GyW2mykwD5/AMMBv9vHnEgALQN2uR8=;
 b=Y4Uf0mLpp4+NuPEb+TnO5xc7bJkkLosWlqADaN5wSxFmQOe/91hOwRqdwOsnA2dwI8
 lOeOYfyo6/3phCF0kMnC6CRSjNuEGHWoLQ4n347Mk7HueB4ctrpOjryVRDEQGLXkzd6e
 rvIu7zQzPyqi4JgLTyorNcbIgDkhaZ9lqcvEm3zhvEUDd78PLKPII0UTMhArle+NMJCM
 obu/2gqT85mz/4xWbiFZJLq167Dtf7l7o+cy7Lhcg42quJzavDoS3PWwycFMbMEJVWYE
 vN1YRagfuIU0eNlebWCwaWKRhJXfu9/tzk89DZPgU7KmkmxzwdcCOb4OESIj1KGmA6On
 O5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sNT3gLbGiThQ7GyW2mykwD5/AMMBv9vHnEgALQN2uR8=;
 b=dmzbd6XSetZcH4eNCmmHvH7gav0UmuRJT+1FtKaBFkRCM5EqYgLVOE6ARC1i4gIGo+
 8NrpgeG7UOBTX65T0XsZM0gXMC6ekBNwnSrs2qU8zj96P3BfjlWZck0wkjA1nm+cbQEq
 en1xOUTxju+bAy9hKgajaxCSJcLW0t6sKpr9j4xrjsBLl+tZzt2V2ARE5/AkTFhA5GkC
 +kavx8QMPgw/lFAr86tS/xIdf4jTaDjlzZm/EPrc1DW/EhH4DFYD61YrFHGEdEiJhe/R
 p51354z625/ZbCSA4u+9juBWX2GKr06bLSjC4mT7QLDmBDoxWscH+tqohpOY8MEF7a/0
 Zexg==
X-Gm-Message-State: AO0yUKWq1/8tK6PfwOVU9sWQqIbIk6vkOcgAuWmMO1yFkTl2G7RefdCl
 8ylhYiOsZZw+PiQ1Xz2hv1PfNE3SRwON
X-Google-Smtp-Source: AK7set8LEcGvtb6lup/tlg4QjdaaRHS4izhOuQsS7tM2/TCwOnESNU4xnsBGRTj4lBwFJXzf3m/Totm3zofC
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a25:9390:0:b0:94a:ebba:cba7 with SMTP id
 a16-20020a259390000000b0094aebbacba7mr18673ybm.8.1676798958130; Sun, 19 Feb
 2023 01:29:18 -0800 (PST)
Date: Sun, 19 Feb 2023 01:27:59 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-3-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 02/51] perf metrics: Improve variable names
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

has_constraint implies the NMI_WATCHDOG_CONSTRAINT and if the
constraint is detected it causes events not to be grouped. Most of the
code cares about whether events are grouped or not, so rename
has_constraint to group_events.

Also remove group from metricgroup___watchdog_constraint_hint as the
warning is specific to a metric. Make the warning message agree with
this too.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/metricgroup.c | 45 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index f3559be95541..b2aa6e049804 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -136,10 +136,9 @@ struct metric {
 	/** Optional null terminated array of referenced metrics. */
 	struct metric_ref *metric_refs;
 	/**
-	 * Is there a constraint on the group of events? In which case the
-	 * events won't be grouped.
+	 * Should events of the metric be grouped?
 	 */
-	bool has_constraint;
+	bool group_events;
 	/**
 	 * Parsed events for the metric. Optional as events may be taken from a
 	 * different metric whose group contains all the IDs necessary for this
@@ -148,12 +147,12 @@ struct metric {
 	struct evlist *evlist;
 };
 
-static void metricgroup___watchdog_constraint_hint(const char *name, bool foot)
+static void metric__watchdog_constraint_hint(const char *name, bool foot)
 {
 	static bool violate_nmi_constraint;
 
 	if (!foot) {
-		pr_warning("Splitting metric group %s into standalone metrics.\n", name);
+		pr_warning("Not grouping metric %s's events.\n", name);
 		violate_nmi_constraint = true;
 		return;
 	}
@@ -167,18 +166,18 @@ static void metricgroup___watchdog_constraint_hint(const char *name, bool foot)
 		   "    echo 1 > /proc/sys/kernel/nmi_watchdog\n");
 }
 
-static bool metricgroup__has_constraint(const struct pmu_metric *pm)
+static bool metric__group_events(const struct pmu_metric *pm)
 {
 	if (!pm->metric_constraint)
-		return false;
+		return true;
 
 	if (!strcmp(pm->metric_constraint, "NO_NMI_WATCHDOG") &&
 	    sysctl__nmi_watchdog_enabled()) {
-		metricgroup___watchdog_constraint_hint(pm->metric_name, false);
-		return true;
+		metric__watchdog_constraint_hint(pm->metric_name, /*foot=*/false);
+		return false;
 	}
 
-	return false;
+	return true;
 }
 
 static void metric__free(struct metric *m)
@@ -227,7 +226,7 @@ static struct metric *metric__new(const struct pmu_metric *pm,
 	}
 	m->pctx->sctx.runtime = runtime;
 	m->pctx->sctx.system_wide = system_wide;
-	m->has_constraint = metric_no_group || metricgroup__has_constraint(pm);
+	m->group_events = !metric_no_group && metric__group_events(pm);
 	m->metric_refs = NULL;
 	m->evlist = NULL;
 
@@ -637,7 +636,7 @@ static int decode_all_metric_ids(struct evlist *perf_evlist, const char *modifie
 static int metricgroup__build_event_string(struct strbuf *events,
 					   const struct expr_parse_ctx *ctx,
 					   const char *modifier,
-					   bool has_constraint)
+					   bool group_events)
 {
 	struct hashmap_entry *cur;
 	size_t bkt;
@@ -662,7 +661,7 @@ static int metricgroup__build_event_string(struct strbuf *events,
 		}
 		/* Separate events with commas and open the group if necessary. */
 		if (no_group) {
-			if (!has_constraint) {
+			if (group_events) {
 				ret = strbuf_addch(events, '{');
 				RETURN_IF_NON_ZERO(ret);
 			}
@@ -716,7 +715,7 @@ static int metricgroup__build_event_string(struct strbuf *events,
 			RETURN_IF_NON_ZERO(ret);
 		}
 	}
-	if (!no_group && !has_constraint) {
+	if (!no_group && group_events) {
 		ret = strbuf_addf(events, "}:W");
 		RETURN_IF_NON_ZERO(ret);
 	}
@@ -1252,7 +1251,7 @@ static int metricgroup__add_metric_list(const char *list, bool metric_no_group,
 		 * Warn about nmi_watchdog if any parsed metrics had the
 		 * NO_NMI_WATCHDOG constraint.
 		 */
-		metricgroup___watchdog_constraint_hint(NULL, true);
+		metric__watchdog_constraint_hint(NULL, /*foot=*/true);
 		/* No metrics. */
 		if (count == 0)
 			return -EINVAL;
@@ -1295,7 +1294,7 @@ static void find_tool_events(const struct list_head *metric_list,
 }
 
 /**
- * build_combined_expr_ctx - Make an expr_parse_ctx with all has_constraint
+ * build_combined_expr_ctx - Make an expr_parse_ctx with all !group_events
  *                           metric IDs, as the IDs are held in a set,
  *                           duplicates will be removed.
  * @metric_list: List to take metrics from.
@@ -1315,7 +1314,7 @@ static int build_combined_expr_ctx(const struct list_head *metric_list,
 		return -ENOMEM;
 
 	list_for_each_entry(m, metric_list, nd) {
-		if (m->has_constraint && !m->modifier) {
+		if (!m->group_events && !m->modifier) {
 			hashmap__for_each_entry(m->pctx->ids, cur, bkt) {
 				dup = strdup(cur->pkey);
 				if (!dup) {
@@ -1342,14 +1341,14 @@ static int build_combined_expr_ctx(const struct list_head *metric_list,
  * @fake_pmu: used when testing metrics not supported by the current CPU.
  * @ids: the event identifiers parsed from a metric.
  * @modifier: any modifiers added to the events.
- * @has_constraint: false if events should be placed in a weak group.
+ * @group_events: should events be placed in a weak group.
  * @tool_events: entries set true if the tool event of index could be present in
  *               the overall list of metrics.
  * @out_evlist: the created list of events.
  */
 static int parse_ids(bool metric_no_merge, struct perf_pmu *fake_pmu,
 		     struct expr_parse_ctx *ids, const char *modifier,
-		     bool has_constraint, const bool tool_events[PERF_TOOL_MAX],
+		     bool group_events, const bool tool_events[PERF_TOOL_MAX],
 		     struct evlist **out_evlist)
 {
 	struct parse_events_error parse_error;
@@ -1393,7 +1392,7 @@ static int parse_ids(bool metric_no_merge, struct perf_pmu *fake_pmu,
 		}
 	}
 	ret = metricgroup__build_event_string(&events, ids, modifier,
-					      has_constraint);
+					      group_events);
 	if (ret)
 		return ret;
 
@@ -1458,7 +1457,7 @@ static int parse_groups(struct evlist *perf_evlist, const char *str,
 		if (!ret && combined && hashmap__size(combined->ids)) {
 			ret = parse_ids(metric_no_merge, fake_pmu, combined,
 					/*modifier=*/NULL,
-					/*has_constraint=*/true,
+					/*group_events=*/false,
 					tool_events,
 					&combined_evlist);
 		}
@@ -1476,7 +1475,7 @@ static int parse_groups(struct evlist *perf_evlist, const char *str,
 		struct metric *n;
 		struct metric_expr *expr;
 
-		if (combined_evlist && m->has_constraint) {
+		if (combined_evlist && !m->group_events) {
 			metric_evlist = combined_evlist;
 		} else if (!metric_no_merge) {
 			/*
@@ -1507,7 +1506,7 @@ static int parse_groups(struct evlist *perf_evlist, const char *str,
 		}
 		if (!metric_evlist) {
 			ret = parse_ids(metric_no_merge, fake_pmu, m->pctx, m->modifier,
-					m->has_constraint, tool_events, &m->evlist);
+					m->group_events, tool_events, &m->evlist);
 			if (ret)
 				goto out;
 
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
