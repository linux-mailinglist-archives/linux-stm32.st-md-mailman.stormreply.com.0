Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EFD8BE02B
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 12:52:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0178C5E2D1;
	Tue,  7 May 2024 10:52:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07A89CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 10:52:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F461063;
 Tue,  7 May 2024 03:53:04 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD45C3F587;
 Tue,  7 May 2024 03:52:35 -0700 (PDT)
Message-ID: <3923dc07-c037-452a-9e77-d407703876cd@arm.com>
Date: Tue, 7 May 2024 11:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 gankulkarni@os.amperecomputing.com, scclevenger@os.amperecomputing.com,
 coresight@lists.linaro.org, mike.leach@linaro.org
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-16-james.clark@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240429152207.479221-16-james.clark@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Leo Yan <leo.yan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 14/17] coresight: Use per-sink trace ID
 maps for Perf sessions
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
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c     | 10 ++++++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 15 ++++++++-------
>   include/linux/coresight.h                        |  1 +
>   3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 9fc6f6b863e0..d1adff467670 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -902,6 +902,7 @@ static void coresight_device_release(struct device *dev)
>   	struct coresight_device *csdev = to_coresight_device(dev);
>   
>   	fwnode_handle_put(csdev->dev.fwnode);
> +	free_percpu(csdev->perf_id_map.cpu_map);
>   	kfree(csdev);
>   }
>   
> @@ -1159,6 +1160,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
>   	dev_set_name(&csdev->dev, "%s", desc->name);
>   
> +	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> +	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> +		csdev->perf_id_map.cpu_map = alloc_percpu(atomic_t);
> +		if (!csdev->perf_id_map.cpu_map) {
> +			ret = -ENOMEM;
> +			goto err_out;
> +		}
> +	}
>   	/*
>   	 * Make sure the device registration and the connection fixup
>   	 * are synchronised, so that we don't see uninitialised devices
> @@ -1216,6 +1225,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   err_out:
>   	/* Cleanup the connection information */
>   	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
> +	kfree(csdev);
>   	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL_GPL(coresight_register);
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 177cecae38d9..86ca1a9d09a7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -229,10 +229,13 @@ static void free_event_data(struct work_struct *work)
>   		struct list_head **ppath;
>   
>   		ppath = etm_event_cpu_path_ptr(event_data, cpu);
> -		if (!(IS_ERR_OR_NULL(*ppath)))
> +		if (!(IS_ERR_OR_NULL(*ppath))) {
> +			struct coresight_device *sink = coresight_get_sink(*ppath);
> +
> +			coresight_trace_id_put_cpu_id(cpu, &sink->perf_id_map);
>   			coresight_release_path(*ppath);
> +		}
>   		*ppath = NULL;
> -		coresight_trace_id_put_cpu_id(cpu, coresight_trace_id_map_default());
>   	}
>   
>   	/* mark perf event as done for trace id allocator */
> @@ -401,8 +404,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   		}
>   
>   		/* ensure we can allocate a trace ID for this CPU */
> -		trace_id = coresight_trace_id_get_cpu_id(cpu,
> -							 coresight_trace_id_map_default());
> +		trace_id = coresight_trace_id_get_cpu_id(cpu, &sink->perf_id_map);

We could either store the perf_id_map or the traceid itself in the 
event_data isn't it ? Rather than passing the idmap to enable_source ?

Suzuki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
