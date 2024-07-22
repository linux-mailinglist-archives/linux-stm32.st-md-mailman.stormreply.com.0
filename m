Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4293FA15
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9991C78F91;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8132C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 10:13:03 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so53331261fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721643183; x=1722247983;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22WWYz2tUVGtuasGpu3eN+nV++HsU5p2cQus0dyDbEs=;
 b=ZY/6jcg9wPtj2k8go50cF7oOlINXkBj/30fPbyPyau2+kZzoGp9BCtEbWkUId5eGjJ
 B6OPIxeEvhmIbv0XWKPjFcy624ormHdHf3wKj9aWeboqE9SsJP1grqTWEn/wOC8kJ0NQ
 EWGDSB+GrKQiRunWmDZ21GspHjU+4ahOoH+KHulHBbkL5qC2k1UZ/fZYzi1LeRa+XOwY
 efNbKI3EhC4QLG812ecnrGKZM1l7gq24yOvcrzgOSS8Sg1WTlkVSun7Kl6km4+DCUZBV
 wvPBb8pdK5Y8WJ8wE/TpkvXW7Is4EponqW4UrToZo8yk8aKT2Wu7veKbiErKz5QFtzzi
 FzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643183; x=1722247983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22WWYz2tUVGtuasGpu3eN+nV++HsU5p2cQus0dyDbEs=;
 b=W2ER8JQkwJl//7Zd71PX8IxVNKFCE9u2fv97FNpC+bxhLCTv1N2C/JrhQXgOL8Q0IX
 0GR55sEavErMTFEjz1b7lXGf86IZFC/7FQHOrQMoS6yKb/5dmeZOFFG54sneEygxxUEE
 MSfZ3GYPOJp+qL0pxaFKmEhQmH44ufr3nbbMYH+zeoA4G1lWBdrn9fcl1Jf68gJrY3uB
 80yZfv9RLM3Rfc5nGuPM5RYL5QDWXjNyrEHVU/1f06M+z5JDEFrei0vNdfZXHEy8JuZc
 yZjZtsSY91g5ah9yaNma4ihg/B2Hl6ul1EFGoOdIq+B+AEsyG09IXWK7W/cbuIzJoDUY
 1O4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpBHFpPiLu/FmlE+f2z4oxKHUepjp1Eh+rLmz6vlVZSrNAqsWg8+cE6Ephe5DTbIq2dEdyDfKX/sAszH/ekK1Zp/9oujfLF0XuHtmWfM9OcDpAr+VXPa9u
X-Gm-Message-State: AOJu0Ywv5FkNCH2GYZMyAWnv0dHYmPKMvNp+ALKgXM+gFFXu9cagi3W3
 24j+E8H9UN3FokgAOg0xuwQUopmLZ3sbFLgfq6syc4K54uRiRUpO1q3+sfSh8VA=
X-Google-Smtp-Source: AGHT+IGUJY+LiEZGDA07U+K/qkfthMc8al4V942XRBG+OJuyhgexjuNQfTeA3mz1e0/Ia/+b/eMfWw==
X-Received: by 2002:a2e:8059:0:b0:2ef:24e0:6338 with SMTP id
 38308e7fff4ca-2ef24e06429mr37487261fa.27.1721643183124; 
 Mon, 22 Jul 2024 03:13:03 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147993865e9.33.2024.07.22.03.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:13:02 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Mon, 22 Jul 2024 11:11:49 +0100
Message-Id: <20240722101202.26915-8-james.clark@linaro.org>
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
Subject: [Linux-stm32] [PATCH v6 07/17] perf: cs-etm: Print queue number in
	raw trace dump
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

Now that we have overlapping trace IDs it's also useful to know what the
queue number is to be able to distinguish the source of the trace so
print it inline. Hide it behind the -v option because it might not be
obvious to users what the queue number is.

Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  4 ++--
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  2 +-
 tools/perf/util/cs-etm.c                        | 13 ++++++++++---
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index d49c3e9c7c21..b78ef0262135 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -41,7 +41,7 @@ const u32 INSTR_PER_NS = 10;
 
 struct cs_etm_decoder {
 	void *data;
-	void (*packet_printer)(const char *msg);
+	void (*packet_printer)(const char *msg, void *data);
 	bool suppress_printing;
 	dcd_tree_handle_t dcd_tree;
 	cs_etm_mem_cb_type mem_access;
@@ -202,7 +202,7 @@ static void cs_etm_decoder__print_str_cb(const void *p_context,
 	const struct cs_etm_decoder *decoder = p_context;
 
 	if (p_context && str_len && !decoder->suppress_printing)
-		decoder->packet_printer(msg);
+		decoder->packet_printer(msg, decoder->data);
 }
 
 static int
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 272c2efe78ee..12c782fa6db2 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -60,7 +60,7 @@ struct cs_etm_trace_params {
 
 struct cs_etm_decoder_params {
 	int operation;
-	void (*packet_printer)(const char *msg);
+	void (*packet_printer)(const char *msg, void *data);
 	cs_etm_mem_cb_type mem_acc_cb;
 	bool formatted;
 	bool fsyncs;
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index b11b0cae608e..6298a5c7a651 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -762,15 +762,22 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
 	}
 }
 
-static void cs_etm__packet_dump(const char *pkt_string)
+static void cs_etm__packet_dump(const char *pkt_string, void *data)
 {
 	const char *color = PERF_COLOR_BLUE;
 	int len = strlen(pkt_string);
+	struct cs_etm_queue *etmq = data;
+	char queue_nr[64];
+
+	if (verbose)
+		snprintf(queue_nr, sizeof(queue_nr), "Qnr:%d; ", etmq->queue_nr);
+	else
+		queue_nr[0] = '\0';
 
 	if (len && (pkt_string[len-1] == '\n'))
-		color_fprintf(stdout, color, "	%s", pkt_string);
+		color_fprintf(stdout, color, "	%s%s", queue_nr, pkt_string);
 	else
-		color_fprintf(stdout, color, "	%s\n", pkt_string);
+		color_fprintf(stdout, color, "	%s%s\n", queue_nr, pkt_string);
 
 	fflush(stdout);
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
