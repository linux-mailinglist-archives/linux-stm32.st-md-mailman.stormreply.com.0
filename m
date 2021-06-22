Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D343AFE2A
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 09:43:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E99DDC57B53;
	Tue, 22 Jun 2021 07:43:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8E81C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 07:43:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M7bLPW028301; Tue, 22 Jun 2021 09:43:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yoL0KXhsLL4NKxh5BTH3P+MDqhOykMbsmZ8IvU36dy0=;
 b=bJ+dFfeftePjYstivg7is5TZGEZSUcXjx8am7KNfx8PuSH6v0iGFBGP1qgqE/W65V4GP
 v1EDX4AWsrpTCSzTppFdoAgt/4efsMkoU1qOVRCjC7tcHUVF0a9b8ndszFbZ4VxwJ/SH
 WCSd4BQcmoqosRxtAG4Pn+JQZp1aFSkcJ1wbdrYYkJYO/tpzVx1PBxvdTPmmHLlUL83I
 dxsdfgnRAVzxmzJqajSnQ2K6iHIjfIl9yXhIBgLaXPIQ03gY9GN/NOypAkBQSi/YeV/3
 H/qY+7D+a1jG0XYDPSUB4wXnEPF3KTG+z7xXuP2EbTFbl2C034z7jt7DviKnOTAJIoPK FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39apx56s5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 09:43:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40BA610002A;
 Tue, 22 Jun 2021 09:43:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2581E214D35;
 Tue, 22 Jun 2021 09:43:51 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Jun
 2021 09:43:50 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210621125800.27696-1-arnaud.pouliquen@foss.st.com>
 <20210621125800.27696-2-arnaud.pouliquen@foss.st.com>
 <20210621231633.GC980846@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <343c372e-0c0a-ad4e-356b-47eb975ce0e0@foss.st.com>
Date: Tue, 22 Jun 2021 09:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621231633.GC980846@p14s>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_04:2021-06-21,
 2021-06-22 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] rpmsg: ctrl: Introduce new
 RPMSG_CREATE/RELEASE_DEV_IOCTL controls
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

Hi Mathieu

On 6/22/21 1:16 AM, Mathieu Poirier wrote:
> On Mon, Jun 21, 2021 at 02:58:00PM +0200, Arnaud Pouliquen wrote:
>> Allow the user space application to create and release an rpmsg device
>> by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
>> the /dev/rpmsg_ctrl interface
>>
>> The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
>> device.
>> Depending on the back-end implementation, the associated rpmsg driver is
>> probed and a NS announcement can be sent to the remote processor.
>>
>> The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
>> rpmsg device created either by the remote processor or with the
>> RPMSG_CREATE_DEV_IOCTL call.
>> Depending on the back-end implementation, the associated rpmsg driver is
>> removed and a NS destroy rpmsg can be sent to the remote processor.
>>
>> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
>>  include/uapi/linux/rpmsg.h | 10 ++++++++++
>>  2 files changed, 43 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>> index eeb1708548c1..cb19e32d05e1 100644
>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>> @@ -23,6 +23,7 @@
>>  #include <uapi/linux/rpmsg.h>
>>  
>>  #include "rpmsg_char.h"
>> +#include "rpmsg_internal.h"
>>  
>>  static dev_t rpmsg_major;
>>  
>> @@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
>>   * @rpdev:	underlaying rpmsg device
>>   * @cdev:	cdev for the ctrl device
>>   * @dev:	device for the ctrl device
>> + * @ctrl_lock:	serialize the ioctrls.
>>   */
>>  struct rpmsg_ctrldev {
>>  	struct rpmsg_device *rpdev;
>>  	struct cdev cdev;
>>  	struct device dev;
>> +	struct mutex ctrl_lock;
>>  };
>>  
>>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>> @@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	void __user *argp = (void __user *)arg;
>>  	struct rpmsg_endpoint_info eptinfo;
>>  	struct rpmsg_channel_info chinfo;
>> -
>> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
>> -		return -EINVAL;
>> +	struct rpmsg_device *rpdev;
>> +	int ret = 0;
>>  
>>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>  		return -EFAULT;
>> @@ -82,7 +84,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	chinfo.src = eptinfo.src;
>>  	chinfo.dst = eptinfo.dst;
>>  
>> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>> +	mutex_lock(&ctrldev->ctrl_lock);
> 
> Have you been able to verify the VFS layer doesn't take care of serializing
> ioctl() and file accesses in general?  I did a quick search in the drivers/
> directory and the vast majority of implementations don't use a lock.

Please find my answer here https://lkml.org/lkml/2021/6/21/235
I tested by suppressing the lock and adding msleep to check a potential atomic.
in the rpmsg_ctrldev_ioctl function. Nothing seems prevent the re-entrance.

Regards,
Arnaud

> 
> Thanks,
> Mathieu
> 
>> +	switch (cmd) {
>> +	case RPMSG_CREATE_EPT_IOCTL:
>> +		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>> +		break;
>> +
>> +	case RPMSG_CREATE_DEV_IOCTL:
>> +		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
>> +		if (!rpdev) {
>> +			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
>> +			ret = -ENXIO;
>> +		}
>> +		break;
>> +
>> +	case RPMSG_RELEASE_DEV_IOCTL:
>> +		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>> +		if (ret)
>> +			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
>> +				chinfo.name, ret);
>> +		break;
>> +
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +	mutex_unlock(&ctrldev->ctrl_lock);
>> +
>> +	return ret;
>>  };
>>  
>>  static const struct file_operations rpmsg_ctrldev_fops = {
>> @@ -119,6 +147,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>>  	device_initialize(dev);
>>  	dev->parent = &rpdev->dev;
>>  
>> +	mutex_init(&ctrldev->ctrl_lock);
>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>  	ctrldev->cdev.owner = THIS_MODULE;
>>  
>> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
>> index f5ca8740f3fb..1637e68177d9 100644
>> --- a/include/uapi/linux/rpmsg.h
>> +++ b/include/uapi/linux/rpmsg.h
>> @@ -33,4 +33,14 @@ struct rpmsg_endpoint_info {
>>   */
>>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>>  
>> +/**
>> + * Instantiate a new local rpmsg service device.
>> + */
>> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
>> +
>> +/**
>> + * Release a local rpmsg device.
>> + */
>> +#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
>> +
>>  #endif
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
