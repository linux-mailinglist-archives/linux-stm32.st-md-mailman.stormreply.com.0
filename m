Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEC8B5D75
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:23:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46BC2C71285;
	Mon, 29 Apr 2024 15:23:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE771C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:23:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD4F2F4;
 Mon, 29 Apr 2024 08:24:02 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B9B823F793;
 Mon, 29 Apr 2024 08:23:32 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: linux-perf-users@vger.kernel.org, gankulkarni@os.amperecomputing.com,
 scclevenger@os.amperecomputing.com, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, mike.leach@linaro.org
Date: Mon, 29 Apr 2024 16:21:45 +0100
Message-Id: <20240429152207.479221-1-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Leo Yan <leo.yan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/17] coresight: Use per-sink trace ID maps
	for Perf sessions
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

This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
as long as there are fewer than that many ETMs connected to each sink.

Each sink owns its own trace ID map, and any Perf session connecting to
that sink will allocate from it, even if the sink is currently in use by
other users. This is similar to the existing behavior where the dynamic
trace IDs are constant as long as there is any concurrent Perf session
active. It's not completely optimal because slightly more IDs will be
used than necessary, but the optimal solution involves tracking the PIDs
of each session and allocating ID maps based on the session owner. This
is difficult to do with the combination of per-thread and per-cpu modes
and some scheduling issues. The complexity of this isn't likely to worth
it because even with multiple users they'd just see a difference in the
ordering of ID allocations rather than hitting any limits (unless the
hardware does have too many ETMs connected to one sink).

Per-thread mode works but only until there are any overlapping IDs, at
which point Perf will error out. Both per-thread mode and sysfs mode are
left to future changes, but both can be added on top of this initial
implementation and only sysfs mode requires further driver changes.

The HW_ID version field hasn't been bumped in order to not break Perf
which already has an error condition for other values of that field.
Instead a new minor version has been added which signifies that there
are new fields but the old fields are backwards compatible.


James Clark (17):
  perf cs-etm: Print error for new PERF_RECORD_AUX_OUTPUT_HW_ID versions
  perf auxtrace: Allow number of queues to be specified
  perf: cs-etm: Create decoders after both AUX and HW_ID search passes
  perf: cs-etm: Allocate queues for all CPUs
  perf: cs-etm: Move traceid_list to each queue
  perf: cs-etm: Create decoders based on the trace ID mappings
  perf: cs-etm: Support version 0.1 of HW_ID packets
  coresight: Remove unused stubs
  coresight: Clarify comments around the PID of the sink owner
  coresight: Move struct coresight_trace_id_map to common header
  coresight: Expose map argument in trace ID API
  coresight: Make CPU id map a property of a trace ID map
  coresight: Pass trace ID map into source enable
  coresight: Use per-sink trace ID maps for Perf sessions
  coresight: Remove pending trace ID release mechanism
  coresight: Re-emit trace IDs when the sink changes in per-thread mode
  coresight: Emit HW_IDs for all ETMs that are using the sink

 drivers/hwtracing/coresight/coresight-core.c  |  10 +
 drivers/hwtracing/coresight/coresight-dummy.c |   3 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  82 ++-
 .../hwtracing/coresight/coresight-etm-perf.h  |  20 +-
 .../coresight/coresight-etm3x-core.c          |  14 +-
 .../coresight/coresight-etm4x-core.c          |  14 +-
 drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |   3 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |   5 +-
 drivers/hwtracing/coresight/coresight-tmc.h   |   5 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 107 +--
 .../hwtracing/coresight/coresight-trace-id.h  |  57 +-
 include/linux/coresight-pmu.h                 |  17 +-
 include/linux/coresight.h                     |  20 +-
 tools/include/linux/coresight-pmu.h           |  17 +-
 tools/perf/util/auxtrace.c                    |   9 +-
 tools/perf/util/auxtrace.h                    |   1 +
 .../perf/util/cs-etm-decoder/cs-etm-decoder.c |  28 +-
 tools/perf/util/cs-etm.c                      | 617 ++++++++++++------
 tools/perf/util/cs-etm.h                      |   2 +-
 21 files changed, 633 insertions(+), 404 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
