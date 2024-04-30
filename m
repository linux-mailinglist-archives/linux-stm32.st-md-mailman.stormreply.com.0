Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DC8BCD64
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 14:05:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ECE1C6DD9A;
	Mon,  6 May 2024 12:05:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FD28C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2024 06:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714459031; x=1745995031;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KGo6hIvlY2DFfXRayOwhLfEDabosAECVdBp2tiThtkc=;
 b=CtuVWGJUbyZ3ZqBN551rqPaqqiN/XjoV3L/wNWeyFOn/NDIKX6x8wJZ/
 GmNI0w6/Jgo51rQ/Nh7Z9hc9nZQUsS7nVKPqZNVKK4LcGoRaM0G+pROhI
 rgsbvhJ/8hvm37GCIeobycCu4q1BSaKmU12orrLNi97WngrmmAOhlfxVH
 4x7RKpHtuzrcTh9IFskp04uWZKuwVrnTp+W7e5p2k0sz8JMPq2aOTOItr
 rpazOqixIRpgtn1wt1O4iDNBGv2FnufU29WbGI4FgSGoUxynrBQyi3vx9
 He1hSPBeOsIOtsKH/eR8qy9P0BMQvvhqjPpZuP+IFt061Pj3/wMyA+n1q w==;
X-CSE-ConnectionGUID: gRHRGRqUSgSrAyrSBx+6AA==
X-CSE-MsgGUID: BzgWAWK1QcCReiMyyK4sIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10316018"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10316018"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 23:37:03 -0700
X-CSE-ConnectionGUID: kgMW4csVRV6x1K/Yr6uucg==
X-CSE-MsgGUID: 8JTDsJIoQByUwUenbUVmng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26973237"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15])
 ([10.252.49.27])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 23:36:53 -0700
Message-ID: <a9b176c7-60e8-4793-a056-4ad9219fbe32@intel.com>
Date: Tue, 30 Apr 2024 09:36:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 gankulkarni@os.amperecomputing.com, scclevenger@os.amperecomputing.com,
 coresight@lists.linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-3-james.clark@arm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240429152207.479221-3-james.clark@arm.com>
X-Mailman-Approved-At: Mon, 06 May 2024 12:05:30 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Leo Yan <leo.yan@linux.dev>,
 Ingo Molnar <mingo@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/17] perf auxtrace: Allow number of
 queues to be specified
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

On 29/04/24 18:21, James Clark wrote:
> Currently it's only possible to initialize with the default number of
> queues and then use auxtrace_queues__add_event() to grow the array. But
> that's problematic if you don't have a real event to pass into that
> function yet.
> 
> The queues hold a void *priv member to store custom state, and for
> Coresight we want to create decoders upfront before receiving data, so
> add a new function that allows pre-allocating queues. One reason to do
> this is because we might need to store metadata (HW_ID events) that
> effects other queues, but never actually receive auxtrace data on that
> queue.
> 
> Signed-off-by: James Clark <james.clark@arm.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  tools/perf/util/auxtrace.c | 9 +++++++--
>  tools/perf/util/auxtrace.h | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index 3684e6009b63..563b6c4fca31 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -218,15 +218,20 @@ static struct auxtrace_queue *auxtrace_alloc_queue_array(unsigned int nr_queues)
>  	return queue_array;
>  }
>  
> -int auxtrace_queues__init(struct auxtrace_queues *queues)
> +int auxtrace_queues__init_nr(struct auxtrace_queues *queues, int nr_queues)
>  {
> -	queues->nr_queues = AUXTRACE_INIT_NR_QUEUES;
> +	queues->nr_queues = nr_queues;
>  	queues->queue_array = auxtrace_alloc_queue_array(queues->nr_queues);
>  	if (!queues->queue_array)
>  		return -ENOMEM;
>  	return 0;
>  }
>  
> +int auxtrace_queues__init(struct auxtrace_queues *queues)
> +{
> +	return auxtrace_queues__init_nr(queues, AUXTRACE_INIT_NR_QUEUES);
> +}
> +
>  static int auxtrace_queues__grow(struct auxtrace_queues *queues,
>  				 unsigned int new_nr_queues)
>  {
> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> index 55702215a82d..8a6ec9565835 100644
> --- a/tools/perf/util/auxtrace.h
> +++ b/tools/perf/util/auxtrace.h
> @@ -521,6 +521,7 @@ int auxtrace_mmap__read_snapshot(struct mmap *map,
>  				 struct perf_tool *tool, process_auxtrace_t fn,
>  				 size_t snapshot_size);
>  
> +int auxtrace_queues__init_nr(struct auxtrace_queues *queues, int nr_queues);
>  int auxtrace_queues__init(struct auxtrace_queues *queues);
>  int auxtrace_queues__add_event(struct auxtrace_queues *queues,
>  			       struct perf_session *session,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
