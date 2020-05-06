Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E51C74A4
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 17:27:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93279C32EB6;
	Wed,  6 May 2020 15:27:13 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E48FDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 15:27:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HL723NH7z1r0FS;
 Wed,  6 May 2020 17:27:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HL722cwPz1qv81;
 Wed,  6 May 2020 17:27:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 0LxFYhYoFGXR; Wed,  6 May 2020 17:27:09 +0200 (CEST)
X-Auth-Info: fUzIjt1XL8BHjl2o7G5TQbgdiyRuNN8XHUH0yTFZnfs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 May 2020 17:27:08 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200429163743.67854-1-marex@denx.de>
 <13aabff1-d4d0-7afb-6a57-a8136e35c6a4@st.com>
 <1d9cbde1-2be1-f54e-7c65-202f2bc7e0a9@denx.de>
 <b100645c-32ac-325d-5838-0fab2c93df22@st.com>
 <6dc6b79f-2a20-3899-e42f-eabaeb33a829@denx.de>
 <c012b356-c935-3536-a3eb-0683f4339dda@st.com>
 <dde82c6c-ec30-ad28-406d-4bd955c670c0@denx.de>
 <ea7c0254-f955-8636-8c62-326b8d07cb4f@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <575b01a9-d2ba-917a-622f-2b5a166d642b@denx.de>
Date: Wed, 6 May 2020 17:27:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ea7c0254-f955-8636-8c62-326b8d07cb4f@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 01/12] ARM: dts: stm32: Add alternate
	pinmux for I2C2 pins
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

On 5/6/20 5:15 PM, Alexandre Torgue wrote:
> 
> 
> On 5/6/20 4:58 PM, Marek Vasut wrote:
>> On 5/6/20 4:55 PM, Alexandre Torgue wrote:
>>>
>>>
>>> On 5/6/20 4:39 PM, Marek Vasut wrote:
>>>> On 5/6/20 4:26 PM, Alexandre Torgue wrote:
>>>>>
>>>>>
>>>>>
>>>>>> All right, thanks.
>>>>>>
>>>>>> btw I had this internal discussion now about handling the
>>>>>> combinatorial
>>>>>> explosion of board DTs here. If we support them all, by the end of
>>>>>> the
>>>>>> lifespan of these devices, we end up with:
>>>>>>
>>>>>> STM32MP15{1,3,7}{a,c,d,f} SoM rev. {0..7}00 on baseboard rev.
>>>>>> {0..7}00.
>>>>>>
>>>>>> There won't be every SoM and baseboard revision combination all
>>>>>> right.
>>>>>> But even the amount of SoM options gives me 12 DTs. That is not a low
>>>>>> number. Does ST have some plan to handle such situation ?
>>>>>
>>>>> Yes I have the same point in mind. How to maintain all boards ? Should
>>>>> we refuse some boards and only keep one as example ?
>>>>
>>>> But which ones do you want to drop? The pdk2 is a devkit , so you can
>>>> put in any SoM option, that's the problem.
>>>
>>> Ok but we could choice to build only one (or few) possibilities. I mean
>>> maybe only mp157 ?
>>
>> But that one isn't gonna work for e.g. 153 then, would it?
> 
> No but we could let user of 153 do his own dts by hand. With a good
> split is not difficult to do.
> 
> For e.g I don't plan to upstream stm32mp153c-dk2 (I don't know if it
> really exist), but user could easily create his own stm32mp153c-dk2.dts
> by assembling well dtsi files and taking stm32mp157c-dk2 (or dk1) as
> example.

I would still want to make it easy for the users of this SoM to just use
it though. And I am quite sure there will be all combinations of it
eventually.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
