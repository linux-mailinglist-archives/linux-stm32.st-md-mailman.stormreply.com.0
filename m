Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EBB69BF64
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:29:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A43CC65E58;
	Sun, 19 Feb 2023 09:29:11 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71287C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:29:10 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 124-20020a250482000000b0090f2c84a6a4so2098643ybe.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hFVME4MawZ7uSatJrZd2lz8rTpTsmAg9tHqKzSK6mH4=;
 b=lYts0MZFkBMWWWqsvbZ4s4LF7YBZTVWoKqr0XB8T3QZMUTOA2s2Z+G/g2UZslwUZuC
 Bg0JfwZvu8l1XTdfCWtyr+kOVvUd3vxdajoINwRuBTIhR35jt0E02ChfAVNX7oNfDnUc
 OQxysWfmRktf3N7SbQdfMUQDwloDegoPhyu+QeutG7viIgr3NSQJg+6Q1X7h+12Q6I/W
 lCtx21C8+b0DCEVf/bHP/8aPsvD8vdxjq3D6aElrMFCmBpWcEKc/gfnWhBWTMFWPGVfd
 G0NcqD61UhEmodEZAPS6XL71MQzBlkE/OwDXXgcA/gAT9OXasg2DRifrqgTUe2QIxicB
 mB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hFVME4MawZ7uSatJrZd2lz8rTpTsmAg9tHqKzSK6mH4=;
 b=VCGbz0OEXfkKfU8aUfIYkUxrWyDnaS06p1QEqiY4e0fXzG2I1W0mpNUJSH1xBgPq04
 MndF2gR0deGsYhVjOwUuozqDcic86mGIRi+xjhRlILC4TF42EqNYJyVgeP6IlcW0eOl6
 9Heg0/OLpUmOSjmBxkGqetEWQ1C0Q+Bho3PvC8oGIu0nARkTw9mWNw7Vqd3rK6qHAmOH
 +EB7FBJBbyrT3dcVj2s/3kfi6CnOzGVlAdb5SleF/e/x4Dce7Kb7vIKLLKRgXMw11fa8
 kEXvichFLyPdW+w5R7hlX3Utc/Q5HaVPyRenreY9UgU4sbY5N4GDmZTmyNim0Ac0vF7U
 TFtA==
X-Gm-Message-State: AO0yUKUC9ks0fv1UvhAPl2ENDY6ezCpiUm8ebN5sQ7Yur5WEwprLCYdd
 NauKFFZtIdqjas8zNPvnNJd8J0vz36q+
X-Google-Smtp-Source: AK7set88ydp5C+tDl9Q//caqm5c4PHb281InYvDmoStSEM3jMHzSTQOu5zeqkSSBL+FN422RFEfJNs9jMi0d
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a25:9a45:0:b0:97a:4493:a7b8 with SMTP id
 r5-20020a259a45000000b0097a4493a7b8mr128740ybo.505.1676798949427; Sun, 19 Feb
 2023 01:29:09 -0800 (PST)
Date: Sun, 19 Feb 2023 01:27:58 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-2-irogers@google.com>
Mime-Version: 1.0
References: <20230219092848.639226-1-irogers@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Zhengjun Xing <zhengjun.xing@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>, 
 James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
 John Garry <john.g.garry@oracle.com>, Kan Liang <kan.liang@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Suzuki Poulouse <suzuki.poulose@arm.com>,
 Leo Yan <leo.yan@linaro.org>, 
 Florian Fischer <florian.fischer@muhq.space>,
 Ravi Bangoria <ravi.bangoria@amd.com>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>,
 Sean Christopherson <seanjc@google.com>, 
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Perry Taylor <perry.taylor@intel.com>, 
 Caleb Biggers <caleb.biggers@intel.com>
Cc: Ian Rogers <irogers@google.com>, Stephane Eranian <eranian@google.com>
Subject: [Linux-stm32] [PATCH v1 01/51] perf tools: Ensure evsel name is
	initialized
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

Use the evsel__name accessor as otherwise name may be NULL resulting
in a segv. This was observed with the perf stat shell test.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/synthetic-events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
index 9ab9308ee80c..6def01036eb5 100644
--- a/tools/perf/util/synthetic-events.c
+++ b/tools/perf/util/synthetic-events.c
@@ -2004,7 +2004,7 @@ int perf_event__synthesize_event_update_name(struct perf_tool *tool, struct evse
 					     perf_event__handler_t process)
 {
 	struct perf_record_event_update *ev;
-	size_t len = strlen(evsel->name);
+	size_t len = strlen(evsel__name(evsel));
 	int err;
 
 	ev = event_update_event__new(len + 1, PERF_EVENT_UPDATE__NAME, evsel->core.id[0]);
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
