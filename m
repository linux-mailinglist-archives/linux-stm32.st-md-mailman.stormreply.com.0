Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D270969BF85
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:32:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E4F1C6A5FE;
	Sun, 19 Feb 2023 09:32:19 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D432C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:32:18 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-53688a1b4fdso17710887b3.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RhC8RlQQDEUumThBVP3BFgOcI9ow4i6TnnBtpNZj6g8=;
 b=NLiqNqqN2UXiBVa/kIcJY7ovAkmY5RZlMuWs3LqQooTQ7jmKpeovntgrAcJjCTFJQF
 8ZxOPeAEWluzKYrDb8Lmmn1QQQFGp4RYZibqZ+XdgcNY0Gulj9egKCnUDB+FDBCU+/wz
 IfFux3pX1h7GnQDz0Fo2rtQF2oZZZP8uHh5lBaCMiDjZC6mNUHh65NbvekbRAUq0cqfY
 qcEN8ZtWjf03eBBDuJ+kAv/mw1xZ3+ayXqspuvzFRRTGhyDeiQl2vPediInZj2DuK6qc
 P0O7xGQZjAtedCZCSp7qfhJmF0TwRjs/EkdhrrQbDwOekwD/j8XAOujIiT4dybqYIaFX
 GuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RhC8RlQQDEUumThBVP3BFgOcI9ow4i6TnnBtpNZj6g8=;
 b=BCNy8KuHemYTldkLL7a09oLuIROfK9JrTsKSxSBQZngYVuEOaSm2f3e3Qx5AQZcgVA
 ZXgyJvpG3/gT38zA++fXbQUEXmtSeEJqYbm5Twl6EV0AVa7+ON0a4gzR9ZFnbIZISmXn
 caQh+8R0B6h5UJEaRiGqrqnYoB/+Lwikjc0Ew0NbjTFuN9fj7RL5JP/m2Qv9BXM2ZQ5K
 6Bftblls3gCnVuDEGxq2JHEfggl37bYq+ktfwo2tbZGX/1DEKFoOdrqBUw064QcEOQE6
 GvpBaPLuyU5mlm06qVnyk8DNaDDS+JQk1ViOcAheyr1XS5NNvAWCaXbomy4HjFXoGrgt
 MM2g==
X-Gm-Message-State: AO0yUKVWEOJcoHSC2JLVP3CiogZ3IJQ8TU4r7NJs3Vx+ZsP5F0eLUbzM
 GX66fNPbeyjQUgf3alX3kucEoXN+z2Ws
X-Google-Smtp-Source: AK7set+wG2j6JROLi4IipOflMnlcql2zJZMYYJJ6qZ1zTfA+xN3lYElfRlCZYSX3KiyaCchExfXBiFDcIifu
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:291:b0:9a0:1d7b:707b with SMTP id
 v17-20020a056902029100b009a01d7b707bmr49063ybh.4.1676799137260; Sun, 19 Feb
 2023 01:32:17 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:21 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-25-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 24/51] perf vendor events intel: Refresh
	knightslanding events
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

Update the knightslanding events from 9 to 10. Generation was done
using https://github.com/intel/perfmon.

