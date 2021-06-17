Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BAE3ABA08
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 18:55:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D0CDC597AE;
	Thu, 17 Jun 2021 16:55:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6541C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 16:55:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HGrRrD026450; Thu, 17 Jun 2021 18:55:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aNdtP7w+kyv5eaEn76NL6UGrI4oOfxzgSgioTmZyLxE=;
 b=rdGIEjL8xQXOFSNovSn+bT9CzW81HTBdGdF/NIHF9JLvcbmAIDrPDN3PtYg8oprndBn+
 3woUjPOMInWCTohLlva3DuRCjg+eSgCo4KVjAoPsXCxhXjjfHjFvEyqljbM9duP6Aaoh
 C9CrrPeZh2f6BOwvpZ3DC0yJ8lF8luC7qNEJF4YS7QhbcX55cMtxYaIGl0BFE/oKOxEr
 y9amrOvYyl8Ki6ilPeRpnCEXY+fePaU1RtWhZ8r/xqimD5U/0zRYOgk9MNo3puEn9IDK
 AK3QaFMCVbnUkGOOsm+xWTPjq6u9rCUqEqPUaH2dSdo+Dv8QKwxdZXo2xKcPKoPLFuX+ Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 397p55ew51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 18:55:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 131C510002A;
 Thu, 17 Jun 2021 18:55:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6CC125F3E0;
 Thu, 17 Jun 2021 18:55:01 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 18:55:01 +0200
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-4-arnaud.pouliquen@foss.st.com>
 <20210615174634.GB604521@p14s>
 <b7dc5207-643b-b5e6-2bee-106b2eb87555@foss.st.com>
 <20210616171524.GA637642@p14s>
 <e4310ebf-4605-0462-e13b-0451ce19eea3@foss.st.com>
Message-ID: <8278088f-b2fa-e5c9-8ae5-f5945f55b423@foss.st.com>
Date: Thu, 17 Jun 2021 18:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e4310ebf-4605-0462-e13b-0451ce19eea3@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] rpmsg: ctrl: Add check on rpmsg
 device removability from user space
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



