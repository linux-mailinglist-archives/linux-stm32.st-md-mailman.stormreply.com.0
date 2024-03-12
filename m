Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59528879914
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 17:37:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04C10C6C83C;
	Tue, 12 Mar 2024 16:37:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 502E2C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 16:37:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B41971007;
 Tue, 12 Mar 2024 09:37:48 -0700 (PDT)
Received: from [10.57.50.231] (unknown [10.57.50.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAAF33F73F;
 Tue, 12 Mar 2024 09:37:09 -0700 (PDT)
Message-ID: <6d812f7b-169c-45bd-99f6-56b993381bd4@arm.com>
Date: Tue, 12 Mar 2024 16:37:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240312102318.2285165-1-anshuman.khandual@arm.com>
 <20240312102318.2285165-9-anshuman.khandual@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240312102318.2285165-9-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V6 08/11] coresight: tpiu: Move ACPI
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
> Add support for the tpiu device in the platform driver, which can then be
> used on ACPI based platforms. This change would now allow runtime power
> management for ACPI based systems. The driver would try to enable the APB
> clock if available. But first this renames and then refactors tpiu_probe()
> and tpiu_remove(), making sure it can be used both for platform and AMBA
> drivers. This also moves pm_runtime_put() from tpiu_probe() to the callers.
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
> - Added WARN_ON(!drvdata) check in tpiu_platform_remove()
> - Added additional elements for acpi_device_id[]
> 
>   drivers/acpi/arm64/amba.c                    |   1 -
>   drivers/hwtracing/coresight/coresight-tpiu.c | 103 +++++++++++++++++--
>   2 files changed, 93 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
> index 587061b0fd2f..6d24a8f7914b 100644
> --- a/drivers/acpi/arm64/amba.c
> +++ b/drivers/acpi/arm64/amba.c
> @@ -25,7 +25,6 @@ static const struct acpi_device_id amba_id_list[] = {
>   	{"ARMHC501", 0}, /* ARM CoreSight ETR */
>   	{"ARMHC502", 0}, /* ARM CoreSight STM */
>   	{"ARMHC503", 0}, /* ARM CoreSight Debug */
> -	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
>   	{"ARMHC97C", 0}, /* ARM CoreSight SoC-400 TMC, SoC-600 ETF/ETB */
>   	{"", 0},
>   };
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 29024f880fda..4117475f8889 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -5,6 +5,8 @@
>    * Description: CoreSight Trace Port Interface Unit driver
>    */
>   
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>

nit: Please could you keep them alphabetic order (including the existing 
ones below).

>   #include <linux/atomic.h>
>   #include <linux/kernel.h>
>   #include <linux/init.h>
> @@ -52,11 +54,13 @@ DEFINE_CORESIGHT_DEVLIST(tpiu_devs, "tpiu");
>   /*
>    * @base:	memory mapped base address for this component.
>    * @atclk:	optional clock for the core parts of the TPIU.
> + * @pclk:	APB clock if present, otherwise NULL
>    * @csdev:	component vitals needed by the framework.
>    */
>   struct tpiu_drvdata {
>   	void __iomem		*base;
>   	struct clk		*atclk;
> +	struct clk		*pclk;
>   	struct coresight_device	*csdev;
>   	spinlock_t		spinlock;
>   };
> @@ -122,14 +126,12 @@ static const struct coresight_ops tpiu_cs_ops = {
>   	.sink_ops	= &tpiu_sink_ops,
>   };
>   
> -static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
> +static int __tpiu_probe(struct device *dev, struct resource *res)
>   {
>   	int ret;
>   	void __iomem *base;
> -	struct device *dev = &adev->dev;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct tpiu_drvdata *drvdata;
> -	struct resource *res = &adev->res;
>   	struct coresight_desc desc = { 0 };
>   
>   	desc.name = coresight_alloc_device_name(&tpiu_devs, dev);
> @@ -142,12 +144,16 @@ static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	spin_lock_init(&drvdata->spinlock);
>   
> -	drvdata->atclk = devm_clk_get(&adev->dev, "atclk"); /* optional */
> +	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
>   	if (!IS_ERR(drvdata->atclk)) {
>   		ret = clk_prepare_enable(drvdata->atclk);
>   		if (ret)
>   			return ret;
>   	}
> +
> +	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> +	if (IS_ERR(drvdata->pclk))
> +		return -ENODEV;
>   	dev_set_drvdata(dev, drvdata);
>   
>   	/* Validity for the resource is already checked by the AMBA core */
> @@ -173,21 +179,34 @@ static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.dev = dev;
>   	drvdata->csdev = coresight_register(&desc);
>   
> -	if (!IS_ERR(drvdata->csdev)) {
> -		pm_runtime_put(&adev->dev);
> +	if (!IS_ERR(drvdata->csdev))
>   		return 0;
> -	}
>   
>   	return PTR_ERR(drvdata->csdev);
>   }
>   
> -static void tpiu_remove(struct amba_device *adev)
> +static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
> -	struct tpiu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +	int ret;
> +
> +	ret = __tpiu_probe(&adev->dev, &adev->res);
> +	if (!ret)
> +		pm_runtime_put(&adev->dev);
> +	return ret;
> +}
> +
> +static void __tpiu_remove(struct device *dev)
> +{
> +	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
>   
>   	coresight_unregister(drvdata->csdev);
>   }
>   
> +static void tpiu_remove(struct amba_device *adev)
> +{
> +	__tpiu_remove(&adev->dev);
> +}
> +
>   #ifdef CONFIG_PM
>   static int tpiu_runtime_suspend(struct device *dev)
>   {
> @@ -196,6 +215,8 @@ static int tpiu_runtime_suspend(struct device *dev)
>   	if (drvdata && !IS_ERR(drvdata->atclk))
>   		clk_disable_unprepare(drvdata->atclk);
>   
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_disable_unprepare(drvdata->pclk);
>   	return 0;
>   }
>   
> @@ -206,6 +227,8 @@ static int tpiu_runtime_resume(struct device *dev)
>   	if (drvdata && !IS_ERR(drvdata->atclk))
>   		clk_prepare_enable(drvdata->atclk);
>   
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_prepare_enable(drvdata->pclk);
>   	return 0;
>   }
>   #endif
> @@ -245,7 +268,67 @@ static struct amba_driver tpiu_driver = {
>   	.id_table	= tpiu_ids,
>   };
>   
> -module_amba_driver(tpiu_driver);
> +static int tpiu_platform_probe(struct platform_device *pdev)
> +{
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	int ret;
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = __tpiu_probe(&pdev->dev, res);
> +	pm_runtime_put(&pdev->dev);
> +	if (ret)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int tpiu_platform_remove(struct platform_device *pdev)
> +{
> +	struct tpiu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +
> +	if (WARN_ON(!drvdata))
> +		return -ENODEV;
> +
> +	__tpiu_remove(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

Same as the previous patches.

Suzuki


> +		clk_put(drvdata->pclk);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id tpiu_acpi_ids[] = {
> +	{"ARMHC979", 0, 0, 0}, /* ARM CoreSight TPIU */
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, tpiu_acpi_ids);
> +#endif
> +
> +static struct platform_driver tpiu_platform_driver = {
> +	.probe	= tpiu_platform_probe,
> +	.remove	= tpiu_platform_remove,
> +	.driver = {
> +		.name			= "coresight-tpiu-platform",
> +		.acpi_match_table	= ACPI_PTR(tpiu_acpi_ids),
> +		.suppress_bind_attrs	= true,
> +		.pm			= &tpiu_dev_pm_ops,
> +	},
> +};
> +
> +static int __init tpiu_init(void)
> +{
> +	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver);
> +}
> +
> +static void __exit tpiu_exit(void)
> +{
> +	coresight_remove_driver(&tpiu_driver, &tpiu_platform_driver);
> +}
> +module_init(tpiu_init);
> +module_exit(tpiu_exit);
>   
>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
