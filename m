Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B87052EB106
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 18:08:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79BEBC56638;
	Tue,  5 Jan 2021 17:08:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5C2FC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 17:08:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 105H2UiT010183; Tue, 5 Jan 2021 18:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7NJ8olbBLimAhQJ9f2wajbEciT5QawMFDsYtnEdlfgM=;
 b=txC8IkStyg1VJWP4IXXiopDRen2/QLsq9aCMIvm8tebrfSRt0FtQjERKQIb0adCkVu6y
 YMhiIKZCRstZfDJmioAVvZgLpJT4Tz4nay93I8FnSWCm2FTBAYhB1zA0cGpT8xp6BSar
 glSCrVKBXxQweSoL3pXWJkK1QpS4ZtMOWUh99aKSv+yPMafyGcmHkzJ/idB5pDn6gXSh
 +RUxL8VX/WEwCi8QeaLq4zejP6Gh7J0CosPiUQgAo633uxfcONsN5EoWSGShIHbyKn2G
 /2tAlfMQ2heAiEk9aYHYFBgSYKMMbI4CIBY6q7UuM3cQzq45d8icD/hG7lr2m8lKMT2z 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35teuv2fmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 18:08:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2A2C100034;
 Tue,  5 Jan 2021 18:08:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9410F249E8C;
 Tue,  5 Jan 2021 18:08:10 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 18:08:09 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-12-arnaud.pouliquen@foss.st.com>
 <X/O6z6ngPmML3nOD@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <4058e3b6-11b3-0938-e00d-673f0896692d@foss.st.com>
Date: Tue, 5 Jan 2021 18:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/O6z6ngPmML3nOD@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_05:2021-01-05,
 2021-01-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 11/16] rpmsg: char: check destination
 address is not null
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



On 1/5/21 2:03 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> The name service announcement is not sent if no endpoint is created by
>> default. If the destination address is not precised by the
>> application when creating the device (thanks to the RPMsg CTRL interface),
>> it is not possible to have a valid RPMsg channel.
>>
> 
> In the Qualcomm transports, the chinfo.name is used to identify the
> channel, so there it's valid to create a endpoint without dst.

So to be move in rpmsg virtio...either reporting an error or generating a NS
announcement.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 4b0674a2e3e9..8b1928594d10 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -305,6 +305,16 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>  	struct device *dev;
>>  	int ret;
>>  
>> +	/* There is not ept created by default. As consequence there is not NS
>> +	 * announcement and the destination address has to be set.
>> +	 * this limitation could be solved in future by adding a helper in
>> +	 * rpmsg_ns.
>> +	 */
>> +	if (rpdev->dst == RPMSG_ADDR_ANY) {
>> +		dev_err(dev, "destination address invalid (%d)\n", rpdev->dst);
>> +		return -EINVAL;
>> +	}
>> +
>>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>>  	if (!eptdev)
>>  		return -ENOMEM;
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
