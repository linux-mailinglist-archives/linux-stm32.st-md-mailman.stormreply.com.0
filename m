Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C91AA28E29E
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 16:55:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B52FC424B3;
	Wed, 14 Oct 2020 14:55:45 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 164E4C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 14:55:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CBFpR4ZjJz1qrfk;
 Wed, 14 Oct 2020 16:55:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CBFpR3sgnz1qvgT;
 Wed, 14 Oct 2020 16:55:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nqtM0Yd0cBB1; Wed, 14 Oct 2020 16:55:42 +0200 (CEST)
X-Auth-Info: tNwAkfRU7WawolCE2fYNKgNvSG5C5MJ2HDuLlThs3FA=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 14 Oct 2020 16:55:42 +0200 (CEST)
To: Yann GAUTIER <yann.gautier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <d49b410c-62fc-40d3-0f2a-6a7ac3214229@denx.de>
 <99663cc5-f897-8233-518b-1a485a2e15b6@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <808c1e29-a96f-f3f4-7e5d-7ba2dfed4142@denx.de>
Date: Wed, 14 Oct 2020 16:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <99663cc5-f897-8233-518b-1a485a2e15b6@st.com>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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

On 10/14/20 4:52 PM, Yann GAUTIER wrote:
> 
> 
> On 10/14/20 3:30 PM, Marek Vasut wrote:
>> On 10/14/20 3:26 PM, Yann GAUTIER wrote:
>> [...]
>>>> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>>>> index b2d19583450c..73d9a5b7f5ba 100644
>>>> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>>>> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>>>> @@ -1291,13 +1291,13 @@ pins1 {
>>>>    				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
>>>>    			slew-rate = <1>;
>>>>    			drive-push-pull;
>>>> -			bias-disable;
>>>> +			bias-pull-up;
>>> Hi Marek,
>>
>> Hi,
>>
>>> This pin config is used by ST board, where we have a level shifter.
>>> This shouldn't be changed. We discussed this with Alex, and a new group
>>> should be added in this case.
>>
>> Is it a problem if we enable the pulls up unconditionally with the level
>> shifter present, to make the properties of the SD bus consistent ?
>>
> The risk of having 2 parallel pull-ups is that the resulting value could 
> be below the lower acceptable value for SD. I'll check if that can occur.

That's a good idea, thank you!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
