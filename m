Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24C69CBBF
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Feb 2023 14:13:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468F1C6B454;
	Mon, 20 Feb 2023 13:13:14 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1D51C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:32:10 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 o14-20020a25730e000000b009419f64f6afso2222359ybc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZa444TGelSxfyFGIASgMZVRbr1mUgy5fMfkXk2Hphs=;
 b=s8MwD3XcpksdpAQ44IhNk599hvZCE39mG8ERX3KznRk7WbK33EPKtTHl604SaZu22f
 W8udp7rA36r7w8E0tgNmbNccHgZTRlSSS+ibAhjSQDm2kR0xfrJTCUllsJ5FEoSbew8r
 9V/QOqjRnmU5oExwB1uVzUYmEpLoDTPEWHbpNWSMTlZ2njVfC/nC/iTfMw86FYFBBbsA
 fECKHQYBu+7Bg9fWIuwrxYPgcC/Zy1oh6sofUQQcbNz48pd1v/VYyYc0ygU6eZt/PVIR
 HB/fT0nE8qNWp9G4+mdhKprjItsI7wAVcMIM2OdJfg42ox/dekM3ajN+0++EeFXX7G9d
 coAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lZa444TGelSxfyFGIASgMZVRbr1mUgy5fMfkXk2Hphs=;
 b=iyYZXuaoL9+mwlaqdCYVYg49wYnqSGC2biGoz9qNaTfxUZXCX99PZJNHyiVnXDSVsE
 O2fE/KosyhidVqcj+Ihll7V6Guj6O/7PD81JpgVS+kSjxFtpGOcmHtotVLY6jNBUvh4K
 59Igl0Oobpin/gitc/yh1+bLw99rToY0tWqzj7QFVqx9ogRV+bKFohqJ6LcB6XaVvS4z
 BubK0ZplvroeQuDhmhNtbudfX52iOeF3dW2AGnicIxY8/9TGFWhMhxm1Uw3ACfJcc3Zd
 RfWDj/24Bt8eA+hHDRDWG81ZDHzFxu54azmvttQx4QXo0TgTuaK0YpLragIv9ujKiDQd
 qbKA==
X-Gm-Message-State: AO0yUKW1XvTLYifHbjFtaezThADQK54GzF900r17GPJvkVAtiVg7qWWp
 RIM53EvHiD+rfrXfA0Ln8BJC68gjJPxx
X-Google-Smtp-Source: AK7set+ScGCNWwFLva7yP399KIhjoQC04WpP4l3gpZLURZ0z5SYtuxdS8Bq6tVZ5IrgmF08eXlihMAp6zfTK
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:11cd:b0:90d:a6c0:6870 with SMTP
 id n13-20020a05690211cd00b0090da6c06870mr390938ybu.2.1676799129953; Sun, 19
 Feb 2023 01:32:09 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:20 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-24-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 23/51] perf vendor events intel: Refresh
	jaketown events
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

Update the jaketown events from 21 to 22. Generation was done
using https://github.com/intel/perfmon.

Notable changes are improved event descriptions, TMA metrics are
updated to version 4.5, TMA info metrics are renamed from their node
name to be lower case and prefixed by tma_info_, MetricThreshold
expressions are added, and the smi_cost metric group is added
replicating existing hard coded metrics in stat-shadow.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/jaketown/cache.json   |   6 +-
 .../arch/x86/jaketown/floating-point.json     |   2 +-
 .../arch/x86/jaketown/frontend.json           |  12 +-
 .../arch/x86/jaketown/jkt-metrics.json        | 602 ++++++++++--------
 .../arch/x86/jaketown/pipeline.json           |   2 +-
 .../arch/x86/jaketown/uncore-cache.json       |  22 +-
 .../x86/jaketown/uncore-interconnect.json     |  74 +--
 .../arch/x86/jaketown/uncore-memory.json      |   4 +-
 .../arch/x86/jaketown/uncore-other.json       |  22 +-
 .../arch/x86/jaketown/uncore-power.json       |   8 +-
 tools/perf/pmu-events/arch/x86/mapfile.csv    |   2 +-
 11 files changed, 409 insertions(+), 347 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/jaketown/cache.json b/tools/perf/pmu-events/arch/x86/jaketown/cache.json
