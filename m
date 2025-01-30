Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B765CA229E8
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2025 09:56:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52F2FC71289;
	Thu, 30 Jan 2025 08:56:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FB8FC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 08:56:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U6QBVh019628;
 Thu, 30 Jan 2025 09:56:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 EzcyMoLNvtKxLHNHjczcsoR+W7/fDhlAI5vFIoUcVSo=; b=neJk4e8FK6tYF+Ad
 nZVB/yh2Q9xUNrnMqDr28yaYonhcm2KYV5ISdfmAPhrU5gUgXXC+mkyKX8EvL5p0
 VjoBCwUOMAZ/ADTEU4HQ8h0kjcoQIc20QMXQC8UHCDWS0ke+BwJPJIWIjJJqjVb0
 hLLeQHAjwXdSO6aM5VBtdtMzleOR+xEe3E5lFYmTvvd/HaBawDQVoPpogg1jAE9d
 CHOxGdkj1ez2zHWpaP9ZYadaswP6UOoewFMxiEb6RdPV/HTWXsgq04ZxG2z53a9G
 NkWLMN1hiGpE5HZO9BGasSqec8BEozdO/YRrSSkvnaptqRyOjiIQ7vXQUsl6OsGZ
 YZSByQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f26x6w4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 09:56:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9EE874002D;
 Thu, 30 Jan 2025 09:54:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEB2C27EEB1;
 Thu, 30 Jan 2025 09:51:29 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 09:51:28 +0100
Message-ID: <98f9bdfa-5107-412a-8b9b-41f8135954fc@foss.st.com>
Date: Thu, 30 Jan 2025 09:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
 <e3d01bce-a7d4-4690-8a2f-3bbb1ee5ccb7@foss.st.com>
 <20250129-feminize-spotlight-2cee53f8b463@spud>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250129-feminize-spotlight-2cee53f8b463@spud>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI
	controller
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



On 1/29/25 18:53, Conor Dooley wrote:
> On Wed, Jan 29, 2025 at 06:40:23PM +0100, Patrice CHOTARD wrote:
>> On 1/28/25 19:02, Conor Dooley wrote:
>>> On Tue, Jan 28, 2025 at 09:17:23AM +0100, patrice.chotard@foss.st.com wrote:
>>>> +  memory-region:
>>>> +    maxItems: 1
>>>
>>> Whatever about not having descriptions for clocks or reg when there's
>>> only one, I think a memory region should be explained.
>>
>> ok i will add :
>>
>>     description: |
> 
> The | isn't needed here.
ok

> 
>>       Memory region to be used for memory-map read access.
> 
> I don't think that's a good explanation, sorry. Why's a memory-region
> required for read access?

The OCTOSPI interface support 3 functional modes: 
  _ indirect
  _ automatic polling status
  _ memory-mapped

256MB are reserved in the CPU memory map for the 2 OCTOSPI instance.
This area is used when OCTOSPI1 and/or OCTOSPI2 operate in memory-mapped
mode. In this mode, read access are performed from the memory device using
the direct mapping.

Thanks
Patrice

> 
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  resets:
>>>> +    items:
>>>> +      - description: phandle to OSPI block reset
>>>> +      - description: phandle to delay block reset
>>>> +
>>>> +  dmas:
>>>> +    maxItems: 2
>>>> +
>>>> +  dma-names:
>>>> +    items:
>>>> +      - const: tx
>>>> +      - const: rx
>>>> +
>>>> +  st,syscfg-dlyb:
>>>> +    description: phandle to syscon block
>>>> +      Use to set the OSPI delay block within syscon to
>>>> +      tune the phase of the RX sampling clock (or DQS) in order
>>>> +      to sample the data in their valid window and to
>>>> +      tune the phase of the TX launch clock in order to meet setup
>>>> +      and hold constraints of TX signals versus the memory clock.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>
>>> Why do you need a phandle here? I assume looking up by compatible ain't
>>> possible because you have multiple controllers on the SoC? Also, I don't
>>
>> Yes, we got 2 OCTOSPI controller, each of them have a dedicated delay block
>>  syscfg register.
> 
> :+1: 
> 
>>> think your copy-paste "phandle to" stuff here is accurate:
>>>       st,syscfg-dlyb = <&syscfg 0x1000>;
>>> There's an offset here that you don't mention in your description.
>>
>> I will add it as following:
>>
>>   st,syscfg-dlyb:
>>     description:
>>       Use to set the OSPI delay block within syscon to
>>       tune the phase of the RX sampling clock (or DQS) in order
>>       to sample the data in their valid window and to
>>       tune the phase of the TX launch clock in order to meet setup
>>       and hold constraints of TX signals versus the memory clock.
>>     $ref: /schemas/types.yaml#/definitions/phandle-array
>>     items:
>>       - description: phandle to syscfg
>>       - description: register offset within syscfg
> 
> :+1:
> 
>>>> +  access-controllers:
>>>> +    description: phandle to the rifsc device to check access right
>>>> +      and in some cases, an additional phandle to the rcc device for
>>>> +      secure clock control
>>>
>>> This should be described using items rather than a free-form list.
>>
>>   access-controllers:
>>     description: phandle to the rifsc device to check access right
>>       and in some cases, an additional phandle to the rcc device for
>>       secure clock control
>>     items:
>>       - description: phandle to bus controller or to clock controller
>>       - description: access controller specifier
>>      minItems: 1
>>      maxItems: 2
> 
> These updates look fine to me.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
