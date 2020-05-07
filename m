Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754161C967E
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 18:29:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FBFFC3F95D;
	Thu,  7 May 2020 16:29:04 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ADABC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 16:29:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HzRx5ZJCz1qs42;
 Thu,  7 May 2020 18:29:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HzRx4gspz1qqlB;
 Thu,  7 May 2020 18:29:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id bmZHEHvEzhzn; Thu,  7 May 2020 18:29:00 +0200 (CEST)
X-Auth-Info: yT5Z5F9bmLbhtDZPO7V8nXU+IqinjDsvLub5s9qiqG4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  7 May 2020 18:29:00 +0200 (CEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200429163743.67854-1-marex@denx.de>
 <20200429163743.67854-12-marex@denx.de>
 <20200507152616.GB2019@Mani-XPS-13-9360>
 <687cdc32-7486-1090-154b-58e711dd6a2a@denx.de>
 <80717706-6209-427D-B448-C99697490034@linaro.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <97603d4d-3ef9-6c25-11b6-b2313d8e539c@denx.de>
Date: Thu, 7 May 2020 18:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <80717706-6209-427D-B448-C99697490034@linaro.org>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/12] ARM: dts: stm32: Add DTs for
 STM32MP15x variants of the DHCOR SOM and AV96
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

On 5/7/20 6:05 PM, Manivannan Sadhasivam wrote:
> 
> 
> On 7 May 2020 9:03:08 PM IST, Marek Vasut <marex@denx.de> wrote:
>> On 5/7/20 5:26 PM, Manivannan Sadhasivam wrote:
>>
>> Hi,
>>
>> [...]
>>
>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>>> index f43467b02bcd..b4a4d2b0f18e 100644
>>>> --- a/arch/arm/boot/dts/Makefile
>>>> +++ b/arch/arm/boot/dts/Makefile
>>>> @@ -1029,6 +1029,9 @@ dtb-$(CONFIG_ARCH_STM32) += \
>>>>  	stm32h743i-eval.dtb \
>>>>  	stm32h743i-disco.dtb \
>>>>  	stm32mp157a-avenger96.dtb \
>>>> +	stm32mp151a-dhcor-avenger96.dtb \
>>>> +	stm32mp153a-dhcor-avenger96.dtb \
>>>> +	stm32mp157a-dhcor-avenger96.dtb \
>>>
>>> I'm not really sure if keeping SoM name is a good practice here.
>> Since the
>>> board is sold as "Avenger96" alone, why do you want to prepend SoM
>> name to it?
>>> When you say, "stm32mp157a-avenger96.dtb" it obviously means that
>> Avenger96
>>> board uses the stm32mp157a SoC and that comes from SoM.
>>
>> That's because if you look at the other side of the AV96, you will
>> notice there is this other piece of PCB on it, that's the DHCOR SoM.
>> The
>> SoM is soldered on the AV96 carrier board. And only on that SoM is the
>> STM32MP15xx SoC.
>>
> 
> Yeah I know but what I was saying is that it is not the usual convention to put SoM name in board DTS. The DTS should reflect the actual product name. Here, the SoC prefix is justified since they reflect the family/SoC name and used as a differentiation factor. But using SoM name seems redundant. 
> 
> You can use SoM name if there are chances where different family of SoM can be used on the base board, thereby making it as a differentiation factor. 

There are other SoCs on the DHCOR SoM form factor, I think MX6ULL, so
technically you can populate a different one on the AV96.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
