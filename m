Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA12A686CA
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 09:30:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADAFCC78F62;
	Wed, 19 Mar 2025 08:30:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC9CC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 08:30:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97ED8FEC;
 Wed, 19 Mar 2025 01:31:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1CC13F694;
 Wed, 19 Mar 2025 01:30:54 -0700 (PDT)
Date: Wed, 19 Mar 2025 08:30:53 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250319083053.GE2860028@e132581.arm.com>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-5-e9c8a9cde84e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318-james-coresight-claim-tags-v2-5-e9c8a9cde84e@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 5/8] coresight: etm3x: Convert raw base
 pointer to struct coresight access
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

On Tue, Mar 18, 2025 at 04:21:59PM +0000, James Clark wrote:
> This is so that etm3x can use the new claim tag functions which take a
> csa pointer in a later commit.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm.h        |  6 ++---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 27 +++++++++++-----------
>  .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  8 +++----
>  3 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> index 171f1384f7c0..1d753cca2943 100644
> --- a/drivers/hwtracing/coresight/coresight-etm.h
> +++ b/drivers/hwtracing/coresight/coresight-etm.h
> @@ -229,7 +229,7 @@ struct etm_config {
>   * @config:	structure holding configuration parameters.
>   */
>  struct etm_drvdata {
> -	void __iomem			*base;
> +	struct csdev_access		csa;
>  	struct clk			*atclk;
>  	struct coresight_device		*csdev;
>  	spinlock_t			spinlock;
> @@ -260,7 +260,7 @@ static inline void etm_writel(struct etm_drvdata *drvdata,
>  				"invalid CP14 access to ETM reg: %#x", off);
>  		}
>  	} else {
> -		writel_relaxed(val, drvdata->base + off);
> +		writel_relaxed(val, drvdata->csa.base + off);
>  	}
>  }
>  
> @@ -274,7 +274,7 @@ static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
>  				"invalid CP14 access to ETM reg: %#x", off);
>  		}
>  	} else {
> -		val = readl_relaxed(drvdata->base + off);
> +		val = readl_relaxed(drvdata->csa.base + off);
>  	}
>  
>  	return val;
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 8927bfaf3af2..cfd463ac715c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -86,9 +86,9 @@ static void etm_set_pwrup(struct etm_drvdata *drvdata)
>  {
>  	u32 etmpdcr;
>  
> -	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
> +	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
>  	etmpdcr |= ETMPDCR_PWD_UP;
> -	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
> +	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
>  	/* Ensure pwrup completes before subsequent cp14 accesses */
>  	mb();
>  	isb();
> @@ -101,9 +101,9 @@ static void etm_clr_pwrup(struct etm_drvdata *drvdata)
>  	/* Ensure pending cp14 accesses complete before clearing pwrup */
>  	mb();
>  	isb();
> -	etmpdcr = readl_relaxed(drvdata->base + ETMPDCR);
> +	etmpdcr = readl_relaxed(drvdata->csa.base + ETMPDCR);
>  	etmpdcr &= ~ETMPDCR_PWD_UP;
> -	writel_relaxed(etmpdcr, drvdata->base + ETMPDCR);
> +	writel_relaxed(etmpdcr, drvdata->csa.base + ETMPDCR);
>  }
>  
>  /**
> @@ -365,7 +365,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>  	struct etm_config *config = &drvdata->config;
>  	struct coresight_device *csdev = drvdata->csdev;
>  
> -	CS_UNLOCK(drvdata->base);
> +	CS_UNLOCK(drvdata->csa.base);
>  
>  	rc = coresight_claim_device_unlocked(csdev);
>  	if (rc)
> @@ -427,7 +427,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
>  	etm_clr_prog(drvdata);
>  
>  done:
> -	CS_LOCK(drvdata->base);
> +	CS_LOCK(drvdata->csa.base);
>  
>  	dev_dbg(&drvdata->csdev->dev, "cpu: %d enable smp call done: %d\n",
>  		drvdata->cpu, rc);
> @@ -549,7 +549,7 @@ static void etm_disable_hw(void *info)
>  	struct etm_config *config = &drvdata->config;
>  	struct coresight_device *csdev = drvdata->csdev;
>  
> -	CS_UNLOCK(drvdata->base);
> +	CS_UNLOCK(drvdata->csa.base);
>  	etm_set_prog(drvdata);
>  
>  	/* Read back sequencer and counters for post trace analysis */
> @@ -561,7 +561,7 @@ static void etm_disable_hw(void *info)
>  	etm_set_pwrdwn(drvdata);
>  	coresight_disclaim_device_unlocked(csdev);
>  
> -	CS_LOCK(drvdata->base);
> +	CS_LOCK(drvdata->csa.base);
>  
>  	dev_dbg(&drvdata->csdev->dev,
>  		"cpu: %d disable smp call done\n", drvdata->cpu);
> @@ -574,7 +574,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
>  	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
>  		return;
>  
> -	CS_UNLOCK(drvdata->base);
> +	CS_UNLOCK(drvdata->csa.base);
>  
>  	/* Setting the prog bit disables tracing immediately */
>  	etm_set_prog(drvdata);
> @@ -586,7 +586,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
>  	etm_set_pwrdwn(drvdata);
>  	coresight_disclaim_device_unlocked(csdev);
>  
> -	CS_LOCK(drvdata->base);
> +	CS_LOCK(drvdata->csa.base);
>  
>  	/*
>  	 * perf will release trace ids when _free_aux()
> @@ -733,7 +733,7 @@ static void etm_init_arch_data(void *info)
>  	/* Make sure all registers are accessible */
>  	etm_os_unlock(drvdata);
>  
> -	CS_UNLOCK(drvdata->base);
> +	CS_UNLOCK(drvdata->csa.base);
>  
>  	/* First dummy read */
>  	(void)etm_readl(drvdata, ETMPDSR);
> @@ -766,7 +766,7 @@ static void etm_init_arch_data(void *info)
>  
>  	etm_set_pwrdwn(drvdata);
>  	etm_clr_pwrup(drvdata);
> -	CS_LOCK(drvdata->base);
> +	CS_LOCK(drvdata->csa.base);
>  }
>  
>  static int __init etm_hp_setup(void)
> @@ -827,8 +827,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	drvdata->base = base;
> -	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	desc.access = drvdata->csa = CSDEV_ACCESS_IOMEM(base);
>  
>  	spin_lock_init(&drvdata->spinlock);
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index b9006451f515..762109307b86 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -50,11 +50,11 @@ static ssize_t etmsr_show(struct device *dev,
>  
>  	pm_runtime_get_sync(dev->parent);
>  	spin_lock_irqsave(&drvdata->spinlock, flags);
> -	CS_UNLOCK(drvdata->base);
> +	CS_UNLOCK(drvdata->csa.base);
>  
>  	val = etm_readl(drvdata, ETMSR);
>  
> -	CS_LOCK(drvdata->base);
> +	CS_LOCK(drvdata->csa.base);
>  	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>  	pm_runtime_put(dev->parent);
>  
> @@ -949,9 +949,9 @@ static ssize_t seq_curr_state_show(struct device *dev,
>  	pm_runtime_get_sync(dev->parent);
>  	spin_lock_irqsave(&drvdata->spinlock, flags);
>  
> -	CS_UNLOCK(drvdata->base);
> +	CS_UNLOCK(drvdata->csa.base);
>  	val = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
> -	CS_LOCK(drvdata->base);
> +	CS_LOCK(drvdata->csa.base);
>  
>  	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>  	pm_runtime_put(dev->parent);
> 
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
