Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964695B7F4
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 16:06:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E879EC71287;
	Thu, 22 Aug 2024 14:06:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3008C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 14:06:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EC40DA7;
 Thu, 22 Aug 2024 07:06:51 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 403FE3F66E;
 Thu, 22 Aug 2024 07:06:22 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: anshuman.khandual@arm.com, James Clark <james.clark@linaro.org>,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, coresight@lists.linaro.org
Date: Thu, 22 Aug 2024 15:05:53 +0100
Message-Id: <172433479466.350842.6920589600831615538.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722101202.26915-1-james.clark@linaro.org>
References: <20240722101202.26915-1-james.clark@linaro.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, "Liang, Kan" <kan.liang@linux.intel.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v6 00/17] coresight: Use per-sink
	trace ID maps for Perf sessions
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

On Mon, 22 Jul 2024 11:11:42 +0100, James Clark wrote:
> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
> as long as there are fewer than that many ETMs connected to each sink.
> 
> Each sink owns its own trace ID map, and any Perf session connecting to
> that sink will allocate from it, even if the sink is currently in use by
> other users. This is similar to the existing behavior where the dynamic
> trace IDs are constant as long as there is any concurrent Perf session
> active. It's not completely optimal because slightly more IDs will be
> used than necessary, but the optimal solution involves tracking the PIDs
> of each session and allocating ID maps based on the session owner. This
> is difficult to do with the combination of per-thread and per-cpu modes
> and some scheduling issues. The complexity of this isn't likely to worth
> it because even with multiple users they'd just see a difference in the
> ordering of ID allocations rather than hitting any limits (unless the
> hardware does have too many ETMs connected to one sink).
> 
> [...]

Applied, the kernel driver changes to coresight/next. Thanks!

[09/17] coresight: Remove unused ETM Perf stubs
        https://git.kernel.org/coresight/c/34172002bdac
[10/17] coresight: Clarify comments around the PID of the sink owner
        https://git.kernel.org/coresight/c/eda1d11979c0
[11/17] coresight: Move struct coresight_trace_id_map to common header
        https://git.kernel.org/coresight/c/acb0184fe9bc
[12/17] coresight: Expose map arguments in trace ID API
        https://git.kernel.org/coresight/c/7e52877868ae
[13/17] coresight: Make CPU id map a property of a trace ID map
        https://git.kernel.org/coresight/c/d53c8253c782
[14/17] coresight: Use per-sink trace ID maps for Perf sessions
        https://git.kernel.org/coresight/c/5ad628a76176
[15/17] coresight: Remove pending trace ID release mechanism
        https://git.kernel.org/coresight/c/de0029fdde86
[16/17] coresight: Emit sink ID in the HW_ID packets
        https://git.kernel.org/coresight/c/487eec8da80a
[17/17] coresight: Make trace ID map spinlock local to the map
        https://git.kernel.org/coresight/c/988d40a4d4e7

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
