Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90A93F9F5
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE62EC7802D;
	Mon, 29 Jul 2024 15:58:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C0F6C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 10:22:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42679f33fefso12234685e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720779766; x=1721384566;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+cqckU3PK/4oZg7w+6ZlVXIz08ibsuhvPsyHiAGTJU=;
 b=wFq6CcXGGYRzxRV7Z7UKdGL5+J2llrBc+s6W9W3YiSNi6CktGE+t5kwvy7RQ+CDPB3
 WsDk5Sa4P7nMPRVImOdFxhJqHQEDgz90cqmVP5krg57nYaDxrJp938nInCwGAPZPOy7g
 dMi0dbED0fFvE7izwMJAQ2mMbRSV4vET1h4cJl3EHSBqid1L9ZOMthzViDW4eR4G6qj8
 EYF6N2mYjUGdsc84gZufr2ArYn4l92Cvi72WvAF/k2LGzNZ6JPZUdTJEV1p1dvjVDhwR
 ly6+gpyhBNeNqm/hza59ctVArgHROh8Hg4/x5JNN6k8gCWDc6U9jVGD80QtqVrWwYdC6
 EdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720779766; x=1721384566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T+cqckU3PK/4oZg7w+6ZlVXIz08ibsuhvPsyHiAGTJU=;
 b=VMm8JtjAf3fQ1YNnocBCxqZciCBsk+niPB6N6zlmwamBZn0oIY8yOr92lZ6WByEzt7
 8zGkWTecUyX5o6UNlETuMwP+QS4jrZDelAAMdmO/tcWIwYY4RxoHLi5QRhShS/C3hycq
 9AdP4HHGgLsS6Yq0PwbZKdT7dvCaYG+7AKynTcBm2sp5ODM5rEdGU+cRI8zFSiBcmgil
 Fe96JKoSjdsMbA5CETxWHvh1COI1CBxgseH3nPieLun92vg2KNREApGIbXYS+T4U9+mo
 dJIAYHjmEda3ZKSXxuPoX4xO4uFiXj9KcyAYdWwue5dzXLMzwBL6wPdIf3Gr+xg5uWru
 JJiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVvBvSaCvLhtLsrkyK9kqGHLXodyLfAIQcBzvGemRR9i4RHHKOez0By8UVXH+lPbRC4SmUW3gYwpJjW3+q8qLF9xNwNG2I3eFeb7iQXPyOKkatXOQJVJPX
X-Gm-Message-State: AOJu0YywO4s+nnuNSDYHWh25VV9jXQVfKZUKnIhO/stm2IZmAYEZ/tY6
 xpVe64MWvxiCKtspdXfvt2ei1sdoqMHBXSV0hE3d02dTRkSfNM0FBWBJuAGbh3o=
X-Google-Smtp-Source: AGHT+IE+VB3WvOca9zdDx6Lys780musKRQG8QOG3x0Z34w+FsYxwd3eo3DXVQhPIsbF9WOcbW4gGhg==
X-Received: by 2002:a5d:588d:0:b0:367:f2ea:13e4 with SMTP id
 ffacd0b85a97d-367f2ea15eamr3674929f8f.32.1720779766060; 
 Fri, 12 Jul 2024 03:22:46 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm9911058f8f.63.2024.07.12.03.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:22:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Fri, 12 Jul 2024 11:20:17 +0100
Message-Id: <20240712102029.3697965-9-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH v5 08/17] perf: cs-etm: Add runtime version
	check for OpenCSD
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

OpenCSD is dynamically linked so although there is a build time check,
at runtime the user might still have the wrong version. To avoid hard
to debug errors, add a runtime version check.

Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/build/feature/test-libopencsd.c               |  4 ++--
 tools/perf/Makefile.config                          |  2 +-
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c     | 13 +++++++++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h     |  1 +
 tools/perf/util/cs-etm-decoder/cs-etm-min-version.h | 13 +++++++++++++
 tools/perf/util/cs-etm.c                            |  3 +++
 6 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 tools/perf/util/cs-etm-decoder/cs-etm-min-version.h

