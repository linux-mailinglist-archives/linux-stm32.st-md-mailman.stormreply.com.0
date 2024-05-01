Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A838B889F
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 12:32:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17976C7129E;
	Wed,  1 May 2024 10:32:16 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAA78C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 10:32:08 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5cf2d73a183so580005a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2024 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714559527; x=1715164327;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uY43QB8T+78HEj8GRDRsb60L4Nl0N1qrUHvHx08Om7c=;
 b=G9doebgKDbwWmFvpiuTsS/oIFwVvm1vfTSAxRrHy6t2JkrAtDM/wRIW2K01BciWXbN
 fmiGWr7JG2L0G305o5mOwgoylSt1+5lM5DkHQX0BOIFOt31R4wR1srp2YprZ9ZunCWQ3
 pva4Fvld7m5Mg5hmQfjX4ofxxMZqZ8Mwn4srFWTOwsWwZJN2LV2z7akZtjehNULAXwUv
 JwGWZs7/K3q6ZcZywNOUukfGSDlK0wyliar35zWjrTPemf/fHi1b+UTJTIrbJzcbYR5z
 MEdsGQKBEXgAhD/U8L3nsgEY/dATbceLwDGU6Baxat4mPRWUET2lKMlnhktewuyhx58Y
 CF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714559527; x=1715164327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uY43QB8T+78HEj8GRDRsb60L4Nl0N1qrUHvHx08Om7c=;
 b=biymsvjNYTPRpTNMbzF//j4yiPVgI56nEXDWrwsyTJIwTeKYL1RUVXWA29tP9waSB9
 BR2dyuYFm/sQhkeFNU7r+ckTv7lkY/CRZ5mLkoTI9OA6JxB0rz5cMoBtW1sldIWJsPG2
 HBATiMQDw2CWiWG715jy5rTJqrxBBDDxj45Hz2nnNV0n1L+hR4JNAi9lbfMgE+AT6Z9Y
 q8cd+80QOmW630csgdIjkXGfsC+6qfHfmQUlpz4mQpuAc+fWA/xJiObziTb4NLl1WBg6
 2VvXY/8naDzOomBOGhMLcg2OIG13wOviOc8G1FAC4EoI5CUA0ghHsZ4gm/zYuSn/A+sp
 wBMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt25Wp8foyJYSxiydasot2goFF7jCGmRzJ/r1mGGxPKW/6L3CRe+Uzo7ttD4jkVF1kJZyYf1myBqNJwwYtDAxoU80ptT9IGQ9qUAM+8/vfPAvbDoc9tBF0
X-Gm-Message-State: AOJu0YzdX82JRV7QLk9cBBxTXr2jo2SnW0wGFB1cFwVMIL/216dgi3rd
 iFI3lub16kVYqdD1L1Oh3UCXaCUUx2vN2Xj6N1TeHl3WF66ff9UjXqSUqfxRkjOClz/ddbrXPEW
 WkQiSTaZSdoBxxRWXsZ+sg/YymFRwUfIUYsAB4Q==
X-Google-Smtp-Source: AGHT+IE9uEu1vJlCTupgk+SDI07oGQrpRujdIkoor/k7RAy+jeSqTU8+p3+oUQFS3xpCSp+HkI5pSQOQZuJxs+bZ7uE=
X-Received: by 2002:a17:90a:df09:b0:2ab:8324:1b47 with SMTP id
 gp9-20020a17090adf0900b002ab83241b47mr3682681pjb.15.1714559527363; Wed, 01
 May 2024 03:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-12-james.clark@arm.com>
In-Reply-To: <20240429152207.479221-12-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 May 2024 11:31:56 +0100
Message-ID: <CAJ9a7Vjj++Bvu2EFVxpXvW4nes0qxVqjxgBWwi1L904p86a7gw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 11/17] coresight: Expose map argument in
	trace ID API
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

Hi James,

