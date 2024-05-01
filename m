Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C06488B890C
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 13:11:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A11AC7129E;
	Wed,  1 May 2024 11:11:41 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16375C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 11:11:34 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5cdbc4334edso3738075a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2024 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714561892; x=1715166692;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BZZTUr02OpFJNJ7PY9o47700VYpg5n+dM1vcCgaaNjM=;
 b=HI/74pYx2c5dt2EO99/1CnvOs52KgOfEBAg3hOaRNdTvzo/vXbwUIPxwglxQUWpjLK
 rqRp/RqFibKysCOvWGeTjH4BiYieeGQJg7CtjVn2f07S/r+GdoEF6PnAP3QG4BTJJZQw
 BZv601PfIILHgQ91bz11ZiWUrrqqah1vF0nEQIQYCxxOBK1C4Wpz2V+tFT7UkIzPpDrd
 PqYVCp9JQpfoIQ9M/3PA6Nj27ByRwbypBAiK069F+T7S6QryUdtCPY7lb/03zJAMH5QY
 l9DptEc9DUrUvsCAyoUUu99hrdLhIFlkdNa0td8OwRJ2WfrU9nP31q960PPFqFBT3iyS
 AS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714561892; x=1715166692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BZZTUr02OpFJNJ7PY9o47700VYpg5n+dM1vcCgaaNjM=;
 b=nyrTQAMRXiOZcwNlehhwL0JH8DJq+H6wEJc+7hn28lgNrxPZwuYmKquCaOKw6N0v92
 +5SGQ6xY78qRnPdPzBygnPBYpNRj72pH1ieWzxRMgswquM32GKG7pRbh63lxPIolbhPx
 0iJbk1LhPVTJ0H1diMtrJCQeA4VLh2Aj4aoLyT4wpeQ9IcujLVYr8GGZUvcJlHxnz9kF
 +Mz0gsq4JmnXTZq+dXJVDnjrCqPzACnLwI4QTUAIj+jmgmpkVPe1H6IVeditx5qJQ5FG
 mZyyRYZ8AlfUQKsreqiGgBiyWh+lpxDat/Sj133R/u+H9fqnYmAu+6Frk/jQa9tdCK1r
 8JDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWdlmXd8/zv6iUtz6UX9gqshik3rN9mfwY03PFKvRX9yvJwNffc9+la7fLm+mRAT7DGx8qAAFpIYVZzooYYag7Dwp9YzslSi43dQnUggl2+Jp4bpw0rLED
X-Gm-Message-State: AOJu0Yw7v5I135DShE9Yqg5xS82JKCNNglUmdq8OgiuJZIPDj1495unZ
 M9zdnEieftnEbu4sW/q+II1/yV9/VdpmIIh3jow3RHuyANnZxxwyFJRAqzzRjoFLbB8bEn9BjAG
 gUgWgQhNL2d0vhIMdcWXzyWagRjE3ysQg9V8obQ==
X-Google-Smtp-Source: AGHT+IHme+tbaissSNWWxihi7iBWbnHX1ITaUYwIqqsZ/hS87/ki1ILDQ1EHmGWbPiULm7pY0uK6xANN1WfW/TaXyVQ=
X-Received: by 2002:a17:90b:388f:b0:2b2:812e:1d8c with SMTP id
 mu15-20020a17090b388f00b002b2812e1d8cmr1795234pjb.2.1714561892566; Wed, 01
 May 2024 04:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-11-james.clark@arm.com>
In-Reply-To: <20240429152207.479221-11-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 May 2024 12:11:21 +0100
Message-ID: <CAJ9a7VghkeaJ8e-mEZKodicQ++QyW_SKfacsPPsfQb2PiT6H0w@mail.gmail.com>
To: James Clark <james.clark@arm.com>
Cc: scclevenger@os.amperecomputing.com, Mark Rutland <mark.rutland@arm.com>,
 Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
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

On Mon, 29 Apr 2024 at 16:24, James Clark <james.clark@arm.com> wrote:
>
> The trace ID maps will need to be created and stored by the core and
> Perf code so move the definition up to the common header.
>
> Signed-off-by: James Clark <james.clark@arm.com>
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
>  #define IS_VALID_CS_TRACE_ID(id)       \
>         ((id > CORESIGHT_TRACE_ID_RES_0) && (id < CORESIGHT_TRACE_ID_RES_TOP))
>
> -/**
> - * Trace ID map.
> - *
> - * @used_ids:  Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
> - *             Initialised so that the reserved IDs are permanently marked as
> - *             in use.
> - * @pend_rel_ids: CPU IDs that have been released by the trace source but not
> - *               yet marked as available, to allow re-allocation to the same
> - *               CPU during a perf session.
> - */
> -struct coresight_trace_id_map {
> -       DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
> -       DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
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
>         const char *target_name;
>  };
>
> +/* architecturally we have 128 IDs some of which are reserved */
> +#define CORESIGHT_TRACE_IDS_MAX 128
> +
> +/**
> + * Trace ID map.
> + *
> + * @used_ids:  Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
> + *             Initialised so that the reserved IDs are permanently marked as
> + *             in use.
> + * @pend_rel_ids: CPU IDs that have been released by the trace source but not
> + *               yet marked as available, to allow re-allocation to the same
> + *               CPU during a perf session.
> + */
> +struct coresight_trace_id_map {
> +       DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
> +       DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
> +};
> +
>  /**
>   * struct coresight_device - representation of a device as used by the framework
>   * @pdata:     Platform data with device connections associated to this device.
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