diff --git a/tools/build/feature/test-libopencsd.c b/tools/build/feature/test-libopencsd.c
index 4cfcef9da3e4..d092a0c662f4 100644
--- a/tools/build/feature/test-libopencsd.c
+++ b/tools/build/feature/test-libopencsd.c
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <opencsd/c_api/opencsd_c_api.h>
+#include "cs-etm-decoder/cs-etm-min-version.h"
 
 /*
  * Check OpenCSD library version is sufficient to provide required features
  */
-#define OCSD_MIN_VER ((1 << 16) | (2 << 8) | (1))
 #if !defined(OCSD_VER_NUM) || (OCSD_VER_NUM < OCSD_MIN_VER)
-#error "OpenCSD >= 1.2.1 is required"
+#error "OpenCSD minimum version (OCSD_MIN_VER) not met."
 #endif
 
 int main(void)
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 7f1e016a9253..2d21be42820e 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -141,7 +141,7 @@ endif
 ifdef CSLIBS
   LIBOPENCSD_LDFLAGS := -L$(CSLIBS)
 endif
-FEATURE_CHECK_CFLAGS-libopencsd := $(LIBOPENCSD_CFLAGS)
+FEATURE_CHECK_CFLAGS-libopencsd := $(LIBOPENCSD_CFLAGS) -I$(src-perf)/util
 FEATURE_CHECK_LDFLAGS-libopencsd := $(LIBOPENCSD_LDFLAGS) $(OPENCSDLIBS)
 
 # for linking with debug library, run like:
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index b78ef0262135..5e1b4503aab1 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -16,6 +16,7 @@
 
 #include "cs-etm.h"
 #include "cs-etm-decoder.h"
+#include "cs-etm-min-version.h"
 #include "debug.h"
 #include "intlist.h"
 
@@ -835,3 +836,15 @@ const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder)
 {
 	return decoder->decoder_name;
 }
+
+int cs_etm_decoder__check_ver(void)
+{
+	if (ocsd_get_version() < OCSD_MIN_VER) {
+		pr_err("OpenCSD >= %d.%d.%d is required\n", OCSD_MIN_MAJOR,
+							    OCSD_MIN_MINOR,
+							    OCSD_MIN_PATCH);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 12c782fa6db2..2ec426ee16dc 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -107,5 +107,6 @@ int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
 
 int cs_etm_decoder__reset(struct cs_etm_decoder *decoder);
 const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder);
+int cs_etm_decoder__check_ver(void);
 
 #endif /* INCLUDE__CS_ETM_DECODER_H__ */
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-min-version.h b/tools/perf/util/cs-etm-decoder/cs-etm-min-version.h
new file mode 100644
index 000000000000..c69597e9d0af
--- /dev/null
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-min-version.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef INCLUDE__CS_ETM_MIN_VERSION_H__
+#define INCLUDE__CS_ETM_MIN_VERSION_H__
+
+#define OCSD_MIN_MAJOR 1
+#define OCSD_MIN_MINOR 2
+#define OCSD_MIN_PATCH 1
+
+#define OCSD_MIN_VER ((OCSD_MIN_MAJOR << 16) | \
+		      (OCSD_MIN_MINOR << 8) |  \
+		      (OCSD_MIN_PATCH))
+
+#endif /* INCLUDE__CS_ETM_MIN_VERSION_H__ */
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 49fadf46f42b..2385d5ed5ea5 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3369,6 +3369,9 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	u64 *ptr = NULL;
 	u64 **metadata = NULL;
 
+	if (cs_etm_decoder__check_ver())
+		return -EINVAL;
+
 	/* First the global part */
 	ptr = (u64 *) auxtrace_info->priv;
 	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
