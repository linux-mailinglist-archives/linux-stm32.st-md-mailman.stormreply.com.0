Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BB851334
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 13:13:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A21BC6B45B;
	Mon, 12 Feb 2024 12:13:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5AAFC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 12:13:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A3EADA7;
 Mon, 12 Feb 2024 04:13:44 -0800 (PST)
Received: from [10.57.47.180] (unknown [10.57.47.180])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ED6F3F7BD;
 Mon, 12 Feb 2024 04:13:01 -0800 (PST)
Message-ID: <44597c9a-79bd-40f8-87a7-b53582132583@arm.com>
Date: Mon, 12 Feb 2024 12:13:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240123054608.1790189-1-anshuman.khandual@arm.com>
 <20240123054608.1790189-4-anshuman.khandual@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240123054608.1790189-4-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 03/11] coresight: tmc: Extract device
 properties from AMBA pid based table lookup
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 23/01/2024 05:46, Anshuman Khandual wrote:
> This extracts device properties from AMBA pid based table lookup. This also
> defers tmc_etr_setup_caps() after the coresight device has been initialized
> so that PID value can be read.
> 
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   .../hwtracing/coresight/coresight-tmc-core.c  | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 7ec5365e2b64..e71db3099a29 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -370,16 +370,24 @@ static inline bool tmc_etr_has_non_secure_access(struct tmc_drvdata *drvdata)
>   	return (auth & TMC_AUTH_NSID_MASK) == 0x3;
>   }
>   
> +#define TMC_AMBA_MASK 0xfffff
> +
> +static const struct amba_id tmc_ids[];
> +
>   /* Detect and initialise the capabilities of a TMC ETR */
> -static int tmc_etr_setup_caps(struct device *parent, u32 devid, void *dev_caps)
> +static int tmc_etr_setup_caps(struct device *parent, u32 devid)
>   {
>   	int rc;
> -	u32 dma_mask = 0;
> +	u32 tmc_pid, dma_mask = 0;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(parent);
> +	void *dev_caps;
>   
>   	if (!tmc_etr_has_non_secure_access(drvdata))
>   		return -EACCES;
>   
> +	tmc_pid = coresight_get_pid(&drvdata->csdev->access) & TMC_AMBA_MASK;
> +	dev_caps = coresight_get_uci_data_from_amba(tmc_ids, tmc_pid);
> +
>   	/* Set the unadvertised capabilities */
>   	tmc_etr_init_caps(drvdata, (u32)(unsigned long)dev_caps);
>   
> @@ -497,10 +505,6 @@ static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
>   		desc.type = CORESIGHT_DEV_TYPE_SINK;
>   		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
>   		desc.ops = &tmc_etr_cs_ops;
> -		ret = tmc_etr_setup_caps(dev, devid,
> -					 coresight_get_uci_data(id));
> -		if (ret)
> -			goto out;
>   		idr_init(&drvdata->idr);
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = &etr_devs;
> @@ -539,6 +543,9 @@ static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
>   		goto out;
>   	}
>   
> +	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR)
> +		ret = tmc_etr_setup_caps(dev, devid);
> +

With this change, we silently accept an ETR that may only have "SECURE" 
access only and crash later while we try to enable tracing. You could
pass in the "access" (which is already in 'desc.access' in the original
call site and deal with it ?

Suzuki



>   	drvdata->miscdev.name = desc.name;
>   	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
>   	drvdata->miscdev.fops = &tmc_fops;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
