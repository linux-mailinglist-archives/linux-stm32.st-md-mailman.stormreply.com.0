Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20E99A8BA
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2024 18:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74179C7802D;
	Fri, 11 Oct 2024 16:18:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70AA8C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 16:18:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 50E0A89386;
 Fri, 11 Oct 2024 18:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728663527;
 bh=knbUJOYVVLigaFfV1Maa2Dmr2xPGKb/0OGh2oD7ajnc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CdN6M5+61CW/RsuLF2CiAF7HwXoGjWwV3QO2LOJZnE5aPSwVMz6r+Zqnze/igo3Ve
 sKuAzGuS2xr+hFxb4CRng2n7vK/0cdRVXLSnUZ47aoGg2AQw0AMHIXweUbbU6xu/bc
 o9dvSJ/AeAi4Ml+PN5mmA82aU/jg4gkEtFb0yMDdi3N4UeFd01X/q/Q/k9NAAopkgh
 M38tnEEooMrO//ioA5EDR83nD+qISHOokq2DX0zp5NI6p7h+LHlpigF4sfKxFgu9gX
 J+IQr6sdOLvw3RH4gUVNdAXyeE4PHDU5Fugl1vHF/VfSFgsZOpbM6bo2V9X5x6eYZs
 ucOPxHN824bTA==
Message-ID: <5db8deb4-8da6-44ef-91ab-7489975cc9e5@denx.de>
Date: Fri, 11 Oct 2024 18:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-3-gatien.chevallier@foss.st.com>
 <2fad1566-49f9-4586-b0d4-8a4a12f9e69e@denx.de>
 <9283caeb-1b84-43c2-a8a4-6b43a6962f34@foss.st.com>
 <b4932f99-cda4-42ef-88d8-461ca6e8cefd@denx.de>
 <6a4cccb4-9e55-437d-925b-5f5bb1804159@foss.st.com>
 <c59f3593-cb69-48c6-ab0e-f1275c7e5477@denx.de>
 <3817a22e-72aa-45d3-8e16-19c703f7f7af@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3817a22e-72aa-45d3-8e16-19c703f7f7af@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] hwrng: stm32 - implement support for
 STM32MP25x platforms
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

On 10/11/24 5:51 PM, Gatien CHEVALLIER wrote:
> 
> 
> On 10/11/24 14:38, Marek Vasut wrote:
>> On 10/11/24 2:07 PM, Gatien CHEVALLIER wrote:
>>>
>>>
>>> On 10/11/24 13:24, Marek Vasut wrote:
>>>> On 10/11/24 11:55 AM, Gatien CHEVALLIER wrote:
>>>>>
>>>>>
>>>>> On 10/7/24 15:54, Marek Vasut wrote:
>>>>>> On 10/7/24 3:27 PM, Gatien Chevallier wrote:
>>>>>>> Implement the support for STM32MP25x platforms. On this platform, a
>>>>>>> security clock is shared between some hardware blocks. For the RNG,
>>>>>>> it is the RNG kernel clock. Therefore, the gate is no more shared
>>>>>>> between the RNG bus and kernel clocks as on STM32MP1x platforms and
>>>>>>> the bus clock has to be managed on its own.
>>>>>>>
>>>>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>>>> A bit of a higher-level design question -- can you use drivers/ 
>>>>>> clk/ clk-bulk.c clk_bulk_*() to handle all these disparate count 
>>>>>> of clock easily ?
>>>>>
>>>>> Hi, I'd like to make sure that we enable the core clock before the bus
>>>>> clock so that the RNG hardware block can start its internal tests 
>>>>> while
>>>>> we ungate the bus clock. It's not a strong opinion but it feels 
>>>>> better.
>>>> Maybe this could still work if the struct clk_bulk_data {} is 
>>>> ordered that way, so the bus clock are first, and the rest afterward ?
>>>
>>> I guess you meant, the core first.
>>
>> Err, yes, core.
>>
>>> Putting the bus clock first with the updated YAML doc generates a
>>> warning when checking the bindings. I guess what you propose is OK
>>> then. Core clock is defined first in the device tree.
>>
>> Not in DT, leave DT as-is. Look at struct clk_bulk_data , I think when 
>> you use the clk_bulk_*() functions, you pass in a list of struct 
>> clk_bulk_data, which each describes one clock, so just make sure that 
>> list of struct clk_bulk_data in the driver is ordered the way you need 
>> it to be ordered and you should be fine.
> 
> I've sent a V2 with something that is functional but not aesthetic.
> You'll tell me if that's what you had in mind.
I sent you a slightly tweaked example which should work too and should 
be a bit nicer.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
