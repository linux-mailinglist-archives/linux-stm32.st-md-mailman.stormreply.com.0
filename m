Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C16919282C5
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 09:35:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83218C78015;
	Fri,  5 Jul 2024 07:35:14 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 811F8C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 07:35:07 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46540m1U008540;
 Fri, 5 Jul 2024 09:34:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yq7L9t/ZJOJtgR9RqAjrbuNTWxexeafBeaiDR/L1Q/E=; b=bQNm8M+skz5GtENo
 cfnTHoGzM/G1ULm6W0cqY2dBJU+06ge2vISLMVLNmCJ/w3o3ylreI9jFL5lvqL9M
 96zORyaQOB+2KZoZhtnHfMVU+kSAJkDdHynql3z3kiHNyFWQFZ9g1a+nedPRTR5x
 vrGXDUQyWkQo25cMd1upz39ID6rWp24IFPPTEcfCM2Buqczf1GwSfq2cRbAvwxTk
 4K2pVQWoCpt+lz3LkjvY/iAAZrdqEG8iSarhWDBxitray4ZOe19c9qkcyWXA+GFE
 g14UyAE77UjFN2qofcyhd5K9IQRGmG2rbcRbPn9xr9nicjK7MOgVF0GphZrPyFdr
 Jdis5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 402w7jdmtt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jul 2024 09:34:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CC55140052;
 Fri,  5 Jul 2024 09:34:47 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74DB32165EC;
 Fri,  5 Jul 2024 09:33:57 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 09:33:57 +0200
Received: from [10.252.25.62] (10.252.25.62) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 09:33:56 +0200
Message-ID: <42eca58f-0851-4193-bcb8-00ba0f0d58b4@foss.st.com>
Date: Fri, 5 Jul 2024 09:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20240621143759.547793-1-arnaud.pouliquen@foss.st.com>
 <20240621143759.547793-3-arnaud.pouliquen@foss.st.com>
 <ZoQuW7lXZlYf+kEF@p14s> <97eee634-1b11-490f-9d96-f1564b022b34@foss.st.com>
 <ZoVq0Dx5VVUgKzRg@p14s> <6c075817-10c4-4787-a486-b59a5330fdb6@foss.st.com>
 <ZobAg1ftbLXFBXD5@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZobAg1ftbLXFBXD5@p14s>
X-Originating-IP: [10.252.25.62]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_04,2024-07-03_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 2/5] remoteproc: Add TEE support
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



