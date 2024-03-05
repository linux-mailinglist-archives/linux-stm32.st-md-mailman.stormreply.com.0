Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554087218C
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Mar 2024 15:36:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B341FC6DD69;
	Tue,  5 Mar 2024 14:36:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01AA6C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 14:36:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F22AC1FB;
 Tue,  5 Mar 2024 06:37:13 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2177B3F73F;
 Tue,  5 Mar 2024 06:36:34 -0800 (PST)
Message-ID: <921173d2-c996-4a0f-b3a5-b660036fa254@arm.com>
Date: Tue, 5 Mar 2024 14:36:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240222082142.3663983-1-anshuman.khandual@arm.com>
 <20240222082142.3663983-4-anshuman.khandual@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240222082142.3663983-4-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V5 03/11] coresight: tmc: Extract device
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

On 22/02/2024 08:21, Anshuman Khandual wrote:
> This extracts device properties from AMBA pid based table lookup. But first
> this modifies tmc_etr_setup_caps() to accept csdev access.
> 
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: James Clark <james.clark@arm.com>

minor nit: Since there were significant changes from what James 
previously reviewed, it is a good idea to drop his Reviewed-by:

Otherwise, the changes look good to me.

Suzuki

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V5:
> 
> - Modified tmc_etr_setup_caps() to accept struct csdev_access argument
> - Reverted back tmc_etr_setup_caps() call site position in tmc_probe()
> - Dropped custom mask TMC_AMBA_MASK
> 
>   drivers/hwtracing/coresight/coresight-tmc-core.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 7ec5365e2b64..43874fa4def0 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -370,16 +370,23 @@ static inline bool tmc_etr_has_non_secure_access(struct tmc_drvdata *drvdata)
>   	return (auth & TMC_AUTH_NSID_MASK) == 0x3;
>   }
>   
> +static const struct amba_id tmc_ids[];
> +
>   /* Detect and initialise the capabilities of a TMC ETR */
> -static int tmc_etr_setup_caps(struct device *parent, u32 devid, void *dev_caps)
> +static int tmc_etr_setup_caps(struct device *parent, u32 devid,
> +			      struct csdev_access *access)
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
> +	tmc_pid = coresight_get_pid(access);
> +	dev_caps = coresight_get_uci_data_from_amba(tmc_ids, tmc_pid);
> +
>   	/* Set the unadvertised capabilities */
>   	tmc_etr_init_caps(drvdata, (u32)(unsigned long)dev_caps);
>   
> @@ -497,8 +504,7 @@ static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
>   		desc.type = CORESIGHT_DEV_TYPE_SINK;
>   		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
>   		desc.ops = &tmc_etr_cs_ops;
> -		ret = tmc_etr_setup_caps(dev, devid,
> -					 coresight_get_uci_data(id));
> +		ret = tmc_etr_setup_caps(dev, devid, &desc.access);
>   		if (ret)
>   			goto out;
>   		idr_init(&drvdata->idr);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
