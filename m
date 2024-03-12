Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33976879693
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 15:42:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAEB7C6C83C;
	Tue, 12 Mar 2024 14:41:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E16C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 14:41:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2E4FEC;
 Tue, 12 Mar 2024 07:42:35 -0700 (PDT)
Received: from [10.57.50.231] (unknown [10.57.50.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E53FC3F73F;
 Tue, 12 Mar 2024 07:41:55 -0700 (PDT)
Message-ID: <2dbef82c-96a0-419f-9950-8ee4169fb634@arm.com>
Date: Tue, 12 Mar 2024 14:41:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240312102318.2285165-1-anshuman.khandual@arm.com>
 <20240312102318.2285165-7-anshuman.khandual@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240312102318.2285165-7-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V6 06/11] coresight: funnel: Move ACPI
 support from AMBA driver to platform driver
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

On 12/03/2024 10:23, Anshuman Khandual wrote:
> Add support for the dynamic funnel device in the platform driver, which can
> then be used on ACPI based platforms. This change would allow runtime power
> management for ACPI based systems.
> 
> The driver would try to enable the APB clock if available. Also, rename the
> code to reflect the fact that it now handles both static and dynamic
> funnels. But first this refactors funnel_probe() making sure it can be used
> both for platform and AMBA drivers, by moving the pm_runtime_put() to the
> callers.
> 
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: coresight@lists.linaro.org
> Tested-by: Sudeep Holla <sudeep.holla@arm.com> # Boot and driver probe only
> Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
> Reviewed-by: James Clark <james.clark@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V6:
> 
> - Added clk_disable_unprepare() for pclk in funnel_probe() error path
> - Added WARN_ON(!drvdata) check in funnel_platform_remove()
> - Added additional elements for acpi_device_id[]
> 
>   drivers/acpi/arm64/amba.c                     |  1 -
>   .../hwtracing/coresight/coresight-funnel.c    | 72 ++++++++++++-------
>   2 files changed, 48 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
> index 270f4e3819a2..afb6afb66967 100644
> --- a/drivers/acpi/arm64/amba.c
> +++ b/drivers/acpi/arm64/amba.c
> @@ -28,7 +28,6 @@ static const struct acpi_device_id amba_id_list[] = {
>   	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
>   	{"ARMHC97C", 0}, /* ARM CoreSight SoC-400 TMC, SoC-600 ETF/ETB */
>   	{"ARMHC9CA", 0}, /* ARM CoreSight CATU */
> -	{"ARMHC9FF", 0}, /* ARM CoreSight Dynamic Funnel */
>   	{"", 0},
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index ff3ea0670a5b..3b4be10a0f0c 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -36,6 +36,7 @@ DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
>    * struct funnel_drvdata - specifics associated to a funnel component
>    * @base:	memory mapped base address for this component.
>    * @atclk:	optional clock for the core parts of the funnel.
> + * @pclk:	APB clock if present, otherwise NULL
>    * @csdev:	component vitals needed by the framework.
>    * @priority:	port selection order.
>    * @spinlock:	serialize enable/disable operations.
> @@ -43,6 +44,7 @@ DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
>   struct funnel_drvdata {
>   	void __iomem		*base;
>   	struct clk		*atclk;
> +	struct clk		*pclk;
>   	struct coresight_device	*csdev;
>   	unsigned long		priority;
>   	spinlock_t		spinlock;
> @@ -236,6 +238,10 @@ static int funnel_probe(struct device *dev, struct resource *res)
>   			return ret;
>   	}
>   
> +	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> +	if (IS_ERR(drvdata->pclk))
> +		return -ENODEV;
> +
>   	/*
>   	 * Map the device base for dynamic-funnel, which has been
>   	 * validated by AMBA core.
> @@ -272,12 +278,13 @@ static int funnel_probe(struct device *dev, struct resource *res)
>   		goto out_disable_clk;
>   	}
>   
> -	pm_runtime_put(dev);
>   	ret = 0;
>   
>   out_disable_clk:
>   	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
>   		clk_disable_unprepare(drvdata->atclk);
> +	if (ret && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_disable_unprepare(drvdata->pclk);
>   	return ret;
>   }
>   
> @@ -298,6 +305,9 @@ static int funnel_runtime_suspend(struct device *dev)
>   	if (drvdata && !IS_ERR(drvdata->atclk))
>   		clk_disable_unprepare(drvdata->atclk);
>   
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_disable_unprepare(drvdata->pclk);
> +
>   	return 0;
>   }
>   
> @@ -308,6 +318,8 @@ static int funnel_runtime_resume(struct device *dev)
>   	if (drvdata && !IS_ERR(drvdata->atclk))
>   		clk_prepare_enable(drvdata->atclk);
>   
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_prepare_enable(drvdata->pclk);
>   	return 0;
>   }
>   #endif
> @@ -316,55 +328,61 @@ static const struct dev_pm_ops funnel_dev_pm_ops = {
>   	SET_RUNTIME_PM_OPS(funnel_runtime_suspend, funnel_runtime_resume, NULL)
>   };
>   
> -static int static_funnel_probe(struct platform_device *pdev)
> +static int funnel_platform_probe(struct platform_device *pdev)
>   {
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	int ret;
>   
>   	pm_runtime_get_noresume(&pdev->dev);
>   	pm_runtime_set_active(&pdev->dev);
>   	pm_runtime_enable(&pdev->dev);
>   
> -	/* Static funnel do not have programming base */
> -	ret = funnel_probe(&pdev->dev, NULL);
> -
> -	if (ret) {
> -		pm_runtime_put_noidle(&pdev->dev);
> +	ret = funnel_probe(&pdev->dev, res);
> +	pm_runtime_put(&pdev->dev);
> +	if (ret)
>   		pm_runtime_disable(&pdev->dev);
> -	}
>   
>   	return ret;
>   }
>   
> -static void static_funnel_remove(struct platform_device *pdev)
> +static void funnel_platform_remove(struct platform_device *pdev)
>   {
> +	struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +
> +	if (WARN_ON(!drvdata))
> +		return;
> +
>   	funnel_remove(&pdev->dev);
>   	pm_runtime_disable(&pdev->dev);
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

Same as the previous patch

Suzuki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
