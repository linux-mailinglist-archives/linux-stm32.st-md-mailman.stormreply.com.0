Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C8302898
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 18:19:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8A9C5663B;
	Mon, 25 Jan 2021 17:19:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78773C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 17:19:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PHHpPD006876; Mon, 25 Jan 2021 18:19:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RyqhFivtd4rFZG+7AJ8QF845UIBd+GmRh8eyFKGG/cY=;
 b=DcskUFtVPsGYZHR0oigOKd+hby6prfRTocXipg4DtgDmTNHUTJuVwaazTp3Y323qWsbA
 678VwkXcpLDi2U+XSI+WrHrN2X69pUcUmNIOcw10MRinaPzZo7Mn1nHy3ESQdDecD6DW
 1TG1nszo5LtaU4fz/XYcFgN/HhiVwq3GxIbR8Tzww2IR3I4SjrWET4TrbukeG6kOEMQi
 t2FjlQsNLZvMV8c7HO8MpUjBNP8tqAODU8gzvRlgK9Qkw1B03buTPCTAeREFV8ScO8/Z
 ciPdgjb0wRP8nF6Ba3qloEwPkhRriEn6JmWJ34/kRisRUbfCFwuHJs6VoCjwCU8SQZtU Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjn45hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 18:19:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCD7010002A;
 Mon, 25 Jan 2021 18:19:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7CA522740E;
 Mon, 25 Jan 2021 18:19:11 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 18:19:11 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Arnaud POULIQUEN
 <arnaud.pouliquen@st.com>
References: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
 <20210114190543.GB255481@xps15> <6de9ff8f-0be1-387a-df7e-7d77dd859513@st.com>
 <YA7kNj0/lbUhqJBd@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <bd33a7de-5a02-406a-c8e3-e00749adce8e@foss.st.com>
Date: Mon, 25 Jan 2021 18:19:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YA7kNj0/lbUhqJBd@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_07:2021-01-25,
 2021-01-25 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: return an error if device
 already open
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

Hi Bjorn,

On 1/25/21 4:31 PM, Bjorn Andersson wrote:
> On Fri 15 Jan 03:13 CST 2021, Arnaud POULIQUEN wrote:
> 
>> Hi Mathieu,
>>
>>
>> On 1/14/21 8:05 PM, Mathieu Poirier wrote:
>>> On Wed, Jan 06, 2021 at 02:37:14PM +0100, Arnaud Pouliquen wrote:
>>>> The rpmsg_create_ept function is invoked when the device is opened.
>>>> As only one endpoint must be created per device. It is not
>>>> possible to open the same device twice.
>>>> The fix consists in returning -EBUSY when device is already
>>>> opened.
>>>>
>>>> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>>  drivers/rpmsg/rpmsg_char.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>>> index 4bbbacdbf3bb..360a1ab0a9c4 100644
>>>> --- a/drivers/rpmsg/rpmsg_char.c
>>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>>> @@ -127,6 +127,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>>>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>>>>  	struct device *dev = &eptdev->dev;
>>>>  
>>>> +	if (eptdev->ept)
>>>> +		return -EBUSY;
>>>> +
>>>
>>> I rarely had to work so hard to review a 2 line patch...
>>
>> That means that my commit description was not enough explicit...
>>
>>>
>>> As far as I can tell the actual code is doing the right thing.  If user space is
>>> trying to open the same eptdev more than once function rpmsg_create_ept() should
>>> complain and the operation denied, wich is what the current code is doing.  
>>>
>>> There is currently two customers for this API - SMD and GLINK.  The SMD code is
>>> quite clear that if the channel is already open, the operation will be
>>> denied [1].  The GLINK code isn't as clear but the fact that it returns NULL on
>>> error conditions [2] is a good indication that things are working the same way.
>>>
>>> What kind of use case are you looking to address?  Is there any way you can use
>>> rpdev->ops->create_ept() as it is currently done?
>>
>> This patch was part of the IOCTL rpmsg series. I sent it separately at Bjorn's
>> request [1].
>>
> 
> I apparently didn't spend as much effort as Mathieu thinking about the
> details. I do believe that he's right, at least both GLINK and SMD
> _should_ return -EBUSY if we try to open an already open channel -
> either because the kernel has bound a driver to the channel or because
> rpmsg_char already has it opened.
> 
>> I detect the issue using the RPMSG_ADDR_ANY for the source address when tested
>> it with the rpmsf_virtio bus. In this case at each sys open of the device, a new
>> endpoint is created because a new source address is allocated.
>>
> 
> In SMD and GLINK channels are identified solely by their name and hence
> it's not possible to have duplicates. As this isn't the case for virtio
> I didn't have any objections to it and that's why I asked you to resend
> it separately.
> 
> But in line with GLINK/SMD, what would the expected behavior be if I
> with the virtio backend open a rpmsg_char which is already bound to a
> kernel driver?

I guess that user applications should expect same behavior, regardless of the
backend. So this patch would ensure the check at RPMsg service level.

> 
> Do you think we should get another "channel" or do you think the virtio
> driver should detect this and return -EBUSY? (I.e. render this patch
> unnecessary)

Regarding virtio implementation we could create a new channel only if either the
channel name, either the local address or the remote address is different.
So a channel would be created only if one address is set to RPMSG_ADDR_ANY.
But could be a nightmare to handle it, in case of multi open/close.

In my opinion the channel should be created only on /dev/rpmsgX creation.

That said, if this patch generates too much discussion. we can also leave it on
hold until figure out how to adapt the RPMsg char for the virtio backend.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> [1]https://patchwork.kernel.org/project/linux-remoteproc/patch/20201222105726.16906-11-arnaud.pouliquen@foss.st.com/
>>
>> Thanks,
>> Arnaud
>>
>>>
>>> Thanks,
>>> Mathieu
>>>
>>> [1]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_smd.c#L920
>>> [2]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_glink_native.c#L1149
>>>
>>>>  	get_device(dev);
>>>>  
>>>>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>>>> -- 
>>>> 2.17.1
>>>>
>>> _______________________________________________
>>> Linux-stm32 mailing list
>>> Linux-stm32@st-md-mailman.stormreply.com
>>> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
