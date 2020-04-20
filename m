Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0C1B0893
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 13:58:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9921DC36B0C;
	Mon, 20 Apr 2020 11:58:39 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A38EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 11:58:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 495QFn46Vnz1qsjf;
 Mon, 20 Apr 2020 13:58:36 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 495QFm3N2qz1qtwV;
 Mon, 20 Apr 2020 13:58:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id S6ujsEzZ06o3; Mon, 20 Apr 2020 13:58:34 +0200 (CEST)
X-Auth-Info: 6ZJTbsWqyJl7sbVBt/0oWoYQgpCoYVtXW+ihheJuOrY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 20 Apr 2020 13:58:34 +0200 (CEST)
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200416163649.336967-1-marex@denx.de>
 <CAPDyKFqztJDfTrc+1q9mdyf0f2s=gE91J3eM92rzmm+FJNBW9A@mail.gmail.com>
 <11a78052-6320-2986-42b0-3f5536b8c061@denx.de>
 <CAPDyKFpQXaQ+rOX7f+zLfG2Q6fX3FsDk8d+uBtxAcLNkKPhAxQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <40498fad-0eb7-026c-a410-f9958f695d53@denx.de>
Date: Mon, 20 Apr 2020 13:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpQXaQ+rOX7f+zLfG2Q6fX3FsDk8d+uBtxAcLNkKPhAxQ@mail.gmail.com>
Content-Language: en-US
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 1/3] mmc: Prepare all code for
 mmc_regulator_set_vqmmc() returning > 0
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

On 4/20/20 10:18 AM, Ulf Hansson wrote:
> On Fri, 17 Apr 2020 at 17:33, Marek Vasut <marex@denx.de> wrote:
>>
>> On 4/17/20 11:30 AM, Ulf Hansson wrote:
>>> On Thu, 16 Apr 2020 at 18:36, Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> Patch all drivers which use mmc_regulator_set_vqmmc() and prepare them for
>>>> the fact that mmc_regulator_set_vqmmc() can return a value > 0, which would
>>>> happen if the signal voltage switch did NOT happen, because the voltage was
>>>> already set correctly.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Alexandre Torgue <alexandre.torgue@st.com>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Ludovic Barre <ludovic.barre@st.com>
>>>> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>>> Cc: Patrice Chotard <patrice.chotard@st.com>
>>>> Cc: Patrick Delaunay <patrick.delaunay@st.com>
>>>> Cc: Russell King <linux@armlinux.org.uk>
>>>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>>>> Cc: linux-stm32@st-md-mailman.stormreply.com
>>>> To: linux-mmc@vger.kernel.org
>>>
>>> Applied for next, thanks!
>>>
>>> I took the liberty to re-work and simplify some of the code, please
>>> have a look at my next branch to make sure I didn't screw something
>>> up.
>>
>> Where is your next branch ?
> 
> It's listed in the MAINTAINERS file.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git

All right, this one. The adjustments look OK, thanks.

I noticed this one in mtk-sd.c:
/* Apply different pinctrl settings for different signal voltage */
if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180)
	pinctrl_select_state(host->pinctrl, host->pins_uhs);
else
	pinctrl_select_state(host->pinctrl, host->pins_default);

I would almost think that the MTK platforms would support 1V2 modes too,
so the above should rather be:

if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330)
	pinctrl_select_state(host->pinctrl, host->pins_default);
else
	pinctrl_select_state(host->pinctrl, host->pins_uhs);

But I have no hardware to test, and it's a topic for another patch.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
