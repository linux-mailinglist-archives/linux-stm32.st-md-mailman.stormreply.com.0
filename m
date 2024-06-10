Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F3B901F64
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 12:29:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BF6EC6C838;
	Mon, 10 Jun 2024 10:29:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 190CAC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 10:29:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F491692;
 Mon, 10 Jun 2024 03:29:57 -0700 (PDT)
Received: from [10.57.71.145] (unknown [10.57.71.145])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 458C43F73B;
 Mon, 10 Jun 2024 03:29:30 -0700 (PDT)
Message-ID: <a697111a-ec64-451a-aee1-3709bd08e73e@arm.com>
Date: Mon, 10 Jun 2024 11:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 gankulkarni@os.amperecomputing.com, mike.leach@linaro.org,
 leo.yan@linux.dev, anshuman.khandual@arm.com
References: <20240604143030.519906-1-james.clark@arm.com>
 <20240604143030.519906-16-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240604143030.519906-16-james.clark@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 15/16] coresight: Re-emit trace IDs
 when the sink changes in per-thread mode
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

On 04/06/2024 15:30, James Clark wrote:
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
> index 17cafa1a7f18..b6f505b50e67 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -499,6 +499,20 @@ static void etm_event_start(struct perf_event *event, int flags)
>   				      &sink->perf_sink_id_map))
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

I am wondering if we really need this patch, as we have the sinkid in 
the HWID already ? We would emit the packet for each CPU only once and
that wouldn't change the HWID ?

Suzuki


> +
>   	/*
>   	 * output cpu / trace ID in perf record, once for the lifetime
>   	 * of the event.
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 744531158d6b..bd4553b2a1ec 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -52,6 +52,7 @@ struct etm_filters {
>    * @snk_config:		The sink configuration.
>    * @cfg_hash:		The hash id of any coresight config selected.
>    * @path:		An array of path, each slot for one CPU.
> + * @last_sink_hwid:	Last sink that a hwid was emitted for.
>    */
>   struct etm_event_data {
>   	struct work_struct work;
> @@ -60,6 +61,7 @@ struct etm_event_data {
>   	void *snk_config;
>   	u32 cfg_hash;
>   	struct list_head * __percpu *path;
> +	struct coresight_device *last_sink_hwid;
>   };
>   
>   int etm_perf_symlink(struct coresight_device *csdev, bool link);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
