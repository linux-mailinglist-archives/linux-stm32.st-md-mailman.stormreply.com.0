Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A473AA6B14
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 08:56:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA259C78018;
	Fri,  2 May 2025 06:56:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B848CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 06:56:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6661D106F;
 Thu,  1 May 2025 23:56:22 -0700 (PDT)
Received: from [10.163.80.122] (unknown [10.163.80.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 313E53F5A1;
 Thu,  1 May 2025 23:56:25 -0700 (PDT)
Message-ID: <2b39dd04-9b3a-4b50-99d5-e3a45cc3f374@arm.com>
Date: Fri, 2 May 2025 12:26:22 +0530
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
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-9-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423151726.372561-9-leo.yan@arm.com>
Subject: Re: [Linux-stm32] [PATCH v2 8/9] coresight: Make clock sequence
	consistent
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



On 4/23/25 20:47, Leo Yan wrote:
> Since atclk is enabled after pclk during the probe phase, this commit
> maintains the same sequence for the runtime resume flow.

which is also the exact opposite of the suspend flow as expected.

> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
>  drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
>  drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 173fee3aaa6e..62e5125c37ad 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -296,11 +296,11 @@ static int funnel_runtime_resume(struct device *dev)
>  {
>  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 7250a2174145..56b03e6d8336 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -334,11 +334,11 @@ static int replicator_runtime_resume(struct device *dev)
>  {
>  	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 89e90e7f54de..f17986edac00 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -969,11 +969,11 @@ static int stm_runtime_resume(struct device *dev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index b3d0db0e53b9..4701b34778bd 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -218,11 +218,11 @@ static int tpiu_runtime_resume(struct device *dev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif

These also matches the clock initialization sequence during probe()
via the new helper coresight_get_enable_clocks().

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
