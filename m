Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6569BF97
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 10:33:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C16CC6A5FE;
	Sun, 19 Feb 2023 09:33:47 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3860CC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 09:33:46 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 n68-20020a25da47000000b008e1de4c1e7dso80365ybf.17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 01:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1iaZVlYNhiAOA5cs/+UwDX1JeW2DyTfNmupgRycGXY=;
 b=GXX1CCWTT7DpChHpiAo8vxK/43ddF9gck9mQoSZ2hA08LIJ0U1Cu7/SFYa9EJvJFxe
 m8KaqG9d0IPv1H+awLg+uCW+JyHffDXi8RxqbbHwMymD1tyKhcsbVu23oOmaI7vI3Ggo
 A8m02HvwUYluQ/hwtU5heVipo9Wh/I0ByZJ263Ywidlya5sIiWqmTKfXXSjdJB+GukoV
 TUk+iK3GL6mVBoiR/DsqTD45H27yUEHyxZf4toav9JGdIbqj/1fHLuj6CnEuBf5HvRQU
 AhDI6PM1KMSvWtTcjBjzp7iRHFEfMo2PY+iby22NhQ0i2XGrdBrVZdFwwu7jGnEkvvA1
 P5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1iaZVlYNhiAOA5cs/+UwDX1JeW2DyTfNmupgRycGXY=;
 b=SvvKdVkPrF5e9svxc54Ba4drnqo0g1e89ltRq6GtYc3/8QT3YCniJuiGmvqOSKIOWF
 qNLlRpH54NutrLs6ml0Ln60eA/DGjo/Z9N2uAn6Zx/Lji7+Y9AaEnGjhok7hN338qKmB
 6KQv/RzQAp+HatLWjBTuec0/NB8O6B9BbibF4XT5sqAnwbl7UHvhVBiwatCx1EpvxRpa
 +m2ZigX2Qg0d8fWXoc9vj7iMrqMnrCJx7B2E57jcxE6EEYtbLJP9l/kVHJ2p6YftTBVv
 TES5GNz04cA8AHDzxy7vjynwNG1/d0GR9QFxtbKUUAN9Y2YVgFhd5mqLLVD2U35VWkD8
 M4ug==
X-Gm-Message-State: AO0yUKWcbZeBeRK9dW2JvaW1cDKBBMYzK4co/yS5w9lQc1QoqHCGYvis
 GN0BPvcNyvy/P5AqCDuAhtue0A2xui9z
X-Google-Smtp-Source: AK7set+1MTqVPBeVJ1iYyp/8DZ7MkvnpE8pT6AIUM7vIfURx7AFVUwdj5cGYtnDmeFMNAIrj/Jd0CiKRDfkv
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2d4:203:cde9:3fbc:e1f1:6e3b])
 (user=irogers job=sendgmr) by 2002:a0d:ee44:0:b0:52e:e6ed:30a1 with SMTP id
 x65-20020a0dee44000000b0052ee6ed30a1mr1338109ywe.545.1676799225232; Sun, 19
 Feb 2023 01:33:45 -0800 (PST)
Date: Sun, 19 Feb 2023 01:28:31 -0800
In-Reply-To: <20230219092848.639226-1-irogers@google.com>
Message-Id: <20230219092848.639226-35-irogers@google.com>
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
Subject: [Linux-stm32] [PATCH v1 34/51] perf pmu-events: Test parsing metric
 thresholds with the fake PMU
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

Test the correctness of metric thresholds by testing them all with the
fake PMU logic.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/pmu-events.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index 521557c396bc..db2fed0c6993 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -1021,12 +1021,34 @@ static int test__parsing_fake(struct test_suite *test __maybe_unused,
 	return pmu_for_each_sys_metric(test__parsing_fake_callback, NULL);
 }
 
+static int test__parsing_threshold_callback(const struct pmu_metric *pm,
+					const struct pmu_metrics_table *table __maybe_unused,
+					void *data __maybe_unused)
+{
+	if (!pm->metric_threshold)
+		return 0;
+	return metric_parse_fake(pm->metric_name, pm->metric_threshold);
+}
+
+static int test__parsing_threshold(struct test_suite *test __maybe_unused,
+			      int subtest __maybe_unused)
+{
+	int err = 0;
+
+	err = pmu_for_each_core_metric(test__parsing_threshold_callback, NULL);
+	if (err)
+		return err;
+
+	return pmu_for_each_sys_metric(test__parsing_threshold_callback, NULL);
+}
+
 static struct test_case pmu_events_tests[] = {
 	TEST_CASE("PMU event table sanity", pmu_event_table),
 	TEST_CASE("PMU event map aliases", aliases),
 	TEST_CASE_REASON("Parsing of PMU event table metrics", parsing,
 			 "some metrics failed"),
 	TEST_CASE("Parsing of PMU event table metrics with fake PMUs", parsing_fake),
+	TEST_CASE("Parsing of metric thresholds with fake PMUs", parsing_threshold),
 	{ .name = NULL, }
 };
 
-- 
2.39.2.637.g21b0678d19-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