On 7/4/24 17:32, Mathieu Poirier wrote:
> On Thu, Jul 04, 2024 at 10:05:24AM +0200, Arnaud POULIQUEN wrote:
>>
>>
>> On 7/3/24 17:14, Mathieu Poirier wrote:
>>> On Wed, Jul 03, 2024 at 09:19:44AM +0200, Arnaud POULIQUEN wrote:
>>>> Hello Mathieu
>>>>
>>>> On 7/2/24 18:44, Mathieu Poirier wrote:
>>>>> Good morning,
>>>>>
>>>>> On Fri, Jun 21, 2024 at 04:37:56PM +0200, Arnaud Pouliquen wrote:
>>>>>> Add a remoteproc TEE (Trusted Execution Environment) driver
>>>>>> that will be probed by the TEE bus. If the associated Trusted
>>>>>> application is supported on secure part this driver offers a client
>>>>>> interface to load a firmware by the secure part.
>>>>>> This firmware could be authenticated by the secure trusted application.
>>>>>>
>>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>>> ---
>>>>>> Updates vs previous version:
>>>>>> - rename tee_remoteproc.* file to rmeoteproc_tee.*,
>>>>>> - rename TEE_REMOTEPROC config to REMOTEPROC_TEE,
>>>>>> - remove "stm32" in some variable declarations,
>>>>>> - remove useless "remoteproc_internal.h" include,
>>>>>> - fix tee_rproc_ctx devm_kzalloc.
>>>>>> - rework module description
>>>>>> ---
>>>>>>  drivers/remoteproc/Kconfig          |  10 +
>>>>>>  drivers/remoteproc/Makefile         |   1 +
>>>>>>  drivers/remoteproc/remoteproc_tee.c | 446 ++++++++++++++++++++++++++++
>>>>>>  include/linux/remoteproc.h          |   4 +
>>>>>>  include/linux/remoteproc_tee.h      | 100 +++++++
>>>>>>  5 files changed, 561 insertions(+)
>>>>>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>>>>>  create mode 100644 include/linux/remoteproc_tee.h
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>>>> index 48845dc8fa85..278f197acb90 100644
>>>>>> --- a/drivers/remoteproc/Kconfig
>>>>>> +++ b/drivers/remoteproc/Kconfig
>>>>>> @@ -365,6 +365,16 @@ config XLNX_R5_REMOTEPROC
>>>>>>  
>>>>>>  	  It's safe to say N if not interested in using RPU r5f cores.
>>>>>>  
>>>>>> +
>>>>>> +config REMOTEPROC_TEE
>>>>>> +	tristate "Remoteproc support by a TEE application"
>>>>>> +	depends on OPTEE
>>>>>> +	help
>>>>>> +	  Support a remote processor with a TEE application. The Trusted
>>>>>> +	  Execution Context is responsible for loading the trusted firmware
>>>>>> +	  image and managing the remote processor's lifecycle.
>>>>>> +	  This can be either built-in or a loadable module.
>>>>>> +
>>>>>>  endif # REMOTEPROC
>>>>>>  
>>>>>>  endmenu
>>>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>>>> index 91314a9b43ce..b4eb37177005 100644
>>>>>> --- a/drivers/remoteproc/Makefile
>>>>>> +++ b/drivers/remoteproc/Makefile
>>>>>> @@ -36,6 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>>>>>>  obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>>>>>>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>>>>>>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>>>>>> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
>>>>>>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
>>>>>>  obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
>>>>>>  obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
>>>>>> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..70cb67451767
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/remoteproc/remoteproc_tee.c
>>>>>> @@ -0,0 +1,446 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> +/*
>>>>>> + * Copyright (C) STMicroelectronics 2024
>>>>>> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/firmware.h>
>>>>>> +#include <linux/io.h>
>>>>>> +#include <linux/module.h>
>>>>>> +#include <linux/remoteproc.h>
>>>>>> +#include <linux/remoteproc_tee.h>
>>>>>> +#include <linux/slab.h>
>>>>>> +#include <linux/tee_drv.h>
>>>>>> +
>>>>>> +#define MAX_TEE_PARAM_ARRY_MEMBER	4
>>>>>> +
>>>>>> +/*
>>>>>> + * Authentication of the firmware and load in the remote processor memory
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + * [in]	 params[1].memref:	buffer containing the image of the buffer
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_LOAD_FW		1
>>>>>> +
>>>>>> +/*
>>>>>> + * Start the remote processor
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_START_FW	2
>>>>>> +
>>>>>> +/*
>>>>>> + * Stop the remote processor
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_STOP_FW		3
>>>>>> +
>>>>>> +/*
>>>>>> + * Return the address of the resource table, or 0 if not found
>>>>>> + * No check is done to verify that the address returned is accessible by
>>>>>> + * the non secure context. If the resource table is loaded in a protected
>>>>>> + * memory the access by the non secure context will lead to a data abort.
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + * [out]  params[1].value.a:	32bit LSB resource table memory address
>>>>>> + * [out]  params[1].value.b:	32bit MSB resource table memory address
>>>>>> + * [out]  params[2].value.a:	32bit LSB resource table memory size
>>>>>> + * [out]  params[2].value.b:	32bit MSB resource table memory size
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
>>>>>> +
>>>>>> +/*
>>>>>> + * Return the address of the core dump
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + * [out] params[1].memref:	address of the core dump image if exist,
>>>>>> + *				else return Null
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
>>>>>> +
>>>>>> +struct tee_rproc_context {
>>>>>> +	struct list_head sessions;
>>>>>> +	struct tee_context *tee_ctx;
>>>>>> +	struct device *dev;
>>>>>> +};
>>>>>> +
>>>>>> +static struct tee_rproc_context *tee_rproc_ctx;
>>>>>> +
>>>>>> +static void tee_rproc_prepare_args(struct tee_rproc *trproc, int cmd,
>>>>>> +				   struct tee_ioctl_invoke_arg *arg,
>>>>>> +				   struct tee_param *param,
>>>>>> +				   unsigned int num_params)
>>>>>> +{
>>>>>> +	memset(arg, 0, sizeof(*arg));
>>>>>> +	memset(param, 0, MAX_TEE_PARAM_ARRY_MEMBER * sizeof(*param));
>>>>>> +
>>>>>> +	arg->func = cmd;
>>>>>> +	arg->session = trproc->session_id;
>>>>>> +	arg->num_params = num_params + 1;
>>>>>> +
>>>>>> +	param[0] = (struct tee_param) {
>>>>>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
>>>>>> +		.u.value.a = trproc->rproc_id,
>>>>>> +	};
>>>>>> +}
>>>>>> +
>>>>>> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
>>>>>> +{
>>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
>>>>>> +	struct tee_ioctl_invoke_arg arg;
>>>>>> +	struct tee_shm *fw_shm;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (!trproc)
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	fw_shm = tee_shm_register_kernel_buf(tee_rproc_ctx->tee_ctx, (void *)fw->data, fw->size);
>>>>>> +	if (IS_ERR(fw_shm))
>>>>>> +		return PTR_ERR(fw_shm);
>>>>>> +
>>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_LOAD_FW, &arg, param, 1);
>>>>>> +
>>>>>> +	/* Provide the address of the firmware image */
>>>>>> +	param[1] = (struct tee_param) {
>>>>>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>>>>>> +		.u.memref = {
>>>>>> +			.shm = fw_shm,
>>>>>> +			.size = fw->size,
>>>>>> +			.shm_offs = 0,
>>>>>> +		},
>>>>>> +	};
>>>>>> +
>>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>>>>>> +	if (ret < 0 || arg.ret != 0) {
>>>>>> +		dev_err(tee_rproc_ctx->dev,
>>>>>> +			"TA_RPROC_FW_CMD_LOAD_FW invoke failed TEE err: %x, ret:%x\n",
>>>>>> +			arg.ret, ret);
>>>>>> +		if (!ret)
>>>>>> +			ret = -EIO;
>>>>>> +	}
>>>>>> +
>>>>>> +	tee_shm_free(fw_shm);
>>>>>> +
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_load_fw);
>>>>>> +
>>>>>> +static int tee_rproc_get_loaded_rsc_table(struct rproc *rproc, phys_addr_t *rsc_pa,
>>>>>> +					  size_t *table_sz)
>>>>>> +{
>>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
>>>>>> +	struct tee_ioctl_invoke_arg arg;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_GET_RSC_TABLE, &arg, param, 2);
>>>>>> +
>>>>>> +	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
>>>>>> +	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
>>>>>> +
>>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>>>>>> +	if (ret < 0 || arg.ret != 0) {
>>>>>> +		dev_err(tee_rproc_ctx->dev,
>>>>>> +			"TA_RPROC_FW_CMD_GET_RSC_TABLE invoke failed TEE err: %x, ret:%x\n",
>>>>>> +			arg.ret, ret);
>>>>>> +		return -EIO;
>>>>>> +	}
>>>>>> +
>>>>>> +	*table_sz = param[2].u.value.a;
>>>>>> +
>>>>>> +	if (*table_sz)
>>>>>> +		*rsc_pa = param[1].u.value.a;
>>>>>> +	else
>>>>>> +		*rsc_pa  = 0;
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>>>>>> +{
>>>>>> +	phys_addr_t rsc_table;
>>>>>> +	void __iomem *rsc_va;
>>>>>> +	size_t table_sz;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	ret = tee_rproc_load_fw(rproc, fw);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>
>>>>> Do we need an API to unload the firware from memory too?  If anything fails we
>>>>> still have firmware loaded into memory.
>>>>
>>>> For the time being, the clean-up of the memory is not implemented in OP-TEE.
>>>
>>> In my opinion cleaning up the firmware image loaded to memory when something
>>> fails is important and should be part of this patchset.  Looking at the error
>>> path in this function, it is clear something is missing.
>>
>>
>> Please, could you detail what risks you see in not implementing the memory
>> clean-up at this first step?
>>
> 
> Almost everything in the Linux kernel is about allocation and release of
> resources, the pattern is ubiquitous.  Reading function tee_rproc_parse_fw(),
> the firmware is loaded by tee_rproc_load_fw() but never released - people
> reading this driver will wonder about that.  There is also the possibility that
> other implementations will use the free'd memory for other purposes.  This
> interface driver is meant to be generic and as such needs to take care of those
> corner cases.

Thank you for the clarification.
If we want to support this, handling the error here would not be sufficient. For
instance, many things can go wrong in rproc_start().

So either we do nothing, as with the ELF support, and we put a comment in the
remoteproc tee; or we may need to introduce new rproc ops to clean up/free
resources in case of errors in the remoteproc core.

Or perhaps do you have another alternative to propose?

Thanks,
Arnaud

> 
>> Currently, OP-TEE upstream does not clean the memory. Upon the next load, it
>> will either be overwritten or left unused by the newly authenticated firmware.
>>
>> If your concern is about the ability to read the code, the code is already
>> accessible in the binary firmware image on the Linux filesystem.
>>
>> As a next step a platform-dependent strategy has to be implemented to enhance
>> firmware protection:
>> - Ensure the integrity of the code.
>> - Preserve secrets.
>>
>> However, OP-TEE cannot trust the Non-secure context for this. Expecting Linux to
>> call a clean-up service does not seem reliable to me.
>>
>> In the downstream stm32mp platform, we have implemented the clean-up but above
>> all, ensured that Linux never has access to the remote processor firmware code
>> and data by using firewall configurations.
>> For time being we print a warning message on OP-TEE upstream[1]
>>
>> [1]https://elixir.bootlin.com/op-tee/latest/source/core/drivers/remoteproc/stm32_remoteproc.c#L361
>>
>>
>> Thanks,
>> Arnaud
>>
>>>
>>>> I plan to upstream this part in a second step, associated with a memory protection
>>>> strategy. This should be directly implemented in the OP-TEE service to avoid
>>>> reliance on Linux error management.
>>>> Nonetheless, an API could be added to clean the memory if needed.
>>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>>>
>>>>> More comments to come later.
>>>>>
>>>>> Mathieu
>>>>>
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * We assume here that the memory mapping is the same between the TEE and Linux kernel
>>>>>> +	 * contexts. Else a new TEE remoteproc service could be needed to get a copy of the
>>>>>> +	 * resource table
>>>>>> +	 */
>>>>>> +	rsc_va = ioremap_wc(rsc_table, table_sz);
>>>>>> +	if (IS_ERR_OR_NULL(rsc_va)) {
>>>>>> +		dev_err(tee_rproc_ctx->dev, "Unable to map memory region: %pa+%zx\n",
>>>>>> +			&rsc_table, table_sz);
>>>>>> +		return -ENOMEM;
>>>>>> +	}
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Create a copy of the resource table to have the same behavior as the elf loader.
>>>>>> +	 * This cached table will be used after the remoteproc stops to free resources, and for
>>>>>> +	 * crash recovery to reapply the settings.
>>>>>> +	 */
>>>>>> +	rproc->cached_table = kmemdup((__force void *)rsc_va, table_sz, GFP_KERNEL);
>>>>>> +	if (!rproc->cached_table) {
>>>>>> +		ret = -ENOMEM;
>>>>>> +		goto out;
>>>>>> +	}
>>>>>> +
>>>>>> +	rproc->table_ptr = rproc->cached_table;
>>>>>> +	rproc->table_sz = table_sz;
>>>>>> +
>>>>>> +out:
>>>>>> +	iounmap(rsc_va);
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_parse_fw);
>>>>>> +
>>>>>> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
>>>>>> +						       const struct firmware *fw)
>>>>>> +{
>>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
>>>>>> +	phys_addr_t rsc_table;
>>>>>> +	size_t table_sz;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (!trproc)
>>>>>> +		return ERR_PTR(-EINVAL);
>>>>>> +
>>>>>> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
>>>>>> +	if (ret)
>>>>>> +		return ERR_PTR(ret);
>>>>>> +
>>>>>> +	rproc->table_sz = table_sz;
>>>>>> +	if (!table_sz)
>>>>>> +		return NULL;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * At this step the memory area that contains the resource table should have be declared
>>>>>> +	 * in the remote proc platform driver and allocated by rproc_alloc_registered_carveouts().
>>>>>> +	 */
>>>>>> +	return (struct resource_table *)rproc_pa_to_va(rproc, rsc_table, table_sz, NULL);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_find_loaded_rsc_table);
>>>>>> +
>>>>>> +int tee_rproc_start(struct rproc *rproc)
>>>>>> +{
>>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
>>>>>> +	struct tee_ioctl_invoke_arg arg;
>>>>>> +	int ret = 0;
>>>>>> +
>>>>>> +	if (!trproc)
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_START_FW, &arg, param, 0);
>>>>>> +
>>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>>>>>> +	if (ret < 0 || arg.ret != 0) {
>>>>>> +		dev_err(tee_rproc_ctx->dev,
>>>>>> +			"TA_RPROC_FW_CMD_START_FW invoke failed TEE err: %x, ret:%x\n",
>>>>>> +			arg.ret, ret);
>>>>>> +		if (!ret)
>>>>>> +			return  -EIO;
>>>>>> +	}
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_start);
>>>>>> +
>>>>>> +int tee_rproc_stop(struct rproc *rproc)
>>>>>> +{
>>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
>>>>>> +	struct tee_ioctl_invoke_arg arg;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (!trproc)
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
>>>>>> +
>>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>>>>>> +	if (ret < 0 || arg.ret != 0) {
>>>>>> +		dev_err(tee_rproc_ctx->dev,
>>>>>> +			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
>>>>>> +			arg.ret, ret);
>>>>>> +		if (!ret)
>>>>>> +			ret = -EIO;
>>>>>> +	}
>>>>>> +
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_stop);
>>>>>> +
>>>>>> +static const struct tee_client_device_id tee_rproc_id_table[] = {
>>>>>> +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
>>>>>> +	{}
>>>>>> +};
>>>>>> +
>>>>>> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
>>>>>> +{
>>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>>>>>> +	struct tee_ioctl_open_session_arg sess_arg;
>>>>>> +	struct tee_client_device *tee_device;
>>>>>> +	struct tee_rproc *trproc, *p_err;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Test if the device has been probed by the TEE bus. In case of failure, we ignore the
>>>>>> +	 * reason. The bus could be not yet probed or the service not available in the secure
>>>>>> +	 * firmware.The assumption in such a case is that the TEE remoteproc is not probed.
>>>>>> +	 */
>>>>>> +	if (!tee_rproc_ctx)
>>>>>> +		return ERR_PTR(-EPROBE_DEFER);
>>>>>> +
>>>>>> +	/* Prevent tee rproc module from being removed */
>>>>>> +	if (!try_module_get(THIS_MODULE)) {
>>>>>> +		dev_err(tee_rproc_ctx->dev, "can't get owner\n");
>>>>>> +		return ERR_PTR(-ENODEV);
>>>>>> +	}
>>>>>> +
>>>>>> +	trproc =  devm_kzalloc(dev, sizeof(*trproc), GFP_KERNEL);
>>>>>> +	if (!trproc) {
>>>>>> +		p_err = ERR_PTR(-ENOMEM);
>>>>>> +		goto module_put;
>>>>>> +	}
>>>>>> +	tee_device = to_tee_client_device(tee_rproc_ctx->dev);
>>>>>> +	memset(&sess_arg, 0, sizeof(sess_arg));
>>>>>> +
>>>>>> +	memcpy(sess_arg.uuid, tee_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
>>>>>> +
>>>>>> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
>>>>>> +	sess_arg.num_params = 1;
>>>>>> +
>>>>>> +	param[0] = (struct tee_param) {
>>>>>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
>>>>>> +		.u.value.a = rproc_id,
>>>>>> +	};
>>>>>> +
>>>>>> +	ret = tee_client_open_session(tee_rproc_ctx->tee_ctx, &sess_arg, param);
>>>>>> +	if (ret < 0 || sess_arg.ret != 0) {
>>>>>> +		dev_err(dev, "tee_client_open_session failed, err: %x\n", sess_arg.ret);
>>>>>> +		p_err = ERR_PTR(-EINVAL);
>>>>>> +		goto module_put;
>>>>>> +	}
>>>>>> +
>>>>>> +	trproc->parent = dev;
>>>>>> +	trproc->rproc_id = rproc_id;
>>>>>> +	trproc->session_id = sess_arg.session;
>>>>>> +
>>>>>> +	trproc->rproc = rproc;
>>>>>> +	rproc->tee_interface = trproc;
>>>>>> +
>>>>>> +	list_add_tail(&trproc->node, &tee_rproc_ctx->sessions);
>>>>>> +
>>>>>> +	return trproc;
>>>>>> +
>>>>>> +module_put:
>>>>>> +	module_put(THIS_MODULE);
>>>>>> +	return p_err;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_register);
>>>>>> +
>>>>>> +int tee_rproc_unregister(struct tee_rproc *trproc)
>>>>>> +{
>>>>>> +	struct rproc *rproc = trproc->rproc;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	ret = tee_client_close_session(tee_rproc_ctx->tee_ctx, trproc->session_id);
>>>>>> +	if (ret < 0)
>>>>>> +		dev_err(trproc->parent,	"tee_client_close_session failed, err: %x\n", ret);
>>>>>> +
>>>>>> +	list_del(&trproc->node);
>>>>>> +	rproc->tee_interface = NULL;
>>>>>> +
>>>>>> +	module_put(THIS_MODULE);
>>>>>> +
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_unregister);
>>>>>> +
>>>>>> +static int tee_rproc_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>>>>>> +{
>>>>>> +	/* Today we support only the OP-TEE, could be extend to other tees */
>>>>>> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
>>>>>> +}
>>>>>> +
>>>>>> +static int tee_rproc_probe(struct device *dev)
>>>>>> +{
>>>>>> +	struct tee_context *tee_ctx;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	/* Open context with TEE driver */
>>>>>> +	tee_ctx = tee_client_open_context(NULL, tee_rproc_ctx_match, NULL, NULL);
>>>>>> +	if (IS_ERR(tee_ctx))
>>>>>> +		return PTR_ERR(tee_ctx);
>>>>>> +
>>>>>> +	tee_rproc_ctx = devm_kzalloc(dev, sizeof(*tee_rproc_ctx), GFP_KERNEL);
>>>>>> +	if (!tee_rproc_ctx) {
>>>>>> +		ret = -ENOMEM;
>>>>>> +		goto err;
>>>>>> +	}
>>>>>> +
>>>>>> +	tee_rproc_ctx->dev = dev;
>>>>>> +	tee_rproc_ctx->tee_ctx = tee_ctx;
>>>>>> +	INIT_LIST_HEAD(&tee_rproc_ctx->sessions);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +err:
>>>>>> +	tee_client_close_context(tee_ctx);
>>>>>> +
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +
>>>>>> +static int tee_rproc_remove(struct device *dev)
>>>>>> +{
>>>>>> +	struct tee_rproc *entry, *tmp;
>>>>>> +
>>>>>> +	list_for_each_entry_safe(entry, tmp, &tee_rproc_ctx->sessions, node) {
>>>>>> +		tee_client_close_session(tee_rproc_ctx->tee_ctx, entry->session_id);
>>>>>> +		list_del(&entry->node);
>>>>>> +		kfree(entry);
>>>>>> +	}
>>>>>> +
>>>>>> +	tee_client_close_context(tee_rproc_ctx->tee_ctx);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +MODULE_DEVICE_TABLE(tee, tee_rproc_id_table);
>>>>>> +
>>>>>> +static struct tee_client_driver tee_rproc_fw_driver = {
>>>>>> +	.id_table	= tee_rproc_id_table,
>>>>>> +	.driver		= {
>>>>>> +		.name		= KBUILD_MODNAME,
>>>>>> +		.bus		= &tee_bus_type,
>>>>>> +		.probe		= tee_rproc_probe,
>>>>>> +		.remove		= tee_rproc_remove,
>>>>>> +	},
>>>>>> +};
>>>>>> +
>>>>>> +static int __init tee_rproc_fw_mod_init(void)
>>>>>> +{
>>>>>> +	return driver_register(&tee_rproc_fw_driver.driver);
>>>>>> +}
>>>>>> +
>>>>>> +static void __exit tee_rproc_fw_mod_exit(void)
>>>>>> +{
>>>>>> +	driver_unregister(&tee_rproc_fw_driver.driver);
>>>>>> +}
>>>>>> +
>>>>>> +module_init(tee_rproc_fw_mod_init);
>>>>>> +module_exit(tee_rproc_fw_mod_exit);
>>>>>> +
>>>>>> +MODULE_DESCRIPTION(" remote processor support with a TEE application");
>>>>>> +MODULE_LICENSE("GPL");
>>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>>> index 8fd0d7f63c8e..fbe1d6793709 100644
>>>>>> --- a/include/linux/remoteproc.h
>>>>>> +++ b/include/linux/remoteproc.h
>>>>>> @@ -503,6 +503,8 @@ enum rproc_features {
>>>>>>  	RPROC_MAX_FEATURES,
>>>>>>  };
>>>>>>  
>>>>>> +struct tee_rproc;
>>>>>> +
>>>>>>  /**
>>>>>>   * struct rproc - represents a physical remote processor device
>>>>>>   * @node: list node of this rproc object
>>>>>> @@ -545,6 +547,7 @@ enum rproc_features {
>>>>>>   * @cdev: character device of the rproc
>>>>>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>>>>>>   * @features: indicate remoteproc features
>>>>>> + * @tee_interface: pointer to the remoteproc tee context
>>>>>>   */
>>>>>>  struct rproc {
>>>>>>  	struct list_head node;
>>>>>> @@ -586,6 +589,7 @@ struct rproc {
>>>>>>  	struct cdev cdev;
>>>>>>  	bool cdev_put_on_release;
>>>>>>  	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
>>>>>> +	struct tee_rproc *tee_interface;
>>>>>>  };
>>>>>>  
>>>>>>  /**
>>>>>> diff --git a/include/linux/remoteproc_tee.h b/include/linux/remoteproc_tee.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..ccf34a218d54
>>>>>> --- /dev/null
>>>>>> +++ b/include/linux/remoteproc_tee.h
>>>>>> @@ -0,0 +1,100 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>>> +/*
>>>>>> + * Copyright(c) 2024 STMicroelectronics
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef REMOTEPROC_TEE_H
>>>>>> +#define REMOTEPROC_TEE_H
>>>>>> +
>>>>>> +#include <linux/tee_drv.h>
>>>>>> +#include <linux/firmware.h>
>>>>>> +#include <linux/remoteproc.h>
>>>>>> +
>>>>>> +struct rproc;
>>>>>> +
>>>>>> +/**
>>>>>> + * struct tee_rproc - TEE remoteproc structure
>>>>>> + * @node:		Reference in list
>>>>>> + * @rproc:		Remoteproc reference
>>>>>> + * @parent:		Parent device
>>>>>> + * @rproc_id:		Identifier of the target firmware
>>>>>> + * @session_id:		TEE session identifier
>>>>>> + */
>>>>>> +struct tee_rproc {
>>>>>> +	struct list_head node;
>>>>>> +	struct rproc *rproc;
>>>>>> +	struct device *parent;
>>>>>> +	u32 rproc_id;
>>>>>> +	u32 session_id;
>>>>>> +};
>>>>>> +
>>>>>> +#if IS_REACHABLE(CONFIG_REMOTEPROC_TEE)
>>>>>> +
>>>>>> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
>>>>>> +				     unsigned int rproc_id);
>>>>>> +int tee_rproc_unregister(struct tee_rproc *trproc);
>>>>>> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw);
>>>>>> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw);
>>>>>> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
>>>>>> +						       const struct firmware *fw);
>>>>>> +int tee_rproc_start(struct rproc *rproc);
>>>>>> +int tee_rproc_stop(struct rproc *rproc);
>>>>>> +
>>>>>> +#else
>>>>>> +
>>>>>> +static inline struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
>>>>>> +						   unsigned int rproc_id)
>>>>>> +{
>>>>>> +	return ERR_PTR(-ENODEV);
>>>>>> +}
>>>>>> +
>>>>>> +static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>>>>>> +{
>>>>>> +	/* This shouldn't be possible */
>>>>>> +	WARN_ON(1);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static inline int tee_rproc_unregister(struct tee_rproc *trproc)
>>>>>> +{
>>>>>> +	/* This shouldn't be possible */
>>>>>> +	WARN_ON(1);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static inline int tee_rproc_load_fw(struct rproc *rproc,  const struct firmware *fw)
>>>>>> +{
>>>>>> +	/* This shouldn't be possible */
>>>>>> +	WARN_ON(1);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static inline int tee_rproc_start(struct rproc *rproc)
>>>>>> +{
>>>>>> +	/* This shouldn't be possible */
>>>>>> +	WARN_ON(1);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static inline int tee_rproc_stop(struct rproc *rproc)
>>>>>> +{
>>>>>> +	/* This shouldn't be possible */
>>>>>> +	WARN_ON(1);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static inline struct resource_table *
>>>>>> +tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
>>>>>> +{
>>>>>> +	/* This shouldn't be possible */
>>>>>> +	WARN_ON(1);
>>>>>> +
>>>>>> +	return NULL;
>>>>>> +}
>>>>>> +#endif /* CONFIG_REMOTEPROC_TEE */
>>>>>> +#endif /* REMOTEPROC_TEE_H */
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
