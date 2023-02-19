Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151B69BF6D
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:29:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0A1C65E58;
	Sun, 19 Feb 2023 09:29:54 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 872CDC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:29:53 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-5369a855e71so2656097b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ty9nxmBgJsUnSpKV2MHBIMxHaMhrZHfa8zZXWCP8Cbg=;
 b=fXPFn6oSwVykULAqbxpfhUL0GIEFqD2VYVuHvyjznRwBP0ndR6qs7rXslQtWXWUNDh
 /2XPYoU8PtIy6GaUZ111tSYonx7D26wZEZSKzGtpsztGeEjNKD6TZA1M4wYrnGZz9BuG
 GVN+QKkPziKsRuGsy1hU2SmnPxPPt+UDETmNsrK3VXcueClddLswkxO1Akd46lSS2YW6
 uaJoN9BzoCcsr3DJPtkDs+01a1IBH3ojOB4udgVPPUg7gGlIxu2bwhMSr/KvdeFjGumO
 BX/oZoE1NUz/N56t7evkLcNhnUn+6CYqcKAZlVrXPxXwzfkxuyJFXxTp6kiBL5aj5LHv
 Y3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ty9nxmBgJsUnSpKV2MHBIMxHaMhrZHfa8zZXWCP8Cbg=;
 b=dHJ1Q9HDLCKr9vsKrkU/8JJOWLOhSbj4EGeDmfxCuXxz0GZ8a1o0312YkTi2MvbJ7S
 7p4+NzmgC2a5bD0kgZkHJHNHpmMLkH1abWgyL72ksuSXn/wMa/i4yR/KbAcIc92mwfdM
 n1ODwR+DcTj0MWN6WfCN0nwILcDF6WMUIslqzi0e+nSUwQRgMbSz4K0DVqEOaxcomIib
 W5W09bHj8azS5P4pZHyRhGEs0zlSpO/AIwfTLEPxPEnuG8sqhO6029mXg32E/cs5sh3w
 JRYzmWzQl4XPw52d93MZEYgcs2tY7LyDlzZU53IcijD19wHQ4Y7JeNXHhNtCCVrStBxm
 y6uw==
X-Gm-Message-State: AO0yUKWHjUE8xpCDFNI9aiRyJEd5KXfEYygnFGUU9B2Ns3SSZn4y9C8J
 CX/h20HrkcHVSVnqR0QNR1RfsZC3HXBs
X-Google-Smtp-Source: AK7set8/9xn2NisKgllh+YoZULn5eZpfNzaNw83XW4wPsTC6NQrB1+wc0RUp1LPVAPXQL8Pa5tslQGVII/VV
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:690c:f01:b0:52e:ac97:115f with SMTP id
 dc1-20020a05690c0f0100b0052eac97115fmr228775ywb.5.1676798992575; Sun, 19 Feb
 2023 01:29:52 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:03 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-7-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 06/51] perf pmu-events: Change perpkg to be
	a bool
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
implicitly meant false. The only value of 'PerPkg' in the event json
is '1'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py   |  2 +-
 tools/perf/pmu-events/pmu-events.h |  2 +-
 tools/perf/tests/pmu-events.c      |  4 ++--
 tools/perf/util/pmu.c              | 11 ++++-------
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 35ca34eca74a..2da55408398f 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -678,7 +678,7 @@ static void decompress_event(int offset, struct pmu_event *pe)
 {
 \tconst char *p = &big_c_string[offset];
 """)
-  enum_attributes = ['aggr_mode', 'deprecated']
+  enum_attributes = ['aggr_mode', 'deprecated', 'perpkg']
   for attr in _json_event_attributes:
     _args.output_file.write(f'\n\tpe->{attr} = ')
     if attr in enum_attributes:
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index 2434bc7cf92d..4d236bb32fd3 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -23,7 +23,7 @@ struct pmu_event {
 	const char *long_desc;
 	const char *pmu;
 	const char *unit;
-	const char *perpkg;
+	bool perpkg;
 	bool deprecated;
 };
 
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index 937804c84e29..521557c396bc 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -325,8 +325,8 @@ static int compare_pmu_events(const struct pmu_event *e1, const struct pmu_event
 		return -1;
 	}
 
-	if (!is_same(e1->perpkg, e2->perpkg)) {
-		pr_debug2("testing event e1 %s: mismatched perpkg, %s vs %s\n",
+	if (e1->perpkg != e2->perpkg) {
+		pr_debug2("testing event e1 %s: mismatched perpkg, %d vs %d\n",
 			  e1->name, e1->perpkg, e2->perpkg);
 		return -1;
 	}
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 80644e25a568..43b6182d96b7 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -328,17 +328,15 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 	struct parse_events_term *term;
 	struct perf_pmu_alias *alias;
 	int ret;
-	int num;
 	char newval[256];
-	char *long_desc = NULL, *topic = NULL, *unit = NULL, *perpkg = NULL,
-	     *pmu_name = NULL;
-	bool deprecated = false;
+	char *long_desc = NULL, *topic = NULL, *unit = NULL, *pmu_name = NULL;
+	bool deprecated = false, perpkg = false;
 
 	if (pe) {
 		long_desc = (char *)pe->long_desc;
 		topic = (char *)pe->topic;
 		unit = (char *)pe->unit;
-		perpkg = (char *)pe->perpkg;
+		perpkg = pe->perpkg;
 		deprecated = pe->deprecated;
 		pmu_name = (char *)pe->pmu;
 	}
@@ -350,7 +348,7 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 	INIT_LIST_HEAD(&alias->terms);
 	alias->scale = 1.0;
 	alias->unit[0] = '\0';
-	alias->per_pkg = false;
+	alias->per_pkg = perpkg;
 	alias->snapshot = false;
 	alias->deprecated = deprecated;
 
@@ -402,7 +400,6 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 			return -1;
 		snprintf(alias->unit, sizeof(alias->unit), "%s", unit);
 	}
-	alias->per_pkg = perpkg && sscanf(perpkg, "%d", &num) == 1 && num == 1;
 	alias->str = strdup(newval);
 	alias->pmu_name = pmu_name ? strdup(pmu_name) : NULL;
 
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