index f1271039b6b2..b9769d39940c 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/cache.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/cache.json
@@ -37,7 +37,7 @@
         "UMask": "0x5"
     },
     {
-        "BriefDescription": "Cycles a demand request was blocked due to Fill Buffers inavailability.",
+        "BriefDescription": "Cycles a demand request was blocked due to Fill Buffers unavailability.",
         "CounterMask": "1",
         "EventCode": "0x48",
         "EventName": "L1D_PEND_MISS.FB_FULL",
@@ -45,7 +45,7 @@
         "UMask": "0x2"
     },
     {
-        "BriefDescription": "L1D miss oustandings duration in cycles.",
+        "BriefDescription": "L1D miss outstanding duration in cycles.",
         "EventCode": "0x48",
         "EventName": "L1D_PEND_MISS.PENDING",
         "SampleAfterValue": "2000003",
@@ -500,7 +500,7 @@
         "UMask": "0x8"
     },
     {
-        "BriefDescription": "Cacheable and noncachaeble code read requests.",
+        "BriefDescription": "Cacheable and non-cacheable code read requests.",
         "EventCode": "0xB0",
         "EventName": "OFFCORE_REQUESTS.DEMAND_CODE_RD",
         "SampleAfterValue": "100003",
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/floating-point.json b/tools/perf/pmu-events/arch/x86/jaketown/floating-point.json
index 8c2a246adef9..79e8f403c426 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/floating-point.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/floating-point.json
@@ -64,7 +64,7 @@
         "UMask": "0x20"
     },
     {
-        "BriefDescription": "Number of FP Computational Uops Executed this cycle. The number of FADD, FSUB, FCOM, FMULs, integer MULsand IMULs, FDIVs, FPREMs, FSQRTS, integer DIVs, and IDIVs. This event does not distinguish an FADD used in the middle of a transcendental flow from a s.",
+        "BriefDescription": "Number of FP Computational Uops Executed this cycle. The number of FADD, FSUB, FCOM, FMULs, integer MULs and IMULs, FDIVs, FPREMs, FSQRTS, integer DIVs, and IDIVs. This event does not distinguish an FADD used in the middle of a transcendental flow from a s.",
         "EventCode": "0x10",
         "EventName": "FP_COMP_OPS_EXE.X87",
         "SampleAfterValue": "2000003",
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/frontend.json b/tools/perf/pmu-events/arch/x86/jaketown/frontend.json
index 3f4fc3481112..754ee2749485 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/frontend.json
@@ -134,7 +134,7 @@
         "UMask": "0x4"
     },
     {
-        "BriefDescription": "Cycles when uops are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy.",
+        "BriefDescription": "Cycles when uops are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy.",
         "CounterMask": "1",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_CYCLES",
@@ -143,7 +143,7 @@
         "UMask": "0x30"
     },
     {
-        "BriefDescription": "Cycles when uops initiated by Decode Stream Buffer (DSB) are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy.",
+        "BriefDescription": "Cycles when uops initiated by Decode Stream Buffer (DSB) are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy.",
         "CounterMask": "1",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_DSB_CYCLES",
@@ -151,7 +151,7 @@
         "UMask": "0x10"
     },
     {
-        "BriefDescription": "Deliveries to Instruction Decode Queue (IDQ) initiated by Decode Stream Buffer (DSB) while Microcode Sequenser (MS) is busy.",
+        "BriefDescription": "Deliveries to Instruction Decode Queue (IDQ) initiated by Decode Stream Buffer (DSB) while Microcode Sequencer (MS) is busy.",
         "CounterMask": "1",
         "EdgeDetect": "1",
         "EventCode": "0x79",
@@ -160,14 +160,14 @@
         "UMask": "0x10"
     },
     {
-        "BriefDescription": "Uops initiated by Decode Stream Buffer (DSB) that are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy.",
+        "BriefDescription": "Uops initiated by Decode Stream Buffer (DSB) that are being delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy.",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_DSB_UOPS",
         "SampleAfterValue": "2000003",
         "UMask": "0x10"
     },
     {
-        "BriefDescription": "Uops initiated by MITE and delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy.",
+        "BriefDescription": "Uops initiated by MITE and delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy.",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_MITE_UOPS",
         "SampleAfterValue": "2000003",
@@ -183,7 +183,7 @@
         "UMask": "0x30"
     },
     {
-        "BriefDescription": "Uops delivered to Instruction Decode Queue (IDQ) while Microcode Sequenser (MS) is busy.",
+        "BriefDescription": "Uops delivered to Instruction Decode Queue (IDQ) while Microcode Sequencer (MS) is busy.",
         "EventCode": "0x79",
         "EventName": "IDQ.MS_UOPS",
         "SampleAfterValue": "2000003",
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json b/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json
index cb1420df3768..e8f4e5c01c9f 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json
@@ -1,449 +1,511 @@
 [
     {
-        "BriefDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend",
-        "MetricExpr": "IDQ_UOPS_NOT_DELIVERED.CORE / SLOTS",
-        "MetricGroup": "PGO;TopdownL1;tma_L1_group",
-        "MetricName": "tma_frontend_bound",
-        "PublicDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend. Frontend denotes the first part of the processor core responsible to fetch operations that are executed later on by the Backend part. Within the Frontend; a branch predictor predicts the next address to fetch; cache-lines are fetched from the memory subsystem; parsed into instructions; and lastly decoded into micro-operations (uops). Ideally the Frontend can issue Machine_Width uops every cycle to the Backend. Frontend Bound denotes unutilized issue-slots when there is no Backend stall; i.e. bubbles where Frontend delivered no uops while Backend could have accepted them. For example; stalls due to instruction-cache misses would be categorized under Frontend Bound.",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues",
-        "MetricExpr": "4 * min(CPU_CLK_UNHALTED.THREAD, IDQ_UOPS_NOT_DELIVERED.CYCLES_0_UOPS_DELIV.CORE) / SLOTS",
-        "MetricGroup": "Frontend;TopdownL2;tma_L2_group;tma_frontend_bound_group",
-        "MetricName": "tma_fetch_latency",
-        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues.  For example; instruction-cache misses; iTLB misses or fetch stalls after a branch misprediction are categorized under Frontend Latency. In such cases; the Frontend eventually delivers no uops for some period. Sample with: RS_EVENTS.EMPTY_END",
+        "BriefDescription": "C2 residency percent per package",
+        "MetricExpr": "cstate_pkg@c2\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C2_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Instruction TLB (ITLB) misses",
-        "MetricExpr": "(12 * ITLB_MISSES.STLB_HIT + ITLB_MISSES.WALK_DURATION) / CLKS",
-        "MetricGroup": "BigFoot;FetchLat;MemoryTLB;TopdownL3;tma_fetch_latency_group",
-        "MetricName": "tma_itlb_misses",
-        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Instruction TLB (ITLB) misses. Sample with: ITLB_MISSES.WALK_COMPLETED",
+        "BriefDescription": "C3 residency percent per core",
+        "MetricExpr": "cstate_core@c3\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C3_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers",
-        "MetricExpr": "12 * (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT + BACLEARS.ANY) / CLKS",
-        "MetricGroup": "FetchLat;TopdownL3;tma_fetch_latency_group",
-        "MetricName": "tma_branch_resteers",
-        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers. Branch Resteers estimates the Frontend delay in fetching operations from corrected path; following all sorts of miss-predicted branches. For example; branchy code with lots of miss-predictions might get categorized under Branch Resteers. Note the value of this node may overlap with its siblings. Sample with: BR_MISP_RETIRED.ALL_BRANCHES",
+        "BriefDescription": "C3 residency percent per package",
+        "MetricExpr": "cstate_pkg@c3\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C3_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines",
-        "MetricExpr": "DSB2MITE_SWITCHES.PENALTY_CYCLES / CLKS",
-        "MetricGroup": "DSBmiss;FetchLat;TopdownL3;tma_fetch_latency_group",
-        "MetricName": "tma_dsb_switches",
-        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines. The DSB (decoded i-cache) is a Uop Cache where the front-end directly delivers Uops (micro operations) avoiding heavy x86 decoding. The DSB pipeline has shorter latency and delivered higher bandwidth than the MITE (legacy instruction decode pipeline). Switching between the two pipelines can cause penalties hence this metric measures the exposed penalty.",
+        "BriefDescription": "C6 residency percent per core",
+        "MetricExpr": "cstate_core@c6\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C6_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs)",
-        "MetricExpr": "ILD_STALL.LCP / CLKS",
-        "MetricGroup": "FetchLat;TopdownL3;tma_fetch_latency_group",
-        "MetricName": "tma_lcp",
-        "PublicDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs). Using proper compiler flags or Intel Compiler by default will certainly avoid this. #Link: Optimization Guide about LCP BKMs.",
+        "BriefDescription": "C6 residency percent per package",
+        "MetricExpr": "cstate_pkg@c6\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C6_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS)",
-        "MetricExpr": "3 * IDQ.MS_SWITCHES / CLKS",
-        "MetricGroup": "FetchLat;MicroSeq;TopdownL3;tma_fetch_latency_group",
-        "MetricName": "tma_ms_switches",
-        "PublicDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS). Commonly used instructions are optimized for delivery by the DSB (decoded i-cache) or MITE (legacy instruction decode) pipelines. Certain operations cannot be handled natively by the execution pipeline; and must be performed by microcode (small programs injected into the execution stream). Switching to the MS too often can negatively impact performance. The MS is designated to deliver long uop flows required by CISC instructions like CPUID; or uncommon conditions like Floating Point Assists when dealing with Denormals. Sample with: IDQ.MS_SWITCHES",
+        "BriefDescription": "C7 residency percent per core",
+        "MetricExpr": "cstate_core@c7\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C7_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues",
-        "MetricExpr": "tma_frontend_bound - tma_fetch_latency",
-        "MetricGroup": "FetchBW;Frontend;TopdownL2;tma_L2_group;tma_frontend_bound_group",
-        "MetricName": "tma_fetch_bandwidth",
-        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues.  For example; inefficiencies at the instruction decoders; or restrictions for caching in the DSB (decoded uops cache) are categorized under Fetch Bandwidth. In such cases; the Frontend typically delivers suboptimal amount of uops to the Backend.",
+        "BriefDescription": "C7 residency percent per package",
+        "MetricExpr": "cstate_pkg@c7\\-residency@ / TSC",
+        "MetricGroup": "Power",
+        "MetricName": "C7_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This category represents fraction of slots wasted due to incorrect speculations",
-        "MetricExpr": "(UOPS_ISSUED.ANY - UOPS_RETIRED.RETIRE_SLOTS + 4 * (INT_MISC.RECOVERY_CYCLES_ANY / 2 if #SMT_on else INT_MISC.RECOVERY_CYCLES)) / SLOTS",
-        "MetricGroup": "TopdownL1;tma_L1_group",
-        "MetricName": "tma_bad_speculation",
-        "PublicDescription": "This category represents fraction of slots wasted due to incorrect speculations. This include slots used to issue uops that do not eventually get retired and slots for which the issue-pipeline was blocked due to recovery from earlier incorrect speculation. For example; wasted work due to miss-predicted branches are categorized under Bad Speculation category. Incorrect data speculation followed by Memory Ordering Nukes is another example.",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Uncore frequency per die [GHZ]",
+        "MetricExpr": "tma_info_socket_clks / #num_dies / duration_time / 1e9",
+        "MetricGroup": "SoC",
+        "MetricName": "UNCORE_FREQ"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction",
-        "MetricExpr": "BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT) * tma_bad_speculation",
-        "MetricGroup": "BadSpec;BrMispredicts;TopdownL2;tma_L2_group;tma_bad_speculation_group",
-        "MetricName": "tma_branch_mispredicts",
-        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction.  These slots are either wasted by uops fetched from an incorrectly speculated program path; or stalls when the out-of-order part of the machine needs to recover its state from a speculative path. Sample with: BR_MISP_RETIRED.ALL_BRANCHES",
+        "BriefDescription": "Percentage of cycles spent in System Management Interrupts.",
+        "MetricExpr": "((msr@aperf@ - cycles) / msr@aperf@ if msr@smi@ > 0 else 0)",
+        "MetricGroup": "smi",
+        "MetricName": "smi_cycles",
+        "MetricThreshold": "smi_cycles > 0.1",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears",
-        "MetricExpr": "tma_bad_speculation - tma_branch_mispredicts",
-        "MetricGroup": "BadSpec;MachineClears;TopdownL2;tma_L2_group;tma_bad_speculation_group",
-        "MetricName": "tma_machine_clears",
-        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears.  These slots are either wasted by uops fetched prior to the clear; or stalls the out-of-order portion of the machine needs to recover its state after the clear. For example; this can happen due to memory ordering Nukes (e.g. Memory Disambiguation) or Self-Modifying-Code (SMC) nukes. Sample with: MACHINE_CLEARS.COUNT",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Number of SMI interrupts.",
+        "MetricExpr": "msr@smi@",
+        "MetricGroup": "smi",
+        "MetricName": "smi_num",
+        "ScaleUnit": "1SMI#"
     },
     {
         "BriefDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend",
+        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "1 - (tma_frontend_bound + tma_bad_speculation + tma_retiring)",
-        "MetricGroup": "TopdownL1;tma_L1_group",
+        "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
         "MetricName": "tma_backend_bound",
+        "MetricThreshold": "tma_backend_bound > 0.2",
         "PublicDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend. Backend is the portion of the processor core where the out-of-order scheduler dispatches ready uops into their respective execution units; and once completed these uops get retired according to program order. For example; stalls due to data-cache misses or stalls due to the divider unit being overloaded are both categorized under Backend Bound. Backend Bound is further divided into two main categories: Memory Bound and Core Bound.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck",
-        "MetricExpr": "(min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_L1D_PENDING) + RESOURCE_STALLS.SB) / (min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_DISPATCH) + cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=1@ - cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=3@ if IPC > 1.8 else (cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=2@ - RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else RESOURCE_STALLS.SB)) * tma_backend_bound",
-        "MetricGroup": "Backend;TopdownL2;tma_L2_group;tma_backend_bound_group",
-        "MetricName": "tma_memory_bound",
-        "PublicDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck.  Memory Bound estimates fraction of slots where pipeline is likely stalled due to demand load or store instructions. This accounts mainly for (1) non-completed in-flight memory demand loads which coincides with execution units starvation; in addition to (2) cases where stores could impose backpressure on the pipeline when many of them get buffered at the same time (less common out of the two).",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses",
-        "MetricExpr": "(7 * DTLB_LOAD_MISSES.STLB_HIT + DTLB_LOAD_MISSES.WALK_DURATION) / CLKS",
-        "MetricGroup": "MemoryTLB;TopdownL4;tma_l1_bound_group",
-        "MetricName": "tma_dtlb_load",
-        "PublicDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses. TLBs (Translation Look-aside Buffers) are processor caches for recently used entries out of the Page Tables that are used to map virtual- to physical-addresses by the operating system. This metric approximates the potential delay of demand loads missing the first-level data TLB (assuming worst case scenario with back to back misses to different pages). This includes hitting in the second-level TLB (STLB) as well as performing a hardware page walk on an STLB miss. Sample with: MEM_UOPS_RETIRED.STLB_MISS_LOADS_PS",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates how often the CPU was stalled due to loads accesses to L3 cache or contended with a sibling Core",
-        "MetricExpr": "MEM_LOAD_UOPS_RETIRED.LLC_HIT / (MEM_LOAD_UOPS_RETIRED.LLC_HIT + 7 * MEM_LOAD_UOPS_RETIRED.LLC_MISS) * CYCLE_ACTIVITY.STALLS_L2_PENDING / CLKS",
-        "MetricGroup": "CacheMisses;MemoryBound;TmaL3mem;TopdownL3;tma_memory_bound_group",
-        "MetricName": "tma_l3_bound",
-        "PublicDescription": "This metric estimates how often the CPU was stalled due to loads accesses to L3 cache or contended with a sibling Core.  Avoiding cache misses (i.e. L2 misses/L3 hits) can improve the latency and increase performance. Sample with: MEM_LOAD_UOPS_RETIRED.L3_HIT_PS",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads",
-        "MetricExpr": "(1 - MEM_LOAD_UOPS_RETIRED.LLC_HIT / (MEM_LOAD_UOPS_RETIRED.LLC_HIT + 7 * MEM_LOAD_UOPS_RETIRED.LLC_MISS)) * CYCLE_ACTIVITY.STALLS_L2_PENDING / CLKS",
-        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_memory_bound_group",
-        "MetricName": "tma_dram_bound",
-        "PublicDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads. Better caching can improve the latency and increase performance. Sample with: MEM_LOAD_UOPS_RETIRED.L3_MISS_PS",
-        "ScaleUnit": "100%"
-    },
-    {
-        "BriefDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM)",
-        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, cpu@OFFCORE_REQUESTS_OUTSTANDING.ALL_DATA_RD\\,cmask\\=6@) / CLKS",
-        "MetricGroup": "MemoryBW;Offcore;TopdownL4;tma_dram_bound_group",
-        "MetricName": "tma_mem_bandwidth",
-        "PublicDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM).  The underlying heuristic assumes that a similar off-core traffic is generated by all IA cores. This metric does not aggregate non-data-read requests by this logical processor; requests from other IA Logical Processors/Physical Cores/sockets; or other non-IA devices like GPU; hence the maximum external memory bandwidth limits may or may not be approached when this metric is flagged (see Uncore counters for that).",
+        "BriefDescription": "This category represents fraction of slots wasted due to incorrect speculations",
+        "MetricExpr": "(UOPS_ISSUED.ANY - UOPS_RETIRED.RETIRE_SLOTS + 4 * (INT_MISC.RECOVERY_CYCLES_ANY / 2 if #SMT_on else INT_MISC.RECOVERY_CYCLES)) / tma_info_slots",
+        "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
+        "MetricName": "tma_bad_speculation",
+        "MetricThreshold": "tma_bad_speculation > 0.15",
+        "PublicDescription": "This category represents fraction of slots wasted due to incorrect speculations. This include slots used to issue uops that do not eventually get retired and slots for which the issue-pipeline was blocked due to recovery from earlier incorrect speculation. For example; wasted work due to miss-predicted branches are categorized under Bad Speculation category. Incorrect data speculation followed by Memory Ordering Nukes is another example.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM)",
-        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DATA_RD) / CLKS - tma_mem_bandwidth",
-        "MetricGroup": "MemoryLat;Offcore;TopdownL4;tma_dram_bound_group",
-        "MetricName": "tma_mem_latency",
-        "PublicDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM).  This metric does not aggregate requests from other Logical Processors/Physical Cores/sockets (see Uncore counters for that).",
+        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "BR_MISP_RETIRED.ALL_BRANCHES / (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT) * tma_bad_speculation",
+        "MetricGroup": "BadSpec;BrMispredicts;TmaL2;TopdownL2;tma_L2_group;tma_bad_speculation_group;tma_issueBM",
+        "MetricName": "tma_branch_mispredicts",
+        "MetricThreshold": "tma_branch_mispredicts > 0.1 & tma_bad_speculation > 0.15",
+        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Branch Misprediction.  These slots are either wasted by uops fetched from an incorrectly speculated program path; or stalls when the out-of-order part of the machine needs to recover its state from a speculative path. Sample with: BR_MISP_RETIRED.ALL_BRANCHES. Related metrics: tma_info_branch_misprediction_cost, tma_mispredicts_resteers",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write",
-        "MetricExpr": "RESOURCE_STALLS.SB / CLKS",
-        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_memory_bound_group",
-        "MetricName": "tma_store_bound",
-        "PublicDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write. Even though store accesses do not typically stall out-of-order CPUs; there are few cases where stores can lead to actual stalls. This metric will be flagged should RFO stores be a bottleneck. Sample with: MEM_UOPS_RETIRED.ALL_STORES_PS",
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers",
+        "MetricExpr": "12 * (BR_MISP_RETIRED.ALL_BRANCHES + MACHINE_CLEARS.COUNT + BACLEARS.ANY) / tma_info_clks",
+        "MetricGroup": "FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group",
+        "MetricName": "tma_branch_resteers",
+        "MetricThreshold": "tma_branch_resteers > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Branch Resteers. Branch Resteers estimates the Frontend delay in fetching operations from corrected path; following all sorts of miss-predicted branches. For example; branchy code with lots of miss-predictions might get categorized under Branch Resteers. Note the value of this node may overlap with its siblings. Sample with: BR_MISP_RETIRED.ALL_BRANCHES",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents fraction of slots where Core non-memory issues were of a bottleneck",
+        "MetricConstraint": "NO_GROUP_EVENTS",
         "MetricExpr": "tma_backend_bound - tma_memory_bound",
-        "MetricGroup": "Backend;Compute;TopdownL2;tma_L2_group;tma_backend_bound_group",
+        "MetricGroup": "Backend;Compute;TmaL2;TopdownL2;tma_L2_group;tma_backend_bound_group",
         "MetricName": "tma_core_bound",
+        "MetricThreshold": "tma_core_bound > 0.1 & tma_backend_bound > 0.2",
         "PublicDescription": "This metric represents fraction of slots where Core non-memory issues were of a bottleneck.  Shortage in hardware compute resources; or dependencies in software's instructions are both categorized under Core Bound. Hence it may indicate the machine ran out of an out-of-order resource; certain execution units are overloaded or dependencies in program's data- or instruction-flow are limiting the performance (e.g. FP-chained long-latency arithmetic operations).",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents fraction of cycles where the Divider unit was active",
-        "MetricExpr": "ARITH.FPU_DIV_ACTIVE / CORE_CLKS",
-        "MetricGroup": "TopdownL3;tma_core_bound_group",
+        "MetricExpr": "ARITH.FPU_DIV_ACTIVE / tma_info_core_clks",
+        "MetricGroup": "TopdownL3;tma_L3_group;tma_core_bound_group",
         "MetricName": "tma_divider",
+        "MetricThreshold": "tma_divider > 0.2 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2)",
         "PublicDescription": "This metric represents fraction of cycles where the Divider unit was active. Divide and square root instructions are performed by the Divider unit and can take considerably longer latency than integer or Floating Point addition; subtraction; or multiplication. Sample with: ARITH.DIVIDER_UOPS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related)",
-        "MetricExpr": "((min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_DISPATCH) + cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=1@ - cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=3@ if IPC > 1.8 else (cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=2@ - RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else RESOURCE_STALLS.SB)) - RESOURCE_STALLS.SB - min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_L1D_PENDING)) / CLKS",
-        "MetricGroup": "PortsUtil;TopdownL3;tma_core_bound_group",
-        "MetricName": "tma_ports_utilization",
-        "PublicDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related).  Two distinct categories can be attributed into this metric: (1) heavy data-dependency among contiguous instructions would manifest in this metric - such cases are often referred to as low Instruction Level Parallelism (ILP). (2) Contention on some hardware execution unit other than Divider. For example; when there are too many multiply operations.",
+        "BriefDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads",
+        "MetricConstraint": "NO_GROUP_EVENTS_SMT",
+        "MetricExpr": "(1 - MEM_LOAD_UOPS_RETIRED.LLC_HIT / (MEM_LOAD_UOPS_RETIRED.LLC_HIT + 7 * MEM_LOAD_UOPS_RETIRED.LLC_MISS)) * CYCLE_ACTIVITY.STALLS_L2_PENDING / tma_info_clks",
+        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
+        "MetricName": "tma_dram_bound",
+        "MetricThreshold": "tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often the CPU was stalled on accesses to external memory (DRAM) by loads. Better caching can improve the latency and increase performance. Sample with: MEM_LOAD_UOPS_RETIRED.L3_MISS_PS",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / SLOTS",
-        "MetricGroup": "TopdownL1;tma_L1_group",
-        "MetricName": "tma_retiring",
-        "PublicDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired. Ideally; all pipeline slots would be attributed to the Retiring category.  Retiring of 100% would indicate the maximum Pipeline_Width throughput was achieved.  Maximizing Retiring typically increases the Instructions-per-cycle (see IPC metric). Note that a high Retiring value does not necessary mean there is no room for more performance.  For example; Heavy-operations or Microcode Assists are categorized under Retiring. They often indicate suboptimal performance and can often be optimized or avoided.  Sample with: UOPS_RETIRED.RETIRE_SLOTS",
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines",
+        "MetricExpr": "DSB2MITE_SWITCHES.PENALTY_CYCLES / tma_info_clks",
+        "MetricGroup": "DSBmiss;FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group;tma_issueFB",
+        "MetricName": "tma_dsb_switches",
+        "MetricThreshold": "tma_dsb_switches > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to switches from DSB to MITE pipelines. The DSB (decoded i-cache) is a Uop Cache where the front-end directly delivers Uops (micro operations) avoiding heavy x86 decoding. The DSB pipeline has shorter latency and delivered higher bandwidth than the MITE (legacy instruction decode pipeline). Switching between the two pipelines can cause penalties hence this metric measures the exposed penalty. Related metrics: tma_fetch_bandwidth, tma_info_dsb_coverage, tma_lcp",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation)",
-        "MetricExpr": "tma_retiring - tma_heavy_operations",
-        "MetricGroup": "Retire;TopdownL2;tma_L2_group;tma_retiring_group",
-        "MetricName": "tma_light_operations",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation). This correlates with total number of instructions used by the program. A uops-per-instruction (see UPI metric) ratio of 1 or less should be expected for decently optimized software running on Intel Core/Xeon products. While this often indicates efficient X86 instructions were executed; high value does not necessarily mean better performance cannot be achieved. Sample with: INST_RETIRED.PREC_DIST",
+        "BriefDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses",
+        "MetricExpr": "(7 * DTLB_LOAD_MISSES.STLB_HIT + DTLB_LOAD_MISSES.WALK_DURATION) / tma_info_clks",
+        "MetricGroup": "MemoryTLB;TopdownL4;tma_L4_group;tma_issueTLB;tma_l1_bound_group",
+        "MetricName": "tma_dtlb_load",
+        "MetricThreshold": "tma_dtlb_load > 0.1",
+        "PublicDescription": "This metric roughly estimates the fraction of cycles where the Data TLB (DTLB) was missed by load accesses. TLBs (Translation Look-aside Buffers) are processor caches for recently used entries out of the Page Tables that are used to map virtual- to physical-addresses by the operating system. This metric approximates the potential delay of demand loads missing the first-level data TLB (assuming worst case scenario with back to back misses to different pages). This includes hitting in the second-level TLB (STLB) as well as performing a hardware page walk on an STLB miss. Sample with: MEM_UOPS_RETIRED.STLB_MISS_LOADS_PS. Related metrics: tma_dtlb_store",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues",
+        "MetricExpr": "tma_frontend_bound - tma_fetch_latency",
+        "MetricGroup": "FetchBW;Frontend;TmaL2;TopdownL2;tma_L2_group;tma_frontend_bound_group;tma_issueFB",
+        "MetricName": "tma_fetch_bandwidth",
+        "MetricThreshold": "tma_fetch_bandwidth > 0.1 & tma_frontend_bound > 0.15 & tma_info_ipc / 4 > 0.35",
+        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend bandwidth issues.  For example; inefficiencies at the instruction decoders; or restrictions for caching in the DSB (decoded uops cache) are categorized under Fetch Bandwidth. In such cases; the Frontend typically delivers suboptimal amount of uops to the Backend. Related metrics: tma_dsb_switches, tma_info_dsb_coverage, tma_lcp",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues",
+        "MetricExpr": "4 * min(CPU_CLK_UNHALTED.THREAD, IDQ_UOPS_NOT_DELIVERED.CYCLES_0_UOPS_DELIV.CORE) / tma_info_slots",
+        "MetricGroup": "Frontend;TmaL2;TopdownL2;tma_L2_group;tma_frontend_bound_group",
+        "MetricName": "tma_fetch_latency",
+        "MetricThreshold": "tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15",
+        "PublicDescription": "This metric represents fraction of slots the CPU was stalled due to Frontend latency issues.  For example; instruction-cache misses; iTLB misses or fetch stalls after a branch misprediction are categorized under Frontend Latency. In such cases; the Frontend eventually delivers no uops for some period. Sample with: RS_EVENTS.EMPTY_END",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric represents overall arithmetic floating-point (FP) operations fraction the CPU has executed (retired)",
         "MetricExpr": "tma_x87_use + tma_fp_scalar + tma_fp_vector",
