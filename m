Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A4933F2B
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2024 17:03:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FCE0C71292;
	Wed, 17 Jul 2024 15:03:31 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DA0FC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 15:03:29 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7611b6a617cso4317618a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721228608; x=1721833408;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=10gdFFvJv1+iPvT+xYjVbe0xzgeYMSRIMgDwYMfIOcs=;
 b=XQxDKO4osaNLiZC62Gim9UI/2sQxYPqDEmmhtLfX53/h5EO2I6LWArHkI+9UW/qDzJ
 6AqCzg6VgOT7FZ+YXcUawflSov1L+lJMBsGnA61J5Hy+VBfLGJ+Y2HRRRt0O96ebDU6n
 n/2PVpqvNLOqlFRooC1Y8yVuokIE2I9GsBNDt4yyOf5gwbq5TeO8HCpTZ/l/aUDvpBCj
 o3EGKwF5hpLwMpWHaGrJ766zWidl+J2So1uDPK1HTgN26LiR6hs/4p2ZYg3atXBrQO9U
 Vg566llnH9Bxx1D8f4t8fKUidGHS1T7aQsHhXhXmqpJ3HC1RiIo5P/bwQkpt00CvNsYr
 UPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228608; x=1721833408;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10gdFFvJv1+iPvT+xYjVbe0xzgeYMSRIMgDwYMfIOcs=;
 b=GHtaV/oMYEurxptev8aNlrrPZbRVTjHico4EkRiWn+nFFiRi5a+aPsZDsyUig1Ec7D
 p4kEV2i/YCKKjxj9AnwtEcuqNb476Mf0pnNxQpsX7E6o3TPYXBLldYRjtjdfa82d7JpS
 rE7byA5yhB6n+27e7dgRvfbY7hTr4mgP2dm99REUhb/OK1YA+aCRaGqlBwr1YqEd9rBv
 Yi/GfGf/QmWZBprRrNzP1DeVa05wwcYW0OTk8owuH/wJM7vSzu+QwNPB7X1esBOsLknD
 rpasRgWBmLOzHJa9aF0Ab47PS19sc2Uc30HgB8A9pWpKUBwWemVvfsNolFCkQQgvN3T5
 8ysw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZjAF4WnajPr696WMK1ofDdOSKZlvMmMfu1xrkbJX5lKRRf++BlCvnhvKqSYKBSa38YisLvqaryJcTuJPurLfv70TmwLfngv5hNKWtFMORP4d36sgUzOdL
X-Gm-Message-State: AOJu0YxsN6zJL2UTuG5i8wHq2dUV8p9X9NY0Nb41t9XWHPX+VHbq/DRa
 xrWFLa48OcgCkl5JoT4AO5RuXdA59m5MtvFWTjYiPafAK0057jLLkdF6Ogi5MwjMgWCrvOTK0S7
 8VBvycMfc7sp+kh4LsnYah99c5MkU2/Z5bRyMvQ==
X-Google-Smtp-Source: AGHT+IEejgs1nHZZEUVKuRT4OqPhcasDNwG7eWkBaIZiRpvgt+WEoYJIPSty2XnbpXqIZ5TozWF3quDi8DLQcb4bDY0=
X-Received: by 2002:a17:90b:803:b0:2c9:7a8d:43f7 with SMTP id
 98e67ed59e1d1-2cb527b83abmr1484253a91.23.1721228608148; Wed, 17 Jul 2024
 08:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-14-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-14-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 17 Jul 2024 16:03:16 +0100
Message-ID: <CAJ9a7Vg-L+Csx15G_sNci3koMhZY6g95_pAiFgormmdbvWw9hQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 13/17] coresight: Make CPU id map a
 property of a trace ID map
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
> The global CPU ID mappings won't work for per-sink ID maps so move it to
> the ID map struct. coresight_trace_id_release_all_pending() is hard
> coded to operate on the default map, but once Perf sessions use their
> own maps the pending release mechanism will be deleted. So it doesn't
> need to be extended to accept a trace ID map argument at this point.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-trace-id.c | 16 +++++++++-------
>  include/linux/coresight.h                        |  1 +
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index 5561989a03fa..8a777c0af6ea 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -13,10 +13,12 @@
>  #include "coresight-trace-id.h"
>
>  /* Default trace ID map. Used in sysfs mode and for system sources */
> -static struct coresight_trace_id_map id_map_default;
> +static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
> +static struct coresight_trace_id_map id_map_default = {
> +       .cpu_map = &id_map_default_cpu_ids
> +};
>
> -/* maintain a record of the mapping of IDs and pending releases per cpu */
> -static DEFINE_PER_CPU(atomic_t, cpu_id) = ATOMIC_INIT(0);
> +/* maintain a record of the pending releases per cpu */
>  static cpumask_t cpu_id_release_pending;
>
>  /* perf session active counter */
> @@ -49,7 +51,7 @@ static void coresight_trace_id_dump_table(struct coresight_trace_id_map *id_map,
>  /* unlocked read of current trace ID value for given CPU */
>  static int _coresight_trace_id_read_cpu_id(int cpu, struct coresight_trace_id_map *id_map)
>  {
> -       return atomic_read(&per_cpu(cpu_id, cpu));
> +       return atomic_read(per_cpu_ptr(id_map->cpu_map, cpu));
>  }
>
>  /* look for next available odd ID, return 0 if none found */
> @@ -145,7 +147,7 @@ static void coresight_trace_id_release_all_pending(void)
>                 clear_bit(bit, id_map->pend_rel_ids);
>         }
>         for_each_cpu(cpu, &cpu_id_release_pending) {
> -               atomic_set(&per_cpu(cpu_id, cpu), 0);
> +               atomic_set(per_cpu_ptr(id_map_default.cpu_map, cpu), 0);
>                 cpumask_clear_cpu(cpu, &cpu_id_release_pending);
>         }
>         spin_unlock_irqrestore(&id_map_lock, flags);
> @@ -181,7 +183,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>                 goto get_cpu_id_out_unlock;
>
>         /* allocate the new id to the cpu */
> -       atomic_set(&per_cpu(cpu_id, cpu), id);
> +       atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), id);
>
>  get_cpu_id_clr_pend:
>         /* we are (re)using this ID - so ensure it is not marked for release */
> @@ -215,7 +217,7 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
>         } else {
>                 /* otherwise clear id */
>                 coresight_trace_id_free(id, id_map);
> -               atomic_set(&per_cpu(cpu_id, cpu), 0);
> +               atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
>         }
>
>         spin_unlock_irqrestore(&id_map_lock, flags);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index c16c61a8411d..7d62b88bfb5c 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -234,6 +234,7 @@ struct coresight_sysfs_link {
>  struct coresight_trace_id_map {
>         DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
>         DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
> +       atomic_t __percpu *cpu_map;
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
