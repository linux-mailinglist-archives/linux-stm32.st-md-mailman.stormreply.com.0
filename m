Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AF89378AC
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2024 15:45:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F4FC7801B;
	Fri, 19 Jul 2024 13:45:57 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88348C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 13:45:49 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-78006198aeeso1229792a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721396748; x=1722001548;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q6DEEhmg3Ja8v8Rv8CzrLy7ke/9Hd5uw1xozBhzNHkw=;
 b=IDk/npAnxCe+9gXJhUze5h6HTgvsOSPj9HAlLO9WVv1fXXk01Cl7vRNl3eAtitzU90
 3N4mNVB2DR+SJDIxyaEI36RxeGJWOZ5Y6nUAxjrO5N3aUYI8BNddrwN7GCLQao07c/Zx
 2Ms8o1oYw3WFemc9eHi/b4yTzR/CLJyehg+b1atKYgGYfkRi/43ZQeNVA0cCqyxqNbvl
 LZqQP7THlSqdyAuM9+Wx8BMzetKDfxt9qgf6YtNc31E7UDDeG3HRJBCYxFAcOeGazYea
 tBQkdFma020YTphr5Ok2RwlGDiZslTaj2hKLrPtZ797B3IG9rbonFjpXVrefWEnug04K
 t+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721396748; x=1722001548;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q6DEEhmg3Ja8v8Rv8CzrLy7ke/9Hd5uw1xozBhzNHkw=;
 b=IHY0G9N9qUsd79274csjXbLGi8tWxcFwSFqT4RWpdR71dciYEJFnxC2TDdIysj/1mc
 SNDHrb4X0dYxCfGFAFcXroV0oWrILu81OyN6UfnNG7Rdi7GjL7/ZpPQNAlANI+RX9IaR
 FtN+Sz9hz2s8NfFk9tamnRQZfp7XlGH2hP3psoQhnY3YIvYLpoAB9ukUmn68fGA+UGT7
 KAfCitYw9PwK2cjGwTRGUcbEZ0z8i/LOQNpVmidIKT8NjKV40HAvUQEy2srjNeDFT8/f
 6MmSZ0FBljW5G66efSJZr0jkbBsGbnWbYp55MQ78Qx5eoWfZqbjGi0AOWC0/gWqrbrxg
 BdEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKdP8x0dEoEj9fRi0ksxAfs4tkLSXD+/nzN4BFllSZ10X6QT/aRjHLcD7+aKsJ/uUkO6XME9xwcVdRl2sTN/SIEmZ2qvrGWyPaO7q8CBpndHD4nETcmUBG
X-Gm-Message-State: AOJu0YzVCNx9Jg45dIr4IGqZkgZ/Kgv4XmbJLFl4B0wEO9AF6NdxcZKP
 HnmlxuQ1+bKW1TrPay5z57Z9mwd+cohUFZ4zm6uSuHM+bTfyKc7Mtr3OnXMTeCzLANiCsqpRtPm
 53vSp/kE2h25W598/4dLEDqRgFnhLFwMMdCRCmg==
X-Google-Smtp-Source: AGHT+IHj7uX+1Re/rIAYxBvigyoyeQGRk9F0raS6FKUXjFDmNWxKntMHg6PQf2i+kUZS8oSEapT4/bKdOJe8lE0sWx0=
X-Received: by 2002:a17:90b:4d84:b0:2c8:f3b5:7dd1 with SMTP id
 98e67ed59e1d1-2cb779d0b7dmr6684082a91.16.1721396747944; Fri, 19 Jul 2024
 06:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-7-james.clark@linaro.org>
 <CAJ9a7Vgz-rP6kGLLo2RR_qSZ3dhBT+=E8S=z1Hj6pfwOYu06Nw@mail.gmail.com>
 <ef5e7351-5f62-444a-b930-4dc2feb9f10d@linaro.org>
 <26262a1f-de49-41de-85bf-0640c6cc6bd2@linaro.org>
