Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C15EE34CDC0
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Mar 2021 12:13:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C4E9C5719C;
	Mon, 29 Mar 2021 10:13:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFD64C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 10:13:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TA7tlR024122; Mon, 29 Mar 2021 12:13:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5lhL+1yJCWVc0eL98c9m1itsZeuzV5uyY3nD88yw/xo=;
 b=NYwgPqidQtt/Ob4UBk9fTXGvYjH0uWvxGx+ScD87cnTztJDNJn2+6THwhsPYKSwWQkig
 BUFlnV1fZTI78YXLYbupwhFV/bLOjtnZZRyKnoKZfvrONUcLZxwkUxl6Nq12gwHTbzGL
 kPCbNpP87+Qf+Si6H58UZDk6HpTzoiMT0fXc7Y8M1+jEaK9FNiHv2+Wglp+ZeNaI8YZx
 byG0iE3+mCYFZflO4JThAdx9ADAfir6K6ufncosBVw8p1m5f/MNsmtIL8UBra+S/MkXs
 XEgB0q9QpDlweSdNP0ZsEvyHRQ7WWtD6Gkysi5391vVcyT5hl8bICEIoPgQLR5lu8hq/ RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37jy133gwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 12:13:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B87A5100034;
 Mon, 29 Mar 2021 12:13:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 763CA25D006;
 Mon, 29 Mar 2021 12:13:18 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar
 2021 12:13:17 +0200
To: dillon min <dillon.minfei@gmail.com>
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
 <1615530274-31422-9-git-send-email-dillon.minfei@gmail.com>
 <eb2437ef-ecd2-e258-b77b-2fe9f70205f2@foss.st.com>
 <CAL9mu0KrT4S=NHULcJdztXZ=RvGnVA9s95pDGmadRBH=vnpO6g@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <e342f4e2-161c-e277-c88c-d51d49187b93@foss.st.com>
Date: Mon, 29 Mar 2021 12:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0KrT4S=NHULcJdztXZ=RvGnVA9s95pDGmadRBH=vnpO6g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_05:2021-03-26,
 2021-03-29 signatures=0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 8/8] pinctrl: stm32: Add STM32H750 MCU
	pinctrl support
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



On 3/29/21 10:07 AM, dillon min wrote:
> On Mon, Mar 29, 2021 at 4:00 PM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi Dillon
>>
>> On 3/12/21 7:24 AM, dillon.minfei@gmail.com wrote:
>>> From: dillon min <dillon.minfei@gmail.com>
>>>
>>> This patch adds STM32H750 pinctrl and GPIO support
>>> since stm32h750 has the same pin alternate functions
>>> with stm32h743, so just reuse the stm32h743's pinctrl
>>> driver
>>>
>>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
>>> ---
>>> v2:
>>> - add compatible string st,stm32h750-pinctrl to pinctl-stm32h743.c as they
>>>     have same pin alternate functions
>>> - add STM32H750 to Kconfig description
>>>
>>>    drivers/pinctrl/stm32/Kconfig             | 2 +-
>>>    drivers/pinctrl/stm32/pinctrl-stm32h743.c | 3 +++
>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
>>> index f36f29113370..fb1ffc94c57f 100644
>>> --- a/drivers/pinctrl/stm32/Kconfig
>>> +++ b/drivers/pinctrl/stm32/Kconfig
>>> @@ -35,7 +35,7 @@ config PINCTRL_STM32F769
>>>        select PINCTRL_STM32
>>>
>>>    config PINCTRL_STM32H743
>>> -     bool "STMicroelectronics STM32H743 pin control" if COMPILE_TEST && !MACH_STM32H743
>>> +     bool "STMicroelectronics STM32H743/STM32H750 pin control" if COMPILE_TEST && !MACH_STM32H743
>>>        depends on OF && HAS_IOMEM
>>>        default MACH_STM32H743
>>>        select PINCTRL_STM32
>>> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32h743.c b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
>>> index ffe7b5271506..700206c7bc11 100644
>>> --- a/drivers/pinctrl/stm32/pinctrl-stm32h743.c
>>> +++ b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
>>> @@ -1966,6 +1966,9 @@ static const struct of_device_id stm32h743_pctrl_match[] = {
>>>                .compatible = "st,stm32h743-pinctrl",
>>>                .data = &stm32h743_match_data,
>>>        },
>>> +     {       .compatible = "st,stm32h750-pinctrl",
>>> +             .data = &stm32h743_match_data,
>>> +     },
>>
>> If you use exactly the same driver (i.e. same ball out and AF mux) then
>> you don't have to create a new compatible for that. Just use the same
>> than h743.(so you don't have to factorize DT files).
> Okay, yes they are the total same ball out and AF mux. I will delete
> it in the next submission.
>   Just a kindly reminder , the newest version of this patchset is [PATCH v6].

Yes I'm late :)

> 
> Thanks.
>>
>> Regards
>> Alex
>>
>>>        { }
>>>    };
>>>
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
