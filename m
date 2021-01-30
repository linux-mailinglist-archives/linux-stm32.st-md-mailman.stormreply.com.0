Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC130978E
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jan 2021 19:36:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECF75C5718C;
	Sat, 30 Jan 2021 18:36:15 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC038C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jan 2021 18:36:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DSjb1725sz1qsZn;
 Sat, 30 Jan 2021 19:36:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DSjb15D5Rz1tYTW;
 Sat, 30 Jan 2021 19:36:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id cRGbL42KBVxR; Sat, 30 Jan 2021 19:36:11 +0100 (CET)
X-Auth-Info: Qv6DOycKgnrp3RAbb23CnS1O4IkclZhUqSOMG1BDRCo=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 30 Jan 2021 19:36:11 +0100 (CET)
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210106204347.475920-1-marex@denx.de>
 <20210106204347.475920-3-marex@denx.de>
 <e7ccdf7c-c7fa-4d03-2400-d4d89815d5d0@foss.st.com>
 <73f6d2cc-8dd7-b005-7faa-db9956f46aa5@denx.de>
 <332e7c43-8489-d8b2-e8e1-1fb0d6fde1ee@foss.st.com>
 <adb57565-a83a-ec3f-633c-ae3daa6db62a@denx.de>
 <3c5a4ac9-7874-2d4e-f353-5cf3ad79cfe1@foss.st.com>
 <9c41ae2b-06f2-b09f-d708-0f4ec96e67b6@denx.de>
 <ee8dd8c4-6437-227d-c0bb-6f6d9d12e472@foss.st.com>
 <57ff08b6-36c1-9e00-a55f-54bf8ade2b69@denx.de>
 <45443b53-3b48-afb6-b7d2-f84e0c33e85b@foss.st.com>
 <538d5520-7491-9cfe-7449-766d836784da@denx.de>
 <e93de917-56cd-7956-ae2a-37f3c714c575@foss.st.com>
 <b33f2d0c-3204-3c4d-74e6-a33ee9824766@denx.de>
 <503d9902-6a23-f0fe-9616-cde02a9df2d9@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a7f6c579-9aaf-bbd8-b0b6-1dc977f1ef11@denx.de>
Date: Sat, 30 Jan 2021 19:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <503d9902-6a23-f0fe-9616-cde02a9df2d9@foss.st.com>
Content-Language: en-US
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

