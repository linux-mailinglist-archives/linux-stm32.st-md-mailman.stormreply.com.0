Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F87C522
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 16:40:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD9AC35E01;
	Wed, 31 Jul 2019 14:40:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E694BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 14:40:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6VEcGiP031653; Wed, 31 Jul 2019 16:40:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=AFDZi45NFu0boqD+CAnY4m7Y5fAiIfy1q8BHKSUyjP8=;
 b=hdHXeNjda3sh2xQpndsqpigl53QQIGQeef4AE++pk6q4aoeHiWh4VNKighKTmboeWN0J
 6fdMVK8oo3aD76eXZDTqCdan5VGuA/8a8l47Hdpoq2C+fQEV2x+NiSkxCUPuZTCwzVpa
 s2205slvDSMfpooFTvRZz2/fNEA9YAKwhs3HgjxQi1wcgnyE2MWvMQFmuKooddl5eIZU
 NAmH6KAYsQ9dQujJ4EqJqimHdx+hMtsHrfAdw0YQpofH9Y3sUHlSsIpPFJlUus9eMbT7
 SbI0D63j2Pz5emFhBr1VnYyEr8fLiIMGMEhFVzUWElaZBdbIghP9Enysptia3K0tUkgL OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0bra5253-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 31 Jul 2019 16:40:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09B0D41;
 Wed, 31 Jul 2019 14:40:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF58FAE6AC;
 Wed, 31 Jul 2019 16:40:18 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 31 Jul
 2019 16:40:18 +0200
To: Olof Johansson <olof@lixom.net>
References: <20190729135505.15394-1-patrice.chotard@st.com>
 <CAOesGMg-3xt2qjjZ569pUE+d6tn7nz264AN9ARkBT_Ej4TFC2A@mail.gmail.com>
 <de6ab910-380e-6271-88d8-6fe670525e60@st.com>
 <CAOesGMgi2cLUZGZnzKY+4i2tZSFyLe2TEK5SPY5yu0qSh_BRxg@mail.gmail.com>
 <CAOesGMirq=42Cj4kT=dLSqUiG-yee5zuqFhg5t=ud5KPmQJYBw@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <ce2b0a2f-6775-1318-1537-eae3ad4e63fd@st.com>
Date: Wed, 31 Jul 2019 16:40:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOesGMirq=42Cj4kT=dLSqUiG-yee5zuqFhg5t=ud5KPmQJYBw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_06:, , signatures=0
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] ARM: multi_v7_defconfig: Enable SPI_STM32_QSPI
	support
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



On 7/31/19 3:21 PM, Olof Johansson wrote:
> On Wed, Jul 31, 2019 at 3:20 PM Olof Johansson <olof@lixom.net> wrote:
>>
>> Hi,
>>
>> On Wed, Jul 31, 2019 at 8:48 AM Alexandre Torgue
>> <alexandre.torgue@st.com> wrote:
>>>
>>> Hi Olof
>>>
>>> On 7/30/19 7:36 PM, Olof Johansson wrote:
>>>> Hi Patrice,
>>>>
>>>> If you cc soc@kernel.org on patches you want us to apply, you'll get
>>>> them automatically tracked by patchwork.
>>>>
>>>
>>> Does it means that you will take it directly in arm-soc tree ?
>>> I mean, I used to take this kind of patch (multi-v7_defconfig patch
>>> linked to STM32 driver) in my stm32 branch and to send PR for them.
>>
>> You can do that too -- it was unclear to me whether you posted the
>> patch with us in the To: line because you wanted it applied or not.
> 
> Also, we request that platform maintainers keep the defconfig updates
> in a separate branch, since we normally track them in a separate
> branch on our side. So if you do it in the future, please send
> separate PR.
> 
> For single patches, it's just as easy to send us the patch as a pull request.
> 

Ok. So I'll continue as I did :)

Thanks for clarifications

Alex

> 
> Thanks,
> 
> -Olof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
