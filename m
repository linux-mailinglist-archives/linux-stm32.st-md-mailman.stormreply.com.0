Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD1891756
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Mar 2024 12:00:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14B6DC7128A;
	Fri, 29 Mar 2024 11:00:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8772C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 11:00:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42T9NTUO030660; Fri, 29 Mar 2024 12:00:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=yW9ygMcH8Q2q/hBUVPFHL+2UVIYTS0ysSvlOONPsfXI=; b=dd
 L9EXHawC8K0POVSRi64vdWj+3w2p9MQUYLdql+VPHFSKded0mYEgmaXx2rdLd6Gp
 Zod7eaufyK6rXz6dRSNXwQvDB5KKgAqCImW3GBAz/m1mPA8YytTZo/ipgMRwLcO4
 317UjtdCKpIX9zcuO/9onqsmt1o/w4iBdj7xJvtuu5E0OcXLYhcWjZD8Gdb/Vl3i
 lhPR4TH2B0lvS8kmWKyIVOt3dlrw7RSIsgwj7ZS3YKF00BClJkM7zA5+cEP5TlTj
 9iY+GnTC3W7v1lwVUCEgy22XcBv7ITNytQSPUjSSBK4FsTM1995hGbkmL3MTQxM3
 TO9PLa9nMAms3yHFW/+w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x1qa3q33b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 12:00:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE0104002D;
 Fri, 29 Mar 2024 11:58:35 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE8F6215BC8;
 Fri, 29 Mar 2024 11:57:46 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Mar
 2024 11:57:46 +0100
Received: from [10.201.21.20] (10.201.21.20) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Mar
 2024 11:57:45 +0100
Message-ID: <2cd23e93-1a3a-4128-b947-35fe2b04ccab@foss.st.com>
Date: Fri, 29 Mar 2024 11:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20240308144708.62362-1-arnaud.pouliquen@foss.st.com>
 <20240308144708.62362-5-arnaud.pouliquen@foss.st.com> <ZgGrnkcebcIQQic6@p14s>
 <a08add21-b8ff-434a-9689-6af8b05b1965@foss.st.com> <ZgRT7PtzIogAWc50@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZgRT7PtzIogAWc50@p14s>
X-Originating-IP: [10.201.21.20]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_11,2024-03-28_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/4] remoteproc: stm32: Add support of
 an OP-TEE TA to load the firmware
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



On 3/27/24 18:14, Mathieu Poirier wrote:
> On Tue, Mar 26, 2024 at 08:31:33PM +0100, Arnaud POULIQUEN wrote:
>>
>>
>> On 3/25/24 17:51, Mathieu Poirier wrote:
>>> On Fri, Mar 08, 2024 at 03:47:08PM +0100, Arnaud Pouliquen wrote:
>>>> The new TEE remoteproc device is used to manage remote firmware in a
>>>> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
>>>> introduced to delegate the loading of the firmware to the trusted
>>>> execution context. In such cases, the firmware should be signed and
>>>> adhere to the image format defined by the TEE.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>> Updates from V3:
>>>> - remove support of the attach use case. Will be addressed in a separate
>>>>   thread,
>>>> - add st_rproc_tee_ops::parse_fw ops,
>>>> - inverse call of devm_rproc_alloc()and tee_rproc_register() to manage cross
>>>>   reference between the rproc struct and the tee_rproc struct in tee_rproc.c.
>>>> ---
>>>>  drivers/remoteproc/stm32_rproc.c | 60 +++++++++++++++++++++++++++++---
>>>>  1 file changed, 56 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>>> index 8cd838df4e92..13df33c78aa2 100644
>>>> --- a/drivers/remoteproc/stm32_rproc.c
>>>> +++ b/drivers/remoteproc/stm32_rproc.c
>>>> @@ -20,6 +20,7 @@
>>>>  #include <linux/remoteproc.h>
>>>>  #include <linux/reset.h>
>>>>  #include <linux/slab.h>
>>>> +#include <linux/tee_remoteproc.h>
>>>>  #include <linux/workqueue.h>
>>>>  
>>>>  #include "remoteproc_internal.h"
>>>> @@ -49,6 +50,9 @@
>>>>  #define M4_STATE_STANDBY	4
>>>>  #define M4_STATE_CRASH		5
>>>>  
>>>> +/* Remote processor unique identifier aligned with the Trusted Execution Environment definitions */
>>>
>>> Why is this the case?  At least from the kernel side it is possible to call
>>> tee_rproc_register() with any kind of value, why is there a need to be any
>>> kind of alignment with the TEE?
>>
>>
>> The use of the proc_id is to identify a processor in case of multi co-processors.
>>
> 
> That is well understood.
> 
>> For instance we can have a system with A DSP and a modem. We would use the same
>> TEE service, but
> 
> That too.
> 
>> the TEE driver will probably be different, same for the signature key.
> 
> What TEE driver are we talking about here?

In OP-TEE remoteproc frameork is divided in 2 or  3 layers:

- the remoteproc Trusted Application (TA) [1] which is platform agnostic
- The remoteproc Pseudo Trusted Application (PTA) [2] which is platform
dependent and can rely on the proc ID to retrieve the context.
- the remoteproc driver (optional for some platforms) [3], which is in charge
 of DT parsing and platform configuration.

Here TEE driver can be interpreted by remote PTA and/or platform driver.

[1]
https://elixir.bootlin.com/op-tee/latest/source/ta/remoteproc/src/remoteproc_core.c
[2]
https://elixir.bootlin.com/op-tee/latest/source/core/pta/stm32mp/remoteproc_pta.c
[3]
https://elixir.bootlin.com/op-tee/latest/source/core/drivers/remoteproc/stm32_remoteproc.c

