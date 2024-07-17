Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE3933F2E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2024 17:03:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BEDFC71292;
	Wed, 17 Jul 2024 15:03:48 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 719E2C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 15:03:47 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70b0d0fefe3so4561044b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721228626; x=1721833426;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QxQzHnPQfliEOOGePuMQwmHPsAiogIoQ0i3ZwbhDwSo=;
 b=x0A/wNaODVE0SBHzDuljMb0kg+7m9Xb/t7cfz0PYLXRtoot1cT78IIBupWWUc3sYaN
 E5wYmv0wQidRTMa0rG0nbAVfeZzgnUNC0iNkEd5tyN1RihCcqQHaJb8BS7v+lywkNaye
 tusQMzQZJ0kKngY+EKzK4XI/8VNe2w6V/UCWcRXOqYKRXweyBTRTUOrOCZriccInqeA/
 9CiMk3tujRUBtT8qaWVSWbd9cn2bb0puE4L+htZRwZUNS/zuT0uC21OBga2C/2nu9fCS
 luywTkNvowQSDuUwjPWfi2h+XWxJ6TNlp7sYVGSI9Uxgbh1gcFvdPlOTHdyzRi0GnvtT
 /nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228626; x=1721833426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxQzHnPQfliEOOGePuMQwmHPsAiogIoQ0i3ZwbhDwSo=;
 b=eyu3ikxpH7ZoWBNwQxCtPpXplUGHhxgQmc3rXxMRmQofDUaf3PFx+YNXhvrN28W1kO
 wh6jl/3i3CBH9764qc6KkJe3RG3PbQ4wXaNCXtPwEqWx62PRlAswbidggO1rQh3IwPa3
 Bzg2JgTlSup66H2b8bmY0ic9/oDYe0EcDBajhO2mJHBeQfKOTg9I6li2ByceEyBQDZb3
 DjGHPvii/uJ4iJIQcebYUocgm0mL7hk6jUVvZWIIhcAYpi7oPWw0svtEV6YR1OjYMo5i
 aL6A2NQrOrOQjw3ouK8pfeWZu6NJs4BhzpZ6IkmBrOMHP+i4F/4VtDdZmlHpUV3Zi1t7
 DhDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkeez3HJwmHUvJMiwyrbOxczNq4RbwcTHrKuVRSEYLl1bbqZ2PzWnuFmvz+lrYXn1ZtitOAuntKWSOBc5dpZ47ukqvM6fjpe3LkRHCf7BlA2DdBe+6NKWn
X-Gm-Message-State: AOJu0Yy2wuGT9jEQEGLe9XmSxgnYtAOo1/MZBcmckwq+Hjlq+Pj3ZA3+
 X58O0tqZNAdBY8AFXguGEmCv0OUQkFvvb2XBR6fnPfQrmhb+LU9d31YhOVVMP+GAl2PzND+wwa9
 x0Z4d2voU3/zYBcct+UZ8qI358RCwQOYA7Gz8Fg==
X-Google-Smtp-Source: AGHT+IEdN81PHZbEjwHoFKcZRslkAwEq7L47cx3z+yuQtVzDJv7rMqF9DnkIwf9F2c9GwJ58Vx9pv8Y+3QG6Vl8cDA8=
X-Received: by 2002:a05:6a00:198a:b0:702:6dc7:2368 with SMTP id
 d2e1a72fcca58-70ce4dc5c7amr2004506b3a.12.1721228625664; Wed, 17 Jul 2024
 08:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-16-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-16-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 17 Jul 2024 16:03:34 +0100
