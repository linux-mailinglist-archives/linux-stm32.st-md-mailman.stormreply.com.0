Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10E3AFE7D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 09:56:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6864C57B53;
	Tue, 22 Jun 2021 07:56:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16617C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 07:56:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M7pj4e000519; Tue, 22 Jun 2021 09:56:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=M4vQq6o9guP9Q2iNescGvhgawySCsF/5dy9COFyDUPE=;
 b=gEBIZhnvF3Bowm0xCrUnMpkiKeH9Kwsdw9ku9Yzfiu/Itln+KPswMRP8pTyFwBMH9nGC
 GyOfzpoevJa/HBy96GkYGIb7gvww7UW6jkoZ3P8l/v9abj3/NTMPoaXA0SCRjUMWJVDr
 UQuD5hYt49ssKupgCEmK49vb2YhJfG7/stet1LeRg53EX1NYvF+qtIXTbNMgTjTjWGLw
 aoVTmSLw9Y0UbltiDuf/M4MbfMp/ypbLj0zyBDMTSlslZDyIxGta09gzzjtaxS5E2VEW
 xM18ZKE/78h27yUDE+4/hCZV04bfti2OluDq2M5fQZ/h88I01u6BB4sTWL2SsPcliKMO Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39b871s9v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 09:56:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 54F57100038;
 Tue, 22 Jun 2021 09:56:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 447D521514B;
 Tue, 22 Jun 2021 09:56:21 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Jun
 2021 09:56:20 +0200
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
 <YLBi/JZ0u8394tI8@builder.lan>
 <b563f831-3876-1d5d-7268-ce1260363906@foss.st.com>
Message-ID: <e112e4a3-d5c1-caff-8ef9-cbd5b21ea3a1@foss.st.com>
Date: Tue, 22 Jun 2021 09:56:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b563f831-3876-1d5d-7268-ce1260363906@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_04:2021-06-21,
 2021-06-22 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: fix mbox_send_message
	call
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

Hello Bjorn

On 5/28/21 10:03 AM, Arnaud POULIQUEN wrote:
> Hello Bjorn,
> 
> On 5/28/21 5:26 AM, Bjorn Andersson wrote:
>> On Tue 20 Apr 04:19 CDT 2021, Arnaud Pouliquen wrote:
>>
>>> mbox_send_message is called by passing a local dummy message or
>>> a function parameter. As the message is queued, it is dereferenced.
>>> This works because the message field is not used by the stm32 ipcc
>>> driver, but it is not clean.
>>>
>>> Fix by passing a constant string in all cases.
>>>
>>> The associated comments are removed because rproc should not have to
>>> deal with the behavior of the mailbox frame.
>>>
>>
>> Didn't we conclude that the mailbox driver doesn't actually dereference
>> the pointer being passed?
> 
> Right it can store the reference to queue the sent.
> 
>>
>> If so I would prefer that you just pass NULL, so that if you in the
>> future need to pass some actual data it will be easy to distinguish the
>> old and new case.
> 
> I can not use NULL pointer in stm32_rproc_attach and stm32_rproc_detach case.
> The reason is that the tx_done callback is not called if the message is NULL.
> (https://elixir.bootlin.com/linux/latest/source/drivers/mailbox/mailbox.c#L106)
> 
> I could use NULL pointer in stm32_rproc_kick, but I would prefer to use the same way
> of calling mbox_send_message for all use cases and not take into account the
> mailbox internal behavior.

Do you still have any concern about this patch?

Thanks,
Arnaud

> 
> Thanks,
> Arnaud
> 
> 
>>
>> Regards,
>> Bjorn
>>
>>> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>> ---
>>>  drivers/remoteproc/stm32_rproc.c | 14 +++++---------
>>>  1 file changed, 5 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>> index 7353f9e7e7af..0e8203a432ab 100644
>>> --- a/drivers/remoteproc/stm32_rproc.c
>>> +++ b/drivers/remoteproc/stm32_rproc.c
>>> @@ -474,14 +474,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
>>>  static int stm32_rproc_detach(struct rproc *rproc)
>>>  {
>>>  	struct stm32_rproc *ddata = rproc->priv;
>>> -	int err, dummy_data, idx;
>>> +	int err, idx;
>>>  
>>>  	/* Inform the remote processor of the detach */
>>>  	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
>>>  	if (idx >= 0 && ddata->mb[idx].chan) {
>>> -		/* A dummy data is sent to allow to block on transmit */
>>> -		err = mbox_send_message(ddata->mb[idx].chan,
>>> -					&dummy_data);
>>> +		err = mbox_send_message(ddata->mb[idx].chan, "stop");
>>>  		if (err < 0)
>>>  			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
>>>  	}
>>> @@ -493,15 +491,13 @@ static int stm32_rproc_detach(struct rproc *rproc)
>>>  static int stm32_rproc_stop(struct rproc *rproc)
>>>  {
>>>  	struct stm32_rproc *ddata = rproc->priv;
>>> -	int err, dummy_data, idx;
>>> +	int err, idx;
>>>  
>>>  	/* request shutdown of the remote processor */
>>>  	if (rproc->state != RPROC_OFFLINE) {
>>>  		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
>>>  		if (idx >= 0 && ddata->mb[idx].chan) {
>>> -			/* a dummy data is sent to allow to block on transmit */
>>> -			err = mbox_send_message(ddata->mb[idx].chan,
>>> -						&dummy_data);
>>> +			err = mbox_send_message(ddata->mb[idx].chan, "detach");
>>>  			if (err < 0)
>>>  				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
>>>  		}
>>> @@ -556,7 +552,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>>>  			continue;
>>>  		if (!ddata->mb[i].chan)
>>>  			return;
>>> -		err = mbox_send_message(ddata->mb[i].chan, (void *)(long)vqid);
>>> +		err = mbox_send_message(ddata->mb[i].chan, "kick");
>>>  		if (err < 0)
>>>  			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
>>>  				__func__, ddata->mb[i].name, err);
>>> -- 
>>> 2.17.1
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
