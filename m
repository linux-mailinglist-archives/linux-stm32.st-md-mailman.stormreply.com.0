Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDEF368514
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 18:42:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 333EBC58D5B;
	Thu, 22 Apr 2021 16:42:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43B39C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 16:42:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MGVh1O014007; Thu, 22 Apr 2021 18:42:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HOjEh61/Klj7ndpxXpXLihV5ds/oRHH/s0w230vXJYg=;
 b=TbkGAHsEjuIFs6PdZzpQVBom1ntYo5s3Yv1/9KlJBPrriFYlC+E3wVWZrIfuj7CTRwaW
 h4FVKfmhY8OMRPnDgWaZb0ePojaaJ1Uyvp3M+6EKn8hKgxw1elBIGxBVIwcxNyYe148w
 LPX8hK1pRWcqLrfJ5Vtul1m2F0fN1nSwTNqE28YAzcjP4iVx9pgWZX5QYGSkYOrqfCTK
 1ACKPGJy60Y/8qe2aEdlBo8gv9zn+yesVD2HYElnU/AZOI9qFUeZzfcsrudHQOkFvTN9
 Qnx/WWZGgssRK4AtbepgYFddU5ongDILoSIbw5mvpIHQmIt3xqzBpAArblT0/d2rFCs2 fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3839s790hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 18:42:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7922210002A;
 Thu, 22 Apr 2021 18:42:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 636A724544F;
 Thu, 22 Apr 2021 18:42:19 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 18:41:53 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-3-arnaud.pouliquen@foss.st.com>
 <20210421180455.GE1223348@xps15>
 <bb376229-006f-af16-2006-4ef9edea87f5@foss.st.com>
 <20210422163217.GB1256950@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <5e63d822-5e19-7ab0-6ec7-a9ace4bdb706@foss.st.com>
Date: Thu, 22 Apr 2021 18:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210422163217.GB1256950@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_11:2021-04-22,
 2021-04-22 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/7] rpmsg: Move the rpmsg control
 device from rpmsg_char to rpmsg_ctrl
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



On 4/22/21 6:32 PM, Mathieu Poirier wrote:
> On Thu, Apr 22, 2021 at 09:56:41AM +0200, Arnaud POULIQUEN wrote:
>>
>>
>> On 4/21/21 8:04 PM, Mathieu Poirier wrote:
>>> On Tue, Apr 13, 2021 at 03:44:53PM +0200, Arnaud Pouliquen wrote:
>>>> Create the rpmsg_ctrl.c module and move the code related to the
>>>> rpmsg_ctrldev device in this new module.
>>>>
>>>> Add the dependency between rpmsg_char and rpmsg_ctrl in the
>>>> kconfig file.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>> update from v1:
>>>> - keep "rpmsg_chrdev" driver name in rpmsg_ctrl, driver will be renamed
>>>>   in next path that renames the rpmsg_chrdev_create_eptdev.
>>>> - rename the chardev regions
>>>> - move RPMSG_DEV_MAX to rpmsg_char.h
>>>> ---
>>>>  drivers/rpmsg/Kconfig      |   9 ++
>>>>  drivers/rpmsg/Makefile     |   1 +
>>>>  drivers/rpmsg/rpmsg_char.c | 181 +----------------------------
>>>>  drivers/rpmsg/rpmsg_char.h |   2 +
>>>>  drivers/rpmsg/rpmsg_ctrl.c | 231 +++++++++++++++++++++++++++++++++++++
>>>>  5 files changed, 245 insertions(+), 179 deletions(-)
>>>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>>>
>>>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>>>> index 0b4407abdf13..d822ec9ec692 100644
>>>> --- a/drivers/rpmsg/Kconfig
>>
>> snip[...]
>>
>>>> +static int rpmsg_ctrldev_init(void)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
>>>> +	if (ret < 0) {
>>>> +		pr_err("rpmsg: failed to allocate char dev region\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>>>
>>> This class thing really bothers me.  Keeping this here means that rpmsg_eptdevs
>>> created from user space will be associated to this rpmsg_class but those created
>>> from the name service won't.  As such I propose to move this to rpmsg_char and
>>> simply not associate the control device to the class.
>>>
>>> Otherwise we'd have to introduce some mechanic only to deal with the creation of
>>> the class and I don't think it is worth.  We can revise that approach if someone
>>> complains we broke their user space. 
>>
>> I agree with that as it was my first proposed approach here [1]
> 
> Yeah, sorry about that.  This patch review process is not an exact science...

No worries, exploring alternatives is part of the upstream process  :)

> 
>>
>> [1] https://www.spinics.net/lists/linux-arm-msm/msg81194.html
>>
>> Thanks,
>> Arnaud
>>
>>>
>>>
>>>> +	if (IS_ERR(rpmsg_class)) {
>>>> +		pr_err("failed to create rpmsg class\n");
>>>> +		ret = PTR_ERR(rpmsg_class);
>>>> +		goto free_region;
>>>> +	}
>>>> +
>>>> +	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
>>>> +	if (ret < 0) {
>>>> +		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
>>>> +		goto free_class;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +free_class:
>>>> +	class_destroy(rpmsg_class);
>>>> +free_region:
>>>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +postcore_initcall(rpmsg_ctrldev_init);
>>>> +
>>>> +static void rpmsg_ctrldev_exit(void)
>>>> +{
>>>> +	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
>>>> +	class_destroy(rpmsg_class);
>>>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>> +}
>>>> +module_exit(rpmsg_ctrldev_exit);
>>>> +
>>>> +MODULE_DESCRIPTION("rpmsg control interface");
>>>> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
>>>> +MODULE_LICENSE("GPL v2");
>>>> -- 
>>>> 2.17.1
>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
