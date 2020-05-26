Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C87D19B6A8
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 21:59:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3F31C36B0B;
	Wed,  1 Apr 2020 19:59:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A82CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 19:59:50 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sxqn17jPz1rmgX;
 Wed,  1 Apr 2020 21:59:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sxqm55ZKz1r0cc;
 Wed,  1 Apr 2020 21:59:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ARRSFarqvGyk; Wed,  1 Apr 2020 21:59:47 +0200 (CEST)
X-Auth-Info: 4zaLNIcWZJ0OWFfwvO7Y1We/SkNclQpUKNMfR0QzUbg=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 21:59:47 +0200 (CEST)
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200331155254.100952-1-marex@denx.de>
 <CAPDyKFrypbDEuDaGWySjC6j_qKbXpVHoubhh8e9jS24JSzBg3Q@mail.gmail.com>
 <7a7c0180-0a11-17b2-7815-b18b1ca11120@denx.de>
 <CAPDyKFoEFe=fru0=HCTzG2CikGA72hFWK0y6iL_EN6BDK3Vtkw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <29a4a198-db29-447a-fa64-68de9430cd07@denx.de>
Date: Wed, 1 Apr 2020 21:59:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoEFe=fru0=HCTzG2CikGA72hFWK0y6iL_EN6BDK3Vtkw@mail.gmail.com>
Content-Language: en-US
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: Only call
 .post_sig_volt_switch if voltage switch happened
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

On 4/1/20 10:16 AM, Ulf Hansson wrote:
> On Tue, 31 Mar 2020 at 23:01, Marek Vasut <marex@denx.de> wrote:
>>
>> On 3/31/20 8:53 PM, Ulf Hansson wrote:
>>> On Tue, 31 Mar 2020 at 17:53, Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> Call the post voltage switch handler only if the voltage switch actually
>>>> happened. It is well possible that the regulator is already set correctly
>>>> and no voltage switch happened, so there is no need to take any further
>>>> action.
>>>>
>>>> This fixes a real issue on STM32MP1 where, if the eMMC is supplied with
>>>> VccQ=1.8 V, the post voltage switch code will spin indefinitelly waiting
>>>> for the voltage switch to complete, even though no voltage switch really
>>>> happened.
>>>
>>> Whether this is a common problem or not, I think in a first step we
>>> should manage this in the common mmc_regulator_set_vqmmc().
>>
>> I can pass in a variable which would be set if a voltage switch actually
>> happened in mmc_regulator_set_vqmmc() OR I can return a code > 0 from
>> there. Which one do you prefer?
> 
> Return a code > 0.
> 
>>
>> Then I guess we can add something like
>>
>> if (regulator_get_voltage(...vqmmc) is already in voltage range)
>>  return 1;
>>
>> ...
>>
>> and the MMCI driver would do something like
>>
>> if (mmc_regulator_set_vqmmc(...) > 0)
>>  host->ops->post_sig_volt_switch(...);
>>
>> That looks OK I guess ?
>>
>>> Then on top of that, convert mmci into using the mmc_regulator_set_vqmmc() API.
>>>
>>> Can please try this approach instead?
>> Sure. Does the above look sane ?
> 
> Yes, great!

The resulting patch doesn't really look all that great, but I sent out a
small series.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
