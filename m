Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BB8FB549
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 16:31:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9135C71288;
	Tue,  4 Jun 2024 14:31:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C0FAC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 14:31:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59C9B1042;
 Tue,  4 Jun 2024 07:31:50 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBBB03F64C;
 Tue,  4 Jun 2024 07:31:22 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org, suzuki.poulose@arm.com,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
Date: Tue,  4 Jun 2024 15:30:10 +0100
Message-Id: <20240604143030.519906-2-james.clark@arm.com>
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
Subject: [Linux-stm32] [PATCH v2 01/16] perf cs-etm: Print error for new
	PERF_RECORD_AUX_OUTPUT_HW_ID versions
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

The likely fix for this is to update Perf so print a helpful message.

Signed-off-by: James Clark <james.clark@arm.com>
---
 tools/perf/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index d65d7485886c..32818bd7cd17 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -335,8 +335,11 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 	trace_chan_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
 
 	/* check that we can handle this version */
-	if (version > CS_AUX_HW_ID_CURR_VERSION)
+	if (version > CS_AUX_HW_ID_CURR_VERSION) {
+		pr_err("CS ETM Trace: PERF_RECORD_AUX_OUTPUT_HW_ID version %d not supported. Please update Perf.\n",
+		       version);
 		return -EINVAL;
+	}
 
 	/* get access to the etm metadata */
 	etm = container_of(session->auxtrace, struct cs_etm_auxtrace, auxtrace);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