On 1/29/21 4:19 PM, Alexandre TORGUE wrote:
> 
> 
> On 1/26/21 8:11 PM, Marek Vasut wrote:
>> On 1/26/21 5:47 PM, Alexandre TORGUE wrote:
>>>
>>>
>>> On 1/26/21 4:42 PM, Marek Vasut wrote:
>>>> On 1/26/21 4:40 PM, Alexandre TORGUE wrote:
>>>>>
>>>>>
>>>>> On 1/26/21 1:59 PM, Marek Vasut wrote:
>>>>>> On 1/26/21 11:54 AM, Alexandre TORGUE wrote:
>>>>>> [...]
>>>>>>>>>>>>>> The implementation of ETH_RX_CLK/ETH_REF_CLK handling 
>>>>>>>>>>>>>> currently does not
>>>>>>>>>>>>>> permit selecting the clock input from SoC pad. To make 
>>>>>>>>>>>>>> things worse, the
>>>>>>>>>>>>>> implementation of this is partly present and is split 
>>>>>>>>>>>>>> between the clock
>>>>>>>>>>>>>> driver and dwmac4 driver. Moreover, the ETHRX clock parent 
>>>>>>>>>>>>>> is incorrect.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Sorry but I don't understand which configuration is 
>>>>>>>>>>>>> missing. I think we can handle all possible cases for RMII. 
>>>>>>>>>>>>> At the glue layer (dwmac-stm32.c) clocks gates and syscfg 
>>>>>>>>>>>>> are set regarding device tree binding (see the tab in 
>>>>>>>>>>>>> dwmac-stm32.c). You could have a look here for more 
>>>>>>>>>>>>> details: 
>>>>>>>>>>>>> https://wiki.st.com/stm32mpu/wiki/Ethernet_device_tree_configuration 
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Regarding the clock parent, yes it is not at the well 
>>>>>>>>>>>>> frequency if you want to select this path. Our current 
>>>>>>>>>>>>> "clock tree" is done to fit with our ST reference boards 
>>>>>>>>>>>>> (we have more peripherals than PLL outputs so we have to 
>>>>>>>>>>>>> make choices). So yes for customer/partners boards this 
>>>>>>>>>>>>> clock tree has to be modified to better fit with the need 
>>>>>>>>>>>>> (either using assigned-clock-parent or by modifying 
>>>>>>>>>>>>> bootloader clock tree (tf-a or u-boot)).
>>>>>>>>>>>>
>>>>>>>>>>>> I don't think you handle all the configuration options, but 
>>>>>>>>>>>> I might also be confused.
>>>>>>>>>>>>
>>>>>>>>>>>> See Figure 83. Peripheral clock distribution for Ethernet in 
>>>>>>>>>>>> the MP1 datasheet for the below.
>>>>>>>>>>>>
>>>>>>>>>>>> The current setup I have needs 50 MHz on SoC pad PA1 to 
>>>>>>>>>>>> drive the PHY clock, and uses eth_clk_fb to supply 
>>>>>>>>>>>> ETH_RX_CLK. However, the 50 MHz is sourced directly from 
>>>>>>>>>>>> PLL4P, which then has to run at 50 MHz and that in turn 
>>>>>>>>>>>> reduces clock frequency for other blocks connected to PLL4P 
>>>>>>>>>>>> (e.g. SDMMC, where the impact is noticable).
>>>>>>>>>>>
>>>>>>>>>>> Ok that's the common path to clock a PHY a 50MHz without 
>>>>>>>>>>> using the ref_clk coming from the PHY. And yes I can 
>>>>>>>>>>> understand that the drawback is huge).
>>>>>>>>>>
>>>>>>>>>> So lets fix it.
>>>>>>>>>
>>>>>>>>> There is no issue in code. It is just clock tree configuration 
>>>>>>>>> issue. Either you don't use PLL4P for Ethernet (what you're 
>>>>>>>>> doing) or you don't use PLL4P for SDMMC. But yes, there are not 
>>>>>>>>> a lot of possibilities.
>>>>>>>>
>>>>>>>> I am supplying MCO2 with PLL4P, that is PLL4P->MCO2->ETHRX . To 
>>>>>>>> enable this entire chain of clock, I need the correct clock 
>>>>>>>> tree. Currently that cannot be modeled, can it?
>>>>>>>>
>>>>>>>
>>>>>>> Maybe I miss something, I thought your setup was like that:
>>>>>>>
>>>>>>> First clock path to your PHY:
>>>>>>> --------------------
>>>>>>>
>>>>>>> PLL4P ---> MCO2 ---> X1 (PHY input clock which replaces crystal)
>>>>>>> It is not directly linked to the dwmac-stm32. You "just" provide 
>>>>>>> a clock to MCO2. After that you can use MCO2 pins for any usages.
>>>>>>>
>>>>>>> Second clock patch:
>>>>>>> --------------------
>>>>>>>
>>>>>>> 50MHz (refclk coming from phy) --> ETH_REF_CLK pad
>>>>>>> This one is already covered in dwmac-stm32.
>>>>>>>
>>>>>>> Why do you want to link the both clock paths ?
>>>>>>
>>>>>> Because the X1 (MCO2 output) is the same net as 50 MHz ETH_REF_CLK 
>>>>>> input. MCO2 output is routed on a SoC pin and that is connected 
>>>>>> with a wire to ETH_REF_CLK SoC pin (input).
>>>>>
>>>>> Ok I see, but I don't think you have to link both clocks.
>>>>
>>>> If I don't, then MCO2 will not have any consumer and would be turned 
>>>> off by the kernel.
>>>
>>> I agree, but IMO the MCO clock should be declared with 
>>> CLK_IGNORE_UNUSED flag in stm32mp1 clock driver.
>>
>> Why? It can be safely turned off if it is only used to supply ETHRX. 
>> And if the clock tree is correctly modeled, that is what happens.
> 
> You're right. I think we could only add an optional clock inside dwmac 
> stm32 glue to take this phy clock (here MCO2)

But you already do have clock in the glue, it's the ETHRX clock. There 
are no additional clock that have to be added to the glue.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