> 
>> In such case the proc ID allows to identify the the processor you want to address.
>>
> 
> That too is well understood, but there is no alignment needed with the TEE, i.e
> the TEE application is not expecting a value of '0'.  We could set
> STM32_MP1_M4_PROC_ID to 0xDEADBEEF and things would work.  This driver won't go
> anywhere for as long as it is not the case.


Here I suppose that you do not challenge the rproc_ID use in general, but for
the stm32mp1 platform as we have only one remote processor. I'm right?

In OP-TEE the check is done here:
https://elixir.bootlin.com/op-tee/latest/source/core/drivers/remoteproc/stm32_remoteproc.c#L64

If driver does not register the proc ID an error is returned indicating that the
feature is not supported.

In case of stm32mp1 yes we could consider it as useless as we have only one
remote proc.

Nevertheless I can not guaranty that a customer will not add an external
companion processor that uses OP-TEE to authenticate the associated firmware. As
the trusted Application is the unique entry point. he will need the proc_id to
identify the target at PTA level.

So from my point of view having a proc ID on stm32MP1 (and on stm32mp2 that will
reuse same driver) aligned between Linux and OP-TEE is useful.

That said using a TEE_REMOTEPROC_DEFAULT_ID is something that could be
more generic (for linux and OP-TEE). This ID could be reuse in the stm32mp
driver and platform drivers with an unique internal remote processor.

It that solution would be ok for you?

Regards,
Arnaud


> 
>>
>>>
>>>> +#define STM32_MP1_M4_PROC_ID    0
>>>> +
>>>>  struct stm32_syscon {
>>>>  	struct regmap *map;
>>>>  	u32 reg;
>>>> @@ -257,6 +261,19 @@ static int stm32_rproc_release(struct rproc *rproc)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int stm32_rproc_tee_stop(struct rproc *rproc)
>>>> +{
>>>> +	int err;
>>>> +
>>>> +	stm32_rproc_request_shutdown(rproc);
>>>> +
>>>> +	err = tee_rproc_stop(rproc);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	return stm32_rproc_release(rproc);
>>>> +}
>>>> +
>>>>  static int stm32_rproc_prepare(struct rproc *rproc)
>>>>  {
>>>>  	struct device *dev = rproc->dev.parent;
>>>> @@ -693,8 +710,19 @@ static const struct rproc_ops st_rproc_ops = {
>>>>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>>>>  };
>>>>  
>>>> +static const struct rproc_ops st_rproc_tee_ops = {
>>>> +	.prepare	= stm32_rproc_prepare,
>>>> +	.start		= tee_rproc_start,
>>>> +	.stop		= stm32_rproc_tee_stop,
>>>> +	.kick		= stm32_rproc_kick,
>>>> +	.load		= tee_rproc_load_fw,
>>>> +	.parse_fw	= tee_rproc_parse_fw,
>>>> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
>>>> +};
>>>> +
>>>>  static const struct of_device_id stm32_rproc_match[] = {
>>>> -	{ .compatible = "st,stm32mp1-m4" },
>>>> +	{.compatible = "st,stm32mp1-m4",},
>>>> +	{.compatible = "st,stm32mp1-m4-tee",},
>>>>  	{},
>>>>  };
>>>>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
>>>> @@ -853,6 +881,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>>>  	struct device *dev = &pdev->dev;
>>>>  	struct stm32_rproc *ddata;
>>>>  	struct device_node *np = dev->of_node;
>>>> +	struct tee_rproc *trproc = NULL;
>>>>  	struct rproc *rproc;
>>>>  	unsigned int state;
>>>>  	int ret;
>>>> @@ -861,9 +890,26 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> -	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>>>> -	if (!rproc)
>>>> -		return -ENOMEM;
>>>> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
>>>> +		/*
>>>> +		 * Delegate the firmware management to the secure context.
>>>> +		 * The firmware loaded has to be signed.
>>>> +		 */
>>>> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
>>>> +		if (!rproc)
>>>> +			return -ENOMEM;
>>>> +
>>>> +		trproc = tee_rproc_register(dev, rproc, STM32_MP1_M4_PROC_ID);
>>>> +		if (IS_ERR(trproc)) {
>>>> +			dev_err_probe(dev, PTR_ERR(trproc),
>>>> +				      "signed firmware not supported by TEE\n");
>>>> +			return PTR_ERR(trproc);
>>>> +		}
>>>> +	} else {
>>>> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>>>> +		if (!rproc)
>>>> +			return -ENOMEM;
>>>> +	}
>>>>  
>>>>  	ddata = rproc->priv;
>>>>  
>>>> @@ -915,6 +961,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>>>  		dev_pm_clear_wake_irq(dev);
>>>>  		device_init_wakeup(dev, false);
>>>>  	}
>>>> +	if (trproc)
>>>
>>>         if (rproc->tee_interface)
>>>
>>>
>>> I am done reviewing this set.
>>
>> Thank for your review!
>> Arnaud
>>
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +		tee_rproc_unregister(trproc);
>>>> +
>>>>  	return ret;
>>>>  }
>>>>  
>>>> @@ -935,6 +984,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>>>>  		dev_pm_clear_wake_irq(dev);
>>>>  		device_init_wakeup(dev, false);
>>>>  	}
>>>> +	if (rproc->tee_interface)
>>>> +		tee_rproc_unregister(rproc->tee_interface);
>>>> +
>>>>  }
>>>>  
>>>>  static int stm32_rproc_suspend(struct device *dev)
>>>> -- 
>>>> 2.25.1
>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
