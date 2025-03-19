Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD535A686C3
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 09:27:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E0D5C78F62;
	Wed, 19 Mar 2025 08:27:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6D08C78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 08:27:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7635312FC;
 Wed, 19 Mar 2025 01:27:25 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFABE3F694;
 Wed, 19 Mar 2025 01:27:16 -0700 (PDT)
Date: Wed, 19 Mar 2025 08:27:15 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250319082715.GD2860028@e132581.arm.com>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-4-e9c8a9cde84e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318-james-coresight-claim-tags-v2-4-e9c8a9cde84e@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/8] coresight: Add claim tag warnings
 and debug messages
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

On Tue, Mar 18, 2025 at 04:21:58PM +0000, James Clark wrote:
> Add a dev_dbg() message so that external debugger conflicts are more
> visible. There are multiple reasons for -EBUSY so a message for this
> particular one could be helpful. Add errors for and enumerate all the
> other cases that are impossible.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
>  drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
>  2 files changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index e39043a9551f..5f08845faf0d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -135,16 +135,6 @@ static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
>  			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
>  }
>  
> -static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
> -{
> -	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
> -}
> -
> -static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
> -{
> -	return coresight_read_claim_tags(csdev) != 0;
> -}
> -
>  static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
>  {
>  	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
> @@ -180,18 +170,41 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
>   */
>  int coresight_claim_device_unlocked(struct coresight_device *csdev)
>  {
> +	int tag;
> +	struct csdev_access *csa;
> +
>  	if (WARN_ON(!csdev))
>  		return -EINVAL;
>  
> -	if (coresight_is_claimed_any(csdev))
> +	csa = &csdev->access;
> +	tag = coresight_read_claim_tags(csdev);
> +
> +	switch (tag) {
> +	case CORESIGHT_CLAIM_FREE:
> +		coresight_set_self_claim_tag(csdev);
> +		if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
> +			return 0;
> +
> +		/* There was a race setting the tag, clean up and fail */
> +		coresight_clear_self_claim_tag_unlocked(csa);
> +		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
>  		return -EBUSY;
>  
> -	coresight_set_self_claim_tag(csdev);
> -	if (coresight_is_claimed_self_hosted(csdev))
> -		return 0;
> -	/* There was a race setting the tag, clean up and fail */
> -	coresight_clear_self_claim_tag_unlocked(&csdev->access);
> -	return -EBUSY;
> +	case CORESIGHT_CLAIM_EXTERNAL:
> +		/* External debug is an expected state, so log and report BUSY */
> +		dev_dbg(&csdev->dev, "Busy: Claimed by external debugger");
> +		return -EBUSY;
> +
> +	default:
> +	case CORESIGHT_CLAIM_SELF_HOSTED:
> +	case CORESIGHT_CLAIM_INVALID:
> +		/*
> +		 * Warn here because we clear a lingering self hosted tag
> +		 * on probe, so other tag combinations are impossible.
> +		 */
> +		dev_err_once(&csdev->dev, "Invalid claim tag state: %x", tag);
> +		return -EBUSY;
> +	}
>  }
>  EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
>  
> @@ -220,7 +233,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>  	if (WARN_ON(!csdev))
>  		return;
>  
> -	if (coresight_is_claimed_self_hosted(csdev))
> +	if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
>  		coresight_clear_self_claim_tag_unlocked(&csdev->access);
>  	else
>  		/*
> @@ -228,7 +241,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>  		 * and has manipulated it. Or something else has seriously
>  		 * gone wrong in our driver.
>  		 */
> -		WARN_ON_ONCE(1);
> +		dev_WARN_ONCE(&csdev->dev, 1, "External agent took claim tag");
>  }
>  EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
>  
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 38bb4e8b50ef..6e8cf55aee0a 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -36,7 +36,10 @@ extern const struct device_type coresight_dev_type[];
>   * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
>   */
>  #define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
> -#define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
> +#define CORESIGHT_CLAIM_FREE		0
> +#define CORESIGHT_CLAIM_EXTERNAL	1
> +#define CORESIGHT_CLAIM_SELF_HOSTED	2
> +#define CORESIGHT_CLAIM_INVALID		3
>  
>  #define TIMEOUT_US		100
>  #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
> 
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
