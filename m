Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1DA5F244
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 12:25:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1FA1C78F83;
	Thu, 13 Mar 2025 11:25:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 827B9C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 11:25:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1664A1F02;
 Thu, 13 Mar 2025 04:25:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48B0E3F673;
 Thu, 13 Mar 2025 04:25:01 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:24:57 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250313112457.GO9682@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-2-james.clark@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211103945.967495-2-james.clark@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/7] coresight: Rename coresight_{set,
	clear}_claim_tags()
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

On Tue, Feb 11, 2025 at 10:39:37AM +0000, James Clark wrote:
> 
> These look like they set the whole tags register as one value, but they
> only set and clear the self hosted bit using a SET/CLR bits mechanism.
> Rename the functions to reflect this better.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0a9380350fb5..523dbb381f90 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -142,14 +142,14 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>         return coresight_read_claim_tags(csdev) != 0;
>  }
> 
> -static inline void coresight_set_claim_tags(struct coresight_device *csdev)
> +static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
>  {
>         csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
>                                      CORESIGHT_CLAIMSET);
>         isb();
>  }
> 
> -static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
> +static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
>  {
>         csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
>                                      CORESIGHT_CLAIMCLR);
> @@ -174,11 +174,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
>         if (coresight_is_claimed_any(csdev))
>                 return -EBUSY;
> 
> -       coresight_set_claim_tags(csdev);
> +       coresight_set_self_claim_tag(csdev);
>         if (coresight_is_claimed_self_hosted(csdev))
>                 return 0;
> -       /* There was a race setting the tags, clean up and fail */
> -       coresight_clear_claim_tags(csdev);
> +       /* There was a race setting the tag, clean up and fail */
> +       coresight_clear_self_claim_tag(csdev);
>         return -EBUSY;
>  }
>  EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
> @@ -199,7 +199,7 @@ int coresight_claim_device(struct coresight_device *csdev)
>  EXPORT_SYMBOL_GPL(coresight_claim_device);
> 
>  /*
> - * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
> + * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
>   * Called with CS_UNLOCKed for the component.
>   */
>  void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
> @@ -209,7 +209,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>                 return;
> 
>         if (coresight_is_claimed_self_hosted(csdev))
> -               coresight_clear_claim_tags(csdev);
> +               coresight_clear_self_claim_tag(csdev);
>         else
>                 /*
>                  * The external agent may have not honoured our claim
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
