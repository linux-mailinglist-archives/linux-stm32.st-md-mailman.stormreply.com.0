Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763569CBC5
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Feb 2023 14:13:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1977C6B45F;
	Mon, 20 Feb 2023 13:13:14 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53CF1C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:33:03 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-536a0c1f58cso407187b3.23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QV7/hXxh57QEI+TG4VdKL7Xbqu6ReB4RGYaSf0jfwrI=;
 b=GyQeWbmpCRRpYOvE5GRwkfqKNhRLK+5VTunsVkkiurNpBoFhGIp1BYS5ENUoVXUZ0P
 QBm0ldLBjVwk5DYM2Ny9UiUNaLSXJtBW4S4R9zFHaTxLbJiXHfIkkYNChDmKFvWkU65U
 nD1/eK5ik+lK2DNfH9gl0ujay6xkUoe5sJ0uWLzBvGY6T0aAJaHoYCgiuER8ICCVO7jd
 k+B//ccKWGNCLOcEdqQyl4i5rLEoRm+CNbp1VIOJxrL5LLeHzf3xkLOwh3LAmDJWtJa0
 WrQ17Z+mQueFsofPcKeTDxBe/qYplGvvawbodFjlVV8YGWINAKFkBlCyFw/55xftM4hF
 E0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QV7/hXxh57QEI+TG4VdKL7Xbqu6ReB4RGYaSf0jfwrI=;
 b=sWJkIKnv5X4HrcCxmiaw4G01tQ7xkZTg4ICwd8i2ffIL449hkpHwghcfSaBVw4R3nT
 +S29oJ7JDBAI6Z4bRSpzrnKtkbnM9QDMMtms8yNPGC3ydWuQsJZjcsd0bUvfyA8k4Ru2
 pzSm7tgmimsH9MXVoH3NOn+P+CxMKf5uNldOXVtHoEyGd7NopgqM3UVI/PChMhq9fVUg
 2/g4Ub56Xa9AAkwdA3dfl5Ww9IHdp2VNO+2cSzn+3rkVJBDbPqUhl0473rDVtOFVcwzd
 tSE7CAFPSD89mBYGwR2woj/GbI263MEFspgJQ2DdU+LudkhFEhOmscXcJOa6IuwMGUfA
 Z2eQ==
X-Gm-Message-State: AO0yUKUNZXZ7MYQYqn2oZadX16CGMVsa8+jRcrp9ZHFch8iw2x6FY557
 m1nhNK76/4Lsedg6+7PlgBrvbgt6rZ50
X-Google-Smtp-Source: AK7set8mU6qmKyIel0NkmvRuAXWh8PPUI6PAYRSfYrpqQ1XjBENPiG3Vkz/LcByOBzZsOAnI8/D18a9w+SAQ
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a25:9e8c:0:b0:90c:e04d:deca with SMTP id
 p12-20020a259e8c000000b0090ce04ddecamr17677ybq.11.1676799182169; Sun, 19 Feb
 2023 01:33:02 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:26 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-30-irogers@google.com>
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
X-Mailman-Approved-At: Mon, 20 Feb 2023 13:13:06 +0000
Cc: Ian Rogers <irogers@google.com>, Stephane Eranian <eranian@google.com>
Subject: [Linux-stm32] [PATCH v1 29/51] perf vendor events intel: Refresh
	skylakex metrics
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

Update the skylakex events from 1.28 to 1.29 and metrics to TMA
version 4.5. Generation was done using
https://github.com/intel/perfmon.

Notable changes are TMA info metrics are renamed from their node name
to be lower case and prefixed by tma_info_, MetricThreshold
expressions are added, "Sample with" documentation is added to many
TMA metrics, smi_cost and transaction metric groups are added
replicating existing hard coded metrics in stat-shadow.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv    |    2 +-
 .../pmu-events/arch/x86/skylakex/cache.json   |    8 +-
 .../arch/x86/skylakex/frontend.json           |    8 +-
 .../arch/x86/skylakex/pipeline.json           |   16 +
 .../arch/x86/skylakex/skx-metrics.json        | 2097 +++++++++--------
 .../arch/x86/skylakex/uncore-memory.json      |    2 +-
 .../arch/x86/skylakex/uncore-other.json       |   96 +-
 .../arch/x86/skylakex/uncore-power.json       |    6 +-
 8 files changed, 1167 insertions(+), 1068 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 22aa63f90f89..07f0b4758a83 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -25,7 +25,7 @@ GenuineIntel-6-2A,v18,sandybridge,core
 GenuineIntel-6-(8F|CF),v1.11,sapphirerapids,core
 GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v54,skylake,core
-GenuineIntel-6-55-[01234],v1.28,skylakex,core
+GenuineIntel-6-55-[01234],v1.29,skylakex,core
 GenuineIntel-6-86,v1.20,snowridgex,core
 GenuineIntel-6-8[CD],v1.08,tigerlake,core
 GenuineIntel-6-2C,v3,westmereep-dp,core
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/cache.json b/tools/perf/pmu-events/arch/x86/skylakex/cache.json
index 92da692795e7..d28d8822a51a 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/cache.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/cache.json
@@ -234,20 +234,22 @@
         "UMask": "0x4f"
     },
     {
-        "BriefDescription": "All retired load instructions.",
+        "BriefDescription": "Retired load instructions.",
         "Data_LA": "1",
         "EventCode": "0xD0",
         "EventName": "MEM_INST_RETIRED.ALL_LOADS",
         "PEBS": "1",
+        "PublicDescription": "Counts all retired load instructions. This event accounts for SW prefetch instructions of PREFETCHNTA or PREFETCHT0/1/2 or PREFETCHW.",
         "SampleAfterValue": "2000003",
         "UMask": "0x81"
     },
     {
-        "BriefDescription": "All retired store instructions.",
+        "BriefDescription": "Retired store instructions.",
         "Data_LA": "1",
         "EventCode": "0xD0",
         "EventName": "MEM_INST_RETIRED.ALL_STORES",
         "PEBS": "1",
+        "PublicDescription": "Counts all retired store instructions.",
         "SampleAfterValue": "2000003",
         "UMask": "0x82"
     },
@@ -484,7 +486,7 @@
         "UMask": "0x80"
     },
     {
-        "BriefDescription": "Cacheable and noncachaeble code read requests",
+        "BriefDescription": "Cacheable and non-cacheable code read requests",
         "EventCode": "0xB0",
         "EventName": "OFFCORE_REQUESTS.DEMAND_CODE_RD",
         "PublicDescription": "Counts both cacheable and non-cacheable code read requests.",
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/frontend.json b/tools/perf/pmu-events/arch/x86/skylakex/frontend.json
index 13ccf50db43d..04f08e4d2402 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/frontend.json
@@ -322,7 +322,7 @@
         "UMask": "0x4"
     },
     {
-        "BriefDescription": "Cycles when uops are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy",
+        "BriefDescription": "Cycles when uops are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy",
         "CounterMask": "1",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_CYCLES",
@@ -331,7 +331,7 @@
         "UMask": "0x30"
     },
     {
-        "BriefDescription": "Cycles when uops initiated by Decode Stream Buffer (DSB) are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy",
+        "BriefDescription": "Cycles when uops initiated by Decode Stream Buffer (DSB) are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy",
         "CounterMask": "1",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_DSB_CYCLES",
@@ -340,7 +340,7 @@
         "UMask": "0x10"
     },
     {
-        "BriefDescription": "Uops initiated by MITE and delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy",
+        "BriefDescription": "Uops initiated by MITE and delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_MITE_UOPS",
         "PublicDescription": "Counts the number of uops initiated by MITE and delivered to Instruction Decode Queue (IDQ) while the Microcode Sequencer (MS) is busy. Counting includes uops that may 'bypass' the IDQ.",
@@ -358,7 +358,7 @@
         "UMask": "0x30"
     },
     {
-        "BriefDescription": "Uops delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy",
+        "BriefDescription": "Uops delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_UOPS",
         "PublicDescription": "Counts the total number of uops delivered by the Microcode Sequencer (MS). Any instruction over 4 uops will be delivered by the MS. Some instructions such as transcendentals may additionally generate uops from the MS.",
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/pipeline.json b/tools/perf/pmu-events/arch/x86/skylakex/pipeline.json
index 64e1fe351333..0f06e314fe36 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/pipeline.json
@@ -93,6 +93,22 @@
         "SampleAfterValue": "400009",
         "UMask": "0x10"
     },
