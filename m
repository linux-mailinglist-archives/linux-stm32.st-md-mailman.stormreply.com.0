Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84E444746
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Nov 2021 18:35:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA0B0C5E2C9;
	Wed,  3 Nov 2021 17:35:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C5FBC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Nov 2021 17:35:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A3H4brs016836;
 Wed, 3 Nov 2021 18:35:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NwwJc06AJJJ8GFYgldvAefYVVwYgOsuHffpWjz0Fd7g=;
 b=UV3635N4GNPhLPolir7Bu/mxIc/mU/jbsSyYb1Cm3YKufztegC478AeBtpx/G3oV+gbq
 SLqi+jtI64MbmtabmjNlq9+p3jbZdgpYL7zKFQhDQVtCiQac0M3EG07N0T3GB9czwDl4
 qZ2lZ96DHlZ9pSgTY2VNeAnuXxPfeZQRuHvuba8XRgXdkP1g7uZvmF9jUl3mWVdm9cI4
 XOKorq5PlSpnbjpXtJrdeRc/gSyrbuzFrTCZ+3/Ys4J8wOADTkqAPLHNh2BhIATF7v+F
 CJjkDbvCf+s3LDza+5biPN/uKT1c20MBR7ppWqUgJgBABGnSErvqSLFJ+GzHQxlXZOQI 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c3xgmg4sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 18:35:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E523510002A;
 Wed,  3 Nov 2021 18:35:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3D5F2C38B9;
 Wed,  3 Nov 2021 18:35:26 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 18:35:25 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-7-arnaud.pouliquen@foss.st.com>
 <YYAlzvXns4Ejxa6S@builder.lan>
 <d1352a00-bc6d-91ae-b902-622c75448e3a@foss.st.com>
 <YYK/jiHIUh8RBvTo@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <5ba82f50-95ed-3855-3d5e-cdb4f1e28c3a@foss.st.com>
Date: Wed, 3 Nov 2021 18:35:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYK/jiHIUh8RBvTo@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_05,2021-11-03_01,2020-04-07_01
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 06/10] rpmsg: Introduce
 rpmsg_create_default_ept function
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



