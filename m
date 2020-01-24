Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9E148580
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 13:57:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EFE1C36B0C;
	Fri, 24 Jan 2020 12:57:12 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7251AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:57:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 483zgV4gSwz1rfcM;
 Fri, 24 Jan 2020 13:57:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 483zgV4014z1qsnv;
 Fri, 24 Jan 2020 13:57:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id a5WkDsqkF17i; Fri, 24 Jan 2020 13:57:09 +0100 (CET)
X-Auth-Info: MUmA/qNjvLa2bDoiAhUIdbJjXBQkocCQ9bCNublI/rw=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 24 Jan 2020 13:57:09 +0100 (CET)
To: Alexandre Torgue <alexandre.torgue@st.com>, Marc Zyngier
 <maz@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>
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
From: Marek Vasut <marex@denx.de>
Message-ID: <caad4cbb-646a-7f54-777c-5da5ad9c3af6@denx.de>
Date: Fri, 24 Jan 2020 13:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f9d98afc-6cb8-ef7b-cff7-a04e14dba4c8@st.com>
Content-Language: en-US
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
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

On 1/24/20 10:17 AM, Alexandre Torgue wrote:
[...]
>>>>> Doing this kind of tricks in 2020 is pretty poor for a modern SoC.
>>>>
>>>> With the above assumption given, I think that is ok even in 2020.
>>>> (But I
>>>> wonder about SoCs in 2020 not being able to handle level sensitive irqs
>>>> :-)
>>>
>>> Quite. Seems incredibly restrictive, and very unfortunate.
>>
>> So I wonder, the EXTI should be able to read the GPIO line which caused
>> the interrupt when the interrupt handler returns, and trigger the
>> interrupt again if the line is still low. This might need some phandle
>> from the EXTI to GPIO bank in DT, but should be generally doable, no ?
>> It's a crutch all right.
>>
>> But I still wonder, what is the purpose of the EXTImux in that SoC?
>> Shouldn't that permit routing GPIOs directly into GIC SPIs, which would
>> then permit detecting at least level-high interrupts ?
>>
> 
> For this SoC, EXTI block detects external line edges and rises a GIC SPI
> interrupt. This EXTi block is mainly used to handle HW events like
> buttons, clocks ... So first issue seems more to be a design issue (your
> design doesn't fit with MP1 datasheet).

I am asking about the EXTImux block, see the DM00327659 datasheet
section 24.2 EXTI block diagram , figure 140 and exti[15:0] . Maybe that
permits routing external events directly to GIC SPIs ?

> Now, let's find a solution. I'll have a look on your proposition: "check
> the line in EOI callback and retrig".

That could probably work.

> Marc, this kind a solution could be acceptable on your side ?
> 
> regards
> Alex
> 
> 
> 
> 
> 


-- 
Best regards,
Marek Vasut
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
