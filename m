Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE84F963F72
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 11:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77174C6DD6E;
	Thu, 29 Aug 2024 09:05:13 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6767DC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 09:05:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso718772a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724922306; x=1725527106;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9DuBxoWy157nnbS1/JjpE+7fauo1YwxW92soyQSN/iA=;
 b=BvnXYFtHGc163sAOSmg5DpAZOqJgbULYvL20PxlYY7qdae3K7fxFVEMsIsh0NK1hl7
 midU+8jhbYkTNxv6aI/p4SKNuhqKRL1yw1l76UUo4rTxblLILe9+gpyEmp0CiM/WdjdY
 +PB73WRGXiam84XBUh+cmSxLsb4G6hhVah0aOupIc8Yy3hmeqGVD0qKysriGjczAw2jW
 nzEjUHvWrJ61L06BB06PUqnve40yV1oYimYDES/SPnIvlvs/SpjUanqdv1mYb64m/wcs
 Bu7dVEF3VgMRTFmCP2o6xW4sA60Y+aIK09s/8t5VHUb0vMV0i+ZEgBQ2ckxlpCZayC0L
 gobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724922306; x=1725527106;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9DuBxoWy157nnbS1/JjpE+7fauo1YwxW92soyQSN/iA=;
 b=GjKfQygA3ojeRdarQWMwTqK23M6oWh3mx+MBMlfLwVJd0yU3bBGW0rxoqrwWg2me0J
 F8bMQp+IbqJqAfkPXKGqFU6SSq4X0YiFpuIPghls954OeBfwRCLfKOiBhwqiNByoXFcg
 oulo/vtzix8J46MixUUWTKFn+EFNLq+3B92jquyEoTAyvy4v8pE+JL2gSkIPZbwYHwRi
 LoDrTmm1r3loTrAgd9GQNONFZV3nF8k4TUVbK6sj4b/yPf4ovg05C5ZYxH9S8nB3ttb0
 8vrHm+NUjpa5SzkGm9w5ZrSlTxIEcTqXDT7mYuRVS+alI7SmpQ1IKK/sWcTv3Z5iwJOu
 UcwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3xj63C2oDIoOw4Wnuqnm48ZZGdA7VrlfL8sSWCOCyEFYRjeU8DCnJn48pEKObgm6hspJlni9Tmm1wgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHcsz9vv57hHtDF01XNEkFtXoFAxylKDPLcbcmKjcwM1mWO0M/
 OfV56zFxP5SjOYOQ5WrG71VsDAloytovDFlKvQWZrdtb9TSluygMOhXqLFL0c6A=
X-Google-Smtp-Source: AGHT+IEIc+7B3QpJ98XadgHQzotWLA5vnY006rf18T7jH2/xIboTRex996U2nAhHSlYtYvCuPHWpPA==
X-Received: by 2002:a05:6402:5253:b0:5be:fb2e:d334 with SMTP id
 4fb4d7f45d1cf-5c2201acb4bmr1950484a12.12.1724922304743; 
 Thu, 29 Aug 2024 02:05:04 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c731a7sm452885a12.26.2024.08.29.02.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 02:05:04 -0700 (PDT)
Message-ID: <7b96894c-f5df-473b-be50-ee118ce3cfaf@linaro.org>
Date: Thu, 29 Aug 2024 10:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20240722101202.26915-1-james.clark@linaro.org>
 <ZqOwGWcYosGe9ru4@x1> <6476a228-847b-4804-9229-c11a881663c7@arm.com>
 <ZqOzio8Oco9ZFsDm@x1> <8068c8ff-a8ce-4bcd-bb19-2c25b45cf6f3@arm.com>
 <ZqO3gPcCCVh1r5WM@x1> <aab886f3-ebbf-4853-b26b-5cf70c801683@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aab886f3-ebbf-4853-b26b-5cf70c801683@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 "Liang, Kan" <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 anshuman.khandual@arm.com, coresight@lists.linaro.org,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 leo.yan@linux.dev, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com, Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [Linux-stm32] [PATCH v6 00/17] coresight: Use per-sink trace ID
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 22/08/2024 3:35 pm, Suzuki K Poulose wrote:
> Hi Arnaldo,
> 
> On 26/07/2024 15:49, Arnaldo Carvalho de Melo wrote:
>> On Fri, Jul 26, 2024 at 03:38:13PM +0100, Suzuki K Poulose wrote:
>>> On 26/07/2024 15:32, Arnaldo Carvalho de Melo wrote:
>>>> On Fri, Jul 26, 2024 at 03:26:04PM +0100, Suzuki K Poulose wrote:
>>>>> On 26/07/2024 15:18, Arnaldo Carvalho de Melo wrote:
>>>>>> On Mon, Jul 22, 2024 at 11:11:42AM +0100, James Clark wrote:
>>>>>>> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
>>>>>>> as long as there are fewer than that many ETMs connected to each 
>>>>>>> sink.
>>>>>>
>>>>>> Hey, may I take the tools part, i.e. patches 0-7 and someone on 
>>>>>> the ARM
>>>>>> kernel team pick the driver bits?
>>
>>>>> I plan to pick the kernel driver bits for v6.12
>>
>>>> Perhaps it is better for me to wait for that?
>>
>>> Yes, please.
>>
>> Please let me know when you do so so that I can merge the tooling bits.
> 
> I have now merged the driver changes to coresight/next, they will be
> sent to Greg for v6.12. [0]
> 
> You may go ahead and merge the tool bits.
> 
> Thanks
> Suzuki
> 
> [0] 
> https://lkml.kernel.org/r/172433479466.350842.6920589600831615538.b4-ty@arm.com
> 
> 
>>
>> Thanks,
>>
>> - Arnaldo
> 

Hi Arnaldo,

I just checked and the tool patches still apply cleanly if you're able 
to take them.

Thanks
James
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
