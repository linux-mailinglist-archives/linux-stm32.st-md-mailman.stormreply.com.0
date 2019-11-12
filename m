Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBAF9192
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2019 15:09:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EAB8C36B0B;
	Tue, 12 Nov 2019 14:09:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15320C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 14:09:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xACDuqqN018120; Tue, 12 Nov 2019 15:09:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jHbqLIGkDg3TeVdZ4Rvu7IZ9xT2WoUqaOpJODt681lE=;
 b=tBu0QLNI68RaJwYBheyd5T0hxfD/tTLo2T6geljr+ZzAt42Zo1YMgKgsUbGYA0aydXbY
 ez+sPAnHAOgqKs6Uk/i9xffBHOMVAvGkc/SYOF68OCyRLPCdM20WqoRkx+w9jTt15URC
 1QhKO7ORGLGCdr1zPiyhKSWXefezcd3UBDYgPrJV8mX+8f0mhPU0z4iK18IJkO5tlQL5
 SC35B+XeXEX280bQdmm35tPoIGHmAOB3cbvYnpZzA/UKczHqY0aGVBGhkpS58oPKOghp
 aRgPl3G+l/HX4G2SAvcmAwk2fAPsjGpfr3ktMHDVI5TOgXW3v/XSlIjRMHfQV5rNu9Cm tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psb2j5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 15:09:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2382810002A;
 Tue, 12 Nov 2019 15:09:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10DA12C1604;
 Tue, 12 Nov 2019 15:09:41 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 15:09:40 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Tue, 12 Nov 2019 15:09:40 +0100
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Thread-Topic: [PATCH v2] remoteproc: stm32: fix probe error case
Thread-Index: AQHVfOJqz28evgfEckmKeaDvWZiFgaeGrWIAgAENuoA=
Date: Tue, 12 Nov 2019 14:09:40 +0000
Message-ID: <392808fa-1504-233f-234b-0cca21886c17@st.com>
References: <1570433991-16353-1-git-send-email-fabien.dessenne@st.com>
 <20191111220416.GB3108315@builder>
In-Reply-To: <20191111220416.GB3108315@builder>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <95ED63541F302C428DC02C0FF61927C7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_04:2019-11-11,2019-11-12 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] remoteproc: stm32: fix probe error case
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

Hi Bjorn,


On 11/11/2019 11:04 PM, Bjorn Andersson wrote:
> On Mon 07 Oct 00:39 PDT 2019, Fabien Dessenne wrote:
>
>> If the rproc driver is probed before the mailbox driver and if the rproc
>> Device Tree node has some mailbox properties, the rproc driver probe
>> shall be deferred instead of being probed without mailbox support.
>>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> ---
>> Changes since v1: test IS_ERR() before checking PTR_ERR()
>> ---
>>   drivers/remoteproc/stm32_rproc.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> index 2cf4b29..a507332 100644
>> --- a/drivers/remoteproc/stm32_rproc.c
>> +++ b/drivers/remoteproc/stm32_rproc.c
>> @@ -310,7 +310,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>>   	}
>>   };
>>   
>> -static void stm32_rproc_request_mbox(struct rproc *rproc)
>> +static int stm32_rproc_request_mbox(struct rproc *rproc)
>>   {
>>   	struct stm32_rproc *ddata = rproc->priv;
>>   	struct device *dev = &rproc->dev;
>> @@ -329,10 +329,14 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>>   
>>   		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>>   		if (IS_ERR(ddata->mb[i].chan)) {
>> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
>> +				return -EPROBE_DEFER;
> If for some reason you get EPROBE_DEFER when i > 0 you need to
> mbox_free_channel() channels [0..i) before returning.

The mailbox framework returns EPROBE_DIFFER to inform that the mailbox 
provider has not registered yet. I do not expected to have a success 
followed by a EPROBE_DEFER error.

But in the very special case where we use two different mailbox 
providers this may happen.

I will send an updated version, thanks for pointing this.

BR

Fabien

>
> Regards,
> Bjorn
>
>>   			dev_warn(dev, "cannot get %s mbox\n", name);
>>   			ddata->mb[i].chan = NULL;
>>   		}
>>   	}
>> +
>> +	return 0;
>>   }
>>   
>>   static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>> @@ -596,7 +600,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto free_rproc;
>>   
>> -	stm32_rproc_request_mbox(rproc);
>> +	ret = stm32_rproc_request_mbox(rproc);
>> +	if (ret)
>> +		goto free_rproc;
>>   
>>   	ret = rproc_add(rproc);
>>   	if (ret)
>> -- 
>> 2.7.4
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
