Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 567AFA46C4D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 21:25:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 096AFC7A833;
	Wed, 26 Feb 2025 20:25:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A21BC7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 20:25:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QG3IeZ028965;
 Wed, 26 Feb 2025 21:23:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 40P6YA6Gfjsk6WHscxOoeamuC5y6WvMtWXK5t1BqI08=; b=zK2QGdzDvDEwtaNd
 jhHpzdye3apCHNzgIoAFSUSptp4j/yLQaM0OmteUdHVLpIkXDoooJnQazJeT1qhT
 YoSZoPIlUViwT3l+Tzlwir+k9zv9A6nz/rImAL6WVi/mRqka4lbJ6pjtxitMg+b/
 Cayt3540zUhomSar9Gvctmb03ILdrkBYvuI3C/XkfHb14LcxgVgvFlfBxBVle2mW
 nbbHqkKcyQ8MZpn4Wy+wF3/e/hccjcfYPAXvw5kicp5UHzkhHlvLcL6Sxdy+TutG
 oidbpuKMGawsOi32QXmrZafcxpI6kRq9xfq2vVEbC6a3kpWIGZqWcfZGobGp/CW9
 IDD4rg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451pt3phb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 21:23:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 06B0C40069;
 Wed, 26 Feb 2025 21:22:35 +0100 (CET)
Received: by euls16034.sgp.st.com (STMicroelectronics, from userid 89)
 id 6DCAC4D33B6; Wed, 26 Feb 2025 19:17:26 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B053443D2B;
 Wed, 26 Feb 2025 19:17:26 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:17:26 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:17:25 +0100
Message-ID: <4010c7b7-f285-40e6-a032-055c4252ecb7@foss.st.com>
Date: Wed, 26 Feb 2025 19:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-2-fabrice.gasnier@foss.st.com>
 <20250225-outgoing-scorpion-of-music-be0bea@krzk-bin>
 <acabacb8-8ea1-4b16-a562-8ffba64fdd36@foss.st.com>
 <8b42f0ad-2993-43b8-9055-6d74dc3bafbe@kernel.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <8b42f0ad-2993-43b8-9055-6d74dc3bafbe@kernel.org>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_06,2025-02-26_01,2024-11-22_01
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 will@kernel.org, tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/8] dt-bindings: mfd: stm32-lptimer: add
 support for stm32mp25
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

On 2/26/25 08:51, Krzysztof Kozlowski wrote:
> On 25/02/2025 15:57, Fabrice Gasnier wrote:
>> On 2/25/25 13:02, Krzysztof Kozlowski wrote:
>>> On Mon, Feb 24, 2025 at 07:01:43PM +0100, Fabrice Gasnier wrote:
>>>>    pwm:
>>>>      type: object
>>>>      additionalProperties: false
>>>>  
>>>>      properties:
>>>>        compatible:
>>>> -        const: st,stm32-pwm-lp
>>>> +        enum:
>>>> +          - st,stm32-pwm-lp
>>>> +          - st,stm32mp25-pwm-lp
>>>>  
>>>>        "#pwm-cells":
>>>>          const: 3
>>>> @@ -69,7 +76,9 @@ properties:
>>>>  
>>>>      properties:
>>>>        compatible:
>>>> -        const: st,stm32-lptimer-counter
>>>> +        enum:
>>>> +          - st,stm32-lptimer-counter
>>>> +          - st,stm32mp25-lptimer-counter
>>>
>>> Driver changes suggest many of these are compatible. Why isn't this expressed?
>>
>> Hi Krzysztof,
>>
>> The Low Power Timer (LPTIM) hardware isn't fully backward compatible.
>>
>> At driver level, as indicated in the cover-letter, same feature list as
>> on STM32MP1x is supported currently. This is probably what makes it look
>> like it's compatible, but it's not fully compatible.
> 
> I don't understand. Same feature list is supported means fully
> compatible, but you say not fully compatible. You are aware that
> compatible means not the same?
> 
>>
>> The hardware controller is a bit different. Some registers/bits has been
>> revisited among other things. This is the purpose for these new compatibles.
> 
> We do not discuss new compatibles. We discuss lack of compatibility. If
> registers/bits are changed, how existing driver can work with same ID table?

Hi Krzysztof,

To summarize on dt-bindings side, here is my view, following your
comments on per driver basis of the compatible usage.

Let's keep these new compatibles:
- "st,stm32mp25-lptimer-trigger"
- "st,stm32mp25-lptimer-counter"

Both reflect not only LPTimer hardware update, but also specific
interconnect to other hardware blocks throughout all the STM32MP25 SoC.

Other compatible strings may be dropped. Reading the
revision/identification register of the LPTimer should be enough for
compatibility in the related drivers.

I'll update this in next revision of the series.

Thanks for reviewing,
Best Regards,
Fabrice

> 
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
