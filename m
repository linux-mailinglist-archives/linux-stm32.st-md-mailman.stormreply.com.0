Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 928531A49F3
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 20:45:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56384C36B0D;
	Fri, 10 Apr 2020 18:45:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 963EDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 18:45:45 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48zRm91Xfbz1qrfh;
 Fri, 10 Apr 2020 20:45:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48zRm91Kmpz1qqkg;
 Fri, 10 Apr 2020 20:45:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id tQeCvboMKGF1; Fri, 10 Apr 2020 20:45:44 +0200 (CEST)
X-Auth-Info: +9YDySYi8OhX3xcuiZ+lCli8N6B1LgzPgRhn4oeB+2k=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 10 Apr 2020 20:45:44 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200401132237.60880-1-marex@denx.de>
 <20200406072728.GI2937@Mani-XPS-13-9360>
 <9c51236f-a543-99dc-ca4f-5113831451ea@denx.de>
 <20200410090024.GB5723@Mani-XPS-13-9360>
 <7035b570-d1aa-532d-c70b-2fc1e04f9c28@denx.de>
 <20200410112829.GA27211@Mani-XPS-13-9360>
From: Marek Vasut <marex@denx.de>
Message-ID: <f2071b93-f831-2730-b038-e8f1d5d28f54@denx.de>
Date: Fri, 10 Apr 2020 20:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200410112829.GA27211@Mani-XPS-13-9360>
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

On 4/10/20 1:28 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 10, 2020 at 11:55:57AM +0200, Marek Vasut wrote:
>> On 4/10/20 11:00 AM, Manivannan Sadhasivam wrote:
>>> Hi,
>>
>> Hi,
>>
>>> On Tue, Apr 07, 2020 at 05:32:31PM +0200, Marek Vasut wrote:
>>>> On 4/6/20 9:27 AM, Manivannan Sadhasivam wrote:
>>>>> Hi,
>>>>
>>>> Hi,
>>>>
>>>>> On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
>>>>>> The AV96 board device tree is completely broken and does not match the
>>>>>> hardware. This series fixes it up.
>>>>>>
>>>>>> Marek Vasut (22):
>>>>>>   ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
>>>>>>   ARM: dts: stm32: Repair ethernet operation on AV96
>>>>>>   ARM: dts: stm32: Add missing ethernet PHY reset on AV96
>>>>>>   ARM: dts: stm32: Add missing ethernet PHY skews on AV96
>>>>>
>>>>> Ethernet works fine with cold boot but after warm reboot it fails with below
>>>>> message,
>>>>>
>>>>> [   18.192842] stm32-dwmac 5800a000.ethernet eth0: no phy at addr -1
>>>>> [   18.197539] stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Cannot attach to PHY (err)
>>>>
>>>> Try this patch:
>>>>
>>>
>>> [   17.270826] stm32-dwmac 5800a000.ethernet eth0: no phy at addr -1
>>> [   17.275519] stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Cannot attach to PHY (err)
>>>
>>> It doesn't work. Sorry, I don't have much time to dig into this issue so
>>> I'll leave it up to you :)
>>
>> I see, it does work on the new board, so I don't really know what to do
>> here. Maybe we should just not support the old prototype board ?
> 
> Sorry, it turned out to be a DT issue. My script was not updated when I switched
> to upstream bootloader. This patch works perfectly on both old and new boards.
> 
> Feel free to add,
> 
> Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

OK, thanks. So that leaves only the DWC2 ?

I'll wait for ST to review this series before sending V5.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
