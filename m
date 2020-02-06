Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 560FE153CD9
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 03:01:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0E51C36B0B;
	Thu,  6 Feb 2020 02:01:05 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4E5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 02:01:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48ChVP4wBlz1qql4;
 Thu,  6 Feb 2020 03:01:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48ChVP3Scdz1qy07;
 Thu,  6 Feb 2020 03:01:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2ws57FTn2mMv; Thu,  6 Feb 2020 03:01:00 +0100 (CET)
X-Auth-Info: +rDtQRE2nPLpashtRVXtw62wMNXq80s9lesteY8tIdU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  6 Feb 2020 03:01:00 +0100 (CET)
To: Alexandre TORGUE <alexandre.torgue@st.com>, Marc Zyngier <maz@kernel.org>
References: <20bb72d0-8258-abc0-e729-4d3d5a75c41c@denx.de>
 <d6e02817-2464-51b9-246a-7720b607b8d6@st.com>
 <65a1c5b2-c1b9-322f-338c-e6ff6379d8d1@denx.de>
 <129d04a0-c846-506d-5726-4a1024d977a6@st.com>
 <80db762c-3b3d-f007-2f9b-dadbffd95782@denx.de>
 <360b1adc-32f1-7993-c463-e52c7a5a8a67@st.com>
 <c4f08f59acd31951527ef1d6e9409e6f@kernel.org>
 <20200123101225.nscpc5t4nmlarbw2@pengutronix.de>
 <03fd1cb7b5985b3221f66c6b0058adc8@kernel.org>
 <20200123105214.ru4j76xbisjtbtgw@pengutronix.de>
 <cf98f4fd257ba4f34c75fe1656bd341b@kernel.org>
 <e1fffd57-4814-ec36-68b4-4207e3d4ae5d@denx.de>
 <f9d98afc-6cb8-ef7b-cff7-a04e14dba4c8@st.com>
 <7e0ce712f7e34b38c8f541644026c52e@kernel.org>
 <5e1c419c-b141-52f6-88f1-ee3ab8219a4e@denx.de>
 <dcbb8f0447f2aa75f0cec6f420310b21@kernel.org>
 <760b42cd-0fc4-5675-3f55-40edfe9440b2@denx.de>
 <73a78da99d5e386bf1d3cb6e263a18ba@kernel.org>
 <101b2f751fff440e9110102e526dfdc4@SFHDAG3NODE2.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d8447a36-c196-c97d-2a4a-9c003d00a212@denx.de>
Date: Thu, 6 Feb 2020 03:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <101b2f751fff440e9110102e526dfdc4@SFHDAG3NODE2.st.com>
Content-Language: en-US
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [Linux-stm32] STM32MP1 level triggered interrupts
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

On 2/5/20 4:36 PM, Alexandre TORGUE wrote:
> 
>>>>>> [...]
>>>>>>
>>>>>>>> But I still wonder, what is the purpose of the EXTImux in that
>>>>>>>> SoC?
>>>>>>>> Shouldn't that permit routing GPIOs directly into GIC SPIs, which
>>>>>>>> would then permit detecting at least level-high interrupts ?
>>>>>>>>
>>>>>>>
>>>>>>> For this SoC, EXTI block detects external line edges and rises a
>>>>>>> GIC SPI interrupt. This EXTi block is mainly used to handle HW
>>>>>>> events like buttons, clocks ... So first issue seems more to be a
>>>>>>> design issue (your design doesn't fit with MP1 datasheet).
>>>>>>>
>>>>>>> Now, let's find a solution. I'll have a look on your proposition:
>>>>>>> "check the line in EOI callback and retrig".
>>>>>>>
>>>>>>> Marc, this kind a solution could be acceptable on your side ?
>>>>>>
>>>>>> It will depend on the nature of the hack you will have to put in
>>>>>> there.
>>>>>> If it is 100% reliable, why not? Anything short of that, probably
>>>>>> not.
>>>>>
>>>>> I had another look into this, and what we would end up is some sort
>>>>> of phandle from exti to all the gpioX nodes in DT, would that be OK
>>>>> ?
>>>>> However, if we do that, then we will have the pinctrl controller
>>>>> (which has the gpio banks as subnodes) require the exti through a
>>>>> phandle and exti require the gpio banks through a phandle, so we end
>>>>> up with some sort of cyclic dependency there.
>>>>>
>>>>> So we would need to somehow have exti lazily deal with it's gpioX
>>>>> controller phandles only when someone requests level interrupt ?
>>>>> That would probably do.
>>>>
>>>> TBH, I don't have much of an opinion here. If you can deal with the
>>>> plumbing that's required to make this thing work reliably, then why
>>>> not?
>>>>
>>>> What I insist on is that the sampling/retriggering is made 100%
>>>> reliable.
>>>> I'd prefer we don't offer the functionality if it there is any doubt
>>>> about it.
>>>
>>> That question was more in the direction of ST, to see how it fits in
>>> their design/plans. I would hate to work on something only to have it
>>> rejected because ST developed something else in parallel.
>>
>> I think this is more of a "whoever needs it writes it" case, and ST obviously didn't
>> care much about supporting external level interrupts.
>>
>> So if you have the need *and* a clear idea on how to make it work, please post
>> patches. If ST wakes up and wants to chime in, LKML is the right forum for having
>> the discussion.
>>
> 
> Sorry for the delay (just back from business trip). This topic has triggered internal
> Discussions to update our design for future product. So thanks for that.
> Now we have to find a solution for MP1. I have to work on it (find a way to read
> gpio line value from exti). If you have something to propose don't hesitate to share it with us.

I believe the proposal is explained above. The question is whether that
is acceptable.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
