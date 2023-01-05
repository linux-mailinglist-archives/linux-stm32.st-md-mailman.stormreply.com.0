Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1402765F640
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jan 2023 22:54:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B61F2C69069;
	Thu,  5 Jan 2023 21:54:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37016C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jan 2023 21:54:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F340C61CA4;
 Thu,  5 Jan 2023 21:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F13C433D2;
 Thu,  5 Jan 2023 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672955646;
 bh=BKMbgeNKRTwLLZ6gzywCXonl4H9MINwyo263PYluCEQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=djpSGPQoY2/D6IxirgBm46NSbLTUrO+XyeA3KHhXiWW+0C5i0EYkLU2q59PacXYFr
 iuo99Fdn5dHTW/HxiRRkS6IE+1VstaA24xeuBPMoUqBIFtffnKpSifDkUrIwpb99Wm
 PnDozZm0XLlMVce+teHl0698miVd8F54FsHPuEV5lAblPRB6T5qGpW+Mg34BCx80DU
 iHJ9cDUEjtHjc2W90yW4+0NSTpJ8zjm9XSUoh2NVYd0OtnYAyDdqn258DqeuxG4jDt
 xGzN8pe0f0O0+Ct6I6ZP0TyNhvZZf+vXkmfccDkr4jDD5vkmSaouraP4zqcJe3QvIb
 oUikbGqgeGqnQ==
Message-ID: <dfe328fc-349b-3357-a8ac-6fc363f403fc@kernel.org>
Date: Thu, 5 Jan 2023 22:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-4-gatien.chevallier@foss.st.com>
 <879325d2-4b2d-bc1d-310c-ece4c449ad8f@kernel.org>
 <8357d887-c8ab-39bc-4ef0-62e9225fb2a6@foss.st.com>
 <118e7f0c-bf5d-4bda-ee70-92eb2b71649c@kernel.org>
 <8f022dc8-d728-ba91-35ed-8a4006855f0d@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <8f022dc8-d728-ba91-35ed-8a4006855f0d@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 3/7] dt-bindings: bus: add STM32MP15
 ETZPC firewall bus bindings
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

On 04/01/2023 14:43, Gatien CHEVALLIER wrote:
> Hello Krzysztof,
> 
> On 12/22/22 14:57, Krzysztof Kozlowski wrote:
>> On 22/12/2022 14:51, Gatien CHEVALLIER wrote:
>>> Hello,
>>>
>>> On 12/22/22 11:26, Krzysztof Kozlowski wrote:
>>>> On 21/12/2022 18:30, Gatien Chevallier wrote:
>>>>> Adds the list of peripherals IDs under firewall bus on STM32MP15.
>>>>>
>>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>>> ---
>>>>>    include/dt-bindings/bus/stm32mp15_sys_bus.h | 98 +++++++++++++++++++++
>>>>>    1 file changed, 98 insertions(+)
>>>>>    create mode 100644 include/dt-bindings/bus/stm32mp15_sys_bus.h
>>>>>
>>>>> diff --git a/include/dt-bindings/bus/stm32mp15_sys_bus.h b/include/dt-bindings/bus/stm32mp15_sys_bus.h
>>>>> new file mode 100644
>>>>> index 000000000000..97eacc7b5f16
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/bus/stm32mp15_sys_bus.h
>>>>
>>>> That's wrong in multiple ways:
>>>> 1. No underscores
>>>> 2. Missing vendor prefix
>>>> 3. Name not matching compatible.
>>>
>>> Sure, will comply in V3.
>>>
>>>>
>>>>> @@ -0,0 +1,98 @@
>>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>>> +/*
>>>>> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
>>>>> + */
>>>>> +#ifndef _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
>>>>> +#define _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
>>>>> +
>>>>> +/* ETZPC IDs */
>>>>> +#define STM32MP1_ETZPC_STGENC_ID	0
>>>>> +#define STM32MP1_ETZPC_BKPSRAM_ID	1
>>>>> +#define STM32MP1_ETZPC_IWDG1_ID		2
>>>>> +#define STM32MP1_ETZPC_USART1_ID	3
>>>>> +#define STM32MP1_ETZPC_SPI6_ID		4
>>>>> +#define STM32MP1_ETZPC_I2C4_ID		5
>>>>> +/* ID 6 reserved */
>>>>
>>>> Reserved why? These are IDs so they start from 0 and go by 0. Don't
>>>> hard-code some register offsets.
>>>
>>> Here, I do define IDs. Some appear as reserved based on what I've seen
>>> in the SoC datasheet that states these as "indexes"
>>>
>>> Please see the table 94 in chapter 15.6 (ETZPC) of the STM32MP157
>>> Reference manual:
>>> [1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
>>
>> Then why do you define them in bindings? Use raw numbers. Do you see
>> anywhere in arm/arm64 bindings for GIC_SPI interrupt numbers?
>>
> 
> What would you think of simply removing the comments that state that IDs 
> are reserved, mimicking the way it is for qcom bindings? Fundamentally, 
> they are indeed only IDs and could be raw numbers.

If these are IDs then there are no reserved numbers and they are
continuous from 0 to X. Without gaps.

> IMO, this makes reading the device tree harder. Because you'd have to 
> look what the raw number corresponds to.

Sure, but that's not the reason to put numbers to the bindings... You
mix defines with bindings.

> To take an example, it has already been done for SCMI clocks and I find 
> it eases comprehension.

You need to be a bit more specific...

Anyway, IDs should be placed in bindings. Some mapping of
internal/hardware ports, registers, offsets, values - usually not.

I don't know where exactly your case fits, but when some IDs are
reserved it is a clear sign that these are not IDs (again - IDs start
from 0 and go incrementally by one, without gaps).


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
