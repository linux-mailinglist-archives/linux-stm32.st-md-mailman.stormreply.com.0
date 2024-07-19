Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBEB93FA06
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C34EFC78F71;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07CDAC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 09:29:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3687f8fcab5so140045f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721381379; x=1721986179;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XeUxxx4F06ytA/JpMebP2usYOntjakHjEB1FCSY1FhA=;
 b=ZVXFXgien3gLXZ+FCLo78ILdn805DnlAYO+8nFXEXTyOgMF0LqGQFMYtCYOrLobMht
 F+1peHMkKh4xIYB1bq1LNsIK6mhDlyGjGkPeEH+IWJY+EGfDKJMtrzab75Vm13f3AYIJ
 cRYHt3CFt6SNX68PP+wewAk/rHWM0cjWGFmrtZG63D4ryKJszJ/p4gJs1O3S2+yn1GrS
 Lw/DHgLc/e7d3j7RRY7KVMXWxI93UrSO5uDaQ4jthZHoBVpAE5cRZf1mptegfUw3Dq1K
 8eXamcKwQviGvQprRq711gdNfCvQyekRkLC8irtcWktFwW8RlUXirSElm11VdvspE9se
 c6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721381379; x=1721986179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XeUxxx4F06ytA/JpMebP2usYOntjakHjEB1FCSY1FhA=;
 b=Lftcg4A/7ADP31Ajt9U2l5GgAOpJCg62p/Vf22XvV9kzFnK1KgU1NSToa+MNp+Ff/C
 Jq31LhUMMmyJi2RZEopGzRHog55V5Ojd48xGk7XVVH97qF7chkW+HRulbYzPeoF4S7aY
 So6putxqi/TWCdr6VjYKj1Mdb9HBtrbGIUPlF83ffh2ZAZzvgu//JCO8NkQqH9beG1in
 X0yGSj0hTz0EB0xLqkn9orxIJ6IATnsZwLJz4ZunM+lWhY1BWxZdk1Shxe2/ZPZkyOTY
 SJWipA6ytvzT3AbFvFGnNCk2MQDM9Lul/aR+9f+8j5GAouEX1EOlY818EZ2FDGJrYGNK
 yVOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXpbi1CznCL0qnAZECDo91hlOTZTdUEJbTnq/U9XWmybgKDOE6xdZVjnxHw/VRZJkccFD/XpHT8qVQfexUfoGBtsJa8xw+RBbWycMqwIImx+y+eo/N8Tyl
X-Gm-Message-State: AOJu0YydmNMTCS2K9zlz9rkM6Kum9V339m568pXVVz1L2AwUK+5Z32yY
 hJJLu8vkiDiHNFh/vflDvnkp3NcWv4ckxG818LWFCLbmTULIu2UM9IZaplfXDCU=
X-Google-Smtp-Source: AGHT+IF2ccBsKb4YBezxTdfv3XQrmsfj5+RMN8Bx+uHeZXY6Lc5X+rfSG8nLNZeu/FWDf5tAfDywLw==
X-Received: by 2002:a5d:6488:0:b0:366:ebd1:3bc1 with SMTP id
 ffacd0b85a97d-368316002e9mr6055066f8f.3.1721381379395; 
 Fri, 19 Jul 2024 02:29:39 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684773sm1093350f8f.7.2024.07.19.02.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 02:29:39 -0700 (PDT)
Message-ID: <3b2285e0-3ac2-448a-8a53-c1bb6ead78b8@linaro.org>
Date: Fri, 19 Jul 2024 10:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mike Leach <mike.leach@linaro.org>
References: <20240712102029.3697965-1-james.clark@linaro.org>
 <20240712102029.3697965-17-james.clark@linaro.org>
 <CAJ9a7ViwpDSpEv0niuF=wWpp4497Yp5AcnMSeh_SamWnK1QQtw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7ViwpDSpEv0niuF=wWpp4497Yp5AcnMSeh_SamWnK1QQtw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 17/07/2024 4:03 pm, Mike Leach wrote:
