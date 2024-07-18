Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A8793FA05
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6102C78F6F;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95C31C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 14:30:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-368663d7f80so200167f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2024 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721313039; x=1721917839;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dj5LMN7WC5hyXsTa12aKoD9fUdmkTYmEKmHMU1kkuso=;
 b=qC/Sv9vn22CuvFk142RJz5ahe/yl/XRTMUfyRAq2UxCZLs7alSkwtt8F5k5PwluMbC
 D/Oq/bvqZsIv41bHry0298NGaB/xOd451SSUSjE7224TqP4ccalB22meJbgIAqxGG8Dh
 UTAtSLN0nlh7HI2F6ZQpGLc2SlF/XSs5rFMGvm1aV7Bf9/qzfdKxNXh1qMgod7hoIdVv
 rlwHSvjFNPeM+PL65V0EF3TQapN2YJH2H1q0J/FFSbffdTVh7h+diCikF/+VVc6H1CSt
 7eqswtwUMwUGHqZtAM/Bf1rNjd5loOxKH3IgNj3VV6xPsWFFXHJ2p5Uj1yMg8zfWO2lb
 jnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721313039; x=1721917839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dj5LMN7WC5hyXsTa12aKoD9fUdmkTYmEKmHMU1kkuso=;
 b=A2iTQptBxkRlyyPhVWrIsMUen96JBOrSbwizyKJtHh+FwGB1FGWlnt4PxIVLrwAcIN
 zVvg6D4kSQaqoT84LyLCANXqhh25Yhg0betr2c1nWZ7IwpFTPzYqduhjqC3+my0U9HTs
 7khe0O3QnUP7rNmsqWEj1FXQDQc+BMIYCo015ik7zp0SvriA2xsYLlARgnxQjDOkQeP7
 NZQyr1BSE1LU7tS2asXHddHxcE0z0LHpMA2JVTjOTknG+uoHqzOY0eRwbiv8lpASIXTp
 URq2px6HLDs0MBlG/Ne5Ph4/u035DZmYpQfnpj6qRugWhUmZgDibZ7kHw34zbHHDcDDk
 3meA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjUNB2VqdCmy6EgLl4MOgsrg30oeCpqojtLt1+pGcQ7qPpcvE8shlboMdUQGyKp/B5kUWrwx+m3AWqb0C+16u8iO9E+gKq12L9KBkBfZjMB/FOu9SA3k1p
X-Gm-Message-State: AOJu0YzWN7MTRJiGOoOgwUzTOUgD3+uGvI4RLVZ3AdOzLpkRsrdnEApH
 0KYGkHuF7jDH+ZJ9NeJSij3uM7A7dDFxmHe/5Zm/o58XiurTren1GWLcyjL9NlY=
X-Google-Smtp-Source: AGHT+IFOP3RQsHFhOPvwxIOpDtZEM5OEE0sT4/N57Q5DPMChPXAGM5Y2JTMoio0KQUCNU0jXohhDbg==
X-Received: by 2002:adf:fe50:0:b0:367:9748:ee7f with SMTP id
 ffacd0b85a97d-368317c3bcfmr3783240f8f.65.1721313038912; 
 Thu, 18 Jul 2024 07:30:38 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36868da687asm517286f8f.38.2024.07.18.07.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 07:30:38 -0700 (PDT)
Message-ID: <f1561c30-8b77-4ba5-964f-012b1e11cd2b@linaro.org>
Date: Thu, 18 Jul 2024 15:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mike Leach <mike.leach@linaro.org>
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-8-james.clark@linaro.org>
 <CAJ9a7VjH+3LFJvSHkKUD_hJjxnpk3zyJ3ohFL6J6rgyquqyj=Q@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VjH+3LFJvSHkKUD_hJjxnpk3zyJ3ohFL6J6rgyquqyj=Q@mail.gmail.com>
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 "Liang, Kan" <kan.liang@linux.intel.com>, suzuki.poulose@arm.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 18/07/2024 2:25 pm, Mike Leach wrote:
> Hi James
> 
> On Fri, 12 Jul 2024 at 11:22, James Clark <james.clark@linaro.org> wrote:
>>
>> From: James Clark <james.clark@arm.com>
>>
>> Now that we have overlapping trace IDs it's also useful to know what the
>> queue number is to be able to distinguish the source of the trace so
>> print it inline.
>>
> 
> Not sure queue number is meaningful to anyone other than someone
> debugging the etm decode in perf. Perhaps cpu number?

