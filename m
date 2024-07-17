Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD98933F2A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2024 17:03:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56642C71292;
	Wed, 17 Jul 2024 15:03:27 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A18CC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 15:03:20 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70b0e9ee7bcso5178998b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721228599; x=1721833399;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aoj6MPXt3lY6CL1odJ5ENy6WZ+0W2WmSL5RmTE2y7+c=;
 b=K6dorR/ymEwXbEgqmstn6lGjdl/1JTQS2JYwXO/BhCAWVLXirY9oO67SCHKVKNmKiv
 8lRD8Lg9VJGPuc/BNCEFOXAYp6JkVy8qD8xAWPAT7GSJ3PprvIcSb3KK5U4brL5cTc7o
 P4kitRE8Tx2LUxoX9JzmCAtcF9d2iBBeK6G6QLlSrk7FI2VuoNmfHyYQk2sXqRmF8tp6
 Xafo0CQlEj/fija4uWmooFDmOdbQHeT+0YueR9JtPsMvwhfEyQqq3bVeO/GSjNf518eN
 XSTn/X1iwz1Btes3M4nYkvdHSJ0J6QmaX4lS3UpxNCS2Ve9UTFlC9NifwDV1ZhGu0Mcx
 ZV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228599; x=1721833399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aoj6MPXt3lY6CL1odJ5ENy6WZ+0W2WmSL5RmTE2y7+c=;
 b=hXOsj96hqtpDur+ooJ0GaT8ulegesQSSeSwD3mXzQRxdGDmAzEcVjhTDtsx8PY8bHx
 7gRDun5wipUInzVCjAd0Oq/4ytuHKCTuzp3i57x7UoEIkEuytO5IAuPeURJTflQGRIt1
 8qfJ71Tyu4nJ8kQJV4c/FVRyVAvovO0fkCd9//EVaZ1ErHz9/icpAgr5ojB9ktgJvukO
 9ErO9FkMGqUiYj5cSJiTfEhdMLjOxwe6dWqwzrFp0fDjcOBjWE9Q7Lw3bOlc8EqrCEMY
 apwZ7fZwT9TrcPurDXcpPK8pVMLgufQrQiNPHv3TzTT4d1nby5x/BDJvp0ZI5prq7tJa
 EuQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5R0XrOI6KxlZtPw8//zs9GCfI20kJtYGSRoTuSGPEe1ynNBqLt1dimW/mNgs950lm5C+Z9AokodL8H9nFOa1WHSQAB+1afcCjkfsucz27BYExT1otYFL0
X-Gm-Message-State: AOJu0Yx75ivPUNuS5thfNVEPB+aDdj4V34C08MO6pVtdV77U79yFLn6G
 mcR+pSlFWl9mJjuhLeoktRyAuwwbDOwPBjjjBGRl0O0/8NlPdDLT49LAdLWnTlc3a3rbZHug5yu
 62MN1OiYGaLM3YcPw5ziH0wnRSkZAne4B5dhRBg==
X-Google-Smtp-Source: AGHT+IFpEJoYB4/aLQ+2EIUEuDPzDGUgyjI1Za81GceThY75kI5rjxj1Be/WOTCW8A92e5IPmUyo1zFQeyLqZOPaOu8=
X-Received: by 2002:a05:6a00:3e08:b0:70a:f40e:f2c7 with SMTP id
 d2e1a72fcca58-70ce4fff8fdmr2379281b3a.24.1721228598728; Wed, 17 Jul 2024
 08:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-13-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-13-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 17 Jul 2024 16:03:07 +0100
Message-ID: <CAJ9a7Vgg4EN+S-HpemwGMDTbfcEGcPHSgNns8k_Yr_Z-_SDD8w@mail.gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, "Liang,
 Kan" <kan.liang@linux.intel.com>, suzuki.poulose@arm.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, anshuman.khandual@arm.com,
 coresight@lists.linaro.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 leo.yan@linux.dev, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH v5 12/17] coresight: Expose map arguments
	in trace ID API
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

