Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E0443181
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 16:23:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DFE2C5AB60;
	Tue,  2 Nov 2021 15:23:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E44BCC5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 15:23:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2CZGxO025646;
 Tue, 2 Nov 2021 16:23:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hixitRXFt2cnZxXEXUSdZw7s3ZLaCDWux2Zfi6hV6vE=;
 b=XVJ/Jzmdv9AmVZRhq49gDOHpZEl4FjLHNck13XVYQ0W8QJT6COcmso+bxO9HAxNJsgGS
 QfOGUKd1X0GCkwvMRVfj51LXGaLyG2o4oEKT6WzTWfRD7jJTwYmuWizP1JLPksPjn64d
 wPPkGMl1Pd94EDGtxCceH/hWZNPsEGByUQSgniPZ+cWAhhvJm0T8U/hMaSFDU1Q+mU9s
 5rriCKdhCR6fqmBfnVwXh7EZRyJm4NeQI4AFfxu2Gh5h6eki0zHPzPXTLN6HAtufpPm0
 +XmK70mgFZf52XJ37ovrxOxnDObk4mrU7Lh0AL1UijHdjRdgnQSOExpLYi0fgW9vu92l oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30vnb80f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 16:23:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EDBF10002A;
 Tue,  2 Nov 2021 16:23:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95E22248EF7;
 Tue,  2 Nov 2021 16:23:42 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 16:23:41 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
 <YYAcYLxEmbwJShg7@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com>
Date: Tue, 2 Nov 2021 16:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYAcYLxEmbwJShg7@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 02/10] rpmsg: create the rpmsg class in
 core instead of in rpmsg char
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



On 11/1/21 5:57 PM, Bjorn Andersson wrote:
> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
> 
>> Migrate the creation of the rpmsg class from the rpmsg_char
>> to the core that the class is usable by all rpmsg services.
>>
>> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 14 ++------------
>>  drivers/rpmsg/rpmsg_core.c | 26 ++++++++++++++++++++++++--
>>  include/linux/rpmsg.h      | 10 ++++++++++
>>  3 files changed, 36 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 941c5c54dd72..327ed739a3a7 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -28,7 +28,6 @@
>>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>>  
>>  static dev_t rpmsg_major;
>> -static struct class *rpmsg_class;
>>  
>>  static DEFINE_IDA(rpmsg_ctrl_ida);
>>  static DEFINE_IDA(rpmsg_ept_ida);
>> @@ -362,7 +361,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>  	init_waitqueue_head(&eptdev->readq);
>>  
>>  	device_initialize(dev);
>> -	dev->class = rpmsg_class;
>> +	dev->class = rpmsg_get_class();
>>  	dev->parent = parent;
>>  	dev->groups = rpmsg_eptdev_groups;
>>  	dev_set_drvdata(dev, eptdev);
>> @@ -482,7 +481,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>  	dev = &ctrldev->dev;
>>  	device_initialize(dev);
>>  	dev->parent = &rpdev->dev;
>> -	dev->class = rpmsg_class;
>> +	dev->class = rpmsg_get_class();
>>  
>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>  	ctrldev->cdev.owner = THIS_MODULE;
>> @@ -558,17 +557,9 @@ static int rpmsg_chrdev_init(void)
>>  		return ret;
>>  	}
>>  
>> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>> -	if (IS_ERR(rpmsg_class)) {
>> -		pr_err("failed to create rpmsg class\n");
>> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> -		return PTR_ERR(rpmsg_class);
>> -	}
>> -
>>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>>  	if (ret < 0) {
>>  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
>> -		class_destroy(rpmsg_class);
>>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>  	}
>>  
>> @@ -579,7 +570,6 @@ postcore_initcall(rpmsg_chrdev_init);
>>  static void rpmsg_chrdev_exit(void)
>>  {
>>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>> -	class_destroy(rpmsg_class);
>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>  }
>>  module_exit(rpmsg_chrdev_exit);
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index 9151836190ce..53162038254d 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -20,6 +20,8 @@
>>  
>>  #include "rpmsg_internal.h"
>>  
>> +static struct class *rpmsg_class;
>> +
>>  /**
>>   * rpmsg_create_channel() - create a new rpmsg channel
>>   * using its name and address info.
>> @@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>  }
>>  EXPORT_SYMBOL(rpmsg_poll);
>>  
>> +/**
>> + * rpmsg_get_class() - get reference to the sysfs rpmsg class
>> + *
>> + * This function return the pointer to the "rpmsg" class created by the rpmsg core.
>> + *
>> + * Returns the struct class pointer
>> + */
>> +struct class *rpmsg_get_class(void)
> 
> What value does this helper function add? Can't we just expose
> rpmsg_class directly?

look to me cleaner to not expose directly the rpmsg_class in rpmsg.h as this
variable is read only for rpmsg services.

> 
>> +{
>> +	return rpmsg_class;
>> +}
>> +EXPORT_SYMBOL(rpmsg_get_class);
>> +
>>  /**
>>   * rpmsg_trysend_offchannel() - send a message using explicit src/dst addresses
>>   * @ept: the rpmsg endpoint
>> @@ -629,10 +644,17 @@ static int __init rpmsg_init(void)
>>  {
>>  	int ret;
>>  
>> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>> +	if (IS_ERR(rpmsg_class)) {
>> +		pr_err("failed to create rpmsg class\n");
>> +		return PTR_ERR(rpmsg_class);
>> +	}
>> +
>>  	ret = bus_register(&rpmsg_bus);
>> -	if (ret)
>> +	if (ret) {
>>  		pr_err("failed to register rpmsg bus: %d\n", ret);
>> -
>> +		class_destroy(rpmsg_class);
>> +	}
>>  	return ret;
>>  }
>>  postcore_initcall(rpmsg_init);
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> 
> Isn't this just going to be used by rpmsg_char and rpmsg_ctrl? Do we
> really need to expose it in the client-facing API?

I based this dev on hypothesis that the class could be used by some other rpmsg
clients. But it is not mandatory. It can be extended later, on need.

What would you propose as an alternative to this API?

I can see 2 alternatives:
- Define the rpmsg_class in rpmsg_internal.h
  In current patchset rpmsg_char.c does not include the rpmsg_internal.h.
  I'm not sure if this include makes sense for an rpmsg service driver.

- Use "extern struct class *rpmsg_class; " in rpmsg_char and rpmsg_ctrl modules

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> index a8dcf8a9ae88..6fe51549d931 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>  			poll_table *wait);
>>  
>> +struct class *rpmsg_get_class(void);
>> +
>>  #else
>>  
>>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
>> @@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>>  	return 0;
>>  }
>>  
>> +static inline struct class *rpmsg_get_class(void)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return NULL;
>> +}
>> +
>>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>>  
>>  /* use a macro to avoid include chaining to get THIS_MODULE */
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