On 6/17/21 10:02 AM, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 6/16/21 7:15 PM, Mathieu Poirier wrote:
>> On Wed, Jun 16, 2021 at 11:30:51AM +0200, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 6/15/21 7:46 PM, Mathieu Poirier wrote:
>>>> On Fri, Jun 04, 2021 at 11:14:05AM +0200, Arnaud Pouliquen wrote:
>>>>> Using the RPMSG_RELEASE_DEV_IOCTL is possible to remove any
>>>>> rpmsg device (such as the rpmsg ns or the rpmsg ctrldev).
>>>>>
>>>>> Add a new field to store the removability of the device.
>>>>>
>>>>> By default the rpmsg device can not be removed by user space. It is
>>>>> set to 1 by the rpmsg ctrl on RPMSG_CREATE_DEV_IOCTL request, but
>>>>> could also be set by an rpmsg driver during probe.
>>>>>
>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>> ---
>>>>>  drivers/rpmsg/rpmsg_ctrl.c | 17 ++++++++++++++++-
>>>>>  include/linux/rpmsg.h      |  2 ++
>>>>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>>>>> index cb19e32d05e1..e93c6ec49038 100644
>>>>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>>>>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>>>>> @@ -74,6 +74,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>>>>  	struct rpmsg_endpoint_info eptinfo;
>>>>>  	struct rpmsg_channel_info chinfo;
>>>>>  	struct rpmsg_device *rpdev;
>>>>> +	struct device *dev;
>>>>>  	int ret = 0;
>>>>>  
>>>>>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>>>> @@ -95,11 +96,25 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>>>>  		if (!rpdev) {
>>>>>  			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
>>>>>  			ret = -ENXIO;
>>>>> +		} else {
>>>>> +			/* Allow user space to release the device. */
>>>>> +			rpdev->us_removable = 1;
>>>>
>>>> As a rule of thumb I try really hard to avoid introducing new flags.  In this case we
>>>> can attain the same result by looking at chinfo->name, chinfo->src and
>>>> chinfo->dst.  I would introduce a new inline function in rpmsg_internal.h,
>>>> something like rpmsg_chrdev_is_ctrl_dev(), and compare the specifics in chinfo
>>>> to rpdev->id.name, rpdev->src and rpdev->dst.  If they all match then the
>>>> operation is refused.
>>>
>>> Something must have escaped me, because i turn around your your proposal,
>>> without understand it.
>>>
>>> The "us_removable" flag is not only for the rpmsg_ctrl, but for any rpmsg device
>>> that have not to be released by user application. Either because there are core
>>> ( rpmsg_ctrl, rpmsg_ns) or because a rpmsg driver don't allow to unbind its
>>> rpmsg devices.
>>>
>>
>> I don't see how the current patch would allow a driver to prevent user space
>> from releasing a rpmsg device since the sysfs attribute can be changed at will.
>> So even if the driver sets the flag user space can still revert it.
> 
> 
> The patch [4/4] define the a read only attribute using the rpmsg_show_attr
> declaration[1]. So the userspace can't change it.
> 
> This also has the advantage of not allowing the new IOCTRL API to be used by
> default for legacy RPMSg devices without a specific patch.
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/rpmsg/rpmsg_core.c#L362
> 
>>
>>> look to me that rpmsg_chrdev_is_ctrl_dev just prevents rpmsg ctrl to be released
>>> by the RPMSG_RELEASE_DEV_IOCTL.
>>
>> That is correct.  I did not address rpmsg_ns to keep things simple but it would
>> also have to be handled properly.
>>
>>>
>>> Please, could you clarify what you have in mind here?
>>
>> Other than rpmsg_ctrl and rpmsg_ns I don't think we should introduce any
>> mechanism to prevent users from releasing an rpmsg.  Doing so needs root access
>> - if a user space process with root privileges can't be trusted then we have
>> bigger problems than unwanted releases of registered rpmsg devices.
> 
> That's make sense. If we go on this way we could also trust the root application
> for the rpmsg_ns and only protect the rpmsg_ctrl which can not release itself,
> as you proposed.

As discussed in the OpenAMP by-weekly meeting, I will send a new revision,
without the attribute.

Thanks,
Arnaud

> 
> Thanks,
> 
> Arnaud
> 
>>
>>>
>>> Thanks,
>>> Arnaud
>>>
>>>>
>>>> That way we don't introduce a new flag and there is also no need to call
>>>> rpmsg_find_device() twice.
>>>
>>>
>>>
>>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>>>  		}
>>>>>  		break;
>>>>>  
>>>>>  	case RPMSG_RELEASE_DEV_IOCTL:
>>>>> -		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>>>>> +		dev = rpmsg_find_device(ctrldev->rpdev->dev.parent, &chinfo);
>>>>> +		if (!dev)
>>>>> +			ret =  -ENXIO;
>>>>> +
>>>>> +		/* Verify that rpmsg device removal is allowed. */
>>>>> +		if (!ret) {
>>>>> +			rpdev = to_rpmsg_device(dev);
>>>>> +			if (!rpdev->us_removable)
>>>>> +				ret = -EACCES;
>>>>> +		}
>>>>> +		if (!ret)
>>>>> +			ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>>>>>  		if (ret)
>>>>>  			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
>>>>>  				chinfo.name, ret);
>>>>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>>>>> index d97dcd049f18..3642aad1a789 100644
>>>>> --- a/include/linux/rpmsg.h
>>>>> +++ b/include/linux/rpmsg.h
>>>>> @@ -47,6 +47,7 @@ struct rpmsg_channel_info {
>>>>>   * @ept: the rpmsg endpoint of this channel
>>>>>   * @announce: if set, rpmsg will announce the creation/removal of this channel
>>>>>   * @little_endian: True if transport is using little endian byte representation
>>>>> + * @us_removable: True if userspace application has permission to remove the rpmsg device
>>>>>   */
>>>>>  struct rpmsg_device {
>>>>>  	struct device dev;
>>>>> @@ -57,6 +58,7 @@ struct rpmsg_device {
>>>>>  	struct rpmsg_endpoint *ept;
>>>>>  	bool announce;
>>>>>  	bool little_endian;
>>>>> +	bool us_removable;
>>>>>  
>>>>>  	const struct rpmsg_device_ops *ops;
>>>>>  };
>>>>> -- 
>>>>> 2.17.1
>>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
