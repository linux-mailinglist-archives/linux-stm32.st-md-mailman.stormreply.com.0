Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBC2EB0D3
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 18:02:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C2E2C56638;
	Tue,  5 Jan 2021 17:02:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 347EBC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 17:02:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 105H2UXi010184; Tue, 5 Jan 2021 18:02:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=o/tvGSRFaT8cAu8YixqpGXymFM5L4ZlyvrozxyJlsZ0=;
 b=nmPgg4FEunCGfFO2mSiDimZ0mEPqN4XoiS8/yyVOskxYQlaA8h6vz+C8y3ODq4L85cTj
 XlL/pRFtwhOf9l1SDMkYwFrsJrMabL3wZwDNAj5v5BoLjW0L1/xMYkTMb6y8tIgsC5hB
 CbG1e5s1VQN+jbIT8NsJvb1qV7yUdSVa5PI7oKWzZ4F8VZYdqkG5z2AzJB5Kr4Tw456M
 mcvi+xZQkm6rHVike3WqjbQZiAlus9g+sW3ruH1RdNz17bCnu8sx+DpbvwSACcUVTUNV
 tHJuEvtqgM3L0YxpDxpYwAeb3Cehri4ddqm8FQM/HOxw670ISVS8ZQaVBrJbHpFZP5dP aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35teuv2ejj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 18:02:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA98B10003E;
 Tue,  5 Jan 2021 18:02:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA37E22BFCE;
 Tue,  5 Jan 2021 18:02:29 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 18:02:29 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-6-arnaud.pouliquen@foss.st.com>
 <X/O1CRjINeCG8PkA@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <7375f9ef-7179-8ec1-3133-4519d4f68c3a@foss.st.com>
Date: Tue, 5 Jan 2021 18:02:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/O1CRjINeCG8PkA@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_05:2021-01-05,
 2021-01-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 05/16] rpmsg: ns: initialize channel
 info override field
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



On 1/5/21 1:38 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> By default driver_override should be 0 to avoid to force
>> the channel creation with a specified name.The local variable
>> is not initialized.
>>
> 
> The same problem exists in qcom_glink_native, qcom_smd and rpmsg_char.

Right! And perhaps initializing the structure on declaration would be a better
method.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_ns.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
>> index 762ff1ae279f..a526bff62947 100644
>> --- a/drivers/rpmsg/rpmsg_ns.c
>> +++ b/drivers/rpmsg/rpmsg_ns.c
>> @@ -55,6 +55,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>>  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>>  	chinfo.src = RPMSG_ADDR_ANY;
>>  	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
>> +	chinfo.driver_override = NULL;
>>  
>>  	dev_info(dev, "%sing channel %s addr 0x%x\n",
>>  		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
