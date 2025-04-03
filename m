Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56371A79BE7
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 08:23:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07028C7803C;
	Thu,  3 Apr 2025 06:23:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD681C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 06:23:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81689106F;
 Wed,  2 Apr 2025 23:23:52 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 309253F59E;
 Wed,  2 Apr 2025 23:23:44 -0700 (PDT)
Message-ID: <e5abeb48-daf7-4d07-821e-93ef50a1d403@arm.com>
Date: Thu, 3 Apr 2025 11:53:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-4-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-4-leo.yan@arm.com>
Subject: Re: [Linux-stm32] [PATCH v1 3/9] coresight: etm4x: Support atclk
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



On 3/27/25 17:07, Leo Yan wrote:
> The atclk is an optional clock for the CoreSight ETMv4, but the driver
> misses to initialize it.
> 
> This change enables atclk in probe of the ETMv4 driver, and dynamically
> control the clock during suspend and resume.
> 
> No need to check the driver data and clock pointer in the runtime
> suspend and resume, so remove checks.  And add error handling in the
> resume function.
> 
> Add a minor fix to the comment format when adding the atclk field.
> 
> Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 20 +++++++++++++++-----
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +++-
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..537d57006a25 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2149,6 +2149,10 @@ static int etm4_probe(struct device *dev)
>  	if (WARN_ON(!drvdata))
>  		return -ENOMEM;
>  
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
> +
>  	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
>  		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
>  			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
> @@ -2397,8 +2401,8 @@ static int etm4_runtime_suspend(struct device *dev)
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
>  	return 0;
>  }
> @@ -2406,11 +2410,17 @@ static int etm4_runtime_suspend(struct device *dev)
>  static int etm4_runtime_resume(struct device *dev)
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
>  
> -	return 0;
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index bd7db36ba197..0c21832b5d69 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -919,7 +919,8 @@ struct etmv4_save_state {
>  
>  /**
>   * struct etm4_drvdata - specifics associated to an ETM component
> - * @pclk        APB clock if present, otherwise NULL
> + * @pclk:       APB clock if present, otherwise NULL
> + * @atclk:      Optional clock for the core parts of the ETMv4.
>   * @base:       Memory mapped base address for this component.
>   * @csdev:      Component vitals needed by the framework.
>   * @spinlock:   Only one at a time pls.
> @@ -987,6 +988,7 @@ struct etmv4_save_state {
>   */
>  struct etmv4_drvdata {
>  	struct clk			*pclk;
> +	struct clk			*atclk;
>  	void __iomem			*base;
>  	struct coresight_device		*csdev;
>  	raw_spinlock_t			spinlock;

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