+    {
+        "BriefDescription": "Speculative and retired mispredicted macro conditional branches",
+        "EventCode": "0x89",
+        "EventName": "BR_MISP_EXEC.ALL_BRANCHES",
+        "PublicDescription": "This event counts both taken and not taken speculative and retired mispredicted branch instructions.",
+        "SampleAfterValue": "200003",
+        "UMask": "0xff"
+    },
+    {
+        "BriefDescription": "Speculative mispredicted indirect branches",
+        "EventCode": "0x89",
+        "EventName": "BR_MISP_EXEC.INDIRECT",
+        "PublicDescription": "Counts speculatively miss-predicted indirect branches at execution time. Counts for indirect near CALL or JMP instructions (RET excluded).",
+        "SampleAfterValue": "200003",
+        "UMask": "0xe4"
+    },
     {
         "BriefDescription": "All mispredicted macro branch instructions retired.",
         "EventCode": "0xC5",
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/skx-metrics.json b/tools/perf/pmu-events/arch/x86/skylakex/skx-metrics.json
index 1f8d60cce3ce..fa2f7f126a30 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/skx-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/skx-metrics.json
@@ -1,1497 +1,1570 @@
 [
     {
-        "BriefDescription": "Total pipeline cost of Branch Misprediction related bottlenecks",
-        "MetricExpr": "100 * (tma_branch_mispredicts + tma_fetch_latency * tma_mispredicts_resteers / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches))",
-        "MetricGroup": "Bad;BadSpec;BrMispredicts",
-        "MetricName": "Mispredictions"
-    },
-    {
-        "BriefDescription": "Total pipeline cost of (external) Memory Bandwidth related bottlenecks",
-        "MetricExpr": "100 * tma_memory_bound * (tma_dram_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_mem_bandwidth / (tma_mem_bandwidth + tma_mem_latency)) + tma_l3_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_sq_full / (tma_contested_accesses + tma_data_sharing + tma_l3_hit_latency + tma_sq_full))) + tma_l1_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_fb_full / (tma_4k_aliasing + tma_dtlb_load + tma_fb_full + tma_lock_latency + tma_split_loads + tma_store_fwd_blk))",
-        "MetricGroup": "Mem;MemoryBW;Offcore",
-        "MetricName": "Memory_Bandwidth"
-    },
-    {
-        "BriefDescription": "Total pipeline cost of Memory Latency related bottlenecks (external memory and off-core caches)",
-        "MetricExpr": "100 * tma_memory_bound * (tma_dram_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_mem_latency / (tma_mem_bandwidth + tma_mem_latency)) + tma_l3_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_l3_hit_latency / (tma_contested_accesses + tma_data_sharing + tma_l3_hit_latency + tma_sq_full)) + tma_l2_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound))",
-        "MetricGroup": "Mem;MemoryLat;Offcore",
-        "MetricName": "Memory_Latency"
-    },
-    {
-        "BriefDescription": "Total pipeline cost of Memory Address Translation related bottlenecks (data-side TLBs)",
-        "MetricExpr": "100 * tma_memory_bound * (tma_l1_bound / max(tma_memory_bound, tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_dtlb_load / max(tma_l1_bound, tma_4k_aliasing + tma_dtlb_load + tma_fb_full + tma_lock_latency + tma_split_loads + tma_store_fwd_blk)) + tma_store_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_dtlb_store / (tma_dtlb_store + tma_false_sharing + tma_split_stores + tma_store_latency)))",
-        "MetricGroup": "Mem;MemoryTLB;Offcore",
-        "MetricName": "Memory_Data_TLBs"
-    },
-    {
-        "BriefDescription": "Total pipeline cost of branch related instructions (used for program control-flow including function calls)",
-        "MetricExpr": "100 * ((BR_INST_RETIRED.CONDITIONAL + 3 * BR_INST_RETIRED.NEAR_CALL + (BR_INST_RETIRED.NEAR_TAKEN - (BR_INST_RETIRED.CONDITIONAL - BR_INST_RETIRED.NOT_TAKEN) - 2 * BR_INST_RETIRED.NEAR_CALL)) / SLOTS)",
-        "MetricGroup": "Ret",
-        "MetricName": "Branching_Overhead"
-    },
-    {
-        "BriefDescription": "Total pipeline cost of instruction fetch related bottlenecks by large code footprint programs (i-side cache; TLB and BTB misses)",
-        "MetricExpr": "100 * tma_fetch_latency * (tma_itlb_misses + tma_icache_misses + tma_unknown_branches) / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches)",
-        "MetricGroup": "BigFoot;Fed;Frontend;IcMiss;MemoryTLB",
-        "MetricName": "Big_Code"
-    },
-    {
-        "BriefDescription": "Total pipeline cost of instruction fetch bandwidth related bottlenecks",
-        "MetricExpr": "100 * (tma_frontend_bound - tma_fetch_latency * tma_mispredicts_resteers / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches)) - Big_Code",
-        "MetricGroup": "Fed;FetchBW;Frontend",
-        "MetricName": "Instruction_Fetch_BW"
-    },
-    {
-        "BriefDescription": "Instructions Per Cycle (per Logical Processor)",
-        "MetricExpr": "INST_RETIRED.ANY / CLKS",
-        "MetricGroup": "Ret;Summary",
-        "MetricName": "IPC"
-    },
-    {
-        "BriefDescription": "Uops Per Instruction",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / INST_RETIRED.ANY",
-        "MetricGroup": "Pipeline;Ret;Retire",
-        "MetricName": "UPI"
-    },
-    {
-        "BriefDescription": "Instruction per taken branch",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / BR_INST_RETIRED.NEAR_TAKEN",
-        "MetricGroup": "Branches;Fed;FetchBW",
-        "MetricName": "UpTB"
+        "BriefDescription": "C2 residency percent per package",
+        "MetricExpr": "cstate_pkg@c2\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C2_Pkg_Residency",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Cycles Per Instruction (per Logical Processor)",
-        "MetricExpr": "1 / IPC",
-        "MetricGroup": "Mem;Pipeline",
-        "MetricName": "CPI"
+        "BriefDescription": "C3 residency percent per core",
+        "MetricExpr": "cstate_core@c3\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C3_Core_Residency",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Per-Logical Processor actual clocks when the Logical Processor is active.",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "Pipeline",
-        "MetricName": "CLKS"
+        "BriefDescription": "C3 residency percent per package",
+        "MetricExpr": "cstate_pkg@c3\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C3_Pkg_Residency",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Total issue-pipeline slots (per-Physical Core till ICL; per-Logical Processor ICL onward)",
-        "MetricExpr": "4 * CORE_CLKS",
-        "MetricGroup": "tma_L1_group",
-        "MetricName": "SLOTS"
+        "BriefDescription": "C6 residency percent per core",
+        "MetricExpr": "cstate_core@c6\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C6_Core_Residency",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "The ratio of Executed- by Issued-Uops",
-        "MetricExpr": "UOPS_EXECUTED.THREAD / UOPS_ISSUED.ANY",
-        "MetricGroup": "Cor;Pipeline",
-        "MetricName": "Execute_per_Issue",
-        "PublicDescription": "The ratio of Executed- by Issued-Uops. Ratio > 1 suggests high rate of uop micro-fusions. Ratio < 1 suggest high rate of \"execute\" at rename stage."
+        "BriefDescription": "C6 residency percent per package",
+        "MetricExpr": "cstate_pkg@c6\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C6_Pkg_Residency",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions Per Cycle across hyper-threads (per physical core)",
-        "MetricExpr": "INST_RETIRED.ANY / CORE_CLKS",
-        "MetricGroup": "Ret;SMT;tma_L1_group",
-        "MetricName": "CoreIPC"
+        "BriefDescription": "C7 residency percent per core",
+        "MetricExpr": "cstate_core@c7\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C7_Core_Residency",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Floating Point Operations Per Cycle",
-        "MetricExpr": "(FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + 2 * FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + 4 * (FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE) + 8 * (FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE) + 16 * FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE) / CORE_CLKS",
-        "MetricGroup": "Flops;Ret",
-        "MetricName": "FLOPc"
+        "BriefDescription": "C7 residency percent per package",
+        "MetricExpr": "cstate_pkg@c7\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C7_Pkg_Residency",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Actual per-core usage of the Floating Point non-X87 execution units (regardless of precision or vector-width)",
-        "MetricExpr": "(FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + (FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE)) / (2 * CORE_CLKS)",
-        "MetricGroup": "Cor;Flops;HPC",
-        "MetricName": "FP_Arith_Utilization",
-        "PublicDescription": "Actual per-core usage of the Floating Point non-X87 execution units (regardless of precision or vector-width). Values > 1 are possible due to ([BDW+] Fused-Multiply Add (FMA) counting - common; [ADL+] use all of ADD/MUL/FMA in Scalar or 128/256-bit vectors - less common)."
+        "BriefDescription": "Uncore frequency per die [GHZ]",
+        "MetricExpr": "tma_info_socket_clks / #num_dies / duration_time / 1e9",
+        "MetricGroup": "SoC",
+        "MetricName": "UNCORE_FREQ"
     },
     {
-        "BriefDescription": "Instruction-Level-Parallelism (average number of uops executed when there is execution) per-core",
-        "MetricExpr": "UOPS_EXECUTED.THREAD / (UOPS_EXECUTED.CORE_CYCLES_GE_1 / 2 if #SMT_on else UOPS_EXECUTED.CORE_CYCLES_GE_1)",
-        "MetricGroup": "Backend;Cor;Pipeline;PortsUtil",
-        "MetricName": "ILP"
+        "BriefDescription": "Percentage of cycles spent in System Management Interrupts.",
+        "MetricExpr": "((msr@aperf@ - cycles) / msr@aperf@ if msr@smi@ > 0 else 0)",
+        "MetricGroup": "smi",
+        "MetricName": "smi_cycles",
+        "MetricThreshold": "smi_cycles > 0.1",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Probability of Core Bound bottleneck hidden by SMT-profiling artifacts",
-        "MetricExpr": "((1 - tma_core_bound / tma_ports_utilization if tma_core_bound < tma_ports_utilization else 1) if SMT_2T_Utilization > 0.5 else 0)",
-        "MetricGroup": "Cor;SMT",
-        "MetricName": "Core_Bound_Likely"
+        "BriefDescription": "Number of SMI interrupts.",
+        "MetricExpr": "msr@smi@",
+        "MetricGroup": "smi",
+        "MetricName": "smi_num",
+        "ScaleUnit": "1SMI#"
     },
     {
-        "BriefDescription": "Core actual clocks when any Logical Processor is active on the Physical Core",
-        "MetricExpr": "(CPU_CLK_UNHALTED.THREAD / 2 * (1 + CPU_CLK_UNHALTED.ONE_THREAD_ACTIVE / CPU_CLK_UNHALTED.REF_XCLK) if #core_wide < 1 else (CPU_CLK_UNHALTED.THREAD_ANY / 2 if #SMT_on else CLKS))",
-        "MetricGroup": "SMT",
-        "MetricName": "CORE_CLKS"
+        "BriefDescription": "This metric estimates how often memory load accesses were aliased by preceding stores (in program order) with a 4K address offset",
+        "MetricExpr": "LD_BLOCKS_PARTIAL.ADDRESS_ALIAS / tma_info_clks",
+        "MetricGroup": "TopdownL4;tma_L4_group;tma_l1_bound_group",
+        "MetricName": "tma_4k_aliasing",
+        "MetricThreshold": "tma_4k_aliasing > 0.2 & (tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates how often memory load accesses were aliased by preceding stores (in program order) with a 4K address offset. False match is possible; which incur a few cycles load re-issue. However; the short re-issue duration is often hidden by the out-of-order core and HW optimizations; hence a user may safely ignore a high value of this metric unless it manages to propagate up into parent nodes of the hierarchy (e.g. to L1_Bound).",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per Load (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / MEM_INST_RETIRED.ALL_LOADS",
-        "MetricGroup": "InsType",
-        "MetricName": "IpLoad"
+        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution ports for ALU operations.",
+        "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_0 + UOPS_DISPATCHED_PORT.PORT_1 + UOPS_DISPATCHED_PORT.PORT_5 + UOPS_DISPATCHED_PORT.PORT_6) / tma_info_slots",
+        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group",
+        "MetricName": "tma_alu_op_utilization",
+        "MetricThreshold": "tma_alu_op_utilization > 0.6",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per Store (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / MEM_INST_RETIRED.ALL_STORES",
-        "MetricGroup": "InsType",
-        "MetricName": "IpStore"
+        "BriefDescription": "This metric estimates fraction of slots the CPU retired uops delivered by the Microcode_Sequencer as a result of Assists",
+        "MetricExpr": "100 * (FP_ASSIST.ANY + OTHER_ASSISTS.ANY) / tma_info_slots",
+        "MetricGroup": "TopdownL4;tma_L4_group;tma_microcode_sequencer_group",
+        "MetricName": "tma_assists",
+        "MetricThreshold": "tma_assists > 0.1 & (tma_microcode_sequencer > 0.05 & tma_heavy_operations > 0.1)",
+        "PublicDescription": "This metric estimates fraction of slots the CPU retired uops delivered by the Microcode_Sequencer as a result of Assists. Assists are long sequences of uops that are required in certain corner-cases for operations that cannot be handled natively by the execution pipeline. For example; when working with very small floating point values (so-called Denormals); the FP units are not set up to perform these operations natively. Instead; a sequence of instructions to perform the computation on the Denormals is injected into the pipeline. Since these microcode sequences might be dozens of uops long; Assists can be extremely deleterious to performance and they can be avoided in many cases. Sample with: OTHER_ASSISTS.ANY",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per Branch (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.ALL_BRANCHES",
-        "MetricGroup": "Branches;Fed;InsType",
-        "MetricName": "IpBranch"
+        "BriefDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend",
+        "MetricExpr": "1 - tma_frontend_bound - (UOPS_ISSUED.ANY + 4 * (INT_MISC.RECOVERY_CYCLES_ANY / 2 if #SMT_on else INT_MISC.RECOVERY_CYCLES)) / tma_info_slots",
+        "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
+        "MetricName": "tma_backend_bound",
+        "MetricThreshold": "tma_backend_bound > 0.2",
+        "PublicDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend. Backend is the portion of the processor core where the out-of-order scheduler dispatches ready uops into their respective execution units; and once completed these uops get retired according to program order. For example; stalls due to data-cache misses or stalls due to the divider unit being overloaded are both categorized under Backend Bound. Backend Bound is further divided into two main categories: Memory Bound and Core Bound.",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per (near) call (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.NEAR_CALL",
-        "MetricGroup": "Branches;Fed;PGO",
-        "MetricName": "IpCall"
+        "BriefDescription": "This category represents fraction of slots wasted due to incorrect speculations",
+        "MetricExpr": "(UOPS_ISSUED.ANY - UOPS_RETIRED.RETIRE_SLOTS + 4 * (INT_MISC.RECOVERY_CYCLES_ANY / 2 if #SMT_on else INT_MISC.RECOVERY_CYCLES)) / tma_info_slots",
+        "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
+        "MetricName": "tma_bad_speculation",
+        "MetricThreshold": "tma_bad_speculation > 0.15",
+        "PublicDescription": "This category represents fraction of slots wasted due to incorrect speculations. This include slots used to issue uops that do not eventually get retired and slots for which the issue-pipeline was blocked due to recovery from earlier incorrect speculation. For example; wasted work due to miss-predicted branches are categorized under Bad Speculation category. Incorrect data speculation followed by Memory Ordering Nukes is another example.",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instruction per taken branch",
-        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.NEAR_TAKEN",
-        "MetricGroup": "Branches;Fed;FetchBW;Frontend;PGO",
-        "MetricName": "IpTB"
+        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT) * tma_bad_speculation",
+        "MetricGroup": "BadSpec;BrMispredicts;TmaL2;TopdownL2;tma_L2_group;tma_bad_speculation_group;tma_issueBM",
+        "MetricName": "tma_branch_mispredicts",
+        "MetricThreshold": "tma_branch_mispredicts > 0.1 & tma_bad_speculation > 0.15",
+        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction.  These slots are either wasted by uops fetched from an incorrectly speculated program path; or stalls when the out-of-order part of the machine needs to recover its state from a speculative path. Sample with: BR_MISP_RETIRED.ALL_BRANCHES. Related metrics: tma_info_branch_misprediction_cost, tma_info_mispredictions, tma_mispredicts_resteers",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Branch instructions per taken branch. ",
-        "MetricExpr": "BR_INST_RETIRED.ALL_BRANCHES / BR_INST_RETIRED.NEAR_TAKEN",
-        "MetricGroup": "Branches;Fed;PGO",
-        "MetricName": "BpTkBranch"
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers",
+        "MetricExpr": "INT_MISC.CLEAR_RESTEER_CYCLES / tma_info_clks + tma_unknown_branches",
+        "MetricGroup": "FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group",
+        "MetricName": "tma_branch_resteers",
+        "MetricThreshold": "tma_branch_resteers > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers. Branch Resteers estimates the Frontend delay in fetching operations from corrected path; following all sorts of miss-predicted branches. For example; branchy code with lots of miss-predictions might get categorized under Branch Resteers. Note the value of this node may overlap with its siblings. Sample with: BR_MISP_RETIRED.ALL_BRANCHES",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per Floating Point (FP) Operation (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + 2 * FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + 4 * (FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE) + 8 * (FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE) + 16 * FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE)",
-        "MetricGroup": "Flops;InsType",
-        "MetricName": "IpFLOP"
+        "BriefDescription": "This metric estimates fraction of cycles the CPU retired uops originated from CISC (complex instruction set computer) instruction",
+        "MetricExpr": "max(0, tma_microcode_sequencer - tma_assists)",
+        "MetricGroup": "TopdownL4;tma_L4_group;tma_microcode_sequencer_group",
+        "MetricName": "tma_cisc",
+        "MetricThreshold": "tma_cisc > 0.1 & (tma_microcode_sequencer > 0.05 & tma_heavy_operations > 0.1)",
+        "PublicDescription": "This metric estimates fraction of cycles the CPU retired uops originated from CISC (complex instruction set computer) instruction. A CISC instruction has multiple uops that are required to perform the instruction's functionality as in the case of read-modify-write as an example. Since these instructions require multiple uops they may or may not imply sub-optimal use of machine resources.",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per FP Arithmetic instruction (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + (FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE))",
-        "MetricGroup": "Flops;InsType",
-        "MetricName": "IpArith",
-        "PublicDescription": "Instructions per FP Arithmetic instruction (lower number means higher occurrence rate). May undercount due to FMA double counting. Approximated prior to BDW."
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers as a result of Machine Clears",
+        "MetricExpr": "(1 - BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT)) * INT_MISC.CLEAR_RESTEER_CYCLES / tma_info_clks",
+        "MetricGroup": "BadSpec;MachineClears;TopdownL4;tma_L4_group;tma_branch_resteers_group;tma_issueMC",
+        "MetricName": "tma_clears_resteers",
+        "MetricThreshold": "tma_clears_resteers > 0.05 & (tma_branch_resteers > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15))",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers as a result of Machine Clears. Sample with: INT_MISC.CLEAR_RESTEER_CYCLES. Related metrics: tma_l1_bound, tma_machine_clears, tma_microcode_sequencer, tma_ms_switches",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per FP Arithmetic Scalar Single-Precision instruction (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / FP_ARITH_INST_RETIRED.SCALAR_SINGLE",
-        "MetricGroup": "Flops;FpScalar;InsType",
-        "MetricName": "IpArith_Scalar_SP",
-        "PublicDescription": "Instructions per FP Arithmetic Scalar Single-Precision instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
+        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to contested accesses",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(44 * tma_info_average_frequency * (MEM_LOAD_L3_HIT_RETIRED.XSNP_HITM * (OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE / (OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE + OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.SNOOP_HIT_WITH_FWD))) + 44 * tma_info_average_frequency * MEM_LOAD_L3_HIT_RETIRED.XSNP_MISS) * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / tma_info_clks",
+        "MetricGroup": "DataSharing;Offcore;Snoop;TopdownL4;tma_L4_group;tma_issueSyncxn;tma_l3_bound_group",
+        "MetricName": "tma_contested_accesses",
+        "MetricThreshold": "tma_contested_accesses > 0.05 & (tma_l3_bound > 0.05 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to contested accesses. Contested accesses occur when data written by one Logical Processor are read by another Logical Processor on a different Physical Core. Examples of contested accesses include synchronizations such as locks; true data sharing such as modified locked variables; and false sharing. Sample with: MEM_LOAD_L3_HIT_RETIRED.XSNP_HITM_PS;MEM_LOAD_L3_HIT_RETIRED.XSNP_MISS_PS. Related metrics: tma_data_sharing, tma_false_sharing, tma_machine_clears, tma_remote_cache",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per FP Arithmetic Scalar Double-Precision instruction (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / FP_ARITH_INST_RETIRED.SCALAR_DOUBLE",
-        "MetricGroup": "Flops;FpScalar;InsType",
-        "MetricName": "IpArith_Scalar_DP",
-        "PublicDescription": "Instructions per FP Arithmetic Scalar Double-Precision instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
+        "BriefDescription": "This metric represents fraction of slots where Core non-memory issues were of a bottleneck",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "tma_backend_bound - tma_memory_bound",
+        "MetricGroup": "Backend;Compute;TmaL2;TopdownL2;tma_L2_group;tma_backend_bound_group",
+        "MetricName": "tma_core_bound",
+        "MetricThreshold": "tma_core_bound > 0.1 & tma_backend_bound > 0.2",
+        "PublicDescription": "This metric represents fraction of slots where Core non-memory issues were of a bottleneck.  Shortage in hardware compute resources; or dependencies in software's instructions are both categorized under Core Bound. Hence it may indicate the machine ran out of an out-of-order resource; certain execution units are overloaded or dependencies in program's data- or instruction-flow are limiting the performance (e.g. FP-chained long-latency arithmetic operations).",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per FP Arithmetic AVX/SSE 128-bit instruction (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE)",
-        "MetricGroup": "Flops;FpVector;InsType",
-        "MetricName": "IpArith_AVX128",
-        "PublicDescription": "Instructions per FP Arithmetic AVX/SSE 128-bit instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
+        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to data-sharing accesses",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "44 * tma_info_average_frequency * (MEM_LOAD_L3_HIT_RETIRED.XSNP_HIT + MEM_LOAD_L3_HIT_RETIRED.XSNP_HITM * (1 - OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE / (OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE + OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.SNOOP_HIT_WITH_FWD))) * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / tma_info_clks",
+        "MetricGroup": "Offcore;Snoop;TopdownL4;tma_L4_group;tma_issueSyncxn;tma_l3_bound_group",
+        "MetricName": "tma_data_sharing",
+        "MetricThreshold": "tma_data_sharing > 0.05 & (tma_l3_bound > 0.05 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to data-sharing accesses. Data shared by multiple Logical Processors (even just read shared) may cause increased access latency due to cache coherency. Excessive data sharing can drastically harm multithreaded performance. Sample with: MEM_LOAD_L3_HIT_RETIRED.XSNP_HIT_PS. Related metrics: tma_contested_accesses, tma_false_sharing, tma_machine_clears, tma_remote_cache",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per FP Arithmetic AVX* 256-bit instruction (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE)",
-        "MetricGroup": "Flops;FpVector;InsType",
-        "MetricName": "IpArith_AVX256",
-        "PublicDescription": "Instructions per FP Arithmetic AVX* 256-bit instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
+        "BriefDescription": "This metric represents fraction of cycles where decoder-0 was the only active decoder",
+        "MetricExpr": "(cpu@INST_DECODED.DECODERS\\,cmask\\=1@ - cpu@INST_DECODED.DECODERS\\,cmask\\=2@) / tma_info_core_clks / 2",
+        "MetricGroup": "DSBmiss;FetchBW;TopdownL4;tma_L4_group;tma_issueD0;tma_mite_group",
+        "MetricName": "tma_decoder0_alone",
+        "MetricThreshold": "tma_decoder0_alone > 0.1 & (tma_mite > 0.1 & (tma_fetch_bandwidth > 0.1 & tma_frontend_bound > 0.15 & tma_info_ipc / 4 > 0.35))",
+        "PublicDescription": "This metric represents fraction of cycles where decoder-0 was the only active decoder. Related metrics: tma_few_uops_instructions",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per FP Arithmetic AVX 512-bit instruction (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE)",
-        "MetricGroup": "Flops;FpVector;InsType",
-        "MetricName": "IpArith_AVX512",
-        "PublicDescription": "Instructions per FP Arithmetic AVX 512-bit instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
+        "BriefDescription": "This metric represents fraction of cycles where the Divider unit was active",
+        "MetricExpr": "ARITH.DIVIDER_ACTIVE / tma_info_clks",
+        "MetricGroup": "TopdownL3;tma_L3_group;tma_core_bound_group",
+        "MetricName": "tma_divider",
+        "MetricThreshold": "tma_divider > 0.2 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric represents fraction of cycles where the Divider unit was active. Divide and square root instructions are performed by the Divider unit and can take considerably longer latency than integer or Floating Point addition; subtraction; or multiplication. Sample with: ARITH.DIVIDER_ACTIVE",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per Software prefetch instruction (of any type: NTA/T0/T1/T2/Prefetch) (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / cpu@SW_PREFETCH_ACCESS.T0\\,umask\\=0xF@",
-        "MetricGroup": "Prefetches",
-        "MetricName": "IpSWPF"
+        "BriefDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "CYCLE_ACTIVITY.STALLS_L3_MISS / tma_info_clks + (CYCLE_ACTIVITY.STALLS_L1D_MISS - CYCLE_ACTIVITY.STALLS_L2_MISS) / tma_info_clks - tma_l2_bound",
+        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
+        "MetricName": "tma_dram_bound",
+        "MetricThreshold": "tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads. Better caching can improve the latency and increase performance. Sample with: MEM_LOAD_RETIRED.L3_MISS_PS",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Total number of retired Instructions Sample with: INST_RETIRED.PREC_DIST",
-        "MetricExpr": "INST_RETIRED.ANY",
-        "MetricGroup": "Summary;tma_L1_group",
-        "MetricName": "Instructions"
+        "BriefDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to DSB (decoded uop cache) fetch pipeline",
+        "MetricExpr": "(IDQ.ALL_DSB_CYCLES_ANY_UOPS - IDQ.ALL_DSB_CYCLES_4_UOPS) / tma_info_core_clks / 2",
+        "MetricGroup": "DSB;FetchBW;TopdownL3;tma_L3_group;tma_fetch_bandwidth_group",
+        "MetricName": "tma_dsb",
+        "MetricThreshold": "tma_dsb > 0.15 & (tma_fetch_bandwidth > 0.1 & tma_frontend_bound > 0.15 & tma_info_ipc / 4 > 0.35)",
+        "PublicDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to DSB (decoded uop cache) fetch pipeline.  For example; inefficient utilization of the DSB cache structure or bank conflict when reading from it; are categorized here.",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Average number of Uops retired in cycles where at least one uop has retired.",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / cpu@UOPS_RETIRED.RETIRE_SLOTS\\,cmask\\=1@",
-        "MetricGroup": "Pipeline;Ret",
-        "MetricName": "Retire"
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines",
+        "MetricExpr": "DSB2MITE_SWITCHES.PENALTY_CYCLES / tma_info_clks",
+        "MetricGroup": "DSBmiss;FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group;tma_issueFB",
+        "MetricName": "tma_dsb_switches",
+        "MetricThreshold": "tma_dsb_switches > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines. The DSB (decoded i-cache) is a Uop Cache where the front-end directly delivers Uops (micro operations) avoiding heavy x86 decoding. The DSB pipeline has shorter latency and delivered higher bandwidth than the MITE (legacy instruction decode pipeline). Switching between the two pipelines can cause penalties hence this metric measures the exposed penalty. Sample with: FRONTEND_RETIRED.DSB_MISS_PS. Related metrics: tma_fetch_bandwidth, tma_info_dsb_coverage, tma_info_dsb_misses, tma_info_iptb, tma_lcp",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "",
-        "MetricExpr": "UOPS_EXECUTED.THREAD / cpu@UOPS_EXECUTED.THREAD\\,cmask\\=1@",
-        "MetricGroup": "Cor;Pipeline;PortsUtil;SMT",
-        "MetricName": "Execute"
+        "BriefDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
+        "MetricExpr": "min(9 * cpu@DTLB_LOAD_MISSES.STLB_HIT\\,cmask\\=1@ + DTLB_LOAD_MISSES.WALK_ACTIVE, max(CYCLE_ACTIVITY.CYCLES_MEM_ANY - CYCLE_ACTIVITY.CYCLES_L1D_MISS, 0)) / tma_info_clks",
+        "MetricGroup": "MemoryTLB;TopdownL4;tma_L4_group;tma_issueTLB;tma_l1_bound_group",
+        "MetricName": "tma_dtlb_load",
+        "MetricThreshold": "tma_dtlb_load > 0.1 & (tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses. TLBs (Translation Look-aside Buffers) are processor caches for recently used entries out of the Page Tables that are used to map virtual- to physical-addresses by the operating system. This metric approximates the potential delay of demand loads missing the first-level data TLB (assuming worst case scenario with back to back misses to different pages). This includes hitting in the second-level TLB (STLB) as well as performing a hardware page walk on an STLB miss. Sample with: MEM_INST_RETIRED.STLB_MISS_LOADS_PS. Related metrics: tma_dtlb_store, tma_info_memory_data_tlbs",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Average number of Uops issued by front-end when it issued something",
-        "MetricExpr": "UOPS_ISSUED.ANY / cpu@UOPS_ISSUED.ANY\\,cmask\\=1@",
-        "MetricGroup": "Fed;FetchBW",
-        "MetricName": "Fetch_UpC"
+        "BriefDescription": "This metric roughly estimates the fraction of cycles spent handling first-level data TLB store misses",
+        "MetricExpr": "(9 * cpu@DTLB_STORE_MISSES.STLB_HIT\\,cmask\\=1@ + DTLB_STORE_MISSES.WALK_ACTIVE) / tma_info_core_clks",
+        "MetricGroup": "MemoryTLB;TopdownL4;tma_L4_group;tma_issueTLB;tma_store_bound_group",
+        "MetricName": "tma_dtlb_store",
+        "MetricThreshold": "tma_dtlb_store > 0.05 & (tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric roughly estimates the fraction of cycles spent handling first-level data TLB store misses.  As with ordinary data caching; focus on improving data locality and reducing working-set size to reduce DTLB overhead.  Additionally; consider using profile-guided optimization (PGO) to collocate frequently-used data on the same page.  Try using larger page sizes for large amounts of frequently-used data. Sample with: MEM_INST_RETIRED.STLB_MISS_STORES_PS. Related metrics: tma_dtlb_load, tma_info_memory_data_tlbs",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Fraction of Uops delivered by the DSB (aka Decoded ICache; or Uop Cache)",
-        "MetricExpr": "IDQ.DSB_UOPS / (IDQ.DSB_UOPS + IDQ.MITE_UOPS + IDQ.MS_UOPS)",
-        "MetricGroup": "DSB;Fed;FetchBW",
-        "MetricName": "DSB_Coverage"
+        "BriefDescription": "This metric roughly estimates how often CPU was handling synchronizations due to False Sharing",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(110 * tma_info_average_frequency * (OFFCORE_RESPONSE.DEMAND_RFO.L3_MISS.REMOTE_HITM + OFFCORE_RESPONSE.PF_L2_RFO.L3_MISS.REMOTE_HITM) + 47.5 * tma_info_average_frequency * (OFFCORE_RESPONSE.DEMAND_RFO.L3_HIT.HITM_OTHER_CORE + OFFCORE_RESPONSE.PF_L2_RFO.L3_HIT.HITM_OTHER_CORE)) / tma_info_clks",
+        "MetricGroup": "DataSharing;Offcore;Snoop;TopdownL4;tma_L4_group;tma_issueSyncxn;tma_store_bound_group",
+        "MetricName": "tma_false_sharing",
+        "MetricThreshold": "tma_false_sharing > 0.05 & (tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric roughly estimates how often CPU was handling synchronizations due to False Sharing. False Sharing is a multithreading hiccup; where multiple Logical Processors contend on different data-elements mapped into the same cache line. Sample with: MEM_LOAD_L3_HIT_RETIRED.XSNP_HITM_PS;OFFCORE_RESPONSE.DEMAND_RFO.L3_HIT.SNOOP_HITM. Related metrics: tma_contested_accesses, tma_data_sharing, tma_machine_clears, tma_remote_cache",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Average number of cycles of a switch from the DSB fetch-unit to MITE fetch unit - see DSB_Switches tree node for details.",
-        "MetricExpr": "DSB2MITE_SWITCHES.PENALTY_CYCLES / DSB2MITE_SWITCHES.COUNT",
-        "MetricGroup": "DSBmiss",
-        "MetricName": "DSB_Switch_Cost"
+        "BriefDescription": "This metric does a *rough estimation* of how often L1D Fill Buffer unavailability limited additional L1D miss memory access requests to proceed",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
+        "MetricExpr": "tma_info_load_miss_real_latency * cpu@L1D_PEND_MISS.FB_FULL\\,cmask\\=1@ / tma_info_clks",
+        "MetricGroup": "MemoryBW;TopdownL4;tma_L4_group;tma_issueBW;tma_issueSL;tma_issueSmSt;tma_l1_bound_group",
+        "MetricName": "tma_fb_full",
+        "MetricThreshold": "tma_fb_full > 0.3",
+        "PublicDescription": "This metric does a *rough estimation* of how often L1D Fill Buffer unavailability limited additional L1D miss memory access requests to proceed. The higher the metric value; the deeper the memory hierarchy level the misses are satisfied from (metric values >1 are valid). Often it hints on approaching bandwidth limits (to L2 cache; L3 cache or external memory). Related metrics: tma_info_dram_bw_use, tma_info_memory_bandwidth, tma_mem_bandwidth, tma_sq_full, tma_store_latency, tma_streaming_stores",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Total penalty related to DSB (uop cache) misses - subset of the Instruction_Fetch_BW Bottleneck.",
-        "MetricExpr": "100 * (tma_fetch_latency * tma_dsb_switches / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches) + tma_fetch_bandwidth * tma_mite / (tma_dsb + tma_mite))",
-        "MetricGroup": "DSBmiss;Fed",
-        "MetricName": "DSB_Misses"
+        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues",
+        "MetricExpr": "tma_frontend_bound - tma_fetch_latency",
+        "MetricGroup": "FetchBW;Frontend;TmaL2;TopdownL2;tma_L2_group;tma_frontend_bound_group;tma_issueFB",
+        "MetricName": "tma_fetch_bandwidth",
+        "MetricThreshold": "tma_fetch_bandwidth > 0.1 & tma_frontend_bound > 0.15 & tma_info_ipc / 4 > 0.35",
+        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues.  For example; inefficiencies at the instruction decoders; or restrictions for caching in the DSB (decoded uops cache) are categorized under Fetch Bandwidth. In such cases; the Frontend typically delivers suboptimal amount of uops to the Backend. Sample with: FRONTEND_RETIRED.LATENCY_GE_2_BUBBLES_GE_1_PS;FRONTEND_RETIRED.LATENCY_GE_1_PS;FRONTEND_RETIRED.LATENCY_GE_2_PS. Related metrics: tma_dsb_switches, tma_info_dsb_coverage, tma_info_dsb_misses, tma_info_iptb, tma_lcp",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Number of Instructions per non-speculative DSB miss (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / FRONTEND_RETIRED.ANY_DSB_MISS",
-        "MetricGroup": "DSBmiss;Fed",
-        "MetricName": "IpDSB_Miss_Ret"
+        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues",
+        "MetricExpr": "4 * IDQ_UOPS_NOT_DELIVERED.CYCLES_0_UOPS_DELIV.CORE / tma_info_slots",
+        "MetricGroup": "Frontend;TmaL2;TopdownL2;tma_L2_group;tma_frontend_bound_group",
+        "MetricName": "tma_fetch_latency",
+        "MetricThreshold": "tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15",
+        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues.  For example; instruction-cache misses; iTLB misses or fetch stalls after a branch misprediction are categorized under Frontend Latency. In such cases; the Frontend eventually delivers no uops for some period. Sample with: FRONTEND_RETIRED.LATENCY_GE_16_PS;FRONTEND_RETIRED.LATENCY_GE_8_PS",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Number of Instructions per non-speculative Branch Misprediction (JEClear) (lower number means higher occurrence rate)",
-        "MetricExpr": "INST_RETIRED.ANY / BR_MISP_RETIRED.ALL_BRANCHES",
-        "MetricGroup": "Bad;BadSpec;BrMispredicts",
-        "MetricName": "IpMispredict"
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring instructions that that are decoder into two or up to ([SNB+] four; [ADL+] five) uops",
+        "MetricExpr": "tma_heavy_operations - tma_microcode_sequencer",
+        "MetricGroup": "TopdownL3;tma_L3_group;tma_heavy_operations_group;tma_issueD0",
+        "MetricName": "tma_few_uops_instructions",
+        "MetricThreshold": "tma_few_uops_instructions > 0.05 & tma_heavy_operations > 0.1",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring instructions that that are decoder into two or up to ([SNB+] four; [ADL+] five) uops. This highly-correlates with the number of uops in such instructions. Related metrics: tma_decoder0_alone",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Branch Misprediction Cost: Fraction of TMA slots wasted per non-speculative branch misprediction (retired JEClear)",
-        "MetricExpr": "(tma_branch_mispredicts + tma_fetch_latency * tma_mispredicts_resteers / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches)) * SLOTS / BR_MISP_RETIRED.ALL_BRANCHES",
-        "MetricGroup": "Bad;BrMispredicts",
-        "MetricName": "Branch_Misprediction_Cost"
+        "BriefDescription": "This metric represents overall arithmetic floating-point (FP) operations fraction the CPU has executed (retired)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "tma_x87_use + tma_fp_scalar + tma_fp_vector",
+        "MetricGroup": "HPC;TopdownL3;tma_L3_group;tma_light_operations_group",
+        "MetricName": "tma_fp_arith",
+        "MetricThreshold": "tma_fp_arith > 0.2 & tma_light_operations > 0.6",
+        "PublicDescription": "This metric represents overall arithmetic floating-point (FP) operations fraction the CPU has executed (retired). Note this metric's value may exceed its parent due to use of \"Uops\" CountDomain and FMA double-counting.",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Fraction of branches that are non-taken conditionals",
-        "MetricExpr": "BR_INST_RETIRED.NOT_TAKEN / BR_INST_RETIRED.ALL_BRANCHES",
-        "MetricGroup": "Bad;Branches;CodeGen;PGO",
-        "MetricName": "Cond_NT"
+        "BriefDescription": "This metric approximates arithmetic floating-point (FP) scalar uops fraction the CPU has retired",
+        "MetricExpr": "cpu@FP_ARITH_INST_RETIRED.SCALAR_SINGLE\\,umask\\=0x03@ / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Compute;Flops;TopdownL4;tma_L4_group;tma_fp_arith_group;tma_issue2P",
+        "MetricName": "tma_fp_scalar",
+        "MetricThreshold": "tma_fp_scalar > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6)",
+        "PublicDescription": "This metric approximates arithmetic floating-point (FP) scalar uops fraction the CPU has retired. May overcount due to FMA double counting. Related metrics: tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_0, tma_port_1, tma_port_5, tma_port_6, tma_ports_utilized_2",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Fraction of branches that are taken conditionals",
-        "MetricExpr": "(BR_INST_RETIRED.CONDITIONAL - BR_INST_RETIRED.NOT_TAKEN) / BR_INST_RETIRED.ALL_BRANCHES",
-        "MetricGroup": "Bad;Branches;CodeGen;PGO",
-        "MetricName": "Cond_TK"
+        "BriefDescription": "This metric approximates arithmetic floating-point (FP) vector uops fraction the CPU has retired aggregated across all vector widths",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "cpu@FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE\\,umask\\=0xfc@ / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Compute;Flops;TopdownL4;tma_L4_group;tma_fp_arith_group;tma_issue2P",
+        "MetricName": "tma_fp_vector",
+        "MetricThreshold": "tma_fp_vector > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6)",
+        "PublicDescription": "This metric approximates arithmetic floating-point (FP) vector uops fraction the CPU has retired aggregated across all vector widths. May overcount due to FMA double counting. Related metrics: tma_fp_scalar, tma_fp_vector_128b, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_0, tma_port_1, tma_port_5, tma_port_6, tma_ports_utilized_2",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Fraction of branches that are CALL or RET",
-        "MetricExpr": "(BR_INST_RETIRED.NEAR_CALL + BR_INST_RETIRED.NEAR_RETURN) / BR_INST_RETIRED.ALL_BRANCHES",
-        "MetricGroup": "Bad;Branches",
-        "MetricName": "CallRet"
+        "BriefDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 128-bit wide vectors",
+        "MetricExpr": "(FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE) / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Compute;Flops;TopdownL5;tma_L5_group;tma_fp_vector_group;tma_issue2P",
+        "MetricName": "tma_fp_vector_128b",
+        "MetricThreshold": "tma_fp_vector_128b > 0.1 & (tma_fp_vector > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6))",
+        "PublicDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 128-bit wide vectors. May overcount due to FMA double counting. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_0, tma_port_1, tma_port_5, tma_port_6, tma_ports_utilized_2",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Fraction of branches that are unconditional (direct or indirect) jumps",
-        "MetricExpr": "(BR_INST_RETIRED.NEAR_TAKEN - (BR_INST_RETIRED.CONDITIONAL - BR_INST_RETIRED.NOT_TAKEN) - 2 * BR_INST_RETIRED.NEAR_CALL) / BR_INST_RETIRED.ALL_BRANCHES",
-        "MetricGroup": "Bad;Branches",
-        "MetricName": "Jump"
+        "BriefDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 256-bit wide vectors",
+        "MetricExpr": "(FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE) / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Compute;Flops;TopdownL5;tma_L5_group;tma_fp_vector_group;tma_issue2P",
+        "MetricName": "tma_fp_vector_256b",
+        "MetricThreshold": "tma_fp_vector_256b > 0.1 & (tma_fp_vector > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6))",
+        "PublicDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 256-bit wide vectors. May overcount due to FMA double counting. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_512b, tma_port_0, tma_port_1, tma_port_5, tma_port_6, tma_ports_utilized_2",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Actual Average Latency for L1 data-cache miss demand load operations (in core cycles)",
-        "MetricExpr": "L1D_PEND_MISS.PENDING / (MEM_LOAD_RETIRED.L1_MISS + MEM_LOAD_RETIRED.FB_HIT)",
-        "MetricGroup": "Mem;MemoryBound;MemoryLat",
-        "MetricName": "Load_Miss_Real_Latency"
+        "BriefDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 512-bit wide vectors",
+        "MetricExpr": "(FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE) / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Compute;Flops;TopdownL5;tma_L5_group;tma_fp_vector_group;tma_issue2P",
+        "MetricName": "tma_fp_vector_512b",
+        "MetricThreshold": "tma_fp_vector_512b > 0.1 & (tma_fp_vector > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6))",
+        "PublicDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 512-bit wide vectors. May overcount due to FMA double counting. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_256b, tma_port_0, tma_port_1, tma_port_5, tma_port_6, tma_ports_utilized_2",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Memory-Level-Parallelism (average number of L1 miss demand load when there is at least one such miss. Per-Logical Processor)",
-        "MetricExpr": "L1D_PEND_MISS.PENDING / L1D_PEND_MISS.PENDING_CYCLES",
-        "MetricGroup": "Mem;MemoryBW;MemoryBound",
-        "MetricName": "MLP"
+        "BriefDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend",
+        "MetricExpr": "IDQ_UOPS_NOT_DELIVERED.CORE / tma_info_slots",
+        "MetricGroup": "PGO;TmaL1;TopdownL1;tma_L1_group",
+        "MetricName": "tma_frontend_bound",
+        "MetricThreshold": "tma_frontend_bound > 0.15",
+        "PublicDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend. Frontend denotes the first part of the processor core responsible to fetch operations that are executed later on by the Backend part. Within the Frontend; a branch predictor predicts the next address to fetch; cache-lines are fetched from the memory subsystem; parsed into instructions; and lastly decoded into micro-operations (uops). Ideally the Frontend can issue Pipeline_Width uops every cycle to the Backend. Frontend Bound denotes unutilized issue-slots when there is no Backend stall; i.e. bubbles where Frontend delivered no uops while Backend could have accepted them. For example; stalls due to instruction-cache misses would be categorized under Frontend Bound. Sample with: FRONTEND_RETIRED.LATENCY_GE_4_PS",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "L1 cache true misses per kilo instruction for retired demand loads",
-        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.L1_MISS / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem",
-        "MetricName": "L1MPKI"
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring fused instructions -- where one uop can represent multiple contiguous instructions",
+        "MetricExpr": "tma_light_operations * UOPS_RETIRED.MACRO_FUSED / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
+        "MetricName": "tma_fused_instructions",
+        "MetricThreshold": "tma_fused_instructions > 0.1 & tma_light_operations > 0.6",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring fused instructions -- where one uop can represent multiple contiguous instructions. The instruction pairs of CMP+JCC or DEC+JCC are commonly used examples.",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "L1 cache true misses per kilo instruction for all demand loads (including speculative)",
-        "MetricExpr": "1e3 * L2_RQSTS.ALL_DEMAND_DATA_RD / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem",
-        "MetricName": "L1MPKI_Load"
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or micro-coded sequences",
+        "MetricExpr": "(UOPS_RETIRED.RETIRE_SLOTS + UOPS_RETIRED.MACRO_FUSED - INST_RETIRED.ANY) / tma_info_slots",
+        "MetricGroup": "Retire;TmaL2;TopdownL2;tma_L2_group;tma_retiring_group",
+        "MetricName": "tma_heavy_operations",
+        "MetricThreshold": "tma_heavy_operations > 0.1",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or micro-coded sequences. This highly-correlates with the uop length of these instructions/sequences.",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "L2 cache true misses per kilo instruction for retired demand loads",
-        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.L2_MISS / INST_RETIRED.ANY",
-        "MetricGroup": "Backend;CacheMisses;Mem",
-        "MetricName": "L2MPKI"
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to instruction cache misses",
+        "MetricExpr": "(ICACHE_16B.IFDATA_STALL + 2 * cpu@ICACHE_16B.IFDATA_STALL\\,cmask\\=1\\,edge@) / tma_info_clks",
+        "MetricGroup": "BigFoot;FetchLat;IcMiss;TopdownL3;tma_L3_group;tma_fetch_latency_group",
+        "MetricName": "tma_icache_misses",
+        "MetricThreshold": "tma_icache_misses > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to instruction cache misses. Sample with: FRONTEND_RETIRED.L2_MISS_PS;FRONTEND_RETIRED.L1I_MISS_PS",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "L2 cache ([RKL+] true) misses per kilo instruction for all request types (including speculative)",
-        "MetricExpr": "1e3 * L2_RQSTS.MISS / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem;Offcore",
-        "MetricName": "L2MPKI_All"
+        "BriefDescription": "Measured Average Frequency for unhalted processors [GHz]",
+        "MetricExpr": "tma_info_turbo_utilization * TSC / 1e9 / duration_time",
+        "MetricGroup": "Power;Summary",
+        "MetricName": "tma_info_average_frequency"
     },
     {
-        "BriefDescription": "L2 cache ([RKL+] true) misses per kilo instruction for all demand loads  (including speculative)",
-        "MetricExpr": "1e3 * L2_RQSTS.DEMAND_DATA_RD_MISS / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem",
-        "MetricName": "L2MPKI_Load"
+        "BriefDescription": "Total pipeline cost of instruction fetch related bottlenecks by large code footprint programs (i-side cache; TLB and BTB misses)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "100 * tma_fetch_latency * (tma_itlb_misses + tma_icache_misses + tma_unknown_branches) / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches)",
+        "MetricGroup": "BigFoot;Fed;Frontend;IcMiss;MemoryTLB;tma_issueBC",
+        "MetricName": "tma_info_big_code",
+        "MetricThreshold": "tma_info_big_code > 20",
+        "PublicDescription": "Total pipeline cost of instruction fetch related bottlenecks by large code footprint programs (i-side cache; TLB and BTB misses). Related metrics: tma_info_branching_overhead"
     },
     {
-        "BriefDescription": "L2 cache hits per kilo instruction for all request types (including speculative)",
-        "MetricExpr": "1e3 * (L2_RQSTS.REFERENCES - L2_RQSTS.MISS) / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem",
-        "MetricName": "L2HPKI_All"
+        "BriefDescription": "Branch instructions per taken branch.",
+        "MetricExpr": "BR_INST_RETIRED.ALL_BRANCHES / BR_INST_RETIRED.NEAR_TAKEN",
+        "MetricGroup": "Branches;Fed;PGO",
+        "MetricName": "tma_info_bptkbranch"
     },
     {
-        "BriefDescription": "L2 cache hits per kilo instruction for all demand loads  (including speculative)",
-        "MetricExpr": "1e3 * L2_RQSTS.DEMAND_DATA_RD_HIT / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem",
-        "MetricName": "L2HPKI_Load"
+        "BriefDescription": "Branch Misprediction Cost: Fraction of TMA slots wasted per non-speculative branch misprediction (retired JEClear)",
+        "MetricExpr": "(tma_branch_mispredicts + tma_fetch_latency * tma_mispredicts_resteers / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches)) * tma_info_slots / BR_MISP_RETIRED.ALL_BRANCHES",
+        "MetricGroup": "Bad;BrMispredicts;tma_issueBM",
+        "MetricName": "tma_info_branch_misprediction_cost",
+        "PublicDescription": "Branch Misprediction Cost: Fraction of TMA slots wasted per non-speculative branch misprediction (retired JEClear). Related metrics: tma_branch_mispredicts, tma_info_mispredictions, tma_mispredicts_resteers"
     },
     {
-        "BriefDescription": "L3 cache true misses per kilo instruction for retired demand loads",
-        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.L3_MISS / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem",
-        "MetricName": "L3MPKI"
+        "BriefDescription": "Total pipeline cost of branch related instructions (used for program control-flow including function calls)",
+        "MetricExpr": "100 * ((BR_INST_RETIRED.CONDITIONAL + 3 * BR_INST_RETIRED.NEAR_CALL + (BR_INST_RETIRED.NEAR_TAKEN - (BR_INST_RETIRED.CONDITIONAL - BR_INST_RETIRED.NOT_TAKEN) - 2 * BR_INST_RETIRED.NEAR_CALL)) / tma_info_slots)",
+        "MetricGroup": "Ret;tma_issueBC",
+        "MetricName": "tma_info_branching_overhead",
+        "MetricThreshold": "tma_info_branching_overhead > 10",
+        "PublicDescription": "Total pipeline cost of branch related instructions (used for program control-flow including function calls). Related metrics: tma_info_big_code"
     },
     {
-        "BriefDescription": "Fill Buffer (FB) hits per kilo instructions for retired demand loads (L1D misses that merge into ongoing miss-handling entries)",
-        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.FB_HIT / INST_RETIRED.ANY",
-        "MetricGroup": "CacheMisses;Mem",
-        "MetricName": "FB_HPKI"
+        "BriefDescription": "Fraction of branches that are CALL or RET",
+        "MetricExpr": "(BR_INST_RETIRED.NEAR_CALL + BR_INST_RETIRED.NEAR_RETURN) / BR_INST_RETIRED.ALL_BRANCHES",
+        "MetricGroup": "Bad;Branches",
+        "MetricName": "tma_info_callret"
     },
     {
-        "BriefDescription": "Utilization of the core's Page Walker(s) serving STLB misses triggered by instruction/Load/Store accesses",
-        "MetricConstraint": "NO_NMI_WATCHDOG",
-        "MetricExpr": "(ITLB_MISSES.WALK_PENDING + DTLB_LOAD_MISSES.WALK_PENDING + DTLB_STORE_MISSES.WALK_PENDING + EPT.WALK_PENDING) / (2 * CORE_CLKS)",
-        "MetricGroup": "Mem;MemoryTLB",
-        "MetricName": "Page_Walks_Utilization"
+        "BriefDescription": "Per-Logical Processor actual clocks when the Logical Processor is active.",
+        "MetricExpr": "CPU_CLK_UNHALTED.THREAD",
+        "MetricGroup": "Pipeline",
+        "MetricName": "tma_info_clks"
     },
     {
-        "BriefDescription": "Average per-core data fill bandwidth to the L1 data cache [GB / sec]",
-        "MetricExpr": "64 * L1D.REPLACEMENT / 1e9 / duration_time",
-        "MetricGroup": "Mem;MemoryBW",
-        "MetricName": "L1D_Cache_Fill_BW"
+        "BriefDescription": "STLB (2nd level TLB) code speculative misses per kilo instruction (misses of any page-size that complete the page walk)",
+        "MetricExpr": "1e3 * ITLB_MISSES.WALK_COMPLETED / INST_RETIRED.ANY",
+        "MetricGroup": "Fed;MemoryTLB",
+        "MetricName": "tma_info_code_stlb_mpki"
     },
     {
-        "BriefDescription": "Average per-core data fill bandwidth to the L2 cache [GB / sec]",
-        "MetricExpr": "64 * L2_LINES_IN.ALL / 1e9 / duration_time",
-        "MetricGroup": "Mem;MemoryBW",
-        "MetricName": "L2_Cache_Fill_BW"
+        "BriefDescription": "Fraction of branches that are non-taken conditionals",
+        "MetricExpr": "BR_INST_RETIRED.NOT_TAKEN / BR_INST_RETIRED.ALL_BRANCHES",
+        "MetricGroup": "Bad;Branches;CodeGen;PGO",
+        "MetricName": "tma_info_cond_nt"
     },
     {
-        "BriefDescription": "Average per-core data fill bandwidth to the L3 cache [GB / sec]",
-        "MetricExpr": "64 * LONGEST_LAT_CACHE.MISS / 1e9 / duration_time",
-        "MetricGroup": "Mem;MemoryBW",
-        "MetricName": "L3_Cache_Fill_BW"
+        "BriefDescription": "Fraction of branches that are taken conditionals",
+        "MetricExpr": "(BR_INST_RETIRED.CONDITIONAL - BR_INST_RETIRED.NOT_TAKEN) / BR_INST_RETIRED.ALL_BRANCHES",
+        "MetricGroup": "Bad;Branches;CodeGen;PGO",
+        "MetricName": "tma_info_cond_tk"
     },
     {
-        "BriefDescription": "Average per-core data access bandwidth to the L3 cache [GB / sec]",
-        "MetricExpr": "64 * OFFCORE_REQUESTS.ALL_REQUESTS / 1e9 / duration_time",
-        "MetricGroup": "Mem;MemoryBW;Offcore",
-        "MetricName": "L3_Cache_Access_BW"
+        "BriefDescription": "Probability of Core Bound bottleneck hidden by SMT-profiling artifacts",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(100 * (1 - tma_core_bound / tma_ports_utilization if tma_core_bound < tma_ports_utilization else 1) if tma_info_smt_2t_utilization > 0.5 else 0)",
+        "MetricGroup": "Cor;SMT",
+        "MetricName": "tma_info_core_bound_likely",
+        "MetricThreshold": "tma_info_core_bound_likely > 0.5"
     },
     {
-        "BriefDescription": "Rate of silent evictions from the L2 cache per Kilo instruction where the evicted lines are dropped (no writeback to L3 or memory)",
-        "MetricExpr": "1e3 * L2_LINES_OUT.SILENT / Instructions",
-        "MetricGroup": "L2Evicts;Mem;Server",
-        "MetricName": "L2_Evictions_Silent_PKI"
+        "BriefDescription": "Core actual clocks when any Logical Processor is active on the Physical Core",
+        "MetricExpr": "(CPU_CLK_UNHALTED.THREAD / 2 * (1 + CPU_CLK_UNHALTED.ONE_THREAD_ACTIVE / CPU_CLK_UNHALTED.REF_XCLK) if #core_wide < 1 else (CPU_CLK_UNHALTED.THREAD_ANY / 2 if #SMT_on else tma_info_clks))",
+        "MetricGroup": "SMT",
+        "MetricName": "tma_info_core_clks"
     },
     {
-        "BriefDescription": "Rate of non silent evictions from the L2 cache per Kilo instruction",
-        "MetricExpr": "1e3 * L2_LINES_OUT.NON_SILENT / Instructions",
-        "MetricGroup": "L2Evicts;Mem;Server",
-        "MetricName": "L2_Evictions_NonSilent_PKI"
+        "BriefDescription": "Instructions Per Cycle across hyper-threads (per physical core)",
+        "MetricExpr": "INST_RETIRED.ANY / tma_info_core_clks",
+        "MetricGroup": "Ret;SMT;TmaL1;tma_L1_group",
+        "MetricName": "tma_info_coreipc"
     },
     {
-        "BriefDescription": "Average per-thread data fill bandwidth to the L1 data cache [GB / sec]",
-        "MetricExpr": "L1D_Cache_Fill_BW",
-        "MetricGroup": "Mem;MemoryBW",
-        "MetricName": "L1D_Cache_Fill_BW_1T"
+        "BriefDescription": "Cycles Per Instruction (per Logical Processor)",
+        "MetricExpr": "1 / tma_info_ipc",
+        "MetricGroup": "Mem;Pipeline",
+        "MetricName": "tma_info_cpi"
     },
     {
-        "BriefDescription": "Average per-thread data fill bandwidth to the L2 cache [GB / sec]",
-        "MetricExpr": "L2_Cache_Fill_BW",
-        "MetricGroup": "Mem;MemoryBW",
-        "MetricName": "L2_Cache_Fill_BW_1T"
+        "BriefDescription": "Average CPU Utilization",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricGroup": "HPC;Summary",
+        "MetricName": "tma_info_cpu_utilization"
     },
     {
-        "BriefDescription": "Average per-thread data fill bandwidth to the L3 cache [GB / sec]",
-        "MetricExpr": "L3_Cache_Fill_BW",
-        "MetricGroup": "Mem;MemoryBW",
-        "MetricName": "L3_Cache_Fill_BW_1T"
+        "BriefDescription": "Average Parallel L2 cache miss data reads",
+        "MetricExpr": "OFFCORE_REQUESTS_OUTSTANDING.ALL_DATA_RD / OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DATA_RD",
+        "MetricGroup": "Memory_BW;Offcore",
+        "MetricName": "tma_info_data_l2_mlp"
     },
     {
-        "BriefDescription": "Average per-thread data access bandwidth to the L3 cache [GB / sec]",
-        "MetricExpr": "L3_Cache_Access_BW",
-        "MetricGroup": "Mem;MemoryBW;Offcore",
-        "MetricName": "L3_Cache_Access_BW_1T"
+        "BriefDescription": "Average external Memory Bandwidth Use for reads and writes [GB / sec]",
+        "MetricExpr": "64 * (UNC_M_CAS_COUNT.RD + UNC_M_CAS_COUNT.WR) / 1e9 / duration_time",
+        "MetricGroup": "HPC;Mem;MemoryBW;SoC;tma_issueBW",
+        "MetricName": "tma_info_dram_bw_use",
+        "PublicDescription": "Average external Memory Bandwidth Use for reads and writes [GB / sec]. Related metrics: tma_fb_full, tma_info_memory_bandwidth, tma_mem_bandwidth, tma_sq_full"
     },
     {
-        "BriefDescription": "Average CPU Utilization",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
-        "MetricGroup": "HPC;Summary",
-        "MetricName": "CPU_Utilization"
+        "BriefDescription": "Fraction of Uops delivered by the DSB (aka Decoded ICache; or Uop Cache)",
+        "MetricExpr": "IDQ.DSB_UOPS / (IDQ.DSB_UOPS + IDQ.MITE_UOPS + IDQ.MS_UOPS)",
+        "MetricGroup": "DSB;Fed;FetchBW;tma_issueFB",
+        "MetricName": "tma_info_dsb_coverage",
+        "MetricThreshold": "tma_info_dsb_coverage < 0.7 & tma_info_ipc / 4 > 0.35",
+        "PublicDescription": "Fraction of Uops delivered by the DSB (aka Decoded ICache; or Uop Cache). Related metrics: tma_dsb_switches, tma_fetch_bandwidth, tma_info_dsb_misses, tma_info_iptb, tma_lcp"
     },
     {
-        "BriefDescription": "Measured Average Frequency for unhalted processors [GHz]",
-        "MetricExpr": "Turbo_Utilization * TSC / 1e9 / duration_time",
-        "MetricGroup": "Power;Summary",
-        "MetricName": "Average_Frequency"
+        "BriefDescription": "Total pipeline cost of DSB (uop cache) misses - subset of the Instruction_Fetch_BW Bottleneck",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "100 * (tma_fetch_latency * tma_dsb_switches / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches) + tma_fetch_bandwidth * tma_mite / (tma_dsb + tma_mite))",
+        "MetricGroup": "DSBmiss;Fed;tma_issueFB",
+        "MetricName": "tma_info_dsb_misses",
+        "MetricThreshold": "tma_info_dsb_misses > 10",
+        "PublicDescription": "Total pipeline cost of DSB (uop cache) misses - subset of the Instruction_Fetch_BW Bottleneck. Related metrics: tma_dsb_switches, tma_fetch_bandwidth, tma_info_dsb_coverage, tma_info_iptb, tma_lcp"
     },
     {
-        "BriefDescription": "Giga Floating Point Operations Per Second",
-        "MetricExpr": "(FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + 2 * FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + 4 * (FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE) + 8 * (FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE) + 16 * FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE) / 1e9 / duration_time",
-        "MetricGroup": "Cor;Flops;HPC",
-        "MetricName": "GFLOPs",
-        "PublicDescription": "Giga Floating Point Operations Per Second. Aggregate across all supported options of: FP precisions, scalar and vector instructions, vector-width and AMX engine."
+        "BriefDescription": "Average number of cycles of a switch from the DSB fetch-unit to MITE fetch unit - see DSB_Switches tree node for details.",
+        "MetricExpr": "DSB2MITE_SWITCHES.PENALTY_CYCLES / DSB2MITE_SWITCHES.COUNT",
+        "MetricGroup": "DSBmiss",
+        "MetricName": "tma_info_dsb_switch_cost"
     },
     {
-        "BriefDescription": "Average Frequency Utilization relative nominal frequency",
-        "MetricExpr": "CLKS / CPU_CLK_UNHALTED.REF_TSC",
-        "MetricGroup": "Power",
-        "MetricName": "Turbo_Utilization"
+        "BriefDescription": "Instruction-Level-Parallelism (average number of uops executed when there is execution) per-thread",
+        "MetricExpr": "UOPS_EXECUTED.THREAD / cpu@UOPS_EXECUTED.THREAD\\,cmask\\=1@",
+        "MetricGroup": "Cor;Pipeline;PortsUtil;SMT",
+        "MetricName": "tma_info_execute"
     },
     {
-        "BriefDescription": "Fraction of Core cycles where the core was running with power-delivery for baseline license level 0",
-        "MetricExpr": "(CORE_POWER.LVL0_TURBO_LICENSE / 2 / CORE_CLKS if #SMT_on else CORE_POWER.LVL0_TURBO_LICENSE / CORE_CLKS)",
-        "MetricGroup": "Power",
-        "MetricName": "Power_License0_Utilization",
-        "PublicDescription": "Fraction of Core cycles where the core was running with power-delivery for baseline license level 0.  This includes non-AVX codes, SSE, AVX 128-bit, and low-current AVX 256-bit codes."
+        "BriefDescription": "The ratio of Executed- by Issued-Uops",
+        "MetricExpr": "UOPS_EXECUTED.THREAD / UOPS_ISSUED.ANY",
+        "MetricGroup": "Cor;Pipeline",
+        "MetricName": "tma_info_execute_per_issue",
+        "PublicDescription": "The ratio of Executed- by Issued-Uops. Ratio > 1 suggests high rate of uop micro-fusions. Ratio < 1 suggest high rate of \"execute\" at rename stage."
     },
     {
-        "BriefDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 1",
-        "MetricExpr": "(CORE_POWER.LVL1_TURBO_LICENSE / 2 / CORE_CLKS if #SMT_on else CORE_POWER.LVL1_TURBO_LICENSE / CORE_CLKS)",
-        "MetricGroup": "Power",
-        "MetricName": "Power_License1_Utilization",
-        "PublicDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 1.  This includes high current AVX 256-bit instructions as well as low current AVX 512-bit instructions."
+        "BriefDescription": "Fill Buffer (FB) hits per kilo instructions for retired demand loads (L1D misses that merge into ongoing miss-handling entries)",
+        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.FB_HIT / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem",
+        "MetricName": "tma_info_fb_hpki"
     },
     {
-        "BriefDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 2 (introduced in SKX)",
-        "MetricExpr": "(CORE_POWER.LVL2_TURBO_LICENSE / 2 / CORE_CLKS if #SMT_on else CORE_POWER.LVL2_TURBO_LICENSE / CORE_CLKS)",
-        "MetricGroup": "Power",
-        "MetricName": "Power_License2_Utilization",
-        "PublicDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 2 (introduced in SKX).  This includes high current AVX 512-bit instructions."
+        "BriefDescription": "Average number of Uops issued by front-end when it issued something",
+        "MetricExpr": "UOPS_ISSUED.ANY / cpu@UOPS_ISSUED.ANY\\,cmask\\=1@",
+        "MetricGroup": "Fed;FetchBW",
+        "MetricName": "tma_info_fetch_upc"
     },
     {
-        "BriefDescription": "Fraction of cycles where both hardware Logical Processors were active",
-        "MetricExpr": "(1 - CPU_CLK_UNHALTED.ONE_THREAD_ACTIVE / (CPU_CLK_UNHALTED.REF_XCLK_ANY / 2) if #SMT_on else 0)",
-        "MetricGroup": "SMT",
-        "MetricName": "SMT_2T_Utilization"
+        "BriefDescription": "Floating Point Operations Per Cycle",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + 2 * FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + 4 * (FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE) + 8 * (FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE) + 16 * FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE) / tma_info_core_clks",
+        "MetricGroup": "Flops;Ret",
+        "MetricName": "tma_info_flopc"
     },
     {
-        "BriefDescription": "Fraction of cycles spent in the Operating System (OS) Kernel mode",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "OS",
-        "MetricName": "Kernel_Utilization"
+        "BriefDescription": "Actual per-core usage of the Floating Point non-X87 execution units (regardless of precision or vector-width)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(cpu@FP_ARITH_INST_RETIRED.SCALAR_SINGLE\\,umask\\=0x03@ + cpu@FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE\\,umask\\=0xfc@) / (2 * tma_info_core_clks)",
+        "MetricGroup": "Cor;Flops;HPC",
+        "MetricName": "tma_info_fp_arith_utilization",
+        "PublicDescription": "Actual per-core usage of the Floating Point non-X87 execution units (regardless of precision or vector-width). Values > 1 are possible due to ([BDW+] Fused-Multiply Add (FMA) counting - common; [ADL+] use all of ADD/MUL/FMA in Scalar or 128/256-bit vectors - less common)."
     },
     {
-        "BriefDescription": "Cycles Per Instruction for the Operating System (OS) Kernel mode",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / INST_RETIRED.ANY_P:k",
-        "MetricGroup": "OS",
-        "MetricName": "Kernel_CPI"
+        "BriefDescription": "Giga Floating Point Operations Per Second",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + 2 * FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + 4 * (FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE) + 8 * (FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE) + 16 * FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE) / 1e9 / duration_time",
+        "MetricGroup": "Cor;Flops;HPC",
+        "MetricName": "tma_info_gflops",
+        "PublicDescription": "Giga Floating Point Operations Per Second. Aggregate across all supported options of: FP precisions, scalar and vector instructions, vector-width and AMX engine."
     },
     {
-        "BriefDescription": "Average external Memory Bandwidth Use for reads and writes [GB / sec]",
-        "MetricExpr": "64 * (UNC_M_CAS_COUNT.RD + UNC_M_CAS_COUNT.WR) / 1e9 / duration_time",
-        "MetricGroup": "HPC;Mem;MemoryBW;SoC",
-        "MetricName": "DRAM_BW_Use"
+        "BriefDescription": "Total pipeline cost of Instruction Cache misses - subset of the Big_Code Bottleneck",
+        "MetricExpr": "100 * (tma_fetch_latency * tma_icache_misses / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches))",
+        "MetricGroup": "Fed;FetchLat;IcMiss;tma_issueFL",
+        "MetricName": "tma_info_ic_misses",
+        "MetricThreshold": "tma_info_ic_misses > 5",
+        "PublicDescription": "Total pipeline cost of Instruction Cache misses - subset of the Big_Code Bottleneck. Related metrics: "
     },
     {
-        "BriefDescription": "Average latency of data read request to external memory (in nanoseconds). Accounts for demand loads and L1/L2 prefetches",
-        "MetricExpr": "1e9 * (UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD / UNC_CHA_TOR_INSERTS.IA_MISS_DRD) / (Socket_CLKS / duration_time)",
-        "MetricGroup": "Mem;MemoryLat;SoC",
-        "MetricName": "MEM_Read_Latency"
+        "BriefDescription": "Average Latency for L1 instruction cache misses",
+        "MetricExpr": "ICACHE_16B.IFDATA_STALL / cpu@ICACHE_16B.IFDATA_STALL\\,cmask\\=1\\,edge@ + 2",
+        "MetricGroup": "Fed;FetchLat;IcMiss",
+        "MetricName": "tma_info_icache_miss_latency"
     },
     {
-        "BriefDescription": "Average number of parallel data read requests to external memory. Accounts for demand loads and L1/L2 prefetches",
-        "MetricExpr": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD / UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD@thresh\\=1@",
-        "MetricGroup": "Mem;MemoryBW;SoC",
-        "MetricName": "MEM_Parallel_Reads"
+        "BriefDescription": "Instruction-Level-Parallelism (average number of uops executed when there is execution) per-core",
+        "MetricExpr": "UOPS_EXECUTED.THREAD / (UOPS_EXECUTED.CORE_CYCLES_GE_1 / 2 if #SMT_on else UOPS_EXECUTED.CORE_CYCLES_GE_1)",
+        "MetricGroup": "Backend;Cor;Pipeline;PortsUtil",
+        "MetricName": "tma_info_ilp"
     },
     {
-        "BriefDescription": "Average latency of data read request to external DRAM memory [in nanoseconds]. Accounts for demand loads and L1/L2 data-read prefetches",
-        "MetricExpr": "1e9 * (UNC_M_RPQ_OCCUPANCY / UNC_M_RPQ_INSERTS) / imc_0@event\\=0x0@",
-        "MetricGroup": "Mem;MemoryLat;Server;SoC",
-        "MetricName": "MEM_DRAM_Read_Latency"
+        "BriefDescription": "Total pipeline cost of instruction fetch bandwidth related bottlenecks",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "100 * (tma_frontend_bound - tma_fetch_latency * tma_mispredicts_resteers / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches)) - tma_info_big_code",
+        "MetricGroup": "Fed;FetchBW;Frontend",
+        "MetricName": "tma_info_instruction_fetch_bw",
+        "MetricThreshold": "tma_info_instruction_fetch_bw > 20"
     },
     {
-        "BriefDescription": "Average IO (network or disk) Bandwidth Use for Writes [GB / sec]",
-        "MetricExpr": "(UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART0 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART1 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART2 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART3) * 4 / 1e9 / duration_time",
-        "MetricGroup": "IoBW;Mem;Server;SoC",
-        "MetricName": "IO_Write_BW"
+        "BriefDescription": "Total number of retired Instructions",
+        "MetricExpr": "INST_RETIRED.ANY",
+        "MetricGroup": "Summary;TmaL1;tma_L1_group",
+        "MetricName": "tma_info_instructions",
+        "PublicDescription": "Total number of retired Instructions. Sample with: INST_RETIRED.PREC_DIST"
     },
     {
         "BriefDescription": "Average IO (network or disk) Bandwidth Use for Reads [GB / sec]",
         "MetricExpr": "(UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 + UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 + UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 + UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3) * 4 / 1e9 / duration_time",
         "MetricGroup": "IoBW;Mem;Server;SoC",
-        "MetricName": "IO_Read_BW"
+        "MetricName": "tma_info_io_read_bw"
     },
     {
-        "BriefDescription": "Socket actual clocks when any core is active on that socket",
-        "MetricExpr": "cha_0@event\\=0x0@",
-        "MetricGroup": "SoC",
-        "MetricName": "Socket_CLKS"
+        "BriefDescription": "Average IO (network or disk) Bandwidth Use for Writes [GB / sec]",
+        "MetricExpr": "(UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART0 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART1 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART2 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART3) * 4 / 1e9 / duration_time",
+        "MetricGroup": "IoBW;Mem;Server;SoC",
+        "MetricName": "tma_info_io_write_bw"
     },
     {
-        "BriefDescription": "Instructions per Far Branch ( Far Branches apply upon transition from application to operating system, handling interrupts, exceptions) [lower number means higher occurrence rate]",
-        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.FAR_BRANCH:u",
-        "MetricGroup": "Branches;OS",
-        "MetricName": "IpFarBranch"
+        "BriefDescription": "Instructions per FP Arithmetic instruction (lower number means higher occurrence rate)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "INST_RETIRED.ANY / (cpu@FP_ARITH_INST_RETIRED.SCALAR_SINGLE\\,umask\\=0x03@ + cpu@FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE\\,umask\\=0xfc@)",
+        "MetricGroup": "Flops;InsType",
+        "MetricName": "tma_info_iparith",
+        "MetricThreshold": "tma_info_iparith < 10",
+        "PublicDescription": "Instructions per FP Arithmetic instruction (lower number means higher occurrence rate). May undercount due to FMA double counting. Approximated prior to BDW."
     },
     {
-        "BriefDescription": "Uncore frequency per die [GHZ]",
-        "MetricExpr": "Socket_CLKS / #num_dies / duration_time / 1e9",
-        "MetricGroup": "SoC",
-        "MetricName": "UNCORE_FREQ"
+        "BriefDescription": "Instructions per FP Arithmetic AVX/SSE 128-bit instruction (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE)",
+        "MetricGroup": "Flops;FpVector;InsType",
+        "MetricName": "tma_info_iparith_avx128",
+        "MetricThreshold": "tma_info_iparith_avx128 < 10",
+        "PublicDescription": "Instructions per FP Arithmetic AVX/SSE 128-bit instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
     },
     {
-        "BriefDescription": "Percentage of time spent in the active CPU power state C0",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
-        "MetricName": "cpu_utilization",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Instructions per FP Arithmetic AVX* 256-bit instruction (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE)",
+        "MetricGroup": "Flops;FpVector;InsType",
+        "MetricName": "tma_info_iparith_avx256",
+        "MetricThreshold": "tma_info_iparith_avx256 < 10",
+        "PublicDescription": "Instructions per FP Arithmetic AVX* 256-bit instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
     },
     {
-        "BriefDescription": "CPU operating frequency (in GHz)",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / duration_time",
-        "MetricName": "cpu_operating_frequency",
-        "ScaleUnit": "1GHz"
+        "BriefDescription": "Instructions per FP Arithmetic AVX 512-bit instruction (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE)",
+        "MetricGroup": "Flops;FpVector;InsType",
+        "MetricName": "tma_info_iparith_avx512",
+        "MetricThreshold": "tma_info_iparith_avx512 < 10",
+        "PublicDescription": "Instructions per FP Arithmetic AVX 512-bit instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
     },
     {
-        "BriefDescription": "Cycles per instruction retired; indicating how much time each executed instruction took; in units of cycles.",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD / INST_RETIRED.ANY",
-        "MetricName": "cpi",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per FP Arithmetic Scalar Double-Precision instruction (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / FP_ARITH_INST_RETIRED.SCALAR_DOUBLE",
+        "MetricGroup": "Flops;FpScalar;InsType",
+        "MetricName": "tma_info_iparith_scalar_dp",
+        "MetricThreshold": "tma_info_iparith_scalar_dp < 10",
+        "PublicDescription": "Instructions per FP Arithmetic Scalar Double-Precision instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
     },
     {
-        "BriefDescription": "The ratio of number of completed memory load instructions to the total number completed instructions",
-        "MetricExpr": "MEM_INST_RETIRED.ALL_LOADS / INST_RETIRED.ANY",
-        "MetricName": "loads_per_instr",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per FP Arithmetic Scalar Single-Precision instruction (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / FP_ARITH_INST_RETIRED.SCALAR_SINGLE",
+        "MetricGroup": "Flops;FpScalar;InsType",
+        "MetricName": "tma_info_iparith_scalar_sp",
+        "MetricThreshold": "tma_info_iparith_scalar_sp < 10",
+        "PublicDescription": "Instructions per FP Arithmetic Scalar Single-Precision instruction (lower number means higher occurrence rate). May undercount due to FMA double counting."
     },
     {
-        "BriefDescription": "The ratio of number of completed memory store instructions to the total number completed instructions",
-        "MetricExpr": "MEM_INST_RETIRED.ALL_STORES / INST_RETIRED.ANY",
-        "MetricName": "stores_per_instr",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per Branch (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.ALL_BRANCHES",
+        "MetricGroup": "Branches;Fed;InsType",
+        "MetricName": "tma_info_ipbranch",
+        "MetricThreshold": "tma_info_ipbranch < 8"
     },
     {
-        "BriefDescription": "Ratio of number of requests missing L1 data cache (includes data+rfo w/ prefetches) to the total number of completed instructions",
-        "MetricExpr": "L1D.REPLACEMENT / INST_RETIRED.ANY",
-        "MetricName": "l1d_mpi",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions Per Cycle (per Logical Processor)",
+        "MetricExpr": "INST_RETIRED.ANY / tma_info_clks",
+        "MetricGroup": "Ret;Summary",
+        "MetricName": "tma_info_ipc"
     },
     {
-        "BriefDescription": "Ratio of number of demand load requests hitting in L1 data cache to the total number of completed instructions ",
-        "MetricExpr": "MEM_LOAD_RETIRED.L1_HIT / INST_RETIRED.ANY",
-        "MetricName": "l1d_demand_data_read_hits_per_instr",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per (near) call (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.NEAR_CALL",
+        "MetricGroup": "Branches;Fed;PGO",
+        "MetricName": "tma_info_ipcall",
+        "MetricThreshold": "tma_info_ipcall < 200"
     },
     {
-        "BriefDescription": "Ratio of number of code read requests missing in L1 instruction cache (includes prefetches) to the total number of completed instructions",
-        "MetricExpr": "L2_RQSTS.ALL_CODE_RD / INST_RETIRED.ANY",
-        "MetricName": "l1_i_code_read_misses_with_prefetches_per_instr",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per non-speculative DSB miss (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / FRONTEND_RETIRED.ANY_DSB_MISS",
+        "MetricGroup": "DSBmiss;Fed",
+        "MetricName": "tma_info_ipdsb_miss_ret",
+        "MetricThreshold": "tma_info_ipdsb_miss_ret < 50"
     },
     {
-        "BriefDescription": "Ratio of number of completed demand load requests hitting in L2 cache to the total number of completed instructions ",
-        "MetricExpr": "MEM_LOAD_RETIRED.L2_HIT / INST_RETIRED.ANY",
-        "MetricName": "l2_demand_data_read_hits_per_instr",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per Far Branch ( Far Branches apply upon transition from application to operating system, handling interrupts, exceptions) [lower number means higher occurrence rate]",
+        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.FAR_BRANCH:u",
+        "MetricGroup": "Branches;OS",
+        "MetricName": "tma_info_ipfarbranch",
+        "MetricThreshold": "tma_info_ipfarbranch < 1e6"
     },
     {
-        "BriefDescription": "Ratio of number of requests missing L2 cache (includes code+data+rfo w/ prefetches) to the total number of completed instructions",
-        "MetricExpr": "L2_LINES_IN.ALL / INST_RETIRED.ANY",
-        "MetricName": "l2_mpi",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per Floating Point (FP) Operation (lower number means higher occurrence rate)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "INST_RETIRED.ANY / (FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE + 2 * FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + 4 * (FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE) + 8 * (FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE) + 16 * FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE)",
+        "MetricGroup": "Flops;InsType",
+        "MetricName": "tma_info_ipflop",
+        "MetricThreshold": "tma_info_ipflop < 10"
     },
     {
-        "BriefDescription": "Ratio of number of completed data read request missing L2 cache to the total number of completed instructions",
-        "MetricExpr": "MEM_LOAD_RETIRED.L2_MISS / INST_RETIRED.ANY",
-        "MetricName": "l2_demand_data_read_mpi",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per Load (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / MEM_INST_RETIRED.ALL_LOADS",
+        "MetricGroup": "InsType",
+        "MetricName": "tma_info_ipload",
+        "MetricThreshold": "tma_info_ipload < 3"
     },
     {
-        "BriefDescription": "Ratio of number of code read request missing L2 cache to the total number of completed instructions",
-        "MetricExpr": "L2_RQSTS.CODE_RD_MISS / INST_RETIRED.ANY",
-        "MetricName": "l2_demand_code_mpi",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per retired mispredicts for indirect CALL or JMP branches (lower number means higher occurrence rate).",
+        "MetricExpr": "tma_info_instructions / (UOPS_RETIRED.RETIRE_SLOTS / UOPS_ISSUED.ANY * cpu@BR_MISP_EXEC.ALL_BRANCHES\\,umask\\=0xE4@)",
+        "MetricGroup": "Bad;BrMispredicts",
+        "MetricName": "tma_info_ipmisp_indirect",
+        "MetricThreshold": "tma_info_ipmisp_indirect < 1e3"
     },
     {
-        "BriefDescription": "Ratio of number of data read requests missing last level core cache (includes demand w/ prefetches) to the total number of completed instructions",
-        "MetricExpr": "cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x12D4043300000000@ / INST_RETIRED.ANY",
-        "MetricName": "llc_data_read_mpi_demand_plus_prefetch",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Number of Instructions per non-speculative Branch Misprediction (JEClear) (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / BR_MISP_RETIRED.ALL_BRANCHES",
+        "MetricGroup": "Bad;BadSpec;BrMispredicts",
+        "MetricName": "tma_info_ipmispredict",
+        "MetricThreshold": "tma_info_ipmispredict < 200"
     },
     {
-        "BriefDescription": "Ratio of number of code read requests missing last level core cache (includes demand w/ prefetches) to the total number of completed instructions",
-        "MetricExpr": "cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x12CC023300000000@ / INST_RETIRED.ANY",
-        "MetricName": "llc_code_read_mpi_demand_plus_prefetch",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Instructions per Store (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / MEM_INST_RETIRED.ALL_STORES",
+        "MetricGroup": "InsType",
+        "MetricName": "tma_info_ipstore",
+        "MetricThreshold": "tma_info_ipstore < 8"
     },
     {
-        "BriefDescription": "Average latency of a last level cache (LLC) demand and prefetch data read miss (read memory access) in nano seconds",
-        "MetricExpr": "1e9 * (cha@unc_cha_tor_occupancy.ia_miss\\,config1\\=0x4043300000000@ / cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043300000000@) / (UNC_CHA_CLOCKTICKS / (#num_cores / #num_packages * #num_packages)) * duration_time",
-        "MetricName": "llc_data_read_demand_plus_prefetch_miss_latency",
-        "ScaleUnit": "1ns"
+        "BriefDescription": "Instructions per Software prefetch instruction (of any type: NTA/T0/T1/T2/Prefetch) (lower number means higher occurrence rate)",
+        "MetricExpr": "INST_RETIRED.ANY / cpu@SW_PREFETCH_ACCESS.T0\\,umask\\=0xF@",
+        "MetricGroup": "Prefetches",
+        "MetricName": "tma_info_ipswpf",
+        "MetricThreshold": "tma_info_ipswpf < 100"
     },
     {
-        "BriefDescription": "Average latency of a last level cache (LLC) demand and prefetch data read miss (read memory access) addressed to local memory in nano seconds",
-        "MetricExpr": "1e9 * (cha@unc_cha_tor_occupancy.ia_miss\\,config1\\=0x4043200000000@ / cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043200000000@) / (UNC_CHA_CLOCKTICKS / (#num_cores / #num_packages * #num_packages)) * duration_time",
-        "MetricName": "llc_data_read_demand_plus_prefetch_miss_latency_for_local_requests",
-        "ScaleUnit": "1ns"
+        "BriefDescription": "Instruction per taken branch",
+        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.NEAR_TAKEN",
+        "MetricGroup": "Branches;Fed;FetchBW;Frontend;PGO;tma_issueFB",
+        "MetricName": "tma_info_iptb",
+        "MetricThreshold": "tma_info_iptb < 9",
+        "PublicDescription": "Instruction per taken branch. Related metrics: tma_dsb_switches, tma_fetch_bandwidth, tma_info_dsb_coverage, tma_info_dsb_misses, tma_lcp"
     },
     {
-        "BriefDescription": "Average latency of a last level cache (LLC) demand and prefetch data read miss (read memory access) addressed to remote memory in nano seconds",
-        "MetricExpr": "1e9 * (cha@unc_cha_tor_occupancy.ia_miss\\,config1\\=0x4043100000000@ / cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043100000000@) / (UNC_CHA_CLOCKTICKS / (#num_cores / #num_packages * #num_packages)) * duration_time",
-        "MetricName": "llc_data_read_demand_plus_prefetch_miss_latency_for_remote_requests",
-        "ScaleUnit": "1ns"
+        "BriefDescription": "Instructions per speculative Unknown Branch Misprediction (BAClear) (lower number means higher occurrence rate)",
+        "MetricExpr": "tma_info_instructions / BACLEARS.ANY",
+        "MetricGroup": "Fed",
+        "MetricName": "tma_info_ipunknown_branch"
     },
     {
-        "BriefDescription": "Ratio of number of completed page walks (for all page sizes) caused by a code fetch to the total number of completed instructions",
-        "MetricExpr": "ITLB_MISSES.WALK_COMPLETED / INST_RETIRED.ANY",
-        "MetricName": "itlb_mpi",
-        "PublicDescription": "Ratio of number of completed page walks (for all page sizes) caused by a code fetch to the total number of completed instructions. This implies it missed in the ITLB (Instruction TLB) and further levels of TLB.",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Fraction of branches that are unconditional (direct or indirect) jumps",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(BR_INST_RETIRED.NEAR_TAKEN - (BR_INST_RETIRED.CONDITIONAL - BR_INST_RETIRED.NOT_TAKEN) - 2 * BR_INST_RETIRED.NEAR_CALL) / BR_INST_RETIRED.ALL_BRANCHES",
+        "MetricGroup": "Bad;Branches",
+        "MetricName": "tma_info_jump"
     },
     {
-        "BriefDescription": "Ratio of number of completed page walks (for 2 megabyte and 4 megabyte page sizes) caused by a code fetch to the total number of completed instructions",
-        "MetricExpr": "ITLB_MISSES.WALK_COMPLETED_2M_4M / INST_RETIRED.ANY",
-        "MetricName": "itlb_large_page_mpi",
-        "PublicDescription": "Ratio of number of completed page walks (for 2 megabyte and 4 megabyte page sizes) caused by a code fetch to the total number of completed instructions. This implies it missed in the Instruction Translation Lookaside Buffer (ITLB) and further levels of TLB.",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Cycles Per Instruction for the Operating System (OS) Kernel mode",
+        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / INST_RETIRED.ANY_P:k",
+        "MetricGroup": "OS",
+        "MetricName": "tma_info_kernel_cpi"
     },
     {
-        "BriefDescription": "Ratio of number of completed page walks (for all page sizes) caused by demand data loads to the total number of completed instructions",
-        "MetricExpr": "DTLB_LOAD_MISSES.WALK_COMPLETED / INST_RETIRED.ANY",
-        "MetricName": "dtlb_load_mpi",
-        "PublicDescription": "Ratio of number of completed page walks (for all page sizes) caused by demand data loads to the total number of completed instructions. This implies it missed in the DTLB and further levels of TLB.",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Fraction of cycles spent in the Operating System (OS) Kernel mode",
+        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / CPU_CLK_UNHALTED.THREAD",
+        "MetricGroup": "OS",
+        "MetricName": "tma_info_kernel_utilization",
+        "MetricThreshold": "tma_info_kernel_utilization > 0.05"
     },
     {
-        "BriefDescription": "Ratio of number of completed page walks (for 2 megabyte page sizes) caused by demand data loads to the total number of completed instructions",
-        "MetricExpr": "DTLB_LOAD_MISSES.WALK_COMPLETED_2M_4M / INST_RETIRED.ANY",
-        "MetricName": "dtlb_2mb_large_page_load_mpi",
-        "PublicDescription": "Ratio of number of completed page walks (for 2 megabyte page sizes) caused by demand data loads to the total number of completed instructions. This implies it missed in the Data Translation Lookaside Buffer (DTLB) and further levels of TLB.",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Average per-core data fill bandwidth to the L1 data cache [GB / sec]",
+        "MetricExpr": "64 * L1D.REPLACEMENT / 1e9 / duration_time",
+        "MetricGroup": "Mem;MemoryBW",
+        "MetricName": "tma_info_l1d_cache_fill_bw"
     },
     {
-        "BriefDescription": "Ratio of number of completed page walks (for all page sizes) caused by demand data stores to the total number of completed instructions",
-        "MetricExpr": "DTLB_STORE_MISSES.WALK_COMPLETED / INST_RETIRED.ANY",
-        "MetricName": "dtlb_store_mpi",
-        "PublicDescription": "Ratio of number of completed page walks (for all page sizes) caused by demand data stores to the total number of completed instructions. This implies it missed in the DTLB and further levels of TLB.",
-        "ScaleUnit": "1per_instr"
+        "BriefDescription": "Average per-thread data fill bandwidth to the L1 data cache [GB / sec]",
+        "MetricExpr": "tma_info_l1d_cache_fill_bw",
+        "MetricGroup": "Mem;MemoryBW",
+        "MetricName": "tma_info_l1d_cache_fill_bw_1t"
     },
     {
-        "BriefDescription": "Memory read that miss the last level cache (LLC) addressed to local DRAM as a percentage of total memory read accesses, does not include LLC prefetches.",
-        "MetricExpr": "cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043200000000@ / (cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043200000000@ + cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043100000000@)",
-        "MetricName": "numa_reads_addressed_to_local_dram",
-        "ScaleUnit": "100%"
+        "BriefDescription": "L1 cache true misses per kilo instruction for retired demand loads",
+        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.L1_MISS / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem",
+        "MetricName": "tma_info_l1mpki"
     },
     {
-        "BriefDescription": "Memory reads that miss the last level cache (LLC) addressed to remote DRAM as a percentage of total memory read accesses, does not include LLC prefetches.",
-        "MetricExpr": "cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043100000000@ / (cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043200000000@ + cha@unc_cha_tor_inserts.ia_miss\\,config1\\=0x4043100000000@)",
-        "MetricName": "numa_reads_addressed_to_remote_dram",
-        "ScaleUnit": "100%"
+        "BriefDescription": "L1 cache true misses per kilo instruction for all demand loads (including speculative)",
+        "MetricExpr": "1e3 * L2_RQSTS.ALL_DEMAND_DATA_RD / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem",
+        "MetricName": "tma_info_l1mpki_load"
     },
     {
-        "BriefDescription": "Uncore operating frequency in GHz",
-        "MetricExpr": "UNC_CHA_CLOCKTICKS / (#num_cores / #num_packages * #num_packages) / 1e9 / duration_time",
-        "MetricName": "uncore_frequency",
-        "ScaleUnit": "1GHz"
+        "BriefDescription": "Average per-core data fill bandwidth to the L2 cache [GB / sec]",
+        "MetricExpr": "64 * L2_LINES_IN.ALL / 1e9 / duration_time",
+        "MetricGroup": "Mem;MemoryBW",
+        "MetricName": "tma_info_l2_cache_fill_bw"
     },
     {
-        "BriefDescription": "Intel(R) Ultra Path Interconnect (UPI) data transmit bandwidth (MB/sec)",
-        "MetricExpr": "UNC_UPI_TxL_FLITS.ALL_DATA * 7.111111111111111 / 1e6 / duration_time",
-        "MetricName": "upi_data_transmit_bw",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "Average per-thread data fill bandwidth to the L2 cache [GB / sec]",
+        "MetricExpr": "tma_info_l2_cache_fill_bw",
+        "MetricGroup": "Mem;MemoryBW",
+        "MetricName": "tma_info_l2_cache_fill_bw_1t"
     },
     {
-        "BriefDescription": "DDR memory read bandwidth (MB/sec)",
-        "MetricExpr": "UNC_M_CAS_COUNT.RD * 64 / 1e6 / duration_time",
-        "MetricName": "memory_bandwidth_read",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "Rate of non silent evictions from the L2 cache per Kilo instruction",
+        "MetricExpr": "1e3 * L2_LINES_OUT.NON_SILENT / tma_info_instructions",
+        "MetricGroup": "L2Evicts;Mem;Server",
+        "MetricName": "tma_info_l2_evictions_nonsilent_pki"
     },
     {
-        "BriefDescription": "DDR memory write bandwidth (MB/sec)",
-        "MetricExpr": "UNC_M_CAS_COUNT.WR * 64 / 1e6 / duration_time",
-        "MetricName": "memory_bandwidth_write",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "Rate of silent evictions from the L2 cache per Kilo instruction where the evicted lines are dropped (no writeback to L3 or memory)",
+        "MetricExpr": "1e3 * L2_LINES_OUT.SILENT / tma_info_instructions",
+        "MetricGroup": "L2Evicts;Mem;Server",
+        "MetricName": "tma_info_l2_evictions_silent_pki"
     },
     {
-        "BriefDescription": "DDR memory bandwidth (MB/sec)",
-        "MetricExpr": "(UNC_M_CAS_COUNT.RD + UNC_M_CAS_COUNT.WR) * 64 / 1e6 / duration_time",
-        "MetricName": "memory_bandwidth_total",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "L2 cache hits per kilo instruction for all request types (including speculative)",
+        "MetricExpr": "1e3 * (L2_RQSTS.REFERENCES - L2_RQSTS.MISS) / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem",
+        "MetricName": "tma_info_l2hpki_all"
     },
     {
-        "BriefDescription": "Bandwidth of IO reads that are initiated by end device controllers that are requesting memory from the CPU.",
-        "MetricExpr": "(UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART0 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART1 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART2 + UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.PART3) * 4 / 1e6 / duration_time",
-        "MetricName": "io_bandwidth_disk_or_network_writes",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "L2 cache hits per kilo instruction for all demand loads  (including speculative)",
+        "MetricExpr": "1e3 * L2_RQSTS.DEMAND_DATA_RD_HIT / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem",
+        "MetricName": "tma_info_l2hpki_load"
     },
     {
-        "BriefDescription": "Bandwidth of IO writes that are initiated by end device controllers that are writing memory to the CPU.",
-        "MetricExpr": "(UNC_IIO_PAYLOAD_BYTES_IN.MEM_WRITE.PART0 + UNC_IIO_PAYLOAD_BYTES_IN.MEM_WRITE.PART1 + UNC_IIO_PAYLOAD_BYTES_IN.MEM_WRITE.PART2 + UNC_IIO_PAYLOAD_BYTES_IN.MEM_WRITE.PART3) * 4 / 1e6 / duration_time",
-        "MetricName": "io_bandwidth_disk_or_network_reads",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "L2 cache true misses per kilo instruction for retired demand loads",
+        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.L2_MISS / INST_RETIRED.ANY",
+        "MetricGroup": "Backend;CacheMisses;Mem",
+        "MetricName": "tma_info_l2mpki"
     },
     {
-        "BriefDescription": "Uops delivered from decoded instruction cache (decoded stream buffer or DSB) as a percent of total uops delivered to Instruction Decode Queue",
-        "MetricExpr": "IDQ.DSB_UOPS / UOPS_ISSUED.ANY",
-        "MetricName": "percent_uops_delivered_from_decoded_icache",
-        "ScaleUnit": "100%"
+        "BriefDescription": "L2 cache ([RKL+] true) misses per kilo instruction for all request types (including speculative)",
+        "MetricExpr": "1e3 * L2_RQSTS.MISS / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem;Offcore",
+        "MetricName": "tma_info_l2mpki_all"
     },
     {
-        "BriefDescription": "Uops delivered from legacy decode pipeline (Micro-instruction Translation Engine or MITE) as a percent of total uops delivered to Instruction Decode Queue",
-        "MetricExpr": "IDQ.MITE_UOPS / UOPS_ISSUED.ANY",
-        "MetricName": "percent_uops_delivered_from_legacy_decode_pipeline",
-        "ScaleUnit": "100%"
+        "BriefDescription": "L2 cache true code cacheline misses per kilo instruction",
+        "MetricExpr": "1e3 * FRONTEND_RETIRED.L2_MISS / INST_RETIRED.ANY",
+        "MetricGroup": "IcMiss",
+        "MetricName": "tma_info_l2mpki_code"
     },
     {
-        "BriefDescription": "Uops delivered from microcode sequencer (MS) as a percent of total uops delivered to Instruction Decode Queue",
-        "MetricExpr": "IDQ.MS_UOPS / UOPS_ISSUED.ANY",
-        "MetricName": "percent_uops_delivered_from_microcode_sequencer",
-        "ScaleUnit": "100%"
+        "BriefDescription": "L2 cache speculative code cacheline misses per kilo instruction",
+        "MetricExpr": "1e3 * L2_RQSTS.CODE_RD_MISS / INST_RETIRED.ANY",
+        "MetricGroup": "IcMiss",
+        "MetricName": "tma_info_l2mpki_code_all"
     },
     {
-        "BriefDescription": "Bandwidth (MB/sec) of read requests that miss the last level cache (LLC) and go to local memory.",
-        "MetricExpr": "UNC_CHA_REQUESTS.READS_LOCAL * 64 / 1e6 / duration_time",
-        "MetricName": "llc_miss_local_memory_bandwidth_read",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "L2 cache ([RKL+] true) misses per kilo instruction for all demand loads  (including speculative)",
+        "MetricExpr": "1e3 * L2_RQSTS.DEMAND_DATA_RD_MISS / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem",
+        "MetricName": "tma_info_l2mpki_load"
     },
     {
-        "BriefDescription": "Bandwidth (MB/sec) of write requests that miss the last level cache (LLC) and go to local memory.",
-        "MetricExpr": "UNC_CHA_REQUESTS.WRITES_LOCAL * 64 / 1e6 / duration_time",
-        "MetricName": "llc_miss_local_memory_bandwidth_write",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "Average per-core data access bandwidth to the L3 cache [GB / sec]",
+        "MetricExpr": "64 * OFFCORE_REQUESTS.ALL_REQUESTS / 1e9 / duration_time",
+        "MetricGroup": "Mem;MemoryBW;Offcore",
+        "MetricName": "tma_info_l3_cache_access_bw"
     },
     {
-        "BriefDescription": "Bandwidth (MB/sec) of read requests that miss the last level cache (LLC) and go to remote memory.",
-        "MetricExpr": "UNC_CHA_REQUESTS.READS_REMOTE * 64 / 1e6 / duration_time",
-        "MetricName": "llc_miss_remote_memory_bandwidth_read",
-        "ScaleUnit": "1MB/s"
+        "BriefDescription": "Average per-thread data access bandwidth to the L3 cache [GB / sec]",
+        "MetricExpr": "tma_info_l3_cache_access_bw",
+        "MetricGroup": "Mem;MemoryBW;Offcore",
+        "MetricName": "tma_info_l3_cache_access_bw_1t"
     },
     {
-        "BriefDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend",
-        "MetricExpr": "IDQ_UOPS_NOT_DELIVERED.CORE / SLOTS",
-        "MetricGroup": "PGO;TopdownL1;tma_L1_group;tma_L1_group",
-        "MetricName": "tma_frontend_bound",
-        "PublicDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend. Frontend denotes the first part of the processor core responsible to fetch operations that are executed later on by the Backend part. Within the Frontend; a branch predictor predicts the next address to fetch; cache-lines are fetched from the memory subsystem; parsed into instructions; and lastly decoded into micro-operations (uops). Ideally the Frontend can issue Machine_Width uops every cycle to the Backend. Frontend Bound denotes unutilized issue-slots when there is no Backend stall; i.e. bubbles where Frontend delivered no uops while Backend could have accepted them. For example; stalls due to instruction-cache misses would be categorized under Frontend Bound.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average per-core data fill bandwidth to the L3 cache [GB / sec]",
+        "MetricExpr": "64 * LONGEST_LAT_CACHE.MISS / 1e9 / duration_time",
+        "MetricGroup": "Mem;MemoryBW",
+        "MetricName": "tma_info_l3_cache_fill_bw"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues",
-        "MetricExpr": "4 * IDQ_UOPS_NOT_DELIVERED.CYCLES_0_UOPS_DELIV.CORE / SLOTS",
-        "MetricGroup": "Frontend;TopdownL2;tma_L2_group;tma_L2_group;tma_frontend_bound_group",
-        "MetricName": "tma_fetch_latency",
-        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues.  For example; instruction-cache misses; iTLB misses or fetch stalls after a branch misprediction are categorized under Frontend Latency. In such cases; the Frontend eventually delivers no uops for some period.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average per-thread data fill bandwidth to the L3 cache [GB / sec]",
+        "MetricExpr": "tma_info_l3_cache_fill_bw",
+        "MetricGroup": "Mem;MemoryBW",
+        "MetricName": "tma_info_l3_cache_fill_bw_1t"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to instruction cache misses.",
-        "MetricExpr": "(ICACHE_16B.IFDATA_STALL + 2 * cpu@ICACHE_16B.IFDATA_STALL\\,cmask\\=0x1\\,edge\\=0x1@) / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "BigFoot;FetchLat;IcMiss;TopdownL3;tma_L3_group;tma_fetch_latency_group",
-        "MetricName": "tma_icache_misses",
-        "ScaleUnit": "100%"
+        "BriefDescription": "L3 cache true misses per kilo instruction for retired demand loads",
+        "MetricExpr": "1e3 * MEM_LOAD_RETIRED.L3_MISS / INST_RETIRED.ANY",
+        "MetricGroup": "CacheMisses;Mem",
+        "MetricName": "tma_info_l3mpki"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Instruction TLB (ITLB) misses.",
-        "MetricExpr": "ICACHE_64B.IFTAG_STALL / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "BigFoot;FetchLat;MemoryTLB;TopdownL3;tma_L3_group;tma_fetch_latency_group",
-        "MetricName": "tma_itlb_misses",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average Latency for L2 cache miss demand Loads",
+        "MetricExpr": "OFFCORE_REQUESTS_OUTSTANDING.DEMAND_DATA_RD / OFFCORE_REQUESTS.DEMAND_DATA_RD",
+        "MetricGroup": "Memory_Lat;Offcore",
+        "MetricName": "tma_info_load_l2_miss_latency"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers",
-        "MetricExpr": "INT_MISC.CLEAR_RESTEER_CYCLES / CPU_CLK_UNHALTED.THREAD + tma_unknown_branches",
-        "MetricGroup": "FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group",
-        "MetricName": "tma_branch_resteers",
-        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers. Branch Resteers estimates the Frontend delay in fetching operations from corrected path; following all sorts of miss-predicted branches. For example; branchy code with lots of miss-predictions might get categorized under Branch Resteers. Note the value of this node may overlap with its siblings.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average Parallel L2 cache miss demand Loads",
+        "MetricExpr": "OFFCORE_REQUESTS_OUTSTANDING.DEMAND_DATA_RD / OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DEMAND_DATA_RD",
+        "MetricGroup": "Memory_BW;Offcore",
+        "MetricName": "tma_info_load_l2_mlp"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers as a result of Branch Misprediction at execution stage. ",
-        "MetricExpr": "BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT) * INT_MISC.CLEAR_RESTEER_CYCLES / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "BadSpec;BrMispredicts;TopdownL4;tma_L4_group;tma_branch_resteers_group",
-        "MetricName": "tma_mispredicts_resteers",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Actual Average Latency for L1 data-cache miss demand load operations (in core cycles)",
+        "MetricExpr": "L1D_PEND_MISS.PENDING / (MEM_LOAD_RETIRED.L1_MISS + MEM_LOAD_RETIRED.FB_HIT)",
+        "MetricGroup": "Mem;MemoryBound;MemoryLat",
+        "MetricName": "tma_info_load_miss_real_latency"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers as a result of Machine Clears. ",
-        "MetricExpr": "(1 - BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT)) * INT_MISC.CLEAR_RESTEER_CYCLES / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "BadSpec;MachineClears;TopdownL4;tma_L4_group;tma_branch_resteers_group",
-        "MetricName": "tma_clears_resteers",
-        "ScaleUnit": "100%"
+        "BriefDescription": "STLB (2nd level TLB) data load speculative misses per kilo instruction (misses of any page-size that complete the page walk)",
+        "MetricExpr": "1e3 * DTLB_LOAD_MISSES.WALK_COMPLETED / INST_RETIRED.ANY",
+        "MetricGroup": "Mem;MemoryTLB",
+        "MetricName": "tma_info_load_stlb_mpki"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to new branch address clears",
-        "MetricExpr": "9 * BACLEARS.ANY / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "BigFoot;FetchLat;TopdownL4;tma_L4_group;tma_branch_resteers_group",
-        "MetricName": "tma_unknown_branches",
-        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to new branch address clears. These are fetched branches the Branch Prediction Unit was unable to recognize (First fetch or hitting BPU capacity limit).",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average latency of data read request to external DRAM memory [in nanoseconds]",
+        "MetricExpr": "1e9 * (UNC_M_RPQ_OCCUPANCY / UNC_M_RPQ_INSERTS) / imc_0@event\\=0x0@",
+        "MetricGroup": "Mem;MemoryLat;Server;SoC",
+        "MetricName": "tma_info_mem_dram_read_latency",
+        "PublicDescription": "Average latency of data read request to external DRAM memory [in nanoseconds]. Accounts for demand loads and L1/L2 data-read prefetches"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines",
-        "MetricExpr": "DSB2MITE_SWITCHES.PENALTY_CYCLES / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "DSBmiss;FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group",
-        "MetricName": "tma_dsb_switches",
-        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines. The DSB (decoded i-cache) is a Uop Cache where the front-end directly delivers Uops (micro operations) avoiding heavy x86 decoding. The DSB pipeline has shorter latency and delivered higher bandwidth than the MITE (legacy instruction decode pipeline). Switching between the two pipelines can cause penalties hence this metric measures the exposed penalty.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average number of parallel data read requests to external memory",
+        "MetricExpr": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD / UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD@thresh\\=1@",
+        "MetricGroup": "Mem;MemoryBW;SoC",
+        "MetricName": "tma_info_mem_parallel_reads",
+        "PublicDescription": "Average number of parallel data read requests to external memory. Accounts for demand loads and L1/L2 prefetches"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs)",
-        "MetricExpr": "ILD_STALL.LCP / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group",
-        "MetricName": "tma_lcp",
-        "PublicDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs). Using proper compiler flags or Intel Compiler by default will certainly avoid this. #Link: Optimization Guide about LCP BKMs.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average latency of data read request to external memory (in nanoseconds)",
+        "MetricExpr": "1e9 * (UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD / UNC_CHA_TOR_INSERTS.IA_MISS_DRD) / (tma_info_socket_clks / duration_time)",
+        "MetricGroup": "Mem;MemoryLat;SoC",
+        "MetricName": "tma_info_mem_read_latency",
+        "PublicDescription": "Average latency of data read request to external memory (in nanoseconds). Accounts for demand loads and L1/L2 prefetches. ([RKL+]memory-controller only)"
     },
     {
-        "BriefDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS)",
-        "MetricExpr": "2 * IDQ.MS_SWITCHES / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "FetchLat;MicroSeq;TopdownL3;tma_L3_group;tma_fetch_latency_group",
-        "MetricName": "tma_ms_switches",
-        "PublicDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS). Commonly used instructions are optimized for delivery by the DSB (decoded i-cache) or MITE (legacy instruction decode) pipelines. Certain operations cannot be handled natively by the execution pipeline; and must be performed by microcode (small programs injected into the execution stream). Switching to the MS too often can negatively impact performance. The MS is designated to deliver long uop flows required by CISC instructions like CPUID; or uncommon conditions like Floating Point Assists when dealing with Denormals.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Total pipeline cost of (external) Memory Bandwidth related bottlenecks",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "100 * tma_memory_bound * (tma_dram_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_mem_bandwidth / (tma_mem_bandwidth + tma_mem_latency)) + tma_l3_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_sq_full / (tma_contested_accesses + tma_data_sharing + tma_l3_hit_latency + tma_sq_full))) + tma_l1_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_fb_full / (tma_4k_aliasing + tma_dtlb_load + tma_fb_full + tma_lock_latency + tma_split_loads + tma_store_fwd_blk))",
+        "MetricGroup": "Mem;MemoryBW;Offcore;tma_issueBW",
+        "MetricName": "tma_info_memory_bandwidth",
+        "MetricThreshold": "tma_info_memory_bandwidth > 20",
+        "PublicDescription": "Total pipeline cost of (external) Memory Bandwidth related bottlenecks. Related metrics: tma_fb_full, tma_info_dram_bw_use, tma_mem_bandwidth, tma_sq_full"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues",
-        "MetricExpr": "tma_frontend_bound - tma_fetch_latency",
-        "MetricGroup": "FetchBW;Frontend;TopdownL2;tma_L2_group;tma_L2_group;tma_frontend_bound_group",
-        "MetricName": "tma_fetch_bandwidth",
-        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues.  For example; inefficiencies at the instruction decoders; or restrictions for caching in the DSB (decoded uops cache) are categorized under Fetch Bandwidth. In such cases; the Frontend typically delivers suboptimal amount of uops to the Backend.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Total pipeline cost of Memory Address Translation related bottlenecks (data-side TLBs)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "100 * tma_memory_bound * (tma_l1_bound / max(tma_memory_bound, tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_dtlb_load / max(tma_l1_bound, tma_4k_aliasing + tma_dtlb_load + tma_fb_full + tma_lock_latency + tma_split_loads + tma_store_fwd_blk)) + tma_store_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_dtlb_store / (tma_dtlb_store + tma_false_sharing + tma_split_stores + tma_store_latency)))",
+        "MetricGroup": "Mem;MemoryTLB;Offcore;tma_issueTLB",
+        "MetricName": "tma_info_memory_data_tlbs",
+        "MetricThreshold": "tma_info_memory_data_tlbs > 20",
+        "PublicDescription": "Total pipeline cost of Memory Address Translation related bottlenecks (data-side TLBs). Related metrics: tma_dtlb_load, tma_dtlb_store"
     },
     {
-        "BriefDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to the MITE pipeline (the legacy decode pipeline)",
-        "MetricExpr": "(IDQ.ALL_MITE_CYCLES_ANY_UOPS - IDQ.ALL_MITE_CYCLES_4_UOPS) / CORE_CLKS / 2",
-        "MetricGroup": "DSBmiss;FetchBW;TopdownL3;tma_L3_group;tma_fetch_bandwidth_group",
-        "MetricName": "tma_mite",
-        "PublicDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to the MITE pipeline (the legacy decode pipeline). This pipeline is used for code that was not pre-cached in the DSB or LSD. For example; inefficiencies due to asymmetric decoders; use of long immediate or LCP can manifest as MITE fetch bandwidth bottleneck.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Total pipeline cost of Memory Latency related bottlenecks (external memory and off-core caches)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "100 * tma_memory_bound * (tma_dram_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_mem_latency / (tma_mem_bandwidth + tma_mem_latency)) + tma_l3_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound) * (tma_l3_hit_latency / (tma_contested_accesses + tma_data_sharing + tma_l3_hit_latency + tma_sq_full)) + tma_l2_bound / (tma_dram_bound + tma_l1_bound + tma_l2_bound + tma_l3_bound + tma_store_bound))",
+        "MetricGroup": "Mem;MemoryLat;Offcore;tma_issueLat",
+        "MetricName": "tma_info_memory_latency",
+        "MetricThreshold": "tma_info_memory_latency > 20",
+        "PublicDescription": "Total pipeline cost of Memory Latency related bottlenecks (external memory and off-core caches). Related metrics: tma_l3_hit_latency, tma_mem_latency"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles where decoder-0 was the only active decoder",
-        "MetricExpr": "(cpu@INST_DECODED.DECODERS\\,cmask\\=0x1@ - cpu@INST_DECODED.DECODERS\\,cmask\\=0x2@) / CORE_CLKS",
-        "MetricGroup": "DSBmiss;FetchBW;TopdownL4;tma_L4_group;tma_mite_group",
-        "MetricName": "tma_decoder0_alone",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Total pipeline cost of Branch Misprediction related bottlenecks",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "100 * (tma_branch_mispredicts + tma_fetch_latency * tma_mispredicts_resteers / (tma_branch_resteers + tma_dsb_switches + tma_icache_misses + tma_itlb_misses + tma_lcp + tma_ms_switches))",
+        "MetricGroup": "Bad;BadSpec;BrMispredicts;tma_issueBM",
+        "MetricName": "tma_info_mispredictions",
+        "MetricThreshold": "tma_info_mispredictions > 20",
+        "PublicDescription": "Total pipeline cost of Branch Misprediction related bottlenecks. Related metrics: tma_branch_mispredicts, tma_info_branch_misprediction_cost, tma_mispredicts_resteers"
     },
     {
-        "BriefDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to DSB (decoded uop cache) fetch pipeline",
-        "MetricExpr": "(IDQ.ALL_DSB_CYCLES_ANY_UOPS - IDQ.ALL_DSB_CYCLES_4_UOPS) / CORE_CLKS / 2",
-        "MetricGroup": "DSB;FetchBW;TopdownL3;tma_L3_group;tma_fetch_bandwidth_group",
-        "MetricName": "tma_dsb",
-        "PublicDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to DSB (decoded uop cache) fetch pipeline.  For example; inefficient utilization of the DSB cache structure or bank conflict when reading from it; are categorized here.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Memory-Level-Parallelism (average number of L1 miss demand load when there is at least one such miss",
+        "MetricExpr": "L1D_PEND_MISS.PENDING / L1D_PEND_MISS.PENDING_CYCLES",
+        "MetricGroup": "Mem;MemoryBW;MemoryBound",
+        "MetricName": "tma_info_mlp",
+        "PublicDescription": "Memory-Level-Parallelism (average number of L1 miss demand load when there is at least one such miss. Per-Logical Processor)"
     },
     {
-        "BriefDescription": "This category represents fraction of slots wasted due to incorrect speculations",
-        "MetricExpr": "(UOPS_ISSUED.ANY - UOPS_RETIRED.RETIRE_SLOTS + 4 * (INT_MISC.RECOVERY_CYCLES_ANY / 2 if #SMT_on else INT_MISC.RECOVERY_CYCLES)) / SLOTS",
-        "MetricGroup": "TopdownL1;tma_L1_group;tma_L1_group",
-        "MetricName": "tma_bad_speculation",
-        "PublicDescription": "This category represents fraction of slots wasted due to incorrect speculations. This include slots used to issue uops that do not eventually get retired and slots for which the issue-pipeline was blocked due to recovery from earlier incorrect speculation. For example; wasted work due to miss-predicted branches are categorized under Bad Speculation category. Incorrect data speculation followed by Memory Ordering Nukes is another example.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Utilization of the core's Page Walker(s) serving STLB misses triggered by instruction/Load/Store accesses",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
+        "MetricExpr": "(ITLB_MISSES.WALK_PENDING + DTLB_LOAD_MISSES.WALK_PENDING + DTLB_STORE_MISSES.WALK_PENDING + EPT.WALK_PENDING) / (2 * tma_info_core_clks)",
+        "MetricGroup": "Mem;MemoryTLB",
+        "MetricName": "tma_info_page_walks_utilization",
+        "MetricThreshold": "tma_info_page_walks_utilization > 0.5"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction",
-        "MetricExpr": "BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT) * tma_bad_speculation",
-        "MetricGroup": "BadSpec;BrMispredicts;TopdownL2;tma_L2_group;tma_L2_group;tma_bad_speculation_group",
-        "MetricName": "tma_branch_mispredicts",
-        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction.  These slots are either wasted by uops fetched from an incorrectly speculated program path; or stalls when the out-of-order part of the machine needs to recover its state from a speculative path.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Fraction of Core cycles where the core was running with power-delivery for baseline license level 0",
+        "MetricExpr": "(CORE_POWER.LVL0_TURBO_LICENSE / 2 / tma_info_core_clks if #SMT_on else CORE_POWER.LVL0_TURBO_LICENSE / tma_info_core_clks)",
+        "MetricGroup": "Power",
+        "MetricName": "tma_info_power_license0_utilization",
+        "PublicDescription": "Fraction of Core cycles where the core was running with power-delivery for baseline license level 0.  This includes non-AVX codes, SSE, AVX 128-bit, and low-current AVX 256-bit codes."
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears",
-        "MetricExpr": "tma_bad_speculation - tma_branch_mispredicts",
-        "MetricGroup": "BadSpec;MachineClears;TopdownL2;tma_L2_group;tma_L2_group;tma_bad_speculation_group",
-        "MetricName": "tma_machine_clears",
-        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears.  These slots are either wasted by uops fetched prior to the clear; or stalls the out-of-order portion of the machine needs to recover its state after the clear. For example; this can happen due to memory ordering Nukes (e.g. Memory Disambiguation) or Self-Modifying-Code (SMC) nukes.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 1",
+        "MetricExpr": "(CORE_POWER.LVL1_TURBO_LICENSE / 2 / tma_info_core_clks if #SMT_on else CORE_POWER.LVL1_TURBO_LICENSE / tma_info_core_clks)",
+        "MetricGroup": "Power",
+        "MetricName": "tma_info_power_license1_utilization",
+        "MetricThreshold": "tma_info_power_license1_utilization > 0.5",
+        "PublicDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 1.  This includes high current AVX 256-bit instructions as well as low current AVX 512-bit instructions."
     },
     {
-        "BriefDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend",
-        "MetricExpr": "1 - tma_frontend_bound - (UOPS_ISSUED.ANY + 4 * (INT_MISC.RECOVERY_CYCLES_ANY / 2 if #SMT_on else INT_MISC.RECOVERY_CYCLES)) / SLOTS",
-        "MetricGroup": "TopdownL1;tma_L1_group;tma_L1_group",
-        "MetricName": "tma_backend_bound",
-        "PublicDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend. Backend is the portion of the processor core where the out-of-order scheduler dispatches ready uops into their respective execution units; and once completed these uops get retired according to program order. For example; stalls due to data-cache misses or stalls due to the divider unit being overloaded are both categorized under Backend Bound. Backend Bound is further divided into two main categories: Memory Bound and Core Bound.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 2 (introduced in SKX)",
+        "MetricExpr": "(CORE_POWER.LVL2_TURBO_LICENSE / 2 / tma_info_core_clks if #SMT_on else CORE_POWER.LVL2_TURBO_LICENSE / tma_info_core_clks)",
+        "MetricGroup": "Power",
+        "MetricName": "tma_info_power_license2_utilization",
+        "MetricThreshold": "tma_info_power_license2_utilization > 0.5",
+        "PublicDescription": "Fraction of Core cycles where the core was running with power-delivery for license level 2 (introduced in SKX).  This includes high current AVX 512-bit instructions."
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck",
-        "MetricExpr": "(CYCLE_ACTIVITY.STALLS_MEM_ANY + EXE_ACTIVITY.BOUND_ON_STORES) / (CYCLE_ACTIVITY.STALLS_TOTAL + (EXE_ACTIVITY.1_PORTS_UTIL + UOPS_RETIRED.RETIRE_SLOTS / SLOTS * EXE_ACTIVITY.2_PORTS_UTIL) + EXE_ACTIVITY.BOUND_ON_STORES) * tma_backend_bound",
-        "MetricGroup": "Backend;TopdownL2;tma_L2_group;tma_L2_group;tma_backend_bound_group",
-        "MetricName": "tma_memory_bound",
-        "PublicDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck.  Memory Bound estimates fraction of slots where pipeline is likely stalled due to demand load or store instructions. This accounts mainly for (1) non-completed in-flight memory demand loads which coincides with execution units starvation; in addition to (2) cases where stores could impose backpressure on the pipeline when many of them get buffered at the same time (less common out of the two).",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average number of Uops retired in cycles where at least one uop has retired.",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / cpu@UOPS_RETIRED.RETIRE_SLOTS\\,cmask\\=1@",
+        "MetricGroup": "Pipeline;Ret",
+        "MetricName": "tma_info_retire"
     },
     {
-        "BriefDescription": "This metric estimates how often the CPU was stalled without loads missing the L1 data cache",
-        "MetricExpr": "max((CYCLE_ACTIVITY.STALLS_MEM_ANY - CYCLE_ACTIVITY.STALLS_L1D_MISS) / CPU_CLK_UNHALTED.THREAD, 0)",
-        "MetricGroup": "CacheMisses;MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
-        "MetricName": "tma_l1_bound",
-        "PublicDescription": "This metric estimates how often the CPU was stalled without loads missing the L1 data cache.  The L1 data cache typically has the shortest latency.  However; in certain cases like loads blocked on older stores; a load might suffer due to high latency even though it is being satisfied by the L1. Another example is loads who miss in the TLB. These cases are characterized by execution unit stalls; while some non-completed demand load lives in the machine without having that demand load missing the L1 cache.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Total issue-pipeline slots (per-Physical Core till ICL; per-Logical Processor ICL onward)",
+        "MetricExpr": "4 * tma_info_core_clks",
+        "MetricGroup": "TmaL1;tma_L1_group",
+        "MetricName": "tma_info_slots"
     },
     {
-        "BriefDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses",
-        "MetricExpr": "min(9 * cpu@DTLB_LOAD_MISSES.STLB_HIT\\,cmask\\=0x1@ + DTLB_LOAD_MISSES.WALK_ACTIVE, max(CYCLE_ACTIVITY.CYCLES_MEM_ANY - CYCLE_ACTIVITY.CYCLES_L1D_MISS, 0)) / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "MemoryTLB;TopdownL4;tma_L4_group;tma_l1_bound_group",
-        "MetricName": "tma_dtlb_load",
-        "PublicDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses. TLBs (Translation Look-aside Buffers) are processor caches for recently used entries out of the Page Tables that are used to map virtual- to physical-addresses by the operating system. This metric approximates the potential delay of demand loads missing the first-level data TLB (assuming worst case scenario with back to back misses to different pages). This includes hitting in the second-level TLB (STLB) as well as performing a hardware page walk on an STLB miss.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Fraction of cycles where both hardware Logical Processors were active",
+        "MetricExpr": "(1 - CPU_CLK_UNHALTED.ONE_THREAD_ACTIVE / (CPU_CLK_UNHALTED.REF_XCLK_ANY / 2) if #SMT_on else 0)",
+        "MetricGroup": "SMT",
+        "MetricName": "tma_info_smt_2t_utilization"
     },
     {
-        "BriefDescription": "This metric roughly estimates the fraction of cycles where the (first level) DTLB was missed by load accesses, that later on hit in second-level TLB (STLB)",
-        "MetricExpr": "tma_dtlb_load - tma_load_stlb_miss",
-        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_load_group",
-        "MetricName": "tma_load_stlb_hit",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Socket actual clocks when any core is active on that socket",
+        "MetricExpr": "cha_0@event\\=0x0@",
+        "MetricGroup": "SoC",
+        "MetricName": "tma_info_socket_clks"
     },
     {
-        "BriefDescription": "This metric estimates the fraction of cycles where the Second-level TLB (STLB) was missed by load accesses, performing a hardware page walk",
-        "MetricExpr": "DTLB_LOAD_MISSES.WALK_ACTIVE / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_load_group",
-        "MetricName": "tma_load_stlb_miss",
-        "ScaleUnit": "100%"
+        "BriefDescription": "STLB (2nd level TLB) data store speculative misses per kilo instruction (misses of any page-size that complete the page walk)",
+        "MetricExpr": "1e3 * DTLB_STORE_MISSES.WALK_COMPLETED / INST_RETIRED.ANY",
+        "MetricGroup": "Mem;MemoryTLB",
+        "MetricName": "tma_info_store_stlb_mpki"
     },
     {
-        "BriefDescription": "This metric roughly estimates fraction of cycles when the memory subsystem had loads blocked since they could not forward data from earlier (in program order) overlapping stores",
-        "MetricExpr": "min(13 * LD_BLOCKS.STORE_FORWARD / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "TopdownL4;tma_L4_group;tma_l1_bound_group",
-        "MetricName": "tma_store_fwd_blk",
-        "PublicDescription": "This metric roughly estimates fraction of cycles when the memory subsystem had loads blocked since they could not forward data from earlier (in program order) overlapping stores. To streamline memory operations in the pipeline; a load can avoid waiting for memory if a prior in-flight store is writing the data that the load wants to read (store forwarding process). However; in some cases the load may be blocked for a significant time pending the store forward. For example; when the prior store is writing a smaller region than the load is reading.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Average Frequency Utilization relative nominal frequency",
+        "MetricExpr": "tma_info_clks / CPU_CLK_UNHALTED.REF_TSC",
+        "MetricGroup": "Power",
+        "MetricName": "tma_info_turbo_utilization"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU spent handling cache misses due to lock operations",
-        "MetricExpr": "min((12 * max(0, MEM_INST_RETIRED.LOCK_LOADS - L2_RQSTS.ALL_RFO) + MEM_INST_RETIRED.LOCK_LOADS / MEM_INST_RETIRED.ALL_STORES * (11 * L2_RQSTS.RFO_HIT + min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DEMAND_RFO))) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "Offcore;TopdownL4;tma_L4_group;tma_l1_bound_group",
-        "MetricName": "tma_lock_latency",
-        "PublicDescription": "This metric represents fraction of cycles the CPU spent handling cache misses due to lock operations. Due to the microarchitecture handling of locks; they are classified as L1_Bound regardless of what memory source satisfied them.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Uops Per Instruction",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / INST_RETIRED.ANY",
+        "MetricGroup": "Pipeline;Ret;Retire",
+        "MetricName": "tma_info_uoppi",
+        "MetricThreshold": "tma_info_uoppi > 1.05"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles handling memory load split accesses - load that cross 64-byte cache line boundary. ",
-        "MetricExpr": "min(Load_Miss_Real_Latency * LD_BLOCKS.NO_SR / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "TopdownL4;tma_L4_group;tma_l1_bound_group",
-        "MetricName": "tma_split_loads",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Instruction per taken branch",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / BR_INST_RETIRED.NEAR_TAKEN",
+        "MetricGroup": "Branches;Fed;FetchBW",
+        "MetricName": "tma_info_uptb",
+        "MetricThreshold": "tma_info_uptb < 6"
     },
     {
-        "BriefDescription": "This metric estimates how often memory load accesses were aliased by preceding stores (in program order) with a 4K address offset",
-        "MetricExpr": "LD_BLOCKS_PARTIAL.ADDRESS_ALIAS / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "TopdownL4;tma_L4_group;tma_l1_bound_group",
-        "MetricName": "tma_4k_aliasing",
-        "PublicDescription": "This metric estimates how often memory load accesses were aliased by preceding stores (in program order) with a 4K address offset. False match is possible; which incur a few cycles load re-issue. However; the short re-issue duration is often hidden by the out-of-order core and HW optimizations; hence a user may safely ignore a high value of this metric unless it manages to propagate up into parent nodes of the hierarchy (e.g. to L1_Bound).",
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Instruction TLB (ITLB) misses",
+        "MetricExpr": "ICACHE_64B.IFTAG_STALL / tma_info_clks",
+        "MetricGroup": "BigFoot;FetchLat;MemoryTLB;TopdownL3;tma_L3_group;tma_fetch_latency_group",
+        "MetricName": "tma_itlb_misses",
+        "MetricThreshold": "tma_itlb_misses > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Instruction TLB (ITLB) misses. Sample with: FRONTEND_RETIRED.STLB_MISS_PS;FRONTEND_RETIRED.ITLB_MISS_PS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric does a *rough estimation* of how often L1D Fill Buffer unavailability limited additional L1D miss memory access requests to proceed",
-        "MetricExpr": "Load_Miss_Real_Latency * cpu@L1D_PEND_MISS.FB_FULL\\,cmask\\=0x1@ / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "MemoryBW;TopdownL4;tma_L4_group;tma_l1_bound_group",
-        "MetricName": "tma_fb_full",
-        "PublicDescription": "This metric does a *rough estimation* of how often L1D Fill Buffer unavailability limited additional L1D miss memory access requests to proceed. The higher the metric value; the deeper the memory hierarchy level the misses are satisfied from (metric values >1 are valid). Often it hints on approaching bandwidth limits (to L2 cache; L3 cache or external memory).",
+        "BriefDescription": "This metric estimates how often the CPU was stalled without loads missing the L1 data cache",
+        "MetricExpr": "max((CYCLE_ACTIVITY.STALLS_MEM_ANY - CYCLE_ACTIVITY.STALLS_L1D_MISS) / tma_info_clks, 0)",
+        "MetricGroup": "CacheMisses;MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_issueL1;tma_issueMC;tma_memory_bound_group",
+        "MetricName": "tma_l1_bound",
+        "MetricThreshold": "tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often the CPU was stalled without loads missing the L1 data cache.  The L1 data cache typically has the shortest latency.  However; in certain cases like loads blocked on older stores; a load might suffer due to high latency even though it is being satisfied by the L1. Another example is loads who miss in the TLB. These cases are characterized by execution unit stalls; while some non-completed demand load lives in the machine without having that demand load missing the L1 cache. Sample with: MEM_LOAD_RETIRED.L1_HIT_PS;MEM_LOAD_RETIRED.FB_HIT_PS. Related metrics: tma_clears_resteers, tma_machine_clears, tma_microcode_sequencer, tma_ms_switches, tma_ports_utilized_1",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric estimates how often the CPU was stalled due to L2 cache accesses by loads",
-        "MetricExpr": "MEM_LOAD_RETIRED.L2_HIT * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS) / (MEM_LOAD_RETIRED.L2_HIT * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS) + cpu@L1D_PEND_MISS.FB_FULL\\,cmask\\=0x1@) * ((CYCLE_ACTIVITY.STALLS_L1D_MISS - CYCLE_ACTIVITY.STALLS_L2_MISS) / CPU_CLK_UNHALTED.THREAD)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "MEM_LOAD_RETIRED.L2_HIT * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS) / (MEM_LOAD_RETIRED.L2_HIT * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS) + cpu@L1D_PEND_MISS.FB_FULL\\,cmask\\=1@) * ((CYCLE_ACTIVITY.STALLS_L1D_MISS - CYCLE_ACTIVITY.STALLS_L2_MISS) / tma_info_clks)",
         "MetricGroup": "CacheMisses;MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
         "MetricName": "tma_l2_bound",
-        "PublicDescription": "This metric estimates how often the CPU was stalled due to L2 cache accesses by loads.  Avoiding cache misses (i.e. L1 misses/L2 hits) can improve the latency and increase performance.",
+        "MetricThreshold": "tma_l2_bound > 0.05 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often the CPU was stalled due to L2 cache accesses by loads.  Avoiding cache misses (i.e. L1 misses/L2 hits) can improve the latency and increase performance. Sample with: MEM_LOAD_RETIRED.L2_HIT_PS",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric estimates how often the CPU was stalled due to loads accesses to L3 cache or contended with a sibling Core",
-        "MetricExpr": "(CYCLE_ACTIVITY.STALLS_L2_MISS - CYCLE_ACTIVITY.STALLS_L3_MISS) / CPU_CLK_UNHALTED.THREAD",
+        "MetricExpr": "(CYCLE_ACTIVITY.STALLS_L2_MISS - CYCLE_ACTIVITY.STALLS_L3_MISS) / tma_info_clks",
         "MetricGroup": "CacheMisses;MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
         "MetricName": "tma_l3_bound",
-        "PublicDescription": "This metric estimates how often the CPU was stalled due to loads accesses to L3 cache or contended with a sibling Core.  Avoiding cache misses (i.e. L2 misses/L3 hits) can improve the latency and increase performance.",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to contested accesses",
-        "MetricExpr": "min(((47.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 3.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * (MEM_LOAD_L3_HIT_RETIRED.XSNP_HITM * (OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE / (OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE + OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.SNOOP_HIT_WITH_FWD))) + (47.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 3.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * MEM_LOAD_L3_HIT_RETIRED.XSNP_MISS) * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "DataSharing;Offcore;Snoop;TopdownL4;tma_L4_group;tma_l3_bound_group",
-        "MetricName": "tma_contested_accesses",
-        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to contested accesses. Contested accesses occur when data written by one Logical Processor are read by another Logical Processor on a different Physical Core. Examples of contested accesses include synchronizations such as locks; true data sharing such as modified locked variables; and false sharing.",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to data-sharing accesses",
-        "MetricExpr": "min((47.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 3.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * (MEM_LOAD_L3_HIT_RETIRED.XSNP_HIT + MEM_LOAD_L3_HIT_RETIRED.XSNP_HITM * (1 - OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE / (OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.HITM_OTHER_CORE + OFFCORE_RESPONSE.DEMAND_DATA_RD.L3_HIT.SNOOP_HIT_WITH_FWD))) * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "Offcore;Snoop;TopdownL4;tma_L4_group;tma_l3_bound_group",
-        "MetricName": "tma_data_sharing",
-        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling synchronizations due to data-sharing accesses. Data shared by multiple Logical Processors (even just read shared) may cause increased access latency due to cache coherency. Excessive data sharing can drastically harm multithreaded performance.",
+        "MetricThreshold": "tma_l3_bound > 0.05 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often the CPU was stalled due to loads accesses to L3 cache or contended with a sibling Core.  Avoiding cache misses (i.e. L2 misses/L3 hits) can improve the latency and increase performance. Sample with: MEM_LOAD_RETIRED.L3_HIT_PS",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents fraction of cycles with demand load accesses that hit the L3 cache under unloaded scenarios (possibly L3 latency limited)",
-        "MetricExpr": "min((20.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 3.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * MEM_LOAD_RETIRED.L3_HIT * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "MemoryLat;TopdownL4;tma_L4_group;tma_l3_bound_group",
+        "MetricExpr": "17 * tma_info_average_frequency * MEM_LOAD_RETIRED.L3_HIT * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / tma_info_clks",
+        "MetricGroup": "MemoryLat;TopdownL4;tma_L4_group;tma_issueLat;tma_l3_bound_group",
         "MetricName": "tma_l3_hit_latency",
-        "PublicDescription": "This metric represents fraction of cycles with demand load accesses that hit the L3 cache under unloaded scenarios (possibly L3 latency limited).  Avoiding private cache misses (i.e. L2 misses/L3 hits) will improve the latency; reduce contention with sibling physical cores and increase performance.  Note the value of this node may overlap with its siblings.",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric measures fraction of cycles where the Super Queue (SQ) was full taking into account all request-types and both hardware SMT threads (Logical Processors)",
-        "MetricExpr": "(OFFCORE_REQUESTS_BUFFER.SQ_FULL / 2 if #SMT_on else OFFCORE_REQUESTS_BUFFER.SQ_FULL) / CORE_CLKS",
-        "MetricGroup": "MemoryBW;Offcore;TopdownL4;tma_L4_group;tma_l3_bound_group",
-        "MetricName": "tma_sq_full",
-        "PublicDescription": "This metric measures fraction of cycles where the Super Queue (SQ) was full taking into account all request-types and both hardware SMT threads (Logical Processors). The Super Queue is used for requests to access the L2 cache or to go out to the Uncore.",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads",
-        "MetricExpr": "min(CYCLE_ACTIVITY.STALLS_L3_MISS / CPU_CLK_UNHALTED.THREAD + (CYCLE_ACTIVITY.STALLS_L1D_MISS - CYCLE_ACTIVITY.STALLS_L2_MISS) / CPU_CLK_UNHALTED.THREAD - tma_l2_bound, 1)",
-        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
-        "MetricName": "tma_dram_bound",
-        "PublicDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads. Better caching can improve the latency and increase performance.",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM)",
-        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, cpu@OFFCORE_REQUESTS_OUTSTANDING.ALL_DATA_RD\\,cmask\\=0x4@) / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "MemoryBW;Offcore;TopdownL4;tma_L4_group;tma_dram_bound_group",
-        "MetricName": "tma_mem_bandwidth",
-        "PublicDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM).  The underlying heuristic assumes that a similar off-core traffic is generated by all IA cores. This metric does not aggregate non-data-read requests by this logical processor; requests from other IA Logical Processors/Physical Cores/sockets; or other non-IA devices like GPU; hence the maximum external memory bandwidth limits may or may not be approached when this metric is flagged (see Uncore counters for that).",
+        "MetricThreshold": "tma_l3_hit_latency > 0.1 & (tma_l3_bound > 0.05 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric represents fraction of cycles with demand load accesses that hit the L3 cache under unloaded scenarios (possibly L3 latency limited).  Avoiding private cache misses (i.e. L2 misses/L3 hits) will improve the latency; reduce contention with sibling physical cores and increase performance.  Note the value of this node may overlap with its siblings. Sample with: MEM_LOAD_RETIRED.L3_HIT_PS. Related metrics: tma_info_memory_latency, tma_mem_latency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM)",
-        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DATA_RD) / CPU_CLK_UNHALTED.THREAD - tma_mem_bandwidth",
-        "MetricGroup": "MemoryLat;Offcore;TopdownL4;tma_L4_group;tma_dram_bound_group",
-        "MetricName": "tma_mem_latency",
-        "PublicDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM).  This metric does not aggregate requests from other Logical Processors/Physical Cores/sockets (see Uncore counters for that).",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from local memory",
-        "MetricExpr": "min((80 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 20.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "Server;TopdownL5;tma_L5_group;tma_mem_latency_group",
-        "MetricName": "tma_local_dram",
-        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from local memory. Caching will improve the latency and increase performance.",
+        "BriefDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs)",
+        "MetricExpr": "ILD_STALL.LCP / tma_info_clks",
+        "MetricGroup": "FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group;tma_issueFB",
+        "MetricName": "tma_lcp",
+        "MetricThreshold": "tma_lcp > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs). Using proper compiler flags or Intel Compiler by default will certainly avoid this. #Link: Optimization Guide about LCP BKMs. Related metrics: tma_dsb_switches, tma_fetch_bandwidth, tma_info_dsb_coverage, tma_info_dsb_misses, tma_info_iptb",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote memory",
-        "MetricExpr": "min((147.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 20.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * MEM_LOAD_L3_MISS_RETIRED.REMOTE_DRAM * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "Server;Snoop;TopdownL5;tma_L5_group;tma_mem_latency_group",
-        "MetricName": "tma_remote_dram",
-        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote memory. This is caused often due to non-optimal NUMA allocations. #link to NUMA article",
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation)",
+        "MetricExpr": "tma_retiring - tma_heavy_operations",
+        "MetricGroup": "Retire;TmaL2;TopdownL2;tma_L2_group;tma_retiring_group",
+        "MetricName": "tma_light_operations",
+        "MetricThreshold": "tma_light_operations > 0.6",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation). This correlates with total number of instructions used by the program. A uops-per-instruction (see UopPI metric) ratio of 1 or less should be expected for decently optimized software running on Intel Core/Xeon products. While this often indicates efficient X86 instructions were executed; high value does not necessarily mean better performance cannot be achieved. Sample with: INST_RETIRED.PREC_DIST",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote cache in other sockets including synchronizations issues",
-        "MetricExpr": "min(((110 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 20.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * MEM_LOAD_L3_MISS_RETIRED.REMOTE_HITM + (110 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) - 20.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3))) * MEM_LOAD_L3_MISS_RETIRED.REMOTE_FWD) * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "Offcore;Server;Snoop;TopdownL5;tma_L5_group;tma_mem_latency_group",
-        "MetricName": "tma_remote_cache",
-        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote cache in other sockets including synchronizations issues. This is caused often due to non-optimal NUMA allocations. #link to NUMA article",
+        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port for Load operations",
+        "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_2 + UOPS_DISPATCHED_PORT.PORT_3 + UOPS_DISPATCHED_PORT.PORT_7 - UOPS_DISPATCHED_PORT.PORT_4) / (2 * tma_info_core_clks)",
+        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group",
+        "MetricName": "tma_load_op_utilization",
+        "MetricThreshold": "tma_load_op_utilization > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port for Load operations. Sample with: UOPS_DISPATCHED.PORT_2_3",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write",
-        "MetricExpr": "EXE_ACTIVITY.BOUND_ON_STORES / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
-        "MetricName": "tma_store_bound",
-        "PublicDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write. Even though store accesses do not typically stall out-of-order CPUs; there are few cases where stores can lead to actual stalls. This metric will be flagged should RFO stores be a bottleneck.",
+        "BriefDescription": "This metric roughly estimates the fraction of cycles where the (first level) DTLB was missed by load accesses, that later on hit in second-level TLB (STLB)",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
+        "MetricExpr": "tma_dtlb_load - tma_load_stlb_miss",
+        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_load_group",
+        "MetricName": "tma_load_stlb_hit",
+        "MetricThreshold": "tma_load_stlb_hit > 0.05 & (tma_dtlb_load > 0.1 & (tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)))",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles the CPU spent handling L1D store misses",
-        "MetricExpr": "(L2_RQSTS.RFO_HIT * 11 * (1 - MEM_INST_RETIRED.LOCK_LOADS / MEM_INST_RETIRED.ALL_STORES) + (1 - MEM_INST_RETIRED.LOCK_LOADS / MEM_INST_RETIRED.ALL_STORES) * min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DEMAND_RFO)) / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "MemoryLat;Offcore;TopdownL4;tma_L4_group;tma_store_bound_group",
-        "MetricName": "tma_store_latency",
-        "PublicDescription": "This metric estimates fraction of cycles the CPU spent handling L1D store misses. Store accesses usually less impact out-of-order core performance; however; holding resources for longer time can lead into undesired implications (e.g. contention on L1D fill-buffer entries - see FB_Full)",
+        "BriefDescription": "This metric estimates the fraction of cycles where the Second-level TLB (STLB) was missed by load accesses, performing a hardware page walk",
+        "MetricExpr": "DTLB_LOAD_MISSES.WALK_ACTIVE / tma_info_clks",
+        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_load_group",
+        "MetricName": "tma_load_stlb_miss",
+        "MetricThreshold": "tma_load_stlb_miss > 0.05 & (tma_dtlb_load > 0.1 & (tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)))",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric roughly estimates how often CPU was handling synchronizations due to False Sharing",
-        "MetricExpr": "min((110 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) * (OFFCORE_RESPONSE.DEMAND_RFO.L3_MISS.REMOTE_HITM + OFFCORE_RESPONSE.PF_L2_RFO.L3_MISS.REMOTE_HITM) + 47.5 * (CPU_CLK_UNHALTED.THREAD / CPU_CLK_UNHALTED.REF_TSC * #SYSTEM_TSC_FREQ / 1e9 / (duration_time * 1e3 / 1e3)) * (OFFCORE_RESPONSE.DEMAND_RFO.L3_HIT.HITM_OTHER_CORE + OFFCORE_RESPONSE.PF_L2_RFO.L3_HIT.HITM_OTHER_CORE)) / CPU_CLK_UNHALTED.THREAD, 1)",
-        "MetricGroup": "DataSharing;Offcore;Snoop;TopdownL4;tma_L4_group;tma_store_bound_group",
-        "MetricName": "tma_false_sharing",
-        "PublicDescription": "This metric roughly estimates how often CPU was handling synchronizations due to False Sharing. False Sharing is a multithreading hiccup; where multiple Logical Processors contend on different data-elements mapped into the same cache line. ",
+        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from local memory",
+        "MetricExpr": "59.5 * tma_info_average_frequency * MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / tma_info_clks",
+        "MetricGroup": "Server;TopdownL5;tma_L5_group;tma_mem_latency_group",
+        "MetricName": "tma_local_dram",
+        "MetricThreshold": "tma_local_dram > 0.1 & (tma_mem_latency > 0.1 & (tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)))",
+        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from local memory. Caching will improve the latency and increase performance. Sample with: MEM_LOAD_L3_MISS_RETIRED.LOCAL_DRAM_PS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents rate of split store accesses",
-        "MetricExpr": "MEM_INST_RETIRED.SPLIT_STORES / CORE_CLKS",
-        "MetricGroup": "TopdownL4;tma_L4_group;tma_store_bound_group",
-        "MetricName": "tma_split_stores",
-        "PublicDescription": "This metric represents rate of split store accesses.  Consider aligning your data to the 64-byte cache line granularity.",
+        "BriefDescription": "This metric represents fraction of cycles the CPU spent handling cache misses due to lock operations",
+        "MetricExpr": "(12 * max(0, MEM_INST_RETIRED.LOCK_LOADS - L2_RQSTS.ALL_RFO) + MEM_INST_RETIRED.LOCK_LOADS / MEM_INST_RETIRED.ALL_STORES * (11 * L2_RQSTS.RFO_HIT + min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DEMAND_RFO))) / tma_info_clks",
+        "MetricGroup": "Offcore;TopdownL4;tma_L4_group;tma_issueRFO;tma_l1_bound_group",
+        "MetricName": "tma_lock_latency",
+        "MetricThreshold": "tma_lock_latency > 0.2 & (tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric represents fraction of cycles the CPU spent handling cache misses due to lock operations. Due to the microarchitecture handling of locks; they are classified as L1_Bound regardless of what memory source satisfied them. Sample with: MEM_INST_RETIRED.LOCK_LOADS_PS. Related metrics: tma_store_latency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric roughly estimates the fraction of cycles spent handling first-level data TLB store misses",
-        "MetricExpr": "min((9 * cpu@DTLB_STORE_MISSES.STLB_HIT\\,cmask\\=0x1@ + DTLB_STORE_MISSES.WALK_ACTIVE) / CORE_CLKS, 1)",
-        "MetricGroup": "MemoryTLB;TopdownL4;tma_L4_group;tma_store_bound_group",
-        "MetricName": "tma_dtlb_store",
-        "PublicDescription": "This metric roughly estimates the fraction of cycles spent handling first-level data TLB store misses.  As with ordinary data caching; focus on improving data locality and reducing working-set size to reduce DTLB overhead.  Additionally; consider using profile-guided optimization (PGO) to collocate frequently-used data on the same page.  Try using larger page sizes for large amounts of frequently-used data.",
+        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "tma_bad_speculation - tma_branch_mispredicts",
+        "MetricGroup": "BadSpec;MachineClears;TmaL2;TopdownL2;tma_L2_group;tma_bad_speculation_group;tma_issueMC;tma_issueSyncxn",
+        "MetricName": "tma_machine_clears",
+        "MetricThreshold": "tma_machine_clears > 0.1 & tma_bad_speculation > 0.15",
+        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears.  These slots are either wasted by uops fetched prior to the clear; or stalls the out-of-order portion of the machine needs to recover its state after the clear. For example; this can happen due to memory ordering Nukes (e.g. Memory Disambiguation) or Self-Modifying-Code (SMC) nukes. Sample with: MACHINE_CLEARS.COUNT. Related metrics: tma_clears_resteers, tma_contested_accesses, tma_data_sharing, tma_false_sharing, tma_l1_bound, tma_microcode_sequencer, tma_ms_switches, tma_remote_cache",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric roughly estimates the fraction of cycles where the TLB was missed by store accesses, hitting in the second-level TLB (STLB)",
-        "MetricExpr": "tma_dtlb_store - DTLB_STORE_MISSES.WALK_ACTIVE / CORE_CLKS",
-        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_store_group",
-        "MetricName": "tma_store_stlb_hit",
+        "BriefDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM)",
+        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, cpu@OFFCORE_REQUESTS_OUTSTANDING.ALL_DATA_RD\\,cmask\\=4@) / tma_info_clks",
+        "MetricGroup": "MemoryBW;Offcore;TopdownL4;tma_L4_group;tma_dram_bound_group;tma_issueBW",
+        "MetricName": "tma_mem_bandwidth",
+        "MetricThreshold": "tma_mem_bandwidth > 0.2 & (tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM).  The underlying heuristic assumes that a similar off-core traffic is generated by all IA cores. This metric does not aggregate non-data-read requests by this logical processor; requests from other IA Logical Processors/Physical Cores/sockets; or other non-IA devices like GPU; hence the maximum external memory bandwidth limits may or may not be approached when this metric is flagged (see Uncore counters for that). Related metrics: tma_fb_full, tma_info_dram_bw_use, tma_info_memory_bandwidth, tma_sq_full",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates the fraction of cycles where the STLB was missed by store accesses, performing a hardware page walk",
-        "MetricExpr": "DTLB_STORE_MISSES.WALK_ACTIVE / CORE_CLKS",
-        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_store_group",
-        "MetricName": "tma_store_stlb_miss",
+        "BriefDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM)",
+        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DATA_RD) / tma_info_clks - tma_mem_bandwidth",
+        "MetricGroup": "MemoryLat;Offcore;TopdownL4;tma_L4_group;tma_dram_bound_group;tma_issueLat",
+        "MetricName": "tma_mem_latency",
+        "MetricThreshold": "tma_mem_latency > 0.1 & (tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM).  This metric does not aggregate requests from other Logical Processors/Physical Cores/sockets (see Uncore counters for that). Related metrics: tma_info_memory_latency, tma_l3_hit_latency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where Core non-memory issues were of a bottleneck",
-        "MetricExpr": "tma_backend_bound - tma_memory_bound",
-        "MetricGroup": "Backend;Compute;TopdownL2;tma_L2_group;tma_L2_group;tma_backend_bound_group",
-        "MetricName": "tma_core_bound",
-        "PublicDescription": "This metric represents fraction of slots where Core non-memory issues were of a bottleneck.  Shortage in hardware compute resources; or dependencies in software's instructions are both categorized under Core Bound. Hence it may indicate the machine ran out of an out-of-order resource; certain execution units are overloaded or dependencies in program's data- or instruction-flow are limiting the performance (e.g. FP-chained long-latency arithmetic operations).",
+        "BriefDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(CYCLE_ACTIVITY.STALLS_MEM_ANY + EXE_ACTIVITY.BOUND_ON_STORES) / (CYCLE_ACTIVITY.STALLS_TOTAL + (EXE_ACTIVITY.1_PORTS_UTIL + tma_retiring * EXE_ACTIVITY.2_PORTS_UTIL) + EXE_ACTIVITY.BOUND_ON_STORES) * tma_backend_bound",
+        "MetricGroup": "Backend;TmaL2;TopdownL2;tma_L2_group;tma_backend_bound_group",
+        "MetricName": "tma_memory_bound",
+        "MetricThreshold": "tma_memory_bound > 0.2 & tma_backend_bound > 0.2",
+        "PublicDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck.  Memory Bound estimates fraction of slots where pipeline is likely stalled due to demand load or store instructions. This accounts mainly for (1) non-completed in-flight memory demand loads which coincides with execution units starvation; in addition to (2) cases where stores could impose backpressure on the pipeline when many of them get buffered at the same time (less common out of the two).",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles where the Divider unit was active",
-        "MetricExpr": "ARITH.DIVIDER_ACTIVE / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "TopdownL3;tma_L3_group;tma_core_bound_group",
-        "MetricName": "tma_divider",
-        "PublicDescription": "This metric represents fraction of cycles where the Divider unit was active. Divide and square root instructions are performed by the Divider unit and can take considerably longer latency than integer or Floating Point addition; subtraction; or multiplication.",
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring memory operations -- uops for memory load or store accesses.",
+        "MetricExpr": "tma_light_operations * MEM_INST_RETIRED.ANY / INST_RETIRED.ANY",
+        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
+        "MetricName": "tma_memory_operations",
+        "MetricThreshold": "tma_memory_operations > 0.1 & tma_light_operations > 0.6",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related)",
-        "MetricExpr": "((EXE_ACTIVITY.EXE_BOUND_0_PORTS + (EXE_ACTIVITY.1_PORTS_UTIL + UOPS_RETIRED.RETIRE_SLOTS / SLOTS * EXE_ACTIVITY.2_PORTS_UTIL)) / CPU_CLK_UNHALTED.THREAD if ARITH.DIVIDER_ACTIVE < CYCLE_ACTIVITY.STALLS_TOTAL - CYCLE_ACTIVITY.STALLS_MEM_ANY else (EXE_ACTIVITY.1_PORTS_UTIL + UOPS_RETIRED.RETIRE_SLOTS / SLOTS * EXE_ACTIVITY.2_PORTS_UTIL) / CPU_CLK_UNHALTED.THREAD)",
-        "MetricGroup": "PortsUtil;TopdownL3;tma_L3_group;tma_core_bound_group",
-        "MetricName": "tma_ports_utilization",
-        "PublicDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related).  Two distinct categories can be attributed into this metric: (1) heavy data-dependency among contiguous instructions would manifest in this metric - such cases are often referred to as low Instruction Level Parallelism (ILP). (2) Contention on some hardware execution unit other than Divider. For example; when there are too many multiply operations.",
+        "BriefDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / UOPS_ISSUED.ANY * IDQ.MS_UOPS / tma_info_slots",
+        "MetricGroup": "MicroSeq;TopdownL3;tma_L3_group;tma_heavy_operations_group;tma_issueMC;tma_issueMS",
+        "MetricName": "tma_microcode_sequencer",
+        "MetricThreshold": "tma_microcode_sequencer > 0.05 & tma_heavy_operations > 0.1",
+        "PublicDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit.  The MS is used for CISC instructions not supported by the default decoders (like repeat move strings; or CPUID); or by microcode assists used to address some operation modes (like in Floating Point assists). These cases can often be avoided. Sample with: IDQ.MS_UOPS. Related metrics: tma_clears_resteers, tma_l1_bound, tma_machine_clears, tma_ms_switches",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles CPU executed no uops on any execution port (Logical Processor cycles since ICL, Physical Core cycles otherwise)",
-        "MetricExpr": "(UOPS_EXECUTED.CORE_CYCLES_NONE / 2 if #SMT_on else CYCLE_ACTIVITY.STALLS_TOTAL - CYCLE_ACTIVITY.STALLS_MEM_ANY) / CORE_CLKS",
-        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utilization_group",
-        "MetricName": "tma_ports_utilized_0",
-        "PublicDescription": "This metric represents fraction of cycles CPU executed no uops on any execution port (Logical Processor cycles since ICL, Physical Core cycles otherwise). Long-latency instructions like divides may contribute to this metric.",
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers as a result of Branch Misprediction at execution stage",
+        "MetricExpr": "BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT) * INT_MISC.CLEAR_RESTEER_CYCLES / tma_info_clks",
+        "MetricGroup": "BadSpec;BrMispredicts;TopdownL4;tma_L4_group;tma_branch_resteers_group;tma_issueBM",
+        "MetricName": "tma_mispredicts_resteers",
+        "MetricThreshold": "tma_mispredicts_resteers > 0.05 & (tma_branch_resteers > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15))",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers as a result of Branch Misprediction at execution stage. Sample with: INT_MISC.CLEAR_RESTEER_CYCLES. Related metrics: tma_branch_mispredicts, tma_info_branch_misprediction_cost, tma_info_mispredictions",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU issue-pipeline was stalled due to serializing operations",
-        "MetricExpr": "PARTIAL_RAT_STALLS.SCOREBOARD / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_0_group",
-        "MetricName": "tma_serializing_operation",
-        "PublicDescription": "This metric represents fraction of cycles the CPU issue-pipeline was stalled due to serializing operations. Instructions like CPUID; WRMSR or LFENCE serialize the out-of-order execution which may limit performance.",
+        "BriefDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to the MITE pipeline (the legacy decode pipeline)",
+        "MetricExpr": "(IDQ.ALL_MITE_CYCLES_ANY_UOPS - IDQ.ALL_MITE_CYCLES_4_UOPS) / tma_info_core_clks / 2",
+        "MetricGroup": "DSBmiss;FetchBW;TopdownL3;tma_L3_group;tma_fetch_bandwidth_group",
+        "MetricName": "tma_mite",
+        "MetricThreshold": "tma_mite > 0.1 & (tma_fetch_bandwidth > 0.1 & tma_frontend_bound > 0.15 & tma_info_ipc / 4 > 0.35)",
+        "PublicDescription": "This metric represents Core fraction of cycles in which CPU was likely limited due to the MITE pipeline (the legacy decode pipeline). This pipeline is used for code that was not pre-cached in the DSB or LSD. For example; inefficiencies due to asymmetric decoders; use of long immediate or LCP can manifest as MITE fetch bandwidth bottleneck. Sample with: FRONTEND_RETIRED.ANY_DSB_MISS",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "The Mixing_Vectors metric gives the percentage of injected blend uops out of all uops issued",
-        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD * UOPS_ISSUED.VECTOR_WIDTH_MISMATCH / UOPS_ISSUED.ANY, 1)",
-        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_0_group",
+        "MetricExpr": "UOPS_ISSUED.VECTOR_WIDTH_MISMATCH / UOPS_ISSUED.ANY",
+        "MetricGroup": "TopdownL5;tma_L5_group;tma_issueMV;tma_ports_utilized_0_group",
         "MetricName": "tma_mixing_vectors",
