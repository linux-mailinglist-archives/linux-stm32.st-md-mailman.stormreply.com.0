Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E27AF86D1DF
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Feb 2024 19:17:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93F89C6C83D;
	Thu, 29 Feb 2024 18:17:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A657BC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 18:17:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41THNXqn021497; Thu, 29 Feb 2024 19:17:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=zxYgXpzGYYTOQBqsUdFoxdHmkz5QZQFIXUF2RO1KJJo=; b=EB
 L6aSs6FuqIoR1n4E/xxLQJr9nBaWPdMbEbhWuPHy85GB3ANQvHkjiRyXGTNFFIyD
 +h30kJMSGOD0yLUwia9gBXhc7P18pM2jVhrYdmYEtJk4NkU1xjyk1QzKBtQQiw0S
 kxA8atR9HKlFkhyMc7v46shcJlYMNy22D6H9/ipaPVNKcg+C2Tjabbd82kfp4zwS
 ps/HmiHLnBYeDsb24I/ZvosGkADmjSIcpDe8ZOjPa/j3DCDkmMaL4Bv4d3K/Pt3s
 neuG85VRtN4xrwm6moK3UDjSkldsVHL17bFiAjU7D6qD+MV/0BZ6WuBeKO8dyCv6
 hQ3t41J5Ip1bCmWjmpxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4bkxs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Feb 2024 19:17:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C160E40046;
 Thu, 29 Feb 2024 19:17:00 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0AEEE2A470D;
 Thu, 29 Feb 2024 19:16:11 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 29 Feb
 2024 19:16:10 +0100
Received: from [10.201.21.20] (10.201.21.20) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 29 Feb
 2024 19:16:10 +0100
Message-ID: <429d5df5-ab41-408b-a50a-2388f2efc92b@foss.st.com>
Date: Thu, 29 Feb 2024 19:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <20240214172127.1022199-8-arnaud.pouliquen@foss.st.com>
 <ZdeaUGpWlqGOG31u@p14s> <609373ba-c81d-4aee-81cb-8628e2c6897b@foss.st.com>
 <Zdjl6Z2ktTwi+oWp@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <Zdjl6Z2ktTwi+oWp@p14s>
X-Originating-IP: [10.201.21.20]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_04,2024-02-29_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 7/7] remoteproc: stm32: Add support of
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



