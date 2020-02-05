Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFDE152A16
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 12:42:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86DCBC36B0B;
	Wed,  5 Feb 2020 11:42:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 430B4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 11:42:49 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A83E21741;
 Wed,  5 Feb 2020 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580902968;
 bh=kncFxhBv1aPgb6/5aq7Hsf4jHESTSMhlLC7K6hUGYM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ue3s7rl6Q77gisGyY7t30ImsruJMA8suGOyh324ojaE8REUp7Dikwp8/enNEeT73V
 OINBpqUxWAdO6ysnfmXYr36AmtgMXfdCpOaiFe9VTT7C6fJ4IVkX+WMB662UNmyAgf
 QN1Abql23p2Fz56avLWgaRkweyh/nXNigLVDvgTE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1izJ4w-0037V9-9g; Wed, 05 Feb 2020 11:42:46 +0000
MIME-Version: 1.0
Date: Wed, 05 Feb 2020 11:42:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <5e1c419c-b141-52f6-88f1-ee3ab8219a4e@denx.de>
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
Message-ID: <dcbb8f0447f2aa75f0cec6f420310b21@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marex@denx.de, alexandre.torgue@st.com,
 u.kleine-koenig@pengutronix.de, patrick.delaunay@st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K?= =?UTF-8?Q?=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2020-01-28 18:32, Marek Vasut wrote:
> On 1/24/20 10:24 AM, Marc Zyngier wrote:
>> On 2020-01-24 09:17, Alexandre Torgue wrote:
>>> On 1/23/20 11:21 PM, Marek Vasut wrote:
>> 
>> [...]
>> 
>>>> But I still wonder, what is the purpose of the EXTImux in that SoC?
>>>> Shouldn't that permit routing GPIOs directly into GIC SPIs, which 
>>>> would
>>>> then permit detecting at least level-high interrupts ?
>>>> 
>>> 
>>> For this SoC, EXTI block detects external line edges and rises a GIC
>>> SPI interrupt. This EXTi block is mainly used to handle HW events 
>>> like
>>> buttons, clocks ... So first issue seems more to be a design issue
>>> (your design doesn't fit with MP1 datasheet).
>>> 
>>> Now, let's find a solution. I'll have a look on your proposition:
>>> "check the line in EOI callback and retrig".
>>> 
>>> Marc, this kind a solution could be acceptable on your side ?
>> 
>> It will depend on the nature of the hack you will have to put in 
>> there.
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

TBH, I don't have much of an opinion here. If you can deal with the 
plumbing
that's required to make this thing work reliably, then why not?

What I insist on is that the sampling/retriggering is made 100% 
reliable.
I'd prefer we don't offer the functionality if it there is any doubt 
about it.

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
