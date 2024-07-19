Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D1937616
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2024 11:48:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F256C7801A;
	Fri, 19 Jul 2024 09:48:22 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46D9BC78019
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 09:48:15 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70b4a8a5587so464166b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721382494; x=1721987294;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VhF0cG7sJRagtSnZoHiXdHI0K7iHrCSIlDJ8BuG+ZkI=;
 b=iWr6pQKSBcXmGvqrHOLwjquGZ5hWKdvGdshRhEh5tJrPGGyl2iWoOCDAgYJXd88Q7C
 Q0HzxPJIv5r9puqvYwy4uzn3D4a9tMvD8fGy1OqR5E3+nhZKlMEOKi/XyLV9fl2CT1Tl
 TubC0DpHyrq79bskVmScFiCDklFCPEMMOsYO+1hSw4yCWsla5/3g/kVG/Iiu3rpgutpy
 CIPRbirswyKKmx2Wle7xiCzxvCW57JnOtvWBhiPH5BVD3FEar51Nj24lrhO3P+M6lyhj
 xA6TDvWIogNM0YId1HHnxKvdlo9KA9OtiEgAFpadUkQsuiHCNEZtf/fxFxC3nZzCaNWX
 jJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721382494; x=1721987294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VhF0cG7sJRagtSnZoHiXdHI0K7iHrCSIlDJ8BuG+ZkI=;
 b=WkUZ8r0biXxKtiqRc4lnayTf0wWGZlCmewhkObHM8YMrFG9Trk7RLP9brubVIPZP+O
 QvAPJ9qmt0aBUQ2JZnWQCLYTT5zDB2aQtQ5kl3PJJBAbJRRi1pWpcvl/K/zn0EU68E3j
 m/DQOlJWmxQzfUJDwOSkudLe2e9eYtIjMA+3rcZBGpjMY4ErC20yXnvJZmoX1zqmmwD5
 6217eLD3alG8y13v/wDFfARHhFMfOWZqZPW7xtIX4HpNm0KOJGEjt24O++4a1F/1fZit
 myrqoeQhrpmw/rQgka3UGxXeRPrYn4i8LMIxql9Nvq3pcF6RHZEA7Q4yvFf6yi9RS43S
 hhpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOg+N4rLpz1rIm58P3fpKV64jTVBbggS+2Yb7nZ3r6pHbg1pCj+qObXhd3sDe6Sq5jZYCrdtVSvSxW1Cs00xh2XGKlTDKrgOI4aPfxlxn/4eL5w6qr/wTt
X-Gm-Message-State: AOJu0YybD7G2R5O3vI8WZLsj+7gi66ACTB8Va7AU1TqjVi2wnwPHTZhQ
 w9ehzO5/X12zW1pppM1uwEbvYyzZ/Rm7ww7w4qbUfPIPI/mXaIYiRLUzFRya2D3N+3OUJrIPF6f
 gxjCP3HcqGJt7jnScc2DlDCgWSNL/hNjHAoktug==
X-Google-Smtp-Source: AGHT+IHcgE/Y9hI4BdyGlcUQ74l1W4Cc3qlxjGfyBSOFidXWRgWEk1+LeD0CU6f5+lT4z1P3UEG/is9BsEE60bvH2tc=
X-Received: by 2002:a05:6a00:17a1:b0:70b:1c7e:829a with SMTP id
 d2e1a72fcca58-70ce503ea93mr9291348b3a.32.1721382493696; Fri, 19 Jul 2024
 02:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-17-james.clark@linaro.org>
 <CAJ9a7ViwpDSpEv0niuF=wWpp4497Yp5AcnMSeh_SamWnK1QQtw@mail.gmail.com>
 <3b2285e0-3ac2-448a-8a53-c1bb6ead78b8@linaro.org>
In-Reply-To: <3b2285e0-3ac2-448a-8a53-c1bb6ead78b8@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 19 Jul 2024 10:48:02 +0100
Message-ID: <CAJ9a7VgQ5JfxObZpxbQdiEciOjkuijH98HFfdFVK4qkn7qbNUQ@mail.gmail.com>
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

Indeed! missed out the:

Reviewed-by: Mike Leach <mike.leach@linaro.org>

