Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED119EDC9
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Apr 2020 22:02:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BAC4C36B0B;
	Sun,  5 Apr 2020 20:02:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCD07C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Apr 2020 20:01:58 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48wPhN4Rczz1rmgV;
 Sun,  5 Apr 2020 22:01:56 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48wPhN3XpWz1r0c2;
 Sun,  5 Apr 2020 22:01:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id q6qzRs8UefpC; Sun,  5 Apr 2020 22:01:55 +0200 (CEST)
X-Auth-Info: Jnmf/64HAA3rEy/lcLC5G3kzQcYwtX1LBoXmoJeJsw0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  5 Apr 2020 22:01:55 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200401132237.60880-1-marex@denx.de>
 <20200405144305.GT8912@Mani-XPS-13-9360>
 <38dc1697-28e3-8680-4998-74e30339a2eb@denx.de>
 <20200405183729.GA9410@Mani-XPS-13-9360>
From: Marek Vasut <marex@denx.de>
Message-ID: <0faa0102-4504-d17b-fb7a-d710100cce2f@denx.de>
Date: Sun, 5 Apr 2020 22:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200405183729.GA9410@Mani-XPS-13-9360>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
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

On 4/5/20 8:37 PM, Manivannan Sadhasivam wrote:
> On Sun, Apr 05, 2020 at 04:55:54PM +0200, Marek Vasut wrote:
>> On 4/5/20 4:43 PM, Manivannan Sadhasivam wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
>>>> The AV96 board device tree is completely broken and does not match the
>>>> hardware. This series fixes it up.
>>>>
>>>
>>> Can you please share a git tree with all these patches? These are not
>>> applying cleanly on top of mainline/master or linux-next/master.
>>
>> Alex asked for them to be rebased on
>> git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git
>> branch
>> stm32-next
>>
> 
> Thanks, I'm able to build with your patches. Btw, I just found that the
> current mainline versions of u-boot and Linux kernel are certainly broken
> on old Avenger96 (588-100) as well.

Considering the difference between the prototype board and the 588-200
production board, that's quite possible. Are you willing to test things
on the 588-100 board ? If so, then we can try and support the 588-100 too.

> u-boot doesn't boot while linux kernel has MMC2 and Ethernet broken as you
> reported. However, checking out the commit which added Avenger96 board support
> in both projects works fine.

At least
35a54d41d9d4 ("ARM: dts: stm32mp1: sync device tree with v5.2-rc4")
in U-Boot broke the old board.

But that should all be fixed for the upcoming U-Boot release in master
already (for 588-200).

The rest is a lot of incorrect pinmux in both, fixed in U-Boot already,
fixed by this set for Linux.

> So this clearly tells that there is a regression which caused the board support
> to be broken with mainline u-boot and kernel. I didn't try to find the offending
> commit(s) as the support for STM32MP1 got matured in both the projects. But
> we can go ahead with your patches.
> 
> I will review the remaining patches tomorrow
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
