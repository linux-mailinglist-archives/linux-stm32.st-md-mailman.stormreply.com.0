Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84224279015
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Sep 2020 20:10:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 456B9C3FAE1;
	Fri, 25 Sep 2020 18:10:27 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90EF6C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 18:10:23 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Byg1q1gdjz1qrfs;
 Fri, 25 Sep 2020 20:10:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Byg1q16S3z1qyXZ;
 Fri, 25 Sep 2020 20:10:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2mBHbo7ZSOnb; Fri, 25 Sep 2020 20:10:22 +0200 (CEST)
X-Auth-Info: ng2dPSjax7CL3Cq23FMadcdac2Aq2VqKLaYU5h7cH9M=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 25 Sep 2020 20:10:22 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200923232535.241437-1-marex@denx.de>
 <0D1E174A-2217-4785-B4E5-79135AAF76F1@linaro.org>
 <5d0c9b8f-8f6b-a4c7-dc80-638e23749310@denx.de>
 <BD86CF01-741D-4ED6-9D08-B43049E9B816@linaro.org>
 <b93bb099-644f-ec0f-50ca-0c537c769e51@denx.de> <20200925162040.GA4746@linux>
From: Marek Vasut <marex@denx.de>
Message-ID: <6ab19a00-dd3b-1804-1ed6-8575650e5cb0@denx.de>
Date: Fri, 25 Sep 2020 20:06:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200925162040.GA4746@linux>
Content-Language: en-US
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable thermal sensor
 support on stm32mp15xx-dhcor
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

On 9/25/20 6:20 PM, Manivannan Sadhasivam wrote:
> On Fri, Sep 25, 2020 at 01:12:12PM +0200, Marek Vasut wrote:
>> On 9/25/20 4:21 AM, Manivannan Sadhasivam wrote:
>>>
>>>
>>> On 24 September 2020 4:11:11 PM IST, Marek Vasut <marex@denx.de> wrote:
>>>> On 9/24/20 7:16 AM, Manivannan Sadhasivam wrote:
>>>>>
>>>>>
>>>>> On 24 September 2020 4:55:35 AM IST, Marek Vasut <marex@denx.de>
>>>> wrote:
>>>>>> Enable STM32 Digital Thermal Sensor driver for stm32mp15xx-dhcor
>>>> SoMs.
>>>>>>
>>>>>> Fixes: 94cafe1b6482 ("ARM: dts: stm32: Add Avenger96 devicetree
>>>> support
>>>>>> based on STM32MP157A")
>>>>>
>>>>> The change looks good but what does this patch fixes? 
>>>>
>>>> The missing temp sensor, which helps you detect overheat of the SoC.
>>>> That is esp. important on the 800 MHz AV96.
>>>
>>> This doesn't quality as a "fix". Essentially you're just adding a missing feature and not fixing any issues. So please remove the fixes tag and resubmit. 
>>
>> I would argue that if the system overheats and crashes, we want to know
>> about that, possibly in advance so thermal throttling can be applied.
>> Currently this is not possible and I think that is a bug.
> 
> No, this is not a _bug_. This is a missing feature that the current kernel
> doesn't support and you know about that! The fact that you can trigger a crash
> due to hw limitation doesn't qualify as a bug IMO. And you can do that by other
> means also (CPU throttling without CPUFreq support etc...)

I would say that makes the hardware pretty useless, which is not the
expectation I would have of a system I would like to use in production.
Just assume your laptop would randomly overheat and crash, would you
consider that a missing feature or a bug that should be fixed ?

> Anyway, I'll stop here and let Alex to make a call.

I agree.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
