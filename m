Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC42813C343
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 14:34:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE17C36B0F;
	Wed, 15 Jan 2020 13:34:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D82B1C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 13:34:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00FDX6Ud010870; Wed, 15 Jan 2020 14:34:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=U+zx4gXScyllawgjqtzwHFpsgDj3TweStrajWX6U4lk=;
 b=FNDhIYJuuE0MxSyYk6SryKZVpGcOMC1NWoG+5BzIl3S9TSdO2528VA/8hyITvFNJDlbh
 l+rWOkFKVorzxRaEp70TzGUTuTLw/UKEFS8+OYAxkXQiuV55BSSFJ06og+nT6u7CFGPT
 C4ypYsNXRL5bzlAKN0cXoXBLcXpUUAld4M9FYf48BVJApS4anzsScdGaRQvTUs+SNGjY
 8RMvy+K7UzRXhmgguBMhCxovYpk5wXdfV2e7yPQ65fWoVxW+5o4S0vCjoRwhwARtcpxk
 bXC9D/lGIS87QoJPd3faLQBiFhjB5ALRsF2Xd4QGwD8NBsTH26Az8dwTmIM+3x1mKmd7 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7fnuat1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 14:34:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AAEFA10002A;
 Wed, 15 Jan 2020 14:34:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E66721ECEF;
 Wed, 15 Jan 2020 14:34:12 +0100 (CET)
Received: from [10.48.0.71] (10.75.127.47) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 14:34:11 +0100
To: Rob Herring <robh@kernel.org>
References: <1575649028-10909-1-git-send-email-fabrice.gasnier@st.com>
 <20191217234345.GA7738@bogus> <cadc76a7-7e9d-1f0a-21fd-2d7942dbe5c9@st.com>
 <CAL_JsqJdw=WzMhp1d9E3131AuyO7in7bgR5X4NM1n7Ox4X0YXw@mail.gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <acb1e853-c673-7b6d-3ceb-6e994ae06fe1@st.com>
Date: Wed, 15 Jan 2020 14:34:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJdw=WzMhp1d9E3131AuyO7in7bgR5X4NM1n7Ox4X0YXw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-15_02:2020-01-15,
 2020-01-15 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 Peter Meerwald <pmeerw@pmeerw.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX
 / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: iio: adc: stm32-adc:
 convert bindings to json-schema
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

On 1/14/20 8:20 PM, Rob Herring wrote:
> On Tue, Jan 14, 2020 at 10:02 AM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>>
>> On 12/18/19 12:43 AM, Rob Herring wrote:
>>> On Fri, Dec 06, 2019 at 05:17:08PM +0100, Fabrice Gasnier wrote:
>>>> Convert the STM32 ADC binding to DT schema format using json-schema
>>>>
>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>>>> ---
>>>> Note: this applies on top of IIO tree currently (iio-for-5.5c).
>>>>
>>>> Changes in V2:
>>>> - Take almost all of Rob suggestions (removed reg generic description,
>>>>   added minItems, maxItems, st,max-clk-rate-hz range, drop some pipes,
>>>>   simplify clock-names, remove unneeded allOfs)
>>>> - For now, keep all in one file despite there are lots of if/thens in the
>>>>   bindings
>>>> ---
>>>>  .../devicetree/bindings/iio/adc/st,stm32-adc.txt   | 149 -------
>>>>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 454 +++++++++++++++++++++
>>>>  2 files changed, 454 insertions(+), 149 deletions(-)
>>>>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
>>>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>>>
>>>
>>
>>
>> [snip]
>>
>>>> +
>>>> +      st,adc-channels:
>>>> +        description: |
>>>> +          List of single-ended channels muxed for this ADC. It can have up to:
>>>> +            - 16 channels, numbered from 0 to 15 (for in0..in15) on stm32f4
>>>> +            - 20 channels, numbered from 0 to 19 (for in0..in19) on stm32h7 and
>>>> +              stm32mp1.
>>>> +        allOf:
>>>> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +
>>
>> [snip]
>>
>>>> +
>>>> +    allOf:
>>>> +      - if:
>>>> +          properties:
>>>> +            compatible:
>>>> +              contains:
>>>> +                const: st,stm32f4-adc
>>>> +
>>>> +        then:
>>>> +          properties:
>>>> +            reg:
>>>> +              enum:
>>>> +                - 0x0
>>>> +                - 0x100
>>>> +                - 0x200
>>>> +
>>>> +            interrupts:
>>>> +              minimum: 0
>>>> +              maximum: 2
>>>> +
>>>> +            assigned-resolution-bits:
>>>> +              enum: [6, 8, 10, 12]
>>>> +              default: 12
>>>> +
>>>> +            st,adc-channels:
>>>> +              minItems: 1
>>>> +              maxItems: 16
>>>> +              minimum: 0
>>>> +              maximum: 15
>>>
>>> You are mixing array and scalar constraints here. You need:
>>>
>>> minItems: 1
>>> maxItems:16
>>> items:
>>>   minimum: 0
>>>   maximum: 15
>>>
>>> Update dtschema. It will now catch this. There's a few others too.
>>
>> Hi Rob,
>>
>> Sorry for the late reply. I updated dtschema. Now it catches it.
>>
>> I've tried your suggestion, but when I test it, I don't get any error on
>> maxItems.
>>
>> In the example: "st,adc-channels = <0>, <1>, ... more than 16 items;"
>>
>> Is it possible I face some other issue with dtschema ?
> 
> The problem is how "<0>, <1>" vs. "<0 1>" gets encoded. While those
> are the same in the dtb, in yaml we have "[[0], [1]]" vs. "[[0, 1]]".
> Making the brackets significant is helpful for some things like
> phandle+args and 'reg' where we have a matrix of values, but for
> arrays it just gets in the way. I think as I suggested is the right
> form for the binding schema, and we need to either decide what's the
> correct way for brackets or improve the tool to accept both ways.

Hi Rob,

Thanks for the quick answer and clarification.

I'll adopt the way you suggest in V3 (the dts files already use <0 1...>
syntax). I'll also update the example in the bindings to use it, to
point the right form.

Thanks,
Fabrice

> 
> Rob
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
