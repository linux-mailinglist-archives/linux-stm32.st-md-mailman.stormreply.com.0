Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 611BF32B8C8
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 15:59:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 064B3C57B64;
	Wed,  3 Mar 2021 14:59:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5540FC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 14:59:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123EvxNC032645; Wed, 3 Mar 2021 15:58:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vRm8bwSPJgkfRJocoNDq21I3g5Iz0nJ0Oe0Q61WfJaE=;
 b=Jz78D8JecEgrynfgvqJwgZDMncQ3IQHrqilHhKgppgkEMIS9nbQ+Q9kfz5XH3qSHZify
 e3jbIVkB5iAtMFDOA9IDjh8VBzQjpYKLJkDoRYPR8HvoJWzOdC9YZfxFqNDHmzwtfMLs
 iItOsRpTfQQv5FS7c/yuM230YiLWgb88Cnr8ZyddTOmqNks/arW7mDV4JjCIsS6RZ/8V
 Fv94O8VprG0ITZVq/G83RL+HlWwAtoc3+8r2XGa2Ra7WltIPSdnqTJ1bPGd87RPtEcyu
 R0Oth4y6gxSNenacFrkSBSQHMqpCme4YHzzxVkkeoT4+MKYvUZKY+L4WPCkVTAkfMoA9 HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfc41huy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 15:58:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B12A2100038;
 Wed,  3 Mar 2021 15:58:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21FE025F403;
 Wed,  3 Mar 2021 15:58:58 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar
 2021 15:58:57 +0100
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-6-arnaud.pouliquen@foss.st.com>
 <20210302180111.GB3791957@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <21d27324-3735-ee93-f3aa-813475b64b93@foss.st.com>
Date: Wed, 3 Mar 2021 15:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302180111.GB3791957@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_04:2021-03-03,
 2021-03-03 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 05/16] rpmsg: char: dissociate the
 control device from the rpmsg class
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



On 3/2/21 7:01 PM, Mathieu Poirier wrote:
> On Fri, Feb 19, 2021 at 12:14:50PM +0100, Arnaud Pouliquen wrote:
>> The RPMsg control device is a RPMsg device, it is already
>> referenced in the RPMsg bus. There is only an interest to
>> reference the ept char devices in the rpmsg class.
>> This patch prepares the code split of the control and end point
>> devices in two separate files.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 78a6d19fdf82..23e369a00531 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -485,7 +485,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>  	dev = &ctrldev->dev;
>>  	device_initialize(dev);
>>  	dev->parent = &rpdev->dev;
>> -	dev->class = rpmsg_class;
> 
> This may break user space...  It has been around for so long that even if the
> information is redundant we have to keep it.

Yes, this point is part of the grey space of my series...
I did it on the assumption that the "rpmsg" class interface is not used for the
control part. Indeed, the group associated to the class provides information
about the name service, the source address and the destination address of the
endpoint.These group is not defined for the control device.

That said, to preserve the interface, I can move the class creation in rpmsg
control driver, to share it between the both drivers. As consequence I will need
to manage the probe ordering of the char and control modules to ensure that the
class is created before used. This should be solved by reintroducing patch[1]
with a fix for the compilation warning.

[1]https://lkml.org/lkml/2021/2/4/197

Thanks,
Arnaud

> 
>>  
>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>  	ctrldev->cdev.owner = THIS_MODULE;
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