-        "PublicDescription": "The Mixing_Vectors metric gives the percentage of injected blend uops out of all uops issued. Usually a Mixing_Vectors over 5% is worth investigating. Read more in Appendix B1 of the Optimizations Guide for this topic.",
+        "MetricThreshold": "tma_mixing_vectors > 0.05",
+        "PublicDescription": "The Mixing_Vectors metric gives the percentage of injected blend uops out of all uops issued. Usually a Mixing_Vectors over 5% is worth investigating. Read more in Appendix B1 of the Optimizations Guide for this topic. Related metrics: tma_ms_switches",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles where the CPU executed total of 1 uop per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise)",
-        "MetricExpr": "((UOPS_EXECUTED.CORE_CYCLES_GE_1 - UOPS_EXECUTED.CORE_CYCLES_GE_2) / 2 if #SMT_on else EXE_ACTIVITY.1_PORTS_UTIL) / CORE_CLKS",
-        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utilization_group",
-        "MetricName": "tma_ports_utilized_1",
-        "PublicDescription": "This metric represents fraction of cycles where the CPU executed total of 1 uop per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise). This can be due to heavy data-dependency among software instructions; or over oversubscribing a particular hardware resource. In some other cases with high 1_Port_Utilized and L1_Bound; this metric can point to L1 data-cache latency bottleneck that may not necessarily manifest with complete execution starvation (due to the short L1 latency e.g. walking a linked list) - looking at the assembly can be helpful.",
+        "BriefDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS)",
+        "MetricExpr": "2 * IDQ.MS_SWITCHES / tma_info_clks",
+        "MetricGroup": "FetchLat;MicroSeq;TopdownL3;tma_L3_group;tma_fetch_latency_group;tma_issueMC;tma_issueMS;tma_issueMV;tma_issueSO",
+        "MetricName": "tma_ms_switches",
+        "MetricThreshold": "tma_ms_switches > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS). Commonly used instructions are optimized for delivery by the DSB (decoded i-cache) or MITE (legacy instruction decode) pipelines. Certain operations cannot be handled natively by the execution pipeline; and must be performed by microcode (small programs injected into the execution stream). Switching to the MS too often can negatively impact performance. The MS is designated to deliver long uop flows required by CISC instructions like CPUID; or uncommon conditions like Floating Point Assists when dealing with Denormals. Sample with: IDQ.MS_SWITCHES. Related metrics: tma_clears_resteers, tma_l1_bound, tma_machine_clears, tma_microcode_sequencer, tma_mixing_vectors, tma_serializing_operation",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles CPU executed total of 2 uops per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise)",
-        "MetricExpr": "((UOPS_EXECUTED.CORE_CYCLES_GE_2 - UOPS_EXECUTED.CORE_CYCLES_GE_3) / 2 if #SMT_on else EXE_ACTIVITY.2_PORTS_UTIL) / CORE_CLKS",
-        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utilization_group",
-        "MetricName": "tma_ports_utilized_2",
-        "PublicDescription": "This metric represents fraction of cycles CPU executed total of 2 uops per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise).  Loop Vectorization -most compilers feature auto-Vectorization options today- reduces pressure on the execution ports as multiple elements are calculated with same uop.",
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring branch instructions that were not fused",
+        "MetricExpr": "tma_light_operations * (BR_INST_RETIRED.ALL_BRANCHES - UOPS_RETIRED.MACRO_FUSED) / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
+        "MetricName": "tma_non_fused_branches",
+        "MetricThreshold": "tma_non_fused_branches > 0.1 & tma_light_operations > 0.6",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring branch instructions that were not fused. Non-conditional branches like direct JMP or CALL would count here. Can be used to examine fusible conditional jumps that were not fused.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles CPU executed total of 3 or more uops per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise).",
-        "MetricExpr": "(UOPS_EXECUTED.CORE_CYCLES_GE_3 / 2 if #SMT_on else UOPS_EXECUTED.CORE_CYCLES_GE_3) / CORE_CLKS",
-        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utilization_group",
-        "MetricName": "tma_ports_utilized_3m",
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring NOP (no op) instructions",
+        "MetricExpr": "tma_light_operations * INST_RETIRED.NOP / UOPS_RETIRED.RETIRE_SLOTS",
+        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
+        "MetricName": "tma_nop_instructions",
+        "MetricThreshold": "tma_nop_instructions > 0.1 & tma_light_operations > 0.6",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring NOP (no op) instructions. Compilers often use NOPs for certain address alignments - e.g. start address of a function or loop body. Sample with: INST_RETIRED.NOP",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution ports for ALU operations.",
-        "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_0 + UOPS_DISPATCHED_PORT.PORT_1 + UOPS_DISPATCHED_PORT.PORT_5 + UOPS_DISPATCHED_PORT.PORT_6) / SLOTS",
-        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group",
-        "MetricName": "tma_alu_op_utilization",
+        "BriefDescription": "This metric represents the remaining light uops fraction the CPU has executed - remaining means not covered by other sibling nodes",
+        "MetricExpr": "max(0, tma_light_operations - (tma_fp_arith + tma_memory_operations + tma_fused_instructions + tma_non_fused_branches + tma_nop_instructions))",
+        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
+        "MetricName": "tma_other_light_ops",
+        "MetricThreshold": "tma_other_light_ops > 0.3 & tma_light_operations > 0.6",
+        "PublicDescription": "This metric represents the remaining light uops fraction the CPU has executed - remaining means not covered by other sibling nodes. May undercount due to FMA double counting",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 0 ([SNB+] ALU; [HSW+] ALU and 2nd branch)",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_0 / CORE_CLKS",
-        "MetricGroup": "Compute;TopdownL6;tma_L6_group;tma_alu_op_utilization_group",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_0 / tma_info_core_clks",
+        "MetricGroup": "Compute;TopdownL6;tma_L6_group;tma_alu_op_utilization_group;tma_issue2P",
         "MetricName": "tma_port_0",
