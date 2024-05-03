Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CAB8BAA1C
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 11:44:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9AC4C712A2;
	Fri,  3 May 2024 09:44:16 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473B9C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 09:44:09 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5ce07cf1e5dso6352399a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2024 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714729448; x=1715334248;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E6K7Pay8ZGGs8JQpUV4vQdePr9SGgGcaDpI0+uLfi74=;
 b=nqyhzeqrNkxYzndFm5lZturcEMd4PXzKEFBpZppbu52dQjss7Ln28BX/B1wkHoCgmg
 sPhEA43E0xFSuM7+YUEqgN+PQriFBZBqeI7xU9mAkgYJa3K6Bw/8s/wWtwpj03fx9d5C
 UtNo92BpSCoWcf++FzR6q4sJ9PGovec/w0Njn6Qlp1+bgiUVOIGgZLI6ZtW3yg3GKLKC
 1bP3CJ9M7viI7Kp9CNojfmyCyfA0H0aU6xvltbVcOdShrx8UgdaSWikH/GBhtauuJdO0
 sfXRukK/jlIT5fMDx0RAeH+e24uL6izm2obPOK5yCwDGtLLf3YMstl3ixeRqV9ApND7f
 uQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714729448; x=1715334248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E6K7Pay8ZGGs8JQpUV4vQdePr9SGgGcaDpI0+uLfi74=;
 b=mhcs4gKq9qcJwiEj2hZuRYSAQCouKxYHsR5scBjCxTDaUgGE2G7nCKPcMSmgsPG9Sn
 0MLK7Vj0IgLjOxvvp2H0+ru79ybvEw8WMRI60qH602hQ81awzJ0Ogacgs7KPjrUvVoc9
 aAyjq5fQP+AdJBs7OyG8ugDQPmxn8vMNtswan3LrJUVdk2shk+BUqG4CaJV4tChBShiu
 8gL2D8MiQ4vFwTbKeVCXw7OQ0W7vzj8DgxUkilyfi/JGH2q4u9zaYYbS85ZYlKfF5MYn
 +4J4hgJA0LcFQFyxWPV/ENm45+cYdTof80tiPLbkIc3sDwuffr/uRdCfapccb4J4kKg8
 XxOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgAevfsWwtsedpMrXDej2vdnZ3Dfd/wxahAuoLzPR2PmlTvKTfllCXTUmh4UkddcS6qxncX/bpZbwARt1G8pksKi36DgQJeEXVDOvtG/4vG9MLkWG1Fr8h
X-Gm-Message-State: AOJu0YyujXw39EBnLKFaUYrvmlNvQnM0UPoMjpCfnxq+/k6yg/N261iz
 zX9YpjtvcxDUG8ZAUAGWyOaPDI1jtEFXUAfCHif+zlDGOo0YnXg9txq0YoDAUrLkUXGfAK+TzoS
 dbVqDElYFDzgwNsWUSRJeXM3eGHFqz33pkQoLJg==
X-Google-Smtp-Source: AGHT+IEqmUCxUFheYOsEu1hmSEQa0XiyixvoaeJ456MYN5L8WNIkTLo/FnODv1me6ARbWIOQ5r0bYrUcRPz1HVkKw80=
X-Received: by 2002:a17:90a:650a:b0:2a2:70f6:8f67 with SMTP id
 i10-20020a17090a650a00b002a270f68f67mr2153090pjj.30.1714729447724; Fri, 03
 May 2024 02:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-16-james.clark@arm.com>
In-Reply-To: <20240429152207.479221-16-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 3 May 2024 10:43:56 +0100
Message-ID: <CAJ9a7VicoyFAh1m+0wcEdKan_whfXP6cb7GBZvBXCukfyugjgg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 14/17] coresight: Use per-sink trace ID
	maps for Perf sessions
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

Hi James