-        "MetricGroup": "HPC;TopdownL3;tma_light_operations_group",
+        "MetricGroup": "HPC;TopdownL3;tma_L3_group;tma_light_operations_group",
         "MetricName": "tma_fp_arith",
+        "MetricThreshold": "tma_fp_arith > 0.2 & tma_light_operations > 0.6",
         "PublicDescription": "This metric represents overall arithmetic floating-point (FP) operations fraction the CPU has executed (retired). Note this metric's value may exceed its parent due to use of \"Uops\" CountDomain and FMA double-counting.",
         "ScaleUnit": "100%"
     },
-    {
-        "BriefDescription": "This metric serves as an approximation of legacy x87 usage",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS * FP_COMP_OPS_EXE.X87 / UOPS_DISPATCHED.THREAD",
-        "MetricGroup": "Compute;TopdownL4;tma_fp_arith_group",
-        "MetricName": "tma_x87_use",
-        "PublicDescription": "This metric serves as an approximation of legacy x87 usage. It accounts for instructions beyond X87 FP arithmetic operations; hence may be used as a thermometer to avoid X87 high usage and preferably upgrade to modern ISA. See Tip under Tuning Hint.",
-        "ScaleUnit": "100%"
-    },
     {
         "BriefDescription": "This metric approximates arithmetic floating-point (FP) scalar uops fraction the CPU has retired",
         "MetricExpr": "(FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE + FP_COMP_OPS_EXE.SSE_SCALAR_DOUBLE) / UOPS_DISPATCHED.THREAD",
-        "MetricGroup": "Compute;Flops;TopdownL4;tma_fp_arith_group",
+        "MetricGroup": "Compute;Flops;TopdownL4;tma_L4_group;tma_fp_arith_group;tma_issue2P",
         "MetricName": "tma_fp_scalar",
-        "PublicDescription": "This metric approximates arithmetic floating-point (FP) scalar uops fraction the CPU has retired. May overcount due to FMA double counting.",
+        "MetricThreshold": "tma_fp_scalar > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6)",
+        "PublicDescription": "This metric approximates arithmetic floating-point (FP) scalar uops fraction the CPU has retired. May overcount due to FMA double counting. Related metrics: tma_fp_vector, tma_fp_vector_512b, tma_port_6, tma_ports_utilized_2",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "This metric approximates arithmetic floating-point (FP) vector uops fraction the CPU has retired aggregated across all vector widths",
         "MetricExpr": "(FP_COMP_OPS_EXE.SSE_PACKED_DOUBLE + FP_COMP_OPS_EXE.SSE_PACKED_SINGLE + SIMD_FP_256.PACKED_SINGLE + SIMD_FP_256.PACKED_DOUBLE) / UOPS_DISPATCHED.THREAD",
-        "MetricGroup": "Compute;Flops;TopdownL4;tma_fp_arith_group",
+        "MetricGroup": "Compute;Flops;TopdownL4;tma_L4_group;tma_fp_arith_group;tma_issue2P",
         "MetricName": "tma_fp_vector",
-        "PublicDescription": "This metric approximates arithmetic floating-point (FP) vector uops fraction the CPU has retired aggregated across all vector widths. May overcount due to FMA double counting.",
+        "MetricThreshold": "tma_fp_vector > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6)",
+        "PublicDescription": "This metric approximates arithmetic floating-point (FP) vector uops fraction the CPU has retired aggregated across all vector widths. May overcount due to FMA double counting. Related metrics: tma_fp_scalar, tma_fp_vector_512b, tma_port_6, tma_ports_utilized_2",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend",
+        "MetricExpr": "IDQ_UOPS_NOT_DELIVERED.CORE / tma_info_slots",
+        "MetricGroup": "PGO;TmaL1;TopdownL1;tma_L1_group",
+        "MetricName": "tma_frontend_bound",
+        "MetricThreshold": "tma_frontend_bound > 0.15",
+        "PublicDescription": "This category represents fraction of slots where the processor's Frontend undersupplies its Backend. Frontend denotes the first part of the processor core responsible to fetch operations that are executed later on by the Backend part. Within the Frontend; a branch predictor predicts the next address to fetch; cache-lines are fetched from the memory subsystem; parsed into instructions; and lastly decoded into micro-operations (uops). Ideally the Frontend can issue Pipeline_Width uops every cycle to the Backend. Frontend Bound denotes unutilized issue-slots when there is no Backend stall; i.e. bubbles where Frontend delivered no uops while Backend could have accepted them. For example; stalls due to instruction-cache misses would be categorized under Frontend Bound.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or microcoded sequences",
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or micro-coded sequences",
         "MetricExpr": "tma_microcode_sequencer",
-        "MetricGroup": "Retire;TopdownL2;tma_L2_group;tma_retiring_group",
+        "MetricGroup": "Retire;TmaL2;TopdownL2;tma_L2_group;tma_retiring_group",
         "MetricName": "tma_heavy_operations",
-        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or microcoded sequences. This highly-correlates with the uop length of these instructions/sequences.",
+        "MetricThreshold": "tma_heavy_operations > 0.1",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring heavy-weight operations -- instructions that require two or more uops or micro-coded sequences. This highly-correlates with the uop length of these instructions/sequences.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / UOPS_ISSUED.ANY * IDQ.MS_UOPS / SLOTS",
-        "MetricGroup": "MicroSeq;TopdownL3;tma_heavy_operations_group",
-        "MetricName": "tma_microcode_sequencer",
-        "PublicDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit.  The MS is used for CISC instructions not supported by the default decoders (like repeat move strings; or CPUID); or by microcode assists used to address some operation modes (like in Floating Point assists). These cases can often be avoided. Sample with: IDQ.MS_UOPS",
-        "ScaleUnit": "100%"
+        "BriefDescription": "Measured Average Frequency for unhalted processors [GHz]",
+        "MetricExpr": "tma_info_turbo_utilization * TSC / 1e9 / duration_time",
+        "MetricGroup": "Power;Summary",
+        "MetricName": "tma_info_average_frequency"
     },
     {
-        "BriefDescription": "Instructions Per Cycle (per Logical Processor)",
-        "MetricExpr": "INST_RETIRED.ANY / CLKS",
-        "MetricGroup": "Ret;Summary",
-        "MetricName": "IPC"
+        "BriefDescription": "Per-Logical Processor actual clocks when the Logical Processor is active.",
+        "MetricExpr": "CPU_CLK_UNHALTED.THREAD",
+        "MetricGroup": "Pipeline",
+        "MetricName": "tma_info_clks"
     },
     {
-        "BriefDescription": "Uops Per Instruction",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / INST_RETIRED.ANY",
-        "MetricGroup": "Pipeline;Ret;Retire",
-        "MetricName": "UPI"
+        "BriefDescription": "Core actual clocks when any Logical Processor is active on the Physical Core",
+        "MetricExpr": "(CPU_CLK_UNHALTED.THREAD / 2 * (1 + CPU_CLK_UNHALTED.ONE_THREAD_ACTIVE / CPU_CLK_UNHALTED.REF_XCLK) if #core_wide < 1 else (CPU_CLK_UNHALTED.THREAD_ANY / 2 if #SMT_on else tma_info_clks))",
+        "MetricGroup": "SMT",
+        "MetricName": "tma_info_core_clks"
+    },
+    {
+        "BriefDescription": "Instructions Per Cycle across hyper-threads (per physical core)",
+        "MetricExpr": "INST_RETIRED.ANY / tma_info_core_clks",
+        "MetricGroup": "Ret;SMT;TmaL1;tma_L1_group",
+        "MetricName": "tma_info_coreipc"
     },
     {
         "BriefDescription": "Cycles Per Instruction (per Logical Processor)",
-        "MetricExpr": "1 / IPC",
+        "MetricExpr": "1 / tma_info_ipc",
         "MetricGroup": "Mem;Pipeline",
-        "MetricName": "CPI"
+        "MetricName": "tma_info_cpi"
     },
     {
-        "BriefDescription": "Per-Logical Processor actual clocks when the Logical Processor is active.",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "Pipeline",
-        "MetricName": "CLKS"
+        "BriefDescription": "Average CPU Utilization",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricGroup": "HPC;Summary",
+        "MetricName": "tma_info_cpu_utilization"
     },
     {
-        "BriefDescription": "Total issue-pipeline slots (per-Physical Core till ICL; per-Logical Processor ICL onward)",
-        "MetricExpr": "4 * CORE_CLKS",
-        "MetricGroup": "tma_L1_group",
-        "MetricName": "SLOTS"
+        "BriefDescription": "Average external Memory Bandwidth Use for reads and writes [GB / sec]",
+        "MetricExpr": "64 * (UNC_M_CAS_COUNT.RD + UNC_M_CAS_COUNT.WR) / 1e9 / duration_time",
+        "MetricGroup": "HPC;Mem;MemoryBW;SoC;tma_issueBW",
+        "MetricName": "tma_info_dram_bw_use",
+        "PublicDescription": "Average external Memory Bandwidth Use for reads and writes [GB / sec]. Related metrics: tma_mem_bandwidth"
+    },
+    {
+        "BriefDescription": "Fraction of Uops delivered by the DSB (aka Decoded ICache; or Uop Cache)",
+        "MetricExpr": "IDQ.DSB_UOPS / (IDQ.DSB_UOPS + LSD.UOPS + IDQ.MITE_UOPS + IDQ.MS_UOPS)",
+        "MetricGroup": "DSB;Fed;FetchBW;tma_issueFB",
+        "MetricName": "tma_info_dsb_coverage",
+        "MetricThreshold": "tma_info_dsb_coverage < 0.7 & tma_info_ipc / 4 > 0.35",
+        "PublicDescription": "Fraction of Uops delivered by the DSB (aka Decoded ICache; or Uop Cache). Related metrics: tma_dsb_switches, tma_fetch_bandwidth, tma_lcp"
     },
     {
         "BriefDescription": "The ratio of Executed- by Issued-Uops",
         "MetricExpr": "UOPS_DISPATCHED.THREAD / UOPS_ISSUED.ANY",
         "MetricGroup": "Cor;Pipeline",
-        "MetricName": "Execute_per_Issue",
+        "MetricName": "tma_info_execute_per_issue",
         "PublicDescription": "The ratio of Executed- by Issued-Uops. Ratio > 1 suggests high rate of uop micro-fusions. Ratio < 1 suggest high rate of \"execute\" at rename stage."
     },
