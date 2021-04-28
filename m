Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC75136D7FD
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Apr 2021 15:05:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9438DC58D5A;
	Wed, 28 Apr 2021 13:05:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC14EC57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 13:05:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SD0j1f020977; Wed, 28 Apr 2021 15:05:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eVG3v1lNK3BXxdqTip+oyLR1+X82jhyNevCxSbpxH+E=;
 b=3dlIO9+Oshqkwmw+9VEIpjnuaax+TOlu3qUw838yVD7R1hhvpXJvuQirqC511+ByiqEr
 5Wh3sCxTTDapgtXZW4IaTj4I1ULReLwAADx7L4e4hEAk08hQu5dtl5Vxa+GcJSeS/eu0
 /oXJ+oSJop6N2+29FLAtxYWyJbHh6YM0Hn7oYNWCJmWqFnZIlSaNrqnbFPa5KeQ5AVdU
 Wf1c4eEnedbVh6DTWgtmragIddZ2udmLX1uqu+4fyTKYSgVvRJmppDFFC8k67PYXi99p
 Y4g6cgi7x8OrQe3PuKYUaYelcqe+9g7KGrn/HVRUWiL30ERGZlkyxptj85I31LS7ZzOQ EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 386ea8gghc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 15:05:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3022510002A;
 Wed, 28 Apr 2021 15:05:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BE06210895;
 Wed, 28 Apr 2021 15:05:23 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr
 2021 15:05:22 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
 <20210421174053.GA1223348@xps15>
 <47015357-b006-1c32-f63f-d4fcac054d6f@foss.st.com>
 <20210422163622.GC1256950@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <14998d88-b27b-3548-e52f-eb0365caa96f@foss.st.com>
Date: Wed, 28 Apr 2021 15:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210422163622.GC1256950@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_06:2021-04-27,
 2021-04-28 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 5/7] rpmsg: char: Introduce a rpmsg
 driver for the rpmsg char device
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

Hi,

On 4/22/21 6:36 PM, Mathieu Poirier wrote:
> On Thu, Apr 22, 2021 at 09:58:27AM +0200, Arnaud POULIQUEN wrote:
>> On 4/21/21 7:40 PM, Mathieu Poirier wrote:
>>> Good day Arnaud,
>>>
>>> On Tue, Apr 13, 2021 at 03:44:56PM +0200, Arnaud Pouliquen wrote:
>>>> A rpmsg char device allows to probe the endpoint device on a remote name
>>>> service announcement.
>>>>
>>>> With this patch the /dev/rpmsgX interface is created either by a user
>>>> application or by the remote firmware.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>
>>>> ---
>>>> update from V1:
>>>>  - add missing unregister_rpmsg_driver call on module exit.
>>>>
>>>> ---
>>>>  drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 58 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>>> index a64249d83172..4606787b7011 100644
>>>> --- a/drivers/rpmsg/rpmsg_char.c
>>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>>> @@ -26,6 +26,8 @@
>>>>  #include "rpmsg_char.h"
>>>>  #include "rpmsg_internal.h"
>>>>  
>>>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>>>> +
>>>
>>> Why not simply call it rpmsg-char?
>>
>> I would avoid to link the rpmsg name service to the Linux Kernel device.
> 
> To me that's exactly what we want to do...  Am I missing something?
> 
>>
>>>
>>>>  static dev_t rpmsg_major;
>>>>  
>>>>  static DEFINE_IDA(rpmsg_ept_ida);
>>>> @@ -403,13 +405,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>>>  }
>>>>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>>>>  
>>>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>>> +{
>>>> +	struct rpmsg_channel_info chinfo;
>>>> +	struct rpmsg_eptdev *eptdev;
>>>> +
>>>> +	if (!rpdev->ept)
>>>> +		return -EINVAL;
>>>> +
>>>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>>>> +	chinfo.src = rpdev->src;
>>>> +	chinfo.dst = rpdev->dst;
>>>> +
>>>> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
>>>> +	if (IS_ERR(eptdev))
>>>> +		return PTR_ERR(eptdev);
>>>> +
>>>> +	/* Set the private field of the default endpoint to retrieve context on callback. */
>>>> +	rpdev->ept->priv = eptdev;
>>>
>>> This is already done in rpmsg_create_ept() when rpmsg_eptdev_open() is called.
>>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
>>>> +	if (ret)
>>>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
>>>> +}
>>>> +
>>>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>>>> +	{ .name	= RPMSG_CHAR_DEVNAME },
>>>> +	{ },
>>>> +};
>>>> +
>>>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
>>>> +	.probe = rpmsg_chrdev_probe,
>>>> +	.remove = rpmsg_chrdev_remove,
>>>> +	.id_table = rpmsg_chrdev_id_table,
>>>> +	.callback = rpmsg_ept_cb,
>>>
>>> Not sure why we need a callback associated to this driver when
>>> rpmsg_eptdev_open() already creates and rpmsg_endpoint.  To me the only thing
>>> having a callback provides is the association between the rpmsg_device and the
>>> rpmsg_endpoint[1] that happens in rpmsg_dev_probe().  The QC folks already do
>>> this association in their platform code[2].  Since this is not done in
>>> __rpmsg_create_ept() a check for rpdev->ept == NULL could be done in
>>> rpmsg_eptdev_open() and do the assignment there. 
>>>
>>> [1]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/rpmsg_core.c#L513  
>>> [2]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/qcom_glink_native.c#L1623
>>>
>>
>> That's a good point! When I started the redesign, I faced some issues with the
>> approach you propose. But as I can not remember the reason and because the code
>> has evolved, i need to re-think about this.
>>
> 
> Glad to see we're on the same page.  I stared at this code for a very long time,
> thinking there was some kind of bigger picture I wasn't getting.

I finally found the time to investigate this. If I remember now why I used this
approach, I also saw that my patchset does not work with the QCOM platform driver.

As a first step of explanation, let's ignore the QC platform.
rpdev->ept is null for the rpmsg ctrldev device created by the virtio rpmsg bus.
If no default endpoint is created on rpmsg_chrdev_probe, it is not possible to
differentiate the two in rpmsg_eptdev_open based on rpdev->ept == NULL.

Now let's add the QC implementation
As you mentioned, QC sets the rpdev->ept to a default endpoint before
registering the rpmsg ctrldev. This shows that it is not reasonable to expect to
handle all use cases based on the rpdev->ept value.

So, to summarize, I need to rework this, probably by adding a new field in the
rpmsg_eptdev structure, to properly handle the endpoint creation in the
rpmsg_eptdev_open function.

Regards,
Arnaud

> 
> 
>> Thanks,
>> Arnaud
>>
>>
>>>> +	.drv = {
>>>> +		.name = "rpmsg_chrdev",
>>>> +	},
>>>> +};
>>>> +
>>>>  static int rpmsg_chrdev_init(void)
>>>>  {
>>>>  	int ret;
>>>>  
>>>>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
>>>> -	if (ret < 0)
>>>> +	if (ret < 0) {
>>>>  		pr_err("rpmsg: failed to allocate char dev region\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>>>> +	if (ret < 0) {
>>>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>>>> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>> +	}
>>>>  
>>>>  	return ret;
>>>>  }
>>>> @@ -417,6 +473,7 @@ postcore_initcall(rpmsg_chrdev_init);
>>>>  
>>>>  static void rpmsg_chrdev_exit(void)
>>>>  {
>>>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>  }
>>>>  module_exit(rpmsg_chrdev_exit);
>>>> -- 
>>>> 2.17.1
>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
