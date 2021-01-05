Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0292EB0F0
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 18:05:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FFDFC56638;
	Tue,  5 Jan 2021 17:05:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 340C7C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 17:05:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 105H3RpI002497; Tue, 5 Jan 2021 18:05:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AaKXXBBSLn/MwtIXJ9J+oqskFzFqwJhdPjJtMaNGd3w=;
 b=Ad8AgPEoHISNV4TWrfQYBnrfjVkgwDVMZHyEAVFsb5E8QGdk1kvCHlmXlxaDjnXgYHx8
 A31B3r8CRAHZAAbZUhO8cU0PaBkH/ApJHI+N1mD3VTsQY8maJkMy5WmSskxebWGUTyZA
 CP+bBtCQPaHUVwLaarCyD6TUqILKtFGSzOcxCDDNtzO2njGspREYkSALlOZcPAz57Tkt
 h2WQ0Apd0+8IyKBmbLxOOIc8V9JEa+LtaAqokAiat7YAL5t7AiYP9kid1EEw7dPTEkIe
 c37FjirimPzimaOARIEbnn0Mu85el3BENqkHQ3qJINnSLSeSVpI4r6sK/vknMFMxAHYy Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tf66x668-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 18:05:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65E2610002A;
 Tue,  5 Jan 2021 18:05:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56A3723A239;
 Tue,  5 Jan 2021 18:05:09 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 18:05:08 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-11-arnaud.pouliquen@foss.st.com>
 <X/O6BvP+vqLvbi5f@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <9a75e5fa-ad09-0145-18f1-09738433bf88@foss.st.com>
Date: Tue, 5 Jan 2021 18:05:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/O6BvP+vqLvbi5f@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_05:2021-01-05,
 2021-01-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 10/16] rpmsg: char: allow only one
	endpoint per device
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



On 1/5/21 1:59 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> Only one endpoint can be created per device, prevent from multi open.
>>
> 
> Having multiple invocations of rpmsg_create_ept() with the same chinfo
> sounds like a bad idea. I think in the SMD and GLINK case the underlying
> transport would complain that the related chinfo is already "busy", but
> this seems like an appropriate fix regardless.
> 
> Please add a proper Fixes: tag and send this outside of this patch
> series.

I will send it in a separate patch.

Regards,
Arnaud

> 
> Thanks,
> Bjorn
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 66e01b979e72..4b0674a2e3e9 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -122,6 +122,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>>  	struct device *dev = &eptdev->dev;
>>  
>> +	if (eptdev->ept)
>> +		return -EBUSY;
>> +
>>  	get_device(dev);
>>  
>>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
