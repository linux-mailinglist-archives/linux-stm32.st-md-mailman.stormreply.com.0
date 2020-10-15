Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F228F37B
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 15:40:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2D49C3FADE;
	Thu, 15 Oct 2020 13:40:30 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FB89C32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 13:40:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CBr584wddz1r6nc;
 Thu, 15 Oct 2020 15:40:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CBr5847pQz1qryd;
 Thu, 15 Oct 2020 15:40:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KxJ1Iiyxx1RE; Thu, 15 Oct 2020 15:40:27 +0200 (CEST)
X-Auth-Info: oEk+GAbBzGmP7+2NR4DCCeV7Gl8GoCu/gJqpiFMVZmY=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 15 Oct 2020 15:40:27 +0200 (CEST)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Yann GAUTIER <yann.gautier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
 <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
 <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <11b92f1e-fda0-e98a-8db7-f53004f2404d@denx.de>
Date: Thu, 15 Oct 2020 15:40:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
Content-Language: en-US
Cc: hardware@linux-automation.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On 10/15/20 3:18 PM, Ahmad Fatoum wrote:
> Hello Marek,

Hi,

> On 10/15/20 2:52 PM, Marek Vasut wrote:
>> On 10/15/20 2:44 PM, Ahmad Fatoum wrote:
>>
>> Hi,
>>
>> [...]
>>
>>> We already have 47K external pull-ups on all the SDMMC2's data lanes and we
>>> don't need the SoC-internal pull-up there as well.
>>>
>>> On the SDMMC1 we lack them, so they were added in the board DTS:
>>
>> You do need pullups on SD bus by default.
> 
> Yes, we are aware of this now :-)
> 
>> Currently the
>> stm32mp15-pinmux.dtsi is not consistent in that aspect. I am not arguing
>> about any one single board, but about the dtsi, I suspect by default the
>> pull ups should be enabled, and possibly on board-DT-level they should
>> be disabled if not needed instead ?
> 
> I think this is a good idea. But existing boards should be fixed up so that
> their old behavior is maintained.

So, which boards do we fix. The automation-1 board and the ST ones ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
