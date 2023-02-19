Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC269BFAD
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:35:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55F73C6A5FE;
	Sun, 19 Feb 2023 09:35:30 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6518C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:35:28 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-53686d8ce27so20594747b3.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ApboYwC5HDpqa4KgO9vE7lItPOtxh0INRVt9hDTELA=;
 b=eKrS9YbE5MvFZdViv4py+wujaC6AoA78JFYCdWX32lF9PoiXUgE3idq0OBKkFhvJ8L
 8iy6lGZX2pkmRRG5L9VoyF4JMYhESKqhxg1bQRw3cbXu9cp0CTVAsnfEx7iX0m8WcHmJ
 0khwL4pKRPFny0ZCfaK1RnTWEWhb3jRklhCcxexJ/lPXaF39kJkIOOWW9PvDQfhH3qw8
 i6SXakOmGvzYKxm+6U79/2sZgCBcFrdbqgmoGs3Zp43La0bVDCky0ubQmF3HRG8l/moZ
 Or4Qbi5jk1XP9gTTmxi3oHJe1J1/5t4dUvhGzSs/SXr7RmRzmHYiWa0KAaYnoxYzSygO
 fbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ApboYwC5HDpqa4KgO9vE7lItPOtxh0INRVt9hDTELA=;
 b=27hr/GStC09qMuQFGy1m6kjePnckR206QUVz/msA/oqkp07Nags9iZaz1/kwZ0Ogrp
 T+IsOVaBypsVNvyH98O9aPSpMwL3yirGpspaZ1fzZihn83O4U+tZiNGH5oEZAAnZGjV4
 FC3/NNSc+2T0rPnbwLrCtJHiOZfVbj0YpwOFXWN5fxw5QZApd/c4Mmp8+vOmv2ksavRw
 GbwZpoOtpZcgaspsuc+DpxpYJP2X5YOyUF1FfrBv8uOp3M6uWzZbk9sl4Itgsj9wnAG/
 FXNSJX50V0S8bqsawfEIt7eViQTAxT9uvtcLri7e7zSyHPuHznb+wzJbQRUCF7dlYmBe
 2QqA==
X-Gm-Message-State: AO0yUKX7DfpV2eUS/nATqMY1P88VQR9ddLH5pud+Mj0W+oaA1Yk9Bvax
 BtAy9Am1uIrY+JfaMn9why1hXXXkqQjL
X-Google-Smtp-Source: AK7set9l7EzTRgvXB15GxGWCICFKm8udU74GJTOUVF1jH0sNKtgIcL7PqS/JykUEiXuu54Ngmu99y9XTMRbT
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a81:e94c:0:b0:507:68eb:1b20 with SMTP id
 e12-20020a81e94c000000b0050768eb1b20mr311210ywm.236.1676799327857; Sun, 19
 Feb 2023 01:35:27 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:43 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-47-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 46/51] perf stat: Move enums from header
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

The enums are only used in stat-shadow.c, so narrow their scope by
moving to the C file.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/stat-shadow.c | 25 +++++++++++++++++++++++++
 tools/perf/util/stat.h        | 27 ---------------------------
 2 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index d14fa531ee27..fc948a7e83b7 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -29,6 +29,31 @@ struct runtime_stat rt_stat;
 struct stats walltime_nsecs_stats;
 struct rusage_stats ru_stats;
 
+enum {
+	CTX_BIT_USER	= 1 << 0,
+	CTX_BIT_KERNEL	= 1 << 1,
+	CTX_BIT_HV	= 1 << 2,
+	CTX_BIT_HOST	= 1 << 3,
+	CTX_BIT_IDLE	= 1 << 4,
+	CTX_BIT_MAX	= 1 << 5,
+};
+
+enum stat_type {
+	STAT_NONE = 0,
+	STAT_NSECS,
+	STAT_CYCLES,
+	STAT_STALLED_CYCLES_FRONT,
+	STAT_STALLED_CYCLES_BACK,
+	STAT_BRANCHES,
+	STAT_CACHEREFS,
+	STAT_L1_DCACHE,
+	STAT_L1_ICACHE,
+	STAT_LL_CACHE,
+	STAT_ITLB_CACHE,
+	STAT_DTLB_CACHE,
+	STAT_MAX
+};
+
 struct saved_value {
 	struct rb_node rb_node;
 	struct evsel *evsel;
diff --git a/tools/perf/util/stat.h b/tools/perf/util/stat.h
index df6068a3f7bb..215c0f5c4db7 100644
--- a/tools/perf/util/stat.h
+++ b/tools/perf/util/stat.h
@@ -55,33 +55,6 @@ enum aggr_mode {
 	AGGR_MAX
 };
 
-enum {
-	CTX_BIT_USER	= 1 << 0,
-	CTX_BIT_KERNEL	= 1 << 1,
-	CTX_BIT_HV	= 1 << 2,
-	CTX_BIT_HOST	= 1 << 3,
-	CTX_BIT_IDLE	= 1 << 4,
-	CTX_BIT_MAX	= 1 << 5,
-};
-
-#define NUM_CTX CTX_BIT_MAX
-
-enum stat_type {
-	STAT_NONE = 0,
-	STAT_NSECS,
-	STAT_CYCLES,
-	STAT_STALLED_CYCLES_FRONT,
-	STAT_STALLED_CYCLES_BACK,
-	STAT_BRANCHES,
-	STAT_CACHEREFS,
-	STAT_L1_DCACHE,
-	STAT_L1_ICACHE,
-	STAT_LL_CACHE,
-	STAT_ITLB_CACHE,
-	STAT_DTLB_CACHE,
-	STAT_MAX
-};
-
 struct runtime_stat {
 	struct rblist value_list;
 };
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