On Mon, 29 Apr 2024 at 16:25, James Clark <james.clark@arm.com> wrote:
>
> The trace ID API is currently hard coded to always use the global map.
> The functions that take the map as an argument aren't currently public.
> Make them public so that Perf mode can pass in its own maps. At the
> moment all usages are still hard coded to use the global map, but now
> on the caller side.
>
> System ID functions are unchanged because they will always use the
> default map.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm-perf.c  |  5 +++--
>  .../coresight/coresight-etm3x-core.c          |  5 +++--
>  .../coresight/coresight-etm4x-core.c          |  5 +++--
>  .../hwtracing/coresight/coresight-trace-id.c  | 22 +++++++------------
>  .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++---
>  5 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index c0c60e6a1703..4afb9d29f355 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -232,7 +232,7 @@ static void free_event_data(struct work_struct *work)
>                 if (!(IS_ERR_OR_NULL(*ppath)))
>                         coresight_release_path(*ppath);
>                 *ppath = NULL;
> -               coresight_trace_id_put_cpu_id(cpu);
> +               coresight_trace_id_put_cpu_id(cpu, coresight_trace_id_map_default());
>         }
>
>         /* mark perf event as done for trace id allocator */
> @@ -401,7 +401,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>                 }
>
>                 /* ensure we can allocate a trace ID for this CPU */
> -               trace_id = coresight_trace_id_get_cpu_id(cpu);
> +               trace_id = coresight_trace_id_get_cpu_id(cpu,
> +                                                        coresight_trace_id_map_default());
>                 if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>                         cpumask_clear_cpu(cpu, mask);
>                         coresight_release_path(path);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 9d5c1391ffb1..4149e7675ceb 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -465,7 +465,8 @@ int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
>          *
>          * trace id function has its own lock
>          */
> -       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
> +       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu,
> +                                                coresight_trace_id_map_default());
>         if (IS_VALID_CS_TRACE_ID(trace_id))
>                 drvdata->traceid = (u8)trace_id;
>         else
> @@ -477,7 +478,7 @@ int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
>
>  void etm_release_trace_id(struct etm_drvdata *drvdata)
>  {
> -       coresight_trace_id_put_cpu_id(drvdata->cpu);
> +       coresight_trace_id_put_cpu_id(drvdata->cpu, coresight_trace_id_map_default());
>  }
>
>  static int etm_enable_perf(struct coresight_device *csdev,
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index a0bdfabddbc6..f32c8cd7742d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -241,7 +241,8 @@ int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
>          * or return the one currently allocated.
>          * The trace id function has its own lock
>          */
> -       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
> +       trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu,
> +                                                coresight_trace_id_map_default());
>         if (IS_VALID_CS_TRACE_ID(trace_id))
>                 drvdata->trcid = (u8)trace_id;
>         else
> @@ -253,7 +254,7 @@ int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
>
>  void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
>  {
> -       coresight_trace_id_put_cpu_id(drvdata->cpu);
> +       coresight_trace_id_put_cpu_id(drvdata->cpu, coresight_trace_id_map_default());
>  }
>
>  struct etm4_enable_arg {
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index 19005b5b4dc4..45ddd50d09a6 100644
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
> @@ -152,7 +152,7 @@ static void coresight_trace_id_release_all_pending(void)
>         DUMP_ID_MAP(id_map);
>  }
>
> -static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
> +int coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>  {
>         unsigned long flags;
>         int id;
> @@ -195,8 +195,9 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
>         DUMP_ID_MAP(id_map);
>         return id;
>  }
> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_cpu_id);
>
> -static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
> +void coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>  {
>         unsigned long flags;
>         int id;
> @@ -222,6 +223,7 @@ static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
>         DUMP_ID_CPU(cpu, id);
>         DUMP_ID_MAP(id_map);
>  }
> +EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id);
>
>  static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
>  {
> @@ -250,19 +252,11 @@ static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *
>         DUMP_ID_MAP(id_map);
>  }
>
> -/* API functions */
> -

Rather than remove the existing default trace ID functions, simply add
a few new ones...

e.g. given the existing...

void coresight_trace_id_put_cpu_id(int cpu)
{
    coresight_trace_id_map_put_cpu_id(cpu, &id_map_default);
}
EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id);

add:-

void coresight_trace_id_put_cpu_id_map(int cpu, struct
coresight_trace_id_map *id_map)
{
    coresight_trace_id_map_put_cpu_id(cpu, id_map);
}
EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id_map);

This avoids a whole lot of churn in exposing the default map to
external functions, putting it in there and then removing it later.
When any location that was using coresight_trace_id_put_cpu_id() needs
to supply its own map, change the function name at that point to
coresight_trace_id_put_cpu_id_map()

Mike


> -int coresight_trace_id_get_cpu_id(int cpu)
> -{
> -       return coresight_trace_id_map_get_cpu_id(cpu, &id_map_default);
> -}
> -EXPORT_SYMBOL_GPL(coresight_trace_id_get_cpu_id);
> -
> -void coresight_trace_id_put_cpu_id(int cpu)
> +struct coresight_trace_id_map *coresight_trace_id_map_default(void)
>  {
> -       coresight_trace_id_map_put_cpu_id(cpu, &id_map_default);
> +       return &id_map_default;
>  }
> -EXPORT_SYMBOL_GPL(coresight_trace_id_put_cpu_id);
> +EXPORT_SYMBOL_GPL(coresight_trace_id_map_default);
>
>  int coresight_trace_id_read_cpu_id(int cpu)
>  {
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
> index 49438a96fcc6..54b9d8ed903b 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -42,7 +42,10 @@
>  #define IS_VALID_CS_TRACE_ID(id)       \
>         ((id > CORESIGHT_TRACE_ID_RES_0) && (id < CORESIGHT_TRACE_ID_RES_TOP))
>
> -/* Allocate and release IDs for a single default trace ID map */
> +/**
> + * Get the global map that's used by sysfs
> + */
> +struct coresight_trace_id_map *coresight_trace_id_map_default(void);
>
>  /**
>   * Read and optionally allocate a CoreSight trace ID and associate with a CPU.
> @@ -57,7 +60,7 @@
>   *
>   * return: CoreSight trace ID or -EINVAL if allocation impossible.
>   */
> -int coresight_trace_id_get_cpu_id(int cpu);
> +int coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map *id_map);
>
>  /**
>   * Release an allocated trace ID associated with the CPU.
> @@ -70,7 +73,7 @@ int coresight_trace_id_get_cpu_id(int cpu);
>   *
>   * @cpu: The CPU index to release the associated trace ID.
>   */
> -void coresight_trace_id_put_cpu_id(int cpu);
> +void coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_map *id_map);
>
>  /**
>   * Read the current allocated CoreSight Trace ID value for the CPU.
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
