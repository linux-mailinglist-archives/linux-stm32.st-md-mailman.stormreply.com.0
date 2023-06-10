Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94672ABD5
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jun 2023 15:46:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA6C9C6A5FA;
	Sat, 10 Jun 2023 13:46:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E064BC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jun 2023 13:46:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 47BDB84724;
 Sat, 10 Jun 2023 15:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686404783;
 bh=wGO+TnXtPeHAIqAQfdV/EaXawcXWSsPuxjJ5o0piLSE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YVKuiMGz4L8BrSPMPtf7r5vK017PlrzV39ofAzTmJT1Zitr2cuiw8w/J/2o632nxf
 hjUcMInkHF3wYQL6Ngrd5LC707f96dQRNVc+zdrSuOv9Nx1gSomprtCCxUT8SCCX52
 8ll8n2vFXoG88I2DW/xv9fWwi3iXMgfGbGi8BYsNjK5GVbKQ2jx9vxx6fF3MP9fvLo
 T3SSNnQhgFXm/92v06cbI7xGco0XDTpk9T8/W4KO1UA27Fpw6eA3rmx4uXIebOayVm
 pw5xUAoGKfRm3verYIR07e86WYAEH9yWDVbAkPpLRfjiC6SxcP9YUxZBstoshDKSWT
 WAKri/kthE8ag==
Message-ID: <b65288f6-1d3d-424f-5df5-98e86cc51dec@denx.de>
Date: Sat, 10 Jun 2023 15:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
 <PAXPR10MB4718D37242FF00D47DF0CEF1F1499@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de>
 <PAXPR10MB471825B145645894D626F070F152A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <0d304968-74c8-47ce-f87a-127449f36f4b@denx.de>
 <PAXPR10MB4718E8CE58A881DAE3983A27F153A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <PAXPR10MB4718E8CE58A881DAE3983A27F153A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
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

On 6/7/23 11:53, Arnaud POULIQUEN wrote:

Hi,

[...]

>>>>>>> Rather than adding unused optional mailbox, I will more in favor
>>>>>>> of having a mbox_request_channel_byname_optional helper or
>>>>>>> something similar
>>>>>>
>>>>>> See above, I think it is better to have the mailbox described in DT
>>>>>> always and not use it (the user can always remove it), than to not
>>>>>> have it described on some boards and have it described on other
>>>>>> boards
>>>> (inconsistency).
>>>>>
>>>>> Adding it in the DT ( and especially in the Soc DTSI) can also be
>>>>> interpreted as "it is defined so you must use it". I would expect
>>>>> that the Bindings already provide the information to help user to add it
>> on need.
>>>>
>>>> Why should every single board add it separately and duplicate the
>>>> same stuff, if they can all start with it, and if anyone needs to
>>>> tweak the mailbox allocation, then they can do that in the board DT ?
>>>> I really don't like the duplication suggestion here.
>>>
>>> I was speaking about "detach mailbox. Here is what I would like to
>>> propose to you
>>>
>>> 1)  move all the mailbox declaration in the DTSI except "detach"
>>> 2) don't declare "detach" in boards DTS ( except ST board for legacy
>>> compliance)
>>> 3) as a next step we will have to fix the unexpected warning on the
>>>      "detach" mailbox.
>>
>> Why not make the mailbox available by default on all boards ?
> 
> It has been introduced mainly to test the detach feature,
> on a second platform to help remoteproc maintainers for the review
> process. But the feature is not fully implemented on stm32mp1
> ( auto reboot of thye M4 on crash, appropriate resource table clean-up,...)

This is a driver bug, unrelated to DT description, please just fix it.

> I would prefer to remove it in ST board DT than add it in the DTSI.
> That said as mentioned for legacy support, better to keep for ST board.

Why not remove it from ST boards if this was legacy test feature and is 
no longer needed ?

>> As far as I can tell, if the software is not using the detach mailbox, there is no
>> downside, it would just be unused. User can always remove it in their DT if
>> really needed.
> 
> The inverse it true, User can add it in their DT if really need.

Is there a downside if this is enabled by default, yes or no ?

>> I believe once can build demos using the detach mailbox for boards with
>> stm32mp15xx not manufactured by ST, correct ?[]
> 
> Everything could be possible...
> Once can want to replace the shutdown mailbox by the detach.
> Once can also build demo using the detach mailbox channel for another purpose.
> 
> I quite confuse why you insist to declare this detach mailbox in the DTSI?
> Is there a strong constraint on your side?

I just don't see any explanation why ST board(s) should be somehow 
special and have the detach mailbox described in DT by default, while 
other boards would require separate DT patch to use the detach mailbox 
first. That just reduces usability of non-ST-manufactured boards and 
increases fragmentation. I do not like that.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