On 2/23/24 19:37, Mathieu Poirier wrote:
> On Fri, Feb 23, 2024 at 02:54:13PM +0100, Arnaud POULIQUEN wrote:
>> Hello Mathieu,
>>
>> On 2/22/24 20:02, Mathieu Poirier wrote:
>>> Hi,
>>>
>>> On Wed, Feb 14, 2024 at 06:21:27PM +0100, Arnaud Pouliquen wrote:
>>>> The new TEE remoteproc device is used to manage remote firmware in a
>>>> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
>>>> introduced to delegate the loading of the firmware to the trusted
>>>> execution context. In such cases, the firmware should be signed and
>>>> adhere to the image format defined by the TEE.
>>>>
>>>> A new "to_attach" field is introduced to differentiate the use cases
>>>> "firmware loaded by the boot stage" and "firmware loaded by the TEE".
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>> V2 to V3 update:
>>>> - remove stm32_rproc_tee_elf_sanity_check(), stm32_rproc_tee_elf_load()
>>>>   stm32_rproc_tee_elf_find_loaded_rsc_table() and  stm32_rproc_tee_start() that are bnow unused
>>>> - use new rproc::alt_boot field to sepcify that the alternate fboot method is used
>>>> - use stm32_rproc::to_attach field to differenciate attch mode from remoteproc tee boot mode.
>>>> - remove the used of stm32_rproc::fw_loaded
>>>> ---
>>>>  drivers/remoteproc/stm32_rproc.c | 85 +++++++++++++++++++++++++++++---
>>>>  1 file changed, 79 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>>> index fcc0001e2657..9cfcf66462e0 100644
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
>>>> +#define STM32_MP1_M4_PROC_ID    0
>>>> +
>>>>  struct stm32_syscon {
>>>>  	struct regmap *map;
>>>>  	u32 reg;
>>>> @@ -90,6 +94,8 @@ struct stm32_rproc {
>>>>  	struct stm32_mbox mb[MBOX_NB_MBX];
>>>>  	struct workqueue_struct *workqueue;
>>>>  	bool hold_boot_smc;
>>>> +	bool to_attach;
>>>> +	struct tee_rproc *trproc;
>>>>  	void __iomem *rsc_va;
>>>>  };
>>>>  
>>>> @@ -253,10 +259,30 @@ static int stm32_rproc_release(struct rproc *rproc)
>>>>  			return err;
>>>>  		}
>>>>  	}
>>>> +	ddata->to_attach = false;
>>>>  
>>>>  	return err;
>>>>  }
>>>>  
>>>> +static int stm32_rproc_tee_attach(struct rproc *rproc)
>>>> +{
>>>> +	/* Nothing to do, remote proc already started by the secured context. */
>>>> +	return 0;
>>>> +}
>>>> +
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
>>>> @@ -637,10 +663,14 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>>>>  {
>>>>  	struct stm32_rproc *ddata = rproc->priv;
>>>>  	struct device *dev = rproc->dev.parent;
>>>> +	struct tee_rproc *trproc = ddata->trproc;
>>>>  	phys_addr_t rsc_pa;
>>>>  	u32 rsc_da;
>>>>  	int err;
>>>>  
>>>> +	if (trproc && !ddata->to_attach)
>>>> +		return tee_rproc_get_loaded_rsc_table(rproc, table_sz);
>>>> +
>>>
>>> Why do we need a flag at all?  Why can't st_rproc_tee_ops::get_loaded_rsc_table
>>> be set to tee_rproc_get_loaded_rsc_table()?
>>
>>
>> This function is used to retrieve the address of the resource table in 3 cases
>> - attach to a firmware started by the boot loader (U-boot).
>> - load of the firmware by OP-TEE.
>> - crash recovery on a signed firmware started by the boot loader.
>>
>> The flag is used to differentiate the attch from the other uses cases
>> For instance we support this use case.
>> 1) attach to the firmware on boot
>> 2) crash during runtime
>>   2a) stop the firmware by OP-TEE( ddata->to_attach set to 0)
>>   2b) load the firmware by OP-TEE
>>   2c) get the loaded resource table from OP-TEE (we can not guaranty
>>       that the firmware loaded on recovery is the same)
>>   2d) restart the firmware by OP-TEE
> 
> This is not maintainable and needs to be broken down into smaller
> building blocks.  The introduction of tee_rproc_parse_fw() should help dealing
> with some of the complexity.

The use cases I mentioned are supported by the legacy, if firmware is not
authenticated by a Trusted Application.
No problem to addressed this in a second step.
I will remove this constrain from this series in next version.

Regards,
Arnaud

