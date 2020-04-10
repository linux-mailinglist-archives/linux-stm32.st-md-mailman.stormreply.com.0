Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 847ED1A49F2
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 20:45:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45712C36B0B;
	Fri, 10 Apr 2020 18:45:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 009B2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 18:45:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48zRm74CBzz1rlht;
 Fri, 10 Apr 2020 20:45:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48zRm73Yhxz1qqkg;
 Fri, 10 Apr 2020 20:45:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CvpEXqUiB5DE; Fri, 10 Apr 2020 20:45:42 +0200 (CEST)
X-Auth-Info: PycoTVsxF67b2Bx6t8DCkYO3IO4/iLAeaRmK2mLR3fA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 10 Apr 2020 20:45:42 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-22-marex@denx.de>
 <20200406072242.GG2937@Mani-XPS-13-9360>
 <59d1cc85-a65e-d2bf-4591-0828cf7b8390@denx.de>
 <f952f1ad-53bb-7b85-caad-2174a4333a2c@denx.de>
 <20200410090828.GC5723@Mani-XPS-13-9360>
 <9d3b3a76-9711-6fd9-cb1b-af412c2babcd@denx.de>
 <20200410113429.GB27211@Mani-XPS-13-9360>
From: Marek Vasut <marex@denx.de>
Message-ID: <3c342261-eb66-4c03-6981-65b4463e09cf@denx.de>
Date: Fri, 10 Apr 2020 20:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200410113429.GB27211@Mani-XPS-13-9360>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 21/22] ARM: dts: stm32: Add bindings
	for USB on AV96
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

On 4/10/20 1:34 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 10, 2020 at 11:16:53AM +0200, Marek Vasut wrote:
>> On 4/10/20 11:08 AM, Manivannan Sadhasivam wrote:
>>> Hi,
>>
>> Hi,
>>
>>> On Tue, Apr 07, 2020 at 08:37:50PM +0200, Marek Vasut wrote:
>>>> On 4/6/20 1:08 PM, Marek Vasut wrote:
>>>>> On 4/6/20 9:22 AM, Manivannan Sadhasivam wrote:
>>>>>> On Wed, Apr 01, 2020 at 03:22:36PM +0200, Marek Vasut wrote:
>>>>>>> Fill in the bindings for USB host and gadget on AV96.
>>>>>>>
>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>
>>>>>> I can't get the USB B-Micro OTG port to work with this patch. Do I need to
>>>>>> enable any configs other than PHY and USB DWC2 drivers?
>>>>>
>>>>> Only the DWC2 GADGET (and possibly host, for dual-role) and some gadget
>>>>> implementation (e.g. gadget zero).
>>>>
>>>> I think I see what doesn't work for you.
>>>>
>>>> It seems the following works on next:
>>>> power on -> plug in USB stick (or any other USB device) -> unplug ->
>>>> plug in usb host (e.g. PC)
>>>>
>>>> But this does not:
>>>> power on -> plug in usb host (e.g. PC)
>>>>  - the PC is not detected
>>>>
>>>
>>> Both doesn't work. I have the rndis gadget configured in userspace but plugging
>>> in the micro-b cable doesn't do anything.
>>>
>>>> Did that ^ ever work for you before ? I suspect this is a bug in the
>>>> DWC2 driver. The OTG operation there is known to be flaky at best.
>>>
>>> Not on this board. I don't recall what happended with vendor image. But I do
>>> have another STM32MP1 based 96Board (which will be submitted soon), there I can
>>> get OTG port working.
>>>
>>> But in that board a BG96 modem is connected to USB2 port on the board itself
>>> which gets enumerated during probe.
>>
>> But it's not configured as OTG on this other board, right ?
> 
> It is configured as a OTG port. But that board has a different issue which
> resets the board when we connect any OTG cable to act as a host. That's not
> related to DWC2 or this issue btw.

Do I misunderstand the part where you claim there is a modem connected
to the DWC2 ? That would mean it's in Host mode, no ?

> Anyway, I can't get OTG (device/host) to work on both old and new boards.

Do you have 588-200 now too ?

I think there is some fix in current linux-next which partly fixes the
DWC2 role switching, so rebase this patchset on current linux-next and
see what happens. But it's still not perfect. I also think that ST
managed to side-step this issue by using the STUSB1600 chip, but I might
be wrong.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