+        "MetricThreshold": "tma_port_0 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 0 ([SNB+] ALU; [HSW+] ALU and 2nd branch). Sample with: UOPS_DISPATCHED_PORT.PORT_0. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_1, tma_port_5, tma_port_6, tma_ports_utilized_2",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 1 (ALU)",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_1 / CORE_CLKS",
-        "MetricGroup": "TopdownL6;tma_L6_group;tma_alu_op_utilization_group",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_1 / tma_info_core_clks",
+        "MetricGroup": "TopdownL6;tma_L6_group;tma_alu_op_utilization_group;tma_issue2P",
         "MetricName": "tma_port_1",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 5 ([SNB+] Branches and ALU; [HSW+] ALU)",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_5 / CORE_CLKS",
-        "MetricGroup": "TopdownL6;tma_L6_group;tma_alu_op_utilization_group",
-        "MetricName": "tma_port_5",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 6 ([HSW+]Primary Branch and simple ALU)",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_6 / CORE_CLKS",
-        "MetricGroup": "TopdownL6;tma_L6_group;tma_alu_op_utilization_group",
-        "MetricName": "tma_port_6",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port for Load operations",
-        "MetricExpr": "(UOPS_DISPATCHED_PORT.PORT_2 + UOPS_DISPATCHED_PORT.PORT_3 + UOPS_DISPATCHED_PORT.PORT_7 - UOPS_DISPATCHED_PORT.PORT_4) / (2 * CORE_CLKS)",
-        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group",
-        "MetricName": "tma_load_op_utilization",
+        "MetricThreshold": "tma_port_1 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 1 (ALU). Sample with: UOPS_DISPATCHED_PORT.PORT_1. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_0, tma_port_5, tma_port_6, tma_ports_utilized_2",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 2 ([SNB+]Loads and Store-address; [ICL+] Loads)",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_2 / CORE_CLKS",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_2 / tma_info_core_clks",
         "MetricGroup": "TopdownL6;tma_L6_group;tma_load_op_utilization_group",
         "MetricName": "tma_port_2",
