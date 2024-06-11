Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 339E6903F85
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 17:03:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0DD1C78004;
	Tue, 11 Jun 2024 15:03:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECEBDC78003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 15:03:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E614F1595;
 Tue, 11 Jun 2024 08:04:04 -0700 (PDT)
Received: from e127643.arm.com (unknown [10.57.41.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78BD03F64C;
 Tue, 11 Jun 2024 08:03:36 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Tue, 11 Jun 2024 16:02:19 +0100
Message-Id: <20240611150228.1802828-9-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611150228.1802828-1-james.clark@arm.com>
References: <20240611150228.1802828-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v3 08/14] coresight: Move struct
	coresight_trace_id_map to common header
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

The trace ID maps will need to be created and stored by the core and
Perf code so move the definition up to the common header.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@arm.com>
---
 .../hwtracing/coresight/coresight-trace-id.c  |  1 +
 .../hwtracing/coresight/coresight-trace-id.h  | 19 -------------------
 include/linux/coresight.h                     | 18 ++++++++++++++++++
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index af5b4ef59cea..19005b5b4dc4 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022, Linaro Limited, All rights reserved.
  * Author: Mike Leach <mike.leach@linaro.org>
  */
+#include <linux/coresight.h>
 #include <linux/coresight-pmu.h>
 #include <linux/cpumask.h>
 #include <linux/kernel.h>
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 3797777d367e..49438a96fcc6 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -32,10 +32,6 @@
 #include <linux/bitops.h>
 #include <linux/types.h>
 
-
-/* architecturally we have 128 IDs some of which are reserved */
-#define CORESIGHT_TRACE_IDS_MAX 128
-
 /* ID 0 is reserved */
 #define CORESIGHT_TRACE_ID_RES_0 0
 
@@ -46,21 +42,6 @@
 #define IS_VALID_CS_TRACE_ID(id)	\
 	((id > CORESIGHT_TRACE_ID_RES_0) && (id < CORESIGHT_TRACE_ID_RES_TOP))
 
-/**
- * Trace ID map.
- *
- * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
- *		Initialised so that the reserved IDs are permanently marked as
- *		in use.
- * @pend_rel_ids: CPU IDs that have been released by the trace source but not
- *		  yet marked as available, to allow re-allocation to the same
- *		  CPU during a perf session.
- */
-struct coresight_trace_id_map {
-	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
-	DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
-};
-
 /* Allocate and release IDs for a single default trace ID map */
 
 /**
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index f09ace92176e..c16c61a8411d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -218,6 +218,24 @@ struct coresight_sysfs_link {
 	const char *target_name;
 };
 
+/* architecturally we have 128 IDs some of which are reserved */
+#define CORESIGHT_TRACE_IDS_MAX 128
+
+/**
+ * Trace ID map.
+ *
+ * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
+ *		Initialised so that the reserved IDs are permanently marked as
+ *		in use.
+ * @pend_rel_ids: CPU IDs that have been released by the trace source but not
+ *		  yet marked as available, to allow re-allocation to the same
+ *		  CPU during a perf session.
+ */
+struct coresight_trace_id_map {
+	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
+	DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
+};
+
 /**
  * struct coresight_device - representation of a device as used by the framework
  * @pdata:	Platform data with device connections associated to this device.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