-    {
-        "BriefDescription": "Instructions Per Cycle across hyper-threads (per physical core)",
-        "MetricExpr": "INST_RETIRED.ANY / CORE_CLKS",
-        "MetricGroup": "Ret;SMT;tma_L1_group",
-        "MetricName": "CoreIPC"
-    },
     {
         "BriefDescription": "Floating Point Operations Per Cycle",
-        "MetricExpr": "(FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE + FP_COMP_OPS_EXE.SSE_SCALAR_DOUBLE + 2 * FP_COMP_OPS_EXE.SSE_PACKED_DOUBLE + 4 * (FP_COMP_OPS_EXE.SSE_PACKED_SINGLE + SIMD_FP_256.PACKED_DOUBLE) + 8 * SIMD_FP_256.PACKED_SINGLE) / CORE_CLKS",
+        "MetricExpr": "(FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE + FP_COMP_OPS_EXE.SSE_SCALAR_DOUBLE + 2 * FP_COMP_OPS_EXE.SSE_PACKED_DOUBLE + 4 * (FP_COMP_OPS_EXE.SSE_PACKED_SINGLE + SIMD_FP_256.PACKED_DOUBLE) + 8 * SIMD_FP_256.PACKED_SINGLE) / tma_info_core_clks",
         "MetricGroup": "Flops;Ret",
-        "MetricName": "FLOPc"
+        "MetricName": "tma_info_flopc"
+    },
+    {
+        "BriefDescription": "Giga Floating Point Operations Per Second",
+        "MetricExpr": "(FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE + FP_COMP_OPS_EXE.SSE_SCALAR_DOUBLE + 2 * FP_COMP_OPS_EXE.SSE_PACKED_DOUBLE + 4 * (FP_COMP_OPS_EXE.SSE_PACKED_SINGLE + SIMD_FP_256.PACKED_DOUBLE) + 8 * SIMD_FP_256.PACKED_SINGLE) / 1e9 / duration_time",
+        "MetricGroup": "Cor;Flops;HPC",
+        "MetricName": "tma_info_gflops",
+        "PublicDescription": "Giga Floating Point Operations Per Second. Aggregate across all supported options of: FP precisions, scalar and vector instructions, vector-width and AMX engine."
     },
     {
         "BriefDescription": "Instruction-Level-Parallelism (average number of uops executed when there is execution) per-core",
         "MetricExpr": "UOPS_DISPATCHED.THREAD / (cpu@UOPS_DISPATCHED.CORE\\,cmask\\=1@ / 2 if #SMT_on else cpu@UOPS_DISPATCHED.CORE\\,cmask\\=1@)",
         "MetricGroup": "Backend;Cor;Pipeline;PortsUtil",
-        "MetricName": "ILP"
+        "MetricName": "tma_info_ilp"
     },
     {
-        "BriefDescription": "Core actual clocks when any Logical Processor is active on the Physical Core",
-        "MetricExpr": "(CPU_CLK_UNHALTED.THREAD / 2 * (1 + CPU_CLK_UNHALTED.ONE_THREAD_ACTIVE / CPU_CLK_UNHALTED.REF_XCLK) if #core_wide < 1 else (CPU_CLK_UNHALTED.THREAD_ANY / 2 if #SMT_on else CLKS))",
-        "MetricGroup": "SMT",
-        "MetricName": "CORE_CLKS"
+        "BriefDescription": "Total number of retired Instructions",
+        "MetricExpr": "INST_RETIRED.ANY",
+        "MetricGroup": "Summary;TmaL1;tma_L1_group",
+        "MetricName": "tma_info_instructions",
+        "PublicDescription": "Total number of retired Instructions. Sample with: INST_RETIRED.PREC_DIST"
     },
     {
-        "BriefDescription": "Total number of retired Instructions Sample with: INST_RETIRED.PREC_DIST",
-        "MetricExpr": "INST_RETIRED.ANY",
-        "MetricGroup": "Summary;tma_L1_group",
-        "MetricName": "Instructions"
+        "BriefDescription": "Instructions Per Cycle (per Logical Processor)",
+        "MetricExpr": "INST_RETIRED.ANY / tma_info_clks",
+        "MetricGroup": "Ret;Summary",
+        "MetricName": "tma_info_ipc"
     },
     {
-        "BriefDescription": "Average number of Uops retired in cycles where at least one uop has retired.",
-        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / cpu@UOPS_RETIRED.RETIRE_SLOTS\\,cmask\\=1@",
-        "MetricGroup": "Pipeline;Ret",
-        "MetricName": "Retire"
+        "BriefDescription": "Instructions per Far Branch ( Far Branches apply upon transition from application to operating system, handling interrupts, exceptions) [lower number means higher occurrence rate]",
+        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.FAR_BRANCH:u",
+        "MetricGroup": "Branches;OS",
+        "MetricName": "tma_info_ipfarbranch",
+        "MetricThreshold": "tma_info_ipfarbranch < 1e6"
     },
     {
-        "BriefDescription": "Fraction of Uops delivered by the DSB (aka Decoded ICache; or Uop Cache)",
-        "MetricExpr": "IDQ.DSB_UOPS / (IDQ.DSB_UOPS + LSD.UOPS + IDQ.MITE_UOPS + IDQ.MS_UOPS)",
-        "MetricGroup": "DSB;Fed;FetchBW",
-        "MetricName": "DSB_Coverage"
+        "BriefDescription": "Cycles Per Instruction for the Operating System (OS) Kernel mode",
+        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / INST_RETIRED.ANY_P:k",
+        "MetricGroup": "OS",
+        "MetricName": "tma_info_kernel_cpi"
     },
     {
-        "BriefDescription": "Average CPU Utilization",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
-        "MetricGroup": "HPC;Summary",
-        "MetricName": "CPU_Utilization"
+        "BriefDescription": "Fraction of cycles spent in the Operating System (OS) Kernel mode",
+        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / CPU_CLK_UNHALTED.THREAD",
+        "MetricGroup": "OS",
+        "MetricName": "tma_info_kernel_utilization",
+        "MetricThreshold": "tma_info_kernel_utilization > 0.05"
     },
     {
-        "BriefDescription": "Measured Average Frequency for unhalted processors [GHz]",
-        "MetricExpr": "Turbo_Utilization * TSC / 1e9 / duration_time",
-        "MetricGroup": "Power;Summary",
-        "MetricName": "Average_Frequency"
+        "BriefDescription": "Average number of parallel data read requests to external memory",
+        "MetricExpr": "UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182@ / UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182\\,thresh\\=1@",
+        "MetricGroup": "Mem;MemoryBW;SoC",
+        "MetricName": "tma_info_mem_parallel_reads",
+        "PublicDescription": "Average number of parallel data read requests to external memory. Accounts for demand loads and L1/L2 prefetches"
     },
     {
-        "BriefDescription": "Giga Floating Point Operations Per Second",
-        "MetricExpr": "(FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE + FP_COMP_OPS_EXE.SSE_SCALAR_DOUBLE + 2 * FP_COMP_OPS_EXE.SSE_PACKED_DOUBLE + 4 * (FP_COMP_OPS_EXE.SSE_PACKED_SINGLE + SIMD_FP_256.PACKED_DOUBLE) + 8 * SIMD_FP_256.PACKED_SINGLE) / 1e9 / duration_time",
-        "MetricGroup": "Cor;Flops;HPC",
-        "MetricName": "GFLOPs",
-        "PublicDescription": "Giga Floating Point Operations Per Second. Aggregate across all supported options of: FP precisions, scalar and vector instructions, vector-width and AMX engine."
+        "BriefDescription": "Average latency of data read request to external memory (in nanoseconds)",
+        "MetricExpr": "1e9 * (UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182@ / UNC_C_TOR_INSERTS.MISS_OPCODE@filter_opc\\=0x182@) / (tma_info_socket_clks / duration_time)",
+        "MetricGroup": "Mem;MemoryLat;SoC",
+        "MetricName": "tma_info_mem_read_latency",
+        "PublicDescription": "Average latency of data read request to external memory (in nanoseconds). Accounts for demand loads and L1/L2 prefetches. ([RKL+]memory-controller only)"
     },
     {
-        "BriefDescription": "Average Frequency Utilization relative nominal frequency",
-        "MetricExpr": "CLKS / CPU_CLK_UNHALTED.REF_TSC",
-        "MetricGroup": "Power",
-        "MetricName": "Turbo_Utilization"
+        "BriefDescription": "Average number of Uops retired in cycles where at least one uop has retired.",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / cpu@UOPS_RETIRED.RETIRE_SLOTS\\,cmask\\=1@",
+        "MetricGroup": "Pipeline;Ret",
+        "MetricName": "tma_info_retire"
+    },
+    {
+        "BriefDescription": "Total issue-pipeline slots (per-Physical Core till ICL; per-Logical Processor ICL onward)",
+        "MetricExpr": "4 * tma_info_core_clks",
+        "MetricGroup": "TmaL1;tma_L1_group",
+        "MetricName": "tma_info_slots"
     },
     {
         "BriefDescription": "Fraction of cycles where both hardware Logical Processors were active",
         "MetricExpr": "(1 - CPU_CLK_UNHALTED.ONE_THREAD_ACTIVE / (CPU_CLK_UNHALTED.REF_XCLK_ANY / 2) if #SMT_on else 0)",
         "MetricGroup": "SMT",
-        "MetricName": "SMT_2T_Utilization"
+        "MetricName": "tma_info_smt_2t_utilization"
     },
     {
-        "BriefDescription": "Fraction of cycles spent in the Operating System (OS) Kernel mode",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / CPU_CLK_UNHALTED.THREAD",
-        "MetricGroup": "OS",
-        "MetricName": "Kernel_Utilization"
+        "BriefDescription": "Socket actual clocks when any core is active on that socket",
+        "MetricExpr": "cbox_0@event\\=0x0@",
+        "MetricGroup": "SoC",
+        "MetricName": "tma_info_socket_clks"
     },
     {
-        "BriefDescription": "Cycles Per Instruction for the Operating System (OS) Kernel mode",
-        "MetricExpr": "CPU_CLK_UNHALTED.THREAD_P:k / INST_RETIRED.ANY_P:k",
-        "MetricGroup": "OS",
-        "MetricName": "Kernel_CPI"
+        "BriefDescription": "Average Frequency Utilization relative nominal frequency",
+        "MetricExpr": "tma_info_clks / CPU_CLK_UNHALTED.REF_TSC",
+        "MetricGroup": "Power",
+        "MetricName": "tma_info_turbo_utilization"
     },
     {
-        "BriefDescription": "Average external Memory Bandwidth Use for reads and writes [GB / sec]",
-        "MetricExpr": "64 * (UNC_M_CAS_COUNT.RD + UNC_M_CAS_COUNT.WR) / 1e9 / duration_time",
-        "MetricGroup": "HPC;Mem;MemoryBW;SoC",
-        "MetricName": "DRAM_BW_Use"
+        "BriefDescription": "Uops Per Instruction",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / INST_RETIRED.ANY",
+        "MetricGroup": "Pipeline;Ret;Retire",
+        "MetricName": "tma_info_uoppi",
+        "MetricThreshold": "tma_info_uoppi > 1.05"
     },
     {
-        "BriefDescription": "Average latency of data read request to external memory (in nanoseconds). Accounts for demand loads and L1/L2 prefetches",
-        "MetricExpr": "1e9 * (UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182@ / UNC_C_TOR_INSERTS.MISS_OPCODE@filter_opc\\=0x182@) / (Socket_CLKS / duration_time)",
-        "MetricGroup": "Mem;MemoryLat;SoC",
-        "MetricName": "MEM_Read_Latency"
+        "BriefDescription": "This metric represents fraction of cycles the CPU was stalled due to Instruction TLB (ITLB) misses",
+        "MetricExpr": "(12 * ITLB_MISSES.STLB_HIT + ITLB_MISSES.WALK_DURATION) / tma_info_clks",
+        "MetricGroup": "BigFoot;FetchLat;MemoryTLB;TopdownL3;tma_L3_group;tma_fetch_latency_group",
+        "MetricName": "tma_itlb_misses",
+        "MetricThreshold": "tma_itlb_misses > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles the CPU was stalled due to Instruction TLB (ITLB) misses. Sample with: ITLB_MISSES.WALK_COMPLETED",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Average number of parallel data read requests to external memory. Accounts for demand loads and L1/L2 prefetches",
-        "MetricExpr": "UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182@ / UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182\\,thresh\\=1@",
-        "MetricGroup": "Mem;MemoryBW;SoC",
-        "MetricName": "MEM_Parallel_Reads"
+        "BriefDescription": "This metric estimates how often the CPU was stalled due to loads accesses to L3 cache or contended with a sibling Core",
+        "MetricConstraint": "NO_GROUP_EVENTS_SMT",
+        "MetricExpr": "MEM_LOAD_UOPS_RETIRED.LLC_HIT / (MEM_LOAD_UOPS_RETIRED.LLC_HIT + 7 * MEM_LOAD_UOPS_RETIRED.LLC_MISS) * CYCLE_ACTIVITY.STALLS_L2_PENDING / tma_info_clks",
+        "MetricGroup": "CacheMisses;MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
+        "MetricName": "tma_l3_bound",
+        "MetricThreshold": "tma_l3_bound > 0.05 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often the CPU was stalled due to loads accesses to L3 cache or contended with a sibling Core.  Avoiding cache misses (i.e. L2 misses/L3 hits) can improve the latency and increase performance. Sample with: MEM_LOAD_UOPS_RETIRED.L3_HIT_PS",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Socket actual clocks when any core is active on that socket",
-        "MetricExpr": "cbox_0@event\\=0x0@",
-        "MetricGroup": "SoC",
-        "MetricName": "Socket_CLKS"
+        "BriefDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs)",
+        "MetricExpr": "ILD_STALL.LCP / tma_info_clks",
+        "MetricGroup": "FetchLat;TopdownL3;tma_L3_group;tma_fetch_latency_group;tma_issueFB",
+        "MetricName": "tma_lcp",
+        "MetricThreshold": "tma_lcp > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric represents fraction of cycles CPU was stalled due to Length Changing Prefixes (LCPs). Using proper compiler flags or Intel Compiler by default will certainly avoid this. #Link: Optimization Guide about LCP BKMs. Related metrics: tma_dsb_switches, tma_fetch_bandwidth, tma_info_dsb_coverage",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Instructions per Far Branch ( Far Branches apply upon transition from application to operating system, handling interrupts, exceptions) [lower number means higher occurrence rate]",
-        "MetricExpr": "INST_RETIRED.ANY / BR_INST_RETIRED.FAR_BRANCH:u",
-        "MetricGroup": "Branches;OS",
-        "MetricName": "IpFarBranch"
+        "BriefDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation)",
+        "MetricExpr": "tma_retiring - tma_heavy_operations",
+        "MetricGroup": "Retire;TmaL2;TopdownL2;tma_L2_group;tma_retiring_group",
+        "MetricName": "tma_light_operations",
+        "MetricThreshold": "tma_light_operations > 0.6",
+        "PublicDescription": "This metric represents fraction of slots where the CPU was retiring light-weight operations -- instructions that require no more than one uop (micro-operation). This correlates with total number of instructions used by the program. A uops-per-instruction (see UopPI metric) ratio of 1 or less should be expected for decently optimized software running on Intel Core/Xeon products. While this often indicates efficient X86 instructions were executed; high value does not necessarily mean better performance cannot be achieved. Sample with: INST_RETIRED.PREC_DIST",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "Uncore frequency per die [GHZ]",
-        "MetricExpr": "Socket_CLKS / #num_dies / duration_time / 1e9",
-        "MetricGroup": "SoC",
-        "MetricName": "UNCORE_FREQ"
+        "BriefDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "tma_bad_speculation - tma_branch_mispredicts",
+        "MetricGroup": "BadSpec;MachineClears;TmaL2;TopdownL2;tma_L2_group;tma_bad_speculation_group;tma_issueMC;tma_issueSyncxn",
+        "MetricName": "tma_machine_clears",
+        "MetricThreshold": "tma_machine_clears > 0.1 & tma_bad_speculation > 0.15",
+        "PublicDescription": "This metric represents fraction of slots the CPU has wasted due to Machine Clears.  These slots are either wasted by uops fetched prior to the clear; or stalls the out-of-order portion of the machine needs to recover its state after the clear. For example; this can happen due to memory ordering Nukes (e.g. Memory Disambiguation) or Self-Modifying-Code (SMC) nukes. Sample with: MACHINE_CLEARS.COUNT. Related metrics: tma_clears_resteers, tma_l1_bound, tma_microcode_sequencer, tma_ms_switches, tma_remote_cache",
+        "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C3 residency percent per core",
-        "MetricExpr": "cstate_core@c3\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C3_Core_Residency",
+        "BriefDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM)",
+        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, cpu@OFFCORE_REQUESTS_OUTSTANDING.ALL_DATA_RD\\,cmask\\=6@) / tma_info_clks",
+        "MetricGroup": "MemoryBW;Offcore;TopdownL4;tma_L4_group;tma_dram_bound_group;tma_issueBW",
+        "MetricName": "tma_mem_bandwidth",
+        "MetricThreshold": "tma_mem_bandwidth > 0.2 & (tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles where the core's performance was likely hurt due to approaching bandwidth limits of external memory (DRAM).  The underlying heuristic assumes that a similar off-core traffic is generated by all IA cores. This metric does not aggregate non-data-read requests by this logical processor; requests from other IA Logical Processors/Physical Cores/sockets; or other non-IA devices like GPU; hence the maximum external memory bandwidth limits may or may not be approached when this metric is flagged (see Uncore counters for that). Related metrics: tma_info_dram_bw_use",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C6 residency percent per core",
-        "MetricExpr": "cstate_core@c6\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C6_Core_Residency",
+        "BriefDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM)",
+        "MetricExpr": "min(CPU_CLK_UNHALTED.THREAD, OFFCORE_REQUESTS_OUTSTANDING.CYCLES_WITH_DATA_RD) / tma_info_clks - tma_mem_bandwidth",
+        "MetricGroup": "MemoryLat;Offcore;TopdownL4;tma_L4_group;tma_dram_bound_group;tma_issueLat",
+        "MetricName": "tma_mem_latency",
+        "MetricThreshold": "tma_mem_latency > 0.1 & (tma_dram_bound > 0.1 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2))",
+        "PublicDescription": "This metric estimates fraction of cycles where the performance was likely hurt due to latency from external memory (DRAM).  This metric does not aggregate requests from other Logical Processors/Physical Cores/sockets (see Uncore counters for that). Related metrics: ",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C7 residency percent per core",
-        "MetricExpr": "cstate_core@c7\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C7_Core_Residency",
+        "BriefDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_L1D_PENDING) + RESOURCE_STALLS.SB) / (min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_DISPATCH) + cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=1@ - (cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=3@ if tma_info_ipc > 1.8 else cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=2@) - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else 0) + RESOURCE_STALLS.SB) * tma_backend_bound",
+        "MetricGroup": "Backend;TmaL2;TopdownL2;tma_L2_group;tma_backend_bound_group",
+        "MetricName": "tma_memory_bound",
+        "MetricThreshold": "tma_memory_bound > 0.2 & tma_backend_bound > 0.2",
+        "PublicDescription": "This metric represents fraction of slots the Memory subsystem within the Backend was a bottleneck.  Memory Bound estimates fraction of slots where pipeline is likely stalled due to demand load or store instructions. This accounts mainly for (1) non-completed in-flight memory demand loads which coincides with execution units starvation; in addition to (2) cases where stores could impose backpressure on the pipeline when many of them get buffered at the same time (less common out of the two).",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C2 residency percent per package",
-        "MetricExpr": "cstate_pkg@c2\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C2_Pkg_Residency",
+        "BriefDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / UOPS_ISSUED.ANY * IDQ.MS_UOPS / tma_info_slots",
+        "MetricGroup": "MicroSeq;TopdownL3;tma_L3_group;tma_heavy_operations_group;tma_issueMC;tma_issueMS",
+        "MetricName": "tma_microcode_sequencer",
+        "MetricThreshold": "tma_microcode_sequencer > 0.05 & tma_heavy_operations > 0.1",
+        "PublicDescription": "This metric represents fraction of slots the CPU was retiring uops fetched by the Microcode Sequencer (MS) unit.  The MS is used for CISC instructions not supported by the default decoders (like repeat move strings; or CPUID); or by microcode assists used to address some operation modes (like in Floating Point assists). These cases can often be avoided. Sample with: IDQ.MS_UOPS. Related metrics: tma_clears_resteers, tma_l1_bound, tma_machine_clears, tma_ms_switches",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C3 residency percent per package",
-        "MetricExpr": "cstate_pkg@c3\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C3_Pkg_Residency",
+        "BriefDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS)",
+        "MetricExpr": "3 * IDQ.MS_SWITCHES / tma_info_clks",
+        "MetricGroup": "FetchLat;MicroSeq;TopdownL3;tma_L3_group;tma_fetch_latency_group;tma_issueMC;tma_issueMS;tma_issueMV;tma_issueSO",
+        "MetricName": "tma_ms_switches",
+        "MetricThreshold": "tma_ms_switches > 0.05 & (tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15)",
+        "PublicDescription": "This metric estimates the fraction of cycles when the CPU was stalled due to switches of uop delivery to the Microcode Sequencer (MS). Commonly used instructions are optimized for delivery by the DSB (decoded i-cache) or MITE (legacy instruction decode) pipelines. Certain operations cannot be handled natively by the execution pipeline; and must be performed by microcode (small programs injected into the execution stream). Switching to the MS too often can negatively impact performance. The MS is designated to deliver long uop flows required by CISC instructions like CPUID; or uncommon conditions like Floating Point Assists when dealing with Denormals. Sample with: IDQ.MS_SWITCHES. Related metrics: tma_clears_resteers, tma_l1_bound, tma_machine_clears, tma_microcode_sequencer, tma_mixing_vectors, tma_serializing_operation",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C6 residency percent per package",
-        "MetricExpr": "cstate_pkg@c6\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C6_Pkg_Residency",
+        "BriefDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related)",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.CYCLES_NO_DISPATCH) + cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=1@ - (cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=3@ if tma_info_ipc > 1.8 else cpu@UOPS_DISPATCHED.THREAD\\,cmask\\=2@) - (RS_EVENTS.EMPTY_CYCLES if tma_fetch_latency > 0.1 else 0) + RESOURCE_STALLS.SB - RESOURCE_STALLS.SB - min(CPU_CLK_UNHALTED.THREAD, CYCLE_ACTIVITY.STALLS_L1D_PENDING)) / tma_info_clks",
+        "MetricGroup": "PortsUtil;TopdownL3;tma_L3_group;tma_core_bound_group",
+        "MetricName": "tma_ports_utilization",
+        "MetricThreshold": "tma_ports_utilization > 0.15 & (tma_core_bound > 0.1 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates fraction of cycles the CPU performance was potentially limited due to Core computation issues (non divider-related).  Two distinct categories can be attributed into this metric: (1) heavy data-dependency among contiguous instructions would manifest in this metric - such cases are often referred to as low Instruction Level Parallelism (ILP). (2) Contention on some hardware execution unit other than Divider. For example; when there are too many multiply operations.",
         "ScaleUnit": "100%"
     },
     {
-        "BriefDescription": "C7 residency percent per package",
-        "MetricExpr": "cstate_pkg@c7\\-residency@ / TSC",
-        "MetricGroup": "Power",
-        "MetricName": "C7_Pkg_Residency",
+        "BriefDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS / tma_info_slots",
+        "MetricGroup": "TmaL1;TopdownL1;tma_L1_group",
+        "MetricName": "tma_retiring",
+        "MetricThreshold": "tma_retiring > 0.7 | tma_heavy_operations > 0.1",
+        "PublicDescription": "This category represents fraction of slots utilized by useful work i.e. issued uops that eventually get retired. Ideally; all pipeline slots would be attributed to the Retiring category.  Retiring of 100% would indicate the maximum Pipeline_Width throughput was achieved.  Maximizing Retiring typically increases the Instructions-per-cycle (see IPC metric). Note that a high Retiring value does not necessary mean there is no room for more performance.  For example; Heavy-operations or Microcode Assists are categorized under Retiring. They often indicate suboptimal performance and can often be optimized or avoided. Sample with: UOPS_RETIRED.RETIRE_SLOTS",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write",
+        "MetricExpr": "RESOURCE_STALLS.SB / tma_info_clks",
+        "MetricGroup": "MemoryBound;TmaL3mem;TopdownL3;tma_L3_group;tma_memory_bound_group",
+        "MetricName": "tma_store_bound",
+        "MetricThreshold": "tma_store_bound > 0.2 & (tma_memory_bound > 0.2 & tma_backend_bound > 0.2)",
+        "PublicDescription": "This metric estimates how often CPU was stalled  due to RFO store memory accesses; RFO store issue a read-for-ownership request before the write. Even though store accesses do not typically stall out-of-order CPUs; there are few cases where stores can lead to actual stalls. This metric will be flagged should RFO stores be a bottleneck. Sample with: MEM_UOPS_RETIRED.ALL_STORES_PS",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "This metric serves as an approximation of legacy x87 usage",
+        "MetricExpr": "UOPS_RETIRED.RETIRE_SLOTS * FP_COMP_OPS_EXE.X87 / UOPS_DISPATCHED.THREAD",
+        "MetricGroup": "Compute;TopdownL4;tma_L4_group;tma_fp_arith_group",
+        "MetricName": "tma_x87_use",
+        "MetricThreshold": "tma_x87_use > 0.1 & (tma_fp_arith > 0.2 & tma_light_operations > 0.6)",
+        "PublicDescription": "This metric serves as an approximation of legacy x87 usage. It accounts for instructions beyond X87 FP arithmetic operations; hence may be used as a thermometer to avoid X87 high usage and preferably upgrade to modern ISA. See Tip under Tuning Hint.",
         "ScaleUnit": "100%"
     }
 ]
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json b/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json
index 11d41ce8c922..85c04fe7632a 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json
@@ -501,7 +501,7 @@
         "BriefDescription": "Cases when loads get true Block-on-Store blocking code preventing store forwarding.",
         "EventCode": "0x03",
         "EventName": "LD_BLOCKS.STORE_FORWARD",