+        "MetricThreshold": "tma_port_2 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 2 ([SNB+]Loads and Store-address; [ICL+] Loads). Sample with: UOPS_DISPATCHED_PORT.PORT_2",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 3 ([SNB+]Loads and Store-address; [ICL+] Loads)",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_3 / CORE_CLKS",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_3 / tma_info_core_clks",
         "MetricGroup": "TopdownL6;tma_L6_group;tma_load_op_utilization_group",
         "MetricName": "tma_port_3",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port for Store operations",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_4 / CORE_CLKS",
-        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group",
-        "MetricName": "tma_store_op_utilization",
+        "MetricThreshold": "tma_port_3 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 3 ([SNB+]Loads and Store-address; [ICL+] Loads). Sample with: UOPS_DISPATCHED_PORT.PORT_3",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 4 (Store-data)",
         "MetricExpr": "tma_store_op_utilization",
-        "MetricGroup": "TopdownL6;tma_L6_group;tma_store_op_utilization_group",
+        "MetricGroup": "TopdownL6;tma_L6_group;tma_issueSpSt;tma_store_op_utilization_group",
         "MetricName": "tma_port_4",
+        "MetricThreshold": "tma_port_4 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 4 (Store-data). Sample with: UOPS_DISPATCHED_PORT.PORT_4. Related metrics: tma_split_stores",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 7 ([HSW+]simple Store-address)",
-        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_7 / CORE_CLKS",
-        "MetricGroup": "TopdownL6;tma_L6_group;tma_store_op_utilization_group",
-        "MetricName": "tma_port_7",
+        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 5 ([SNB+] Branches and ALU; [HSW+] ALU)",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_5 / tma_info_core_clks",
+        "MetricGroup": "TopdownL6;tma_L6_group;tma_alu_op_utilization_group;tma_issue2P",
+        "MetricName": "tma_port_5",
+        "MetricThreshold": "tma_port_5 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 5 ([SNB+] Branches and ALU; [HSW+] ALU). Sample with: UOPS_DISPATCHED.PORT_5. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_0, tma_port_1, tma_port_6, tma_ports_utilized_2",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / SLOTS",
-        "MetricGroup": "TopdownL1;tma_L1_group;tma_L1_group",
-        "MetricName": "tma_retiring",
-        "PublicDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired. Ideally; all pipeline slots would be attributed to the Retiring category.  Retiring of 100% would indicate the maximum Pipeline_Width throughput was achieved.  Maximizing Retiring typically increases the Instructions-per-cycle (see IPC metric). Note that a high Retiring value does not necessary mean there is no room for more performance.  For example; Heavy-operations or Microcode Assists are categorized under Retiring. They often indicate suboptimal performance and can often be optimized or avoided. ",
+        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 6 ([HSW+]Primary Branch and simple ALU)",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_6 / tma_info_core_clks",
+        "MetricGroup": "TopdownL6;tma_L6_group;tma_alu_op_utilization_group;tma_issue2P",
+        "MetricName": "tma_port_6",
+        "MetricThreshold": "tma_port_6 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 6 ([HSW+]Primary Branch and simple ALU). Sample with: UOPS_DISPATCHED_PORT.PORT_6. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_0, tma_port_1, tma_port_5, tma_ports_utilized_2",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation)",
-        "MetricExpr": "tma_retiring - (UOPS_RETIRED.RETIRE_SLOTS + UOPS_RETIRED.MACRO_FUSED - INST_RETIRED.ANY) / SLOTS",
-        "MetricGroup": "Retire;TopdownL2;tma_L2_group;tma_L2_group;tma_retiring_group",
-        "MetricName": "tma_light_operations",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation). This correlates with total number of instructions used by the program. A uops-per-instruction (see UPI metric) ratio of 1 or less should be expected for decently optimized software running on Intel Core/Xeon products. While this often indicates efficient X86 instructions were executed; high value does not necessarily mean better performance cannot be achieved.",
+        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 7 ([HSW+]simple Store-address)",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_7 / tma_info_core_clks",
+        "MetricGroup": "TopdownL6;tma_L6_group;tma_store_op_utilization_group",
+        "MetricName": "tma_port_7",
+        "MetricThreshold": "tma_port_7 > 0.6",
+        "PublicDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port 7 ([HSW+]simple Store-address). Sample with: UOPS_DISPATCHED_PORT.PORT_7",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents overall arithmetic floating-point (FP) operations fraction the CPU has executed (retired)",
-        "MetricExpr": "tma_retiring * UOPS_EXECUTED.X87 / UOPS_EXECUTED.THREAD + tma_fp_scalar + tma_fp_vector",
-        "MetricGroup": "HPC;TopdownL3;tma_L3_group;tma_light_operations_group",
-        "MetricName": "tma_fp_arith",
-        "PublicDescription": "This metric represents overall arithmetic floating-point (FP) operations fraction the CPU has executed (retired). Note this metric's value may exceed its parent due to use of \"Uops\" CountDomain and FMA double-counting.",
+        "BriefDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related)",
+        "MetricExpr": "((EXE_ACTIVITY.EXE_BOUND_0_PORTS + (EXE_ACTIVITY.1_PORTS_UTIL + tma_retiring * EXE_ACTIVITY.2_PORTS_UTIL)) / tma_info_clks if ARITH.DIVIDER_ACTIVE < CYCLE_ACTIVITY.STALLS_TOTAL - CYCLE_ACTIVITY.STALLS_MEM_ANY else (EXE_ACTIVITY.1_PORTS_UTIL + tma_retiring * EXE_ACTIVITY.2_PORTS_UTIL) / tma_info_clks)",
+        "MetricGroup": "PortsUtil;TopdownL3;tma_L3_group;tma_core_bound_group",
+        "MetricName": "tma_ports_utilization",
+        "MetricThreshold": "tma_ports_utilization > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related).  Two distinct categories can be attributed into this metric: (1) heavy data-dependency among contiguous instructions would manifest in this metric - such cases are often referred to as low Instruction Level Parallelism (ILP). (2) Contention on some hardware execution unit other than Divider. For example; when there are too many multiply operations.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric serves as an approximation of legacy x87 usage",
-        "MetricExpr": "tma_retiring * UOPS_EXECUTED.X87 / UOPS_EXECUTED.THREAD",
-        "MetricGroup": "Compute;TopdownL4;tma_L4_group;tma_fp_arith_group",
-        "MetricName": "tma_x87_use",
-        "PublicDescription": "This metric serves as an approximation of legacy x87 usage. It accounts for instructions beyond X87 FP arithmetic operations; hence may be used as a thermometer to avoid X87 high usage and preferably upgrade to modern ISA. See Tip under Tuning Hint.",
+        "BriefDescription": "This metric represents fraction of cycles CPU executed no uops on any execution port (Logical Processor cycles since ICL, Physical Core cycles otherwise)",
+        "MetricExpr": "(UOPS_EXECUTED.CORE_CYCLES_NONE / 2 if #SMT_on else CYCLE_ACTIVITY.STALLS_TOTAL - CYCLE_ACTIVITY.STALLS_MEM_ANY) / tma_info_core_clks",
+        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utilization_group",
+        "MetricName": "tma_ports_utilized_0",
+        "MetricThreshold": "tma_ports_utilized_0 > 0.2 & (tma_ports_utilization > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric represents fraction of cycles CPU executed no uops on any execution port (Logical Processor cycles since ICL, Physical Core cycles otherwise). Long-latency instructions like divides may contribute to this metric.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric approximates arithmetic floating-point (FP) scalar uops fraction the CPU has retired",
-        "MetricExpr": "(FP_ARITH_INST_RETIRED.SCALAR_SINGLE + FP_ARITH_INST_RETIRED.SCALAR_DOUBLE) / UOPS_RETIRED.RETIRE_SLOTS",
-        "MetricGroup": "Compute;Flops;TopdownL4;tma_L4_group;tma_fp_arith_group",
-        "MetricName": "tma_fp_scalar",
-        "PublicDescription": "This metric approximates arithmetic floating-point (FP) scalar uops fraction the CPU has retired. May overcount due to FMA double counting.",
+        "BriefDescription": "This metric represents fraction of cycles where the CPU executed total of 1 uop per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise)",
+        "MetricExpr": "((UOPS_EXECUTED.CORE_CYCLES_GE_1 - UOPS_EXECUTED.CORE_CYCLES_GE_2) / 2 if #SMT_on else EXE_ACTIVITY.1_PORTS_UTIL) / tma_info_core_clks",
+        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_issueL1;tma_ports_utilization_group",
+        "MetricName": "tma_ports_utilized_1",
+        "MetricThreshold": "tma_ports_utilized_1 > 0.2 & (tma_ports_utilization > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric represents fraction of cycles where the CPU executed total of 1 uop per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise). This can be due to heavy data-dependency among software instructions; or over oversubscribing a particular hardware resource. In some other cases with high 1_Port_Utilized and L1_Bound; this metric can point to L1 data-cache latency bottleneck that may not necessarily manifest with complete execution starvation (due to the short L1 latency e.g. walking a linked list) - looking at the assembly can be helpful. Related metrics: tma_l1_bound",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric approximates arithmetic floating-point (FP) vector uops fraction the CPU has retired aggregated across all vector widths",
-        "MetricExpr": "min((FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE + FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE) / UOPS_RETIRED.RETIRE_SLOTS, 1)",
-        "MetricGroup": "Compute;Flops;TopdownL4;tma_L4_group;tma_fp_arith_group",
-        "MetricName": "tma_fp_vector",
-        "PublicDescription": "This metric approximates arithmetic floating-point (FP) vector uops fraction the CPU has retired aggregated across all vector widths. May overcount due to FMA double counting.",
+        "BriefDescription": "This metric represents fraction of cycles CPU executed total of 2 uops per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise)",
+        "MetricExpr": "((UOPS_EXECUTED.CORE_CYCLES_GE_2 - UOPS_EXECUTED.CORE_CYCLES_GE_3) / 2 if #SMT_on else EXE_ACTIVITY.2_PORTS_UTIL) / tma_info_core_clks",
+        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_issue2P;tma_ports_utilization_group",
+        "MetricName": "tma_ports_utilized_2",
+        "MetricThreshold": "tma_ports_utilized_2 > 0.15 & (tma_ports_utilization > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric represents fraction of cycles CPU executed total of 2 uops per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise).  Loop Vectorization -most compilers feature auto-Vectorization options today- reduces pressure on the execution ports as multiple elements are calculated with same uop. Related metrics: tma_fp_scalar, tma_fp_vector, tma_fp_vector_128b, tma_fp_vector_256b, tma_fp_vector_512b, tma_port_0, tma_port_1, tma_port_5, tma_port_6",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 128-bit wide vectors",
-        "MetricExpr": "min((FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE) / UOPS_RETIRED.RETIRE_SLOTS, 1)",
-        "MetricGroup": "Compute;Flops;TopdownL5;tma_L5_group;tma_fp_vector_group",
-        "MetricName": "tma_fp_vector_128b",
-        "PublicDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 128-bit wide vectors. May overcount due to FMA double counting.",
+        "BriefDescription": "This metric represents fraction of cycles CPU executed total of 3 or more uops per cycle on all execution ports (Logical Processor cycles since ICL, Physical Core cycles otherwise).",
+        "MetricExpr": "(UOPS_EXECUTED.CORE_CYCLES_GE_3 / 2 if #SMT_on else UOPS_EXECUTED.CORE_CYCLES_GE_3) / tma_info_core_clks",
+        "MetricGroup": "PortsUtil;TopdownL4;tma_L4_group;tma_ports_utilization_group",
+        "MetricName": "tma_ports_utilized_3m",
+        "MetricThreshold": "tma_ports_utilized_3m > 0.7 & (tma_ports_utilization > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2))",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 256-bit wide vectors",
-        "MetricExpr": "min((FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE) / UOPS_RETIRED.RETIRE_SLOTS, 1)",
-        "MetricGroup": "Compute;Flops;TopdownL5;tma_L5_group;tma_fp_vector_group",
-        "MetricName": "tma_fp_vector_256b",
-        "PublicDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 256-bit wide vectors. May overcount due to FMA double counting.",
+        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote cache in other sockets including synchronizations issues",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
+        "MetricExpr": "(89.5 * tma_info_average_frequency * MEM_LOAD_L3_MISS_RETIRED.REMOTE_HITM + 89.5 * tma_info_average_frequency * MEM_LOAD_L3_MISS_RETIRED.REMOTE_FWD) * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / tma_info_clks",
+        "MetricGroup": "Offcore;Server;Snoop;TopdownL5;tma_L5_group;tma_issueSyncxn;tma_mem_latency_group",
+        "MetricName": "tma_remote_cache",
+        "MetricThreshold": "tma_remote_cache > 0.05 & (tma_mem_latency > 0.1 & (tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)))",
+        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote cache in other sockets including synchronizations issues. This is caused often due to non-optimal NUMA allocations. #link to NUMA article. Sample with: MEM_LOAD_L3_MISS_RETIRED.REMOTE_HITM_PS;MEM_LOAD_L3_MISS_RETIRED.REMOTE_FWD_PS. Related metrics: tma_contested_accesses, tma_data_sharing, tma_false_sharing, tma_machine_clears",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 512-bit wide vectors",
-        "MetricExpr": "min((FP_ARITH_INST_RETIRED.512B_PACKED_DOUBLE + FP_ARITH_INST_RETIRED.512B_PACKED_SINGLE) / UOPS_RETIRED.RETIRE_SLOTS, 1)",
-        "MetricGroup": "Compute;Flops;TopdownL5;tma_L5_group;tma_fp_vector_group",
-        "MetricName": "tma_fp_vector_512b",
-        "PublicDescription": "This metric approximates arithmetic FP vector uops fraction the CPU has retired for 512-bit wide vectors. May overcount due to FMA double counting.",
+        "BriefDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote memory",
+        "MetricExpr": "127 * tma_info_average_frequency * MEM_LOAD_L3_MISS_RETIRED.REMOTE_DRAM * (1 + MEM_LOAD_RETIRED.FB_HIT / MEM_LOAD_RETIRED.L1_MISS / 2) / tma_info_clks",
+        "MetricGroup": "Server;Snoop;TopdownL5;tma_L5_group;tma_mem_latency_group",
+        "MetricName": "tma_remote_dram",
+        "MetricThreshold": "tma_remote_dram > 0.1 & (tma_mem_latency > 0.1 & (tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)))",
+        "PublicDescription": "This metric estimates fraction of cycles while the memory subsystem was handling loads from remote memory. This is caused often due to non-optimal NUMA allocations. #link to NUMA article. Sample with: MEM_LOAD_L3_MISS_RETIRED.REMOTE_DRAM_PS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring memory operations -- uops for memory load or store accesses.",
-        "MetricExpr": "tma_light_operations * MEM_INST_RETIRED.ANY / INST_RETIRED.ANY",
-        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
-        "MetricName": "tma_memory_operations",
+        "BriefDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / tma_info_slots",
+        "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
+        "MetricName": "tma_retiring",
+        "MetricThreshold": "tma_retiring > 0.7 | tma_heavy_operations > 0.1",
+        "PublicDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired. Ideally; all pipeline slots would be attributed to the Retiring category.  Retiring of 100% would indicate the maximum Pipeline_Width throughput was achieved.  Maximizing Retiring typically increases the Instructions-per-cycle (see IPC metric). Note that a high Retiring value does not necessary mean there is no room for more performance.  For example; Heavy-operations or Microcode Assists are categorized under Retiring. They often indicate suboptimal performance and can often be optimized or avoided. Sample with: UOPS_RETIRED.RETIRE_SLOTS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring fused instructions -- where one uop can represent multiple contiguous instructions",
-        "MetricExpr": "tma_light_operations * UOPS_RETIRED.MACRO_FUSED / UOPS_RETIRED.RETIRE_SLOTS",
-        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
-        "MetricName": "tma_fused_instructions",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring fused instructions -- where one uop can represent multiple contiguous instructions. The instruction pairs of CMP+JCC or DEC+JCC are commonly used examples.",
+        "BriefDescription": "This metric represents fraction of cycles the CPU issue-pipeline was stalled due to serializing operations",
+        "MetricExpr": "PARTIAL_RAT_STALLS.SCOREBOARD / tma_info_clks",
+        "MetricGroup": "PortsUtil;TopdownL5;tma_L5_group;tma_issueSO;tma_ports_utilized_0_group",
+        "MetricName": "tma_serializing_operation",
+        "MetricThreshold": "tma_serializing_operation > 0.1 & (tma_ports_utilized_0 > 0.2 & (tma_ports_utilization > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2)))",
+        "PublicDescription": "This metric represents fraction of cycles the CPU issue-pipeline was stalled due to serializing operations. Instructions like CPUID; WRMSR or LFENCE serialize the out-of-order execution which may limit performance. Sample with: PARTIAL_RAT_STALLS.SCOREBOARD. Related metrics: tma_ms_switches",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring branch instructions that were not fused",
-        "MetricExpr": "tma_light_operations * (BR_INST_RETIRED.ALL_BRANCHES - UOPS_RETIRED.MACRO_FUSED) / UOPS_RETIRED.RETIRE_SLOTS",
-        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
-        "MetricName": "tma_non_fused_branches",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring branch instructions that were not fused. Non-conditional branches like direct JMP or CALL would count here. Can be used to examine fusible conditional jumps that were not fused.",
+        "BriefDescription": "This metric estimates fraction of cycles handling memory load split accesses - load that cross 64-byte cache line boundary",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
+        "MetricExpr": "tma_info_load_miss_real_latency * LD_BLOCKS.NO_SR / tma_info_clks",
+        "MetricGroup": "TopdownL4;tma_L4_group;tma_l1_bound_group",
+        "MetricName": "tma_split_loads",
+        "MetricThreshold": "tma_split_loads > 0.2 & (tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles handling memory load split accesses - load that cross 64-byte cache line boundary. Sample with: MEM_INST_RETIRED.SPLIT_LOADS_PS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring NOP (no op) instructions",
-        "MetricExpr": "tma_light_operations * INST_RETIRED.NOP / UOPS_RETIRED.RETIRE_SLOTS",
-        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
-        "MetricName": "tma_nop_instructions",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring NOP (no op) instructions. Compilers often use NOPs for certain address alignments - e.g. start address of a function or loop body.",
+        "BriefDescription": "This metric represents rate of split store accesses",
+        "MetricExpr": "MEM_INST_RETIRED.SPLIT_STORES / tma_info_core_clks",
+        "MetricGroup": "TopdownL4;tma_L4_group;tma_issueSpSt;tma_store_bound_group",
+        "MetricName": "tma_split_stores",
+        "MetricThreshold": "tma_split_stores > 0.2 & (tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric represents rate of split store accesses.  Consider aligning your data to the 64-byte cache line granularity. Sample with: MEM_INST_RETIRED.SPLIT_STORES_PS. Related metrics: tma_port_4",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents the remaining light uops fraction the CPU has executed - remaining means not covered by other sibling nodes. May undercount due to FMA double counting",
-        "MetricExpr": "max(0, tma_light_operations - (tma_fp_arith + tma_memory_operations + tma_fused_instructions + tma_non_fused_branches + tma_nop_instructions))",
-        "MetricGroup": "Pipeline;TopdownL3;tma_L3_group;tma_light_operations_group",
-        "MetricName": "tma_other_light_ops",
+        "BriefDescription": "This metric measures fraction of cycles where the Super Queue (SQ) was full taking into account all request-types and both hardware SMT threads (Logical Processors)",
+        "MetricExpr": "(OFFCORE_REQUESTS_BUFFER.SQ_FULL / 2 if #SMT_on else OFFCORE_REQUESTS_BUFFER.SQ_FULL) / tma_info_core_clks",
+        "MetricGroup": "MemoryBW;Offcore;TopdownL4;tma_L4_group;tma_issueBW;tma_l3_bound_group",
+        "MetricName": "tma_sq_full",
+        "MetricThreshold": "tma_sq_full > 0.3 & (tma_l3_bound > 0.05 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric measures fraction of cycles where the Super Queue (SQ) was full taking into account all request-types and both hardware SMT threads (Logical Processors). Related metrics: tma_fb_full, tma_info_dram_bw_use, tma_info_memory_bandwidth, tma_mem_bandwidth",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or microcoded sequences",
-        "MetricExpr": "(UOPS_RETIRED.RETIRE_SLOTS + UOPS_RETIRED.MACRO_FUSED - INST_RETIRED.ANY) / SLOTS",
-        "MetricGroup": "Retire;TopdownL2;tma_L2_group;tma_L2_group;tma_retiring_group",
-        "MetricName": "tma_heavy_operations",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or microcoded sequences. This highly-correlates with the uop length of these instructions/sequences.",
+        "BriefDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write",
+        "MetricExpr": "EXE_ACTIVITY.BOUND_ON_STORES / tma_info_clks",
+        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
+        "MetricName": "tma_store_bound",
+        "MetricThreshold": "tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write. Even though store accesses do not typically stall out-of-order CPUs; there are few cases where stores can lead to actual stalls. This metric will be flagged should RFO stores be a bottleneck. Sample with: MEM_INST_RETIRED.ALL_STORES_PS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring instructions that that are decoder into two or up to ([SNB+] four; [ADL+] five) uops",
-        "MetricExpr": "tma_heavy_operations - UOPS_RETIRED.RETIRE_SLOTS / UOPS_ISSUED.ANY * IDQ.MS_UOPS / SLOTS",
-        "MetricGroup": "TopdownL3;tma_L3_group;tma_heavy_operations_group",
-        "MetricName": "tma_few_uops_instructions",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring instructions that that are decoder into two or up to ([SNB+] four; [ADL+] five) uops. This highly-correlates with the number of uops in such instructions.",
+        "BriefDescription": "This metric roughly estimates fraction of cycles when the memory subsystem had loads blocked since they could not forward data from earlier (in program order) overlapping stores",
+        "MetricExpr": "13 * LD_BLOCKS.STORE_FORWARD / tma_info_clks",
+        "MetricGroup": "TopdownL4;tma_L4_group;tma_l1_bound_group",
+        "MetricName": "tma_store_fwd_blk",
+        "MetricThreshold": "tma_store_fwd_blk > 0.1 & (tma_l1_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric roughly estimates fraction of cycles when the memory subsystem had loads blocked since they could not forward data from earlier (in program order) overlapping stores. To streamline memory operations in the pipeline; a load can avoid waiting for memory if a prior in-flight store is writing the data that the load wants to read (store forwarding process). However; in some cases the load may be blocked for a significant time pending the store forward. For example; when the prior store is writing a smaller region than the load is reading.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / UOPS_ISSUED.ANY * IDQ.MS_UOPS / SLOTS",
-        "MetricGroup": "MicroSeq;TopdownL3;tma_L3_group;tma_heavy_operations_group",
-        "MetricName": "tma_microcode_sequencer",
-        "PublicDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit.  The MS is used for CISC instructions not supported by the default decoders (like repeat move strings; or CPUID); or by microcode assists used to address some operation modes (like in Floating Point assists). These cases can often be avoided.",
+        "BriefDescription": "This metric estimates fraction of cycles the CPU spent handling L1D store misses",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
+        "MetricExpr": "(L2_RQSTS.RFO_HIT * 11 * (1 - MEM_INST_RETIRED.LOCK_LOADS / MEM_INST_RETIRED.ALL_STORES) + (1 - MEM_INST_RETIRED.LOCK_LOADS / MEM_INST_RETIRED.ALL_STORES) * min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DEMAND_RFO)) / tma_info_clks",
+        "MetricGroup": "MemoryLat;Offcore;TopdownL4;tma_L4_group;tma_issueRFO;tma_issueSL;tma_store_bound_group",
+        "MetricName": "tma_store_latency",
+        "MetricThreshold": "tma_store_latency > 0.1 & (tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles the CPU spent handling L1D store misses. Store accesses usually less impact out-of-order core performance; however; holding resources for longer time can lead into undesired implications (e.g. contention on L1D fill-buffer entries - see FB_Full). Related metrics: tma_fb_full, tma_lock_latency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of slots the CPU retired uops delivered by the Microcode_Sequencer as a result of Assists",
-        "MetricExpr": "min(100 * (FP_ASSIST.ANY + OTHER_ASSISTS.ANY) / SLOTS, 1)",
-        "MetricGroup": "TopdownL4;tma_L4_group;tma_microcode_sequencer_group",
-        "MetricName": "tma_assists",
-        "PublicDescription": "This metric estimates fraction of slots the CPU retired uops delivered by the Microcode_Sequencer as a result of Assists. Assists are long sequences of uops that are required in certain corner-cases for operations that cannot be handled natively by the execution pipeline. For example; when working with very small floating point values (so-called Denormals); the FP units are not set up to perform these operations natively. Instead; a sequence of instructions to perform the computation on the Denormals is injected into the pipeline. Since these microcode sequences might be dozens of uops long; Assists can be extremely deleterious to performance and they can be avoided in many cases.",
+        "BriefDescription": "This metric represents Core fraction of cycles CPU dispatched uops on execution port for Store operations",
+        "MetricExpr": "UOPS_DISPATCHED_PORT.PORT_4 / tma_info_core_clks",
+        "MetricGroup": "TopdownL5;tma_L5_group;tma_ports_utilized_3m_group",
+        "MetricName": "tma_store_op_utilization",
+        "MetricThreshold": "tma_store_op_utilization > 0.6",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles the CPU retired uops originated from CISC (complex instruction set computer) instruction",
-        "MetricExpr": "max(0, tma_microcode_sequencer - tma_assists)",
-        "MetricGroup": "TopdownL4;tma_L4_group;tma_microcode_sequencer_group",
-        "MetricName": "tma_cisc",
-        "PublicDescription": "This metric estimates fraction of cycles the CPU retired uops originated from CISC (complex instruction set computer) instruction. A CISC instruction has multiple uops that are required to perform the instruction's functionality as in the case of read-modify-write as an example. Since these instructions require multiple uops they may or may not imply sub-optimal use of machine resources.",
+        "BriefDescription": "This metric roughly estimates the fraction of cycles where the TLB was missed by store accesses, hitting in the second-level TLB (STLB)",
+        "MetricExpr": "tma_dtlb_store - tma_store_stlb_miss",
+        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_store_group",
+        "MetricName": "tma_store_stlb_hit",
+        "MetricThreshold": "tma_store_stlb_hit > 0.05 & (tma_dtlb_store > 0.05 & (tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)))",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C3 residency percent per core",
-        "MetricExpr": "cstate_core@c3\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C3_Core_Residency",
+        "BriefDescription": "This metric estimates the fraction of cycles where the STLB was missed by store accesses, performing a hardware page walk",
+        "MetricExpr": "DTLB_STORE_MISSES.WALK_ACTIVE / tma_info_core_clks",
+        "MetricGroup": "MemoryTLB;TopdownL5;tma_L5_group;tma_dtlb_store_group",
+        "MetricName": "tma_store_stlb_miss",
+        "MetricThreshold": "tma_store_stlb_miss > 0.05 & (tma_dtlb_store > 0.05 & (tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)))",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C6 residency percent per core",
-        "MetricExpr": "cstate_core@c6\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C6_Core_Residency",
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to new branch address clears",
+        "MetricExpr": "9 * BACLEARS.ANY / tma_info_clks",
+        "MetricGroup": "BigFoot;FetchLat;TopdownL4;tma_L4_group;tma_branch_resteers_group",
+        "MetricName": "tma_unknown_branches",
+        "MetricThreshold": "tma_unknown_branches > 0.05 & (tma_branch_resteers > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15))",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to new branch address clears. These are fetched branches the Branch Prediction Unit was unable to recognize (e.g. first time the branch is fetched or hitting BTB capacity limit). Sample with: BACLEARS.ANY",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C7 residency percent per core",
-        "MetricExpr": "cstate_core@c7\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C7_Core_Residency",
+        "BriefDescription": "This metric serves as an approximation of legacy x87 usage",
+        "MetricExpr": "tma_retiring * UOPS_EXECUTED.X87 / UOPS_EXECUTED.THREAD",
+        "MetricGroup": "Compute;TopdownL4;tma_L4_group;tma_fp_arith_group",
+        "MetricName": "tma_x87_use",
+        "MetricThreshold": "tma_x87_use > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6)",
+        "PublicDescription": "This metric serves as an approximation of legacy x87 usage. It accounts for instructions beyond X87 FP arithmetic operations; hence may be used as a thermometer to avoid X87 high usage and preferably upgrade to modern ISA. See Tip under Tuning Hint.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C2 residency percent per package",
-        "MetricExpr": "cstate_pkg@c2\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C2_Pkg_Residency",
+        "BriefDescription": "Percentage of cycles in aborted transactions.",
+        "MetricExpr": "max(cpu@cycles\\-t@ - cpu@cycles\\-ct@, 0) / cycles",
+        "MetricGroup": "transaction",
+        "MetricName": "tsx_aborted_cycles",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C3 residency percent per package",
-        "MetricExpr": "cstate_pkg@c3\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C3_Pkg_Residency",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Number of cycles within a transaction divided by the number of elisions.",
+        "MetricExpr": "cpu@cycles\\-t@ / cpu@el\\-start@",
+        "MetricGroup": "transaction",
+        "MetricName": "tsx_cycles_per_elision",
+        "ScaleUnit": "1cycles / elision"
     },
     {
-        "BriefDescription": "C6 residency percent per package",
-        "MetricExpr": "cstate_pkg@c6\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C6_Pkg_Residency",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Number of cycles within a transaction divided by the number of transactions.",
+        "MetricExpr": "cpu@cycles\\-t@ / cpu@tx\\-start@",
+        "MetricGroup": "transaction",
+        "MetricName": "tsx_cycles_per_transaction",
+        "ScaleUnit": "1cycles / transaction"
     },
     {
-        "BriefDescription": "C7 residency percent per package",
-        "MetricExpr": "cstate_pkg@c7\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C7_Pkg_Residency",
+        "BriefDescription": "Percentage of cycles within a transaction region.",
+        "MetricExpr": "cpu@cycles\\-t@ / cycles",
+        "MetricGroup": "transaction",
+        "MetricName": "tsx_transactional_cycles",
         "ScaleUnit": "100%"
     }
 ]
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/uncore-memory.json b/tools/perf/pmu-events/arch/x86/skylakex/uncore-memory.json
index 8784118123b4..e0840c24e7aa 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/uncore-memory.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/uncore-memory.json
@@ -1952,7 +1952,7 @@
         "EventCode": "0x81",
         "EventName": "UNC_M_WPQ_OCCUPANCY",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries in the Write Pending Queue (WPQ) at each cycle.  This can then be used to calculate both the average queue occupancy (in conjunction with the number of cycles not empty) and the average latency (in conjunction with the number of allocations).  The WPQ is used to schedule writes out to the memory controller and to track the requests.  Requests allocate into the WPQ soon after they enter the memory controller, and need credits for an entry in this buffer before being sent from the CHA to the iMC (memory controller).  They deallocate after being issued to DRAM.  Write requests themselves are able to complete (from the perspective of the rest of the system) as soon they have 'posted' to the iMC.  This is not to be confused with actually performing the write to DRAM.  Therefore, the average latency for this queue is actually not useful for deconstruction intermediate write latencies.  So, we provide filtering based on if the requ
 est has posted or not.  By using the 'not posted' filter, we can track how long writes spent in the iMC before completions were sent to the HA.  The 'posted' filter, on the other hand, provides information about how much queueing is actually happenning in the iMC for writes before they are actually issued to memory.  High average occupancies will generally coincide with high write major mode counts. Is there a filter of sorts???",
