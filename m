Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 936BD8B5D79
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:23:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59D22C71285;
	Mon, 29 Apr 2024 15:23:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D397C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:23:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4BED2F4;
 Mon, 29 Apr 2024 08:24:17 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D917C3F793;
 Mon, 29 Apr 2024 08:23:47 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: linux-perf-users@vger.kernel.org, gankulkarni@os.amperecomputing.com,
 scclevenger@os.amperecomputing.com, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, mike.leach@linaro.org
Date: Mon, 29 Apr 2024 16:21:47 +0100
Message-Id: <20240429152207.479221-3-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429152207.479221-1-james.clark@arm.com>
References: <20240429152207.479221-1-james.clark@arm.com>
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
Subject: [Linux-stm32] [PATCH 02/17] perf auxtrace: Allow number of queues
	to be specified
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

Currently it's only possible to initialize with the default number of
queues and then use auxtrace_queues__add_event() to grow the array. But
that's problematic if you don't have a real event to pass into that
function yet.

The queues hold a void *priv member to store custom state, and for
Coresight we want to create decoders upfront before receiving data, so
add a new function that allows pre-allocating queues. One reason to do
this is because we might need to store metadata (HW_ID events) that
effects other queues, but never actually receive auxtrace data on that
queue.

Signed-off-by: James Clark <james.clark@arm.com>
---
 tools/perf/util/auxtrace.c | 9 +++++++--
 tools/perf/util/auxtrace.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 3684e6009b63..563b6c4fca31 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -218,15 +218,20 @@ static struct auxtrace_queue *auxtrace_alloc_queue_array(unsigned int nr_queues)
 	return queue_array;
 }
 
-int auxtrace_queues__init(struct auxtrace_queues *queues)
+int auxtrace_queues__init_nr(struct auxtrace_queues *queues, int nr_queues)
 {
-	queues->nr_queues = AUXTRACE_INIT_NR_QUEUES;
+	queues->nr_queues = nr_queues;
 	queues->queue_array = auxtrace_alloc_queue_array(queues->nr_queues);
 	if (!queues->queue_array)
 		return -ENOMEM;
 	return 0;
 }
 
+int auxtrace_queues__init(struct auxtrace_queues *queues)
+{
+	return auxtrace_queues__init_nr(queues, AUXTRACE_INIT_NR_QUEUES);
+}
+
 static int auxtrace_queues__grow(struct auxtrace_queues *queues,
 				 unsigned int new_nr_queues)
 {
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 55702215a82d..8a6ec9565835 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -521,6 +521,7 @@ int auxtrace_mmap__read_snapshot(struct mmap *map,
 				 struct perf_tool *tool, process_auxtrace_t fn,
 				 size_t snapshot_size);
 
+int auxtrace_queues__init_nr(struct auxtrace_queues *queues, int nr_queues);
 int auxtrace_queues__init(struct auxtrace_queues *queues);
 int auxtrace_queues__add_event(struct auxtrace_queues *queues,
 			       struct perf_session *session,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
