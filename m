Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E5B69BF91
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:33:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E639C6A5FE;
	Sun, 19 Feb 2023 09:33:30 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9411C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:33:28 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-53687f6de13so18447287b3.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aDHxoNK+iGgerGSxgoF4xDhtMfF1M1KB0gmMhIH6g+o=;
 b=szVoKRw23j5Oh2tOkbAIG0IvtMpMsOrvW9A3e7kcO9it79BlwWVgNPV/uB9d0sO7u/
 I5P/KixArxBv49X8CI3tQxLa1twzSrl7TRDwEq1x2y6kljyqBkBCYoIMwLoi+xqN41ew
 1YfVyzeiNzV35kAtc0w1HbeMjjubJLR48JfNp8ElXZGSO/WXsj10RUfCtCXN1HnCxZyR
 j2zQAAH13HqlMas9+N26ILACb+ttaBbF6Jt9XRfpsIyNeIBd6pDcvMVo8sZ+Ar6TSVKI
 HOY1Q4URcucKu7ff34heQu958Cgzod/PuzJPQJrHwtSrEsUCVeat8sQUeniU8nlRMHHv
 3Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aDHxoNK+iGgerGSxgoF4xDhtMfF1M1KB0gmMhIH6g+o=;
 b=aVGhXyAPLuX65dkMM8qH2y0GoQ6D3o8TbcUa7LdSRk59AWKA8tMuqb4b9+32QCCPeJ
 k2QxeZFLGsm0tPEfLnCbzRMWqdtfjr8rLD7vHpwuoXdtbnaRTVKmdu27Q86iP6x0NCzr
 8LD8UGUAqtvmdWRvOfyl0z/NY0snuJjTKnaUKLgfl/BtbUYETW7ZfebPdwrxHskas6FK
 GXgeL61dN4OGYYJ2REJfucFnBhsSrO2oFtJxqGIxV74i9qHBS7IjuyecwaFPGkhAufXT
 4mQHlcyUfwUTS5JKqRnirJqmDHpKZhvQXHh3fdkQ5UP7ePMEeDmy3C0npjGpr9n5+ejj
 Wmgg==
X-Gm-Message-State: AO0yUKWj4uvVvSzVTXRM7w/nVupHpPB2pljFUkhrmePgZl7Xsi+M83G+
 AkUhbWjW7Gf9e8RT1/krzwW2+sTvgdVe
X-Google-Smtp-Source: AK7set+3n8bzTs6jlEite8UPyzDtlGWXVaLGOAeCv19aTjMK1elNMeI7zwFyr8LOnDdLf7qku0lKAJCZ5SfJ
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a05:6902:287:b0:8da:cda:7a50 with SMTP id
 v7-20020a056902028700b008da0cda7a50mr9710ybh.11.1676799207878; Sun, 19 Feb
 2023 01:33:27 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:29 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-33-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 32/51] perf jevents: Add rand support to
	metrics
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

rand (reverse and) is useful in the parsing of metric
thresholds. Update the documentation on operator precedence to clarify
the simple expression parser and python differences wrt binary/logical
operators.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/metric.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/metric.py b/tools/perf/pmu-events/metric.py
index 77ea6ff98538..8ec0ba884673 100644
--- a/tools/perf/pmu-events/metric.py
+++ b/tools/perf/pmu-events/metric.py
@@ -44,6 +44,9 @@ class Expression:
   def __and__(self, other: Union[int, float, 'Expression']) -> 'Operator':
     return Operator('&', self, other)
 
+  def __rand__(self, other: Union[int, float, 'Expression']) -> 'Operator':
+    return Operator('&', other, self)
+
   def __lt__(self, other: Union[int, float, 'Expression']) -> 'Operator':
     return Operator('<', self, other)
 
@@ -88,7 +91,10 @@ def _Constify(val: Union[bool, int, float, Expression]) -> Expression:
 
 
 # Simple lookup for operator precedence, used to avoid unnecessary
-# brackets. Precedence matches that of python and the simple expression parser.
+# brackets. Precedence matches that of the simple expression parser
+# but differs from python where comparisons are lower precedence than
+# the bitwise &, ^, | but not the logical versions that the expression
+# parser doesn't have.
 _PRECEDENCE = {
     '|': 0,
     '^': 1,
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
