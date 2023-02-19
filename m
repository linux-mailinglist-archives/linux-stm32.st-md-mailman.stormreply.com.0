Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 190AC69BF8B
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:32:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D364AC6A5FE;
	Sun, 19 Feb 2023 09:32:46 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F2E1C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:32:45 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-53688a1b4fdso17717527b3.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHfJUUC7WFoksqzMwO/wB71MjmrmmBDk4U3wZWtbf08=;
 b=fX59j52xFTzLYLu6bfL/D7xhUQY699O8G2CBhOY2b+WQeh/CNRkmVbk6izOLD09kRS
 ElhU4Qo79C2zelyYISHlIQ06bx7oywbUO5YVV+td+ogHhr5ySpZA39YLt/jD3Rgl4Hru
 NSl1oSHcdzoPDzg7iF8Lms4PQ0/pfTnWuTfK8wSI6NYne98qpyTFNmdRCtV6neg55tJh
 Ro7kutyBaTvkQVQM9r2EZf+9Ichm6O4JTDhrgZK0xRKCqHyknhKGMchi+O2i5EdVLhjY
 xtmOJEGgVHLUBujQkjjQT/JAK8oWzaiy/iTO9dpZZUZDbqFaUd9bzxnQJrq9uVzKKKb3
 CXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HHfJUUC7WFoksqzMwO/wB71MjmrmmBDk4U3wZWtbf08=;
 b=KTDc1bn9ohJntd1Kbx5Ccu6gxtHo2tvr6y3i8oHrcQVmI++wrXzD1PnR2xcgiGvFVe
 G1WS+i2uAMBSF6Oo+dHIyBcLBqu7fx9M7hPYiXSATt08PdFu0b9EPfWpiJ44dnBQKyn6
 7oAfUrnQZD5w4H70wSCbG4xqWby+vQTjTsToDZRD2gEKY2PG3auKw1apZRH/eNw1LThd
 TyGgyFYU+Y75ggXrwfOE8+qeAuApqhNFMfQ7dzPTmSo7r1yAm15+GuTPV9CQPzQ0qGnj
 vrwHLbb0MzfDGNKmgeD0IZxSqP7P4BF9fmK+NiBtl9hGXrJ5IkKqR+Rq0F7w55OzCLgU
 TRvA==
X-Gm-Message-State: AO0yUKXYxW2lGwRgbLu9YB8EA8UhKVzETXcF+UBs/YEghCGVm6Of4BNp
 X3SOTf/lW5ozPDecB6sshus/aaHVZwF4
X-Google-Smtp-Source: AK7set8jEArVFXMo6IHVLJPY3ZmOWPp1glRFXg65Ui1PEiXcYJcQSImzCALuyAA28kKpKUSiX264PfiGtWoA
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a25:8312:0:b0:889:8b19:faec with SMTP id
 s18-20020a258312000000b008898b19faecmr515910ybk.196.1676799165017; Sun, 19
 Feb 2023 01:32:45 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:24 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-28-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 27/51] perf vendor events intel: Refresh
	silvermont events
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

Update the silvermont events from 14 to 15. Generation was done using
https://github.com/intel/perfmon.

The most notable change is in corrections to event descriptions.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv              | 2 +-
 tools/perf/pmu-events/arch/x86/silvermont/frontend.json | 2 +-
 tools/perf/pmu-events/arch/x86/silvermont/pipeline.json | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 1f611a7dbdda..d1d40d0f2b2c 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -23,7 +23,7 @@ GenuineIntel-6-1[AEF],v3,nehalemep,core
 GenuineIntel-6-2E,v3,nehalemex,core
 GenuineIntel-6-2A,v18,sandybridge,core
 GenuineIntel-6-(8F|CF),v1.11,sapphirerapids,core
-GenuineIntel-6-(37|4A|4C|4D|5A),v14,silvermont,core
+GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v53,skylake,core
 GenuineIntel-6-55-[01234],v1.28,skylakex,core
 GenuineIntel-6-86,v1.20,snowridgex,core