On Fri, 19 Jul 2024 at 10:29, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 17/07/2024 4:03 pm, Mike Leach wrote:
> > On Fri, 12 Jul 2024 at 11:23, James Clark <james.clark@linaro.org> wrote:
> >>
> >> From: James Clark <james.clark@arm.com>
> >>
> >> For Perf to be able to decode when per-sink trace IDs are used, emit the
> >> sink that's being written to for each ETM.
> >>
> >> Perf currently errors out if it sees a newer packet version so instead
> >> of bumping it, add a new minor version field. This can be used to
> >> signify new versions that have backwards compatible fields. Considering
> >> this change is only for high core count machines, it doesn't make sense
> >> to make a breaking change for everyone.
> >>
> >> Signed-off-by: James Clark <james.clark@arm.com>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> ---
> >>   drivers/hwtracing/coresight/coresight-core.c  | 26 ++++++++++---------
> >>   .../hwtracing/coresight/coresight-etm-perf.c  | 16 ++++++++----
> >>   drivers/hwtracing/coresight/coresight-priv.h  |  1 +
> >>   include/linux/coresight-pmu.h                 | 17 +++++++++---
> >>   4 files changed, 39 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> >> index faf560ba8d64..c427e9344a84 100644
> >> --- a/drivers/hwtracing/coresight/coresight-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-core.c
> >> @@ -487,23 +487,25 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
> >>          return csdev;
> >>   }
> >>
> >> +u32 coresight_get_sink_id(struct coresight_device *csdev)
> >> +{
> >> +       if (!csdev->ea)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * See function etm_perf_add_symlink_sink() to know where
> >> +        * this comes from.
> >> +        */
> >> +       return (u32) (unsigned long) csdev->ea->var;
> >> +}
> >> +
> >>   static int coresight_sink_by_id(struct device *dev, const void *data)
> >>   {
> >>          struct coresight_device *csdev = to_coresight_device(dev);
> >> -       unsigned long hash;
> >>
> >>          if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> >> -            csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> >> -
> >> -               if (!csdev->ea)
> >> -                       return 0;
> >> -               /*
> >> -                * See function etm_perf_add_symlink_sink() to know where
> >> -                * this comes from.
> >> -                */
> >> -               hash = (unsigned long)csdev->ea->var;
> >> -
> >> -               if ((u32)hash == *(u32 *)data)
> >> +           csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> >> +               if (coresight_get_sink_id(csdev) == *(u32 *)data)
> >>                          return 1;
> >>          }
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> index 70c99f0409b2..ad6a8f4b70b6 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> >> @@ -460,6 +460,7 @@ static void etm_event_start(struct perf_event *event, int flags)
> >>          struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
> >>          struct list_head *path;
> >>          u64 hw_id;
> >> +       u8 trace_id;
> >>
> >>          if (!csdev)
> >>                  goto fail;
> >> @@ -512,11 +513,16 @@ static void etm_event_start(struct perf_event *event, int flags)
> >>           */
> >>          if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
> >>                  cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> >> -               hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
> >> -                                  CS_AUX_HW_ID_CURR_VERSION);
> >> -               hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
> >> -                                   coresight_trace_id_read_cpu_id_map(cpu,
> >> -                                                                      &sink->perf_sink_id_map));
> >> +
> >> +               trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
> >> +
> >> +               hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
> >> +                               CS_AUX_HW_ID_MAJOR_VERSION);
> >> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
> >> +                               CS_AUX_HW_ID_MINOR_VERSION);
> >> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
> >> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
> >> +
> >>                  perf_report_aux_output_id(event, hw_id);
> >>          }
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> >> index 61a46d3bdcc8..05f891ca6b5c 100644
> >> --- a/drivers/hwtracing/coresight/coresight-priv.h
> >> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> >> @@ -148,6 +148,7 @@ int coresight_make_links(struct coresight_device *orig,
> >>                           struct coresight_device *target);
> >>   void coresight_remove_links(struct coresight_device *orig,
> >>                              struct coresight_connection *conn);
> >> +u32 coresight_get_sink_id(struct coresight_device *csdev);
> >>
> >>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
> >>   extern int etm_readl_cp14(u32 off, unsigned int *val);
> >> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
> >> index 51ac441a37c3..89b0ac0014b0 100644
> >> --- a/include/linux/coresight-pmu.h
> >> +++ b/include/linux/coresight-pmu.h
> >> @@ -49,12 +49,21 @@
> >>    * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
> >>    * Used to associate a CPU with the CoreSight Trace ID.
> >>    * [07:00] - Trace ID - uses 8 bits to make value easy to read in file.
> >> - * [59:08] - Unused (SBZ)
> >> - * [63:60] - Version
> >> + * [39:08] - Sink ID - as reported in /sys/bus/event_source/devices/cs_etm/sinks/
> >> + *           Added in minor version 1.
> >> + * [55:40] - Unused (SBZ)
> >> + * [59:56] - Minor Version - previously existing fields are compatible with
> >> + *           all minor versions.
> >> + * [63:60] - Major Version - previously existing fields mean different things
> >> + *           in new major versions.
> >>    */
> >>   #define CS_AUX_HW_ID_TRACE_ID_MASK     GENMASK_ULL(7, 0)
> >> -#define CS_AUX_HW_ID_VERSION_MASK      GENMASK_ULL(63, 60)
> >> +#define CS_AUX_HW_ID_SINK_ID_MASK      GENMASK_ULL(39, 8)
> >>
> >> -#define CS_AUX_HW_ID_CURR_VERSION 0
> >> +#define CS_AUX_HW_ID_MINOR_VERSION_MASK        GENMASK_ULL(59, 56)
> >> +#define CS_AUX_HW_ID_MAJOR_VERSION_MASK        GENMASK_ULL(63, 60)
> >> +
> >> +#define CS_AUX_HW_ID_MAJOR_VERSION 0
> >> +#define CS_AUX_HW_ID_MINOR_VERSION 1
> >>
> >>   #endif
> >> --
> >> 2.34.1
> >>
> >
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK
>
> Hi Mike,
>
> I think you miss-sent this one
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