On 11/3/21 5:57 PM, Bjorn Andersson wrote:
> On Tue 02 Nov 11:56 CDT 2021, Arnaud POULIQUEN wrote:
> 
>>
>>
>> On 11/1/21 6:37 PM, Bjorn Andersson wrote:
>>> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
>>>
>>>> By providing a callback in the rpmsg_driver structure, the rpmsg devices
>>>> can be probed with a default endpoint created.
>>>>
>>>> In this case, it is not possible to associated to this endpoint private data
>>>> that could allow the driver to retrieve the context.
>>>>
>>>> This helper function allows rpmsg drivers to create a default endpoint
>>>> on runtime with an associated private context.
>>>>
>>>> For example, a driver might create a context structure on the probe and
>>>> want to provide that context as private data for the default rpmsg
>>>> callback.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>> Tested-by: Julien Massot <julien.massot@iot.bzh>
>>>> ---
>>>>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>>>>  include/linux/rpmsg.h      | 13 ++++++++++
>>>>  2 files changed, 64 insertions(+)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>>> index 53162038254d..92557c49d460 100644
>>>> --- a/drivers/rpmsg/rpmsg_core.c
>>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>>> @@ -132,6 +132,57 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>>>>  }
>>>>  EXPORT_SYMBOL(rpmsg_destroy_ept);
>>>>  
>>>> +/**
>>>> + * rpmsg_create_default_ept() - create a default rpmsg_endpoint for a rpmsg device
>>>> + * @rpdev: rpmsg channel device
>>>> + * @cb: rx callback handler
>>>> + * @priv: private data for the driver's use
>>>> + * @chinfo: channel_info with the local rpmsg address to bind with @cb
>>>> + *
>>>> + * On register_rpmsg_driver if no callback is provided in the rpmsg_driver structure,
>>>> + * no endpoint is created when the device is probed by the rpmsg bus.
>>>> + *
>>>> + * This function returns a pointer to the default endpoint if already created or creates
>>>> + * an endpoint and assign it as the default endpoint of the rpmsg device.
>>>
>>> But if the driver didn't specify a callback, when would this ever
>>> happen?
>>
>> Not sure to understand your point here...
>> Do you mean that something is missing in description such as:
>>  * On register_rpmsg_driver if no callback is provided in the rpmsg_driver
>>  * structure, no endpoint is created when the device is probed by the rpmsg bus.
>>  * The rpmsg driver can call rpmsg_create_default_ept during or after its
>>  * probing to register a default endpoint with an associated callback and @priv
>>  * context.
>>
> 
> I was referring specifically to the case of rpmsg_create_default_ept()
> being called on a rpmsg_device that already has a rpdev->ept.
> 
> Afaict this would either be because the driver did specify a callback or
> because the driver didn't but has already called
> rpmsg_create_default_ept().
> 
> Both cases sounds like invalid usage.
> 
>>>
>>>> + *
>>>> + * Drivers should provide their @rpdev channel (so the new endpoint would belong
>>>> + * to the same remote processor their channel belongs to), an rx callback
>>>> + * function, an optional private data (which is provided back when the
>>>> + * rx callback is invoked), and an address they want to bind with the
>>>> + * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
>>>> + * dynamically assign them an available rpmsg address (drivers should have
>>>> + * a very good reason why not to always use RPMSG_ADDR_ANY here).
>>>> + *
>>>> + * Returns a pointer to the endpoint on success, or NULL on error.
>>>
>>> Correct kerneldoc is "Return: ..."
>>
>> I will update this
>>
>>>
>>>> + */
>>>> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>>>> +						rpmsg_rx_cb_t cb, void *priv,
>>>> +						struct rpmsg_channel_info chinfo)
>>>> +{
>>>> +	struct rpmsg_endpoint *ept;
>>>> +
>>>> +	if (WARN_ON(!rpdev))
>>>> +		return NULL;
>>>> +
>>>> +	/* It does not make sense to create a default endpoint without a callback. */
>>>> +	if (!cb)
>>>> +		return NULL;
>>>> +
>>>> +	if (rpdev->ept)
>>>> +		return rpdev->ept;
>>>
>>> How does the caller know if they should call rpmsg_destroy_ept() on the
>>> returned ept or not?
>>
>> This case is probably a bug. What about replacing the condition by
>> if(WARN_ON(rpdev->ept))?
>>
> 
> Right, I don't think it will be possible for the client driver to do the
> right thing based on this logic.
> 
>>>
>>>> +
>>>> +	ept = rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
>>>> +	if (!ept)
>>>> +		return NULL;
>>>> +
>>>> +	/* Assign the new endpoint as default endpoint */
>>>> +	rpdev->ept = ept;
>>>> +	rpdev->src = ept->addr;
>>>> +
>>>> +	return ept;
>>>> +}
>>>> +EXPORT_SYMBOL(rpmsg_create_default_ept);
>>>> +
>>>>  /**
>>>>   * rpmsg_send() - send a message across to the remote processor
>>>>   * @ept: the rpmsg endpoint
>>>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>>>> index 6fe51549d931..b071ac17ff78 100644
>>>> --- a/include/linux/rpmsg.h
>>>> +++ b/include/linux/rpmsg.h
>>>> @@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
>>>>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
>>>>  					rpmsg_rx_cb_t cb, void *priv,
>>>>  					struct rpmsg_channel_info chinfo);
>>>> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>>>
>>> Is there ever a case where someone outside drivers/rpmsg/ should call
>>> this function?
>>
>> A rpmsg service driver could call it to generate the ns announcement after
>> the probe (for instance on a sysfs open).
>> (Please have a look to [PATCH v6 10/10] rpmsg: core: send a ns announcement when
>> a default endpoint is created)
>>
> 
> I'm still not convinced that it's correct to do NS only for primary
> endpoints.
> 
> In particular looking down the path where you are instantiating services
> on the Linux side; e.g. what if you want your driver to probe on some
> control channel but have the actual data flow on a separate channel
> (something I believe Loic talked about earlier).
> 
> How would the remote side know about that second endpoint if the NS
> doesn't announce it?

Right, today it is a limitation of the announcement mechanism. The service is
linked to rpmsg_dev_probe and rpmsg_dev_remove (except if the backend implements
an announcement on create_ept & destroy_ept ops).

The rpmsg_create_default_ept follows this behavior.
As result of this patch, the limitation will exist in both directions.

Another limitation is an ack of the NS announcement to provide the associated
remote address.

Extending rpmsg_ns.c to add new messages could solve these limitations, but that
would be a separate topic.

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Thanks,
>> Arnaud
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> +						rpmsg_rx_cb_t cb, void *priv,
>>>> +						struct rpmsg_channel_info chinfo);
>>>>  
>>>>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>>>>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
>>>> @@ -236,6 +239,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>>>>  	return NULL;
>>>>  }
>>>>  
>>>> +static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>>>> +							      rpmsg_rx_cb_t cb, void *priv,
>>>> +							      struct rpmsg_channel_info chinfo)
>>>> +{
>>>> +	/* This shouldn't be possible */
>>>> +	WARN_ON(1);
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
>>>>  static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
>>>>  {
>>>>  	/* This shouldn't be possible */
>>>> -- 
>>>> 2.17.1
>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
