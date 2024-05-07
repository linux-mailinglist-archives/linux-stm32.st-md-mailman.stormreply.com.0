Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB48BDA18
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 06:16:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 363DEC5E2D2;
	Tue,  7 May 2024 04:16:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D775DC5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 04:16:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47EB51042;
 Mon,  6 May 2024 21:16:28 -0700 (PDT)
Received: from [10.163.33.37] (unknown [10.163.33.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49A9A3F762;
 Mon,  6 May 2024 21:15:54 -0700 (PDT)
Message-ID: <387feec3-79de-4b28-b2d5-d70d05b151b7@arm.com>
Date: Tue, 7 May 2024 09:45:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 gankulkarni@os.amperecomputing.com, scclevenger@os.amperecomputing.com,
 coresight@lists.linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-9-james.clark@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240429152207.479221-9-james.clark@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Leo Yan <leo.yan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/17] coresight: Remove unused stubs
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


Minor nit: Should the subject line be "coresight: Remove unused etm perf stubs" ?

On 4/29/24 20:51, James Clark wrote:
> This file is never included anywhere if CONFIG_CORESIGHT is not set so
> they are unused and aren't currently compile tested with any config so
> remove them.

Searching for this header's inclusion throws up the following source files,
all of which needs CONFIG_CORESIGHT to be enabled to be compiled.

git grep "coresight-etm-perf.h"

drivers/hwtracing/coresight/coresight-core.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-etb10.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-etm-perf.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-etm3x-core.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-etm4x-core.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-syscfg.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-tmc-etf.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-tmc-etr.c:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/coresight-trbe.h:#include "coresight-etm-perf.h"
drivers/hwtracing/coresight/ultrasoc-smb.c:#include "coresight-etm-perf.h"

> 
> Signed-off-by: James Clark <james.clark@arm.com>

LGTM, with or without the subject line change.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  .../hwtracing/coresight/coresight-etm-perf.h   | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index bebbadee2ceb..744531158d6b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -62,7 +62,6 @@ struct etm_event_data {
>  	struct list_head * __percpu *path;
>  };
>  
> -#if IS_ENABLED(CONFIG_CORESIGHT)
>  int etm_perf_symlink(struct coresight_device *csdev, bool link);
>  int etm_perf_add_symlink_sink(struct coresight_device *csdev);
>  void etm_perf_del_symlink_sink(struct coresight_device *csdev);
> @@ -77,23 +76,6 @@ static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
>  int etm_perf_add_symlink_cscfg(struct device *dev,
>  			       struct cscfg_config_desc *config_desc);
>  void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc);
> -#else
> -static inline int etm_perf_symlink(struct coresight_device *csdev, bool link)
> -{ return -EINVAL; }
> -int etm_perf_add_symlink_sink(struct coresight_device *csdev)
> -{ return -EINVAL; }
> -void etm_perf_del_symlink_sink(struct coresight_device *csdev) {}
> -static inline void *etm_perf_sink_config(struct perf_output_handle *handle)
> -{
> -	return NULL;
> -}
> -int etm_perf_add_symlink_cscfg(struct device *dev,
> -			       struct cscfg_config_desc *config_desc)
> -{ return -EINVAL; }
> -void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc) {}
> -
> -#endif /* CONFIG_CORESIGHT */
> -
>  int __init etm_perf_init(void);
>  void etm_perf_exit(void);
>  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
