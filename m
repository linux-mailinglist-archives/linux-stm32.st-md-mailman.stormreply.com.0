Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8CD303AD4
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 11:54:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA282C57182;
	Tue, 26 Jan 2021 10:54:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A987C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 10:54:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10QAqufw004296; Tue, 26 Jan 2021 11:54:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oDjBJuJpMKo7xbTwRreIvyJRv+aqOi5h1gL7iJ8CNq8=;
 b=KAcKITnCZZ2uhLJpIuvNYGd72EkxeX4dcfDubN27Wbwjwqaq++se5pcPHML5NrS/qE6f
 UEqXaLNk5Qd3odmslBs5xnRy17eK85olMAeCU4hS2DarlNiqW1jrLsTtClbiKdOY3zTh
 vD6maUrTLZ2Bwg/QRExX2CyVlIJ2FE3Hem3fJvcIXR68X04HihMA81hrM1NXy45sGHGa
 YO408kvc/6Wdk8AUNAiJ1/F/sa5AsD1RWMXlE/qsRgxpVcSAI1E64PjPx36ygXBh06hS
 4dbOOTHRYD8STic7OkU2tD9DNEi1fEqwgPWQAwuAMQQRzgfProwWWVtku+CxL9mK/WLw fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3689tdrqpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 11:54:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFB84100034;
 Tue, 26 Jan 2021 11:54:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99B0D235547;
 Tue, 26 Jan 2021 11:54:32 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Jan
 2021 11:54:32 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210106204347.475920-1-marex@denx.de>
 <20210106204347.475920-3-marex@denx.de>
 <e7ccdf7c-c7fa-4d03-2400-d4d89815d5d0@foss.st.com>
 <73f6d2cc-8dd7-b005-7faa-db9956f46aa5@denx.de>
 <332e7c43-8489-d8b2-e8e1-1fb0d6fde1ee@foss.st.com>
 <adb57565-a83a-ec3f-633c-ae3daa6db62a@denx.de>
 <3c5a4ac9-7874-2d4e-f353-5cf3ad79cfe1@foss.st.com>
 <9c41ae2b-06f2-b09f-d708-0f4ec96e67b6@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ee8dd8c4-6437-227d-c0bb-6f6d9d12e472@foss.st.com>
Date: Tue, 26 Jan 2021 11:54:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9c41ae2b-06f2-b09f-d708-0f4ec96e67b6@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_06:2021-01-25,
 2021-01-26 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 3/4] [RFC] ARM: dts: stm32: Add mux for
	ETHRX clock
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



On 1/26/21 11:40 AM, Marek Vasut wrote:
> On 1/26/21 11:17 AM, Alexandre TORGUE wrote:
>>
>>
>> On 1/16/21 6:01 PM, Marek Vasut wrote:
>>> On 1/15/21 4:22 PM, Alexandre TORGUE wrote:
>>>
>>> Hi,
>>>
>>> [...]
>>>
>>>>>>> The implementation of ETH_RX_CLK/ETH_REF_CLK handling currently 
>>>>>>> does not
>>>>>>> permit selecting the clock input from SoC pad. To make things 
>>>>>>> worse, the
>>>>>>> implementation of this is partly present and is split between the 
>>>>>>> clock
>>>>>>> driver and dwmac4 driver. Moreover, the ETHRX clock parent is 
>>>>>>> incorrect.
>>>>>>
>>>>>> Sorry but I don't understand which configuration is missing. I 
>>>>>> think we can handle all possible cases for RMII. At the glue layer 
>>>>>> (dwmac-stm32.c) clocks gates and syscfg are set regarding device 
>>>>>> tree binding (see the tab in dwmac-stm32.c). You could have a look 
>>>>>> here for more details: 
>>>>>> https://wiki.st.com/stm32mpu/wiki/Ethernet_device_tree_configuration
>>>>>>
>>>>>> Regarding the clock parent, yes it is not at the well frequency if 
>>>>>> you want to select this path. Our current "clock tree" is done to 
>>>>>> fit with our ST reference boards (we have more peripherals than 
>>>>>> PLL outputs so we have to make choices). So yes for 
>>>>>> customer/partners boards this clock tree has to be modified to 
>>>>>> better fit with the need (either using assigned-clock-parent or by 
>>>>>> modifying bootloader clock tree (tf-a or u-boot)).
>>>>>
>>>>> I don't think you handle all the configuration options, but I might 
>>>>> also be confused.
>>>>>
>>>>> See Figure 83. Peripheral clock distribution for Ethernet in the 
>>>>> MP1 datasheet for the below.
>>>>>
>>>>> The current setup I have needs 50 MHz on SoC pad PA1 to drive the 
>>>>> PHY clock, and uses eth_clk_fb to supply ETH_RX_CLK. However, the 
>>>>> 50 MHz is sourced directly from PLL4P, which then has to run at 50 
>>>>> MHz and that in turn reduces clock frequency for other blocks 
>>>>> connected to PLL4P (e.g. SDMMC, where the impact is noticable).
>>>>
>>>> Ok that's the common path to clock a PHY a 50MHz without using the 
>>>> ref_clk coming from the PHY. And yes I can understand that the 
>>>> drawback is huge).
>>>
>>> So lets fix it.
>>
>> There is no issue in code. It is just clock tree configuration issue. 
>> Either you don't use PLL4P for Ethernet (what you're doing) or you 
>> don't use PLL4P for SDMMC. But yes, there are not a lot of possibilities.
> 
> I am supplying MCO2 with PLL4P, that is PLL4P->MCO2->ETHRX . To enable 
> this entire chain of clock, I need the correct clock tree. Currently 
> that cannot be modeled, can it?
> 

