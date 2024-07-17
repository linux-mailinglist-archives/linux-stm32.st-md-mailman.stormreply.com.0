Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE512933F30
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2024 17:03:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88E04C71292;
	Wed, 17 Jul 2024 15:03:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BDF1C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 15:03:57 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70b0013cf33so5108800b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721228636; x=1721833436;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=47ivNPINYDdIALCmBMGJVr8a0JPn5a19pn0RWfCpesU=;
 b=cmOtG+1lsjrKmCU7on8dUMSVMK0PVEgC2aWBrAPz1UCb6ji0+tdUP+qDcJ4+qOQWch
 13VVwMH9ROq2eZs++pWmKtx0frq3Emal6DFGPTC3gknRorkiAWOSEIcQ7zIYARse9aFL
 gf9oDoAr/fro7Ilhppuuw8AZQLxVbPBIwmECfJpPOcGapNJ7+r8epJo3MPgmTXRPxtxP
 kg+DCcqVRTKbGwX/KW925smvAhqa7/ajU4nGxFXeHaSgH3NVq+3kOotmp3euCnRTkp4t
 2tukqY/T0gYZpFCN9XOV1gYPSsWWrDE1o6wKYAEm4ku7NLRHe6Yucv4uhg11GBhRBnFF
 z0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228636; x=1721833436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=47ivNPINYDdIALCmBMGJVr8a0JPn5a19pn0RWfCpesU=;
 b=RHL8ofrA0QxnZO7Qz/AYnik+VqESB8F2vHJUhm5Ey6t6fEHx7VK26MvAsn98+afTLf
 G0NRTkZ6mRG56SfrExwAkC28/OVHVD8ljUt6rw5Bl6/b60QHWSh7yh5xvofXEqUp0IFS
 S42DXdrhr6sxCfJS2VuI0zTmW9sb4xL3OyuES2uefGhSbWGw8qkFxZi0+rPI9PEsorWW
 duWZ5wHDo1Hsi7JJ6nusFUTD0aN5hw2AuMVXuwDqyptboqWBRL72EHnC9QB/gLOAFNnf
 uMiNfhICflRG4Xk6ZjlAC/410Px9+FEjPN/ivgz5UB42DvxKT8DjS8qq187lW/MdN05x
 Nj8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq2KWSGZIAyCq9+C0Yr7kMN4rkf2ZaBRW3Whq0EEVm4T0gf9clcKD2ttUZgkGNRsOn0TCqziATpVy3vPOBwDJXwShhgf6c57qm79QCQBHAqIMXkt8Kal20
X-Gm-Message-State: AOJu0Yw9PoS29Q3fZDYD7LrpOEotehmLgsaeIFUpFGmr3TxJPxwFq3rx
 uiN/CGbihQ1Hhhcuzq7bV/0KzjpW6egssO00HRHCNnDX1pv1bv9F24x0V7+b3cT0FHonD/UufV2
 HzHKDgr3dvbA71j5OEbDWDrhRUyFpGjTA5XdU6w==
X-Google-Smtp-Source: AGHT+IF4Qf3S4WEbr4QPFSk2b+cX4hoD3rsc31RVhoAaJlpxpIAawZ0K1WdDi/3cWthWlp3qnOxYZxgJfBldjPTXYqQ=
X-Received: by 2002:a05:6a00:2288:b0:708:2602:f62c with SMTP id
 d2e1a72fcca58-70ce4f7476cmr2052661b3a.4.1721228635840; Wed, 17 Jul 2024
 08:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-17-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-17-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 17 Jul 2024 16:03:43 +0100
