Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B873747F2
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 20:25:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A4DFC5718F;
	Wed,  5 May 2021 18:25:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3D36C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 18:25:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145IDD8E028588; Wed, 5 May 2021 20:25:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+xd0ryYykI4TISlFZPuvHUQmoJhNjWMs5+REGNosxJk=;
 b=jXaK7NvJ9jI5DWEeMFsiLTREktFbYJPuRwFoURBCQ3dlv5DDhy8K9vLhJCf0+KiYmrFC
 bfaaRuEIEUCcO+LgTTrolDyfHT9nwSD2J9cjabSaOJ7VocKRXP/HJTk/MKkDlBYCWtxG
 MewlI7PI0Hxhr8bXK262dCu+U7NzIe5/5i0Mz7v6rbbewszKd9OHrq/n38U4CER/8L1W
 4vJz1VAgX9TRN9IrZxck4pEfwNTrcsB6ymkiF548R1U5IdsvkE0l0Kj/pWJlBSP/w+bb
 a9fSGgiMpi0kI8PsQDvRvnFt7+RoryUwJ3ACX+P4NxILVQGwk5tbUmXHBajxM14MzgMf QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38bea3wtp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 20:25:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC0A810002A;
 Wed,  5 May 2021 20:25:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C703021E5B7;
 Wed,  5 May 2021 20:25:25 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May
 2021 20:25:25 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
 <20210505164159.GB1766375@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
Date: Wed, 5 May 2021 20:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210505164159.GB1766375@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg
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

Hi Mathieu,

On 5/5/21 6:41 PM, Mathieu Poirier wrote:
> Hi Arnaud,
> 
> On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:
>> A rpmsg char device allows to probe the endpoint device on a remote name
>> service announcement.
>>
>> With this patch the /dev/rpmsgX interface is created either by a user
>> application or by the remote firmware.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>
>> ---
>> update from V1:
>>
>>  - add missing unregister_rpmsg_driver call on module exit.
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 5c6a7da6e4d7..9166454c1310 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -18,6 +18,8 @@
>>  
>>  #include "rpmsg_char.h"
>>  
>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>> +
>>  static dev_t rpmsg_major;
>>  static struct class *rpmsg_class;
>>  
>> @@ -413,6 +415,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>>  
>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_channel_info chinfo;
>> +
>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>> +	chinfo.src = rpdev->src;
>> +	chinfo.dst = rpdev->dst;
>> +
>> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
>> +}
>> +
>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>> +{
>> +	int ret;
>> +
>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>> +	if (ret)
>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
>> +}
>> +
>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>> +	{ .name	= RPMSG_CHAR_DEVNAME },
>> +	{ },
>> +};
>> +
>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
>> +	.probe = rpmsg_chrdev_probe,
>> +	.remove = rpmsg_chrdev_remove,
>> +	.id_table = rpmsg_chrdev_id_table,
>> +	.drv = {
>> +		.name = "rpmsg_chrdev",
>> +	},
>> +};
> 
> The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
> name service - but is it really needed?  Up to now and aside from GLINK and SMD,
> there asn't been other users of it so I'm wondering if it is worth going through
> all this trouble.

It is a good point.

Just as a reminder, the need of ST and, I assume, some other companies, is to
have a basic/generic communication channel to control a remote processor
application.

Nothing generic exists today for a virtio transport based implementation.
Companies have to create their own driver.

The purpose of my work is to allow our customer to use RPMsg without developing
a specific driver to control remote applications.

The rpmsg_chrdev char is a good candidate for this. No protocol, just a simple
inter-processor link to send and receive data. The rpmsg_tty is another one.

Focusing on the rpmsg_chrdev:
We did a part of the work with the first patch set that would be in 5.13.
But is it simple to use it for virtio transport based platforms?
If we don't implement the NS announcement support in rpmsg_chrdev, using
rpmsg_chrdev for a user application seems rather tricky.
How to instantiate the communication?
The application will probably has to scan the /sys/bus/rpmsg/devices/ folder to
determine the services and associated remote address.

I don't think the QCOM drivers have the same problem because they seems to
initiate the communication and work directly with the RPMsg endpoints ( new
channel creation on endpoint creation) while Virtio works with the RPMsg channel.

By introducing the ability to instantiate rpmsg_chrdevs through the NS
announcement, we make this easy for applications to use.

And without rpmsg_chrdevs instantiation, It also means that we can't create an
RPMsg channel for the rpmsg_chrdevs using a new RPMSG_CREATE_DEV_IOCTL control,
right?

That said, If we consider that the aim was only to extract the rpmsg_ctrl part,
I'm not against leaving the rpmsg_char in this state and switching to the
rpmsg_tty driver upstream including the work on the rpmsg_ctrl to create rpmsg
channels.

We could come back on this if requested by someone else.

Thanks,
Arnaud

> 
> As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
> service.  That way patches 4, 5 and 6 of this set can be dropped.
> 
> Thanks,
> Mathieu
> 
>> +
>>  static int rpmsg_chrdev_init(void)
>>  {
>>  	int ret;
>> @@ -427,15 +463,30 @@ static int rpmsg_chrdev_init(void)
>>  	if (IS_ERR(rpmsg_class)) {
>>  		pr_err("failed to create rpmsg class\n");
>>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> -		return PTR_ERR(rpmsg_class);
>> +		ret = PTR_ERR(rpmsg_class);
>> +		goto free_region;
>> +	}
>> +
>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>> +	if (ret < 0) {
>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>> +		goto free_class;
>>  	}
>>  
>>  	return 0;
>> +
>> +free_class:
>> +	class_destroy(rpmsg_class);
>> +free_region:
>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> +
>> +	return ret;
>>  }
>>  postcore_initcall(rpmsg_chrdev_init);
>>  
>>  static void rpmsg_chrdev_exit(void)
>>  {
>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>  	class_destroy(rpmsg_class);
>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>  }
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
