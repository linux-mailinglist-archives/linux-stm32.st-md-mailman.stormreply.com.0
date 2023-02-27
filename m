Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A56A532C
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Feb 2023 07:55:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B5C0C6A5F8;
	Tue, 28 Feb 2023 06:55:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DD88C6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 19:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677525164; x=1709061164;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V94xqAh8cPT2rlnyn1+jwV18O+aWYMzqBGsDGXUiGC8=;
 b=ENIKuQXc1edc9IwVeFlUEwme8FSLVl2jjvdolEecYNwMN4I1l2SMhWBO
 xeW2yUzmGIM5hnCEx8Djm7tlQ89ubNFs9RUJo+kC5tdVcsFuMySGCVzoL
 jReAa4WSRT2xlpDlFSr06lmUQIGYeTddwRm99HQY8S6WnKmOcV7a+Rsyd
 gOP8JkV1KUrup+4pwzaHA57eLvA4bHMp7fWbSboMjXrF5Tk3eRyTflpZD
 SCVmTTv2yCfkbJ5MjKT1Td2F5BE0jNQxTkHZEeVYnWMl6Cu9f/HUuI5Y1
 l4HtxgatrA3D5LA/MoHEiA421jvQ8cJ+YeLDiPXYdjP79cDm/fubLhKRW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396503991"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="396503991"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 11:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="667143353"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="667143353"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 27 Feb 2023 11:12:41 -0800
