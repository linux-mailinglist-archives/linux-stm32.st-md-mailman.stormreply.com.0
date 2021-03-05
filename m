Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BF32E6A0
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 11:46:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA49EC57B7D;
	Fri,  5 Mar 2021 10:46:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26E75C57B7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 10:46:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125AcHHC020354; Fri, 5 Mar 2021 11:46:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dLupVWCVW75NjxCM/V3qhiOixYswGXxMdSDCqfLT35A=;
 b=s9f6Pf46WD9Oai8JQ3m99F58aV+sxgXloCqtulmlKBKy0q98eThqfoIIeB2xkKGJTwvy
 sjS43aK6wPbgi3kDKEm00fs3/sOOpw8l8wtvcif8J9j1iZOqb/OeysWFeoYOuLH7Rx76
 pbABCNnoA6H2a6ApBLVfAGQHKGZpsItHhCukCjdjgC62cGWhbOI8C0BEYkadqljTX9M8
 zLHdUjeiMQ358RV8cZUN/hxV2EVbMJXfhdc9pnrWyXh/7DurHheLNoZ4yoK+K7qgpp5O
 x4scoK26IGeQbGIqd9PZ3pJbEe3HSwlaZK8UOrA16rcvRFEpcq/O+b48C8791ECz2tBJ WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373cb5tgk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 11:46:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFB4510002A;
 Fri,  5 Mar 2021 11:46:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B795C2425CC;
 Fri,  5 Mar 2021 11:46:48 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Mar
 2021 11:46:48 +0100
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
 <20210304185520.GC3854911@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <de4db82c-8136-6fe7-f17a-59d65e8b266c@foss.st.com>
Date: Fri, 5 Mar 2021 11:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304185520.GC3854911@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_05:2021-03-03,
 2021-03-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 13/16] rpmsg: char: introduce
 __rpmsg_chrdev_create_eptdev function
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



On 3/4/21 7:55 PM, Mathieu Poirier wrote:
> On Fri, Feb 19, 2021 at 12:14:58PM +0100, Arnaud Pouliquen wrote:
>> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
>> the rpmsg_eptdev context structure.
>> This patch prepares the introduction of a RPMsg device for the
>> char device. the RPMsg device will need a reference to the context.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
>>  1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 09ae1304837c..66dcb8845d6c 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -328,8 +328,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>>  
>> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>> -			       struct rpmsg_channel_info chinfo)
>> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
>> +							 struct device *parent,
>> +							 struct rpmsg_channel_info chinfo)
>>  {
>>  	struct rpmsg_eptdev *eptdev;
>>  	struct device *dev;
>> @@ -337,7 +338,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  
>>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>>  	if (!eptdev)
>> -		return -ENOMEM;
>> +		return ERR_PTR(-ENOMEM);
>>  
>>  	dev = &eptdev->dev;
>>  	eptdev->rpdev = rpdev;
>> @@ -381,7 +382,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  		put_device(dev);
>>  	}
>>  
>> -	return ret;
>> +	return eptdev;
>>  
>>  free_ept_ida:
>>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
>> @@ -391,7 +392,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  	put_device(dev);
>>  	kfree(eptdev);
>>  
>> -	return ret;
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>> +			       struct rpmsg_channel_info chinfo)
>> +{
>> +	struct rpmsg_eptdev *eptdev;
>> +
>> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
> 
> Shouldn't the second argument to __rpmsg_chrdev_create_eptdev() be @parent?

This keep the legacy hierarchy:
https://elixir.bootlin.com/linux/latest/source/drivers/rpmsg/rpmsg_char.c#L362

Thanks,
Arnaud


> 
>> +	if (IS_ERR(eptdev))
>> +		return PTR_ERR(eptdev);
>> +
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>>  
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