> 
>>
>>>
>>>>  	/* The resource table has already been mapped, nothing to do */
>>>>  	if (ddata->rsc_va)
>>>>  		goto done;
>>>> @@ -693,8 +723,20 @@ static const struct rproc_ops st_rproc_ops = {
>>>>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>>>>  };
>>>>  
>>>> +static const struct rproc_ops st_rproc_tee_ops = {
>>>> +	.prepare	= stm32_rproc_prepare,
>>>> +	.start		= tee_rproc_start,
>>>> +	.stop		= stm32_rproc_tee_stop,
>>>> +	.attach		= stm32_rproc_tee_attach,
>>>> +	.kick		= stm32_rproc_kick,
>>>> +	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
>>>> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
>>>> +	.load		= tee_rproc_load_fw,
>>>> +};
>>>> +
>>>>  static const struct of_device_id stm32_rproc_match[] = {
>>>> -	{ .compatible = "st,stm32mp1-m4" },
>>>> +	{.compatible = "st,stm32mp1-m4",},
>>>> +	{.compatible = "st,stm32mp1-m4-tee",},
>>>>  	{},
>>>>  };
>>>>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
>>>> @@ -853,6 +895,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>>>  	struct device *dev = &pdev->dev;
>>>>  	struct stm32_rproc *ddata;
>>>>  	struct device_node *np = dev->of_node;
>>>> +	struct tee_rproc *trproc = NULL;
>>>>  	struct rproc *rproc;
>>>>  	unsigned int state;
>>>>  	int ret;
>>>> @@ -861,12 +904,33 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>>>> -	if (!rproc)
>>>> -		return -ENOMEM;
>>>
>>> This patch doesn't apply to rproc-next - please rebase.
>>
>> Yes, sure. I forgot to mention in my cover letter that my series has been
>> applied and tested on 841c35169323 (Linux 6.8-rc4).
>>
>>>
>>>
>>>> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
>>>> +		/*
>>>> +		 * Delegate the firmware management to the secure context.
>>>> +		 * The firmware loaded has to be signed.
>>>> +		 */
>>>> +		trproc = tee_rproc_register(dev, STM32_MP1_M4_PROC_ID);
>>>> +		if (IS_ERR(trproc)) {
>>>> +			dev_err_probe(dev, PTR_ERR(trproc),
>>>> +				      "signed firmware not supported by TEE\n");
>>>> +			return PTR_ERR(trproc);
>>>> +		}
>>>> +	}
>>>>  
>>>> -	ddata = rproc->priv;
>>>> +	rproc = rproc_alloc(dev, np->name,
>>>> +			    trproc ? &st_rproc_tee_ops : &st_rproc_ops,
>>>> +			    NULL, sizeof(*ddata));
>>>> +	if (!rproc) {
>>>> +		ret = -ENOMEM;
>>>> +		goto free_tee;
>>>> +	}
>>>>  
>>>> +	ddata = rproc->priv;
>>>> +	ddata->trproc = trproc;
>>>
>>> My opinion hasn't changed from the previous patchet, i.e tee_rproc should be
>>> folded in struct rproc as rproc::tee_interface.
>>
>> Sure, I will do it in next version
>>
>>>
>>> More comments to come shortly...
>>>
>>
>> Thanks!
>> Arnaud
>>
>>>> +	if (trproc) {
>>>> +		rproc->alt_boot = true;
>>>> +		trproc->rproc = rproc;
>>>> +	}
>>>>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>>>>  
>>>>  	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
>>>> @@ -881,8 +945,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		goto free_rproc;
>>>>  
>>>> -	if (state == M4_STATE_CRUN)
>>>> +	if (state == M4_STATE_CRUN) {
>>>>  		rproc->state = RPROC_DETACHED;
>>>> +		ddata->to_attach = true;
>>>> +	}
>>>>  
>>>>  	rproc->has_iommu = false;
>>>>  	ddata->workqueue = create_workqueue(dev_name(dev));
>>>> @@ -916,6 +982,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>>>  		device_init_wakeup(dev, false);
>>>>  	}
>>>>  	rproc_free(rproc);
>>>> +free_tee:
>>>> +	if (trproc)
>>>> +		tee_rproc_unregister(trproc);
>>>> +
>>>>  	return ret;
>>>>  }
>>>>  
>>>> @@ -923,6 +993,7 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>>>>  {
>>>>  	struct rproc *rproc = platform_get_drvdata(pdev);
>>>>  	struct stm32_rproc *ddata = rproc->priv;
>>>> +	struct tee_rproc *trproc = ddata->trproc;
>>>>  	struct device *dev = &pdev->dev;
>>>>  
>>>>  	if (atomic_read(&rproc->power) > 0)
>>>> @@ -937,6 +1008,8 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>>>>  		device_init_wakeup(dev, false);
>>>>  	}
>>>>  	rproc_free(rproc);
>>>> +	if (trproc)
>>>> +		tee_rproc_unregister(trproc);
>>>>  }
>>>>  
>>>>  static int stm32_rproc_suspend(struct device *dev)
>>>> -- 
>>>> 2.25.1
>>>>
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