diff --git a/tools/perf/pmu-events/arch/x86/silvermont/frontend.json b/tools/perf/pmu-events/arch/x86/silvermont/frontend.json
index c35da10f7133..cd6ed3f59e26 100644
--- a/tools/perf/pmu-events/arch/x86/silvermont/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/silvermont/frontend.json
@@ -11,7 +11,7 @@
         "BriefDescription": "Counts the number of JCC baclears",
         "EventCode": "0xE6",
         "EventName": "BACLEARS.COND",
-        "PublicDescription": "The BACLEARS event counts the number of times the front end is resteered, mainly when the Branch Prediction Unit cannot provide a correct prediction and this is corrected by the Branch Address Calculator at the front end.  The BACLEARS.COND event counts the number of JCC (Jump on Condtional Code) baclears.",
+        "PublicDescription": "The BACLEARS event counts the number of times the front end is resteered, mainly when the Branch Prediction Unit cannot provide a correct prediction and this is corrected by the Branch Address Calculator at the front end.  The BACLEARS.COND event counts the number of JCC (Jump on Conditional Code) baclears.",
         "SampleAfterValue": "200003",
         "UMask": "0x10"
     },
diff --git a/tools/perf/pmu-events/arch/x86/silvermont/pipeline.json b/tools/perf/pmu-events/arch/x86/silvermont/pipeline.json
index 59f6116a7eae..2d4214bf9e39 100644
--- a/tools/perf/pmu-events/arch/x86/silvermont/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/silvermont/pipeline.json
@@ -228,7 +228,7 @@
         "BriefDescription": "Counts the number of cycles when no uops are allocated, the IQ is empty, and no other condition is blocking allocation.",
         "EventCode": "0xCA",
         "EventName": "NO_ALLOC_CYCLES.NOT_DELIVERED",
-        "PublicDescription": "The NO_ALLOC_CYCLES.NOT_DELIVERED event is used to measure front-end inefficiencies, i.e. when front-end of the machine is not delivering micro-ops to the back-end and the back-end is not stalled. This event can be used to identify if the machine is truly front-end bound.  When this event occurs, it is an indication that the front-end of the machine is operating at less than its theoretical peak performance.  Background: We can think of the processor pipeline as being divided into 2 broader parts: Front-end and Back-end. Front-end is responsible for fetching the instruction, decoding into micro-ops (uops) in machine understandable format and putting them into a micro-op queue to be consumed by back end. The back-end then takes these micro-ops, allocates the required resources.  When all resources are ready, micro-ops are executed. If the back-end is not ready to accept micro-ops from the front-end, then we do not want to count these as front-end bottlen
 ecks.  However, whenever we have bottlenecks in the back-end, we will have allocation unit stalls and eventually forcing the front-end to wait until the back-end is ready to receive more UOPS. This event counts the cycles only when back-end is requesting more uops and front-end is not able to provide them. Some examples of conditions that cause front-end efficiencies are: Icache misses, ITLB misses, and decoder restrictions that limit the the front-end bandwidth.",
+        "PublicDescription": "The NO_ALLOC_CYCLES.NOT_DELIVERED event is used to measure front-end inefficiencies, i.e. when front-end of the machine is not delivering micro-ops to the back-end and the back-end is not stalled. This event can be used to identify if the machine is truly front-end bound.  When this event occurs, it is an indication that the front-end of the machine is operating at less than its theoretical peak performance.  Background: We can think of the processor pipeline as being divided into 2 broader parts: Front-end and Back-end. Front-end is responsible for fetching the instruction, decoding into micro-ops (uops) in machine understandable format and putting them into a micro-op queue to be consumed by back end. The back-end then takes these micro-ops, allocates the required resources.  When all resources are ready, micro-ops are executed. If the back-end is not ready to accept micro-ops from the front-end, then we do not want to count these as front-end bottlen
 ecks.  However, whenever we have bottlenecks in the back-end, we will have allocation unit stalls and eventually forcing the front-end to wait until the back-end is ready to receive more UOPS. This event counts the cycles only when back-end is requesting more uops and front-end is not able to provide them. Some examples of conditions that cause front-end efficiencies are: Icache misses, ITLB misses, and decoder restrictions that limit the front-end bandwidth.",
         "SampleAfterValue": "200003",
         "UMask": "0x50"
     },
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
