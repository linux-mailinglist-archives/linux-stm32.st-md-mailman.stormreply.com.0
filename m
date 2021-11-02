Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41644341D
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 17:57:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B669EC5E2C6;
	Tue,  2 Nov 2021 16:57:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4D7DC5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 16:57:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2GBcXa027700;
 Tue, 2 Nov 2021 17:56:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Cco84+3VE3T5v9x8tbKVq5wUeAloej3D5kb7+sWmIDA=;
 b=6Mb0MsR79aHQ5ZUSvM+jfTP0Q4jBdKYRBxk7fV8biwkoBpuvX888am/qkx9bTBnDM2EZ
 MwlbLxEl62DamCeTXC82jGZsINUejBqLrYlzxFIeZuL0eE3W2sq8AWNQA799DAVH/jAA
 gFJro5VUOBYkdxon4omzPFr/dIp3CMYwiUJLhwzyz3J8yxZeT+lHMoW1XDMBxxijBval
 k+ieW+txFt9d7zDaPPdjlYqWGk2g4H4Cj3IOZK3c9UikxFd96NmtNEkPXHWxiVQHRvcX
 1Lnrk1u8AlnLpCP0x5Z46gUIaKGZX4AfYDAGGNuuWEP/tjQUJHk/S7RnIeYNJPI4beRm wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30uvkru9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 17:56:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B948910002A;
 Tue,  2 Nov 2021 17:56:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACACA21AE21;
 Tue,  2 Nov 2021 17:56:52 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 17:56:52 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-7-arnaud.pouliquen@foss.st.com>
 <YYAlzvXns4Ejxa6S@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <d1352a00-bc6d-91ae-b902-622c75448e3a@foss.st.com>
Date: Tue, 2 Nov 2021 17:56:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYAlzvXns4Ejxa6S@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
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



On 11/1/21 6:37 PM, Bjorn Andersson wrote:
> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
> 
>> By providing a callback in the rpmsg_driver structure, the rpmsg devices
>> can be probed with a default endpoint created.
>>
>> In this case, it is not possible to associated to this endpoint private data
>> that could allow the driver to retrieve the context.
>>
>> This helper function allows rpmsg drivers to create a default endpoint
>> on runtime with an associated private context.
>>
>> For example, a driver might create a context structure on the probe and
>> want to provide that context as private data for the default rpmsg
>> callback.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Tested-by: Julien Massot <julien.massot@iot.bzh>
>> ---
>>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>>  include/linux/rpmsg.h      | 13 ++++++++++
>>  2 files changed, 64 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index 53162038254d..92557c49d460 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -132,6 +132,57 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>>  }
>>  EXPORT_SYMBOL(rpmsg_destroy_ept);
>>  
>> +/**
>> + * rpmsg_create_default_ept() - create a default rpmsg_endpoint for a rpmsg device
>> + * @rpdev: rpmsg channel device
>> + * @cb: rx callback handler
>> + * @priv: private data for the driver's use
>> + * @chinfo: channel_info with the local rpmsg address to bind with @cb
>> + *
>> + * On register_rpmsg_driver if no callback is provided in the rpmsg_driver structure,
>> + * no endpoint is created when the device is probed by the rpmsg bus.
>> + *
>> + * This function returns a pointer to the default endpoint if already created or creates
>> + * an endpoint and assign it as the default endpoint of the rpmsg device.
> 
> But if the driver didn't specify a callback, when would this ever
> happen?

Not sure to understand your point here...
Do you mean that something is missing in description such as:
 * On register_rpmsg_driver if no callback is provided in the rpmsg_driver
 * structure, no endpoint is created when the device is probed by the rpmsg bus.
 * The rpmsg driver can call rpmsg_create_default_ept during or after its
 * probing to register a default endpoint with an associated callback and @priv
 * context.

> 
>> + *
>> + * Drivers should provide their @rpdev channel (so the new endpoint would belong
>> + * to the same remote processor their channel belongs to), an rx callback
>> + * function, an optional private data (which is provided back when the
>> + * rx callback is invoked), and an address they want to bind with the
>> + * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
>> + * dynamically assign them an available rpmsg address (drivers should have
>> + * a very good reason why not to always use RPMSG_ADDR_ANY here).
>> + *
>> + * Returns a pointer to the endpoint on success, or NULL on error.
> 
> Correct kerneldoc is "Return: ..."

I will update this

> 
>> + */
>> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>> +						rpmsg_rx_cb_t cb, void *priv,
>> +						struct rpmsg_channel_info chinfo)
>> +{
>> +	struct rpmsg_endpoint *ept;
>> +
>> +	if (WARN_ON(!rpdev))
>> +		return NULL;
>> +
>> +	/* It does not make sense to create a default endpoint without a callback. */
>> +	if (!cb)
>> +		return NULL;
>> +
>> +	if (rpdev->ept)
>> +		return rpdev->ept;
> 
> How does the caller know if they should call rpmsg_destroy_ept() on the
> returned ept or not?

This case is probably a bug. What about replacing the condition by
if(WARN_ON(rpdev->ept))?

> 
>> +
>> +	ept = rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
>> +	if (!ept)
>> +		return NULL;
>> +
>> +	/* Assign the new endpoint as default endpoint */
>> +	rpdev->ept = ept;
>> +	rpdev->src = ept->addr;
>> +
>> +	return ept;
>> +}
>> +EXPORT_SYMBOL(rpmsg_create_default_ept);
>> +
>>  /**
>>   * rpmsg_send() - send a message across to the remote processor
>>   * @ept: the rpmsg endpoint
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index 6fe51549d931..b071ac17ff78 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
>>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
>>  					rpmsg_rx_cb_t cb, void *priv,
>>  					struct rpmsg_channel_info chinfo);
>> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> 
> Is there ever a case where someone outside drivers/rpmsg/ should call
> this function?

A rpmsg service driver could call it to generate the ns announcement after
the probe (for instance on a sysfs open).
(Please have a look to [PATCH v6 10/10] rpmsg: core: send a ns announcement when
a default endpoint is created)

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +						rpmsg_rx_cb_t cb, void *priv,
>> +						struct rpmsg_channel_info chinfo);
>>  
>>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
>> @@ -236,6 +239,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>>  	return NULL;
>>  }
>>  
>> +static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>> +							      rpmsg_rx_cb_t cb, void *priv,
>> +							      struct rpmsg_channel_info chinfo)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return NULL;
>> +}
>> +
>>  static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
>>  {
>>  	/* This shouldn't be possible */
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
