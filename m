Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1551000C0
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Nov 2019 09:51:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D94AC36B0B;
	Mon, 18 Nov 2019 08:51:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8AC2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2019 08:51:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAI8g912024724; Mon, 18 Nov 2019 09:50:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Npr6b/rvW2p3vyDbOovmjWkHvtCK3QNb78JsQ25FEE8=;
 b=mHjn7cvzJFqMewAxbVioRjex5Ekp46vR2PEgVQLGxrTbKetgequnsiDSb5l2SKi/LXVi
 QYmHVWLYed1W77JFeDKowzvnn6VCrxG3sUFhJj43s0UkXyUkp5yIx7yJf+7r9GGM2fXp
 x1BGGcqomuRTV/r4kykamnSWjm/Z2PjmEmxRy8Clsj76St1ALl6pxQbp1ikWjANck3Vi
 PG0bbtOqWR4DA6TegBC+Fl5wkBt/QZRfEkFAT9ox9GG/RYEcI09XIbDPujSzZ4m6P412
 jO8m8mzf0erUd/78PVR612/OATZqGNe6tRXoBXPTx+KD1eWnW4pUlBHlcFEwyWBHkrOo nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9unrate-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2019 09:50:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8DDB10002A;
 Mon, 18 Nov 2019 09:50:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5C542B8BE8;
 Mon, 18 Nov 2019 09:50:53 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Nov
 2019 09:50:53 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Mon, 18 Nov 2019 09:50:53 +0100
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Thread-Topic: [PATCH v4] remoteproc: stm32: fix probe error case
Thread-Index: AQHVm5vlCsf8lNbU9ES36nbBAkDt6aeMhJuAgAQN+QA=
Date: Mon, 18 Nov 2019 08:50:53 +0000
Message-ID: <ee487060-1eda-0716-9fba-48f806644632@st.com>
References: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
 <20191115185549.GA17332@xps15>
In-Reply-To: <20191115185549.GA17332@xps15>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <0F74F2676284B340997AADED506AE1C1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-18_01:2019-11-15,2019-11-17 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4] remoteproc: stm32: fix probe error case
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

Hi Mathieu


On 15/11/2019 7:55 PM, Mathieu Poirier wrote:
> Hi Fabien,
>
> On Fri, Nov 15, 2019 at 11:03:08AM +0100, Fabien Dessenne wrote:
>> If the rproc driver is probed before the mailbox driver and if the rproc
>> Device Tree node has some mailbox properties, the rproc driver probe
>> shall be deferred instead of being probed without mailbox support.
>>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> ---
>> Changes since v3: on error, free mailboxes from stm32_rproc_request_mbox()
>> Changes since v2: free other requested mailboxes after one request fails
>> Changes since v1: test IS_ERR() before checking PTR_ERR()
>> ---
>>   drivers/remoteproc/stm32_rproc.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> index 2cf4b29..bcebb78 100644
>> --- a/drivers/remoteproc/stm32_rproc.c
>> +++ b/drivers/remoteproc/stm32_rproc.c
>> @@ -310,11 +310,12 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>>   	}
>>   };
>>   
>> -static void stm32_rproc_request_mbox(struct rproc *rproc)
>> +static int stm32_rproc_request_mbox(struct rproc *rproc)
>>   {
>>   	struct stm32_rproc *ddata = rproc->priv;
>>   	struct device *dev = &rproc->dev;
>>   	unsigned int i;
>> +	int j;
>>   	const unsigned char *name;
>>   	struct mbox_client *cl;
>>   
>> @@ -329,10 +330,20 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>>   
>>   		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>>   		if (IS_ERR(ddata->mb[i].chan)) {
>> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
>> +				goto err_probe;
>>   			dev_warn(dev, "cannot get %s mbox\n", name);
>>   			ddata->mb[i].chan = NULL;
>>   		}
>>   	}
>> +
>> +	return 0;
>> +
>> +err_probe:
>> +	for (j = i - 1; j >= 0; j--)
>> +		if (ddata->mb[j].chan)
>> +			mbox_free_channel(ddata->mb[j].chan);
> Do you need to set ddata->mb[i].chan to NULL as it is done in
> stm32_rproc_free_mbox?

This is probably useless : when we hit this error, we exit the probe 
function without any need to track the channels status. Later when the 
probe deferral triggers the probe call again, rproc_alloc() is called 
and zero-allocates the private data (=channels, ...)

The assignment to NULL in stm32_rproc_free_mbox is probably useless too, 
but I prefer to not clean it up now.


>
> Also I'm wondering about the error path for this function.  If something goes
> wrong in mbox_request_channel_byname() none of the previously allocated channels
> are freed and no further actions is taken.  Should we simply abort the probing
> of the rproc if any of channels can't be probed?

The mailboxes are optional (specified as DT optional properties) so we 
shall not break on mbox_request_channel() errors.


>
> Regardless of the above and without surprise:
>
> Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thank you :)
>
>> +	return -EPROBE_DEFER;
>>   }
>>   
>>   static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>> @@ -596,7 +607,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