-        "PublicDescription": "This event counts loads that followed a store to the same address, where the data could not be forwarded inside the pipeline from the store to the load.  The most common reason why store forwarding would be blocked is when a load's address range overlaps with a preceeding smaller uncompleted store.  See the table of not supported store forwards in the Intel? 64 and IA-32 Architectures Optimization Reference Manual.  The penalty for blocked store forwarding is that the load must wait for the store to complete before it can be issued.",
+        "PublicDescription": "This event counts loads that followed a store to the same address, where the data could not be forwarded inside the pipeline from the store to the load.  The most common reason why store forwarding would be blocked is when a load's address range overlaps with a preceding smaller uncompleted store.  See the table of not supported store forwards in the Intel? 64 and IA-32 Architectures Optimization Reference Manual.  The penalty for blocked store forwarding is that the load must wait for the store to complete before it can be issued.",
         "SampleAfterValue": "100003",
         "UMask": "0x2"
     },
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/uncore-cache.json b/tools/perf/pmu-events/arch/x86/jaketown/uncore-cache.json
index b9e68f9f33ea..47830ca5c682 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/uncore-cache.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/uncore-cache.json
@@ -572,7 +572,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.EVICTION",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x4",
         "Unit": "CBO"
     },
@@ -581,7 +581,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.MISS_ALL",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0xa",
         "Unit": "CBO"
     },