+        "PublicDescription": "Counts the number of entries in the Write Pending Queue (WPQ) at each cycle.  This can then be used to calculate both the average queue occupancy (in conjunction with the number of cycles not empty) and the average latency (in conjunction with the number of allocations).  The WPQ is used to schedule writes out to the memory controller and to track the requests.  Requests allocate into the WPQ soon after they enter the memory controller, and need credits for an entry in this buffer before being sent from the CHA to the iMC (memory controller).  They deallocate after being issued to DRAM.  Write requests themselves are able to complete (from the perspective of the rest of the system) as soon they have 'posted' to the iMC.  This is not to be confused with actually performing the write to DRAM.  Therefore, the average latency for this queue is actually not useful for deconstruction intermediate write latencies.  So, we provide filtering based on if the requ
 est has posted or not.  By using the 'not posted' filter, we can track how long writes spent in the iMC before completions were sent to the HA.  The 'posted' filter, on the other hand, provides information about how much queueing is actually happening in the iMC for writes before they are actually issued to memory.  High average occupancies will generally coincide with high write major mode counts. Is there a filter of sorts???",
         "Unit": "iMC"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/uncore-other.json b/tools/perf/pmu-events/arch/x86/skylakex/uncore-other.json
index 37003115c6c7..92a4bdcd4bd7 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/uncore-other.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/uncore-other.json
@@ -804,7 +804,7 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "Counts the number of Allocate/Update to HitMe Cache; Deallocate HtiME$ on Reads without RspFwdI*",
+        "BriefDescription": "Counts the number of Allocate/Update to HitMe Cache; Deallocate HitME$ on Reads without RspFwdI*",
         "EventCode": "0x61",
         "EventName": "UNC_CHA_HITME_UPDATE.DEALLOCATE",
         "PerPkg": "1",
