Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA4965A7E
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 10:37:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49ED8C6DD9A;
	Fri, 30 Aug 2024 08:37:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A3F3C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 08:37:09 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-428178fc07eso12891575e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725007029; x=1725611829;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q97qi+NPXZmdP6linxr81NHdFxQIXiFaev92ohLiISM=;
 b=by3p7haKIC7Mdojaw4BoUdDHJ8nkPQqHs559+oJwxiDp+FcDUg0Qb1B7AcYvCFclJR
 sR6fgLWrb2GZT0jxh60f2BpyBDk1TeGAOj3PQzzaTsRnsNpzQ4yJ778KW0JZTc0UIn12
 XV1C2wAyIaFMxMYynLv6P76FRU0rl+ekarNNRLD6jkKl27t3TndpBVpp5ZVtB0kRJc1j
 evfG/qz1hXz0sD+D6Cwpew4sEgGRY7EdMz5DtT5ZOJtVxDjxn5FU9HNtfUhQcrxx1ZM2
 irLO3ncemHvKoY9tRUW0LtS7XZi745P4PddITV7gKJCyFN8h1fRHpDiehCpwDH6IyxEZ
 7QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725007029; x=1725611829;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q97qi+NPXZmdP6linxr81NHdFxQIXiFaev92ohLiISM=;
 b=SRgjd0ujKGD91k6TMQtLtwUKNxuJF/nYFOfzLs1hIp+ymNUZmlnzCVon2VDKjLt0JH
 dyapYqbdaw3k9pgm0zluTppASRi7efpYT1zZoHC6oMC+LaOBe4gLqk87UfSjo8RTzCNb
 UdOxMXgZ1KsCH2Px6ByaRaywcf0JabQFuv8avVsTrMFKWZxSXkENLMW8UjX4qK1bRDo8
 R+7VUkOhzvL/tX53yPqkhmVIvCMDYiinCtor9JZbKqIZ7IGrsR7HTq8IUpL6CeJDN+Yc
 kNqELZm7kBohB0Vk+ja+PwLKbFR8MMM+vP2xhAni8ZGp745oHZ+XBy0EgsD3W7xFBgql
 UnEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2lczmTuz3TdeAWnKvhZFUS9KrcqmAOlgxf9fuiXEN9NJR0HocS1SsOivy5i30Tvzv84WJsN096PiAmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysEbAEo1NyEwvisb/UUiNRg3QsXez+qRqd5IpR0bJXEiZ9tjte
 /mlSnt88R8fAgn0xUjlqRE+xmDCuFw1ft24Wx7wiZMcPzGX0H8agDYkhF+DH5ww=
X-Google-Smtp-Source: AGHT+IHg1jJiD58wDqMuaJqk1HwadfKudlUpN9Y4ONSFOCiQ/xd759tBR9XHQjM3McI2u6NEnVce5g==
X-Received: by 2002:a05:600c:3154:b0:42b:a9bb:924a with SMTP id
 5b1f17b1804b1-42bb27a0dfcmr41442705e9.23.1725007028293; 
 Fri, 30 Aug 2024 01:37:08 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb3efsm39328495e9.6.2024.08.30.01.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:37:07 -0700 (PDT)
Message-ID: <8afae0a6-5322-47a8-a189-68629ea1991f@linaro.org>
Date: Fri, 30 Aug 2024 09:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20240722101202.26915-1-james.clark@linaro.org>
 <ZqOwGWcYosGe9ru4@x1> <6476a228-847b-4804-9229-c11a881663c7@arm.com>
 <ZqOzio8Oco9ZFsDm@x1> <8068c8ff-a8ce-4bcd-bb19-2c25b45cf6f3@arm.com>
 <ZqO3gPcCCVh1r5WM@x1> <aab886f3-ebbf-4853-b26b-5cf70c801683@arm.com>
 <7b96894c-f5df-473b-be50-ee118ce3cfaf@linaro.org> <ZtCUUsJNj9Z1CRLK@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <ZtCUUsJNj9Z1CRLK@x1>
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



On 29/08/2024 4:31 pm, Arnaldo Carvalho de Melo wrote:
> On Thu, Aug 29, 2024 at 10:05:02AM +0100, James Clark wrote:
>>
>>
>> On 22/08/2024 3:35 pm, Suzuki K Poulose wrote:
>>> Hi Arnaldo,
>>>
>>> On 26/07/2024 15:49, Arnaldo Carvalho de Melo wrote:
>>>> On Fri, Jul 26, 2024 at 03:38:13PM +0100, Suzuki K Poulose wrote:
>>>>> On 26/07/2024 15:32, Arnaldo Carvalho de Melo wrote:
>>>>>> On Fri, Jul 26, 2024 at 03:26:04PM +0100, Suzuki K Poulose wrote:
>>>>>>> On 26/07/2024 15:18, Arnaldo Carvalho de Melo wrote:
>>>>>>>> On Mon, Jul 22, 2024 at 11:11:42AM +0100, James Clark wrote:
>>>>>>>>> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX ETMs
>>>>>>>>> as long as there are fewer than that many ETMs
>>>>>>>>> connected to each sink.
>>>>>>>>
>>>>>>>> Hey, may I take the tools part, i.e. patches 0-7 and
>>>>>>>> someone on the ARM
>>>>>>>> kernel team pick the driver bits?
>>>>
>>>>>>> I plan to pick the kernel driver bits for v6.12
>>>>
>>>>>> Perhaps it is better for me to wait for that?
>>>>
>>>>> Yes, please.
>>>>
>>>> Please let me know when you do so so that I can merge the tooling bits.
>>>
>>> I have now merged the driver changes to coresight/next, they will be
>>> sent to Greg for v6.12. [0]
>>>
>>> You may go ahead and merge the tool bits.
> 
> I'm taking this as an Acked-by: Suzuki, ok?
> 

Suzuki is out of office at the moment and can't email but he said it was 
ok for the acked-by.

Thanks
James

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