@@ -590,7 +590,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.MISS_OPCODE",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x3",
         "Unit": "CBO"
     },
@@ -599,7 +599,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.NID_ALL",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x48",
         "Unit": "CBO"
     },
@@ -608,7 +608,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.NID_EVICTION",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x44",
         "Unit": "CBO"
     },
@@ -617,7 +617,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.NID_MISS_ALL",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x4a",
         "Unit": "CBO"
     },
@@ -626,7 +626,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.NID_MISS_OPCODE",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x43",
         "Unit": "CBO"
     },
@@ -635,7 +635,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.NID_OPCODE",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x41",
         "Unit": "CBO"
     },
@@ -644,7 +644,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.NID_WB",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x50",
         "Unit": "CBO"
     },
@@ -653,7 +653,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.OPCODE",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x1",
         "Unit": "CBO"
     },
@@ -662,7 +662,7 @@
         "EventCode": "0x35",
         "EventName": "UNC_C_TOR_INSERTS.WB",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of entries successfuly inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
+        "PublicDescription": "Counts the number of entries successfully inserted into the TOR that match  qualifications specified by the subevent.  There are a number of subevent 'filters' but only a subset of the subevent combinations are valid.  Subevents that require an opcode or NID match require the Cn_MSR_PMON_BOX_FILTER.{opc, nid} field to be set.  If, for example, one wanted to count DRD Local Misses, one should select 'MISS_OPC_MATCH' and set Cn_MSR_PMON_BOX_FILTER.opc  to DRD (0x182).",
         "UMask": "0x10",
         "Unit": "CBO"
     },
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/uncore-interconnect.json b/tools/perf/pmu-events/arch/x86/jaketown/uncore-interconnect.json
index 1c2cf94889a1..b16bb649225d 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/uncore-interconnect.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/uncore-interconnect.json
@@ -20,7 +20,7 @@
         "EventCode": "0x13",
         "EventName": "UNC_Q_DIRECT2CORE.FAILURE_CREDITS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exlusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
