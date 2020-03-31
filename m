Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B46199A48
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 17:51:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 439A9C36B0B;
	Tue, 31 Mar 2020 15:51:07 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79B92C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 15:51:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sDMG08zRz1qrLq;
 Tue, 31 Mar 2020 17:51:06 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sDMF6Z0Zz1qqkQ;
 Tue, 31 Mar 2020 17:51:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id XNJmiJ7bzyC6; Tue, 31 Mar 2020 17:51:04 +0200 (CEST)
X-Auth-Info: MJiEhPpU0Kddc5/OUrVPfOS2uVhs/G486Aox8qI/K8w=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 17:51:04 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331040736.GA14274@Mani-XPS-13-9360>
 <7dc86fa9-504c-cbc3-9a24-29644d66f9e3@denx.de>
 <20200331140900.GC17755@Mani-XPS-13-9360>
From: Marek Vasut <marex@denx.de>
Message-ID: <2595fc00-e3f0-fe38-995a-b0028819e47a@denx.de>
Date: Tue, 31 Mar 2020 17:51:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331140900.GC17755@Mani-XPS-13-9360>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 00/22] ARM: dts: stm32: Repair AV96
	board
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

On 3/31/20 4:09 PM, Manivannan Sadhasivam wrote:
> On Tue, Mar 31, 2020 at 03:44:52PM +0200, Marek Vasut wrote:
>> On 3/31/20 6:07 AM, Manivannan Sadhasivam wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Thanks for the series. 
>>>
>>> On Tue, Mar 31, 2020 at 02:56:39AM +0200, Marek Vasut wrote:
>>>> The AV96 board device tree is completely broken and does not match the
>>>> hardware. This series fixes it up.
>>>>
>>>
>>> Completely broken?
>>
>> The board didn't even boot.
>>
> 
> Hmm. I think you're using a new revision of AV96. I added the board support
> with an old version of it (might be an evaluation one). I don't have the delta
> or changeset so can't compare. Anyway, DH started selling new boards and I
> think the old ones were discontinued or not made available for purchase so we
> don't have to worry about breaking the old one.

I'm sure we can/should support both, lemme ask about this. The baseboard
I have is 588-200 (silkscreen next to barrel jack) and SoM 586-100.

>>> The patch submitted previously was an initial one and there
>>> were many interfaces not enabled. I agree that there are few _obvious_ things
>>> like SDMMC1/Ethernet pinmux, LED naming were wrong. This was due to the fact the
>>> board was on early bringup stage and I couldn't test Ethernet due to my setup
>>> issue at that time (yeah I know it is bad). Also, I don't get access to DHCOR
>>> schematics as well for things like PMIC. Do you have access to it?
>>
>> Yes, I do have access.
>>
>>> If possible can you share a link to that if available publicly?
>>
>> The SoM schematic is not available in public, no, sorry.
>>
> 
> Fine. Just wanted to verify the PMIC part. But I got the information from
> DH guy offline.

Yep, I saw that, good.

>>> I will test this series and also the uboot one on my board and give my
>>> Tested-by tag soon.
>>>
>>> Anyway, I think the patchset subject could be something like,
>>> "Improve AV96 support" :)
>>
>> I think if something doesn't work, "Repair" is the right word for it.
> 
> Right. Didn't know that it doesn't boot on newer boards. I do have one but
> haven't tried mainline kernel on it, just vendor image for some demos. But
> feel free to keep it as it is.

Do you have the Enpirion regulator on the SoM ? It's between the
STPMIC1A and the SPI NOR.

I'll be sending a V3 shortly (few hours), apply it on next/master if you
want to test:
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
