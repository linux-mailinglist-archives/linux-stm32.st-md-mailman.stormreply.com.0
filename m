Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 847591997C5
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 15:46:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C749C36B0E;
	Tue, 31 Mar 2020 13:46:08 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56149C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 13:46:07 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48s9b304K1z1rv9q;
 Tue, 31 Mar 2020 15:46:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48s9b26TY8z1r0cL;
 Tue, 31 Mar 2020 15:46:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nMgCC_CPG4VM; Tue, 31 Mar 2020 15:46:05 +0200 (CEST)
X-Auth-Info: QFKlbrzgLisLCXWudA2nKbbSJdwvQfKKmtA9G/hcDsU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 15:46:05 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331040736.GA14274@Mani-XPS-13-9360>
From: Marek Vasut <marex@denx.de>
Message-ID: <7dc86fa9-504c-cbc3-9a24-29644d66f9e3@denx.de>
Date: Tue, 31 Mar 2020 15:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331040736.GA14274@Mani-XPS-13-9360>
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

On 3/31/20 6:07 AM, Manivannan Sadhasivam wrote:
> Hi Marek,

Hi,

> Thanks for the series. 
> 
> On Tue, Mar 31, 2020 at 02:56:39AM +0200, Marek Vasut wrote:
>> The AV96 board device tree is completely broken and does not match the
>> hardware. This series fixes it up.
>>
> 
> Completely broken?

The board didn't even boot.

> The patch submitted previously was an initial one and there
> were many interfaces not enabled. I agree that there are few _obvious_ things
> like SDMMC1/Ethernet pinmux, LED naming were wrong. This was due to the fact the
> board was on early bringup stage and I couldn't test Ethernet due to my setup
> issue at that time (yeah I know it is bad). Also, I don't get access to DHCOR
> schematics as well for things like PMIC. Do you have access to it?

Yes, I do have access.

> If possible can you share a link to that if available publicly?

The SoM schematic is not available in public, no, sorry.

> I will test this series and also the uboot one on my board and give my
> Tested-by tag soon.
> 
> Anyway, I think the patchset subject could be something like,
> "Improve AV96 support" :)

I think if something doesn't work, "Repair" is the right word for it.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
