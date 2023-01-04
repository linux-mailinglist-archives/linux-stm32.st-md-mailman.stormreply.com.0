Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E937D65D49D
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jan 2023 14:43:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95246C69065;
	Wed,  4 Jan 2023 13:43:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE21EC03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jan 2023 13:43:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 304BAqBq011073; Wed, 4 Jan 2023 14:43:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=psqHx1vT2HFJTECjY9O2vZFaO8wI85+sUomLSZP6rQ8=;
 b=P4zl3EGXsKjALmT2k1ez04aDT/P1XhnZ48WE/roce7CQNDQhQm2iKEn8kMgn8KxFxfBP
 8BdKleMA6md8mFC73le/mj02oSfqndRNh4+irlmFf3iKL6QjcPAFH4KnrOqgyUN/1ZDu
 d9aDJJKsdZO48WpVuEhKsk3qPXdczl0MVnZklFQ1STJUhgWBoC2uIlc9eajoFefwseOn
 xbjkWrZUGDW/UKZrU+rcYCJTbxfJfd3K+kYF0L3fw8AsZ0aCKoX818siF/4w0bFHYd9u
 yfOXPdrsvZMUOcZrNzsG8+lvlZlN7GLXZfLZAllieKbu98HxE97rj0dy61S/UPEJ32UH 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcq36u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 14:43:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE5CE100034;
 Wed,  4 Jan 2023 14:43:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8A9821F14B;
 Wed,  4 Jan 2023 14:43:13 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 4 Jan
 2023 14:43:13 +0100
Message-ID: <8f022dc8-d728-ba91-35ed-8a4006855f0d@foss.st.com>
Date: Wed, 4 Jan 2023 14:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh+dt@kernel.org>, <Oleksii_Moisieiev@epam.com>,
 <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-4-gatien.chevallier@foss.st.com>
 <879325d2-4b2d-bc1d-310c-ece4c449ad8f@kernel.org>
 <8357d887-c8ab-39bc-4ef0-62e9225fb2a6@foss.st.com>
 <118e7f0c-bf5d-4bda-ee70-92eb2b71649c@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <118e7f0c-bf5d-4bda-ee70-92eb2b71649c@kernel.org>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Krzysztof,

On 12/22/22 14:57, Krzysztof Kozlowski wrote:
> On 22/12/2022 14:51, Gatien CHEVALLIER wrote:
>> Hello,
>>
>> On 12/22/22 11:26, Krzysztof Kozlowski wrote:
>>> On 21/12/2022 18:30, Gatien Chevallier wrote:
>>>> Adds the list of peripherals IDs under firewall bus on STM32MP15.
>>>>
>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>> ---
>>>>    include/dt-bindings/bus/stm32mp15_sys_bus.h | 98 +++++++++++++++++++++
>>>>    1 file changed, 98 insertions(+)
>>>>    create mode 100644 include/dt-bindings/bus/stm32mp15_sys_bus.h
>>>>
>>>> diff --git a/include/dt-bindings/bus/stm32mp15_sys_bus.h b/include/dt-bindings/bus/stm32mp15_sys_bus.h
>>>> new file mode 100644
>>>> index 000000000000..97eacc7b5f16
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/bus/stm32mp15_sys_bus.h
>>>
>>> That's wrong in multiple ways:
>>> 1. No underscores
>>> 2. Missing vendor prefix
>>> 3. Name not matching compatible.
>>
>> Sure, will comply in V3.
>>
>>>
>>>> @@ -0,0 +1,98 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>> +/*
>>>> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
>>>> + */
>>>> +#ifndef _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
>>>> +#define _DT_BINDINGS_BUS_STM32MP15_SYS_BUS_H
>>>> +
>>>> +/* ETZPC IDs */
>>>> +#define STM32MP1_ETZPC_STGENC_ID	0
>>>> +#define STM32MP1_ETZPC_BKPSRAM_ID	1
>>>> +#define STM32MP1_ETZPC_IWDG1_ID		2
>>>> +#define STM32MP1_ETZPC_USART1_ID	3
>>>> +#define STM32MP1_ETZPC_SPI6_ID		4
>>>> +#define STM32MP1_ETZPC_I2C4_ID		5
>>>> +/* ID 6 reserved */
>>>
>>> Reserved why? These are IDs so they start from 0 and go by 0. Don't
>>> hard-code some register offsets.
>>
>> Here, I do define IDs. Some appear as reserved based on what I've seen
>> in the SoC datasheet that states these as "indexes"
>>
>> Please see the table 94 in chapter 15.6 (ETZPC) of the STM32MP157
>> Reference manual:
>> [1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
> 
> Then why do you define them in bindings? Use raw numbers. Do you see
> anywhere in arm/arm64 bindings for GIC_SPI interrupt numbers?
> 

What would you think of simply removing the comments that state that IDs 
are reserved, mimicking the way it is for qcom bindings? Fundamentally, 
they are indeed only IDs and could be raw numbers.

IMO, this makes reading the device tree harder. Because you'd have to 
look what the raw number corresponds to.

To take an example, it has already been done for SCMI clocks and I find 
it eases comprehension.

Best regards,
Gatien

> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
