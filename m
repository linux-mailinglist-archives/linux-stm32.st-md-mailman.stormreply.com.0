Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9AA5FAB2
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 17:04:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A093C78F83;
	Thu, 13 Mar 2025 16:04:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B879BC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 16:04:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418A1150C;
 Thu, 13 Mar 2025 09:04:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 855B93F673;
 Thu, 13 Mar 2025 09:04:13 -0700 (PDT)
Date: Thu, 13 Mar 2025 16:04:09 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250313160409.GS9682@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-6-james.clark@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211103945.967495-6-james.clark@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 5/7] coresight: Clear self hosted claim
	tag on probe
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

On Tue, Feb 11, 2025 at 10:39:41AM +0000, James Clark wrote:
> 
> This can be left behind from a crashed kernel after a kexec so clear it
> when probing each device. Similarly to
> coresight_disclaim_device_unlocked(), only clear it if it's already set
> to avoid races with an external debugger.
> 
> We need a csdev_access struct in etm_init_arch_data() so just replace
> the iomem pointer with a full csdev_access struct. This means all usages
> need to be updated to go through csa->base.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c  |  1 +
>  drivers/hwtracing/coresight/coresight-core.c  | 48 +++++++++++++++----
>  .../hwtracing/coresight/coresight-cti-core.c  |  2 +
>  drivers/hwtracing/coresight/coresight-etb10.c |  2 +
>  drivers/hwtracing/coresight/coresight-etm.h   |  6 +--
>  .../coresight/coresight-etm3x-core.c          | 28 +++++------
>  .../coresight/coresight-etm3x-sysfs.c         |  8 ++--
>  .../coresight/coresight-etm4x-core.c          |  2 +
>  .../hwtracing/coresight/coresight-funnel.c    |  2 +
>  .../coresight/coresight-replicator.c          |  1 +
>  .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
>  include/linux/coresight.h                     |  3 ++
>  12 files changed, 73 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index d9259c0b6e64..575c2d247a90 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>         catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>         catu_desc.ops = &catu_ops;
> 
> +       coresight_reset_claim(&catu_desc.access);
>         drvdata->csdev = coresight_register(&catu_desc);
>         if (IS_ERR(drvdata->csdev))
>                 ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 7fe5d5d432c4..97f33ffad05e 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -212,20 +212,48 @@ int coresight_claim_device(struct coresight_device *csdev)
>  EXPORT_SYMBOL_GPL(coresight_claim_device);
> 
>  /*
> - * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
> + * Clear the claim tag for the device.
> + * Returns an error if the device wasn't already claimed.
> + */
> +int coresight_reset_claim(struct csdev_access *csa)
> +{
> +       int ret;
> +
> +       CS_UNLOCK(csa->base);
> +       ret = coresight_reset_claim_unlocked(csa);
> +       CS_LOCK(csa->base);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(coresight_reset_claim);

Maybe my question is overlapping with Mike's comment.

Callers never check the return values from coresight_reset_claim(). I am
wandering if coresight_reset_claim() can directly call
coresight_clear_self_claim_tag() for _trying_ to clear self-host tag in
probe phase. Any self claim tag issues will be deferred to detect until
enable the component.

For consistent, we might rename coresight_reset_claim() to
coresight_reset_self_claim_tag(), which acquires CS lock and clear
self claim tag.

> +/*
> + * Clear the claim tag for the device. Called with CS_UNLOCKed for the component.
> + * Returns an error if the device wasn't already claimed.
> + */
> +int coresight_reset_claim_unlocked(struct csdev_access *csa)
> +{
> +       if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED) {
> +               coresight_clear_self_claim_tag(csa);
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_reset_claim_unlocked);
> +
> +/*
> + * coresight_disclaim_device_unlocked : Clear the claim tag for the device
> + * and warn if the device wasn't already claimed.
>   * Called with CS_UNLOCKed for the component.
>   */
>  void coresight_disclaim_device_unlocked(struct csdev_access *csa)
>  {
> -       if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
> -               coresight_clear_self_claim_tag(csa);
> -       else
> -               /*
> -                * The external agent may have not honoured our claim
> -                * and has manipulated it. Or something else has seriously
> -                * gone wrong in our driver.
> -                */
> -               WARN_ON_ONCE(1);
> +       /*
> +        * Warn if the external agent hasn't honoured our claim
> +        * and has manipulated it. Or something else has seriously
> +        * gone wrong in our driver.
> +        */
> +       WARN_ON_ONCE(coresight_reset_claim_unlocked(csa));
>  }
>  EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 073f67a41af9..389a72362f0c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         cti_desc.ops = &cti_ops;
>         cti_desc.groups = drvdata->ctidev.con_groups;
>         cti_desc.dev = dev;
> +
> +       coresight_reset_claim(&cti_desc.access);
>         drvdata->csdev = coresight_register(&cti_desc);
>         if (IS_ERR(drvdata->csdev)) {
>                 ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index d8bc3e776c88..b598b2c0c9bb 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>         desc.pdata = pdata;
>         desc.dev = dev;
>         desc.groups = coresight_etb_groups;
> +
> +       coresight_reset_claim(&desc.access);
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
>                 return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> index e02c3ea972c9..a89736309c27 100644
> --- a/drivers/hwtracing/coresight/coresight-etm.h
> +++ b/drivers/hwtracing/coresight/coresight-etm.h
> @@ -229,7 +229,7 @@ struct etm_config {
>   * @config:    structure holding configuration parameters.
>   */
>  struct etm_drvdata {
> -       void __iomem                    *base;
> +       struct csdev_access             csa;

I would like to extract the change for using `csdev_access` in the
ETMv3 driver into a new patch, which is irrelevant to reset self claim
tags and would significantly reduce the complexity in this patch.

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
