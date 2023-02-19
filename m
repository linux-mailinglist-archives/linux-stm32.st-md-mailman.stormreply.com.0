Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360069BF7B
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:31:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE284C6A5FE;
	Sun, 19 Feb 2023 09:31:16 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FFD2C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:31:15 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-536a1303469so386287b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AiAycDrybveoMuJFEB+r5dLTNOyKRMMZ7bT1bkVL/x4=;
 b=mAGNMChIxmCLNL67y+hstMcY9oXuPTwb2KsmXQc1lkpPbxb+zHBfH+Visl9kjNSuSh
 wX1Z7ZX062igns/0RVUrhLbGGAog8e6kKBKbUTxV/xW3AfTK0T93XWMO/RfNP6DqI2oe
 vyrPpPeGUg5U3OkeT/X5v4XKwr08PlzWm6SUW/2xKwkgFutbxQ/hpiKmh5PUfMniw6yC
 L2pItgOROrWWhX3BVpGABcNH6gBD6qpnu19VQGXlhj4V1/O6TFK5/bco3NXfaIAO87q2
 V7LOi/WUATuoO9aAwd0Q0QdbEpOmnQYO9Vt31PcprgN2Z2X5Spx9WVMCgXzZ3O+dZpYO
 BSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AiAycDrybveoMuJFEB+r5dLTNOyKRMMZ7bT1bkVL/x4=;
 b=4cE1VRD5xdgRFmWDuRIbt51RD8OD4NGQoWFjC868QBFrgEBlEHfPACnTEdS2zBuaSq
 MyycMqZ8tLbsPhqVYTaD+/YFqUg3N39WA5msvG9zZ+4v9QgBKcR529LXacW7kwzEVbJr
 XDiOcfkMXJYikVZxXxkZCJjmKIytzCaaxKH9iPINxc8OSycLltPsCX4JukAZNdme8XUR
 /MsbLYmzXBKx4iMP6dPfSnmwZWKosz/Bi5malvtWNZgaRHl9xz4iFrcJyZz58jHwzzAd
 58bSJu7tXP1jlM33zcxAGLjbAdQzCXkJRBn0pFjWgRXVfRgDZ7CfGHdLM8fnM3ty3MuB
 54iQ==
X-Gm-Message-State: AO0yUKXuUyinYIhHGrhkE+UJiPSSN63ySgbBGCTwhdMBrngLytztQpXo
 vPtidhJjRsN4UoanstJRcs+Gfn4QVdEt
X-Google-Smtp-Source: AK7set9IgB0DC1xtM8FHHexh2+omWFeYd4xPfiQJDL4uQcLTHNS60bCNetPqI8ejH4DScPcC9wHXMLC4bqUk
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:351:b0:8ac:72e3:c743 with SMTP id
 e17-20020a056902035100b008ac72e3c743mr14973ybs.9.1676799074539; Sun, 19 Feb
 2023 01:31:14 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:13 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-17-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 16/51] perf vendor events intel: Add
	graniterapids events
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

Add version 1.00 of the graniterapids events from
https://github.com/intel/perfmon.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/graniterapids/cache.json         |  54 ++++++
 .../arch/x86/graniterapids/frontend.json      |  10 +
 .../arch/x86/graniterapids/memory.json        | 174 ++++++++++++++++++
 .../arch/x86/graniterapids/other.json         |  29 +++
 .../arch/x86/graniterapids/pipeline.json      | 102 ++++++++++
 .../x86/graniterapids/virtual-memory.json     |  26 +++
 tools/perf/pmu-events/arch/x86/mapfile.csv    |   1 +
 7 files changed, 396 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/x86/graniterapids/cache.json
 create mode 100644 tools/perf/pmu-events/arch/x86/graniterapids/frontend.json
 create mode 100644 tools/perf/pmu-events/arch/x86/graniterapids/memory.json
 create mode 100644 tools/perf/pmu-events/arch/x86/graniterapids/other.json
 create mode 100644 tools/perf/pmu-events/arch/x86/graniterapids/pipeline.json
 create mode 100644 tools/perf/pmu-events/arch/x86/graniterapids/virtual-memory.json

diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/cache.json b/tools/perf/pmu-events/arch/x86/graniterapids/cache.json
new file mode 100644
index 000000000000..56212827870c
--- /dev/null
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/cache.json
@@ -0,0 +1,54 @@
+[
+    {
+        "BriefDescription": "L2 code requests",
+        "EventCode": "0x24",
+        "EventName": "L2_RQSTS.ALL_CODE_RD",
+        "PublicDescription": "Counts the total number of L2 code requests.",
+        "SampleAfterValue": "200003",
+        "UMask": "0xe4"
+    },
+    {
+        "BriefDescription": "Demand Data Read access L2 cache",
+        "EventCode": "0x24",
+        "EventName": "L2_RQSTS.ALL_DEMAND_DATA_RD",
+        "PublicDescription": "Counts Demand Data Read requests accessing the L2 cache. These requests may hit or miss L2 cache. True-miss exclude misses that were merged with ongoing L2 misses. An access is counted once.",
+        "SampleAfterValue": "200003",
+        "UMask": "0xe1"
+    },
+    {
+        "BriefDescription": "Core-originated cacheable requests that missed L3  (Except hardware prefetches to the L3)",
+        "EventCode": "0x2e",
+        "EventName": "LONGEST_LAT_CACHE.MISS",
+        "PublicDescription": "Counts core-originated cacheable requests that miss the L3 cache (Longest Latency cache). Requests include data and code reads, Reads-for-Ownership (RFOs), speculative accesses and hardware prefetches to the L1 and L2.  It does not include hardware prefetches to the L3, and may not count other types of requests to the L3.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x41"
+    },
+    {
+        "BriefDescription": "Core-originated cacheable requests that refer to L3 (Except hardware prefetches to the L3)",
+        "EventCode": "0x2e",
+        "EventName": "LONGEST_LAT_CACHE.REFERENCE",
+        "PublicDescription": "Counts core-originated cacheable requests to the L3 cache (Longest Latency cache). Requests include data and code reads, Reads-for-Ownership (RFOs), speculative accesses and hardware prefetches to the L1 and L2.  It does not include hardware prefetches to the L3, and may not count other types of requests to the L3.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x4f"
+    },
+    {
+        "BriefDescription": "Retired load instructions.",
+        "Data_LA": "1",
+        "EventCode": "0xd0",
+        "EventName": "MEM_INST_RETIRED.ALL_LOADS",
+        "PEBS": "1",
+        "PublicDescription": "Counts all retired load instructions. This event accounts for SW prefetch instructions of PREFETCHNTA or PREFETCHT0/1/2 or PREFETCHW.",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x81"
+    },
+    {
+        "BriefDescription": "Retired store instructions.",
+        "Data_LA": "1",
+        "EventCode": "0xd0",
+        "EventName": "MEM_INST_RETIRED.ALL_STORES",
+        "PEBS": "1",
+        "PublicDescription": "Counts all retired store instructions.",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x82"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/frontend.json b/tools/perf/pmu-events/arch/x86/graniterapids/frontend.json
new file mode 100644
index 000000000000..dfd9c5ea1584
--- /dev/null
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/frontend.json
@@ -0,0 +1,10 @@
+[
+    {
+        "BriefDescription": "This event counts a subset of the Topdown Slots event that were no operation was delivered to the back-end pipeline due to instruction fetch limitations when the back-end could have accepted more operations. Common examples include instruction cache misses or x86 instruction decode limitations.",
+        "EventCode": "0x9c",
+        "EventName": "IDQ_BUBBLES.CORE",
+        "PublicDescription": "This event counts a subset of the Topdown Slots event that were no operation was delivered to the back-end pipeline due to instruction fetch limitations when the back-end could have accepted more operations. Common examples include instruction cache misses or x86 instruction decode limitations.\nThe count may be distributed among unhalted logical processors (hyper-threads) who share the same physical core, in processors that support Intel Hyper-Threading Technology. Software can use this event as the nominator for the Frontend Bound metric (or top-level category) of the Top-down Microarchitecture Analysis method.",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x1"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/memory.json b/tools/perf/pmu-events/arch/x86/graniterapids/memory.json
new file mode 100644
index 000000000000..1c0e0e86e58e
--- /dev/null
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/memory.json
@@ -0,0 +1,174 @@
+[
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 128 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_128",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x80",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 128 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "1009",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 16 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_16",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x10",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 16 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "20011",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 256 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_256",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x100",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 256 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "503",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 32 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_32",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x20",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 32 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "100007",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 4 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_4",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x4",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 4 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 512 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_512",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x200",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 512 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "101",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 64 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_64",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x40",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 64 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "2003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 8 cycles.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_8",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x8",
+        "PEBS": "2",
+        "PublicDescription": "Counts randomly selected loads when the latency from first dispatch to completion is greater than 8 cycles.  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "50021",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Retired memory store access operations. A PDist event for PEBS Store Latency Facility.",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.STORE_SAMPLE",
+        "PEBS": "2",
+        "PublicDescription": "Counts Retired memory accesses with at least 1 store operation. This PEBS event is the precisely-distributed (PDist) trigger covering all stores uops for sampling by the PEBS Store Latency Facility. The facility is described in Intel SDM Volume 3 section 19.9.8",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2"
+    },
+    {
+        "BriefDescription": "Counts demand data reads that were not supplied by the local socket's L1, L2, or L3 caches.",
+        "EventCode": "0x2A,0x2B",
+        "EventName": "OCR.DEMAND_DATA_RD.L3_MISS",
+        "MSRIndex": "0x1a6,0x1a7",
+        "MSRValue": "0x3FBFC00001",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts demand reads for ownership (RFO) requests and software prefetches for exclusive ownership (PREFETCHW) that were not supplied by the local socket's L1, L2, or L3 caches.",
+        "EventCode": "0x2A,0x2B",
+        "EventName": "OCR.DEMAND_RFO.L3_MISS",
+        "MSRIndex": "0x1a6,0x1a7",
+        "MSRValue": "0x3F3FC00002",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Number of times an RTM execution aborted.",
+        "EventCode": "0xc9",
+        "EventName": "RTM_RETIRED.ABORTED",
+        "PublicDescription": "Counts the number of times RTM abort was triggered.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x4"
+    },
+    {
+        "BriefDescription": "Number of times an RTM execution successfully committed",
+        "EventCode": "0xc9",
+        "EventName": "RTM_RETIRED.COMMIT",
+        "PublicDescription": "Counts the number of times RTM commit succeeded.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x2"
+    },
+    {
+        "BriefDescription": "Number of times an RTM execution started.",
+        "EventCode": "0xc9",
+        "EventName": "RTM_RETIRED.START",
+        "PublicDescription": "Counts the number of times we entered an RTM region. Does not count nested transactions.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Speculatively counts the number of TSX aborts due to a data capacity limitation for transactional reads",
+        "EventCode": "0x54",
+        "EventName": "TX_MEM.ABORT_CAPACITY_READ",
+        "PublicDescription": "Speculatively counts the number of Transactional Synchronization Extensions (TSX) aborts due to a data capacity limitation for transactional reads",
+        "SampleAfterValue": "100003",
+        "UMask": "0x80"
+    },
+    {
+        "BriefDescription": "Speculatively counts the number of TSX aborts due to a data capacity limitation for transactional writes.",
+        "EventCode": "0x54",
+        "EventName": "TX_MEM.ABORT_CAPACITY_WRITE",
+        "PublicDescription": "Speculatively counts the number of Transactional Synchronization Extensions (TSX) aborts due to a data capacity limitation for transactional writes.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x2"
+    },
+    {
+        "BriefDescription": "Number of times a transactional abort was signaled due to a data conflict on a transactionally accessed address",
+        "EventCode": "0x54",
+        "EventName": "TX_MEM.ABORT_CONFLICT",
+        "PublicDescription": "Counts the number of times a TSX line had a cache conflict.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/other.json b/tools/perf/pmu-events/arch/x86/graniterapids/other.json
new file mode 100644
index 000000000000..5e799bae03ea
--- /dev/null
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/other.json
@@ -0,0 +1,29 @@
+[
+    {
+        "BriefDescription": "Counts demand data reads that have any type of response.",
+        "EventCode": "0x2A,0x2B",
+        "EventName": "OCR.DEMAND_DATA_RD.ANY_RESPONSE",
+        "MSRIndex": "0x1a6,0x1a7",
+        "MSRValue": "0x10001",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts demand data reads that were supplied by DRAM attached to this socket, unless in Sub NUMA Cluster(SNC) Mode.  In SNC Mode counts only those DRAM accesses that are controlled by the close SNC Cluster.",
+        "EventCode": "0x2A,0x2B",
+        "EventName": "OCR.DEMAND_DATA_RD.LOCAL_DRAM",
+        "MSRIndex": "0x1a6,0x1a7",
+        "MSRValue": "0x104000001",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts demand reads for ownership (RFO) requests and software prefetches for exclusive ownership (PREFETCHW) that have any type of response.",
+        "EventCode": "0x2A,0x2B",
+        "EventName": "OCR.DEMAND_RFO.ANY_RESPONSE",
+        "MSRIndex": "0x1a6,0x1a7",
+        "MSRValue": "0x3F3FFC0002",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/pipeline.json b/tools/perf/pmu-events/arch/x86/graniterapids/pipeline.json
new file mode 100644
index 000000000000..d6aafb258708
--- /dev/null
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/pipeline.json
@@ -0,0 +1,102 @@
+[
+    {
+        "BriefDescription": "All branch instructions retired.",
+        "EventCode": "0xc4",
+        "EventName": "BR_INST_RETIRED.ALL_BRANCHES",
+        "PEBS": "1",
+        "PublicDescription": "Counts all branch instructions retired.",
+        "SampleAfterValue": "400009"
+    },
+    {
+        "BriefDescription": "All mispredicted branch instructions retired.",
+        "EventCode": "0xc5",
+        "EventName": "BR_MISP_RETIRED.ALL_BRANCHES",
+        "PEBS": "1",
+        "PublicDescription": "Counts all the retired branch instructions that were mispredicted by the processor. A branch misprediction occurs when the processor incorrectly predicts the destination of the branch.  When the misprediction is discovered at execution, all the instructions executed in the wrong (speculative) path must be discarded, and the processor must start fetching from the correct path.",
+        "SampleAfterValue": "400009"
+    },
+    {
+        "BriefDescription": "Reference cycles when the core is not in halt state.",
+        "EventName": "CPU_CLK_UNHALTED.REF_TSC",
+        "PublicDescription": "Counts the number of reference cycles when the core is not in a halt state. The core enters the halt state when it is running the HLT instruction or the MWAIT instruction. This event is not affected by core frequency changes (for example, P states, TM2 transitions) but has the same incrementing frequency as the time stamp counter. This event can approximate elapsed time while the core was not in a halt state. It is counted on a dedicated fixed counter, leaving the eight programmable counters available for other events. Note: On all current platforms this event stops counting during 'throttling (TM)' states duty off periods the processor is 'halted'.  The counter update is done at a lower clock rate then the core clock the overflow status bit for this counter may appear 'sticky'.  After the counter has overflowed and software clears the overflow status bit and resets the counter to less than MAX. The reset value to the counter is not clocked immediately 
 so the overflow status bit will flip 'high (1)' and generate another PMI (if enabled) after which the reset value gets clocked into the counter. Therefore, software will get the interrupt, read the overflow status bit '1 for bit 34 while the counter value is less than MAX. Software should ignore this case.",
+        "SampleAfterValue": "2000003",
+        "UMask": "0x3"
+    },
+    {
+        "BriefDescription": "Reference cycles when the core is not in halt state.",
+        "EventCode": "0x3c",
+        "EventName": "CPU_CLK_UNHALTED.REF_TSC_P",
+        "PublicDescription": "Counts the number of reference cycles when the core is not in a halt state. The core enters the halt state when it is running the HLT instruction or the MWAIT instruction. This event is not affected by core frequency changes (for example, P states, TM2 transitions) but has the same incrementing frequency as the time stamp counter. This event can approximate elapsed time while the core was not in a halt state. It is counted on a dedicated fixed counter, leaving the four (eight when Hyperthreading is disabled) programmable counters available for other events. Note: On all current platforms this event stops counting during 'throttling (TM)' states duty off periods the processor is 'halted'.  The counter update is done at a lower clock rate then the core clock the overflow status bit for this counter may appear 'sticky'.  After the counter has overflowed and software clears the overflow status bit and resets the counter to less than MAX. The reset value to 
 the counter is not clocked immediately so the overflow status bit will flip 'high (1)' and generate another PMI (if enabled) after which the reset value gets clocked into the counter. Therefore, software will get the interrupt, read the overflow status bit '1 for bit 34 while the counter value is less than MAX. Software should ignore this case.",
+        "SampleAfterValue": "2000003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Core cycles when the thread is not in halt state",
+        "EventName": "CPU_CLK_UNHALTED.THREAD",
+        "PublicDescription": "Counts the number of core cycles while the thread is not in a halt state. The thread enters the halt state when it is running the HLT instruction. This event is a component in many key event ratios. The core frequency may change from time to time due to transitions associated with Enhanced Intel SpeedStep Technology or TM2. For this reason this event may have a changing ratio with regards to time. When the core frequency is constant, this event can approximate elapsed time while the core was not in the halt state. It is counted on a dedicated fixed counter, leaving the eight programmable counters available for other events.",
+        "SampleAfterValue": "2000003",
+        "UMask": "0x2"
+    },
+    {
+        "BriefDescription": "Thread cycles when thread is not in halt state",
+        "EventCode": "0x3c",
+        "EventName": "CPU_CLK_UNHALTED.THREAD_P",
+        "PublicDescription": "This is an architectural event that counts the number of thread cycles while the thread is not in a halt state. The thread enters the halt state when it is running the HLT instruction. The core frequency may change from time to time due to power or thermal throttling. For this reason, this event may have a changing ratio with regards to wall clock time.",
+        "SampleAfterValue": "2000003"
+    },
+    {
+        "BriefDescription": "Number of instructions retired. Fixed Counter - architectural event",
+        "EventName": "INST_RETIRED.ANY",
+        "PEBS": "1",
+        "PublicDescription": "Counts the number of X86 instructions retired - an Architectural PerfMon event. Counting continues during hardware interrupts, traps, and inside interrupt handlers. Notes: INST_RETIRED.ANY is counted by a designated fixed counter freeing up programmable counters to count other events. INST_RETIRED.ANY_P is counted by a programmable counter.",
+        "SampleAfterValue": "2000003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Number of instructions retired. General Counter - architectural event",
+        "EventCode": "0xc0",
+        "EventName": "INST_RETIRED.ANY_P",
+        "PEBS": "1",
+        "PublicDescription": "Counts the number of X86 instructions retired - an Architectural PerfMon event. Counting continues during hardware interrupts, traps, and inside interrupt handlers. Notes: INST_RETIRED.ANY is counted by a designated fixed counter freeing up programmable counters to count other events. INST_RETIRED.ANY_P is counted by a programmable counter.",
+        "SampleAfterValue": "2000003"
+    },
+    {
+        "BriefDescription": "Loads blocked due to overlapping with a preceding store that cannot be forwarded.",
+        "EventCode": "0x03",
+        "EventName": "LD_BLOCKS.STORE_FORWARD",
+        "PublicDescription": "Counts the number of times where store forwarding was prevented for a load operation. The most common case is a load blocked due to the address of memory access (partially) overlapping with a preceding uncompleted store. Note: See the table of not supported store forwards in the Optimization Guide.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x82"
+    },
+    {
+        "BriefDescription": "This event counts a subset of the Topdown Slots event that were not consumed by the back-end pipeline due to lack of back-end resources, as a result of memory subsystem delays, execution units limitations, or other conditions.",
+        "EventCode": "0xa4",
+        "EventName": "TOPDOWN.BACKEND_BOUND_SLOTS",
+        "PublicDescription": "This event counts a subset of the Topdown Slots event that were not consumed by the back-end pipeline due to lack of back-end resources, as a result of memory subsystem delays, execution units limitations, or other conditions.\nThe count is distributed among unhalted logical processors (hyper-threads) who share the same physical core, in processors that support Intel Hyper-Threading Technology. Software can use this event as the nominator for the Backend Bound metric (or top-level category) of the Top-down Microarchitecture Analysis method.",
+        "SampleAfterValue": "10000003",
+        "UMask": "0x2"
+    },
+    {
+        "BriefDescription": "TMA slots available for an unhalted logical processor. Fixed counter - architectural event",
+        "EventName": "TOPDOWN.SLOTS",
+        "PublicDescription": "Number of available slots for an unhalted logical processor. The event increments by machine-width of the narrowest pipeline as employed by the Top-down Microarchitecture Analysis method (TMA). The count is distributed among unhalted logical processors (hyper-threads) who share the same physical core. Software can use this event as the denominator for the top-level metrics of the TMA method. This architectural event is counted on a designated fixed counter (Fixed Counter 3).",
+        "SampleAfterValue": "10000003",
+        "UMask": "0x4"
+    },
+    {
+        "BriefDescription": "TMA slots available for an unhalted logical processor. General counter - architectural event",
+        "EventCode": "0xa4",
+        "EventName": "TOPDOWN.SLOTS_P",
+        "PublicDescription": "Counts the number of available slots for an unhalted logical processor. The event increments by machine-width of the narrowest pipeline as employed by the Top-down Microarchitecture Analysis method. The count is distributed among unhalted logical processors (hyper-threads) who share the same physical core.",
+        "SampleAfterValue": "10000003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "This event counts a subset of the Topdown Slots event that are utilized by operations that eventually get retired (committed) by the processor pipeline. Usually, this event positively correlates with higher performance  for example, as measured by the instructions-per-cycle metric.",
+        "EventCode": "0xc2",
+        "EventName": "UOPS_RETIRED.SLOTS",
+        "PublicDescription": "This event counts a subset of the Topdown Slots event that are utilized by operations that eventually get retired (committed) by the processor pipeline. Usually, this event positively correlates with higher performance  for example, as measured by the instructions-per-cycle metric.\nSoftware can use this event as the nominator for the Retiring metric (or top-level category) of the Top-down Microarchitecture Analysis method.",
+        "SampleAfterValue": "2000003",
+        "UMask": "0x2"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/x86/graniterapids/virtual-memory.json b/tools/perf/pmu-events/arch/x86/graniterapids/virtual-memory.json
new file mode 100644
index 000000000000..8784c97b7534
--- /dev/null
+++ b/tools/perf/pmu-events/arch/x86/graniterapids/virtual-memory.json
@@ -0,0 +1,26 @@
+[
+    {
+        "BriefDescription": "Load miss in all TLB levels causes a page walk that completes. (All page sizes)",
+        "EventCode": "0x12",
+        "EventName": "DTLB_LOAD_MISSES.WALK_COMPLETED",
+        "PublicDescription": "Counts completed page walks  (all page sizes) caused by demand data loads. This implies it missed in the DTLB and further levels of TLB. The page walk can end with or without a fault.",
+        "SampleAfterValue": "100003",
+        "UMask": "0xe"
+    },
+    {
+        "BriefDescription": "Store misses in all TLB levels causes a page walk that completes. (All page sizes)",
+        "EventCode": "0x13",
+        "EventName": "DTLB_STORE_MISSES.WALK_COMPLETED",
+        "PublicDescription": "Counts completed page walks  (all page sizes) caused by demand data stores. This implies it missed in the DTLB and further levels of TLB. The page walk can end with or without a fault.",
+        "SampleAfterValue": "100003",
+        "UMask": "0xe"
+    },
+    {
+        "BriefDescription": "Code miss in all TLB levels causes a page walk that completes. (All page sizes)",
+        "EventCode": "0x11",
+        "EventName": "ITLB_MISSES.WALK_COMPLETED",
+        "PublicDescription": "Counts completed page walks (all page sizes) caused by a code fetch. This implies it missed in the ITLB (Instruction TLB) and further levels of TLB. The page walk can end with or without a fault.",
+        "SampleAfterValue": "100003",
+        "UMask": "0xe"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 793076e00188..1677ec22e2e3 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -9,6 +9,7 @@ GenuineIntel-6-55-[56789ABCDEF],v1.17,cascadelakex,core
 GenuineIntel-6-9[6C],v1.03,elkhartlake,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
+GenuineIntel-6-A[DE],v1.00,graniterapids,core
 GenuineIntel-6-(3C|45|46),v32,haswell,core
 GenuineIntel-6-3F,v26,haswellx,core
 GenuineIntel-6-(7D|7E|A7),v1.15,icelake,core
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
