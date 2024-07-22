Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB193FA19
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF750C78F99;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED556C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:13:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4266ed6c691so27083235e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643202; x=1722248002;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ob3o88R/yxUBwonSp9vzDZCeFMZAfTzy7u2JCgClFSk=;
 b=dzcwHENUhoUR8zX9gtRLfXZIq0tPaQSAUW5DVA7aV0tr5N3XlgzPDx0Tf7eCu3T0Gv
 +KKyh7JiWpyrVJoLjK1ncAZbeGP3ICXCsiOk6uEXF3lEVhsXda1uPsx6mXxSBFhH1tmh
 qg1ctK5LVTCMFxxsQbScTxnmZqYao1o3t1dn6RIIYkXllLs95rwa+ABfsqvVt4tSZ0FZ
 I9ca4XUeOXnNBKR4a+pKQclgqz8Ip4NQrJxEhr6ZT/5xXPcHCax1BkVa3mCxDjfe9i4T
 Ro8LNNP9n5GGNa/473uGbVF/uHsiSiLgvYptcUQjpWLWImzyNqs7dhsu256oliLtOkiO
 2ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643202; x=1722248002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ob3o88R/yxUBwonSp9vzDZCeFMZAfTzy7u2JCgClFSk=;
 b=HKEZUwgOSmiK+Erf3W64bK0XYKQ0W6LASAY4hRJh+4Ibfs3BZ/uqFwzux4rbcZxBm6
 AfQqvitQCMenDDNmcAtjmt8ZsBApkmKA3h2iVHOJipCd+T7Cp08HjCmcJoSe81Sv5nFl
 aAD3JvuBaxK/VZ3YgoD0RrYn5bRABskN2tToJ3haNBIn/09b6oTW5zJppPAUH6dFn5Zb
 2GJtx37jHIriqi53OUNXk7yKV22OVg+kbI0L6Lz08VjYCePotlLJcf8ooM+kIkv7AEo7
 1AxNoUTWdc2YsV4w0YPzw6mJYuiiLD/ToWcGCSrMqFEcUsaotX/fvW54LS7DfAas5hjj
 SjkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBAJ2eY1nRSrxDxOpXg5TycF7kz57usJ2z33dqZ1+3e4HyZGXq35+W5kXpIifRurv+T6SjkTg3g5Z/rH61KDp5x9Nvda54W/wZbMNp+gnxXOgZiBxfDemy
X-Gm-Message-State: AOJu0YwzTK3WU2scrYNCrS7egPOr9/TPYzAvkjNG3HA5nR/NvhEWm3h+
 s8l4Uu7U0/4HE2gdZxXhuc3FbSqXOt3og88KxMuqsdej41wHv0UytsWokwiD+A8=
X-Google-Smtp-Source: AGHT+IFnRlQjxIzplZP9hmspE1klaaY7FAnTuoO73aRSdCaRY/lNjrX74jyuwVgqrmifZPXhzx+e5A==
X-Received: by 2002:a05:600c:4f4e:b0:427:b995:5bd0 with SMTP id
 5b1f17b1804b1-427daa61cbfmr47929775e9.23.1721643202485; 
 Mon, 22 Jul 2024 03:13:22 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:13:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:53 +0100
Message-Id: <20240722101202.26915-12-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722101202.26915-1-james.clark@linaro.org>
References: <20240722101202.26915-1-james.clark@linaro.org>
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
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v6 11/17] coresight: Move struct
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
Tested-by: Leo Yan <leo.yan@arm.com>
Tested-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
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