> On Fri, 12 Jul 2024 at 11:23, James Clark <james.clark@linaro.org> wrote:
>>
>> From: James Clark <james.clark@arm.com>
>>
>> For Perf to be able to decode when per-sink trace IDs are used, emit the
>> sink that's being written to for each ETM.
>>
>> Perf currently errors out if it sees a newer packet version so instead
>> of bumping it, add a new minor version field. This can be used to
>> signify new versions that have backwards compatible fields. Considering
>> this change is only for high core count machines, it doesn't make sense
>> to make a breaking change for everyone.
>>
>> Signed-off-by: James Clark <james.clark@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 26 ++++++++++---------
>>   .../hwtracing/coresight/coresight-etm-perf.c  | 16 ++++++++----
>>   drivers/hwtracing/coresight/coresight-priv.h  |  1 +
>>   include/linux/coresight-pmu.h                 | 17 +++++++++---
>>   4 files changed, 39 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index faf560ba8d64..c427e9344a84 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -487,23 +487,25 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
>>          return csdev;
>>   }
>>
>> +u32 coresight_get_sink_id(struct coresight_device *csdev)
>> +{
>> +       if (!csdev->ea)
>> +               return 0;
>> +
>> +       /*
>> +        * See function etm_perf_add_symlink_sink() to know where
>> +        * this comes from.
>> +        */
>> +       return (u32) (unsigned long) csdev->ea->var;
>> +}
>> +
>>   static int coresight_sink_by_id(struct device *dev, const void *data)
>>   {
>>          struct coresight_device *csdev = to_coresight_device(dev);
>> -       unsigned long hash;
>>
>>          if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
>> -            csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
>> -
>> -               if (!csdev->ea)
>> -                       return 0;
>> -               /*
>> -                * See function etm_perf_add_symlink_sink() to know where
>> -                * this comes from.
>> -                */
>> -               hash = (unsigned long)csdev->ea->var;
>> -
>> -               if ((u32)hash == *(u32 *)data)
>> +           csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
>> +               if (coresight_get_sink_id(csdev) == *(u32 *)data)
>>                          return 1;
>>          }
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 70c99f0409b2..ad6a8f4b70b6 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -460,6 +460,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>>          struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
>>          struct list_head *path;
>>          u64 hw_id;
>> +       u8 trace_id;
>>
>>          if (!csdev)
>>                  goto fail;
>> @@ -512,11 +513,16 @@ static void etm_event_start(struct perf_event *event, int flags)
>>           */
>>          if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
>>                  cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
>> -               hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
>> -                                  CS_AUX_HW_ID_CURR_VERSION);
>> -               hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
>> -                                   coresight_trace_id_read_cpu_id_map(cpu,
>> -                                                                      &sink->perf_sink_id_map));
>> +
>> +               trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
>> +
>> +               hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
>> +                               CS_AUX_HW_ID_MAJOR_VERSION);
>> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
>> +                               CS_AUX_HW_ID_MINOR_VERSION);
>> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
>> +               hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
>> +
>>                  perf_report_aux_output_id(event, hw_id);
>>          }
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>> index 61a46d3bdcc8..05f891ca6b5c 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -148,6 +148,7 @@ int coresight_make_links(struct coresight_device *orig,
>>                           struct coresight_device *target);
>>   void coresight_remove_links(struct coresight_device *orig,
>>                              struct coresight_connection *conn);
>> +u32 coresight_get_sink_id(struct coresight_device *csdev);
>>
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   extern int etm_readl_cp14(u32 off, unsigned int *val);
>> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
>> index 51ac441a37c3..89b0ac0014b0 100644
>> --- a/include/linux/coresight-pmu.h
>> +++ b/include/linux/coresight-pmu.h
>> @@ -49,12 +49,21 @@
>>    * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>>    * Used to associate a CPU with the CoreSight Trace ID.
>>    * [07:00] - Trace ID - uses 8 bits to make value easy to read in file.
>> - * [59:08] - Unused (SBZ)
>> - * [63:60] - Version
>> + * [39:08] - Sink ID - as reported in /sys/bus/event_source/devices/cs_etm/sinks/
>> + *           Added in minor version 1.
>> + * [55:40] - Unused (SBZ)
>> + * [59:56] - Minor Version - previously existing fields are compatible with
>> + *           all minor versions.
>> + * [63:60] - Major Version - previously existing fields mean different things
>> + *           in new major versions.
>>    */
>>   #define CS_AUX_HW_ID_TRACE_ID_MASK     GENMASK_ULL(7, 0)
>> -#define CS_AUX_HW_ID_VERSION_MASK      GENMASK_ULL(63, 60)
>> +#define CS_AUX_HW_ID_SINK_ID_MASK      GENMASK_ULL(39, 8)
>>
>> -#define CS_AUX_HW_ID_CURR_VERSION 0
>> +#define CS_AUX_HW_ID_MINOR_VERSION_MASK        GENMASK_ULL(59, 56)
>> +#define CS_AUX_HW_ID_MAJOR_VERSION_MASK        GENMASK_ULL(63, 60)
>> +
>> +#define CS_AUX_HW_ID_MAJOR_VERSION 0
>> +#define CS_AUX_HW_ID_MINOR_VERSION 1
>>
>>   #endif
>> --
>> 2.34.1
>>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

Hi Mike,

I think you miss-sent this one

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