In-Reply-To: <26262a1f-de49-41de-85bf-0640c6cc6bd2@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 19 Jul 2024 14:45:36 +0100
Message-ID: <CAJ9a7VhL18eWFw6T6HdrhbY_v8oeyuzM62D1w1CO1Psumb-EBQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 06/17] perf: cs-etm: Support version
	0.1 of HW_ID packets
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

Fair enough - less worried about the ordering as the final :

else
     return fn()
}

where there's no unconditional return at the end of the function. The
last else looks redundant to me. More a stylistic thing, not sure if
there is a hard and fast rule either way

Mike



On Fri, 19 Jul 2024 at 11:49, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 19/07/2024 11:48 am, James Clark wrote:
> >
> >
> > On 18/07/2024 2:24 pm, Mike Leach wrote:
> >> On Fri, 12 Jul 2024 at 11:22, James Clark <james.clark@linaro.org> wrote:
> >>>
> >>> From: James Clark <james.clark@arm.com>
> >>>
> >>> v0.1 HW_ID packets have a new field that describes which sink each CPU
> >>> writes to. Use the sink ID to link trace ID maps to each other so that
> >>> mappings are shared wherever the sink is shared.
> >>>
> >>> Also update the error message to show that overlapping IDs aren't an
> >>> error in per-thread mode, just not supported. In the future we can
> >>> use the CPU ID from the AUX records, or watch for changing sink IDs on
> >>> HW_ID packets to use the correct decoders.
> >>>
> >>> Signed-off-by: James Clark <james.clark@arm.com>
> >>> Signed-off-by: James Clark <james.clark@linaro.org>
> >>> ---
> >>>   tools/include/linux/coresight-pmu.h |  17 +++--
> >>>   tools/perf/util/cs-etm.c            | 100 +++++++++++++++++++++++++---
> >>>   2 files changed, 103 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/tools/include/linux/coresight-pmu.h
> >>> b/tools/include/linux/coresight-pmu.h
> >>> index 51ac441a37c3..89b0ac0014b0 100644
> >>> --- a/tools/include/linux/coresight-pmu.h
> >>> +++ b/tools/include/linux/coresight-pmu.h
> >>> @@ -49,12 +49,21 @@
> >>>    * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
> >>>    * Used to associate a CPU with the CoreSight Trace ID.
> >>>    * [07:00] - Trace ID - uses 8 bits to make value easy to read in
> >>> file.
> >>> - * [59:08] - Unused (SBZ)
> >>> - * [63:60] - Version
> >>> + * [39:08] - Sink ID - as reported in
> >>> /sys/bus/event_source/devices/cs_etm/sinks/
> >>> + *           Added in minor version 1.
> >>> + * [55:40] - Unused (SBZ)
> >>> + * [59:56] - Minor Version - previously existing fields are
> >>> compatible with
> >>> + *           all minor versions.
> >>> + * [63:60] - Major Version - previously existing fields mean
> >>> different things
> >>> + *           in new major versions.
> >>>    */
> >>>   #define CS_AUX_HW_ID_TRACE_ID_MASK     GENMASK_ULL(7, 0)
> >>> -#define CS_AUX_HW_ID_VERSION_MASK      GENMASK_ULL(63, 60)
> >>> +#define CS_AUX_HW_ID_SINK_ID_MASK      GENMASK_ULL(39, 8)
> >>>
> >>> -#define CS_AUX_HW_ID_CURR_VERSION 0
> >>> +#define CS_AUX_HW_ID_MINOR_VERSION_MASK        GENMASK_ULL(59, 56)
> >>> +#define CS_AUX_HW_ID_MAJOR_VERSION_MASK        GENMASK_ULL(63, 60)
> >>> +
> >>> +#define CS_AUX_HW_ID_MAJOR_VERSION 0
> >>> +#define CS_AUX_HW_ID_MINOR_VERSION 1
> >>>
> >>>   #endif
> >>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> >>> index 954a6f7bedf3..87e983da19be 100644
> >>> --- a/tools/perf/util/cs-etm.c
> >>> +++ b/tools/perf/util/cs-etm.c
> >>> @@ -118,6 +118,12 @@ struct cs_etm_queue {
> >>>          struct cs_etm_traceid_queue **traceid_queues;
> >>>          /* Conversion between traceID and metadata pointers */
> >>>          struct intlist *traceid_list;
> >>> +       /*
> >>> +        * Same as traceid_list, but traceid_list may be a reference
> >>> to another
> >>> +        * queue's which has a matching sink ID.
> >>> +        */
> >>> +       struct intlist *own_traceid_list;
> >>> +       u32 sink_id;
> >>>   };
> >>>
> >>>   static int cs_etm__process_timestamped_queues(struct
> >>> cs_etm_auxtrace *etm);
> >>> @@ -142,6 +148,7 @@ static int cs_etm__metadata_set_trace_id(u8
> >>> trace_chan_id, u64 *cpu_metadata);
> >>>                        (queue_nr << 16 | trace_chan_id)
> >>>   #define TO_QUEUE_NR(cs_queue_nr) (cs_queue_nr >> 16)
> >>>   #define TO_TRACE_CHAN_ID(cs_queue_nr) (cs_queue_nr & 0x0000ffff)
> >>> +#define SINK_UNSET ((u32) -1)
> >>>
> >>>   static u32 cs_etm__get_v7_protocol_version(u32 etmidr)
> >>>   {
> >>> @@ -241,7 +248,16 @@ static int cs_etm__insert_trace_id_node(struct
> >>> cs_etm_queue *etmq,
> >>>                  int err;
> >>>
> >>>                  if (curr_cpu_data[CS_ETM_CPU] !=
> >>> cpu_metadata[CS_ETM_CPU]) {
> >>> -                       pr_err("CS_ETM: map mismatch between HW_ID
> >>> packet CPU and Trace ID\n");
> >>> +                       /*
> >>> +                        * With > CORESIGHT_TRACE_IDS_MAX ETMs,
> >>> overlapping IDs
> >>> +                        * are expected (but not supported) in
> >>> per-thread mode,
> >>> +                        * rather than signifying an error.
> >>> +                        */
> >>> +                       if (etmq->etm->per_thread_decoding)
> >>> +                               pr_err("CS_ETM: overlapping Trace IDs
> >>> aren't currently supported in per-thread mode\n");
> >>> +                       else
> >>> +                               pr_err("CS_ETM: map mismatch between
> >>> HW_ID packet CPU and Trace ID\n");
> >>> +
> >>>                          return -EINVAL;
> >>>                  }
> >>>
> >>> @@ -326,6 +342,64 @@ static int cs_etm__process_trace_id_v0(struct
> >>> cs_etm_auxtrace *etm, int cpu,
> >>>          return cs_etm__metadata_set_trace_id(trace_chan_id, cpu_data);
> >>>   }
> >>>
> >>> +static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace
> >>> *etm, int cpu,
> >>> +                                        u64 hw_id)
> >>> +{
> >>> +       struct cs_etm_queue *etmq = cs_etm__get_queue(etm, cpu);
> >>> +       int ret;
> >>> +       u64 *cpu_data;
> >>> +       u32 sink_id = FIELD_GET(CS_AUX_HW_ID_SINK_ID_MASK, hw_id);
> >>> +       u8 trace_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
> >>> +
> >>> +       /*
> >>> +        * Check sink id hasn't changed in per-cpu mode. In
> >>> per-thread mode,
> >>> +        * let it pass for now until an actual overlapping trace ID
> >>> is hit. In
> >>> +        * most cases IDs won't overlap even if the sink changes.
> >>> +        */
> >>> +       if (!etmq->etm->per_thread_decoding && etmq->sink_id !=
> >>> SINK_UNSET &&
> >>> +           etmq->sink_id != sink_id) {
> >>> +               pr_err("CS_ETM: mismatch between sink IDs\n");
> >>> +               return -EINVAL;
> >>> +       }
> >>> +
> >>> +       etmq->sink_id = sink_id;
> >>> +
> >>> +       /* Find which other queues use this sink and link their ID
> >>> maps */
> >>> +       for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
> >>> +               struct cs_etm_queue *other_etmq =
> >>> etm->queues.queue_array[i].priv;
> >>> +
> >>> +               /* Different sinks, skip */
> >>> +               if (other_etmq->sink_id != etmq->sink_id)
> >>> +                       continue;
> >>> +
> >>> +               /* Already linked, skip */
> >>> +               if (other_etmq->traceid_list == etmq->traceid_list)
> >>> +                       continue;
> >>> +
> >>> +               /* At the point of first linking, this one should be
> >>> empty */
> >>> +               if (!intlist__empty(etmq->traceid_list)) {
> >>> +                       pr_err("CS_ETM: Can't link populated trace ID
> >>> lists\n");
> >>> +                       return -EINVAL;
> >>> +               }
> >>> +
> >>> +               etmq->own_traceid_list = NULL;
> >>> +               intlist__delete(etmq->traceid_list);
> >>> +               etmq->traceid_list = other_etmq->traceid_list;
> >>> +               break;
> >>> +       }
> >>> +
> >>> +       cpu_data = get_cpu_data(etm, cpu);
> >>> +       ret = cs_etm__insert_trace_id_node(etmq, trace_id, cpu_data);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret = cs_etm__metadata_set_trace_id(trace_id, cpu_data);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>>   static int cs_etm__metadata_get_trace_id(u8 *trace_chan_id, u64
> >>> *cpu_metadata)
> >>>   {
> >>>          u64 cs_etm_magic = cpu_metadata[CS_ETM_MAGIC];
> >>> @@ -414,10 +488,10 @@ static int
> >>> cs_etm__process_aux_output_hw_id(struct perf_session *session,
> >>>
> >>>          /* extract and parse the HW ID */
> >>>          hw_id = event->aux_output_hw_id.hw_id;
> >>> -       version = FIELD_GET(CS_AUX_HW_ID_VERSION_MASK, hw_id);
> >>> +       version = FIELD_GET(CS_AUX_HW_ID_MAJOR_VERSION_MASK, hw_id);
> >>>
> >>>          /* check that we can handle this version */
> >>> -       if (version > CS_AUX_HW_ID_CURR_VERSION) {
> >>> +       if (version > CS_AUX_HW_ID_MAJOR_VERSION) {
> >>>                  pr_err("CS ETM Trace: PERF_RECORD_AUX_OUTPUT_HW_ID
> >>> version %d not supported. Please update Perf.\n",
> >>>                         version);
> >>>                  return -EINVAL;
> >>> @@ -442,7 +516,10 @@ static int
> >>> cs_etm__process_aux_output_hw_id(struct perf_session *session,
> >>>                  return -EINVAL;
> >>>          }
> >>>
> >>> -       return cs_etm__process_trace_id_v0(etm, cpu, hw_id);
> >>
> >> Perhaps leave this as the final statement of the function
> >>
> >>> +       if (FIELD_GET(CS_AUX_HW_ID_MINOR_VERSION_MASK, hw_id) == 0)
> >>
> >> this could be moved before and be
> >>
> >> if (FIELD_GET(CS_AUX_HW_ID_MINOR_VERSION_MASK, hw_id) == 1)
> >>                 return cs_etm__process_trace_id_v0_1(etm, cpu, hw_id);
> >>
> >>
> >
> > Because I was intending minor version changes to be backwards compatible
> > I have it so that any value other than 0 is treated as v0.1. Otherwise
> > version updates will break old versions of Perf. And then if we added a
> > v0.3 it would look like this:
>
> That should have said v0.2 ^
>
> >
> >   if (FIELD_GET(CS_AUX_HW_ID_MINOR_VERSION_MASK, hw_id) == 0)
> >     return cs_etm__process_trace_id_v0(etm, cpu, hw_id);
> >   else if (FIELD_GET(CS_AUX_HW_ID_MINOR_VERSION_MASK, hw_id) == 1)
> >     return cs_etm__process_trace_id_v0_1(etm, cpu, hw_id);
> >   else
> >     return cs_etm__process_trace_id_v0_2(etm, cpu, hw_id);
> >
> > Based on that I'm not sure if you still think it should be changed?



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
