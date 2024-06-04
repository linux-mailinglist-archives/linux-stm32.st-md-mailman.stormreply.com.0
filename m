Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6408FB558
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 16:32:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39DD1C7128E;
	Tue,  4 Jun 2024 14:32:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C964C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 14:32:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 693A91042;
 Tue,  4 Jun 2024 07:32:46 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBB603F64C;
 Tue,  4 Jun 2024 07:32:18 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Tue,  4 Jun 2024 15:30:17 +0100
Message-Id: <20240604143030.519906-9-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604143030.519906-1-james.clark@arm.com>
References: <20240604143030.519906-1-james.clark@arm.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/16] coresight: Remove unused ETM Perf
	stubs
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

This file is never included anywhere if CONFIG_CORESIGHT is not set so
they are unused and aren't currently compile tested with any config so
remove them.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@arm.com>
---
 .../hwtracing/coresight/coresight-etm-perf.h   | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index bebbadee2ceb..744531158d6b 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -62,7 +62,6 @@ struct etm_event_data {
 	struct list_head * __percpu *path;
 };
 
-#if IS_ENABLED(CONFIG_CORESIGHT)
 int etm_perf_symlink(struct coresight_device *csdev, bool link);
 int etm_perf_add_symlink_sink(struct coresight_device *csdev);
 void etm_perf_del_symlink_sink(struct coresight_device *csdev);
@@ -77,23 +76,6 @@ static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
 int etm_perf_add_symlink_cscfg(struct device *dev,
 			       struct cscfg_config_desc *config_desc);
 void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc);
-#else
-static inline int etm_perf_symlink(struct coresight_device *csdev, bool link)
-{ return -EINVAL; }
-int etm_perf_add_symlink_sink(struct coresight_device *csdev)
-{ return -EINVAL; }
-void etm_perf_del_symlink_sink(struct coresight_device *csdev) {}
-static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
-{
-	return NULL;
-}
-int etm_perf_add_symlink_cscfg(struct device *dev,
-			       struct cscfg_config_desc *config_desc)
-{ return -EINVAL; }
-void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc) {}
-
-#endif /* CONFIG_CORESIGHT */
-
 int __init etm_perf_init(void);
 void etm_perf_exit(void);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