@@ -3321,7 +3321,7 @@
         "EventCode": "0x5C",
         "EventName": "UNC_CHA_SNOOP_RESP.RSP_FWD_WB",
         "PerPkg": "1",
-        "PublicDescription": "Counts when a transaction with the opcode type Rsp*Fwd*WB Snoop Response was received which indicates the data was written back to its home socket, and the cacheline was forwarded to the requestor socket.  This snoop response is only used in &gt;= 4 socket systems.  It is used when a snoop HITM's in a remote caching agent and it directly forwards data to a requestor, and simultaneously returns data to its home socket to be written back to memory.",
+        "PublicDescription": "Counts when a transaction with the opcode type Rsp*Fwd*WB Snoop Response was received which indicates the data was written back to its home socket, and the cacheline was forwarded to the requestor socket.  This snoop response is only used in >= 4 socket systems.  It is used when a snoop HITM's in a remote caching agent and it directly forwards data to a requestor, and simultaneously returns data to its home socket to be written back to memory.",
         "UMask": "0x20",
         "Unit": "CHA"
     },
@@ -4039,20 +4039,22 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_CRD",
+        "BriefDescription": "TOR Occupancy : CRds issued by iA Cores that Hit the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_CRD",
         "Filter": "config1=0x40233",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : CRds issued by iA Cores that Hit the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x11",
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_DRD",
+        "BriefDescription": "TOR Occupancy : DRds issued by iA Cores that Hit the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_DRD",
         "Filter": "config1=0x40433",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : DRds issued by iA Cores that Hit the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x11",
         "Unit": "CHA"
     },
