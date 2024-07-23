Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A976093A089
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jul 2024 14:37:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44215C6DD96;
	Tue, 23 Jul 2024 12:37:19 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B449C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2024 12:37:12 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5ce74defe42so3007768eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2024 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721738231; x=1722343031;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1PK/7EFDuzvwfgAoJnV5Sv6CmA0hzzCT8PA3TVv11TQ=;
 b=Izml+1woDpwmh4+XmQ1Zs6da91GONoNd/mgdMu0FgOC1F/sXVv35phJaDmT4WUs/j0
 zNfM6k7ePcij3T8r7qm2UJFQQKBe62sxqACv9V1SBhqd7DFRh0qP7ESHhppBACc5TjFK
 3K0XY83NtB84DW7Wih3LBf4Thce6uSmecbORMWLtfQ+cBFvDBvCKbU939tEtdcBxJOkC
 +YD6PxuRxvUHrr/yeVONx/ueaovYwy+QrX2dnmU712QQS3CTnd9mB757nUlZkKQHlexq
 tiDzGrBZyJggpCHV0sNsyLaTRCoqDskAT1Owm6M2fVmX6Qvh+YX2IIE8O0xSyjQ39rz9
 GCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721738231; x=1722343031;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1PK/7EFDuzvwfgAoJnV5Sv6CmA0hzzCT8PA3TVv11TQ=;
 b=VTQuDCTfA0Bc2v5ca32PKdGcJlhB35NA2ScKQ48MqabpA1emfyO1BDgapLrNg8PtT/
 AGh9K/EVliCLuE88NGguZLxiQbFiqMA7DMqzQnjZLMI3DwFJ5jKPQbyV266BapE4pSyZ
 DvY5p0810CsZxXjYxpgZUi3J4NmhjZYvME6E92fjWlDqLXVigwKP8HiYr32AGnQLO6XH
 qhWGODTljUCQtItVE2R21HoCGrGgClATnkiyAvt9lyQqjiA5V8V2+UJRPVUUYErtrLxQ
 5QGkAtsOhSyER/8sdqFarvMCIekZOSBKtVwRb6EgXQlUALqjZEuu247derq3R6AvH3cZ
 2hmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0xaIdBQstn9BvmDlzlGvzwunf5rSxxU2MZCNRyN0+haigeL//+BW24WrdW89kZMg0Urj4tcsQXGjqs1rvz0Rp4N3/sQdsitbHXoQyAW1pYN4xC1ML0W7k
X-Gm-Message-State: AOJu0YzDD43j98lIaKK72gvaAyfGFzPFsXMWDh6K8qm/T9ZAkqQEEosH
 0gT/p7PIlJ6YQpVGZqBuweXgUsRxLk2wps5rxqjdd778fvQ1mlsksZlzJ0rwc9QXUxr4I6wifJX
 U8ltc5iMAASjOQQCTvNeadjJXvyAJktDNpuoLbA==
X-Google-Smtp-Source: AGHT+IGnQkB4dy1+XaxZaGC5cn9k/k/gqgs8XKEYWBSg3ze2AGNRxBxtP0Z90SRSbaXxF6TSdzpnrlfaIXPF8JuG5cY=
X-Received: by 2002:a05:6870:fb8e:b0:260:e83b:cc13 with SMTP id
 586e51a60fabf-261214e4a6cmr10019744fac.28.1721738230798; Tue, 23 Jul 2024
 05:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240722101202.26915-1-james.clark@linaro.org>
 <20240722101202.26915-8-james.clark@linaro.org>
In-Reply-To: <20240722101202.26915-8-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 23 Jul 2024 13:36:59 +0100
Message-ID: <CAJ9a7VgPLpx3K9GVydDWhWSxLfsmeXEXntqA60S6ot12Kcefjw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v6 07/17] perf: cs-etm: Print queue number
	in raw trace dump
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

On Mon, 22 Jul 2024 at 11:13, James Clark <james.clark@linaro.org> wrote:
>
> From: James Clark <james.clark@arm.com>
>
> Now that we have overlapping trace IDs it's also useful to know what the
> queue number is to be able to distinguish the source of the trace so
> print it inline. Hide it behind the -v option because it might not be
> obvious to users what the queue number is.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  4 ++--
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  2 +-
>  tools/perf/util/cs-etm.c                        | 13 ++++++++++---
>  3 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index d49c3e9c7c21..b78ef0262135 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -41,7 +41,7 @@ const u32 INSTR_PER_NS = 10;
>
>  struct cs_etm_decoder {
>         void *data;
> -       void (*packet_printer)(const char *msg);
> +       void (*packet_printer)(const char *msg, void *data);
>         bool suppress_printing;
>         dcd_tree_handle_t dcd_tree;
>         cs_etm_mem_cb_type mem_access;
> @@ -202,7 +202,7 @@ static void cs_etm_decoder__print_str_cb(const void *p_context,
>         const struct cs_etm_decoder *decoder = p_context;
>
>         if (p_context && str_len && !decoder->suppress_printing)
> -               decoder->packet_printer(msg);
> +               decoder->packet_printer(msg, decoder->data);
>  }
>
>  static int
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
> index 272c2efe78ee..12c782fa6db2 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
> @@ -60,7 +60,7 @@ struct cs_etm_trace_params {
>
>  struct cs_etm_decoder_params {
>         int operation;
> -       void (*packet_printer)(const char *msg);
> +       void (*packet_printer)(const char *msg, void *data);
>         cs_etm_mem_cb_type mem_acc_cb;
>         bool formatted;
>         bool fsyncs;
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index b11b0cae608e..6298a5c7a651 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -762,15 +762,22 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
>         }
>  }
>
> -static void cs_etm__packet_dump(const char *pkt_string)
> +static void cs_etm__packet_dump(const char *pkt_string, void *data)
>  {
>         const char *color = PERF_COLOR_BLUE;
>         int len = strlen(pkt_string);
> +       struct cs_etm_queue *etmq = data;
> +       char queue_nr[64];
> +
> +       if (verbose)
> +               snprintf(queue_nr, sizeof(queue_nr), "Qnr:%d; ", etmq->queue_nr);
> +       else
> +               queue_nr[0] = '\0';
>
>         if (len && (pkt_string[len-1] == '\n'))
> -               color_fprintf(stdout, color, "  %s", pkt_string);
> +               color_fprintf(stdout, color, "  %s%s", queue_nr, pkt_string);
>         else
> -               color_fprintf(stdout, color, "  %s\n", pkt_string);
> +               color_fprintf(stdout, color, "  %s%s\n", queue_nr, pkt_string);
>
>         fflush(stdout);
>  }
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
