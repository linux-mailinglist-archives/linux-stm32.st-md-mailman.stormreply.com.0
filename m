Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3EE69BFAC
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:35:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46FB8C6A5FE;
	Sun, 19 Feb 2023 09:35:21 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EEB7C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:35:20 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-53688fe539aso16864007b3.16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=V1c75G2QRp2XfNcd0fyJt7z2QBiUcClmUEJnZutpl3U=;
 b=lQc7DLqjY+G0h68iUyNnQt0s8JbFjdLvt6vUD0X3O7LQXsct1au6ugX7YKcPBS3UPJ
 AsAznm2proFWTuMGysZno/FG9nfkQj2SekacMWMc3JcdaBlyiBSXOGz0lhlEgLdgGAxp
 WDR9gSMRJuJm8sfYf4Js7MhM80qTW0YRs+7lkwr6P601fxAf4quXfIGXkK94Dp9yf7NJ
 VG/TQ0DMh2RX36SsfyliyUni4YrostDu/WgZ0dbrvUcDxYX103Xt5iUnMSJxA78X1q/J
 xUWr1XsXdm9DAOmntwU2JGUE0TJhIpozeTXHwgCbdlqWpR3m96Aghhr+kQKjI1/QS/RH
 /euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V1c75G2QRp2XfNcd0fyJt7z2QBiUcClmUEJnZutpl3U=;
 b=U3IEYKuHpYt03iAgBcd38xCZGeM+Lkq96dF/5k36gy8ZXyBcBtwBeUm3A6FSZd26Dj
 OsFF/d81q/j40WeTxXbC7Oj5KYcUa0y8oHbtPO6a1Uz5q5PMCF1Gq5HqH8zAvBifoswr
 Qkxfx9N3SPcp8TSBQRlLI7C26JFaXAcgUc659+STo2Z+34/tJ3IJCmjshv8oYtx19pKv
 tGoD6wUmOfWea6JFY+R5EVen24MNa8AMMv3QCJHf3BUoBpfLQxv0c2Zuw41jE/LwzUwr
 jaylnX+eKxTzYcEfPDkJg9VaTUnQfTg9l53zcaJDoTzzgEaXAfj0VayNM4C3ucb0QblH
 vJkw==
X-Gm-Message-State: AO0yUKUF9amIa30dByhiP36MCu0NwglOQLXI9kXGWPaY7WRJ/eobjqmu
 4fr+ah6uS94LdNHQB4vgRDjmCTukv7fL
X-Google-Smtp-Source: AK7set+0phLS9+KCkYB1hD6t9OHjqMNjyrH3Ll05ZAB31Ht5Vz9xAKErSbBOtdwOA5pdD6xB9HPX23EwfbRP
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a0d:d6c1:0:b0:514:dae0:21ef with SMTP id
 y184-20020a0dd6c1000000b00514dae021efmr2065215ywd.133.1676799319684; Sun, 19
 Feb 2023 01:35:19 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:42 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-46-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 45/51] perf stat: Remove perf_stat_evsel_id
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

perf_stat_evsel_id was used for hard coded metrics. These have now
migrated to json metrics and so the id values are no longer necessary.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/stat.c | 31 -------------------------------
 tools/perf/util/stat.h | 12 ------------
 2 files changed, 43 deletions(-)

diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
index d51d7457f12d..8d83d2f4a082 100644
--- a/tools/perf/util/stat.c
+++ b/tools/perf/util/stat.c
@@ -77,36 +77,6 @@ double rel_stddev_stats(double stddev, double avg)
 	return pct;
 }
 
-bool __perf_stat_evsel__is(struct evsel *evsel, enum perf_stat_evsel_id id)
-{
-	struct perf_stat_evsel *ps = evsel->stats;
-
-	return ps->id == id;
-}
-
-#define ID(id, name) [PERF_STAT_EVSEL_ID__##id] = #name
-static const char *id_str[PERF_STAT_EVSEL_ID__MAX] = {
-	ID(NONE,		x),
-};
-#undef ID
-
-static void perf_stat_evsel_id_init(struct evsel *evsel)
-{
-	struct perf_stat_evsel *ps = evsel->stats;
-	int i;
-
-	/* ps->id is 0 hence PERF_STAT_EVSEL_ID__NONE by default */
-
-	for (i = 0; i < PERF_STAT_EVSEL_ID__MAX; i++) {
-		if (!strcmp(evsel__name(evsel), id_str[i]) ||
-		    (strstr(evsel__name(evsel), id_str[i]) && evsel->pmu_name
-		     && strstr(evsel__name(evsel), evsel->pmu_name))) {
-			ps->id = i;
-			break;
-		}
-	}
-}
-
 static void evsel__reset_aggr_stats(struct evsel *evsel)
 {
 	struct perf_stat_evsel *ps = evsel->stats;
@@ -166,7 +136,6 @@ static int evsel__alloc_stat_priv(struct evsel *evsel, int nr_aggr)
 		return -ENOMEM;
 	}
 
-	perf_stat_evsel_id_init(evsel);
 	evsel__reset_stat_priv(evsel);
 	return 0;
 }
diff --git a/tools/perf/util/stat.h b/tools/perf/util/stat.h
index 9af4af3bc3f2..df6068a3f7bb 100644
--- a/tools/perf/util/stat.h
+++ b/tools/perf/util/stat.h
@@ -19,11 +19,6 @@ struct stats {
 	u64 max, min;
 };
 
-enum perf_stat_evsel_id {
-	PERF_STAT_EVSEL_ID__NONE = 0,
-	PERF_STAT_EVSEL_ID__MAX,
-};
-
 /* hold aggregated event info */
 struct perf_stat_aggr {
 	/* aggregated values */
@@ -40,8 +35,6 @@ struct perf_stat_aggr {
 struct perf_stat_evsel {
 	/* used for repeated runs */
 	struct stats		 res_stats;
-	/* evsel id for quick check */
-	enum perf_stat_evsel_id	 id;
 	/* number of allocated 'aggr' */
 	int			 nr_aggr;
 	/* aggregated event values */
@@ -187,11 +180,6 @@ static inline void update_rusage_stats(struct rusage_stats *ru_stats, struct rus
 struct evsel;
 struct evlist;
 
-bool __perf_stat_evsel__is(struct evsel *evsel, enum perf_stat_evsel_id id);
-
-#define perf_stat_evsel__is(evsel, id) \
-	__perf_stat_evsel__is(evsel, PERF_STAT_EVSEL_ID__ ## id)
-
 extern struct runtime_stat rt_stat;
 extern struct stats walltime_nsecs_stats;
 extern struct rusage_stats ru_stats;
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
