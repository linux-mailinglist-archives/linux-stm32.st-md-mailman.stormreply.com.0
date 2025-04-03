Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30490A79BA9
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 08:02:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C04AFC7803D;
	Thu,  3 Apr 2025 06:02:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78238C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 06:02:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45803106F;
 Wed,  2 Apr 2025 23:02:17 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 417283F59E;
 Wed,  2 Apr 2025 23:02:09 -0700 (PDT)
Message-ID: <e36c9a12-bfd3-469d-b619-a90229311635@arm.com>
Date: Thu, 3 Apr 2025 11:32:05 +0530
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
 <20250327113803.1452108-3-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-3-leo.yan@arm.com>
Subject: Re: [Linux-stm32] [PATCH v1 2/9] coresight: catu: Support atclk
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
> The atclk is an optional clock for the CoreSight CATU, but the driver
> misses to initialize it.
> 
> This change enables atclk in probe of the CATU driver, and dynamically
> control the clock during suspend and resume.
> 
> The checks for driver data and clocks in suspend and resume are not
> needed, remove them.  Add error handling in the resume function.
> 
> Fixes: fcacb5c154ba ("coresight: Introduce support for Coresight Address Translation Unit")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 22 +++++++++++++++++-----
>  drivers/hwtracing/coresight/coresight-catu.h |  1 +
>  2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..9fcda5e49253 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -513,6 +513,10 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  	struct coresight_platform_data *pdata = NULL;
>  	void __iomem *base;
>  
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
> +
>  	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
>  	if (!catu_desc.name)
>  		return -ENOMEM;
> @@ -659,18 +663,26 @@ static int catu_runtime_suspend(struct device *dev)
>  {
>  	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
> +
>  	return 0;
>  }
>  
>  static int catu_runtime_resume(struct device *dev)
>  {
>  	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..2fe31fed6cf1 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -62,6 +62,7 @@
>  
>  struct catu_drvdata {
>  	struct clk *pclk;
> +	struct clk *atclk;
>  	void __iomem *base;
>  	struct coresight_device *csdev;
>  	int irq;

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
