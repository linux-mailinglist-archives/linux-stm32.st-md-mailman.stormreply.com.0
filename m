Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5C69BF68
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:29:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD6DEC65E58;
	Sun, 19 Feb 2023 09:29:28 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F173C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:29:27 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 o14-20020a25730e000000b009419f64f6afso2218327ybc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=d+nYipBPRK9ot6wFg6zmAiDtcnqlM5sx03XMKeU13O4=;
 b=mDOqVGr0N132A/Ll3pITLGW4r43KgUDNLPKUyUvW8eIG8vXmMxFkVQb5dbaC0M2IOs
 2GoGfqJQUeUuATD9qo9D7VoT+Pze6N0XYIPKKvB4wW3libDyZhB2y4XFUwSAiPjb+fxF
 d62ecsMidsbi/mZCuKzEfF4tYuUcoP4N6Y0ppQAp/tynm+DGQKu5p21gv51vkhSBFals
 0qcg9jft/tM3YZvvPuyYuJbIeHf7ShfSEZr76R9jwVkBrc4zZSl09n8ttK31h8tYFqSp
 2UTe/9SYmbm7tRvmPVqXfdfIS1+MPbuPJIL6t6mQjY3yomupc8sIMDOl76CGNIiTqd4V
 JB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d+nYipBPRK9ot6wFg6zmAiDtcnqlM5sx03XMKeU13O4=;
 b=aKyvp3Cv59WzIYiSbzUWvWW78D5KFIJtxEVZGehxC/MbCci8oeseD8/NurVdg9+1Gw
 x9meRATXk1Jd9fAu2F9Dx0y6K1Oa35+RzXiEGRxCtWUVGuFcxJdzcPSRQHIVezDAGpdI
 44PgopsXFKw5CKRQ6UwCkgoULp6952ENtkWdFUWiztgqVoXl+pqMRmbakFTK7+lcdWPb
 F8HaF2jkW8iuDWeF33vn1gNpNMrfBPXuprUurDh9WIxgiBijcmmyMGqtY+Vm6SjA2hy5
 MbinoMRLLHBFlzlVdUaf5CLYNWJFbSdn2gtUvPjlefSj6b0c0reMPbCWTWPtZYd5jbF3
 2XIw==
X-Gm-Message-State: AO0yUKVs7bKk5VhAFOrfXUve+Dm988J/wPFcXrLvaXEYlIynzKSk2sd5
 /KCKKevFrdCEuMB3ub6IWbh1gq4CqBF1
X-Google-Smtp-Source: AK7set8yVsRmd0VayN/HE8SDd6Hfpo5Ij5C4iaDNowj64SqM6hff3g49zWFvMKU7qPrafEJ5QA2DzAuLK0c/
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:144b:b0:88a:f2f:d004 with SMTP id
 a11-20020a056902144b00b0088a0f2fd004mr190523ybv.5.1676798966583; Sun, 19 Feb
 2023 01:29:26 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:00 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-4-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 03/51] perf pmu-events: Remove aggr_mode
	from pmu_event
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

aggr_mode is used on Power to set a flag for metrics. For pmu_event it
is unused.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py   | 2 +-
 tools/perf/pmu-events/pmu-events.h | 1 -
 tools/perf/tests/pmu-events.c      | 6 ------
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 2bcd07ce609f..db8b92de113e 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -44,7 +44,7 @@ _json_event_attributes = [
     # Seems useful, put it early.
     'event',
     # Short things in alphabetical order.
-    'aggr_mode', 'compat', 'deprecated', 'perpkg', 'unit',
+    'compat', 'deprecated', 'perpkg', 'unit',
     # Longer things (the last won't be iterated over during decompress).
     'long_desc'
 ]
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index b7d4a66b8ad2..cee8b83792f8 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -22,7 +22,6 @@ struct pmu_event {
 	const char *pmu;
 	const char *unit;
 	const char *perpkg;
-	const char *aggr_mode;
 	const char *deprecated;
 };
 
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index accf44b3d968..9b4c94ba5460 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -331,12 +331,6 @@ static int compare_pmu_events(const struct pmu_event *e1, const struct pmu_event
 		return -1;
 	}
 
-	if (!is_same(e1->aggr_mode, e2->aggr_mode)) {
-		pr_debug2("testing event e1 %s: mismatched aggr_mode, %s vs %s\n",
-			  e1->name, e1->aggr_mode, e2->aggr_mode);
-		return -1;
-	}
-
 	if (!is_same(e1->deprecated, e2->deprecated)) {
 		pr_debug2("testing event e1 %s: mismatched deprecated, %s vs %s\n",
 			  e1->name, e1->deprecated, e2->deprecated);
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
