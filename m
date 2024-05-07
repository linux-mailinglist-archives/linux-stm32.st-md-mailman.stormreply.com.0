Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC888BDAC8
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 07:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA233C5E2D1;
	Tue,  7 May 2024 05:50:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D725CC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 05:50:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32A7F1042;
 Mon,  6 May 2024 22:50:56 -0700 (PDT)
Received: from [10.163.37.41] (unknown [10.163.37.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06D393F587;
 Mon,  6 May 2024 22:50:21 -0700 (PDT)
Message-ID: <f6bcac4a-ba21-48dc-94f5-e1f1e1ac37a4@arm.com>
Date: Tue, 7 May 2024 11:20:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 gankulkarni@os.amperecomputing.com, scclevenger@os.amperecomputing.com,
 coresight@lists.linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-11-james.clark@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240429152207.479221-11-james.clark@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Leo Yan <leo.yan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/17] coresight: Move struct
 coresight_trace_id_map to common header
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



On 4/29/24 20:51, James Clark wrote:
> The trace ID maps will need to be created and stored by the core and
> Perf code so move the definition up to the common header.
> 
> Signed-off-by: James Clark <james.clark@arm.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  .../hwtracing/coresight/coresight-trace-id.c  |  1 +
>  .../hwtracing/coresight/coresight-trace-id.h  | 19 -------------------
>  include/linux/coresight.h                     | 18 ++++++++++++++++++
>  3 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index af5b4ef59cea..19005b5b4dc4 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022, Linaro Limited, All rights reserved.
>   * Author: Mike Leach <mike.leach@linaro.org>
>   */
> +#include <linux/coresight.h>
>  #include <linux/coresight-pmu.h>
>  #include <linux/cpumask.h>
>  #include <linux/kernel.h>
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
> index 3797777d367e..49438a96fcc6 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -32,10 +32,6 @@
>  #include <linux/bitops.h>
>  #include <linux/types.h>
>  
> -
> -/* architecturally we have 128 IDs some of which are reserved */
> -#define CORESIGHT_TRACE_IDS_MAX 128
> -
>  /* ID 0 is reserved */
>  #define CORESIGHT_TRACE_ID_RES_0 0
>  
> @@ -46,21 +42,6 @@
>  #define IS_VALID_CS_TRACE_ID(id)	\
>  	((id > CORESIGHT_TRACE_ID_RES_0) && (id < CORESIGHT_TRACE_ID_RES_TOP))
>  
> -/**
> - * Trace ID map.
> - *
> - * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
> - *		Initialised so that the reserved IDs are permanently marked as
> - *		in use.
> - * @pend_rel_ids: CPU IDs that have been released by the trace source but not
> - *		  yet marked as available, to allow re-allocation to the same
> - *		  CPU during a perf session.
> - */
> -struct coresight_trace_id_map {
> -	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
> -	DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
> -};
> -
>  /* Allocate and release IDs for a single default trace ID map */
>  
>  /**
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index f09ace92176e..c16c61a8411d 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -218,6 +218,24 @@ struct coresight_sysfs_link {
>  	const char *target_name;
>  };
>  
> +/* architecturally we have 128 IDs some of which are reserved */
> +#define CORESIGHT_TRACE_IDS_MAX 128
> +
> +/**
> + * Trace ID map.
> + *
> + * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
> + *		Initialised so that the reserved IDs are permanently marked as
> + *		in use.
> + * @pend_rel_ids: CPU IDs that have been released by the trace source but not
> + *		  yet marked as available, to allow re-allocation to the same
> + *		  CPU during a perf session.
> + */
> +struct coresight_trace_id_map {
> +	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
> +	DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
> +};
> +
>  /**
>   * struct coresight_device - representation of a device as used by the framework
>   * @pdata:	Platform data with device connections associated to this device.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
