Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C1934E0F
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2024 15:24:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 851A8C78015;
	Thu, 18 Jul 2024 13:24:15 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A6AFC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 13:24:07 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-70b7a528331so482890b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721309046; x=1721913846;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hm88ybnlRpWp2Bwsjgn9/+uKNcoHg2nCwSnwB0+aNUo=;
 b=zMiHGXNTZdyC4sc2imOyeBOuvhNPoXgSQQu2Xzlx+Jt9/JtqWJLx6yq/Vfw57uojJa
 nambg2qJs1zt5oquDU+z3ofKRgNUJNsmf2GLm9hpIxxW/sNbW9iMwphCgmrf3hb4GQbh
 46C1U3jlHGjgiOzdGxbLx9bHzoaMMVAKHG/PEyo4ZsJ+e1B9CP6XA0XNHSTv9wAiK/TN
 JgBdhf+HjAp1pxOlGqmlbP5OKOEsyAN/m/sxBdRwbDgemtPziTzQP545unFdRzotqwfV
 mbdtdg7hyW332/ycXzhqDn7uc0BumjO8KpUnAdVcUyU24dPO7822z5FBYMjFpsctlbUw
 3lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721309046; x=1721913846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hm88ybnlRpWp2Bwsjgn9/+uKNcoHg2nCwSnwB0+aNUo=;
 b=Tte+Hi1vEuTgo6sdLK4/Cx915gamcAK33OuCh489q0hQuf+PX3k7gv8WAW5MfVqsY4
 52yaMFG2kJzDUsCkIPOYtK1GV9Uwl9Iq9UKsVkxYw1hEHuMjaKTtlMj8foJqkY6oc5yK
 JVrARG4veqxUlLNYFvJ3x/n76Cb/EPvIGJVfdLNgb4XLUqwNGLltk9BTLyU9OmJXqmIq
 7RrvJQgd+TMBAAT2BlBCiek8Fj11KXeCjINZbzYgGQKWBQ0Tx+kC3Wis+rfbVOWv7nmS
 puqLosvk0y/idSNCNkxDlAp+ClLbEUDXlIk0jWJi8W2ns7NlbJmotXwkzzAjcqA+pgYF
 JOww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6k7HlVFJXZ9fqMXH+HHqDzTKBtUB1FA/+NrtWbnAiejTgT4pRthMiUuBKVYTFYO1fVZZo9blRyZCr7zBoBq/nusp/Dd70TpqZmvJ45hWcnRLkdbGsQFW6
X-Gm-Message-State: AOJu0Yyn3vbFNLVKsGap6/1xWgVaLp3bDfWu4XLugGsmNrdceitYc1Tc
 ShutetDCSpBguEbbhgEmH/w1nZ0AGnanAb/fATIW/pL1/f8CojCWhPVpkc5aEA9ygDhUKTrA0d4
 oKTB2jqUqWmSzZjsaQs3k3mNRUb+BVhsDAm89GQ==
X-Google-Smtp-Source: AGHT+IFPvwoNSLTasaNmqxV7AmTqzFrgIWadO8xGjmrpuxViZ7fcSGK1tqNo7Iw7bAFkR6iSe1eg0vIHuxMtofemwqA=
X-Received: by 2002:a05:6a00:10c1:b0:706:616d:2216 with SMTP id
 d2e1a72fcca58-70ce4ffb0d2mr5793406b3a.17.1721309045913; Thu, 18 Jul 2024
 06:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-2-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-2-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 18 Jul 2024 14:23:54 +0100
Message-ID: <CAJ9a7VhrM-=aDNGUUDz0+-d6UmwFNaErPXm6v5nPopet0KctcQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 01/17] perf: cs-etm: Create decoders
 after both AUX and HW_ID search passes
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