It's more than just for debugging Perf, anyone who was previously 
reading the raw trace would probably have grepped for, or be looking at 
the "ID:" field. Now that doesn't identify trace from a single source 
anymore, due to the overlapping IDs. Same applies if you want to process 
the output in some way per-line.

With ETE technically it is CPU number, but I didn't want to name it like 
that because it's overloaded: With ETM it's the "collection CPU" which 
would be too misleading to label as CPU, and in per-thread mode it's 
always 0 and not a CPU at all.

Although I suppose it's already labeled as CPU on the 
PERF_RECORD_AUXTRACE output, and this just duplicates that so it should 
be called CPU. Maybe it is ok to drop this one  because the info already 
exists in the PERF_RECORD_AUXTRACE output.

> 
> Moreover - other additional debugging in the trace output is
> controlled with build options.
> See:-
> Makefile.config ->  ifdef CSTRACE_RAW,
> thence:-
> #ifdef CS_DEBUG_RAW in cs-etm-decoder.c
> 
> which adds in the raw byte data from the trace dump.
> 
> Could we make this addtional info dependent on either the standard
> DEBUG macro, or an additional build macro.
> 
> 

What about behind the verbose argument to Perf?

> 
>> Signed-off-by: James Clark <james.clark@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 4 ++--
>>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.h | 2 +-
>>   tools/perf/util/cs-etm.c                        | 7 ++++---
>>   3 files changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
>> index d49c3e9c7c21..b78ef0262135 100644
>> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
>> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
>> @@ -41,7 +41,7 @@ const u32 INSTR_PER_NS = 10;
>>
>>   struct cs_etm_decoder {
>>          void *data;
>> -       void (*packet_printer)(const char *msg);
>> +       void (*packet_printer)(const char *msg, void *data);
>>          bool suppress_printing;
>>          dcd_tree_handle_t dcd_tree;
>>          cs_etm_mem_cb_type mem_access;
>> @@ -202,7 +202,7 @@ static void cs_etm_decoder__print_str_cb(const void *p_context,
>>          const struct cs_etm_decoder *decoder = p_context;
>>
>>          if (p_context && str_len && !decoder->suppress_printing)
>> -               decoder->packet_printer(msg);
>> +               decoder->packet_printer(msg, decoder->data);
>>   }
>>
>>   static int
>> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
>> index 272c2efe78ee..12c782fa6db2 100644
>> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
>> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
>> @@ -60,7 +60,7 @@ struct cs_etm_trace_params {
>>
>>   struct cs_etm_decoder_params {
>>          int operation;
>> -       void (*packet_printer)(const char *msg);
>> +       void (*packet_printer)(const char *msg, void *data);
>>          cs_etm_mem_cb_type mem_acc_cb;
>>          bool formatted;
>>          bool fsyncs;
>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>> index 87e983da19be..49fadf46f42b 100644
>> --- a/tools/perf/util/cs-etm.c
>> +++ b/tools/perf/util/cs-etm.c
>> @@ -762,15 +762,16 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
>>          }
>>   }
>>
>> -static void cs_etm__packet_dump(const char *pkt_string)
>> +static void cs_etm__packet_dump(const char *pkt_string, void *data)
>>   {
>>          const char *color = PERF_COLOR_BLUE;
>>          int len = strlen(pkt_string);
>> +       struct cs_etm_queue *etmq = data;
>>
>>          if (len && (pkt_string[len-1] == '\n'))
>> -               color_fprintf(stdout, color, "  %s", pkt_string);
>> +               color_fprintf(stdout, color, "  Qnr:%d; %s", etmq->queue_nr, pkt_string);
>>          else
>> -               color_fprintf(stdout, color, "  %s\n", pkt_string);
>> +               color_fprintf(stdout, color, "  Qnr:%d; %s\n", etmq->queue_nr, pkt_string);
>>
>>          fflush(stdout);
>>   }
>> --
>> 2.34.1
>>
> 
> Mike
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