@@ -4075,20 +4077,22 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_LlcPrefRFO",
+        "BriefDescription": "TOR Occupancy : LLCPrefRFO issued by iA Cores that hit the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_LlcPrefRFO",
         "Filter": "config1=0x4b033",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : LLCPrefRFO issued by iA Cores that hit the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x11",
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_RFO",
+        "BriefDescription": "TOR Occupancy : RFOs issued by iA Cores that Hit the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_HIT_RFO",
         "Filter": "config1=0x40033",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : RFOs issued by iA Cores that Hit the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x11",
         "Unit": "CHA"
     },
@@ -4102,20 +4106,22 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_CRD",
+        "BriefDescription": "TOR Occupancy : CRds issued by iA Cores that Missed the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_CRD",
         "Filter": "config1=0x40233",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : CRds issued by iA Cores that Missed the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x21",
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD",
+        "BriefDescription": "TOR Occupancy : DRds issued by iA Cores that Missed the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD",
         "Filter": "config1=0x40433",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : DRds issued by iA Cores that Missed the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x21",
         "Unit": "CHA"
     },
@@ -4138,20 +4144,22 @@
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_LlcPrefRFO",
+        "BriefDescription": "TOR Occupancy : LLCPrefRFO issued by iA Cores that missed the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_LlcPrefRFO",
         "Filter": "config1=0x4b033",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : LLCPrefRFO issued by iA Cores that missed the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x21",
         "Unit": "CHA"
     },
     {
-        "BriefDescription": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_RFO",
+        "BriefDescription": "TOR Occupancy : RFOs issued by iA Cores that Missed the LLC",
         "EventCode": "0x36",
         "EventName": "UNC_CHA_TOR_OCCUPANCY.IA_MISS_RFO",
         "Filter": "config1=0x40033",
         "PerPkg": "1",
+        "PublicDescription": "TOR Occupancy : RFOs issued by iA Cores that Missed the LLC : For each cycle, this event accumulates the number of valid entries in the TOR that match qualifications specified by the subevent.     Does not include addressless requests such as locks and interrupts.",
         "UMask": "0x21",
         "Unit": "CHA"
     },
@@ -11909,7 +11917,7 @@
         "Unit": "IIO"
     },
     {
-        "BriefDescription": "UNC_IIO_NOTHING",
+        "BriefDescription": "Counting disabled",
         "EventName": "UNC_IIO_NOTHING",
         "PerPkg": "1",
         "Unit": "IIO"
@@ -15507,7 +15515,7 @@
         "EventCode": "0xC",
         "EventName": "UNC_I_TxS_REQUEST_OCCUPANCY",
         "PerPkg": "1",
-        "PublicDescription": "Accumultes the number of outstanding outbound requests from the IRP to the switch (towards the devices).  This can be used in conjuection with the allocations event in order to calculate average latency of outbound requests.",
+        "PublicDescription": "Accumulates the number of outstanding outbound requests from the IRP to the switch (towards the devices).  This can be used in conjunction with the allocations event in order to calculate average latency of outbound requests.",
         "Unit": "IRP"
     },
     {
@@ -16013,35 +16021,35 @@
         "Unit": "M2M"
     },
     {
-        "BriefDescription": "Number of reads in which direct to Intel UPI transactions were overridden",
+        "BriefDescription": "Number of reads in which direct to Intel(R) UPI transactions were overridden",
         "EventCode": "0x28",
         "EventName": "UNC_M2M_DIRECT2UPI_NOT_TAKEN_CREDITS",
         "PerPkg": "1",
-        "PublicDescription": "Counts reads in which direct to Intel Ultra Path Interconnect (UPI) transactions (which would have bypassed the CHA) were overridden",
+        "PublicDescription": "Counts reads in which direct to Intel(R) Ultra Path Interconnect (UPI) transactions (which would have bypassed the CHA) were overridden",
         "Unit": "M2M"
     },
     {
-        "BriefDescription": "Cycles when direct to Intel UPI was disabled",
+        "BriefDescription": "Cycles when direct to Intel(R) UPI was disabled",
         "EventCode": "0x27",
         "EventName": "UNC_M2M_DIRECT2UPI_NOT_TAKEN_DIRSTATE",
         "PerPkg": "1",
-        "PublicDescription": "Counts cycles when the ability to send messages direct to the Intel Ultra Path Interconnect (bypassing the CHA) was disabled",
+        "PublicDescription": "Counts cycles when the ability to send messages direct to the Intel(R) Ultra Path Interconnect (bypassing the CHA) was disabled",
         "Unit": "M2M"
     },
     {
-        "BriefDescription": "Messages sent direct to the Intel UPI",
+        "BriefDescription": "Messages sent direct to the Intel(R) UPI",
         "EventCode": "0x26",
         "EventName": "UNC_M2M_DIRECT2UPI_TAKEN",
         "PerPkg": "1",
-        "PublicDescription": "Counts when messages were sent direct to the Intel Ultra Path Interconnect (bypassing the CHA)",
+        "PublicDescription": "Counts when messages were sent direct to the Intel(R) Ultra Path Interconnect (bypassing the CHA)",
         "Unit": "M2M"
     },
     {
-        "BriefDescription": "Number of reads that a message sent direct2 Intel UPI was overridden",
+        "BriefDescription": "Number of reads that a message sent direct2 Intel(R) UPI was overridden",
         "EventCode": "0x29",
         "EventName": "UNC_M2M_DIRECT2UPI_TXN_OVERRIDE",
         "PerPkg": "1",
-        "PublicDescription": "Counts when a read message that was sent direct to the Intel Ultra Path Interconnect (bypassing the CHA) was overridden",
+        "PublicDescription": "Counts when a read message that was sent direct to the Intel(R) Ultra Path Interconnect (bypassing the CHA) was overridden",
         "Unit": "M2M"
     },
     {
@@ -20785,7 +20793,7 @@
         "EventCode": "0x61",
         "EventName": "UNC_M3UPI_RxC_CRD_OCC.FLITS_IN_FIFO",
         "PerPkg": "1",
-        "PublicDescription": "Occupancy of m3upi ingress -&gt; upi link layer bgf; packets (flits) in fifo",
+        "PublicDescription": "Occupancy of m3upi ingress -> upi link layer bgf; packets (flits) in fifo",
         "UMask": "0x2",
         "Unit": "M3UPI"
     },
@@ -20794,7 +20802,7 @@
         "EventCode": "0x61",
         "EventName": "UNC_M3UPI_RxC_CRD_OCC.FLITS_IN_PATH",
         "PerPkg": "1",
-        "PublicDescription": "Occupancy of m3upi ingress -&gt; upi link layer bgf; packets (flits) in path (i.e. pipe to fifo or fifo)",
+        "PublicDescription": "Occupancy of m3upi ingress -> upi link layer bgf; packets (flits) in path (i.e. pipe to fifo or fifo)",
         "UMask": "0x4",
         "Unit": "M3UPI"
     },
@@ -21180,7 +21188,7 @@
         "Unit": "M3UPI"
     },
     {
-        "BriefDescription": "Flit Gen - Header 1; Acumullate",
+        "BriefDescription": "Flit Gen - Header 1; Accumulate",
         "EventCode": "0x53",
         "EventName": "UNC_M3UPI_RxC_FLIT_GEN_HDR1.ACCUM",
         "PerPkg": "1",
@@ -21851,7 +21859,7 @@
         "Unit": "M3UPI"
     },
     {
-        "BriefDescription": "Remote VNA Credits; Level &lt; 1",
+        "BriefDescription": "Remote VNA Credits; Level < 1",
         "EventCode": "0x5B",
         "EventName": "UNC_M3UPI_RxC_VNA_CRD.LT1",
         "PerPkg": "1",
@@ -21860,7 +21868,7 @@
         "Unit": "M3UPI"
     },
     {
-        "BriefDescription": "Remote VNA Credits; Level &lt; 4",
+        "BriefDescription": "Remote VNA Credits; Level < 4",
         "EventCode": "0x5B",
         "EventName": "UNC_M3UPI_RxC_VNA_CRD.LT4",
         "PerPkg": "1",
@@ -21869,7 +21877,7 @@
         "Unit": "M3UPI"
     },
     {
-        "BriefDescription": "Remote VNA Credits; Level &lt; 5",
+        "BriefDescription": "Remote VNA Credits; Level < 5",
         "EventCode": "0x5B",
         "EventName": "UNC_M3UPI_RxC_VNA_CRD.LT5",
         "PerPkg": "1",
@@ -24401,7 +24409,7 @@
         "EventCode": "0x29",
         "EventName": "UNC_M3UPI_UPI_PREFETCH_SPAWN",
         "PerPkg": "1",
-        "PublicDescription": "Count cases where flow control queue that sits between the Intel Ultra Path Interconnect (UPI) and the mesh spawns a prefetch to the iMC (Memory Controller)",
+        "PublicDescription": "Count cases where flow control queue that sits between the Intel(R) Ultra Path Interconnect (UPI) and the mesh spawns a prefetch to the iMC (Memory Controller)",
         "Unit": "M3UPI"
     },
     {
@@ -24756,11 +24764,11 @@
         "Unit": "M2M"
     },
     {
-        "BriefDescription": "Clocks of the Intel Ultra Path Interconnect (UPI)",
+        "BriefDescription": "Clocks of the Intel(R) Ultra Path Interconnect (UPI)",
         "EventCode": "0x1",
         "EventName": "UNC_UPI_CLOCKTICKS",
         "PerPkg": "1",
-        "PublicDescription": "Counts clockticks of the fixed frequency clock controlling the Intel Ultra Path Interconnect (UPI).  This clock runs at1/8th the 'GT/s' speed of the UPI link.  For example, a  9.6GT/s  link will have a fixed Frequency of 1.2 Ghz.",
+        "PublicDescription": "Counts clockticks of the fixed frequency clock controlling the Intel(R) Ultra Path Interconnect (UPI).  This clock runs at1/8th the 'GT/s' speed of the UPI link.  For example, a  9.6GT/s  link will have a fixed Frequency of 1.2 Ghz.",
         "Unit": "UPI LL"
     },
     {
@@ -24782,11 +24790,11 @@
         "Unit": "UPI LL"
     },
     {
-        "BriefDescription": "Data Response packets that go direct to Intel UPI",
+        "BriefDescription": "Data Response packets that go direct to Intel(R) UPI",
         "EventCode": "0x12",
         "EventName": "UNC_UPI_DIRECT_ATTEMPTS.D2U",
         "PerPkg": "1",
-        "PublicDescription": "Counts Data Response (DRS) packets that attempted to go direct to Intel Ultra Path Interconnect (UPI) bypassing the CHA .",
+        "PublicDescription": "Counts Data Response (DRS) packets that attempted to go direct to Intel(R) Ultra Path Interconnect (UPI) bypassing the CHA .",
         "UMask": "0x2",
         "Unit": "UPI LL"
     },
@@ -24855,11 +24863,11 @@
         "Unit": "UPI LL"
     },
     {
-        "BriefDescription": "Cycles Intel UPI is in L1 power mode (shutdown)",
+        "BriefDescription": "Cycles Intel(R) UPI is in L1 power mode (shutdown)",
         "EventCode": "0x21",
         "EventName": "UNC_UPI_L1_POWER_CYCLES",
         "PerPkg": "1",
-        "PublicDescription": "Counts cycles when the Intel Ultra Path Interconnect (UPI) is in L1 power mode.  L1 is a mode that totally shuts down the UPI link.  Link power states are per link and per direction, so for example the Tx direction could be in one state while Rx was in another, this event only coutns when both links are shutdown.",
+        "PublicDescription": "Counts cycles when the Intel(R) Ultra Path Interconnect (UPI) is in L1 power mode.  L1 is a mode that totally shuts down the UPI link.  Link power states are per link and per direction, so for example the Tx direction could be in one state while Rx was in another, this event only coutns when both links are shutdown.",
         "Unit": "UPI LL"
     },
     {
@@ -25021,11 +25029,11 @@
         "Unit": "UPI LL"
     },
     {
-        "BriefDescription": "Cycles the Rx of the Intel UPI is in L0p power mode",
+        "BriefDescription": "Cycles the Rx of the Intel(R) UPI is in L0p power mode",
         "EventCode": "0x25",
         "EventName": "UNC_UPI_RxL0P_POWER_CYCLES",
         "PerPkg": "1",
-        "PublicDescription": "Counts cycles when the receive side (Rx) of the Intel Ultra Path Interconnect(UPI) is in L0p power mode. L0p is a mode where we disable 60% of the UPI lanes, decreasing our bandwidth in order to save power.",
+        "PublicDescription": "Counts cycles when the receive side (Rx) of the Intel(R) Ultra Path Interconnect(UPI) is in L0p power mode. L0p is a mode where we disable 60% of the UPI lanes, decreasing our bandwidth in order to save power.",
         "Unit": "UPI LL"
     },
     {
@@ -25218,7 +25226,7 @@
         "EventCode": "0x8",
         "EventName": "UNC_UPI_RxL_CRC_LLR_REQ_TRANSMIT",
         "PerPkg": "1",
-        "PublicDescription": "Number of LLR Requests were transmitted.  This should generally be &lt;= the number of CRC errors detected.  If multiple errors are detected before the Rx side receives a LLC_REQ_ACK from the Tx side, there is no need to send more LLR_REQ_NACKs.",
+        "PublicDescription": "Number of LLR Requests were transmitted.  This should generally be <= the number of CRC errors detected.  If multiple errors are detected before the Rx side receives a LLC_REQ_ACK from the Tx side, there is no need to send more LLR_REQ_NACKs.",
         "Unit": "UPI LL"
     },
     {
@@ -25250,7 +25258,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_UPI_RxL_FLITS.ALL_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts valid data FLITs  (80 bit FLow control unITs: 64bits of data) received from any of the 3 Intel Ultra Path Interconnect (UPI) Receive Queue slots on this UPI unit.",
+        "PublicDescription": "Counts valid data FLITs  (80 bit FLow control unITs: 64bits of data) received from any of the 3 Intel(R) Ultra Path Interconnect (UPI) Receive Queue slots on this UPI unit.",
         "UMask": "0xf",
         "Unit": "UPI LL"
     },
@@ -25259,7 +25267,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_UPI_RxL_FLITS.ALL_NULL",
         "PerPkg": "1",
-        "PublicDescription": "Counts null FLITs (80 bit FLow control unITs) received from any of the 3 Intel Ultra Path Interconnect (UPI) Receive Queue slots on this UPI unit.",
+        "PublicDescription": "Counts null FLITs (80 bit FLow control unITs) received from any of the 3 Intel(R) Ultra Path Interconnect (UPI) Receive Queue slots on this UPI unit.",
         "UMask": "0x27",
         "Unit": "UPI LL"
     },
@@ -25583,11 +25591,11 @@
         "Unit": "UPI LL"
     },
     {
-        "BriefDescription": "Cycles in which the Tx of the Intel Ultra Path Interconnect (UPI) is in L0p power mode",
+        "BriefDescription": "Cycles in which the Tx of the Intel(R) Ultra Path Interconnect (UPI) is in L0p power mode",
         "EventCode": "0x27",
         "EventName": "UNC_UPI_TxL0P_POWER_CYCLES",
         "PerPkg": "1",
-        "PublicDescription": "Counts cycles when the transmit side (Tx) of the Intel Ultra Path Interconnect(UPI) is in L0p power mode. L0p is a mode where we disable 60% of the UPI lanes, decreasing our bandwidth in order to save power.",
+        "PublicDescription": "Counts cycles when the transmit side (Tx) of the Intel(R) Ultra Path Interconnect(UPI) is in L0p power mode. L0p is a mode where we disable 60% of the UPI lanes, decreasing our bandwidth in order to save power.",
         "Unit": "UPI LL"
     },
     {
@@ -25759,7 +25767,7 @@
         "EventCode": "0x41",
         "EventName": "UNC_UPI_TxL_BYPASSED",
         "PerPkg": "1",
-        "PublicDescription": "Counts incoming FLITs (FLow control unITs) which bypassed the TxL(transmit) FLIT buffer and pass directly out the UPI Link. Generally, when data is transmitted across the Intel Ultra Path Interconnect (UPI), it will bypass the TxQ and pass directly to the link.  However, the TxQ will be used in L0p (Low Power) mode and (Link Layer Retry) LLR  mode, increasing latency to transfer out to the link.",
+        "PublicDescription": "Counts incoming FLITs (FLow control unITs) which bypassed the TxL(transmit) FLIT buffer and pass directly out the UPI Link. Generally, when data is transmitted across the Intel(R) Ultra Path Interconnect (UPI), it will bypass the TxQ and pass directly to the link.  However, the TxQ will be used in L0p (Low Power) mode and (Link Layer Retry) LLR  mode, increasing latency to transfer out to the link.",
         "Unit": "UPI LL"
     },
     {
@@ -25767,7 +25775,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_UPI_TxL_FLITS.ALL_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts valid data FLITs (80 bit FLow control unITs: 64bits of data) transmitted (TxL) via any of the 3 Intel Ultra Path Interconnect (UPI) slots on this UPI unit.",
+        "PublicDescription": "Counts valid data FLITs (80 bit FLow control unITs: 64bits of data) transmitted (TxL) via any of the 3 Intel(R) Ultra Path Interconnect (UPI) slots on this UPI unit.",
         "UMask": "0xf",
         "Unit": "UPI LL"
     },
@@ -25776,7 +25784,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_UPI_TxL_FLITS.ALL_NULL",
         "PerPkg": "1",
-        "PublicDescription": "Counts null FLITs (80 bit FLow control unITs) transmitted via any of the 3 Intel Ulra Path Interconnect (UPI) slots on this UPI unit.",
+        "PublicDescription": "Counts null FLITs (80 bit FLow control unITs) transmitted via any of the 3 Intel(R) Ulra Path Interconnect (UPI) slots on this UPI unit.",
         "UMask": "0x27",
         "Unit": "UPI LL"
     },
@@ -26127,7 +26135,7 @@
         "EventCode": "0x2",
         "EventName": "UPI_DATA_BANDWIDTH_TX",
         "PerPkg": "1",
-        "PublicDescription": "Counts valid data FLITs (80 bit FLow control unITs: 64bits of data) transmitted (TxL) via any of the 3 Intel Ultra Path Interconnect (UPI) slots on this UPI unit.",
+        "PublicDescription": "Counts valid data FLITs (80 bit FLow control unITs: 64bits of data) transmitted (TxL) via any of the 3 Intel(R) Ultra Path Interconnect (UPI) slots on this UPI unit.",
         "ScaleUnit": "7.11E-06Bytes",
         "UMask": "0xf",
         "Unit": "UPI LL"
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/uncore-power.json b/tools/perf/pmu-events/arch/x86/skylakex/uncore-power.json
index 8e21dc3eff16..c6254af7a468 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/uncore-power.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/uncore-power.json
@@ -143,7 +143,7 @@
         "EventCode": "0x80",
         "EventName": "UNC_P_POWER_STATE_OCCUPANCY.CORES_C0",
         "PerPkg": "1",
-        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in the chosen C-State.  It can be used by itself to get the average number of cores in that C-state with threshholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
+        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in the chosen C-State.  It can be used by itself to get the average number of cores in that C-state with thresholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
         "Unit": "PCU"
     },
     {
@@ -151,7 +151,7 @@
         "EventCode": "0x80",
         "EventName": "UNC_P_POWER_STATE_OCCUPANCY.CORES_C3",
         "PerPkg": "1",
-        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in the chosen C-State.  It can be used by itself to get the average number of cores in that C-state with threshholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
+        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in the chosen C-State.  It can be used by itself to get the average number of cores in that C-state with thresholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
         "Unit": "PCU"
     },
     {
@@ -159,7 +159,7 @@
         "EventCode": "0x80",
         "EventName": "UNC_P_POWER_STATE_OCCUPANCY.CORES_C6",
         "PerPkg": "1",
-        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in the chosen C-State.  It can be used by itself to get the average number of cores in that C-state with threshholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
+        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in the chosen C-State.  It can be used by itself to get the average number of cores in that C-state with thresholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
         "Unit": "PCU"
     },
     {
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
