Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD62ABDF0
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 14:56:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B68B6C3FAE3;
	Mon,  9 Nov 2020 13:56:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE6FDC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 13:56:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9Dkg3X027383; Mon, 9 Nov 2020 14:56:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=uNjIsuooWc4CXF9GNeC8W/zbLVHgmBjAP8/7oakrBUM=;
 b=DPMYvOi0BfWM2oWDd9jnFQCKveK03z2FLxZJZlnqh2aX5ZyDyhwarYS4p2ZCpE9UBjdY
 PgQ50PcbTS9TyVM6G5dZBDmjKVwxolzn5aBkj5sXtohbj7NrZPtK36kbf4UZPyxs4Foy
 QTcCxdDGHo79dVVXSXLk6qnonqnJ1ja7Ci/3HeTucHtJqmXDQKD5vTzSTzZn6qS7SLYs
 NHI7ht/fd2Jcylbt130VafWKVguQ6sTm4WORm5YJCbTc6aeaYOMRM50fJxPZjPiiFjQu
 gUppdN1zvg6RF5hau68jLtdt6gMY7mVpIAchDtauWCw7E3do+nXSM87gOvmCd+bRFjyO RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nkbmtdue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 14:56:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C095100038;
 Mon,  9 Nov 2020 14:56:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F93F2C38BD;
 Mon,  9 Nov 2020 14:56:08 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 14:56:08 +0100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Marek Vasut
 <marex@denx.de>
References: <20200923232535.241437-1-marex@denx.de>
 <0D1E174A-2217-4785-B4E5-79135AAF76F1@linaro.org>
 <5d0c9b8f-8f6b-a4c7-dc80-638e23749310@denx.de>
 <BD86CF01-741D-4ED6-9D08-B43049E9B816@linaro.org>
 <b93bb099-644f-ec0f-50ca-0c537c769e51@denx.de> <20200925162040.GA4746@linux>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <606b6905-54d4-1a7a-8cfd-01f6818ec18a@st.com>
Date: Mon, 9 Nov 2020 14:55:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925162040.GA4746@linux>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek, Mani

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
> 
> Anyway, I'll stop here and let Alex to make a call.

I take this patch as fix this time. I understand your argument Mani, but 
to avoid unexplained crashes at boot it's better to get also on older 
version.

So applied on stm32-dt-for-v5.10-fixes.

regards
alex


> Either case, feel free to add:
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