On Mon, 29 Apr 2024 at 16:25, James Clark <james.clark@arm.com> wrote:
>
> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
> as long as there are fewer than that many ETMs connected to each sink.
>
> Each sink owns its own trace ID map, and any Perf session connecting to
> that sink will allocate from it, even if the sink is currently in use by
> other users. This is similar to the existing behavior where the dynamic
> trace IDs are constant as long as there is any concurrent Perf session
> active. It's not completely optimal because slightly more IDs will be
> used than necessary, but the optimal solution involves tracking the PIDs
> of each session and allocating ID maps based on the session owner. This
> is difficult to do with the combination of per-thread and per-cpu modes
> and some scheduling issues. The complexity of this isn't likely to worth
> it because even with multiple users they'd just see a difference in the
> ordering of ID allocations rather than hitting any limits (unless the
> hardware does have too many ETMs connected to one sink).
>
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c     | 10 ++++++++++
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 15 ++++++++-------
>  include/linux/coresight.h                        |  1 +
>  3 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 9fc6f6b863e0..d1adff467670 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -902,6 +902,7 @@ static void coresight_device_release(struct device *dev)
>         struct coresight_device *csdev = to_coresight_device(dev);
>
>         fwnode_handle_put(csdev->dev.fwnode);
> +       free_percpu(csdev->perf_id_map.cpu_map);
>         kfree(csdev);
>  }
>
> @@ -1159,6 +1160,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>         csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
>         dev_set_name(&csdev->dev, "%s", desc->name);
>
> +       if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> +           csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> +               csdev->perf_id_map.cpu_map = alloc_percpu(atomic_t);
> +               if (!csdev->perf_id_map.cpu_map) {
> +                       ret = -ENOMEM;
> +                       goto err_out;
> +               }
> +       }
>         /*
>          * Make sure the device registration and the connection fixup
>          * are synchronised, so that we don't see uninitialised devices
> @@ -1216,6 +1225,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>  err_out:
>         /* Cleanup the connection information */
>         coresight_release_platform_data(NULL, desc->dev, desc->pdata);
> +       kfree(csdev);
>         return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(coresight_register);
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 177cecae38d9..86ca1a9d09a7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -229,10 +229,13 @@ static void free_event_data(struct work_struct *work)
>                 struct list_head **ppath;
>
>                 ppath = etm_event_cpu_path_ptr(event_data, cpu);
> -               if (!(IS_ERR_OR_NULL(*ppath)))
> +               if (!(IS_ERR_OR_NULL(*ppath))) {
> +                       struct coresight_device *sink = coresight_get_sink(*ppath);
> +
> +                       coresight_trace_id_put_cpu_id(cpu, &sink->perf_id_map);
>                         coresight_release_path(*ppath);
> +               }
>                 *ppath = NULL;
> -               coresight_trace_id_put_cpu_id(cpu, coresight_trace_id_map_default());
>         }
>
>         /* mark perf event as done for trace id allocator */
> @@ -401,8 +404,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>                 }
>
>                 /* ensure we can allocate a trace ID for this CPU */
> -               trace_id = coresight_trace_id_get_cpu_id(cpu,
> -                                                        coresight_trace_id_map_default());
> +               trace_id = coresight_trace_id_get_cpu_id(cpu, &sink->perf_id_map);
>                 if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>                         cpumask_clear_cpu(cpu, mask);
>                         coresight_release_path(path);
> @@ -497,7 +499,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>
>         /* Finally enable the tracer */
>         if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
> -                                     coresight_trace_id_map_default()))
> +                                     &sink->perf_id_map))
>                 goto fail_disable_path;
>
>         /*
> @@ -509,8 +511,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>                 hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
>                                    CS_AUX_HW_ID_CURR_VERSION);
>                 hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
> -                                   coresight_trace_id_read_cpu_id(cpu,
> -                                               coresight_trace_id_map_default()));
> +                                   coresight_trace_id_read_cpu_id(cpu, &sink->perf_id_map));
>                 perf_report_aux_output_id(event, hw_id);
>         }
>
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 3a678e5425dc..8c4c1860c76b 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -290,6 +290,7 @@ struct coresight_device {
>         bool sysfs_sink_activated;
>         struct dev_ext_attribute *ea;
>         struct coresight_device *def_sink;
> +       struct coresight_trace_id_map perf_id_map;

perhaps this should be sink_id_map? At some point sysfs may use is and
naming is sink... is more consistent with other sink attributes in the
structure.

>         /* sysfs links between components */
>         int nr_links;
>         bool has_conns_grp;
> --
> 2.34.1
>

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
