Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9669BF71
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:30:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CDA5C65E58;
	Sun, 19 Feb 2023 09:30:11 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D5CAC640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:30:09 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 i11-20020a256d0b000000b0086349255277so226738ybc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fuS1q84R0xcAiENu72F9xaB/dldCNXgOZrtbWFpv52E=;
 b=cI8dh0bWWKZeW1y5k5GPM8AzvnkbIA5dJQUUoDzOXJvWxVyShYBYx60369eQUy4OzL
 E6SVtCAQM+IaKz1bV0Rn3Uuqp+jyypxxArizXArFcTzgMndVSzmzut43pU+fIivj5gSC
 XKTj5fMpGYRtuDMkea81itweVHTeFMS37/+yA2iSPh75iDbyZ+kgaX2m5UodziZr1WHu
 sKBH5KHPK9zik8QbzJ6V3vRrwymvXNniazfNki04nQD+n1XXTKZW1LPzmzv18NmS4/2T
 4FkiuO6YzbUl/HqF+S/0btFco6XOhO2Bs0WDcFHWpQ5VE+9asDN4xuYeYZaRTGDc6yIO
 VGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fuS1q84R0xcAiENu72F9xaB/dldCNXgOZrtbWFpv52E=;
 b=SWiGk3AnhDAl3Kkm4bs9dXtiqvu6cFIkbCEZ+yV3mzvA3Lj09OTUwOK5piqNZBmzSG
 WAPTpcLJBv0iKTTxME3miaj1RK0WTZq5kmcpRgVj0S0KUD59hyv32J/hQNfAupc631f+
 ME21MaMGFqftaUqBv+zZFQQBSFOV60S+qJZG5lfZrK5ulwXPw+OdxTYi/XdnfCrUOquZ
 8MGna4AKJW83X0nOBCMnDu1pQlk/Kl/DMWx5OJDxEYmXun81XhaG8htsz1Ta7Thg3LxJ
 L+hq9mxDrFexeJ3MKX7S+i4E4yRwwbtLFX/EMkvl0WTD7CNS4kgfQaObhs9hhy7nLb52
 E/hQ==
X-Gm-Message-State: AO0yUKUhgszegFzLIoJU3KOdGtIeK+pUVAHJ3ojuvG208jt2YN3WvYlk
 OEeAuRWiRiOPhtqDBUy6m0pTEhIy+kVn
X-Google-Smtp-Source: AK7set93SE5NbWPGLqx8+0V5OQ1Zd7PwyZiB6jBWIqTaGMZiQIyzx9cn7NuqKPF1uean13HLVminRfyvDmVj
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a0d:dc85:0:b0:530:a183:aa0 with SMTP id
 f127-20020a0ddc85000000b00530a1830aa0mr1619527ywe.384.1676799008532; Sun, 19
 Feb 2023 01:30:08 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:05 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-9-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 08/51] perf pmu-events: Make the
	metric_constraint an enum
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

Rename metric_constraint to event_grouping to better explain what the
variable is used for. Switch to use an enum for encoding instead of a
string. Rather than just no constraint/grouping information or
"NO_NMI_WATCHDOG", have 4 enum values. The values encode whether to
group or not, and two cases where the behavior is dependent on either
the NMI watchdog being enabled or SMT being enabled.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py   | 20 ++++++++++++++++----
 tools/perf/pmu-events/pmu-events.h | 25 ++++++++++++++++++++++++-
 tools/perf/util/metricgroup.c      | 19 ++++++++++++-------
 3 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 2da55408398f..dc0c56dccb5e 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -51,8 +51,8 @@ _json_event_attributes = [
 
 # Attributes that are in pmu_metric rather than pmu_event.
 _json_metric_attributes = [
-    'metric_name', 'metric_group', 'metric_constraint', 'metric_expr', 'desc',
-    'long_desc', 'unit', 'compat', 'aggr_mode'
+    'metric_name', 'metric_group', 'metric_expr', 'desc',
+    'long_desc', 'unit', 'compat', 'aggr_mode', 'event_grouping'
 ]
 
 def removesuffix(s: str, suffix: str) -> str:
@@ -204,6 +204,18 @@ class JsonEvent:
       }
       return aggr_mode_to_enum[aggr_mode]
 
