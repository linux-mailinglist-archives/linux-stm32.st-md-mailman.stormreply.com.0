Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0093F9F8
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 065FDC78033;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9E44C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:22:59 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-427a0efdb9bso2318895e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779779; x=1721384579;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exGpI/q1ubHfcT+dWNjwEciQxWd5C9veIqWOilMjY6Y=;
 b=O27WML4yj6bkFsq7uvTn4GAesVh5Tl51kz2Doy2US0aSRCU8OnS4cM0CYNiXOLN51r
 b83C6sF+g6QjxSFVSZLtl0Pq0ap9Z9w2tobn4K2WZ2aZ/p3c5uErzYLr8WdOpIGgRVVA
 faJPVNJn2Uz7qN1hFpAF04dflQmigQaysqTQylCj4HxgTUn8B/YsFBPI1H/N2/htFCYP
 JkKj2j2G9oczFIC2VRXfBoY6X2Qa7ei1sPubMV4Ke8zkDglWuGArQfUUi7FLHJz8xOu1
 b8XXkDkhfJLx5ljYnYI6e0v9aveeRgFzG1KN5hoIq6+f4C/s8CFWfl29NbVUfrH1lDsM
 vuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779779; x=1721384579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exGpI/q1ubHfcT+dWNjwEciQxWd5C9veIqWOilMjY6Y=;
 b=loWVBnG+Y2Y/pIDnZCjTZUiW0vsMlDmW2PqmlW+EQ1CeqZ3b8YHDkq5aJcqk4I9Ray
 LM/ztQN5/BNTg440l9HFp9/B0gkHeylMJ2SpQnTfmsOn+IXctiXc+zEWXyZ3WaNdU/52
 nGVTXm+7kPv3WDXsLKBdpSJ2QbVnLTh+5HNBRNIc1dEjIQFo3/nh6yKjQfOhbDOxbR+w
 gtD0QAyE9zZmz+daYZ9iYnxD3VhLTq70Vpb/SISwxO65HM/iIeIWB14gGSP8+YWPFfgv
 lWbCS0VyxAXnzoDQvsYeYRbHs/dgjf9vnuzQvWrf80B8lexmc+VZzBPI3qccncHvCmy0
 DIyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8vkQIMGrx35NMPK4b6Zk1DhUtDNiafZcQ6HEMB3X7gNQ9pv/wNa+szHcKnNAtZr76bCRSEWFS30eZXOUizD5yR84wLBUElQiFHowKhyDoAI0E714vJcuv
X-Gm-Message-State: AOJu0YzYpPyJDoLZm4Qlb7dcSKxQceYUtj3G+aNjIl6piEG37i1SSWF5
 2SgpDY+Suaq0hRW4+x/hI0idt3yORDaIsNXBUKLud++GHVI4DyeJ97TsH48pqkg=
X-Google-Smtp-Source: AGHT+IGgUYd4gRyLTEW8Swsk7DoK36qF/yql0OQUFfYb+pVDpipH090ZkEOjNQT+aIPUK7J5yQHwzw==
X-Received: by 2002:a05:600c:30d3:b0:426:66fe:8051 with SMTP id
 5b1f17b1804b1-426707e677dmr81812355e9.24.1720779779542; 
 Fri, 12 Jul 2024 03:22:59 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:22:59 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:20 +0100
Message-Id: <20240712102029.3697965-12-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712102029.3697965-1-james.clark@linaro.org>
References: <20240712102029.3697965-1-james.clark@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v5 11/17] coresight: Move struct
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

From: James Clark <james.clark@arm.com>

The trace ID maps will need to be created and stored by the core and
Perf code so move the definition up to the common header.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
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
