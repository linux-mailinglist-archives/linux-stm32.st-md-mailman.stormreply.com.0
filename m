Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE269BF6C
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:29:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF7BC65E58;
	Sun, 19 Feb 2023 09:29:45 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04505C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:29:44 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-53691b4e635so7116657b3.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HpSaNFvC8VmLiMMzNqVi6YMEMj22ak1daXzeVt5eMAk=;
 b=HcBv1rkbvDldKyrDrO0aggLoq3rOU9HtvU+pzmjwa8Ux0B1KVOh4j8kILHgYFzodGs
 q7FHA8VF7wHWGnSmn6YVglkgBiheCph85mVXO2727cgB4U/R416NU+pIV9PVC1yP1IKT
 nsJ+wXh647jNXsjYXnz/rmI6T3y4ixe98L+h/LwtJ6uZDKOkqF145rV3liTbQfcNuvXw
 +wvjCDO3XWGrwUhOU6wNzR+0DSatllL4NCLdst2qS9VItUg1x4bigbuFwqNwRCqqlJaH
 SA2vUGQpGnDR+Dm03t5wFIxSQN7+d3nR0wTN/jsAXGHCxURshr7AqnpGX5wjEOu5SCEw
 Pa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HpSaNFvC8VmLiMMzNqVi6YMEMj22ak1daXzeVt5eMAk=;
 b=iOk9SkuwhX0bwMfw9MEkIISK9H+4qYn0J1i/nCIQp4AocAY2TFNkkcfN/lC17ZVuIw
 CytbcfY9r3/HMrZCQSfot3TZ+MDGCi7KN9zotzXC/KzPZWdzoN8BSaqbSLx1hAt2en8Z
 ookL/rAL1yqQdqZco8HZNoY26jfMXEKAbcEoeJFcybmltOZUbaagCFFUF2WJdkmqLyTu
 zxWSmrB2vUsyl7rJ3GyjZw/w81xajqRAW3xT5ES3b2lGELjxUUhOCjPXElqEyiiWE9SH
 JBj5GdGH2g4QKeNgKCnpTOrYXJGHM6VOqkpfUx0eUb8shFFhV98QgF79Kbg4q/TujLwX
 6+qQ==
X-Gm-Message-State: AO0yUKUNExGlwGNXN/To+T9r69OjAz+TtdIvV9THa/pRO5neYdRyy/4D
 +I04F0VrAabw9d0/tPeT/iXS9HtqVL8Y
X-Google-Smtp-Source: AK7set+/IPJPR2TJCsCRPOBld36mgcNb8QWHQJkTJaS1X/3VSb0/0V2mUrZzloFp8neALyJ35/txBaNTQ9s3
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:10c6:b0:97a:ebd:a594 with SMTP id
 w6-20020a05690210c600b0097a0ebda594mr389689ybu.3.1676798982991; Sun, 19 Feb
 2023 01:29:42 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:02 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-6-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 05/51] perf pmu-events: Change deprecated
	to be a bool
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

Switch to a more natural bool rather than string encoding, where NULL
implicitly meant false.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py   |  2 +-
 tools/perf/pmu-events/pmu-events.h |  4 +++-
 tools/perf/tests/pmu-events.c      |  4 ++--
 tools/perf/util/pmu.c              | 10 ++++------
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 2b08d7c18f4b..35ca34eca74a 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -678,7 +678,7 @@ static void decompress_event(int offset, struct pmu_event *pe)
 {
 \tconst char *p = &big_c_string[offset];
 """)
-  enum_attributes = ['aggr_mode']
+  enum_attributes = ['aggr_mode', 'deprecated']
   for attr in _json_event_attributes:
     _args.output_file.write(f'\n\tpe->{attr} = ')
     if attr in enum_attributes:
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index 7225efc4e4df..2434bc7cf92d 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -2,6 +2,8 @@
 #ifndef PMU_EVENTS_H
 #define PMU_EVENTS_H
 
+#include <stdbool.h>
+
 struct perf_pmu;
 
 enum aggr_mode_class {
@@ -22,7 +24,7 @@ struct pmu_event {
 	const char *pmu;
 	const char *unit;
 	const char *perpkg;
-	const char *deprecated;
+	bool deprecated;
 };
 
 struct pmu_metric {
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index 9b4c94ba5460..937804c84e29 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -331,8 +331,8 @@ static int compare_pmu_events(const struct pmu_event *e1, const struct pmu_event
 		return -1;
 	}
 
-	if (!is_same(e1->deprecated, e2->deprecated)) {
-		pr_debug2("testing event e1 %s: mismatched deprecated, %s vs %s\n",
+	if (e1->deprecated != e2->deprecated) {
+		pr_debug2("testing event e1 %s: mismatched deprecated, %d vs %d\n",
 			  e1->name, e1->deprecated, e2->deprecated);
 		return -1;
 	}
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index c256b29defad..80644e25a568 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -331,14 +331,15 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 	int num;
 	char newval[256];
 	char *long_desc = NULL, *topic = NULL, *unit = NULL, *perpkg = NULL,
-	     *deprecated = NULL, *pmu_name = NULL;
+	     *pmu_name = NULL;
+	bool deprecated = false;
 
 	if (pe) {
 		long_desc = (char *)pe->long_desc;
 		topic = (char *)pe->topic;
 		unit = (char *)pe->unit;
 		perpkg = (char *)pe->perpkg;
-		deprecated = (char *)pe->deprecated;
+		deprecated = pe->deprecated;
 		pmu_name = (char *)pe->pmu;
 	}
 
@@ -351,7 +352,7 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 	alias->unit[0] = '\0';
 	alias->per_pkg = false;
 	alias->snapshot = false;
-	alias->deprecated = false;
+	alias->deprecated = deprecated;
 
 	ret = parse_events_terms(&alias->terms, val);
 	if (ret) {
@@ -405,9 +406,6 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 	alias->str = strdup(newval);
 	alias->pmu_name = pmu_name ? strdup(pmu_name) : NULL;
 
-	if (deprecated)
-		alias->deprecated = true;
-
 	if (!perf_pmu_merge_alias(alias, list))
 		list_add_tail(&alias->list, list);
 
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
