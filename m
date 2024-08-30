Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF15965A6C
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 10:35:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 260E0C6DD9A;
	Fri, 30 Aug 2024 08:35:52 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A392C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 08:35:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42bbd16fcf2so2274615e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725006945; x=1725611745;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MDgErpkUKnQe50JSRwQXTxpchIY80U2OBlsTDwNP1cQ=;
 b=EiXrqfp2b7tc84uy8XIighw4Ho1IPHxdgnWeY8yS1DAq3snAa45ojbBOiqIdLnYx9x
 yLnlw5t25sFPMV/ifBwLWQ0LhQlqVQPR/gSjjmbjNmoJ1vNDlc9wq038TG5BMY9hsaN4
 D+5iPX3wUun5scYQCXaBa1q3BB5Vn/UnxRqpgIeLWCIIvxygjsLAPwNDt2WO9x1e2BFx
 aaZPWxeZB1X6LNgT822CDNtc3aFqxO/Fcgfkok/k08Spy6YdevcvJuGS6nLa8zL9eh4A
 6B5XLZy9NuzL8sRp8ZM2LcgHjHi13b2IF9utl36JmiVEbKNwjPALgM9hMdU4fBwHs9qh
 n0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725006945; x=1725611745;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MDgErpkUKnQe50JSRwQXTxpchIY80U2OBlsTDwNP1cQ=;
 b=T7jkdj8g+76/QL0SwxpgEr44bR7C0EftAvXU0OuGTyHJpbw6SdKA31/rRw1eX4rdRD
 lGCSNCG4opAIxzAYpRV4QVl5E4nCQeP4V0X8gvKUuZ4N4XiZ14aM8oxTMwIn8FdX0sX6
 6OaI+bJytpKPNBKxPvCGB0OutIV0yPLzQFE/fg2LIgWRHpWElAumy5Zc8PST0XmY0spy
 q4V7S2d1xsEoOmxLTqq3/qIggLAhI/k3ngqiCDpzJYpMcDXW6orIUD2HB8XwIEu9SpdT
 0ELNtETqU9JTcWZEQYxNlVnXv6qAcWFmGLnU55fcwRs+VyjOCZFDebsRsIWH/aTzNUMu
 Kzxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdEx1UkLSKhAXDfnYzQFMGE4tpTdqAaEbsZWy8Zhmzm/3bgBUrX9JgOoCkXNbB7zYb4XUy8JxlYw4drA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwK2piKoX+m55kJ/Gqxqq1tQfOg4xEa8xZ1GuZ2P+74GYOPTNII
 KV7wZyQuMlUx5iSHFyRUMDZ/ajM1jiahx1Y0eFQFUE1A3ifJ0HyxQ25YuQ/OJfE=
X-Google-Smtp-Source: AGHT+IG2YQtB+es4bpO/DPjIWcCbaKmtKE3m6I0KAaWGTR3kPHJqRAnzrYl/zAokjrpuA+J7gIfXFQ==
X-Received: by 2002:a05:600c:4585:b0:426:51dc:f6cd with SMTP id
 5b1f17b1804b1-42bb01bfbdemr48151025e9.18.1725006943921; 
 Fri, 30 Aug 2024 01:35:43 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb239sm39581435e9.5.2024.08.30.01.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:35:42 -0700 (PDT)
Message-ID: <18a60d79-e94d-4fe9-ba9e-867bed175a6a@linaro.org>
Date: Fri, 30 Aug 2024 09:35:41 +0100
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
>>> Thanks
>>> Suzuki
>>>
>>> [0] https://lkml.kernel.org/r/172433479466.350842.6920589600831615538.b4-ty@arm.com
>>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> - Arnaldo
>>>
>>
>> Hi Arnaldo,
>>
>> I just checked and the tool patches still apply cleanly if you're able to
>> take them.
> 
> Sure.
> 
> - Arnaldo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
