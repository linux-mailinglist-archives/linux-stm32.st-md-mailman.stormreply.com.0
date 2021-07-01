Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62F3B8E34
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jul 2021 09:34:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AE81C597AA;
	Thu,  1 Jul 2021 07:34:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB9EDC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:34:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617X6Sk001658; Thu, 1 Jul 2021 09:34:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SSHQUCjcRxi9e5An3G6X83mmduwQejsBAT0L1Ct09B8=;
 b=ojdxAKW5GCGIg+5cylEW4dy9Pwkf+Zdq8+tnZmcCcjf8gBAJsfJY8xiG58lE2Td5BhGE
 a8LT4yWnwBDkAWFglQ2f6gawJSw0xZGwUTLv+37FtV9MebN0qA8Z017Q+EGP9s2LP/vQ
 fphZxvwr9bol9B3440X74Lqad+XZnZWRi0Qfh3ynOkK8G8vsXI/Q3BjlneMLxrH0obQw
 4wRppKgispjd+Q708HmdfAjhjM+4rpOB75btdOM93RQgQ/P8cDZCPVrIpDEJnA5SwIPT
 VVRK11FPx71OUslJb5SyPEs6VrsFGCEUysVodx3NtU9IoewbhWewX0fI3xy4kuL9zAy4 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gn11ew0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:34:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B44010002A;
 Thu,  1 Jul 2021 09:34:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 365BF212FCE;
 Thu,  1 Jul 2021 09:34:16 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:34:15 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
 <20210623150504.14450-4-arnaud.pouliquen@foss.st.com>
 <20210630204823.GC1290178@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <18de7b63-7b7a-15d6-0d3d-50409caf0649@foss.st.com>
Date: Thu, 1 Jul 2021 09:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630204823.GC1290178@p14s>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 3/4] rpmsg: char: Add possibility to
 use default endpoint of the rpmsg device.
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

Hello Mathieu,

On 6/30/21 10:48 PM, Mathieu Poirier wrote:
> On Wed, Jun 23, 2021 at 05:05:03PM +0200, Arnaud Pouliquen wrote:
>> Current implementation create/destroy a new endpoint on each
>> rpmsg_eptdev_open/rpmsg_eptdev_release calls.
>>
>> For a rpmsg device created by the NS announcement mechanism we need to
>> use a unique static endpoint that is the default rpmsg device endpoint
>> associated to the channel.
>>
>> This patch prepares the introduction of a rpmsg channel device for the
>> char device. The rpmsg channel device will require a default endpoint to
>> communicate to the remote processor.
>>
>> Add the static_ept field in rpmsg_eptdev structure. This boolean
>> determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.
>>
>> - If static_ept == false:
>>   Use the legacy behavior by creating a new endpoint each time
>>   rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
>>   is called on /dev/rpmsgX device open/close.
>>
>> - If static_ept == true:
>>   use the rpmsg device default endpoint for the communication.
>> - Address the update of _rpmsg_chrdev_eptdev_create in e separate patch for readability.
>>
>> Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> update vs V1:
>> - remove the management of the default endpoint creation from rpmsg_eptdev_open.
>>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 50b7d4b00175..a75dce1e29d8 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -45,6 +45,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
>>   * @queue_lock:	synchronization of @queue operations
>>   * @queue:	incoming message queue
>>   * @readq:	wait object for incoming queue
>> + * @static_ept: specify if the endpoint has to be created at each device opening or
>> + *              if the default endpoint should be used.
>>   */
>>  struct rpmsg_eptdev {
>>  	struct device dev;
>> @@ -59,6 +61,8 @@ struct rpmsg_eptdev {
>>  	spinlock_t queue_lock;
>>  	struct sk_buff_head queue;
>>  	wait_queue_head_t readq;
>> +
>> +	bool static_ept;
>>  };
>>  
>>  int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>> @@ -116,7 +120,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>  
>>  	get_device(dev);
>>  
>> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> +	/*
>> +	 * If the static_ept is set to true, the rpmsg device default endpoint is used.
>> +	 * Else a new endpoint is created on open that will be destroyed on release.
>> +	 */
>> +	if (eptdev->static_ept)
>> +		ept = rpdev->ept;
>> +	else
>> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> +
>>  	if (!ept) {
>>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>>  		put_device(dev);
>> @@ -137,7 +149,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>>  	/* Close the endpoint, if it's not already destroyed by the parent */
>>  	mutex_lock(&eptdev->ept_lock);
>>  	if (eptdev->ept) {
>> -		rpmsg_destroy_ept(eptdev->ept);
>> +		if (!eptdev->static_ept)
>> +			rpmsg_destroy_ept(eptdev->ept);
>>  		eptdev->ept = NULL;
>>  	}
>>  	mutex_unlock(&eptdev->ept_lock);
>> @@ -264,6 +277,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>>  		return -EINVAL;
>>  
>> +	/* Don't allow to destroy a default endpoint. */
>> +	if (!eptdev->rpdev || eptdev->ept == eptdev->rpdev->ept)
> 
> Did you find a scenario where eptdev->rpdev would not be valid when this is
> called?  To me if this code is called __rpmsg_chrdev_eptdev_create() has setup
> the rpdev pointer and therefore it will be valid.
> 
> If there is a scenario where it is possible that eptdev->rpdev is invalid then
> please add a comment with the details.  Otherwise simply remove the first part
> of the condition.
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Good catch!
you are right, it seems an over protection, i will verify this making a new
revision that will take into account your other remarks.

Thanks for all your advices and patchset reviews related to rpmsg_char
restructuring.

Arnaud

> 
>> +		return -EPERM;
>> +
>>  	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>>  }
>>  
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