The most notable change is in corrections to event descriptions.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/knightslanding/cache.json        | 94 +++++++++----------
 .../arch/x86/knightslanding/pipeline.json     |  8 +-
 .../arch/x86/knightslanding/uncore-other.json |  8 +-
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 4 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/knightslanding/cache.json b/tools/perf/pmu-events/arch/x86/knightslanding/cache.json
index 01aea3d2832e..d9876cb06b08 100644
--- a/tools/perf/pmu-events/arch/x86/knightslanding/cache.json
+++ b/tools/perf/pmu-events/arch/x86/knightslanding/cache.json
@@ -6,7 +6,7 @@
         "SampleAfterValue": "200003"
     },
     {
-        "BriefDescription": "Counts the number of core cycles the fetch stalls because of an icache miss. This is a cummulative count of core cycles the fetch stalled for all icache misses.",
+        "BriefDescription": "Counts the number of core cycles the fetch stalls because of an icache miss. This is a cumulative count of core cycles the fetch stalled for all icache misses.",
         "EventCode": "0x86",
         "EventName": "FETCH_STALL.ICACHE_FILL_PENDING_CYCLES",
         "PublicDescription": "This event counts the number of core cycles the fetch stalls because of an icache miss. This is a cumulative count of cycles the NIP stalled for all icache misses.",
@@ -28,7 +28,7 @@
         "UMask": "0x4f"
     },
     {
-        "BriefDescription": "Counts the number of MEC requests from the L2Q that reference a cache line (cacheable requests) exlcuding SW prefetches filling only to L2 cache and L1 evictions (automatically exlcudes L2HWP, UC, WC) that were rejected - Multiple repeated rejects should be counted multiple times",
+        "BriefDescription": "Counts the number of MEC requests from the L2Q that reference a cache line (cacheable requests) excluding SW prefetches filling only to L2 cache and L1 evictions (automatically exlcudes L2HWP, UC, WC) that were rejected - Multiple repeated rejects should be counted multiple times",
         "EventCode": "0x30",
         "EventName": "L2_REQUESTS_REJECT.ALL",
         "SampleAfterValue": "200003"
@@ -108,7 +108,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand code reads and prefetch code read requests  that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Demand code reads and prefetch code read requests  that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_CODE_RD.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -135,7 +135,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand code reads and prefetch code read requests  that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Demand code reads and prefetch code read requests  that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_CODE_RD.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -198,7 +198,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand code reads and prefetch code read requests  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts Demand code reads and prefetch code read requests  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_CODE_RD.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -216,7 +216,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data and L1 prefetch data read requests  that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Demand cacheable data and L1 prefetch data read requests  that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_DATA_RD.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -243,7 +243,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data and L1 prefetch data read requests  that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Demand cacheable data and L1 prefetch data read requests  that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_DATA_RD.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -306,7 +306,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data and L1 prefetch data read requests  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts Demand cacheable data and L1 prefetch data read requests  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_DATA_RD.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -324,7 +324,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any Prefetch requests that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts any Prefetch requests that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_PF_L2.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -351,7 +351,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any Prefetch requests that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts any Prefetch requests that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_PF_L2.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -405,7 +405,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any Prefetch requests that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts any Prefetch requests that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_PF_L2.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -423,7 +423,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any Read request  that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts any Read request  that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_READ.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -450,7 +450,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any Read request  that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts any Read request  that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_READ.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -513,7 +513,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any Read request  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts any Read request  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_READ.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -531,7 +531,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any request that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts any request that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_REQUEST.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -558,7 +558,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any request that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts any request that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_REQUEST.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -621,7 +621,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts any request that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts any request that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_REQUEST.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -639,7 +639,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data write requests  that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Demand cacheable data write requests  that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_RFO.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -666,7 +666,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data write requests  that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Demand cacheable data write requests  that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_RFO.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -729,7 +729,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data write requests  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts Demand cacheable data write requests  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.ANY_RFO.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -747,7 +747,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Bus locks and split lock requests that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Bus locks and split lock requests that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.BUS_LOCKS.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -774,7 +774,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Bus locks and split lock requests that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Bus locks and split lock requests that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.BUS_LOCKS.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -837,7 +837,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Bus locks and split lock requests that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts Bus locks and split lock requests that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.BUS_LOCKS.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -855,7 +855,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts demand code reads and prefetch code reads that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts demand code reads and prefetch code reads that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.DEMAND_CODE_RD.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -882,7 +882,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts demand code reads and prefetch code reads that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts demand code reads and prefetch code reads that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.DEMAND_CODE_RD.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -945,7 +945,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts demand code reads and prefetch code reads that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts demand code reads and prefetch code reads that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.DEMAND_CODE_RD.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -1035,7 +1035,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts demand cacheable data and L1 prefetch data reads that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts demand cacheable data and L1 prefetch data reads that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.DEMAND_DATA_RD.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -1053,7 +1053,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data writes that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Demand cacheable data writes that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.DEMAND_RFO.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1080,7 +1080,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data writes that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Demand cacheable data writes that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.DEMAND_RFO.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1143,7 +1143,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Demand cacheable data writes that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts Demand cacheable data writes that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.DEMAND_RFO.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -1170,7 +1170,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Partial reads (UC or WC and is valid only for Outstanding response type).  that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Partial reads (UC or WC and is valid only for Outstanding response type).  that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PARTIAL_READS.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1197,7 +1197,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Partial reads (UC or WC and is valid only for Outstanding response type).  that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Partial reads (UC or WC and is valid only for Outstanding response type).  that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PARTIAL_READS.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1260,7 +1260,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Partial reads (UC or WC and is valid only for Outstanding response type).  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts Partial reads (UC or WC and is valid only for Outstanding response type).  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PARTIAL_READS.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -1287,7 +1287,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Partial writes (UC or WT or WP and should be programmed on PMC1) that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Partial writes (UC or WT or WP and should be programmed on PMC1) that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PARTIAL_WRITES.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a7",
@@ -1314,7 +1314,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Partial writes (UC or WT or WP and should be programmed on PMC1) that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Partial writes (UC or WT or WP and should be programmed on PMC1) that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PARTIAL_WRITES.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a7",
@@ -1386,7 +1386,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts L1 data HW prefetches that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts L1 data HW prefetches that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_L1_DATA_RD.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1413,7 +1413,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts L1 data HW prefetches that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts L1 data HW prefetches that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_L1_DATA_RD.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1476,7 +1476,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts L1 data HW prefetches that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts L1 data HW prefetches that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_L1_DATA_RD.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -1494,7 +1494,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts L2 code HW prefetches that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts L2 code HW prefetches that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_L2_CODE_RD.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1521,7 +1521,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts L2 code HW prefetches that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts L2 code HW prefetches that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_L2_CODE_RD.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1566,7 +1566,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts L2 code HW prefetches that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts L2 code HW prefetches that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_L2_CODE_RD.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -1602,7 +1602,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts L2 data RFO prefetches (includes PREFETCHW instruction) that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts L2 data RFO prefetches (includes PREFETCHW instruction) that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_L2_RFO.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1683,7 +1683,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Software Prefetches that accounts for reponses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
+        "BriefDescription": "Counts Software Prefetches that accounts for responses from snoop request hit with data forwarded from it Far(not in the same quadrant as the request)-other tile L2 in E/F/M state. Valid only in SNC4 Cluster mode.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_SOFTWARE.L2_HIT_FAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1710,7 +1710,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Software Prefetches that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts Software Prefetches that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_SOFTWARE.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1773,7 +1773,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts Software Prefetches that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts Software Prefetches that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.PF_SOFTWARE.OUTSTANDING",
         "MSRIndex": "0x1a6",
@@ -1818,7 +1818,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts UC code reads (valid only for Outstanding response type)  that accounts for reponses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
+        "BriefDescription": "Counts UC code reads (valid only for Outstanding response type)  that accounts for responses from snoop request hit with data forwarded from its Near-other tile L2 in E/F/M state",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.UC_CODE_READS.L2_HIT_NEAR_TILE",
         "MSRIndex": "0x1a6,0x1a7",
@@ -1881,7 +1881,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts UC code reads (valid only for Outstanding response type)  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The oustanding response should be programmed only on PMC0.",
+        "BriefDescription": "Counts UC code reads (valid only for Outstanding response type)  that are outstanding, per weighted cycle, from the time of the request to when any response is received. The outstanding response should be programmed only on PMC0.",
         "EventCode": "0xB7",
         "EventName": "OFFCORE_RESPONSE.UC_CODE_READS.OUTSTANDING",
         "MSRIndex": "0x1a6",
diff --git a/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json b/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json
index 1b803fa38641..3dc532107ead 100644
--- a/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json
@@ -254,14 +254,14 @@
         "UMask": "0x80"
     },
     {
-        "BriefDescription": "Counts the number of occurences a retired load gets blocked because its address overlaps with a store whose data is not ready",
+        "BriefDescription": "Counts the number of occurrences a retired load gets blocked because its address overlaps with a store whose data is not ready",
         "EventCode": "0x03",
         "EventName": "RECYCLEQ.LD_BLOCK_STD_NOTREADY",
         "SampleAfterValue": "200003",
         "UMask": "0x2"
     },
     {
-        "BriefDescription": "Counts the number of occurences a retired load gets blocked because its address partially overlaps with a store",
+        "BriefDescription": "Counts the number of occurrences a retired load gets blocked because its address partially overlaps with a store",
         "Data_LA": "1",
         "EventCode": "0x03",
         "EventName": "RECYCLEQ.LD_BLOCK_ST_FORWARD",
@@ -270,7 +270,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Counts the number of occurences a retired load that is a cache line split. Each split should be counted only once.",
+        "BriefDescription": "Counts the number of occurrences a retired load that is a cache line split. Each split should be counted only once.",
         "Data_LA": "1",
         "EventCode": "0x03",
         "EventName": "RECYCLEQ.LD_SPLITS",
@@ -293,7 +293,7 @@
         "UMask": "0x20"
     },
     {
-        "BriefDescription": "Counts the number of occurences a retired store that is a cache line split. Each split should be counted only once.",
+        "BriefDescription": "Counts the number of occurrences a retired store that is a cache line split. Each split should be counted only once.",
         "EventCode": "0x03",
         "EventName": "RECYCLEQ.ST_SPLITS",
         "PublicDescription": "This event counts the number of retired store that experienced a cache line boundary split(Precise Event). Note that each spilt should be counted only once.",
diff --git a/tools/perf/pmu-events/arch/x86/knightslanding/uncore-other.json b/tools/perf/pmu-events/arch/x86/knightslanding/uncore-other.json
index 3abd9c3fdc48..491cb37ddab0 100644
--- a/tools/perf/pmu-events/arch/x86/knightslanding/uncore-other.json
+++ b/tools/perf/pmu-events/arch/x86/knightslanding/uncore-other.json
@@ -1084,7 +1084,7 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "Cache Lookups. Counts the number of times the LLC was accessed. Writeback transactions from L2 to the LLC  This includes all write transactions -- both Cachable and UC.",
+        "BriefDescription": "Cache Lookups. Counts the number of times the LLC was accessed. Writeback transactions from L2 to the LLC  This includes all write transactions -- both Cacheable and UC.",
         "EventCode": "0x37",
         "EventName": "UNC_H_CACHE_LINES_VICTIMIZED.E_STATE",
         "PerPkg": "1",
@@ -1843,7 +1843,7 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "Counts cycles source throttling is adderted - horizontal",
+        "BriefDescription": "Counts cycles source throttling is asserted - horizontal",
         "EventCode": "0xA5",
         "EventName": "UNC_H_FAST_ASSERTED.HORZ",
         "PerPkg": "1",
@@ -1851,7 +1851,7 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "Counts cycles source throttling is adderted - vertical",
+        "BriefDescription": "Counts cycles source throttling is asserted - vertical",
         "EventCode": "0xA5",
         "EventName": "UNC_H_FAST_ASSERTED.VERT",
         "PerPkg": "1",
@@ -2929,7 +2929,7 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "Cache Lookups. Counts the number of times the LLC was accessed. Writeback transactions from L2 to the LLC  This includes all write transactions -- both Cachable and UC.",
+        "BriefDescription": "Cache Lookups. Counts the number of times the LLC was accessed. Writeback transactions from L2 to the LLC  This includes all write transactions -- both Cacheable and UC.",
         "EventCode": "0x34",
         "EventName": "UNC_H_SF_LOOKUP.WRITE",
         "PerPkg": "1",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index afe811f154d7..41bd13baa265 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -17,7 +17,7 @@ GenuineIntel-6-6[AC],v1.18,icelakex,core
 GenuineIntel-6-3A,v23,ivybridge,core
 GenuineIntel-6-3E,v22,ivytown,core
 GenuineIntel-6-2D,v22,jaketown,core
-GenuineIntel-6-(57|85),v9,knightslanding,core
+GenuineIntel-6-(57|85),v10,knightslanding,core
 GenuineIntel-6-A[AC],v1.00,meteorlake,core
 GenuineIntel-6-1[AEF],v3,nehalemep,core
 GenuineIntel-6-2E,v3,nehalemex,core
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