+        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exclusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
         "UMask": "0x2",
         "Unit": "QPI LL"
     },
@@ -29,7 +29,7 @@
         "EventCode": "0x13",
         "EventName": "UNC_Q_DIRECT2CORE.FAILURE_CREDITS_RBT",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exlusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
+        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exclusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
         "UMask": "0x8",
         "Unit": "QPI LL"
     },
@@ -38,7 +38,7 @@
         "EventCode": "0x13",
         "EventName": "UNC_Q_DIRECT2CORE.FAILURE_RBT",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exlusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
+        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exclusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
         "UMask": "0x4",
         "Unit": "QPI LL"
     },
@@ -47,7 +47,7 @@
         "EventCode": "0x13",
         "EventName": "UNC_Q_DIRECT2CORE.SUCCESS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exlusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
+        "PublicDescription": "Counts the number of DRS packets that we attempted to do direct2core on.  There are 4 mutually exclusive filters.  Filter [0] can be used to get successful spawns, while [1:3] provide the different failure cases.  Note that this does not count packets that are not candidates for Direct2Core.  The only candidates for Direct2Core are DRS packets destined for Cbos.",
         "UMask": "0x1",
         "Unit": "QPI LL"
     },
@@ -80,7 +80,7 @@
         "EventCode": "0x9",
         "EventName": "UNC_Q_RxL_BYPASSED",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of times that an incoming flit was able to bypass the flit buffer and pass directly across the BGF and into the Egress.  This is a latency optimization, and should generally be the common case.  If this value is less than the number of flits transfered, it implies that there was queueing getting onto the ring, and thus the transactions saw higher latency.",
+        "PublicDescription": "Counts the number of times that an incoming flit was able to bypass the flit buffer and pass directly across the BGF and into the Egress.  This is a latency optimization, and should generally be the common case.  If this value is less than the number of flits transferred, it implies that there was queueing getting onto the ring, and thus the transactions saw higher latency.",
         "Unit": "QPI LL"
     },
     {
@@ -176,7 +176,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_RxL_FLITS_G0.DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other information
 .  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other informatio
 n.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
         "UMask": "0x2",
         "Unit": "QPI LL"
     },
@@ -185,7 +185,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_RxL_FLITS_G0.IDLE",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other information
 .  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other informatio
 n.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
         "UMask": "0x1",
         "Unit": "QPI LL"
     },
@@ -194,7 +194,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_RxL_FLITS_G0.NON_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other information
 .  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other informatio
 n.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
         "UMask": "0x4",
         "Unit": "QPI LL"
     },
@@ -203,7 +203,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_Q_RxL_FLITS_G1.DRS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x18",
         "Unit": "QPI LL"
     },
@@ -212,7 +212,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_Q_RxL_FLITS_G1.DRS_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x8",
         "Unit": "QPI LL"
     },
@@ -221,7 +221,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_Q_RxL_FLITS_G1.DRS_NONDATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x10",
         "Unit": "QPI LL"
     },
@@ -230,7 +230,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_Q_RxL_FLITS_G1.HOM",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x6",
         "Unit": "QPI LL"
     },
@@ -239,7 +239,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_Q_RxL_FLITS_G1.HOM_NONREQ",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x4",
         "Unit": "QPI LL"
     },
@@ -248,7 +248,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_Q_RxL_FLITS_G1.HOM_REQ",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x2",
         "Unit": "QPI LL"
     },
@@ -257,7 +257,7 @@
         "EventCode": "0x2",
         "EventName": "UNC_Q_RxL_FLITS_G1.SNP",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x1",
         "Unit": "QPI LL"
     },
@@ -266,7 +266,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_Q_RxL_FLITS_G2.NCB",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0xc",
         "Unit": "QPI LL"
     },
@@ -275,7 +275,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_Q_RxL_FLITS_G2.NCB_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x4",
         "Unit": "QPI LL"
     },
@@ -284,7 +284,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_Q_RxL_FLITS_G2.NCB_NONDATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x8",
         "Unit": "QPI LL"
     },
@@ -293,7 +293,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_Q_RxL_FLITS_G2.NCS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x10",
         "Unit": "QPI LL"
     },
@@ -302,7 +302,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_Q_RxL_FLITS_G2.NDR_AD",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x1",
         "Unit": "QPI LL"
     },
@@ -311,7 +311,7 @@
         "EventCode": "0x3",
         "EventName": "UNC_Q_RxL_FLITS_G2.NDR_AK",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits
  of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits received from the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bit
 s of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x2",
         "Unit": "QPI LL"
     },
@@ -553,7 +553,7 @@
         "BriefDescription": "Flits Transferred - Group 0; Data Tx Flits",
         "EventName": "UNC_Q_TxL_FLITS_G0.DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other inform
 ation.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other infor
 mation.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
         "UMask": "0x2",
         "Unit": "QPI LL"
     },
@@ -561,7 +561,7 @@
         "BriefDescription": "Flits Transferred - Group 0; Idle and Null Flits",
         "EventName": "UNC_Q_TxL_FLITS_G0.IDLE",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other inform
 ation.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other infor
 mation.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
         "UMask": "0x1",
         "Unit": "QPI LL"
     },
@@ -569,7 +569,7 @@
         "BriefDescription": "Flits Transferred - Group 0; Non-Data protocol Tx Flits",
         "EventName": "UNC_Q_TxL_FLITS_G0.NON_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other inform
 ation.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  It includes filters for Idle, protocol, and Data Flits.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 bits of actual 'data' and an additional 16 bits of other infor
 mation.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time (for L0) or 4B instead of 8B for L0p.",
         "UMask": "0x4",
         "Unit": "QPI LL"
     },
@@ -577,7 +577,7 @@
         "BriefDescription": "Flits Transferred - Group 1; DRS Flits (both Header and Data)",
         "EventName": "UNC_Q_TxL_FLITS_G1.DRS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x18",
         "Unit": "QPI LL"
     },
@@ -585,7 +585,7 @@
         "BriefDescription": "Flits Transferred - Group 1; DRS Data Flits",
         "EventName": "UNC_Q_TxL_FLITS_G1.DRS_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x8",
         "Unit": "QPI LL"
     },
@@ -593,7 +593,7 @@
         "BriefDescription": "Flits Transferred - Group 1; DRS Header Flits",
         "EventName": "UNC_Q_TxL_FLITS_G1.DRS_NONDATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x10",
         "Unit": "QPI LL"
     },
@@ -601,7 +601,7 @@
         "BriefDescription": "Flits Transferred - Group 1; HOM Flits",
         "EventName": "UNC_Q_TxL_FLITS_G1.HOM",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x6",
         "Unit": "QPI LL"
     },
@@ -609,7 +609,7 @@
         "BriefDescription": "Flits Transferred - Group 1; HOM Non-Request Flits",
         "EventName": "UNC_Q_TxL_FLITS_G1.HOM_NONREQ",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x4",
         "Unit": "QPI LL"
     },
@@ -617,7 +617,7 @@
         "BriefDescription": "Flits Transferred - Group 1; HOM Request Flits",
         "EventName": "UNC_Q_TxL_FLITS_G1.HOM_REQ",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x2",
         "Unit": "QPI LL"
     },
@@ -625,7 +625,7 @@
         "BriefDescription": "Flits Transferred - Group 1; SNP Flits",
         "EventName": "UNC_Q_TxL_FLITS_G1.SNP",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for SNP, HOM, and DRS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x1",
         "Unit": "QPI LL"
     },
@@ -634,7 +634,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_TxL_FLITS_G2.NCB",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0xc",
         "Unit": "QPI LL"
     },
@@ -643,7 +643,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_TxL_FLITS_G2.NCB_DATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x4",
         "Unit": "QPI LL"
     },
@@ -652,7 +652,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_TxL_FLITS_G2.NCB_NONDATA",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x8",
         "Unit": "QPI LL"
     },
@@ -661,7 +661,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_TxL_FLITS_G2.NCS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x10",
         "Unit": "QPI LL"
     },
@@ -670,7 +670,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_TxL_FLITS_G2.NDR_AD",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x1",
         "Unit": "QPI LL"
     },
@@ -679,7 +679,7 @@
         "EventCode": "0x1",
         "EventName": "UNC_Q_TxL_FLITS_G2.NDR_AK",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of flits trasmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transfering a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 64 
 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
+        "PublicDescription": "Counts the number of flits transmitted across the QPI Link.  This is one of three 'groups' that allow us to track flits.  It includes filters for NDR, NCB, and NCS message classes.  Each 'flit' is made up of 80 bits of information (in addition to some ECC data).  In full-width (L0) mode, flits are made up of four 'fits', each of which contains 20 bits of data (along with some additional ECC data).   In half-width (L0p) mode, the fits are only 10 bits, and therefore it takes twice as many fits to transmit a flit.  When one talks about QPI 'speed' (for example, 8.0 GT/s), the 'transfers' here refer to 'fits'.  Therefore, in L0, the system will transfer 1 'flit' at the rate of 1/4th the QPI speed.  One can calculate the bandwidth of the link by taking: flits*80b/time.  Note that this is not the same as 'data' bandwidth.  For example, when we are transferring a 64B cacheline across QPI, we will break it into 9 flits -- 1 with header information and 8 with 6
 4 bits of actual 'data' and an additional 16 bits of other information.  To calculate 'data' bandwidth, one should therefore do: data flits * 8B / time.",
         "UMask": "0x2",
         "Unit": "QPI LL"
     },
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/uncore-memory.json b/tools/perf/pmu-events/arch/x86/jaketown/uncore-memory.json
index 2faf0dc6675d..6dcc9415a462 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/uncore-memory.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/uncore-memory.json
@@ -101,7 +101,7 @@
         "EventCode": "0x9",
         "EventName": "UNC_M_ECC_CORRECTABLE_ERRORS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of ECC errors detected and corrected by the iMC on this channel.  This counter is only useful with ECC DRAM devices.  This count will increment one time for each correction regardless of the number of bits corrected.  The iMC can correct up to 4 bit errors in independent channel mode and 8 bit erros in lockstep mode.",
