Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B056D197B20
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 13:46:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E852C36B0B;
	Mon, 30 Mar 2020 11:46:03 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11722C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 11:46:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rVyw1Sgtz1rvRr;
 Mon, 30 Mar 2020 13:46:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rVyw0gK3z1qqkP;
 Mon, 30 Mar 2020 13:46:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id MwHV6kv_ihNA; Mon, 30 Mar 2020 13:45:58 +0200 (CEST)
X-Auth-Info: gT0Gk3tvCGkrHnFSE/Y6h4e1a8LDrg9q705hb0Ns4as=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 13:45:58 +0200 (CEST)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200328171144.51888-1-marex@denx.de>
 <20200328171144.51888-8-marex@denx.de>
 <0fb89d25-feb0-2eb0-9e83-d7f8c76f8b9e@st.com>
 <82dcf412-119b-0de2-0c50-f6877a82a812@pengutronix.de>
 <fcf49298-a36c-e80e-e62b-1fb9c07f0d6e@denx.de>
 <310aa3a3-09ce-42ef-d1ea-b653163d1d72@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <97d13a84-8220-aa7f-3ee6-df474cca3882@denx.de>
Date: Mon, 30 Mar 2020 13:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <310aa3a3-09ce-42ef-d1ea-b653163d1d72@pengutronix.de>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 07/22] ARM: dts: stm32: Add alternate
 pinmux for SDMMC2 pins 4-7
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

On 3/30/20 1:37 PM, Ahmad Fatoum wrote:
> Hi Marek,

Hi,

> On 3/30/20 1:22 PM, Marek Vasut wrote:
>> On 3/30/20 1:17 PM, Ahmad Fatoum wrote:
>>> Hello Patrice,
>>
>> Hi,
>>
>>> On 3/30/20 1:11 PM, Patrice CHOTARD wrote:
>>>> For your information, another submitted patch uses the same pinctrl sdmmc2_d47_pins_b node with different muxing (SDMMC2_D5)
>>>>
>>>> see https://lore.kernel.org/patchwork/patch/1216452/
>>>>
>>>> I haven't checked other muxing if there are other conflict.
>>>
>>> (author of linked patch here)
>>>
>>> I don't like the central stm32mp15-pinctrl.dtsi. I'd have preferred if each
>>> file defined the pinctrl groups it is using.
>>
>> I'm not a big fan of that either, because this is gonna be a
>> combinatorial explosion of various pinmux options. But if you have each
>> board define it's pinmux, it's also gonna become a massive amount of
>> duplication (like iMX). So I cannot tell which one is better ...
> 
> Mhm. A middle ground could be keeping stm32mp15-pinctrl, but only for the
> official ST eval kits as HW designers are expected to copy off those and have
> board specifics in the board/SoM device tree?

Then you should call it stm32mp1-something-st-eval-pinmux.dtsi ,
otherwise it's gonna be confusing.

> If it has to be either one or the other, I prefer duplication in the device
> tree. When the HW misses pull ups or needs to adjust slew rates, you probably
> don't want a new, slightly different, pinctrl group in the stm32mp15-pinctrl.dtsi
> for each variant.

That's a valid point, but then you can override those in the boards'
pinmux node for a specific pinmux entry too.

> So you are left with doctoring around with overrides and /delete-property/,
> while just duplicating the node with the correct properties would've been
> better for readability IMO.

That is true, but how many of such cases do we have so far ? Maybe it's
better to cross that bridge when (if) we come to it.

-- 
Best regards,
Marek Vasut
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
