Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5558D501
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Aug 2022 09:57:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4321C5EC56;
	Tue,  9 Aug 2022 07:57:05 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48FDFC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 07:57:05 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id z6so8473747lfu.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Aug 2022 00:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3IBr6p2z3wSW6g3+vDFQa8eI3JKD+eigRgAZZ154fsc=;
 b=OsfPSzU8rvxsPXrV05RL3FkpVd82/zImhAUX6Xd4ggg3JlaegSPktLRpkogqwhoqvB
 KdN9OAHcSE1SNKv8vkQyZnUcdls+vVJykmXw3I/J2ZEzABCWRqiienx8+3lUG5TDnc+u
 5mHoB9n2sP0xwFLxgWH5g5p/9hd7Q0KOhVA5XWpubH7ViWjmTS2jxPr7TYlVtP9dJ6Qm
 Z8zFmZB7ppkLhWO5eQPrjnGF2IbarOMpZWJhQ5fy0iUooqfQ5ktZ7/7nWtmbflhkRzEU
 93I0kCPZW3QBm899M8Qs2RDN6rTBzYuz3fdripUToWlh2tL4DHwgA5deKvGPtHcCpt4X
 0KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3IBr6p2z3wSW6g3+vDFQa8eI3JKD+eigRgAZZ154fsc=;
 b=mENDQBzmzgfqP8bdxLGT5+oG8bV70YkfdY2IrDUu2Bu7zo2C2wMbs0GbpSh+TlXqzW
 /Ewbmmaf7Ch29JXqdPRjWgOpj/pUSjsQRz/TRHaOAOmnuCQB5t9QOM74gnZzwzah+Uzl
 qFp/3SDWIUHSxRp6d0vsttmB7DTiqiWaUb6wYIGZMOni4ocZuo8WovXUKdKAWT3RY8fi
 fsBFP/fanVTmzTsRfi6J2yIroQdVc4CAqvD4HD5MmP1QEgqHlSPNDEo7IJ9ve2syziwh
 4YlpIXQ7KPL975ht8cJG064gETxxPx6dbhyhNeqpMWUFKje1/0bb+Lm2pROiAA0eApP3
 NQ0w==
X-Gm-Message-State: ACgBeo0Ph62+ruqMq5R3QwDn8EDR7kuFmsaEDYqwfjH4YIerjrKNZD+q
 pTdMZBQeqwCzkPErqL0OBCO0GA==
X-Google-Smtp-Source: AA6agR7I4GC9gHyXaVBjnSy1QUZJeskVQusM1MXa129ukwJ1m30ncwS4hoSZ1IPtwQO0MFCwEATc0w==
X-Received: by 2002:ac2:43d4:0:b0:48a:f6bf:1185 with SMTP id
 u20-20020ac243d4000000b0048af6bf1185mr7731172lfl.197.1660031824540; 
 Tue, 09 Aug 2022 00:57:04 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a05651236cf00b0048a85bd4429sm1672101lfs.126.2022.08.09.00.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 00:57:04 -0700 (PDT)
Message-ID: <0765cae5-1d07-cbaa-83bf-5553f3f8b242@linaro.org>
Date: Tue, 9 Aug 2022 10:57:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Mark Brown <broonie@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
 <20220808074051.44736-2-patrice.chotard@foss.st.com>
 <9ad4b4a8-988e-f185-f80c-6f15f341ce8c@linaro.org>
 <79fd7e19-ceef-14fb-5a83-603740735f8f@foss.st.com>
 <38c3977a-0196-1832-ff94-317064cbc439@linaro.org>
 <b15184d6-c9e7-d042-621b-ef4ccd3c87ba@linaro.org>
 <a4310e1d-4eb3-0081-3cd2-8fd060a28bda@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a4310e1d-4eb3-0081-3cd2-8fd060a28bda@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: spi: stm32: Add st,
 dual-flash property in st, stm32-qspi.yaml
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

On 09/08/2022 10:52, Patrice CHOTARD wrote:
> Hi Krzystof
> 
> On 8/9/22 07:29, Krzysztof Kozlowski wrote:
>> On 09/08/2022 07:18, Krzysztof Kozlowski wrote:
>>> On 08/08/2022 19:08, Patrice CHOTARD wrote:
>>>> Hi Krzystof
>>>>
>>>> On 8/8/22 11:01, Krzysztof Kozlowski wrote:
>>>>> On 08/08/2022 10:40, patrice.chotard@foss.st.com wrote:
>>>>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>>>>
>>>>>> Add new property st,dual-flash which allows to use the QSPI interface as a
>>>>>> communication channel using up to 8 qspi line.
>>>>>> This mode can only be used if cs-gpios property is defined.
>>>>>>
>>>>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 8 ++++++++
>>>>>>  1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>>>>> index 6ec6f556182f..5e4f9109799e 100644
>>>>>> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>>>>> @@ -46,6 +46,14 @@ properties:
>>>>>>        - const: tx
>>>>>>        - const: rx
>>>>>>  
>>>>>> +  st,dual-flash:
>>>>>> +    type: boolean
>>>>>> +    description:
>>>>>> +      Allows to use 8 data lines in case cs-gpios property is defined.
>>>>>
>>>>> It's named dual-flash, but what if you want to use QSPI to connect for
>>>>> example to FPGA?
>>>>>
>>>>> Also how is this related to parallel-memories property?
>>>>
>>>> I called it "dual-flash" simply because it enable the dual flash feature of the QSPI block (bit CR_DFM : Dual Flash Mode)
>>>> which allows to use the 8 lines simultaneously of our dual QSPI block.
>>>
>>> And how is it related to existing parallel-memories property?
>>
>> Maybe I was not specific enough, so let me rephrase - we have already
>> parallel-memories property. How this one is different (to justify the
>> new property)? Is just one memory connected in your case to QSPI over 8
>> data lines?
> 
> Our QSPI block is a dual Quad-SPI memory interface, it can managed 2 QSPI flashes independently.
> There is a specific mode, dual flash mode, where the 2 QSPI flashes can be accessed simultaneously 
> using 8 data lines. In this case, both throughput and capacity are two fold with this mode.
> 
> To illustrate, you can have a look at STM32MP157 reference manual (chapter 27.3.1 figure 172) available here:
> https://www.st.com/resource/en/reference_manual/rm0436-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf 
> 
> As you mentioned above, the goal is to connect a FPGA to this 8 lines bus.
> 
> Hope it clarifies enough ;-)

Only partially. Based on the explanation above, it looks like you want
to use existing parallel-memories property. Please use that one, instead
of adding a new property for the same feature.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
