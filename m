Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E491AC6D0
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 16:45:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B387EC36B0C;
	Thu, 16 Apr 2020 14:45:27 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55080C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 14:45:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4932855s3kz1qs0p;
 Thu, 16 Apr 2020 16:45:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49328549w7z1qr41;
 Thu, 16 Apr 2020 16:45:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id t3tG6krWam4d; Thu, 16 Apr 2020 16:45:24 +0200 (CEST)
X-Auth-Info: GYv5afvF6lwk4PgXwg2jbVatvzq66dJF1aHOuKPA3yc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 16 Apr 2020 16:45:24 +0200 (CEST)
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200401195722.208157-1-marex@denx.de>
 <CAPDyKFoDB=d5B-2u_Y0e-XVzPQE46JBUTPwY_b_xzESm3NnjwQ@mail.gmail.com>
 <58d6bc7a-b772-e8cc-6120-b0adeb128070@denx.de>
 <CAPDyKFrAgLMUqU4oSRX64VoDQMMFZuM3KtUq6SL770XDSc+QbQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <20d299ab-ea7e-be85-7c5b-fd10e21a117d@denx.de>
Date: Thu, 16 Apr 2020 16:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrAgLMUqU4oSRX64VoDQMMFZuM3KtUq6SL770XDSc+QbQ@mail.gmail.com>
Content-Language: en-US
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] mmc: Prepare all code for
 mmc_set_signal_voltage() returning > 0
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

On 4/16/20 2:07 PM, Ulf Hansson wrote:
> On Thu, 16 Apr 2020 at 12:29, Marek Vasut <marex@denx.de> wrote:
>>
>> On 4/15/20 10:40 AM, Ulf Hansson wrote:
>>> On Wed, 1 Apr 2020 at 21:57, Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> Patch all drivers and core code which uses mmc_set_signal_voltage()
>>>> and prepare it for the fact that mmc_set_signal_voltage() can return
>>>> a value > 0, which would happen if the signal voltage switch did NOT
>>>> happen, because the voltage was already set correctly.
>>>
>>> I am not sure why you want to change mmc_set_signal_voltage(), can you
>>> elaborate on that?
>>>
>>> I thought we discussed changing mmc_regulator_set_vqmmc(), what am I missing?
>>
>> Because mmc_set_signal_voltage() optionally calls
>> host->ops_>start_signal_voltage_switch() , which can now return value >
>> 0 , so the rest of the core needs to be patched to cater for that.
> 
> The issue that you wanted to solve (at least by looking at the
> original patch) was to understand whether the vqmmc regulator changes
> voltage level and then take different actions based on that in the
> mmci host driver.
> 
> You don't need to change anything related to mmc_set_signal_voltage()
> to accomplish that, do you? Moreover, I am worried that it may affect
> the host driver's expectations from when
> ->start_signal_voltage_switch() may be called.

So, shall I just patch all the sites which use mmc_regulator_set_vqmmc()
with something like

return mmc_regulator_set_vqmmc();
becomes
ret = mmc_regulator_set_vqmmc();
if (ret > 0)
	ret = 0;
return ret;

?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
