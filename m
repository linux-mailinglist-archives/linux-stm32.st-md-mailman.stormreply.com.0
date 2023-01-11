Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0AD665B69
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jan 2023 13:33:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C233BC65048;
	Wed, 11 Jan 2023 12:33:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCB04C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 12:33:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29ADDB81A6B;
 Wed, 11 Jan 2023 12:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F8EC433D2;
 Wed, 11 Jan 2023 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673440386;
 bh=6W/sprcBudgz8eSbOqZAoynmDsVr5n+AmKEg6gnvo7E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iNT+x5ovfUERKQKn0QCi2Hr6v1mc7OiOcp6FQWt55TXInjq9T7CaIw11ND7C5K6ZT
 qrEZ7E3sqmJKzPFVmXFT/Dwd+jckngmq17h0qOdHtAhtAOa6FseN9c0fgoPKqXiP4a
 yjqB+ITh1XrU3EA61z774v29nYdIAo76DcGTTgrHXRmxgCU9BwkfWP9Y8MsqvrLHO/
 XWB4TpvaGXUcGljISgvuKfCUcmis1KaMB+7QA1ul4ZpeKCnZjKlzNmHw1Z7AptcCiu
 M26Li5Hk/rrhHH8ew/GEO62iVArAjy0ZIA5pSknU6M7DIehshw8AlKfbin3S/yEJFi
 L/v4Ma3Fu4+YQ==
Message-ID: <f169d05a-7a07-aedf-bad2-30cb4a88fc16@kernel.org>
Date: Wed, 11 Jan 2023 13:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
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
 <dfe328fc-349b-3357-a8ac-6fc363f403fc@kernel.org>
 <19157c67-fa83-e598-d7ee-c313f3d4b198@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <19157c67-fa83-e598-d7ee-c313f3d4b198@foss.st.com>
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

On 09/01/2023 12:54, Gatien CHEVALLIER wrote:
>>>> Then why do you define them in bindings? Use raw numbers. Do you see
>>>> anywhere in arm/arm64 bindings for GIC_SPI interrupt numbers?
>>>>
>>>
>>> What would you think of simply removing the comments that state that IDs
>>> are reserved, mimicking the way it is for qcom bindings? Fundamentally,
>>> they are indeed only IDs and could be raw numbers.
>>
>> If these are IDs then there are no reserved numbers and they are
>> continuous from 0 to X. Without gaps.
>>
>>> IMO, this makes reading the device tree harder. Because you'd have to
>>> look what the raw number corresponds to.
>>
>> Sure, but that's not the reason to put numbers to the bindings... You
>> mix defines with bindings.
>>
>>> To take an example, it has already been done for SCMI clocks and I find
>>> it eases comprehension.
>>
>> You need to be a bit more specific...
> 
> Please see include/dt-bindings/clock/stm32mp1-clks.h, where there are 
> various clock IDs defined, some of them not contiguous.

These are pretty often added to accommodate space for exposing these
clocks in the future. IOW, these might be IDs just not all are shared
via header. There are such platforms and it is OK.

> 
> Errata: for SCMI clocks they are indeed contiguous but not clock IDs.
> 
>>
>> Anyway, IDs should be placed in bindings. Some mapping of
>> internal/hardware ports, registers, offsets, values - usually not.
>>
>> I don't know where exactly your case fits, but when some IDs are
>> reserved it is a clear sign that these are not IDs (again - IDs start
>> from 0 and go incrementally by one, without gaps).
>>
> 
> I do agree with your statement that IDs should not be reserved.
> 
> I think I've missed something to better highlight my point of view: It 
> would be perfectly fine using numbers that are not described in this 
> bindings file. It would just not correspond to an ID of a peripheral 
> described in the SoC reference manual, thus making no sense to use them. 
> Stating that they are reserved was incorrect, it's just that peripherals 
> get a firewall ID, depending on the platform.

Why peripheral ID should be put into the bindings? Why bindings is a
place for it? Interrupt numbers, GPIO indices/numbers, register offsets,
IOMMU ports - none of these are suitable for bindings.

> 
> I think it should be okay not describing IDs that are not relevant, what 
> do you think? I found that in include/dt-bindings/arm/qcom,ids.h, IDs 
> are not continuous. Not mentioning an ID could be used for deprecation.

These are not IDs of clocks. These are unique identifiers assigned by
vendor and used by different pieces: firmware/bootloaders, DTS and Linux
driver. We have no control of them but they exist. They also do not
represent any hardware number.

You bring some examples as an argument, but these examples are not
always related to your case. To be clear - we talk here about bindings,
so they bind different interfaces of software components (e.g. Linux
kernel with DTS). Now, what is the different interface here in your
case? If you say your peripheral hardware ID, then answer is no - this
is not software interface.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
