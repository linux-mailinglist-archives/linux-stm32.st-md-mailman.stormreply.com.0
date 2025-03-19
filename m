Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0240A68C40
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 13:00:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73C85C78F60;
	Wed, 19 Mar 2025 12:00:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9733C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 12:00:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C7D5113E;
 Wed, 19 Mar 2025 05:00:16 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0F3B3F694;
 Wed, 19 Mar 2025 05:00:06 -0700 (PDT)
Message-ID: <cc68d43f-4719-4f57-a38c-fb5afe8d29cc@arm.com>
Date: Wed, 19 Mar 2025 12:00:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/8] coresight: Convert tag clear
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

On 18/03/2025 16:21, James Clark wrote:
> The self hosted claim tag will be reset on device probe in a later
> commit. We'll want to do this before coresight_register() is called so
> won't have a coresight_device and have to use cs_access instead.
> 
> Also make them public and create locked and unlocked versions for
> later use.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

minor nit:

The restructuring looks a bit confusing. Could we start with :

coresight_{set,clear}_self_claim_tag_unlocked in Patch 1. Rather
than rename what we renamed in patch 1 again here.


> ---
>   drivers/hwtracing/coresight/coresight-core.c | 17 +++++++++++++----
>   include/linux/coresight.h                    |  3 ++-
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 3f1c996d668a..9ff601e2415a 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -151,12 +151,21 @@ static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
>   	isb();
>   }
>   
> -static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
> +void coresight_clear_self_claim_tag(struct csdev_access *csa)
>   {
> -	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
> +	CS_UNLOCK(csa->base);

This looks to be hard coding MMIO based access ? Should we abstract it 
based on the csdev_access_** ?


Suzuki


> +	coresight_clear_self_claim_tag_unlocked(csa);
> +	CS_LOCK(csa->base);
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
> @@ -180,7 +189,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
>   	if (coresight_is_claimed_self_hosted(csdev))
>   		return 0;
>   	/* There was a race setting the tag, clean up and fail */
> -	coresight_clear_self_claim_tag(csdev);
> +	coresight_clear_self_claim_tag_unlocked(&csdev->access);
>   	return -EBUSY;
>   }
>   EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
> @@ -211,7 +220,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>   		return;
>   
>   	if (coresight_is_claimed_self_hosted(csdev))
> -		coresight_clear_self_claim_tag(csdev);
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
