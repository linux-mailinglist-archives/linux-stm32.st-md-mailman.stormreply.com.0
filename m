Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA50A933F31
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2024 17:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 935FEC7129D;
	Wed, 17 Jul 2024 15:04:07 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D22C7C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 15:04:05 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-70afe18837cso4460720b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721228644; x=1721833444;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/ascaNctnq7uvd+OydTeIwlQPxoFxG0hR3xpxVorsGM=;
 b=Ph+VT3WDhfOUc1sd1oh93SCiv2MrsFfBmN2UYaRGD3TDtiJDcipZUVupecwgV/JHOC
 ltfvqLw2fN4B4XN1QjprPsKZr3YOLRdNdimhO/NJTeZ4ye/eaAeJx1YtIRKRkx8MCG2p
 T1Od+10jeKn3NEPKuw/wlEhhNX5eO/RbuwjP6N7DJzDrSUS5M7tL1c0DPfIjHnLaSAgb
 0CXLLF04R0kz3fikr78wjGZuasjVpezsZaeyVGm0K6aPTWf2Ui1Wlxh5ZEXr9gASx/Kg
 V0gqkr9i1IxM5UmY7QrNsSIrUDQZgndcIfwBQhcuplh24sf8HV4N3THOQQF/2BXtWVm7
 Xexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228644; x=1721833444;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ascaNctnq7uvd+OydTeIwlQPxoFxG0hR3xpxVorsGM=;
 b=BElH8h0p03ViIPBacTOBbCe1+AcOX+w6pJedrlb1WhGlXtiQl5cil6fYy5bRH9j/rZ
 tA/kodfVPLJaQT+JCNWzEqCsSSxAJ49MwEpdZyafK6Ak/7ZhgRDqDemtrS+RP4OrRxej
 +A1xP8bQHyHYFz1zM5EyOQhp5rV/3Zu/dCYWpwoqZBaR8tzTHBTlNlq88mmwCMONPeLQ
 1e9P1ju+4lYEVgBPF3PQLUhDACFs8z4sw6M/dckKsUbKbm4lBu4BZAEZqIURvHL2qJp8
 dhHwBYF9/aqBEPqKU9LAE3gqF76OX0TA5ZI6Ohk1q1Rr0FTZeqHxsBLdvibxSMugktrM
 UHug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv8psCFfhu9/PgUfGA0+CnN0AiwP06jKf1bkH51jsW/stOMrElN4Z4ATNfnngojfMXT5PWehi/zPqMuLcTeWzBMYxmOFpzp7gx1plsNpWs+scK+DbH88lo
X-Gm-Message-State: AOJu0Ywe1qak1EmKDahhj9lSAaBLWROb6E2cF9Gh1dkppX3j5KrkGWPU
 R3yN+I88GXv2yZYYBI2OK1fC3GFZu5/fxlS84YyeKKFjlXvlwcFQ7WfyIcaKEgjyymwxq1gI1fp
 aeVguZFW+ME/q/StsDyWkB3SqBcSRxmBSsU//cQ==
X-Google-Smtp-Source: AGHT+IExqnE+FNSc7zp9dv1O/rSOtgI13egN7BdykQVCwRmNspCW10dy60NGgyaFxzHfgFQfmkcW/qpcqpGqPq4k6Fs=
X-Received: by 2002:a05:6300:668b:b0:1c3:ff89:1fc6 with SMTP id
 adf61e73a8af0-1c3ff89208amr1918330637.53.1721228644183; Wed, 17 Jul 2024
 08:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-18-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-18-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 17 Jul 2024 16:03:51 +0100
Message-ID: <CAJ9a7Vg4YF-frWF2VNvhL-qyHp2wBaVD7TxzW=QG-LsUMKutHQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 17/17] coresight: Make trace ID map
 spinlock local to the map
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

Reviewed-by: Mike Leach <mike.leach@linaro.org>


