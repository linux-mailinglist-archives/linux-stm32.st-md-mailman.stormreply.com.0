Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90F8BE0A1
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 13:05:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2DD5C5E2D1;
	Tue,  7 May 2024 11:05:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9587CCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 11:05:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9D1D1063;
 Tue,  7 May 2024 04:06:14 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41DA83F587;
 Tue,  7 May 2024 04:05:46 -0700 (PDT)
Message-ID: <0d433917-f638-4ca6-ba6a-1d5e85895024@arm.com>
Date: Tue, 7 May 2024 12:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 gankulkarni@os.amperecomputing.com, scclevenger@os.amperecomputing.com,
 coresight@lists.linaro.org, mike.leach@linaro.org
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-18-james.clark@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240429152207.479221-18-james.clark@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Leo Yan <leo.yan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 16/17] coresight: Re-emit trace IDs when
 the sink changes in per-thread mode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 29/04/2024 16:22, James Clark wrote:
> In per-cpu mode there are multiple aux buffers and each one has a
> fixed sink, so the hw ID mappings which only need to be emitted once
> for each buffer, even with the new per-sink trace ID pools.
> 
> But in per-thread mode there is only a single buffer which can be
> written to from any sink with now potentially overlapping trace IDs, so
> hw ID mappings need to be re-emitted every time the sink changes.
> 
> This will require a change in Perf to track this so it knows which
> decode tree to use for each segment of the buffer. In theory it's also
> possible to look at the CPU ID on the AUX records, but this is more
> consistent with the existing system, and allows for correct decode using
> either mechanism.
> 
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 14 ++++++++++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.h |  2 ++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f07173aa4d66..08f3958f9367 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -499,6 +499,20 @@ static void etm_event_start(struct perf_event *event, int flags)
>   				      &sink->perf_id_map))
>   		goto fail_disable_path;
>   
> +	/*
> +	 * In per-cpu mode there are multiple aux buffers and each one has a
> +	 * fixed sink, so the hw ID mappings which only need to be emitted once
> +	 * for each buffer.
> +	 *
> +	 * But in per-thread mode there is only a single buffer which can be
> +	 * written to from any sink with potentially overlapping trace IDs, so
> +	 * hw ID mappings need to be re-emitted every time the sink changes.
> +	 */
> +	if (event->cpu == -1 && event_data->last_sink_hwid != sink) {
> +		cpumask_clear(&event_data->aux_hwid_done);
> +		event_data->last_sink_hwid = sink;
> +	}
> +

With the traceid caching in the event_data per-cpu , we could avoid this 
step ?

Suzuki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
