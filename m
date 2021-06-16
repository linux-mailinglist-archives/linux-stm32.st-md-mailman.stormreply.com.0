Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E313A94CF
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 10:13:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 393A4C597AE;
	Wed, 16 Jun 2021 08:13:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAC49C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 08:13:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G8DGWO008011; Wed, 16 Jun 2021 10:13:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RFO7QxPkonL2tSMmfFPzaKeXJvDNFYEeku7V/+jRRdM=;
 b=UyMvL2MSJGwUsT8QQgQy2e51msnhcbkROPDLrB7bY7YlDZgi+l/dihYWUjlRcGpXMT0u
 kMIOQFO2bWsy+74jeCD8j1HfC/k93VfZi+DNskhCd66Htp2XrspleAVTXYbRE77FYYFx
 NFqhMJeWnUFJBl1IVikRrBlsZM/nEEg8SQeYR+rGVRTiz+hqeMkpIu31DgwDVjAcfh/E
 Peb9vvL6zKdYVHF3CBaWFYb9ZNC94cqXBwJ6+rh5bHaX4rgDwnp9qtQrPvR5KuWVOQ8N
 V4sp7RL6ZSbSFYSAb8pGSzLPRmtBO4gJT+mVzJz60gtgqv1T2QWAXgNn9awKZq4xaFIV UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 397bxagrvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 10:13:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0AE6610002A;
 Wed, 16 Jun 2021 10:13:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1EBC2199A3;
 Wed, 16 Jun 2021 10:13:53 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 10:13:53 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-3-arnaud.pouliquen@foss.st.com>
 <20210615173844.GA604521@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <0465abac-1526-bf6b-605d-9f29145f3f58@foss.st.com>
Date: Wed, 16 Jun 2021 10:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615173844.GA604521@p14s>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_05:2021-06-15,
 2021-06-16 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/4] rpmsg: ctrl: Introduce
	RPMSG_RELEASE_DEV_IOCTL
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



On 6/15/21 7:38 PM, Mathieu Poirier wrote:
> Good day,
> 
> On Fri, Jun 04, 2021 at 11:14:04AM +0200, Arnaud Pouliquen wrote:
>> Implement the RPMSG_RELEASE_DEV_IOCTL to allow the user application to
>> release a rpmsg device created either by the remote processor or with
>> the RPMSG_CREATE_DEV_IOCTL call.
>> Depending on the back-end implementation, the associated rpmsg driver is
>> removed and a NS destroy rpmsg can be sent to the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_ctrl.c | 7 +++++++
>>  include/uapi/linux/rpmsg.h | 5 +++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>> index 4aa962df3661..cb19e32d05e1 100644
>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>> @@ -98,6 +98,13 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  		}
>>  		break;
>>  
>> +	case RPMSG_RELEASE_DEV_IOCTL:
>> +		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>> +		if (ret)
>> +			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
>> +				chinfo.name, ret);
>> +		break;
>> +
> 
> Please move the content of this patch in 1/4.  

ok

> 
>>  	default:
>>  		ret = -EINVAL;
>>  	}
>> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
>> index f9d5a74e7801..38639ba37438 100644
>> --- a/include/uapi/linux/rpmsg.h
>> +++ b/include/uapi/linux/rpmsg.h
>> @@ -38,4 +38,9 @@ struct rpmsg_endpoint_info {
>>   */
>>  #define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
>>  
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