On Fri, 12 Jul 2024 at 11:23, James Clark <james.clark@linaro.org> wrote:
>
> From: James Clark <james.clark@arm.com>
>
> Reduce contention on the lock by replacing the global lock with one for
> each map.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  |  1 +
>  .../hwtracing/coresight/coresight-trace-id.c  | 26 +++++++++----------
>  include/linux/coresight.h                     |  1 +
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index c427e9344a84..ea38ecf26fcb 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1164,6 +1164,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>
>         if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
>             csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> +               spin_lock_init(&csdev->perf_sink_id_map.lock);
>                 csdev->perf_sink_id_map.cpu_map = alloc_percpu(atomic_t);
>                 if (!csdev->perf_sink_id_map.cpu_map) {
>                         kfree(csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index bddaed3e5cf8..d98e12cb30ec 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -15,12 +15,10 @@
>  /* Default trace ID map. Used in sysfs mode and for system sources */
>  static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
>  static struct coresight_trace_id_map id_map_default = {
> -       .cpu_map = &id_map_default_cpu_ids
> +       .cpu_map = &id_map_default_cpu_ids,
> +       .lock = __SPIN_LOCK_UNLOCKED(id_map_default.lock)
>  };
>
> -/* lock to protect id_map and cpu data  */
> -static DEFINE_SPINLOCK(id_map_lock);
> -
>  /* #define TRACE_ID_DEBUG 1 */
>  #if defined(TRACE_ID_DEBUG) || defined(CONFIG_COMPILE_TEST)
>
> @@ -123,11 +121,11 @@ static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map
>         unsigned long flags;
>         int cpu;
>
> -       spin_lock_irqsave(&id_map_lock, flags);
> +       spin_lock_irqsave(&id_map->lock, flags);
>         bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
>         for_each_possible_cpu(cpu)
>                 atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
> -       spin_unlock_irqrestore(&id_map_lock, flags);
> +       spin_unlock_irqrestore(&id_map->lock, flags);
>         DUMP_ID_MAP(id_map);
>  }
>
> @@ -136,7 +134,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>         unsigned long flags;
>         int id;
>
> -       spin_lock_irqsave(&id_map_lock, flags);
> +       spin_lock_irqsave(&id_map->lock, flags);
>
>         /* check for existing allocation for this CPU */
>         id = _coresight_trace_id_read_cpu_id(cpu, id_map);
> @@ -163,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>         atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
>
>  get_cpu_id_out_unlock:
> -       spin_unlock_irqrestore(&id_map_lock, flags);
> +       spin_unlock_irqrestore(&id_map->lock, flags);
>
>         DUMP_ID_CPU(cpu, id);
>         DUMP_ID_MAP(id_map);
> @@ -180,12 +178,12 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
>         if (!id)
>                 return;
>
> -       spin_lock_irqsave(&id_map_lock, flags);
> +       spin_lock_irqsave(&id_map->lock, flags);
>
>         coresight_trace_id_free(id, id_map);
>         atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
>
> -       spin_unlock_irqrestore(&id_map_lock, flags);
> +       spin_unlock_irqrestore(&id_map->lock, flags);
>         DUMP_ID_CPU(cpu, id);
>         DUMP_ID_MAP(id_map);
>  }
> @@ -195,10 +193,10 @@ static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *i
>         unsigned long flags;
>         int id;
>
> -       spin_lock_irqsave(&id_map_lock, flags);
> +       spin_lock_irqsave(&id_map->lock, flags);
>         /* prefer odd IDs for system components to avoid legacy CPU IDS */
>         id = coresight_trace_id_alloc_new_id(id_map, 0, true);
> -       spin_unlock_irqrestore(&id_map_lock, flags);
> +       spin_unlock_irqrestore(&id_map->lock, flags);
>
>         DUMP_ID(id);
>         DUMP_ID_MAP(id_map);
> @@ -209,9 +207,9 @@ static void coresight_trace_id_map_put_system_id(struct coresight_trace_id_map *
>  {
>         unsigned long flags;
>
> -       spin_lock_irqsave(&id_map_lock, flags);
> +       spin_lock_irqsave(&id_map->lock, flags);
>         coresight_trace_id_free(id, id_map);
> -       spin_unlock_irqrestore(&id_map_lock, flags);
> +       spin_unlock_irqrestore(&id_map->lock, flags);
>
>         DUMP_ID(id);
>         DUMP_ID_MAP(id_map);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 197949fd2c35..c13342594278 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -233,6 +233,7 @@ struct coresight_trace_id_map {
>         DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
>         atomic_t __percpu *cpu_map;
>         atomic_t perf_cs_etm_session_active;
> +       spinlock_t lock;
>  };
>
>  /**
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
