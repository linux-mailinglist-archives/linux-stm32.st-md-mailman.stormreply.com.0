Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F32D4485
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Dec 2020 15:41:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBFEDC3FADB;
	Wed,  9 Dec 2020 14:41:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 306E8C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 14:41:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B9EameG008895; Wed, 9 Dec 2020 15:41:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ruM8O5JmQhAL2yyKHvMDjpezWuFSeYHIxAD3Uc8lmtM=;
 b=Acz/Q+sVuFB+AGvDOu9FsgxfVzpnyqarVQT5H8+XRX1xG66zu7hxxjRXJh4Fhm8ujzRx
 uGAnCiHOXWkggZ+WKxjaSEwPZYLak/KvaPDqjMp5hFs6U/33nNH/VveoqH/ruxvwZLvd
 Vr4SXWCrOalLtqhEySh8fg18H3zbFVDkqQTJk3mMd62rdziDq3JvEmVJSBfUKARO1mMJ
 XXyQm3yq/OVaTNATbcPbvNliQpis7vq9YdiHZDEdFAmeujvsuJNN5FtBgR4Bu98RPEx+
 01LFs7YXCedI+9J10xwRUFxNxGKABsWByjrwBqDEpTYOgM9UrhHsFBP//hvOgPXhE98o KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35agt95gbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:41:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5A3D10002A;
 Wed,  9 Dec 2020 15:41:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1721239BBB;
 Wed,  9 Dec 2020 15:41:45 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 15:41:45 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
References: <20201209131214.2382-1-arnaud.pouliquen@foss.st.com>
 <5856fd28a803a36b36bdb201f2690b837d8b19c2.camel@pengutronix.de>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <a2b81c79-2879-f469-0805-99d542f1cd93@foss.st.com>
Date: Wed, 9 Dec 2020 15:41:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5856fd28a803a36b36bdb201f2690b837d8b19c2.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_13:2020-12-09,
 2020-12-09 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: don't print an error
 on probe deferral
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



On 12/9/20 3:06 PM, Ahmad Fatoum wrote:
> Hello Arnaud,
> 
> On Wed, 2020-12-09 at 14:12 +0100, Arnaud Pouliquen wrote:
>> From: Etienne Carriere <etienne.carriere@st.com>
>>
>> Change stm32 remoteproc driver to not generate an error message
>> when device probe operation is deferred for the reset controller.
>>
>> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/stm32_rproc.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c
>> b/drivers/remoteproc/stm32_rproc.c
>> index a180aeae9675..25c916782991 100644
>> --- a/drivers/remoteproc/stm32_rproc.c
>> +++ b/drivers/remoteproc/stm32_rproc.c
>> @@ -614,7 +614,9 @@ static int stm32_rproc_parse_dt(struct
>> platform_device *pdev,
>>  
>>  	ddata->rst = devm_reset_control_get_by_index(dev, 0);
>>  	if (IS_ERR(ddata->rst)) {
>> -		dev_err(dev, "failed to get mcu reset\n");
>> +		if (PTR_ERR(ddata->rst) != -EPROBE_DEFER)
>> +			dev_err(dev, "failed to get mcu reset\n");
>> +
> 
> There is dev_err_probe() now that could be used here instead.
> It has the added benefit that it records the reason for the
> deferred probe.

Thanks for the advice, I will test it!

> 
>>  		return PTR_ERR(ddata->rst);
>>  	}
>>  
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