+        "PublicDescription": "Counts the number of ECC errors detected and corrected by the iMC on this channel.  This counter is only useful with ECC DRAM devices.  This count will increment one time for each correction regardless of the number of bits corrected.  The iMC can correct up to 4 bit errors in independent channel mode and 8 bit errors in lockstep mode.",
         "Unit": "iMC"
     },
     {
@@ -413,7 +413,7 @@
         "EventCode": "0x81",
         "EventName": "UNC_M_WPQ_OCCUPANCY",
         "PerPkg": "1",
-        "PublicDescription": "Accumulates the occupancies of the Write Pending Queue each cycle.  This can then be used to calculate both the average queue occupancy (in conjunction with the number of cycles not empty) and the average latency (in conjunction with the number of allocations).  The WPQ is used to schedule write out to the memory controller and to track the writes.  Requests allocate into the WPQ soon after they enter the memory controller, and need credits for an entry in this buffer before being sent from the HA to the iMC.  They deallocate after being issued to DRAM.  Write requests themselves are able to complete (from the perspective of the rest of the system) as soon they have 'posted' to the iMC.  This is not to be confused with actually performing the write to DRAM.  Therefore, the average latency for this queue is actually not useful for deconstruction intermediate write latencies.  So, we provide filtering based on if the request has posted or not.  By using t
 he 'not posted' filter, we can track how long writes spent in the iMC before completions were sent to the HA.  The 'posted' filter, on the other hand, provides information about how much queueing is actually happenning in the iMC for writes before they are actually issued to memory.  High average occupancies will generally coincide with high write major mode counts.",
+        "PublicDescription": "Accumulates the occupancies of the Write Pending Queue each cycle.  This can then be used to calculate both the average queue occupancy (in conjunction with the number of cycles not empty) and the average latency (in conjunction with the number of allocations).  The WPQ is used to schedule write out to the memory controller and to track the writes.  Requests allocate into the WPQ soon after they enter the memory controller, and need credits for an entry in this buffer before being sent from the HA to the iMC.  They deallocate after being issued to DRAM.  Write requests themselves are able to complete (from the perspective of the rest of the system) as soon they have 'posted' to the iMC.  This is not to be confused with actually performing the write to DRAM.  Therefore, the average latency for this queue is actually not useful for deconstruction intermediate write latencies.  So, we provide filtering based on if the request has posted or not.  By using t
 he 'not posted' filter, we can track how long writes spent in the iMC before completions were sent to the HA.  The 'posted' filter, on the other hand, provides information about how much queueing is actually happening in the iMC for writes before they are actually issued to memory.  High average occupancies will generally coincide with high write major mode counts.",
         "Unit": "iMC"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/uncore-other.json b/tools/perf/pmu-events/arch/x86/jaketown/uncore-other.json
index 51a9a4e81046..ca727c0e1865 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/uncore-other.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/uncore-other.json
@@ -284,7 +284,7 @@
         "EventCode": "0xD",
         "EventName": "UNC_I_TxR_REQUEST_OCCUPANCY",
         "PerPkg": "1",
-        "PublicDescription": "Accumultes the number of outstanding outbound requests from the IRP to the switch (towards the devices).  This can be used in conjuection with the allocations event in order to calculate average latency of outbound requests.",
+        "PublicDescription": "Accumulates the number of outstanding outbound requests from the IRP to the switch (towards the devices).  This can be used in conjunction with the allocations event in order to calculate average latency of outbound requests.",
         "Unit": "IRP"
     },
     {
@@ -630,7 +630,7 @@
         "EventCode": "0x20",
         "EventName": "UNC_R3_IIO_CREDITS_ACQUIRED.DRS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of times the NCS/NCB/DRS credit is acquried in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of times the NCS/NCB/DRS credit is acquired in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x8",
         "Unit": "R3QPI"
     },
@@ -639,7 +639,7 @@
         "EventCode": "0x20",
         "EventName": "UNC_R3_IIO_CREDITS_ACQUIRED.NCB",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of times the NCS/NCB/DRS credit is acquried in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of times the NCS/NCB/DRS credit is acquired in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x10",
         "Unit": "R3QPI"
     },
@@ -648,7 +648,7 @@
         "EventCode": "0x20",
         "EventName": "UNC_R3_IIO_CREDITS_ACQUIRED.NCS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of times the NCS/NCB/DRS credit is acquried in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of times the NCS/NCB/DRS credit is acquired in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x20",
         "Unit": "R3QPI"
     },
@@ -657,7 +657,7 @@
         "EventCode": "0x21",
         "EventName": "UNC_R3_IIO_CREDITS_REJECT.DRS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of times that a request attempted to acquire an NCS/NCB/DRS credit in the QPI for sending messages on BL to the IIO but was rejected because no credit was available.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of times that a request attempted to acquire an NCS/NCB/DRS credit in the QPI for sending messages on BL to the IIO but was rejected because no credit was available.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x8",
         "Unit": "R3QPI"
     },
@@ -666,7 +666,7 @@
         "EventCode": "0x21",
         "EventName": "UNC_R3_IIO_CREDITS_REJECT.NCB",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of times that a request attempted to acquire an NCS/NCB/DRS credit in the QPI for sending messages on BL to the IIO but was rejected because no credit was available.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of times that a request attempted to acquire an NCS/NCB/DRS credit in the QPI for sending messages on BL to the IIO but was rejected because no credit was available.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x10",
         "Unit": "R3QPI"
     },
@@ -675,7 +675,7 @@
         "EventCode": "0x21",
         "EventName": "UNC_R3_IIO_CREDITS_REJECT.NCS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of times that a request attempted to acquire an NCS/NCB/DRS credit in the QPI for sending messages on BL to the IIO but was rejected because no credit was available.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of times that a request attempted to acquire an NCS/NCB/DRS credit in the QPI for sending messages on BL to the IIO but was rejected because no credit was available.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x20",
         "Unit": "R3QPI"
     },
@@ -684,7 +684,7 @@
         "EventCode": "0x22",
         "EventName": "UNC_R3_IIO_CREDITS_USED.DRS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of cycles when the NCS/NCB/DRS credit is in use in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of cycles when the NCS/NCB/DRS credit is in use in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x8",
         "Unit": "R3QPI"
     },
@@ -693,7 +693,7 @@
         "EventCode": "0x22",
         "EventName": "UNC_R3_IIO_CREDITS_USED.NCB",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of cycles when the NCS/NCB/DRS credit is in use in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of cycles when the NCS/NCB/DRS credit is in use in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x10",
         "Unit": "R3QPI"
     },
@@ -702,7 +702,7 @@
         "EventCode": "0x22",
         "EventName": "UNC_R3_IIO_CREDITS_USED.NCS",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of cycles when the NCS/NCB/DRS credit is in use in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transfering data without coherency, and DRS is used for transfering data with coherency (cachable PCI transactions).  This event can only track one message class at a time.",
+        "PublicDescription": "Counts the number of cycles when the NCS/NCB/DRS credit is in use in the QPI for sending messages on BL to the IIO.  There is one credit for each of these three message classes (three credits total).  NCS is used for reads to PCIe space, NCB is used for transferring data without coherency, and DRS is used for transferring data with coherency (cacheable PCI transactions).  This event can only track one message class at a time.",
         "UMask": "0x20",
         "Unit": "R3QPI"
     },
@@ -1107,7 +1107,7 @@
         "EventCode": "0x33",
         "EventName": "UNC_R3_VNA_CREDITS_ACQUIRED",
         "PerPkg": "1",
-        "PublicDescription": "Number of QPI VNA Credit acquisitions.  This event can be used in conjunction with the VNA In-Use Accumulator to calculate the average lifetime of a credit holder.  VNA credits are used by all message classes in order to communicate across QPI.  If a packet is unable to acquire credits, it will then attempt to use credts from the VN0 pool.  Note that a single packet may require multiple flit buffers (i.e. when data is being transfered).  Therefore, this event will increment by the number of credits acquired in each cycle.  Filtering based on message class is not provided.  One can count the number of packets transfered in a given message class using an qfclk event.",
+        "PublicDescription": "Number of QPI VNA Credit acquisitions.  This event can be used in conjunction with the VNA In-Use Accumulator to calculate the average lifetime of a credit holder.  VNA credits are used by all message classes in order to communicate across QPI.  If a packet is unable to acquire credits, it will then attempt to use credits from the VN0 pool.  Note that a single packet may require multiple flit buffers (i.e. when data is being transferred).  Therefore, this event will increment by the number of credits acquired in each cycle.  Filtering based on message class is not provided.  One can count the number of packets transferred in a given message class using an qfclk event.",
         "Unit": "R3QPI"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/uncore-power.json b/tools/perf/pmu-events/arch/x86/jaketown/uncore-power.json
index 638aa8a35cdb..b3ee5d741015 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/uncore-power.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/uncore-power.json
@@ -234,7 +234,7 @@
         "EventCode": "0x80",
         "EventName": "UNC_P_POWER_STATE_OCCUPANCY.CORES_C0",
         "PerPkg": "1",
-        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in C0.  It can be used by itself to get the average number of cores in C0, with threshholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
+        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in C0.  It can be used by itself to get the average number of cores in C0, with thresholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
         "Unit": "PCU"
     },
     {
@@ -242,7 +242,7 @@
         "EventCode": "0x80",
         "EventName": "UNC_P_POWER_STATE_OCCUPANCY.CORES_C3",
         "PerPkg": "1",
-        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in C0.  It can be used by itself to get the average number of cores in C0, with threshholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
+        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in C0.  It can be used by itself to get the average number of cores in C0, with thresholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
         "Unit": "PCU"
     },
     {
@@ -250,7 +250,7 @@
         "EventCode": "0x80",
         "EventName": "UNC_P_POWER_STATE_OCCUPANCY.CORES_C6",
         "PerPkg": "1",
-        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in C0.  It can be used by itself to get the average number of cores in C0, with threshholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
+        "PublicDescription": "This is an occupancy event that tracks the number of cores that are in C0.  It can be used by itself to get the average number of cores in C0, with thresholding to generate histograms, or with other PCU events and occupancy triggering to capture other details.",
         "Unit": "PCU"
     },
     {
@@ -266,7 +266,7 @@
         "EventCode": "0x9",
         "EventName": "UNC_P_PROCHOT_INTERNAL_CYCLES",
         "PerPkg": "1",
-        "PublicDescription": "Counts the number of cycles that we are in Interal PROCHOT mode.  This mode is triggered when a sensor on the die determines that we are too hot and must throttle to avoid damaging the chip.",
+        "PublicDescription": "Counts the number of cycles that we are in Internal PROCHOT mode.  This mode is triggered when a sensor on the die determines that we are too hot and must throttle to avoid damaging the chip.",
         "Unit": "PCU"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 77af9d0bf6d4..afe811f154d7 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -16,7 +16,7 @@ GenuineIntel-6-(7D|7E|A7),v1.17,icelake,core
 GenuineIntel-6-6[AC],v1.18,icelakex,core
 GenuineIntel-6-3A,v23,ivybridge,core
 GenuineIntel-6-3E,v22,ivytown,core
-GenuineIntel-6-2D,v21,jaketown,core
+GenuineIntel-6-2D,v22,jaketown,core
 GenuineIntel-6-(57|85),v9,knightslanding,core
 GenuineIntel-6-A[AC],v1.00,meteorlake,core
 GenuineIntel-6-1[AEF],v3,nehalemep,core
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