+    def convert_metric_constraint(metric_constraint: str) -> Optional[str]:
+      """Returns the metric_event_groups enum value associated with the JSON string."""
+      if not metric_constraint:
+        return None
+      metric_constraint_to_enum = {
+          'NO_GROUP_EVENTS': '1',
+          'NO_GROUP_EVENTS_NMI': '2',
+          'NO_NMI_WATCHDOG': '2',
+          'NO_GROUP_EVENTS_SMT': '3',
+      }
+      return metric_constraint_to_enum[metric_constraint]
+
     def lookup_msr(num: str) -> Optional[str]:
       """Converts the msr number, or first in a list to the appropriate event field."""
       if not num:
@@ -288,7 +300,7 @@ class JsonEvent:
     self.deprecated = jd.get('Deprecated')
     self.metric_name = jd.get('MetricName')
     self.metric_group = jd.get('MetricGroup')
-    self.metric_constraint = jd.get('MetricConstraint')
+    self.event_grouping = convert_metric_constraint(jd.get('MetricConstraint'))
     self.metric_expr = None
     if 'MetricExpr' in jd:
       self.metric_expr = metric.ParsePerfJson(jd['MetricExpr']).Simplify()
@@ -678,7 +690,7 @@ static void decompress_event(int offset, struct pmu_event *pe)
 {
 \tconst char *p = &big_c_string[offset];
 """)
-  enum_attributes = ['aggr_mode', 'deprecated', 'perpkg']
+  enum_attributes = ['aggr_mode', 'deprecated', 'event_grouping', 'perpkg']
   for attr in _json_event_attributes:
     _args.output_file.write(f'\n\tpe->{attr} = ')
     if attr in enum_attributes:
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index 4d236bb32fd3..57a38e3e5c32 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -11,6 +11,29 @@ enum aggr_mode_class {
 	PerCore
 };
 
+/**
+ * enum metric_event_groups - How events within a pmu_metric should be grouped.
+ */
+enum metric_event_groups {
+	/**
+	 * @MetricGroupEvents: Default, group events within the metric.
+	 */
+	MetricGroupEvents = 0,
+	/**
+	 * @MetricNoGroupEvents: Don't group events for the metric.
+	 */
+	MetricNoGroupEvents = 1,
+	/**
+	 * @MetricNoGroupEventsNmi: Don't group events for the metric if the NMI
+	 *                          watchdog is enabled.
+	 */
+	MetricNoGroupEventsNmi = 2,
+	/**
+	 * @MetricNoGroupEventsSmt: Don't group events for the metric if SMT is
+	 *                          enabled.
+	 */
+	MetricNoGroupEventsSmt = 3,
+};
 /*
  * Describe each PMU event. Each CPU has a table of PMU events.
  */
@@ -33,10 +56,10 @@ struct pmu_metric {
 	const char *metric_expr;
 	const char *unit;
 	const char *compat;
-	const char *metric_constraint;
 	const char *desc;
 	const char *long_desc;
 	enum aggr_mode_class aggr_mode;
+	enum metric_event_groups event_grouping;
 };
 
 struct pmu_events_table;
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index b2aa6e049804..868fc9c35606 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -13,6 +13,7 @@
 #include "pmu.h"
 #include "pmu-hybrid.h"
 #include "print-events.h"
+#include "smt.h"
 #include "expr.h"
 #include "rblist.h"
 #include <string.h>
@@ -168,16 +169,20 @@ static void metric__watchdog_constraint_hint(const char *name, bool foot)
 
 static bool metric__group_events(const struct pmu_metric *pm)
 {
-	if (!pm->metric_constraint)
-		return true;
-
-	if (!strcmp(pm->metric_constraint, "NO_NMI_WATCHDOG") &&
-	    sysctl__nmi_watchdog_enabled()) {
+	switch (pm->event_grouping) {
+	case MetricNoGroupEvents:
+		return false;
+	case MetricNoGroupEventsNmi:
+		if (!sysctl__nmi_watchdog_enabled())
+			return true;
 		metric__watchdog_constraint_hint(pm->metric_name, /*foot=*/false);
 		return false;
+	case MetricNoGroupEventsSmt:
+		return !smt_on();
+	case MetricGroupEvents:
+	default:
+		return true;
 	}
-
-	return true;
 }
 
 static void metric__free(struct metric *m)
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