Message-ID: <CAJ9a7ViwpDSpEv0niuF=wWpp4497Yp5AcnMSeh_SamWnK1QQtw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 16/17] coresight: Emit sink ID in the
	HW_ID packets
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
> For Perf to be able to decode when per-sink trace IDs are used, emit the
> sink that's being written to for each ETM.
>
> Perf currently errors out if it sees a newer packet version so instead
> of bumping it, add a new minor version field. This can be used to
> signify new versions that have backwards compatible fields. Considering
> this change is only for high core count machines, it doesn't make sense
> to make a breaking change for everyone.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  | 26 ++++++++++---------
>  .../hwtracing/coresight/coresight-etm-perf.c  | 16 ++++++++----
>  drivers/hwtracing/coresight/coresight-priv.h  |  1 +
>  include/linux/coresight-pmu.h                 | 17 +++++++++---
>  4 files changed, 39 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index faf560ba8d64..c427e9344a84 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -487,23 +487,25 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
>         return csdev;
>  }
>
> +u32 coresight_get_sink_id(struct coresight_device *csdev)
> +{
> +       if (!csdev->ea)
> +               return 0;
> +
> +       /*
> +        * See function etm_perf_add_symlink_sink() to know where
> +        * this comes from.
> +        */
> +       return (u32) (unsigned long) csdev->ea->var;
> +}
> +
>  static int coresight_sink_by_id(struct device *dev, const void *data)
>  {
>         struct coresight_device *csdev = to_coresight_device(dev);
> -       unsigned long hash;
>
>         if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> -            csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> -
> -               if (!csdev->ea)
> -                       return 0;
> -               /*
> -                * See function etm_perf_add_symlink_sink() to know where
> -                * this comes from.
> -                */
> -               hash = (unsigned long)csdev->ea->var;
> -
> -               if ((u32)hash == *(u32 *)data)
> +           csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> +               if (coresight_get_sink_id(csdev) == *(u32 *)data)
>                         return 1;
>         }
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 70c99f0409b2..ad6a8f4b70b6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -460,6 +460,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>         struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
>         struct list_head *path;
>         u64 hw_id;
> +       u8 trace_id;
>
>         if (!csdev)
>                 goto fail;
> @@ -512,11 +513,16 @@ static void etm_event_start(struct perf_event *event, int flags)
>          */
>         if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
>                 cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> -               hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
> -                                  CS_AUX_HW_ID_CURR_VERSION);
> -               hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
> -                                   coresight_trace_id_read_cpu_id_map(cpu,
> -                                                                      &sink->perf_sink_id_map));
> +
> +               trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
> +
> +               hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
> +                               CS_AUX_HW_ID_MAJOR_VERSION);
> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
> +                               CS_AUX_HW_ID_MINOR_VERSION);
> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
> +
>                 perf_report_aux_output_id(event, hw_id);
>         }
>
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 61a46d3bdcc8..05f891ca6b5c 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -148,6 +148,7 @@ int coresight_make_links(struct coresight_device *orig,
>                          struct coresight_device *target);
>  void coresight_remove_links(struct coresight_device *orig,
>                             struct coresight_connection *conn);
> +u32 coresight_get_sink_id(struct coresight_device *csdev);
>
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>  extern int etm_readl_cp14(u32 off, unsigned int *val);
> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
> index 51ac441a37c3..89b0ac0014b0 100644
> --- a/include/linux/coresight-pmu.h
> +++ b/include/linux/coresight-pmu.h
> @@ -49,12 +49,21 @@
>   * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>   * Used to associate a CPU with the CoreSight Trace ID.
>   * [07:00] - Trace ID - uses 8 bits to make value easy to read in file.
> - * [59:08] - Unused (SBZ)
> - * [63:60] - Version
> + * [39:08] - Sink ID - as reported in /sys/bus/event_source/devices/cs_etm/sinks/
> + *           Added in minor version 1.
> + * [55:40] - Unused (SBZ)
> + * [59:56] - Minor Version - previously existing fields are compatible with
> + *           all minor versions.
> + * [63:60] - Major Version - previously existing fields mean different things
> + *           in new major versions.
>   */
>  #define CS_AUX_HW_ID_TRACE_ID_MASK     GENMASK_ULL(7, 0)
> -#define CS_AUX_HW_ID_VERSION_MASK      GENMASK_ULL(63, 60)
> +#define CS_AUX_HW_ID_SINK_ID_MASK      GENMASK_ULL(39, 8)
>
> -#define CS_AUX_HW_ID_CURR_VERSION 0
> +#define CS_AUX_HW_ID_MINOR_VERSION_MASK        GENMASK_ULL(59, 56)
> +#define CS_AUX_HW_ID_MAJOR_VERSION_MASK        GENMASK_ULL(63, 60)
> +
> +#define CS_AUX_HW_ID_MAJOR_VERSION 0
> +#define CS_AUX_HW_ID_MINOR_VERSION 1
>
>  #endif
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
