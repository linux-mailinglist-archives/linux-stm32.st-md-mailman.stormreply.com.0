Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B8D278682
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Sep 2020 13:59:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C59BC3FAE1;
	Fri, 25 Sep 2020 11:59:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12EE4C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 11:58:58 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4ByVnF3cJPz1qrLx;
 Fri, 25 Sep 2020 13:58:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4ByVnF34TDz1qv2g;
 Fri, 25 Sep 2020 13:58:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id FSCXQKto5_kd; Fri, 25 Sep 2020 13:58:56 +0200 (CEST)
X-Auth-Info: E/nMBISPoXmZxgSCCpMPv1CewhSHNsS8AbYhpoYPuvc=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 25 Sep 2020 13:58:56 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20200923232535.241437-1-marex@denx.de>
 <0D1E174A-2217-4785-B4E5-79135AAF76F1@linaro.org>
 <5d0c9b8f-8f6b-a4c7-dc80-638e23749310@denx.de>
 <BD86CF01-741D-4ED6-9D08-B43049E9B816@linaro.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <b93bb099-644f-ec0f-50ca-0c537c769e51@denx.de>
Date: Fri, 25 Sep 2020 13:12:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BD86CF01-741D-4ED6-9D08-B43049E9B816@linaro.org>
Content-Language: en-US
Cc: linux-stm32@st-md-mailman.stormreply.com
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

On 9/25/20 4:21 AM, Manivannan Sadhasivam wrote:
> 
> 
> On 24 September 2020 4:11:11 PM IST, Marek Vasut <marex@denx.de> wrote:
>> On 9/24/20 7:16 AM, Manivannan Sadhasivam wrote:
>>>
>>>
>>> On 24 September 2020 4:55:35 AM IST, Marek Vasut <marex@denx.de>
>> wrote:
>>>> Enable STM32 Digital Thermal Sensor driver for stm32mp15xx-dhcor
>> SoMs.
>>>>
>>>> Fixes: 94cafe1b6482 ("ARM: dts: stm32: Add Avenger96 devicetree
>> support
>>>> based on STM32MP157A")
>>>
>>> The change looks good but what does this patch fixes? 
>>
>> The missing temp sensor, which helps you detect overheat of the SoC.
>> That is esp. important on the 800 MHz AV96.
> 
> This doesn't quality as a "fix". Essentially you're just adding a missing feature and not fixing any issues. So please remove the fixes tag and resubmit. 

I would argue that if the system overheats and crashes, we want to know
about that, possibly in advance so thermal throttling can be applied.
Currently this is not possible and I think that is a bug.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
