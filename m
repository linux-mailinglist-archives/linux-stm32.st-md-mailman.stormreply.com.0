Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FCCA6879B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 10:13:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B20C7803C;
	Wed, 19 Mar 2025 09:13:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15AACC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 09:13:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87ED812FC;
 Wed, 19 Mar 2025 02:13:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E22B13F63F;
 Wed, 19 Mar 2025 02:13:37 -0700 (PDT)
Date: Wed, 19 Mar 2025 09:13:33 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250319091333.GG2860028@e132581.arm.com>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-6-e9c8a9cde84e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318-james-coresight-claim-tags-v2-6-e9c8a9cde84e@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 6/8] coresight: Clear self hosted claim
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

On Tue, Mar 18, 2025 at 04:22:00PM +0000, James Clark wrote:
> This can be left behind from a crashed kernel after a kexec so clear it
> when probing each device. Clearing the self hosted bit even when claimed
> externally is harmless, so do it unconditionally.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Just a note from me.

I'd expect it would be a rare case that users enable a Arm CoreSight
trace in a dump-capture kernel, as the second kernel is for dumping
CoreSight trace data but it is not necessarily to enable CoreSight
components.

This patch is not only helpful for crash kernel case, it can dismiss
quirks caused by insane hardware reset cases.

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-catu.c       | 1 +
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 2 ++
>  drivers/hwtracing/coresight/coresight-etb10.c      | 2 ++
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
>  drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
>  8 files changed, 11 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..deaacfd875af 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -558,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>  	catu_desc.ops = &catu_ops;
>  
> +	coresight_clear_self_claim_tag(&catu_desc.access);
>  	drvdata->csdev = coresight_register(&catu_desc);
>  	if (IS_ERR(drvdata->csdev))
>  		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 80f6265e3740..8fb30dd73fd2 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -931,6 +931,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  	cti_desc.ops = &cti_ops;
>  	cti_desc.groups = drvdata->ctidev.con_groups;
>  	cti_desc.dev = dev;
> +
> +	coresight_clear_self_claim_tag(&cti_desc.access);
>  	drvdata->csdev = coresight_register(&cti_desc);
>  	if (IS_ERR(drvdata->csdev)) {
>  		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 7948597d483d..2bfcb669aa84 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -772,6 +772,8 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>  	desc.pdata = pdata;
>  	desc.dev = dev;
>  	desc.groups = coresight_etb_groups;
> +
> +	coresight_clear_self_claim_tag(&desc.access);
>  	drvdata->csdev = coresight_register(&desc);
>  	if (IS_ERR(drvdata->csdev))
>  		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index cfd463ac715c..1c6204e14422 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -764,6 +764,7 @@ static void etm_init_arch_data(void *info)
>  	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
>  	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
>  
> +	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
>  	etm_set_pwrdwn(drvdata);
>  	etm_clr_pwrup(drvdata);
>  	CS_LOCK(drvdata->csa.base);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..52c9aa56e8b9 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1372,6 +1372,8 @@ static void etm4_init_arch_data(void *info)
>  	drvdata->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
>  	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>  	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
> +
> +	coresight_clear_self_claim_tag_unlocked(csa);
>  	etm4_cs_lock(drvdata, csa);
>  	cpu_detect_trace_filtering(drvdata);
>  }
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0541712b2bcb..7249cc356ccb 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -255,6 +255,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  		drvdata->base = base;
>  		desc.groups = coresight_funnel_groups;
>  		desc.access = CSDEV_ACCESS_IOMEM(base);
> +		coresight_clear_self_claim_tag(&desc.access);
>  	}
>  
>  	dev_set_drvdata(dev, drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index ee7ee79f6cf7..b2acd4535c74 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -284,6 +284,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	desc.pdata = dev->platform_data;
>  	desc.dev = dev;
>  
> +	coresight_clear_self_claim_tag(&desc.access);
>  	drvdata->csdev = coresight_register(&desc);
>  	if (IS_ERR(drvdata->csdev)) {
>  		ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index a7814e8e657b..a09579eff3fd 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -869,6 +869,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  	dev->platform_data = pdata;
>  	desc.pdata = pdata;
>  
> +	coresight_clear_self_claim_tag(&desc.access);
>  	drvdata->csdev = coresight_register(&desc);
>  	if (IS_ERR(drvdata->csdev)) {
>  		ret = PTR_ERR(drvdata->csdev);
> 
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
