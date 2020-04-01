Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D8919ABF8
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 14:45:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD97C36B0B;
	Wed,  1 Apr 2020 12:45:33 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D79DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 12:45:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48smBh1D6vz1qrfB;
 Wed,  1 Apr 2020 14:45:32 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48smBh0QnCz1r0cS;
 Wed,  1 Apr 2020 14:45:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rGYzA3kVKRfJ; Wed,  1 Apr 2020 14:45:31 +0200 (CEST)
X-Auth-Info: 6KQKAPHhJxCCe7C/XdCN8XrrkSVjWTtWr26IHnW7VxU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 14:45:31 +0200 (CEST)
To: Lucas Stach <l.stach@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200331175811.205153-1-marex@denx.de>
 <20200331175811.205153-14-marex@denx.de>
 <eb93de42-1fa2-e4ee-e104-3c8b57b64c40@st.com>
 <9ed8f864-9bbe-b090-2399-6cea8b088fe2@denx.de>
 <84ebedc52340f57487f2e75fddef2be1df825d77.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <efaabb82-e710-762e-1e2b-fd7790fe69bb@denx.de>
Date: Wed, 1 Apr 2020 14:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <84ebedc52340f57487f2e75fddef2be1df825d77.camel@pengutronix.de>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V3 13/22] ARM: dts: stm32: Enable GPU on
 AV96
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

On 4/1/20 2:40 PM, Lucas Stach wrote:

[...]

>>>> index 27c48f988540..19a7a130b148 100644
>>>> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
>>>> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
>>>> @@ -139,6 +139,10 @@ phy0: ethernet-phy@7 {
>>>>       };
>>>>   };
>>>>   +&gpu {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>
>>> GPU is now enable by so you can drop this patch.
>>
>> Why is it enabled by default ? That's somewhat useless on headless
>> systems.
> 
> The better question is: why wouldn't it be enabled by default? It's a
> SoC peripheral and has no external dependencies. Even on a headless
> system you can still do stuff like color conversion/balancing via GL in
> a video pipeline or something like this. There is simply no good reason
> to hide the existence of the GPU.

Power saving ? Resource saving ?
Why should it be enabled if it's not used ?

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
