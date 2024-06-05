Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA68FC305
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 07:27:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7E45C6B47A;
	Wed,  5 Jun 2024 05:27:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98B15C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717565228; x=1749101228;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3RRuyKGLNOBy7i2i4R4B/Xpa4YznPKGDdEc8i6l7yhA=;
 b=LQHJF0kCuFk6t+Knu/YYUKvGOzyVpNFRIeYsjhoinWKZ9FnU2Hz52LZj
 drK1t2M02M+PobSOAqbqwS9VebhAS/ZddNxqTLZzzClh0P6/LSf/pydqx
 ym8P5VW1wwM2f646Q5OWlj4I2KHPYvHIk7/FSj2KxQhK2bzXXNgSmbrfk
 dU97B4tSrUSqMJ7wkg349UUEr7kia81+ukqS+hgRduIY+KkltJn40v3xR
 vSnaHbuaNl0beI9zkcpn0p9dyC0LoO1Fm764/sKe252Q7fUSk3ex3gwJY
 6Ny5H/4zUzUxtB2GcaX3c0BRsuD46KNUynqfBOe5EoHSKXqFdilL/09jW A==;
X-CSE-ConnectionGUID: hIfh0TsRTCe/cUoVTIJxKw==
X-CSE-MsgGUID: w+XdeISKSSChISpgV01ygA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13956052"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="13956052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 22:27:00 -0700
X-CSE-ConnectionGUID: sk5OLcxuTBWzciShxNLuCw==
X-CSE-MsgGUID: JsmSPp6SSL6tLYR07zqctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="38038066"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15])
 ([10.94.249.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 22:26:53 -0700
Message-ID: <12c09d40-788d-4af1-9eb6-0f5699875d70@intel.com>
Date: Wed, 5 Jun 2024 08:26:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, gankulkarni@os.amperecomputing.com,
 mike.leach@linaro.org, leo.yan@linux.dev, anshuman.khandual@arm.com
References: <20240604143030.519906-1-james.clark@arm.com>
 <20240604143030.519906-3-james.clark@arm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240604143030.519906-3-james.clark@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/16] perf auxtrace: Allow number of
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

On 4/06/24 17:30, James Clark wrote:
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

Again ;-)

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