Received: from [10.212.193.244] (kliang2-mobl1.ccr.corp.intel.com
 [10.212.193.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E5F7E580689;
 Mon, 27 Feb 2023 11:12:37 -0800 (PST)
Message-ID: <09f0e75a-a11d-7db1-6308-f1b00462908c@linux.intel.com>
Date: Mon, 27 Feb 2023 14:12:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Zhengjun Xing <zhengjun.xing@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>, James Clark <james.clark@arm.com>,
 Kajol Jain <kjain@linux.ibm.com>, John Garry <john.g.garry@oracle.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Suzuki Poulouse <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>,
 Florian Fischer <florian.fischer@muhq.space>,
 Ravi Bangoria <ravi.bangoria@amd.com>,
 Jing Zhang <renyu.zj@linux.alibaba.com>,
 Sean Christopherson <seanjc@google.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Perry Taylor <perry.taylor@intel.com>,
 Caleb Biggers <caleb.biggers@intel.com>
References: <20230219092848.639226-1-irogers@google.com>
 <20230219092848.639226-40-irogers@google.com>
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20230219092848.639226-40-irogers@google.com>
X-Mailman-Approved-At: Tue, 28 Feb 2023 06:55:05 +0000
Cc: Stephane Eranian <eranian@google.com>
Subject: Re: [Linux-stm32] [PATCH v1 39/51] perf stat: Add TopdownL1 metric
 as a default if present
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



On 2023-02-19 4:28 a.m., Ian Rogers wrote:
> When there are no events and on Intel, the topdown events will be
> added by default if present. To display the metrics associated with
> these request special handling in stat-shadow.c. To more easily update
> these metrics use the json metric version via the TopdownL1
> group. This makes the handling less platform specific.
> 
> Modify the metricgroup__has_metric code to also cover metric groups.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/arch/x86/util/evlist.c  |  6 +++---
>  tools/perf/arch/x86/util/topdown.c | 30 ------------------------------
>  tools/perf/arch/x86/util/topdown.h |  1 -
>  tools/perf/builtin-stat.c          | 14 ++++++++++++++
>  tools/perf/util/metricgroup.c      |  6 ++----
>  5 files changed, 19 insertions(+), 38 deletions(-)
> 
> diff --git a/tools/perf/arch/x86/util/evlist.c b/tools/perf/arch/x86/util/evlist.c
> index cb59ce9b9638..8a7ae4162563 100644
> --- a/tools/perf/arch/x86/util/evlist.c
> +++ b/tools/perf/arch/x86/util/evlist.c
> @@ -59,10 +59,10 @@ int arch_evlist__add_default_attrs(struct evlist *evlist,
>  				   struct perf_event_attr *attrs,
>  				   size_t nr_attrs)
>  {
> -	if (nr_attrs)
> -		return ___evlist__add_default_attrs(evlist, attrs, nr_attrs);
> +	if (!nr_attrs)
> +		return 0;
>  
> -	return topdown_parse_events(evlist);
> +	return ___evlist__add_default_attrs(evlist, attrs, nr_attrs);
>  }
>  
>  struct evsel *arch_evlist__leader(struct list_head *list)
> diff --git a/tools/perf/arch/x86/util/topdown.c b/tools/perf/arch/x86/util/topdown.c
> index 54810f9acd6f..eb3a7d9652ab 100644
> --- a/tools/perf/arch/x86/util/topdown.c
> +++ b/tools/perf/arch/x86/util/topdown.c
> @@ -9,11 +9,6 @@
>  #include "topdown.h"
>  #include "evsel.h"
>  
> -#define TOPDOWN_L1_EVENTS       "{slots,topdown-retiring,topdown-bad-spec,topdown-fe-bound,topdown-be-bound}"
> -#define TOPDOWN_L1_EVENTS_CORE  "{slots,cpu_core/topdown-retiring/,cpu_core/topdown-bad-spec/,cpu_core/topdown-fe-bound/,cpu_core/topdown-be-bound/}"
> -#define TOPDOWN_L2_EVENTS       "{slots,topdown-retiring,topdown-bad-spec,topdown-fe-bound,topdown-be-bound,topdown-heavy-ops,topdown-br-mispredict,topdown-fetch-lat,topdown-mem-bound}"
> -#define TOPDOWN_L2_EVENTS_CORE  "{slots,cpu_core/topdown-retiring/,cpu_core/topdown-bad-spec/,cpu_core/topdown-fe-bound/,cpu_core/topdown-be-bound/,cpu_core/topdown-heavy-ops/,cpu_core/topdown-br-mispredict/,cpu_core/topdown-fetch-lat/,cpu_core/topdown-mem-bound/}"
> -
>  /* Check whether there is a PMU which supports the perf metrics. */
>  bool topdown_sys_has_perf_metrics(void)
>  {
> @@ -99,28 +94,3 @@ const char *arch_get_topdown_pmu_name(struct evlist *evlist, bool warn)
>  
>  	return pmu_name;
>  }
> -
> -int topdown_parse_events(struct evlist *evlist)
> -{
> -	const char *topdown_events;
> -	const char *pmu_name;
> -
> -	if (!topdown_sys_has_perf_metrics())
> -		return 0;
> -
> -	pmu_name = arch_get_topdown_pmu_name(evlist, false);
> -
> -	if (pmu_have_event(pmu_name, "topdown-heavy-ops")) {
> -		if (!strcmp(pmu_name, "cpu_core"))
> -			topdown_events = TOPDOWN_L2_EVENTS_CORE;
> -		else
> -			topdown_events = TOPDOWN_L2_EVENTS;
> -	} else {
> -		if (!strcmp(pmu_name, "cpu_core"))
> -			topdown_events = TOPDOWN_L1_EVENTS_CORE;
> -		else
> -			topdown_events = TOPDOWN_L1_EVENTS;
> -	}
> -
> -	return parse_event(evlist, topdown_events);
> -}
> diff --git a/tools/perf/arch/x86/util/topdown.h b/tools/perf/arch/x86/util/topdown.h
> index 7eb81f042838..46bf9273e572 100644
> --- a/tools/perf/arch/x86/util/topdown.h
> +++ b/tools/perf/arch/x86/util/topdown.h
> @@ -3,6 +3,5 @@
>  #define _TOPDOWN_H 1
>  
>  bool topdown_sys_has_perf_metrics(void);
> -int topdown_parse_events(struct evlist *evlist);
>  
>  #endif
> diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
> index 5e13171a7bba..796e98e453f6 100644
> --- a/tools/perf/builtin-stat.c
> +++ b/tools/perf/builtin-stat.c
> @@ -1996,6 +1996,7 @@ static int add_default_attributes(void)
>  		stat_config.topdown_level = TOPDOWN_MAX_LEVEL;
>  
>  	if (!evsel_list->core.nr_entries) {
> +		/* No events so add defaults. */
>  		if (target__has_cpu(&target))
>  			default_attrs0[0].config = PERF_COUNT_SW_CPU_CLOCK;
>  
> @@ -2011,6 +2012,19 @@ static int add_default_attributes(void)
>  		}
>  		if (evlist__add_default_attrs(evsel_list, default_attrs1) < 0)
>  			return -1;
> +		/*
> +		 * Add TopdownL1 metrics if they exist. To minimize
> +		 * multiplexing, don't request threshold computation.
> +		 */
> +		if (metricgroup__has_metric("TopdownL1") &&
> +		    metricgroup__parse_groups(evsel_list, "TopdownL1",
> +					    /*metric_no_group=*/false,
> +					    /*metric_no_merge=*/false,
> +					    /*metric_no_threshold=*/true,
> +					    stat_config.user_requested_cpu_list,
> +					    stat_config.system_wide,
> +					    &stat_config.metric_events) < 0)

Does the metricgroup__* function check the existances of the events on
the machine? If not, it may not be reliable to only check the event list.

The existing code supports both L1 and L2 Topdown for SPR. But this
patch seems remove the L2 Topdown support for SPR.

The TopdownL1/L2 metric is added only for the big core with perf stat
default. It's because that the perf_metrics is a dedicated register,
which should not impact other events (using GP counters.) But this patch
seems don't check the CPU type. It may brings extra multiplexing for the
perf stat default on an ATOM platform.

Thanks,
Kan

> +			return -1;
>  		/* Platform specific attrs */
>  		if (evlist__add_default_attrs(evsel_list, default_null_attrs) < 0)
>  			return -1;
> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
> index afb6f2fdc24e..64a35f2787dc 100644
> --- a/tools/perf/util/metricgroup.c
> +++ b/tools/perf/util/metricgroup.c
> @@ -1647,10 +1647,8 @@ static int metricgroup__has_metric_callback(const struct pmu_metric *pm,
>  {
>  	const char *metric = vdata;
>  
> -	if (!pm->metric_expr)
> -		return 0;
> -
> -	if (match_metric(pm->metric_name, metric))
> +	if (match_metric(pm->metric_name, metric) ||
> +	    match_metric(pm->metric_group, metric))
>  		return 1;
>  
>  	return 0;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