Message-ID: <CAJ9a7VhCxh9myMVYBt6BiYODdX_skyyoov2s9p4NFyV+Yj++xA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 15/17] coresight: Remove pending trace
	ID release mechanism
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
> Pending the release of IDs was a way of managing concurrent sysfs and
> Perf sessions in a single global ID map. Perf may have finished while
> sysfs hadn't, and Perf shouldn't release the IDs in use by sysfs and
> vice versa.
>
> Now that Perf uses its own exclusive ID maps, pending release doesn't
> result in any different behavior than just releasing all IDs when the
> last Perf session finishes. As part of the per-sink trace ID change, we
> would have still had to make the pending mechanism work on a per-sink
> basis, due to the overlapping ID allocations, so instead of making that
> more complicated, just remove it.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  .../hwtracing/coresight/coresight-etm-perf.c  | 18 +++--
>  .../hwtracing/coresight/coresight-trace-id.c  | 67 +++++--------------
>  .../hwtracing/coresight/coresight-trace-id.h  | 31 ++++-----
>  include/linux/coresight.h                     |  6 +-
>  4 files changed, 43 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 7fb55dafb639..70c99f0409b2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -232,15 +232,21 @@ static void free_event_data(struct work_struct *work)
>                 if (!(IS_ERR_OR_NULL(*ppath))) {
>                         struct coresight_device *sink = coresight_get_sink(*ppath);
>
> -                       coresight_trace_id_put_cpu_id_map(cpu, &sink->perf_sink_id_map);
> +                       /*
> +                        * Mark perf event as done for trace id allocator, but don't call
> +                        * coresight_trace_id_put_cpu_id_map() on individual IDs. Perf sessions
> +                        * never free trace IDs to ensure that the ID associated with a CPU
> +                        * cannot change during their and other's concurrent sessions. Instead,
> +                        * a refcount is used so that the last event to call
> +                        * coresight_trace_id_perf_stop() frees all IDs.
> +                        */
> +                       coresight_trace_id_perf_stop(&sink->perf_sink_id_map);
> +
>                         coresight_release_path(*ppath);
>                 }
>                 *ppath = NULL;
>         }
>
> -       /* mark perf event as done for trace id allocator */
> -       coresight_trace_id_perf_stop();
> -
>         free_percpu(event_data->path);
>         kfree(event_data);
>  }
> @@ -328,9 +334,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>                 sink = user_sink = coresight_get_sink_by_id(id);
>         }
>
> -       /* tell the trace ID allocator that a perf event is starting up */
> -       coresight_trace_id_perf_start();
> -
>         /* check if user wants a coresight configuration selected */
>         cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
>         if (cfg_hash) {
> @@ -411,6 +414,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>                         continue;
>                 }
>
> +               coresight_trace_id_perf_start(&sink->perf_sink_id_map);
>                 *etm_event_cpu_path_ptr(event_data, cpu) = path;
>         }
>
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index 8a777c0af6ea..bddaed3e5cf8 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -18,12 +18,6 @@ static struct coresight_trace_id_map id_map_default = {
>         .cpu_map = &id_map_default_cpu_ids
>  };
>
> -/* maintain a record of the pending releases per cpu */
> -static cpumask_t cpu_id_release_pending;
> -
> -/* perf session active counter */
> -static atomic_t perf_cs_etm_session_active = ATOMIC_INIT(0);
> -
>  /* lock to protect id_map and cpu data  */
>  static DEFINE_SPINLOCK(id_map_lock);
>
> @@ -35,7 +29,6 @@ static void coresight_trace_id_dump_table(struct coresight_trace_id_map *id_map,
>  {
>         pr_debug("%s id_map::\n", func_name);
>         pr_debug("Used = %*pb\n", CORESIGHT_TRACE_IDS_MAX, id_map->used_ids);
> -       pr_debug("Pend = %*pb\n", CORESIGHT_TRACE_IDS_MAX, id_map->pend_rel_ids);
>  }
>  #define DUMP_ID_MAP(map)   coresight_trace_id_dump_table(map, __func__)
>  #define DUMP_ID_CPU(cpu, id) pr_debug("%s called;  cpu=%d, id=%d\n", __func__, cpu, id)
> @@ -122,34 +115,18 @@ static void coresight_trace_id_free(int id, struct coresight_trace_id_map *id_ma
>         clear_bit(id, id_map->used_ids);
>  }
>
> -static void coresight_trace_id_set_pend_rel(int id, struct coresight_trace_id_map *id_map)
> -{
> -       if (WARN(!IS_VALID_CS_TRACE_ID(id), "Invalid Trace ID %d\n", id))
> -               return;
> -       set_bit(id, id_map->pend_rel_ids);
> -}
> -
>  /*
> - * release all pending IDs for all current maps & clear CPU associations
> - *
> - * This currently operates on the default id map, but may be extended to
> - * operate on all registered id maps if per sink id maps are used.
> + * Release all IDs and clear CPU associations.
>   */
> -static void coresight_trace_id_release_all_pending(void)
> +static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map)
>  {
> -       struct coresight_trace_id_map *id_map = &id_map_default;
>         unsigned long flags;
> -       int cpu, bit;
> +       int cpu;
>
>         spin_lock_irqsave(&id_map_lock, flags);
> -       for_each_set_bit(bit, id_map->pend_rel_ids, CORESIGHT_TRACE_ID_RES_TOP) {
> -               clear_bit(bit, id_map->used_ids);
> -               clear_bit(bit, id_map->pend_rel_ids);
> -       }
> -       for_each_cpu(cpu, &cpu_id_release_pending) {
> -               atomic_set(per_cpu_ptr(id_map_default.cpu_map, cpu), 0);
> -               cpumask_clear_cpu(cpu, &cpu_id_release_pending);
> -       }
> +       bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
> +       for_each_possible_cpu(cpu)
> +               atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
>         spin_unlock_irqrestore(&id_map_lock, flags);
>         DUMP_ID_MAP(id_map);
>  }
> @@ -164,7 +141,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>         /* check for existing allocation for this CPU */
>         id = _coresight_trace_id_read_cpu_id(cpu, id_map);
>         if (id)
> -               goto get_cpu_id_clr_pend;
> +               goto get_cpu_id_out_unlock;
>
>         /*
>          * Find a new ID.
> @@ -185,11 +162,6 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>         /* allocate the new id to the cpu */
>         atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
>
> -get_cpu_id_clr_pend:
> -       /* we are (re)using this ID - so ensure it is not marked for release */
> -       cpumask_clear_cpu(cpu, &cpu_id_release_pending);
> -       clear_bit(id, id_map->pend_rel_ids);
> -
>  get_cpu_id_out_unlock:
>         spin_unlock_irqrestore(&id_map_lock, flags);
>
> @@ -210,15 +182,8 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
>
>         spin_lock_irqsave(&id_map_lock, flags);
>
> -       if (atomic_read(&perf_cs_etm_session_active)) {
> -               /* set release at pending if perf still active */
> -               coresight_trace_id_set_pend_rel(id, id_map);
> -               cpumask_set_cpu(cpu, &cpu_id_release_pending);
> -       } else {
> -               /* otherwise clear id */
> -               coresight_trace_id_free(id, id_map);
> -               atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
> -       }
> +       coresight_trace_id_free(id, id_map);
> +       atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
>
>         spin_unlock_irqrestore(&id_map_lock, flags);
>         DUMP_ID_CPU(cpu, id);
> @@ -302,17 +267,17 @@ void coresight_trace_id_put_system_id(int id)
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_put_system_id);
>
> -void coresight_trace_id_perf_start(void)
> +void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map)
>  {
> -       atomic_inc(&perf_cs_etm_session_active);
> -       PERF_SESSION(atomic_read(&perf_cs_etm_session_active));
> +       atomic_inc(&id_map->perf_cs_etm_session_active);
> +       PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_perf_start);
>
> -void coresight_trace_id_perf_stop(void)
> +void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map)
>  {
> -       if (!atomic_dec_return(&perf_cs_etm_session_active))
> -               coresight_trace_id_release_all_pending();
> -       PERF_SESSION(atomic_read(&perf_cs_etm_session_active));
> +       if (!atomic_dec_return(&id_map->perf_cs_etm_session_active))
> +               coresight_trace_id_release_all(id_map);
> +       PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_perf_stop);
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
> index 840babdd0794..9aae50a553ca 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -17,9 +17,10 @@
>   * released when done.
>   *
>   * In order to ensure that a consistent cpu / ID matching is maintained
> - * throughout a perf cs_etm event session - a session in progress flag will
> - * be maintained, and released IDs not cleared until the perf session is
> - * complete. This allows the same CPU to be re-allocated its prior ID.
> + * throughout a perf cs_etm event session - a session in progress flag will be
> + * maintained for each sink, and IDs are cleared when all the perf sessions
> + * complete. This allows the same CPU to be re-allocated its prior ID when
> + * events are scheduled in and out.
>   *
>   *
>   * Trace ID maps will be created and initialised to prevent architecturally
> @@ -66,11 +67,7 @@ int coresight_trace_id_get_cpu_id_map(int cpu, struct coresight_trace_id_map *id
>  /**
>   * Release an allocated trace ID associated with the CPU.
>   *
> - * This will release the CoreSight trace ID associated with the CPU,
> - * unless a perf session is in operation.
> - *
> - * If a perf session is in operation then the ID will be marked as pending
> - * release.
> + * This will release the CoreSight trace ID associated with the CPU.
>   *
>   * @cpu: The CPU index to release the associated trace ID.
>   */
> @@ -133,21 +130,21 @@ void coresight_trace_id_put_system_id(int id);
>  /**
>   * Notify the Trace ID allocator that a perf session is starting.
>   *
> - * Increase the perf session reference count - called by perf when setting up
> - * a trace event.
> + * Increase the perf session reference count - called by perf when setting up a
> + * trace event.
>   *
> - * This reference count is used by the ID allocator to ensure that trace IDs
> - * associated with a CPU cannot change or be released during a perf session.
> + * Perf sessions never free trace IDs to ensure that the ID associated with a
> + * CPU cannot change during their and other's concurrent sessions. Instead,
> + * this refcount is used so that the last event to finish always frees all IDs.
>   */
> -void coresight_trace_id_perf_start(void);
> +void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map);
>
>  /**
>   * Notify the ID allocator that a perf session is stopping.
>   *
> - * Decrease the perf session reference count.
> - * if this causes the count to go to zero, then all Trace IDs marked as pending
> - * release, will be released.
> + * Decrease the perf session reference count. If this causes the count to go to
> + * zero, then all Trace IDs will be released.
>   */
> -void coresight_trace_id_perf_stop(void);
> +void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map);
>
>  #endif /* _CORESIGHT_TRACE_ID_H */
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 9c3067e2e38b..197949fd2c35 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -227,14 +227,12 @@ struct coresight_sysfs_link {
>   * @used_ids:  Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
>   *             Initialised so that the reserved IDs are permanently marked as
>   *             in use.
> - * @pend_rel_ids: CPU IDs that have been released by the trace source but not
> - *               yet marked as available, to allow re-allocation to the same
> - *               CPU during a perf session.
> + * @perf_cs_etm_session_active: Number of Perf sessions using this ID map.
>   */
>  struct coresight_trace_id_map {
>         DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
> -       DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
>         atomic_t __percpu *cpu_map;
> +       atomic_t perf_cs_etm_session_active;
>  };
>
>  /**
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
