Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6827F1BD6B7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 10:00:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BBBEC36B0D;
	Wed, 29 Apr 2020 08:00:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ADB8C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 08:00:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T7wQu5000766; Wed, 29 Apr 2020 10:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=nIR58CYrNLsb2w9tyqqa8vIr3YlHzztP1gjkUKLHO+U=;
 b=b+raAYYTY8B9rAHlM/yEdUKo7u+1kx8pRk2Pq9FHcYJjuylhjEvgysi/D8kaO1I0HORG
 CXSyxRPCy5X1zYvH35HR7Wkzhen8gUh63Kdnxl+MGBSq5prjDKGoFVewQ9de3W7uSJj9
 MsqRQxpGg2+TJJ2tz+w7o4VQrOfvU2mc39cqUHeEy+eu4Odi8EyDUUBh6xXQ5+ptb2TG
 Mjvr1qyruNVHYUOQEe0a2wfnGdOiNYKwPxBtM0gMKTi+oxvLFyCo5jdi0kITPmpq6s6F
 ydzySknr1m5/5fWk0rpKsRJuJI2/vAoqWETHChe1uJJ4L3nSdcETKXPym9sKOF06TGiS 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq64uq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 10:00:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A564110002A;
 Wed, 29 Apr 2020 10:00:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84FD920663E;
 Wed, 29 Apr 2020 10:00:04 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.44) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 10:00:03 +0200
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
 <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
 <20200427200848.722f4c56@xps13>
 <3527f3b8-225d-6e5a-dd8a-0421d475f70b@denx.de>
 <20200427220806.13741ec0@xps13>
 <456b04f5-4ed7-6f3f-b0e6-9276bea09b50@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <506961d9-4852-c926-3446-f5e8b27e5c2e@st.com>
Date: Wed, 29 Apr 2020 10:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <456b04f5-4ed7-6f3f-b0e6-9276bea09b50@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_02:2020-04-28,
 2020-04-29 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage
 all errors cases at probe time
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



On 4/27/20 10:10 PM, Marek Vasut wrote:
> On 4/27/20 10:08 PM, Miquel Raynal wrote:
>> Hi Marek,
>>
>> Marek Vasut <marex@denx.de> wrote on Mon, 27 Apr 2020 21:46:44 +0200:
>>
>>> On 4/27/20 8:08 PM, Miquel Raynal wrote:
>>> [...]
>>>>>>>   	/* FMC2 init routine */
>>>>>>>   	stm32_fmc2_init(fmc2);
>>>>>>> @@ -1997,7 +2001,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>>>>   	/* Scan to find existence of the device */
>>>>>>>   	ret = nand_scan(chip, nand->ncs);
>>>>>>>   	if (ret)
>>>>>>> -		goto err_scan;
>>>>>>> +		goto err_dma_setup;
>>>>>>>   
>>>>>>>   	ret = mtd_device_register(mtd, NULL, 0);
>>>>>>>   	if (ret)
>>>>>>> @@ -2010,7 +2014,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>>>>   err_device_register:
>>>>>>>   	nand_cleanup(chip);
>>>>>>>   
>>>>>>> -err_scan:
>>>>>>> +err_dma_setup:
>>>>>>>   	if (fmc2->dma_ecc_ch)
>>>>>>>   		dma_release_channel(fmc2->dma_ecc_ch);
>>>>>>>   	if (fmc2->dma_tx_ch)
>>>>>>> @@ -2021,6 +2025,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>>>>   	sg_free_table(&fmc2->dma_data_sg);
>>>>>>>   	sg_free_table(&fmc2->dma_ecc_sg);
>>>>>>>   
>>>>>>> +err_clk_disable:
>>>>>>>   	clk_disable_unprepare(fmc2->clk);
>>>>>>>   
>>>>>>>   	return ret;
>>>>>>
>>>>>> I didn't spot it during my earlier reviews but I really prefer using
>>>>>> labels explaining what you do than having the same name of the function
>>>>>> which failed. This way you don't have to rework the error path when
>>>>>> you handle an additional error.
>>>>>>
>>>>>> So, would you mind doing this in two steps:
>>>>>>
>>>>>> 1/
>>>>>> Replace
>>>>>>
>>>>>>      err_scan:
>>>>>>
>>>>>> with, eg.
>>>>>>
>>>>>>      release_dma_objs:
>>>>>
>>>>> The ^err_ prefix in failpath labels is useful, since it's easily
>>>>> possible to match on it with regexes ; not so much on arbitrary label name.
>>>>
>>>> I guess so, but is it actually useful to catch labels in a regex? (real
>>>> question)
>>>
>>> I find it useful to have a unified way to find those labels, e.g.
>>> err_because_foo:
>>> err_because_bar:
>>> err_last_one:
>>> is much nicer than:
>>> foo_failed:
>>> bar_also_failed:
>>> its_total_randomness:
>>
>> My point being, Christophe, you can use err_ as a prefix but I think
>> it's better to use:
>>
>>      err_do_this_cleanup
>>
>> than
>>
>>     err_this_failed
> 
> That's fine either way.

Hi Miquel,

I will rename the label in v3:
  - err_device_register => err_nand_cleanup
  - err_dma_setup => err_release_dma
  - err_clk_disable => will keep this one

Regards,
Christophe Kerello.

> 
>>>> Any way I suppose catching ":\n" is already a good approximation to
>>>> find labels?
>>>
>>> Not very practical with git grep (^err.*: works nicely though)
>>
>> I suppose ^.*:$ would work the same ;)
> 
> Try and see how much other irrelevant stuff that sucks in ;-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
