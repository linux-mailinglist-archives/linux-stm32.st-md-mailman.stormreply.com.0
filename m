Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD3934E1C
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2024 15:25:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAF75C78018;
	Thu, 18 Jul 2024 13:25:31 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F002CC78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 13:25:24 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-260f1664fdfso377140fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721309124; x=1721913924;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vir5nuwGazUP8EA8QzwI5PQf4dQjth2jy2roymqp4Nw=;
 b=FjSsaKS4I86FyfLRNSxKUavmUGdPnDvQpKTLY4tGxFEJ2nBQD+bvkXaZvtgT/OTeZ+
 VOyQ5bNAKPBx7QVYFn1F2iOzmIPL/q19pMlM+OY5JB9u66dZDZG8SX0io1yXHGYiWc+d
 nDrOMSSntw5shClg0JUz4KVatxxMlHKy9kbfVsIcA9HXKcJFojYLWYDmQfdDwCsT8ZuT
 TsrrRcjMrKZIuqjAP2b8odRdT4uZlg2tulm1QpdAnkDf1LTu33IskrcPJY4kEyJcsw/N
 WA5w+8ZuMJ5VhpDKpyT8xnTfR9qRHRbf2XIyQFPCI49yJq/XYPioJ8tuCwo8A14gPNmw
 zE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721309124; x=1721913924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vir5nuwGazUP8EA8QzwI5PQf4dQjth2jy2roymqp4Nw=;
 b=D47c/TPmf8sc5JHMExurZJA3fXJBca4Lr4NKxRGynaXPoA3RFuOdRDiSgcpVp0zXH+
 s6arF3kbs0qqo7vIl235Y71XizvQlQFeDnwtF9jWJPN47zbZAnP8ptKPCM3PvtPjpdWj
 tVH54YTLzV7Es9egYPMR/Y9bZFCKEBOXYguMu/Zffq+NBf3aODzVtrEbQvUudBmfC1Hc
 yBg9HOWOtSUx+jf6uEdMskRmiXQDnRegXzDqm4pXvcBQK7iRSFv5iWR7Xzar2T9IDiDY
 NXMEMaKlqNWnYs2BW7X79ZsfVyNs5nIyCAqvkPsSp3LlWiYrrzEDLC4he58erqAzhaKw
 EJqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ8gwF7Il4SwyWhJXDZMXdqnm2Zxg78tyMMMZqQkFdyZR1/Bz0tlFxqnoVwMVJCFF+ab69Y0Gz6SruBqsADkAx20HaEwaEp0If9V6et3wcrR7HzbB2WunE
X-Gm-Message-State: AOJu0YxDkYV/JOhiyArA7F9Fs5qDnTcydz0WEhIphmBC9df6m6BaqXNe
 tYFhx1JnwvvOWKLYbVdLN5AHnb6IS5ELDIUeYZuXjLSXLn47zjyCH1C9FoUCzPDOyjcGGGjlAHu
 yZcQDbv24JU5jKWA0L6k4eDZ23qlmtdbQflUgWA==
X-Google-Smtp-Source: AGHT+IEPkgjGJn18JYE974ykVld89iuuCfjj4jWKBJklPyYHI5h+O2RZ3oJBBiisTG2ZSOhOgPHN1XUGr6CrzMpV6u8=
X-Received: by 2002:a05:6870:2308:b0:25d:e3d:b441 with SMTP id
 586e51a60fabf-260d921d6f1mr4069222fac.40.1721309123785; Thu, 18 Jul 2024
 06:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-8-james.clark@linaro.org>
In-Reply-To: <20240712102029.3697965-8-james.clark@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 18 Jul 2024 14:25:12 +0100
Message-ID: <CAJ9a7VjH+3LFJvSHkKUD_hJjxnpk3zyJ3ohFL6J6rgyquqyj=Q@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 07/17] perf: cs-etm: Print queue number
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

Hi James

On Fri, 12 Jul 2024 at 11:22, James Clark <james.clark@linaro.org> wrote:
>
> From: James Clark <james.clark@arm.com>
>
> Now that we have overlapping trace IDs it's also useful to know what the
> queue number is to be able to distinguish the source of the trace so
> print it inline.
>

Not sure queue number is meaningful to anyone other than someone
debugging the etm decode in perf. Perhaps cpu number?

Moreover - other additional debugging in the trace output is
controlled with build options.
See:-
Makefile.config ->  ifdef CSTRACE_RAW,
thence:-
#ifdef CS_DEBUG_RAW in cs-etm-decoder.c

which adds in the raw byte data from the trace dump.

Could we make this addtional info dependent on either the standard
DEBUG macro, or an additional build macro.



> Signed-off-by: James Clark <james.clark@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 4 ++--
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.h | 2 +-
>  tools/perf/util/cs-etm.c                        | 7 ++++---
>  3 files changed, 7 insertions(+), 6 deletions(-)
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
> index 87e983da19be..49fadf46f42b 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -762,15 +762,16 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
>         }
>  }
>
> -static void cs_etm__packet_dump(const char *pkt_string)
> +static void cs_etm__packet_dump(const char *pkt_string, void *data)
>  {
>         const char *color = PERF_COLOR_BLUE;
>         int len = strlen(pkt_string);
> +       struct cs_etm_queue *etmq = data;
>
>         if (len && (pkt_string[len-1] == '\n'))
> -               color_fprintf(stdout, color, "  %s", pkt_string);
> +               color_fprintf(stdout, color, "  Qnr:%d; %s", etmq->queue_nr, pkt_string);
>         else
> -               color_fprintf(stdout, color, "  %s\n", pkt_string);
> +               color_fprintf(stdout, color, "  Qnr:%d; %s\n", etmq->queue_nr, pkt_string);
>
>         fflush(stdout);
>  }
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
