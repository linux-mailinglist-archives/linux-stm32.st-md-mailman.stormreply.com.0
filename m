Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01C93F9FE
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D16DC78F61;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8079C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:23:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so8193185e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779807; x=1721384607;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpxSR+OxOJGXCnYWh++gbk7h/WN1CJFySV4IXuclqdY=;
 b=m84KJ3g9ZvdiN32Ph2VKGCKp6c/75c5u+Fn0SK5e1hbk1fuEuXNh+TaxFs25nix141
 OVsNEG+wRwE0hGXlR8IbginSdVVqdlVJsGpC0Okv1HcG2xWZhim0Wx8QpxSXkNlvrXXy
 gzNKX9BrcnFYlv5pCbekj1fLex5P75alpx2HPhs6JJWBbbLyUY/rFghu2m6N4jLKamy5
 7X9BKOsnJQaImVMp1gGB5Sad3A+dW97GiKGDXL0IzbgzgtG8o9b1b3XmC9iRXJLDuVUb
 lpYDCxJ9Ad2A1u6jr77aRPWpjHfWKGeRB7U03ozTdiLVpKVyJ47goSb4PqRrUsq7RXfP
 YFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779807; x=1721384607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpxSR+OxOJGXCnYWh++gbk7h/WN1CJFySV4IXuclqdY=;
 b=GDhI7MUoG3aLDdMCItvxIcAUpV5ohFTLjxnXRGo1l2vKi1nECdApjKTAh4DQGOvRsh
 e/46ZqgBgJ7/XKkTipO4ULR3K37bnGTYcXjaEBMr29cFxqWZMK7tJIVu8Qf9Hs06YAB7
 FAK8XXM18ov9mfgvI3R6r9gkJCk7UMxLJcAXbFuWW4pqULHixpYSiMMZSuH5b50XGqg7
 StEn3vHMTgZ9x5WCTiyDswgMJnsItfP+J/1/D9Njv3DG9CtZ6oJ6a9TCDyHYochT91JP
 bhcz0H1uOMtLYbhYSDyPbLaSSkSLrzH+V6/b+t7XSjbhBb3udx0YWYMJmfwY8IyDzpn6
 Zwlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQJKk1MVTzJvipbXykgdsa6XcRtVCxVydPYZN4NzHLHLTXr+nxEXetTltw8R6X4pJIPAIHESN+EA0Sv6WREH7JNzNGSUlT4I9DBgu3ax12Ao8n/wUJXMG9
X-Gm-Message-State: AOJu0YzejuLCyCUFxPs+FD2ez6fQqXehAbR/G/75siCqUA6pLHigmp7G
 EuAMguAhFjbol55aeHLxLWlbwUKfoChF87oKOV2sxHlQ1+9AgvvDNfbWqrIXYd8=
X-Google-Smtp-Source: AGHT+IGkdOJ8Ugbo4oD+wcaWDs6QuuzOVfByLPfLBnScuTNj4bSyK9c0zHmOSBDx2NODaqC0aYA2CA==
X-Received: by 2002:a05:600c:6d4:b0:426:6b85:bafb with SMTP id
 5b1f17b1804b1-426707db6e7mr63038085e9.20.1720779807119; 
 Fri, 12 Jul 2024 03:23:27 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:23:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:26 +0100
Message-Id: <20240712102029.3697965-18-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH v5 17/17] coresight: Make trace ID map
	spinlock local to the map
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

Reduce contention on the lock by replacing the global lock with one for
each map.

Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c  |  1 +
 .../hwtracing/coresight/coresight-trace-id.c  | 26 +++++++++----------
 include/linux/coresight.h                     |  1 +
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c427e9344a84..ea38ecf26fcb 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1164,6 +1164,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
+		spin_lock_init(&csdev->perf_sink_id_map.lock);
 		csdev->perf_sink_id_map.cpu_map = alloc_percpu(atomic_t);
 		if (!csdev->perf_sink_id_map.cpu_map) {
 			kfree(csdev);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index bddaed3e5cf8..d98e12cb30ec 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -15,12 +15,10 @@
 /* Default trace ID map. Used in sysfs mode and for system sources */
 static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
 static struct coresight_trace_id_map id_map_default = {
-	.cpu_map = &id_map_default_cpu_ids
+	.cpu_map = &id_map_default_cpu_ids,
+	.lock = __SPIN_LOCK_UNLOCKED(id_map_default.lock)
 };
 
-/* lock to protect id_map and cpu data  */
-static DEFINE_SPINLOCK(id_map_lock);
-
 /* #define TRACE_ID_DEBUG 1 */
 #if defined(TRACE_ID_DEBUG) || defined(CONFIG_COMPILE_TEST)
 
@@ -123,11 +121,11 @@ static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map
 	unsigned long flags;
 	int cpu;
 
-	spin_lock_irqsave(&id_map_lock, flags);
+	spin_lock_irqsave(&id_map->lock, flags);
 	bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
 	for_each_possible_cpu(cpu)
 		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
-	spin_unlock_irqrestore(&id_map_lock, flags);
+	spin_unlock_irqrestore(&id_map->lock, flags);
 	DUMP_ID_MAP(id_map);
 }
 
@@ -136,7 +134,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 	unsigned long flags;
 	int id;
 
-	spin_lock_irqsave(&id_map_lock, flags);
+	spin_lock_irqsave(&id_map->lock, flags);
 
 	/* check for existing allocation for this CPU */
 	id = _coresight_trace_id_read_cpu_id(cpu, id_map);
@@ -163,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 	atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
 
 get_cpu_id_out_unlock:
-	spin_unlock_irqrestore(&id_map_lock, flags);
+	spin_unlock_irqrestore(&id_map->lock, flags);
 
 	DUMP_ID_CPU(cpu, id);
 	DUMP_ID_MAP(id_map);
@@ -180,12 +178,12 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
 	if (!id)
 		return;
 
-	spin_lock_irqsave(&id_map_lock, flags);
+	spin_lock_irqsave(&id_map->lock, flags);
 
 	coresight_trace_id_free(id, id_map);
 	atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
 
-	spin_unlock_irqrestore(&id_map_lock, flags);
+	spin_unlock_irqrestore(&id_map->lock, flags);
 	DUMP_ID_CPU(cpu, id);
 	DUMP_ID_MAP(id_map);
 }
@@ -195,10 +193,10 @@ static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *i
 	unsigned long flags;
 	int id;
 
-	spin_lock_irqsave(&id_map_lock, flags);
+	spin_lock_irqsave(&id_map->lock, flags);
 	/* prefer odd IDs for system components to avoid legacy CPU IDS */
 	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
-	spin_unlock_irqrestore(&id_map_lock, flags);
+	spin_unlock_irqrestore(&id_map->lock, flags);
 
 	DUMP_ID(id);
 	DUMP_ID_MAP(id_map);
@@ -209,9 +207,9 @@ static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&id_map_lock, flags);
+	spin_lock_irqsave(&id_map->lock, flags);
 	coresight_trace_id_free(id, id_map);
-	spin_unlock_irqrestore(&id_map_lock, flags);
+	spin_unlock_irqrestore(&id_map->lock, flags);
 
 	DUMP_ID(id);
 	DUMP_ID_MAP(id_map);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 197949fd2c35..c13342594278 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -233,6 +233,7 @@ struct coresight_trace_id_map {
 	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
 	atomic_t __percpu *cpu_map;
 	atomic_t perf_cs_etm_session_active;
+	spinlock_t lock;
 };
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