On Fri, 12 Jul 2024 at 11:23, James Clark <james.clark@linaro.org> wrote:
>
> From: James Clark <james.clark@arm.com>
>
> The trace ID API is currently hard coded to always use the global map.
> Add public versions that allow the map to be passed in so that Perf
> mode can use per-sink maps. Keep the non-map versions so that sysfs
> mode can continue to use the default global map.
>
> System ID functions are unchanged because they will always use the
> default map.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  .../hwtracing/coresight/coresight-trace-id.c  | 36 ++++++++++++++-----
>  .../hwtracing/coresight/coresight-trace-id.h  | 20 +++++++++--
>  2 files changed, 45 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index 19005b5b4dc4..5561989a03fa 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -12,7 +12,7 @@
>
>  #include "coresight-trace-id.h"
>
> -/* Default trace ID map. Used on systems that don't require per sink mappings */
> +/* Default trace ID map. Used in sysfs mode and for system sources */
>  static struct coresight_trace_id_map id_map_default;
>
>  /* maintain a record of the mapping of IDs and pending releases per cpu */
> @@ -47,7 +47,7 @@ static void coresight_trace_id_dump_table(struct coresight_trace_id_map *id_map,
>  #endif
>
>  /* unlocked read of current trace ID value for given CPU */
> -static int _coresight_trace_id_read_cpu_id(int cpu)
> +static int _coresight_trace_id_read_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>  {
>         return atomic_read(&per_cpu(cpu_id, cpu));
>  }
> @@ -152,7 +152,7 @@ static void coresight_trace_id_release_all_pending(void)
>         DUMP_ID_MAP(id_map);
>  }
>
> -static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
> +static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>  {
>         unsigned long flags;
>         int id;
> @@ -160,7 +160,7 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
>         spin_lock_irqsave(&id_map_lock, flags);
>
>         /* check for existing allocation for this CPU */
> -       id = _coresight_trace_id_read_cpu_id(cpu);
> +       id = _coresight_trace_id_read_cpu_id(cpu, id_map);
>         if (id)
>                 goto get_cpu_id_clr_pend;
>
> @@ -196,13 +196,13 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
>         return id;
>  }
>
> -static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
> +static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>  {
>         unsigned long flags;
>         int id;
>
>         /* check for existing allocation for this CPU */
> -       id = _coresight_trace_id_read_cpu_id(cpu);
> +       id = _coresight_trace_id_read_cpu_id(cpu, id_map);
>         if (!id)
>                 return;
>
> @@ -254,22 +254,40 @@ static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *
>
>  int coresight_trace_id_get_cpu_id(int cpu)
>  {
> -       return coresight_trace_id_map_get_cpu_id(cpu, &id_map_default);
> +       return _coresight_trace_id_get_cpu_id(cpu, &id_map_default);
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_get_cpu_id);
>
> +int coresight_trace_id_get_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map)
> +{
> +       return _coresight_trace_id_get_cpu_id(cpu, id_map);
> +}
> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_cpu_id_map);
> +
>  void coresight_trace_id_put_cpu_id(int cpu)
>  {
> -       coresight_trace_id_map_put_cpu_id(cpu, &id_map_default);
> +       _coresight_trace_id_put_cpu_id(cpu, &id_map_default);
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id);
>
> +void coresight_trace_id_put_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map)
> +{
> +       _coresight_trace_id_put_cpu_id(cpu, id_map);
> +}
> +EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id_map);
> +
>  int coresight_trace_id_read_cpu_id(int cpu)
>  {
> -       return _coresight_trace_id_read_cpu_id(cpu);
> +       return _coresight_trace_id_read_cpu_id(cpu, &id_map_default);
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
>
> +int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map)
> +{
> +       return _coresight_trace_id_read_cpu_id(cpu, id_map);
> +}
> +EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
> +
>  int coresight_trace_id_get_system_id(void)
>  {
>         return coresight_trace_id_map_get_system_id(&id_map_default);
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
> index 49438a96fcc6..840babdd0794 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -42,8 +42,6 @@
>  #define IS_VALID_CS_TRACE_ID(id)       \
>         ((id > CORESIGHT_TRACE_ID_RES_0) && (id < CORESIGHT_TRACE_ID_RES_TOP))
>
> -/* Allocate and release IDs for a single default trace ID map */
> -
>  /**
>   * Read and optionally allocate a CoreSight trace ID and associate with a CPU.
>   *
> @@ -59,6 +57,12 @@
>   */
>  int coresight_trace_id_get_cpu_id(int cpu);
>
> +/**
> + * Version of coresight_trace_id_get_cpu_id() that allows the ID map to operate
> + * on to be provided.
> + */
> +int coresight_trace_id_get_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map);
> +
>  /**
>   * Release an allocated trace ID associated with the CPU.
>   *
> @@ -72,6 +76,12 @@ int coresight_trace_id_get_cpu_id(int cpu);
>   */
>  void coresight_trace_id_put_cpu_id(int cpu);
>
> +/**
> + * Version of coresight_trace_id_put_cpu_id() that allows the ID map to operate
> + * on to be provided.
> + */
> +void coresight_trace_id_put_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map);
> +
>  /**
>   * Read the current allocated CoreSight Trace ID value for the CPU.
>   *
> @@ -92,6 +102,12 @@ void coresight_trace_id_put_cpu_id(int cpu);
>   */
>  int coresight_trace_id_read_cpu_id(int cpu);
>
> +/**
> + * Version of coresight_trace_id_read_cpu_id() that allows the ID map to operate
> + * on to be provided.
> + */
> +int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *id_map);
> +
>  /**
>   * Allocate a CoreSight trace ID for a system component.
>   *
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
