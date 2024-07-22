Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD693FA13
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9309DC78F8D;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01DCAC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:12:54 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso30871135e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643173; x=1722247973;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBWFBM+gp3e/C9sPG7aaILEvO32vZCwGZx3iasW4K4Q=;
 b=L3SbXQ3/OufSYP+se8h/84EiHJ5aONEM9J5k+QOMnvpxS4X+BipXH1EUoOvoTsyE1L
 s4NuBvTyQIocYlOaSynkhXIiGMAPynwPiDuP2LJiipUGyusvygh2SsUhsPlG7dl24stV
 YWSHFHl2aGD2JkcGGWcyNVU/uDM7eEUuhFM5BipArNLMlfL376yzrQST/QG+vEC1pJz2
 RcFeIC9WC4iFqX/+J7WldaAjQEoKNyxLIADuO3EJFzDRTA/6et8DaDNQHz/os4+lNgl0
 fWeMBPZvHH5bMOLQuFdpmqZchY2tXxkkiuYH8m3//hRYn0xllSadcc07eIlvm99i5abV
 J78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643173; x=1722247973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBWFBM+gp3e/C9sPG7aaILEvO32vZCwGZx3iasW4K4Q=;
 b=tUVagFww1CuoByY1TFAl7a6yvyHNJjHj3nytzAo0kdNVfFSDNJpJyaHKs8qNO1ZL/V
 dBV+l20tMrSOZhGwLXazzSn/7zNhPkmF/l4txzx5pmHUBSqAgIxrGbHIS9cSNa5WnMbs
 XZirwsmWIhGw0VUPZEbQXF1X+c25gL0MUUs/QVsgBy3pnucgdZRZ4n/2BaMBuf5qXf+O
 Et2ZCD8+A8/u4HJfw/UlpwkLVKY8H/gvbilbMKJ7dImG5p29SVJ/fbssQbMyurn1mHqA
 E23vgLKA1aGE0KA5bxNAdHJhvFoyfw331+3ZKbbusyNwv1WJDaqOQP1JppQDJB07XxhF
 y1hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvlIb/YFbDITN/BFWdKDYI1bc8geG7Eo7dkuSKhnHk5/Fuf/QH+QxiQHwFgZr5ZmDXAhQBqnCrO3sQHxQ0b/bmhZ8DL9nbN1g34wSDE6ttc1QFwDrdPLJ9
X-Gm-Message-State: AOJu0YyBlu7zBgOwTBaLzvx8YJBSIXgfVsJtCEL4HoCHzsdayvAgLuBh
 iQNAQ0Trp7spvIvhyLto8KrbDDq5MhJrbJVIBX2lxaJ2wRgw/5qRJ+LKlRSPM5s=
X-Google-Smtp-Source: AGHT+IGYIdyL3I1JnwUVfQo4oAyFcYwPdf4bNyN/KdL9IsI3rZiBMwNwH2ZruyyHUHfolR/1azJbfQ==
X-Received: by 2002:a05:600c:4751:b0:426:62c6:4341 with SMTP id
 5b1f17b1804b1-427dc52e886mr46427815e9.20.1721643173518; 
 Mon, 22 Jul 2024 03:12:53 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:12:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:47 +0100
Message-Id: <20240722101202.26915-6-james.clark@linaro.org>
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
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Liang, Kan" <kan.liang@linux.intel.com>
Subject: [Linux-stm32] [PATCH v6 05/17] perf: cs-etm: Only save valid trace
	IDs into files
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

This isn't a bug because Perf always masks with
CORESIGHT_TRACE_ID_VAL_MASK before using these values, but to avoid it
looking like it could be, make an effort to not save bad values.

Signed-off-by: James Clark <james.clark@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index b0118546cd4d..14b8afabce3a 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -643,7 +643,8 @@ static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu)
 
 static __u64 cs_etm_get_legacy_trace_id(struct perf_cpu cpu)
 {
-	return CORESIGHT_LEGACY_CPU_TRACE_ID(cpu.cpu);
+	/* Wrap at 48 so that invalid trace IDs aren't saved into files. */
+	return CORESIGHT_LEGACY_CPU_TRACE_ID(cpu.cpu % 48);
 }
 
 static void cs_etm_save_etmv4_header(__u64 data[], struct auxtrace_record *itr, struct perf_cpu cpu)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
