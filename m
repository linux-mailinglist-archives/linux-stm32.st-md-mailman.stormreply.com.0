Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2A3376CA
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 16:18:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC7A8C5718B;
	Thu, 11 Mar 2021 15:18:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE757C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:18:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BF7Ffr006501; Thu, 11 Mar 2021 16:18:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=duXhnQrva9mfeXnZr0IndGHYsvfB2JHvMP8HhZLInq0=;
 b=0F9qwwyxUgjNE79IeDKhaqvdlqj7uHjhXERG4aoU4yT/q9UdmzGG1wgrsBGPif2H6rF6
 nTrQkfOQlw+90vr/pGf2Duy3s1nXgCo2ZG1YvklqxIwxz7GuJN0fCDvs9DvLPU7Ol93z
 5cnBCj+OmlXmSiTx/+jGpFEuDBeBY+3tIaTbdBg1yrNZxzF+iCDZmkLxnKz71aCUWkne
 x0cjiIHDGMsuvpzLMrJCaqKVIzGwc4wH+cgwbG/FdO7qw0wNiJtm+qDgKuDYUIW6YhOC
 Kk7ZDJuokGvEIhQucobYQZPeAAnZuR+KfopD9rmTb57sIUW8Yf+eREIVRDCAHNylZWng XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpykjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 16:18:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E96F010002A;
 Thu, 11 Mar 2021 16:18:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCAEB250E32;
 Thu, 11 Mar 2021 16:18:40 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 16:18:39 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Alex G. <mr.nuke.me@gmail.com>,
 Gabriel FERNANDEZ - foss <gabriel.fernandez@foss.st.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Etienne CARRIERE <etienne.carriere@st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
 <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
 <463dafed-ec60-cd9a-33d2-ba118a6af629@foss.st.com>
 <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <c0898d96-2ea1-9b50-a195-8f619121c91c@foss.st.com>
Date: Thu, 11 Mar 2021 16:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_05:2021-03-10,
 2021-03-11 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] Introduce STM32MP1 RCC in
 secured mode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Ahmad

On 3/11/21 3:41 PM, Ahmad Fatoum wrote:
> Hello,
> 
> On 11.03.21 15:02, Alexandre TORGUE wrote:
>> On 3/11/21 12:43 PM, Marek Vasut wrote:
>>> On 3/11/21 9:08 AM, Alexandre TORGUE wrote:
>>>> 1- Break the current ABI: as soon as those patches are merged, stm32mp157c-dk2.dtb will impose to use
>>>> A tf-a for scmi clocks. For people using u-boot spl, the will have to create their own "no-secure" devicetree.
>>>
>>> NAK, this breaks existing boards and existing setups, e.g. DK2 that does not use ATF.
>>>
>>>> 2-As you suggest, create a new "secure" dtb per boards (Not my wish for maintenance perspectives).
>>>
>>> I agree with Alex (G) that the "secure" option should be opt-in.
>>> That way existing setups remain working and no extra requirements are imposed on MP1 users. Esp. since as far as I understand this, the "secure" part isn't really about security, but rather about moving clock configuration from Linux to some firmware blob.
>>>
>>>> 3- Keep kernel device tree as they are and applied this secure layer (scmi clocks phandle) thanks to dtbo in
>>>> U-boot.
>>>
>>> Is this really better than
>>> #include "stm32mp15xx-enable-secure-stuff.dtsi"
>>> in a board DT ? Because that is how I imagine the opt-in "secure" option could work.
>>>
>>
>> Discussing with Patrick about u-boot, we could use dtbo application thanks to extlinux.conf. BUT it it will not prevent other case (i.e. TF-A which jump directly in kernel@). So the "least worst" solution is to create a new "stm32mp1257c-scmi-dk2 board which will overload clock entries with a scmi phandle (as proposed by Alex).
> 
> I raised this issue before with your colleagues. I still believe the correct way
> would be for the TF-A to pass down either a device tree or an overlay with the
> actual settings in use, e.g.:
> 
>    - Clocks/Resets done via SCMI
>    - Reserved memory regions
> 
> If TF-A directly boots Linux, it can apply the overlay itself, otherwise it's
> passed down to SSBL that applies it before booting Linux.
Discussing with tf-a and u-boot guys, this solution could imply hard 
synchronization between tf-a/u-boot. The most simple remains a "secure" dts.

regards
Alex

> Cheers,
> Ahmad
> 
>>
>> Gabriel, can you wait a bit before sending something about SCMI in dtsi, I would like to align this strategy internally.
>>
>> Marek, Alex: thanks for your inputs.
>>
>> Regards
>> Alex
>>
>>>> The third could be the less costly.
>>>
>>> [...]
>> _______________________________________________
>> Linux-stm32 mailing list
>> Linux-stm32@st-md-mailman.stormreply.com
>> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
