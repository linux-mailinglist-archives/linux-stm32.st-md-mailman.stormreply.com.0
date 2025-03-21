Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B394A6B966
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Mar 2025 12:02:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D2D1C78037;
	Fri, 21 Mar 2025 11:02:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A6EEC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Mar 2025 11:02:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0417F1063;
 Fri, 21 Mar 2025 04:02:12 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52A943F673;
 Fri, 21 Mar 2025 04:02:03 -0700 (PDT)
Message-ID: <3bbf8aee-7b84-405a-8a3f-648c74196c2c@arm.com>
Date: Fri, 21 Mar 2025 11:02:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-1-d3145c153820@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-1-d3145c153820@linaro.org>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/7] coresight: Convert tag clear
 function to take a struct cs_access
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

On 20/03/2025 14:34, James Clark wrote:
> The self hosted claim tag will be reset on device probe in a later
> commit. We'll want to do this before coresight_register() is called so
> won't have a coresight_device and have to use cs_access instead.
> 
> Also make them public and create locked and unlocked versions for
> later use.
> 
> These look functions look like they set the whole tags register as one
> value, but they only set and clear the self hosted bit using a SET/CLR
> bits mechanism so also rename the functions to reflect this better.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++--------
>   include/linux/coresight.h                    |  3 ++-
>   2 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..8471aefeac76 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -144,19 +144,30 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>   	return coresight_read_claim_tags(csdev) != 0;
>   }
>   
> -static inline void coresight_set_claim_tags(struct coresight_device *csdev)
> +static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)

nit: For consistency, this should be renamed to _unlocked ?

Rest looks fine to me

Suzuki


>   {
>   	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
>   				     CORESIGHT_CLAIMSET);
>   	isb();
>   }
>   
> -static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
> +void coresight_clear_self_claim_tag(struct csdev_access *csa)
>   {
> -	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
> +	if (csa->io_mem)
> +		CS_UNLOCK(csa->base);
> +	coresight_clear_self_claim_tag_unlocked(csa);
> +	if (csa->io_mem)
> +		CS_LOCK(csa->base);
> +}
> +EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
> +
> +void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
> +{
> +	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
>   				     CORESIGHT_CLAIMCLR);
>   	isb();
>   }
> +EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
>   
>   /*
>    * coresight_claim_device_unlocked : Claim the device for self-hosted usage
> @@ -176,11 +187,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
>   	if (coresight_is_claimed_any(csdev))
>   		return -EBUSY;
>   
> -	coresight_set_claim_tags(csdev);
> +	coresight_set_self_claim_tag(csdev);
>   	if (coresight_is_claimed_self_hosted(csdev))
>   		return 0;
> -	/* There was a race setting the tags, clean up and fail */
> -	coresight_clear_claim_tags(csdev);
> +	/* There was a race setting the tag, clean up and fail */
> +	coresight_clear_self_claim_tag_unlocked(&csdev->access);
>   	return -EBUSY;
>   }
>   EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
> @@ -201,7 +212,7 @@ int coresight_claim_device(struct coresight_device *csdev)
>   EXPORT_SYMBOL_GPL(coresight_claim_device);
>   
>   /*
> - * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
> + * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
>    * Called with CS_UNLOCKed for the component.
>    */
>   void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
> @@ -211,7 +222,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>   		return;
>   
>   	if (coresight_is_claimed_self_hosted(csdev))
> -		coresight_clear_claim_tags(csdev);
> +		coresight_clear_self_claim_tag_unlocked(&csdev->access);
>   	else
>   		/*
>   		 * The external agent may have not honoured our claim
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..00134a80d358 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -685,7 +685,8 @@ extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
>   
>   extern int coresight_claim_device(struct coresight_device *csdev);
>   extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
> -
> +void coresight_clear_self_claim_tag(struct csdev_access *csa);
> +void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
>   extern void coresight_disclaim_device(struct coresight_device *csdev);
>   extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
>   extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