On Fri, 12 Jul 2024 at 11:22, James Clark <james.clark@linaro.org> wrote:
>
> From: James Clark <james.clark@arm.com>
>
> Both of these passes gather information about how to create the
> decoders. AUX records determine formatted/unformatted, and the HW_IDs
> determine the traceID/metadata mappings. Therefore it makes sense to
> cache the information and wait until both passes are over until creating
> the decoders, rather than creating them at the first HW_ID found. This
> will allow a simplification of the creation process where
> cs_etm_queue->traceid_list will exclusively used to create the decoders,
> rather than the current two methods depending on whether the trace is
> formatted or not.
>
> Previously the sample CPU from the AUX record was used to initialize
> the decoder CPU, but actually sample CPU == AUX queue index in per-CPU
> mode, so saving the sample CPU isn't required. Similarly
> formatted/unformatted was used upfront to create the decoders, but now
> it's cached until later.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/cs-etm.c | 167 ++++++++++++++++++++++++---------------
>  1 file changed, 102 insertions(+), 65 deletions(-)
>
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 32818bd7cd17..f09004c4ba44 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -103,6 +103,7 @@ struct cs_etm_queue {
>         struct auxtrace_buffer *buffer;
>         unsigned int queue_nr;
>         u8 pending_timestamp_chan_id;
> +       bool formatted;
>         u64 offset;
>         const unsigned char *buf;
>         size_t buf_len, buf_used;
> @@ -738,8 +739,7 @@ static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
>
>  static int cs_etm__init_decoder_params(struct cs_etm_decoder_params *d_params,
>                                        struct cs_etm_queue *etmq,
> -                                      enum cs_etm_decoder_operation mode,
> -                                      bool formatted)
> +                                      enum cs_etm_decoder_operation mode)
>  {
>         int ret = -EINVAL;
>
> @@ -749,7 +749,7 @@ static int cs_etm__init_decoder_params(struct cs_etm_decoder_params *d_params,
>         d_params->packet_printer = cs_etm__packet_dump;
>         d_params->operation = mode;
>         d_params->data = etmq;
> -       d_params->formatted = formatted;
> +       d_params->formatted = etmq->formatted;
>         d_params->fsyncs = false;
>         d_params->hsyncs = false;
>         d_params->frame_aligned = true;
> @@ -1041,81 +1041,34 @@ static u32 cs_etm__mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
>         return ret;
>  }
>
> -static struct cs_etm_queue *cs_etm__alloc_queue(struct cs_etm_auxtrace *etm,
> -                                               bool formatted, int sample_cpu)
> +static struct cs_etm_queue *cs_etm__alloc_queue(void)
>  {
> -       struct cs_etm_decoder_params d_params;
> -       struct cs_etm_trace_params  *t_params = NULL;
> -       struct cs_etm_queue *etmq;
> -       /*
> -        * Each queue can only contain data from one CPU when unformatted, so only one decoder is
> -        * needed.
> -        */
> -       int decoders = formatted ? etm->num_cpu : 1;
> -
> -       etmq = zalloc(sizeof(*etmq));
> +       struct cs_etm_queue *etmq = zalloc(sizeof(*etmq));
>         if (!etmq)
>                 return NULL;
>
>         etmq->traceid_queues_list = intlist__new(NULL);
>         if (!etmq->traceid_queues_list)
> -               goto out_free;
> -
> -       /* Use metadata to fill in trace parameters for trace decoder */
> -       t_params = zalloc(sizeof(*t_params) * decoders);
> +               free(etmq);
>
> -       if (!t_params)
> -               goto out_free;
> -
> -       if (cs_etm__init_trace_params(t_params, etm, formatted, sample_cpu, decoders))
> -               goto out_free;
> -
> -       /* Set decoder parameters to decode trace packets */
> -       if (cs_etm__init_decoder_params(&d_params, etmq,
> -                                       dump_trace ? CS_ETM_OPERATION_PRINT :
> -                                                    CS_ETM_OPERATION_DECODE,
> -                                       formatted))
> -               goto out_free;
> -
> -       etmq->decoder = cs_etm_decoder__new(decoders, &d_params,
> -                                           t_params);
> -
> -       if (!etmq->decoder)
> -               goto out_free;
> -
> -       /*
> -        * Register a function to handle all memory accesses required by
> -        * the trace decoder library.
> -        */
> -       if (cs_etm_decoder__add_mem_access_cb(etmq->decoder,
> -                                             0x0L, ((u64) -1L),
> -                                             cs_etm__mem_access))
> -               goto out_free_decoder;
> -
> -       zfree(&t_params);
>         return etmq;
> -
> -out_free_decoder:
> -       cs_etm_decoder__free(etmq->decoder);
> -out_free:
> -       intlist__delete(etmq->traceid_queues_list);
> -       free(etmq);
> -
> -       return NULL;
>  }
>
>  static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
>                                struct auxtrace_queue *queue,
> -                              unsigned int queue_nr,
> -                              bool formatted,
> -                              int sample_cpu)
> +                              unsigned int queue_nr, bool formatted)
>  {
>         struct cs_etm_queue *etmq = queue->priv;
>
> +       if (etmq && formatted != etmq->formatted) {
> +               pr_err("CS_ETM: mixed formatted and unformatted trace not supported\n");
> +               return -EINVAL;
> +       }
> +
>         if (list_empty(&queue->head) || etmq)
>                 return 0;
>
> -       etmq = cs_etm__alloc_queue(etm, formatted, sample_cpu);
> +       etmq = cs_etm__alloc_queue();
>
>         if (!etmq)
>                 return -ENOMEM;
> @@ -1123,7 +1076,9 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
>         queue->priv = etmq;
>         etmq->etm = etm;
>         etmq->queue_nr = queue_nr;
> +       queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
>         etmq->offset = 0;
> +       etmq->formatted = formatted;
>
>         return 0;
>  }
> @@ -2843,7 +2798,7 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
>                  * formatted in piped mode (true).
>                  */
>                 err = cs_etm__setup_queue(etm, &etm->queues.queue_array[idx],
> -                                         idx, true, -1);
> +                                         idx, true);
>                 if (err)
>                         return err;
>
> @@ -3048,8 +3003,8 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>
>                 idx = auxtrace_event->idx;
>                 formatted = !(aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
> -               return cs_etm__setup_queue(etm, &etm->queues.queue_array[idx],
> -                                          idx, formatted, sample->cpu);
> +
> +               return cs_etm__setup_queue(etm, &etm->queues.queue_array[idx], idx, formatted);
>         }
>
>         /* Wasn't inside this buffer, but there were no parse errors. 1 == 'not found' */
> @@ -3233,6 +3188,84 @@ static int cs_etm__clear_unused_trace_ids_metadata(int num_cpu, u64 **metadata)
>         return 0;
>  }
>
> +/*
> + * Use the data gathered by the peeks for HW_ID (trace ID mappings) and AUX
> + * (formatted or not) packets to create the decoders.
> + */
> +static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
> +{
> +       struct cs_etm_decoder_params d_params;
> +
> +       /*
> +        * Each queue can only contain data from one CPU when unformatted, so only one decoder is
> +        * needed.
> +        */
> +       int decoders = etmq->formatted ? etmq->etm->num_cpu : 1;
> +
> +       /* Use metadata to fill in trace parameters for trace decoder */
> +       struct cs_etm_trace_params  *t_params = zalloc(sizeof(*t_params) * decoders);
> +
> +       if (!t_params)
> +               goto out_free;
> +
> +       if (cs_etm__init_trace_params(t_params, etmq->etm, etmq->formatted,
> +                                     etmq->queue_nr, decoders))
> +               goto out_free;
> +
> +       /* Set decoder parameters to decode trace packets */
> +       if (cs_etm__init_decoder_params(&d_params, etmq,
> +                                       dump_trace ? CS_ETM_OPERATION_PRINT :
> +                                                    CS_ETM_OPERATION_DECODE))
> +               goto out_free;
> +
> +       etmq->decoder = cs_etm_decoder__new(decoders, &d_params,
> +                                           t_params);
> +
> +       if (!etmq->decoder)
> +               goto out_free;
> +
> +       /*
> +        * Register a function to handle all memory accesses required by
> +        * the trace decoder library.
> +        */
> +       if (cs_etm_decoder__add_mem_access_cb(etmq->decoder,
> +                                             0x0L, ((u64) -1L),
> +                                             cs_etm__mem_access))
> +               goto out_free_decoder;
> +
> +       zfree(&t_params);
> +       return 0;
> +
> +out_free_decoder:
> +       cs_etm_decoder__free(etmq->decoder);
> +out_free:
> +       zfree(&t_params);
> +       return -EINVAL;
> +}
> +
> +static int cs_etm__create_decoders(struct cs_etm_auxtrace *etm)
> +{
> +       struct auxtrace_queues *queues = &etm->queues;
> +
> +       for (unsigned int i = 0; i < queues->nr_queues; i++) {
> +               bool empty = list_empty(&queues->queue_array[i].head);
> +               struct cs_etm_queue *etmq = queues->queue_array[i].priv;
> +               int ret;
> +
> +               /*
> +                * Don't create decoders for empty queues, mainly because
> +                * etmq->formatted is unknown for empty queues.
> +                */
> +               if (empty)
> +                       continue;
> +
> +               ret = cs_etm__create_queue_decoders(etmq);
> +               if (ret)
> +                       return ret;
> +       }
> +       return 0;
> +}
> +
>  int cs_etm__process_auxtrace_info_full(union perf_event *event,
>                                        struct perf_session *session)
>  {
> @@ -3396,6 +3429,10 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>         if (err)
>                 goto err_free_queues;
>
> +       err = cs_etm__queue_aux_records(session);
> +       if (err)
> +               goto err_free_queues;
> +
>         /*
>          * Map Trace ID values to CPU metadata.
>          *
> @@ -3418,7 +3455,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>          * flags if present.
>          */
>
> -       /* first scan for AUX_OUTPUT_HW_ID records to map trace ID values to CPU metadata */
> +       /* Scan for AUX_OUTPUT_HW_ID records to map trace ID values to CPU metadata */
>         aux_hw_id_found = 0;
>         err = perf_session__peek_events(session, session->header.data_offset,
>                                         session->header.data_size,
> @@ -3436,7 +3473,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>         if (err)
>                 goto err_free_queues;
>
> -       err = cs_etm__queue_aux_records(session);
> +       err = cs_etm__create_decoders(etm);
>         if (err)
>                 goto err_free_queues;
>
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
