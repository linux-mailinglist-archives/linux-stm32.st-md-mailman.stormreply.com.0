Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158369BF72
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:30:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FE82C65E58;
	Sun, 19 Feb 2023 09:30:19 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBD65C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:30:17 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 w3-20020a25ef43000000b008ee1c76c25dso2171003ybm.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZekM3DFhsGli0TNli/C0IYKvA9f7AyUZpwfMde3iUAk=;
 b=njwS0zdvPBr2f5Gwgx+MnFdMKJsacyJ3/qym2jLfPEHxAMivAGs+rlWWdk+Du+BWeG
 roLMmds7cxYanNraNuE8rI1XscoaMpSnYds3csTWiUZXGSDGsb+iX6X/mzHsk16/KvNg
 JIRRQggidvMZ9LijU87B8gNDY3B0npD5/KmjFMTlcvpZlx5GcIoFBSm4uQcG+OTZrVCB
 ryA5rcmtM4YDU3yMrGfDKb+E+nYgR15LIJmRsygIIdD202+A6TIyuwJoFUQHcUClbq2W
 k75D//NmRE3BNcT8UUVZbhzSfbsObFP7TGXybtoz712NdmByjrR0HfRP9//XsBj4ATZb
 B3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZekM3DFhsGli0TNli/C0IYKvA9f7AyUZpwfMde3iUAk=;
 b=TM6PDW7ax/urv1PO0QSGFcHlAjjNFBDCrUaV/nR9XTcSG9JYMKtLs6b8i6lmHBn5MP
 BIOFBWOd8nSbLXVdMRZA7GKYM7iF+a6Ecg4xHKAywIiqZCrIfG7/NDdIWJMpm2JNj/HV
 7ZreuHOfRhLyA8JknkJ+THdHk0vRWoQMR1fbgASqRTP3sLwlPB/rCqslipTHAcIIohG7
 VweFRhk3cIpQpQPiMxjJhwW5MZlQHnC4NWHSjO4Z4Qgela1wn7fABIyVeWfx+ckxNt6O
 l2iO2wNGY734ZBJd8Bn8OjR6pBpkhi2dJsXIdCIfbT9gJphpXhJu6KjWmgLgevJY5eDz
 eMQg==
X-Gm-Message-State: AO0yUKU/7+xC6COxXOI0CcOpZifDxcbXeJ4mjzBPwL68LwaKbstC9RXF
 peFks2UpahDxlrnRsfX1qld8yw99ys5U
X-Google-Smtp-Source: AK7set/0blmTCb8m5UP/yr2PteCnUmUmeiKnVL1fJQupnGlI6ozkeaWut2Dm6E94YEggDJE+VTHQSBLSDCod
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a81:8482:0:b0:533:a071:d7f8 with SMTP id
 u124-20020a818482000000b00533a071d7f8mr449175ywf.547.1676799016916; Sun, 19
 Feb 2023 01:30:16 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:06 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-10-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 09/51] perf pmu-events: Don't '\0'
	terminate enum values
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

Encoding enums like '1\0' wastes a byte and could be '1' (no '\0'
terminator) if the 0 case is '0', it also removes a branch for
decompressing.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index dc0c56dccb5e..e82dff3a1228 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -54,6 +54,8 @@ _json_metric_attributes = [
     'metric_name', 'metric_group', 'metric_expr', 'desc',
     'long_desc', 'unit', 'compat', 'aggr_mode', 'event_grouping'
 ]
+# Attributes that are bools or enum int values, encoded as '0', '1',...
+_json_enum_attributes = ['aggr_mode', 'deprecated', 'event_grouping', 'perpkg']
 
 def removesuffix(s: str, suffix: str) -> str:
   """Remove the suffix from a string
@@ -360,7 +362,10 @@ class JsonEvent:
         # Convert parsed metric expressions into a string. Slashes
         # must be doubled in the file.
         x = x.ToPerfJson().replace('\\', '\\\\')
-      s += f'{x}\\000' if x else '\\000'
+      if attr in _json_enum_attributes:
+        s += x if x else '0'
+      else:
+        s += f'{x}\\000' if x else '\\000'
     return s
 
   def to_c_string(self, metric: bool) -> str:
@@ -690,16 +695,18 @@ static void decompress_event(int offset, struct pmu_event *pe)
 {
 \tconst char *p = &big_c_string[offset];
 """)
-  enum_attributes = ['aggr_mode', 'deprecated', 'event_grouping', 'perpkg']
   for attr in _json_event_attributes:
     _args.output_file.write(f'\n\tpe->{attr} = ')
-    if attr in enum_attributes:
-      _args.output_file.write("(*p == '\\0' ? 0 : *p - '0');\n")
+    if attr in _json_enum_attributes:
+      _args.output_file.write("*p - '0';\n")
     else:
       _args.output_file.write("(*p == '\\0' ? NULL : p);\n")
     if attr == _json_event_attributes[-1]:
       continue
-    _args.output_file.write('\twhile (*p++);')
+    if attr in _json_enum_attributes:
+      _args.output_file.write('\tp++;')
+    else:
+      _args.output_file.write('\twhile (*p++);')
   _args.output_file.write("""}
 
 static void decompress_metric(int offset, struct pmu_metric *pm)
@@ -708,13 +715,16 @@ static void decompress_metric(int offset, struct pmu_metric *pm)
 """)
   for attr in _json_metric_attributes:
     _args.output_file.write(f'\n\tpm->{attr} = ')
-    if attr in enum_attributes:
-      _args.output_file.write("(*p == '\\0' ? 0 : *p - '0');\n")
+    if attr in _json_enum_attributes:
+      _args.output_file.write("*p - '0';\n")
     else:
       _args.output_file.write("(*p == '\\0' ? NULL : p);\n")
     if attr == _json_metric_attributes[-1]:
       continue
-    _args.output_file.write('\twhile (*p++);')
+    if attr in _json_enum_attributes:
+      _args.output_file.write('\tp++;')
+    else:
+      _args.output_file.write('\twhile (*p++);')
   _args.output_file.write("""}
 
 int pmu_events_table_for_each_event(const struct pmu_events_table *table,
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
