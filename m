Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EFC32E704
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 12:09:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE7E7C57B7D;
	Fri,  5 Mar 2021 11:09:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDE84C57B7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 11:09:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125B2LbZ026897; Fri, 5 Mar 2021 12:09:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=I9/kaJnfjfj1AU6P3K82WCYMuyiaZJhwaAIyQRNbJYA=;
 b=qsIr0VUr8Rv0rpa+5eYHsAi5k4r50zcRY1O0PDBuVUaPYWw2yNUTzA2Mwz7DtCTlQsSW
 CTu7yGv/6c8JxTM2TIqHuvhQQ9+N7XFnXuxnUa2TEowgl6IlzjZqibS+zf9eGd/P8f9I
 avFo13qFqhgfzO3I5u8Vqam/P8jVK/a9qPoXTPvpyP+HCsZDJaQ4RqfR/XVWGo2Uwdck
 RRTx/lnHhqCKb9++GuGV+58LfdHmHAr7hxgGzZjg4PgaMHK3d9y0IaeoP2PvhXKQXTSs
 2UPWZBxPxd/4y8VbIPZwAPHDp1bUviw0mE/JgzKBdnEjaQwroy+4WNbB4puO4dOTl3Cj vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfdynt7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 12:09:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD77110002A;
 Fri,  5 Mar 2021 12:09:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8DB624A0AD;
 Fri,  5 Mar 2021 12:09:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Mar
 2021 12:09:38 +0100
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
 <20210304184034.GA3854911@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <d5a451e1-3dac-f665-aabd-bd72afc88b75@foss.st.com>
Date: Fri, 5 Mar 2021 12:09:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304184034.GA3854911@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_05:2021-03-03,
 2021-03-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 15/16] rpmsg: char: no dynamic endpoint
 management for the default one
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



On 3/4/21 7:40 PM, Mathieu Poirier wrote:
> There has to be a capital letter at the start of the title:
> 
> rpmsg: char: No dynamic endpoint management for the default one
> 
> Please fix for all the patches.

Ok, I will update the subjects with capital letter in my next revision.

Just for my information, is it a new rule? kernel documentation [1] gives a
canonical subject and an example without capital letter.

[1]
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#the-canonical-patch-format

> 
> On Fri, Feb 19, 2021 at 12:15:00PM +0100, Arnaud Pouliquen wrote:
>> Do not dynamically manage the default endpoint. The ept address must
>> not change.
>> This update is needed to manage the RPMSG_CREATE_DEV_IOCTL. In this
>> case a default endpoint is used and it's address must not change or
>> been reused by another service.
> 
> The above is very difficult to understand.  I am not sure about introducing
> RPMSG_CREATE_DEV_IOCTL in this patchset.  More on that in an upcoming comment.

The purpose of this revision was mainly to provide a view of what we could do to
provide a more generic control interface.

To simplify the review I can remove the RPMSG_CREATE_DEV_IOCTL management and
send it as a next step, in a separate patchset.

> 
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 28 +++++++++++++++++++++-------
>>  1 file changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index c98b0e69679b..8d3f9d6c20ad 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -114,14 +114,23 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>  	struct rpmsg_endpoint *ept;
>>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>>  	struct device *dev = &eptdev->dev;
>> +	u32 addr = eptdev->chinfo.src;
>>  
>>  	get_device(dev);
>>  
>> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> -	if (!ept) {
>> -		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>> -		put_device(dev);
>> -		return -EINVAL;
>> +	/*
>> +	 * The RPMsg device can has been created by a ns announcement. In this
>> +	 * case a default endpoint has been created. Reuse it to avoid to manage
>> +	 * a new address on each open close.
>> +	 */
> 
> Here too it is very difficult to understand because the comment
> doesn't not describe what the code does.  The code creates an enpoint if it
> has not been created, which means /dev/rpmsgX was created from the ioctl. 

Right, not enough explicit

Thanks,
Arnaud

> 
>> +	ept = rpdev->ept;
>> +	if (!ept || addr != ept->addr) {
>> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> +		if (!ept) {
>> +			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>> +			put_device(dev);
>> +			return -EINVAL;
>> +		}
>>  	}
>>  
>>  	eptdev->ept = ept;
>> @@ -133,12 +142,17 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>  static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>>  {
>>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
>> +	struct rpmsg_device *rpdev = eptdev->rpdev;
>>  	struct device *dev = &eptdev->dev;
>>  
>> -	/* Close the endpoint, if it's not already destroyed by the parent */
>> +	/*
>> +	 * Close the endpoint, if it's not already destroyed by the parent and it is not the
>> +	 * default one.
>> +	 */
>>  	mutex_lock(&eptdev->ept_lock);
>>  	if (eptdev->ept) {
>> -		rpmsg_destroy_ept(eptdev->ept);
>> +		if (eptdev->ept != rpdev->ept)
>> +			rpmsg_destroy_ept(eptdev->ept);
>>  		eptdev->ept = NULL;
>>  	}
>>  	mutex_unlock(&eptdev->ept_lock);
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
