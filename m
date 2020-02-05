Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 423FB152918
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 11:26:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B086CC36B0B;
	Wed,  5 Feb 2020 10:26:21 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ECDDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 10:26:19 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48CHlt3QmQz1qrVL;
 Wed,  5 Feb 2020 11:26:18 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48CHlt2n3nz1qyWS;
 Wed,  5 Feb 2020 11:26:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id HBSXmNPXnEOo; Wed,  5 Feb 2020 11:26:16 +0100 (CET)
X-Auth-Info: JHrzpRN5i1bGPK59dBRJARvxYY/TFotrUevgJDIvwyo=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  5 Feb 2020 11:26:16 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Marc Zyngier <maz@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
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
Message-ID: <2a86d71f-3e64-8f66-3e58-df540487dcb4@denx.de>
Date: Wed, 5 Feb 2020 11:26:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5e1c419c-b141-52f6-88f1-ee3ab8219a4e@denx.de>
Content-Language: en-US
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
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

On 1/28/20 7:32 PM, Marek Vasut wrote:
> On 1/24/20 10:24 AM, Marc Zyngier wrote:
>> On 2020-01-24 09:17, Alexandre Torgue wrote:
>>> On 1/23/20 11:21 PM, Marek Vasut wrote:
>>
>> [...]
>>
>>>> But I still wonder, what is the purpose of the EXTImux in that SoC?
>>>> Shouldn't that permit routing GPIOs directly into GIC SPIs, which would
>>>> then permit detecting at least level-high interrupts ?
>>>>
>>>
>>> For this SoC, EXTI block detects external line edges and rises a GIC
>>> SPI interrupt. This EXTi block is mainly used to handle HW events like
>>> buttons, clocks ... So first issue seems more to be a design issue
>>> (your design doesn't fit with MP1 datasheet).
>>>
>>> Now, let's find a solution. I'll have a look on your proposition:
>>> "check the line in EOI callback and retrig".
>>>
>>> Marc, this kind a solution could be acceptable on your side ?
>>
>> It will depend on the nature of the hack you will have to put in there.
>> If it is 100% reliable, why not? Anything short of that, probably not.
> 
> I had another look into this, and what we would end up is some sort of
> phandle from exti to all the gpioX nodes in DT, would that be OK ?
> However, if we do that, then we will have the pinctrl controller (which
> has the gpio banks as subnodes) require the exti through a phandle and
> exti require the gpio banks through a phandle, so we end up with some
> sort of cyclic dependency there.
> 
> So we would need to somehow have exti lazily deal with it's gpioX
> controller phandles only when someone requests level interrupt ? That
> would probably do.

Bump? Thoughts?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
