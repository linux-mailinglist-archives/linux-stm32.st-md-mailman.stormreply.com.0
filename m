Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F2E69BF9E
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:34:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97844C6A5FE;
	Sun, 19 Feb 2023 09:34:12 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAE54C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:34:11 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-536994ed9f2so3594317b3.14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SBnNbiH+hab12DiOKBd4pcQP1xg7aEKLvUH64+SdruU=;
 b=lMQXrD7/f5Md4Cv/Wu4Z3DRM30d0/Nfh2T/ynQgxAmUmcGDb50w7szQMN0mpyoaGO2
 /KdOcvlaYuqHsrNTWXuo8TUwMlOEss4q8f9kTxFsrrK0yzTDOal0zeVsikFKmnYi1xy1
 ISw/xdS0uAhog4e1fTOEADlDMT1LTOMPedDe904T1ZO1xypLhlaFsSaeUjrSXaUz6fFk
 msQHGNFimxoQ+TOS/hoLyrv1/fbNc/ptM/wx+RLmFSGLlTDitFY8whrioOlTCio/r8RJ
 kf7fNFbYz1FDSf1lcNFUE8BVZf9eCYbnaM+F9qAETfZ5JX+dy6Dc7IZB7eKVK/qH0GCF
 upeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SBnNbiH+hab12DiOKBd4pcQP1xg7aEKLvUH64+SdruU=;
 b=ZCzmeLM+7l1ZEHJ3vROGWvrGyBy7PRSZrdq6IOrjWgLxGBdVqwE0TJZxZdBJqcWQUQ
 meDwskGui7Ps35TN3FQ7xCb4wpiPW+eNAj3nzMem4zjTcepda+Yr5Q2FsNv/eu5YOlj/
 3B6J1EETsfJiBg0yV3b4//ba/6I7ZZgaA4RNu9Yl/8l2IsVuH58CWV56iu1ja6ZVB3ZO
 71FXXXapNGP4XfAs2aWr1vVDnuRNml7B0mV4X/OAnzCraw+GkZzPvcPmX5rAOxPEZwqD
 5ubVIWcKomBjaxEOoThnIyVg9w0d7Dj7t1+uNfdKKV+mFSrhzoknxXVSyftjsnlWDlNm
 9VhA==
X-Gm-Message-State: AO0yUKWO1RySoQVWWGK7cxzQiuxNa12jvVjit3FhEj05b6Hf75fHutqt
 5YSWx/zknOqWpomPqEO92v3WVEUiexov
X-Google-Smtp-Source: AK7set/W4P4gwQTQ14PucGRNx4H4xnyILVPXxlki8k+imj9Y/kafkRTfhg634nDIsQh4lilI/Yabl8NyXI7+
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:10c6:b0:97a:ebd:a594 with SMTP id
 w6-20020a05690210c600b0097a0ebda594mr390732ybu.3.1676799250687; Sun, 19 Feb
 2023 01:34:10 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:34 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-38-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 37/51] perf expr: More explicit NAN handling
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

Comparison and logical operations on NAN won't ensure the result is
NAN. Ensure NANs are propogated so that threshold expressions like
"tma_fetch_latency > 0.1 & tma_frontend_bound > 0.15" don't yield a
number when the components are NAN.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/expr.y | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/expr.y b/tools/perf/util/expr.y
index 635e562350c5..250e444bf032 100644
--- a/tools/perf/util/expr.y
+++ b/tools/perf/util/expr.y
@@ -127,7 +127,11 @@ static struct ids handle_id(struct expr_parse_ctx *ctx, char *id,
 	if (!compute_ids || (is_const(LHS.val) && is_const(RHS.val))) { \
 		assert(LHS.ids == NULL);				\
 		assert(RHS.ids == NULL);				\
-		RESULT.val = (long)LHS.val OP (long)RHS.val;		\
+		if (isnan(LHS.val) || isnan(RHS.val)) {			\
+			RESULT.val = NAN;				\
+		} else {						\
+			RESULT.val = (long)LHS.val OP (long)RHS.val;	\
+		}							\
 		RESULT.ids = NULL;					\
 	} else {							\
 	        RESULT = union_expr(LHS, RHS);				\
@@ -137,7 +141,11 @@ static struct ids handle_id(struct expr_parse_ctx *ctx, char *id,
 	if (!compute_ids || (is_const(LHS.val) && is_const(RHS.val))) { \
 		assert(LHS.ids == NULL);				\
 		assert(RHS.ids == NULL);				\
-		RESULT.val = LHS.val OP RHS.val;			\
+		if (isnan(LHS.val) || isnan(RHS.val)) {			\
+			RESULT.val = NAN;				\
+		} else {						\
+			RESULT.val = LHS.val OP RHS.val;		\
+		}							\
 		RESULT.ids = NULL;					\
 	} else {							\
 	        RESULT = union_expr(LHS, RHS);				\
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