Maybe I miss something, I thought your setup was like that:

First clock path to your PHY:
--------------------

PLL4P ---> MCO2 ---> X1 (PHY input clock which replaces crystal)
It is not directly linked to the dwmac-stm32. You "just" provide a clock 
to MCO2. After that you can use MCO2 pins for any usages.

Second clock patch:
--------------------

50MHz (refclk coming from phy) --> ETH_REF_CLK pad
This one is already covered in dwmac-stm32.

Why do you want to link the both clock paths ?

>>>>> So, what I want to model here is this:
>>>>>
>>>>> PLL4P = 100 MHz
>>>>> MCO2 is supplied by PLL4P and set to /2 , so MCO2 = 50 MHz
>>>>> SoC pad PG2 is set as MCO2 output, thus a source of 50 MHz signal
>>>>> SoC pad PA1 is set as ETH_RX_CLK and connected to PG2
>>>>
>>>> Ok I see (to be honest IIWR we didn't test i :$) but it should work.
>>>
>>> It does work, I have boards which use this setup already.
>>>
>>>>> This works fine in practice, except it cannot be modeled using 
>>>>> current DT bindings, even though it should be possible to model it.
>>>>
>>>> For dwmac point of view it's quite the same thing to have your PHY 
>>>> clocking by MCO or by a crystal. You just need to configure RX_REF 
>>>> pad and ETH_CLK_SEL to get the 50 MHz RMII reference clock.
>>>
>>> Yes
>>>
>>>>>>> First, the ETHRX clock in clk-stm32mp1.c only represents the 
>>>>>>> ETHRXEN gate,
>>>>>>> however it should represent also ETH_REF_CLK_SEL mux. The problem 
>>>>>>> is that
>>>>>>> the ETH_REF_CLK_SEL mux is currently configured in the DWMAC4 
>>>>>>> driver and
>>>>>>> the ETH_REF_CLK_SEL bit is part of SYSCFG block, not the DWMAC4 
>>>>>>> or the
>>>>>>> clock block.
>>>>>>
>>>>>> dwmac4-stm32 doesn't contain code for dwmac4 but it contains the 
>>>>>> glue around the dwmac4: syscfg, clocks ...
>>>>>
>>>>> The problem is that dwmac4-stm32 isn't the right place to configure 
>>>>> the ETHRX clock mux, that should be in the clock driver. So the 
>>>>> stm32 clock driver should have SYSCFG handle and configure 
>>>>> ETH_REF_CLK_SEL mux. The "st,eth-ref-clk-sel" DT prop would then 
>>>>> not be needed at all, as the reference clock select would be 
>>>>> configured using assigned-clocks in DT.
>>>>
>>>> Idea was to keep at the same place the Ethernet glue configuration. 
>>>> We can't move all this glue into clock driver as phy interface is 
>>>> needed to well configure some sysconf registers.
>>>
>>> This configuration can be done by the clock driver too. And in fact, 
>>> I believe it should be done by the clock driver, just like it's done 
>>> for all the other clock muxes with gates in the clock driver, except 
>>> in this case the mux is in syscfg and gate is in rcc.
>>
>> As said, choice has been done to do it in dwmac-stm32, and sorry I see 
>> more drawbacks than benefits to move it now.
> 
> Surely a backward-compatible implementation would be possible, how do 
> you feel about that ?

Well done I can't say "no" in this case.

> 
>>>> Current dwamc-stm32 glue is working and documented. I'm not 
>>>> convinced to develop a new one by splitting clock sysconf in clock 
>>>> driver and phy interface management at ethernet level. I think we 
>>>> will get the same functional result (but yes maybe more 
>>>> understandable at dt-bindings level). We could maybe update binding 
>>>> name to be more clear.
>>>
>>> You don't get the same result, since you cannot model the MCO2 input 
>>> into ETHRX. Or can you ?
>>
>> Why do you want to model MCO2 into ETHRX ? MCO2 just replace a 
>> crystal, and when a crystal is used, it is not modeled. I think is it 
>> the same case for MCO2.
> 
> I need to correctly enable all the clock instead of keeping MCO2 enabled 
> all the time. If ethrx is not needed, the clock are disabled and if even 
> the upstream clock are no longer needed, they (MCO2, and then PLL4P) can 
> be disabled too.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
