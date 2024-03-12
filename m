Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C31AD879718
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 16:05:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EEDFC6C83C;
	Tue, 12 Mar 2024 15:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B63D5C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 15:05:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19ED1FEC;
 Tue, 12 Mar 2024 08:06:00 -0700 (PDT)
Received: from [10.57.50.231] (unknown [10.57.50.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 050A33F762;
 Tue, 12 Mar 2024 08:05:20 -0700 (PDT)
Message-ID: <9f4c2e47-3790-464e-a831-f900265a4dcc@arm.com>
Date: Tue, 12 Mar 2024 15:05:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240312102318.2285165-1-anshuman.khandual@arm.com>
 <20240312102318.2285165-8-anshuman.khandual@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240312102318.2285165-8-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V6 07/11] coresight: catu: Move ACPI
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
> Add support for the catu devices in a new platform driver, which can then
> be used on ACPI based platforms. This change would now allow runtime power
> management for ACPI based systems. The driver would try to enable the APB
> clock if available. But first this renames and then refactors catu_probe()
> and catu_remove(), making sure it can be used both for platform and AMBA
> drivers. This also moves pm_runtime_put() from catu_probe() to the callers.
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
> Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
> Reviewed-by: James Clark <james.clark@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V6:
> 
> - Added clk_put() for pclk in catu_platform_probe() error path
> - Added WARN_ON(!drvdata) check in catu_platform_remove()
> - Added additional elements for acpi_device_id[]
> 
>   drivers/acpi/arm64/amba.c                    |   1 -
>   drivers/hwtracing/coresight/coresight-catu.c | 146 ++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-catu.h |   1 +
>   3 files changed, 125 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
> index afb6afb66967..587061b0fd2f 100644
> --- a/drivers/acpi/arm64/amba.c
> +++ b/drivers/acpi/arm64/amba.c
> @@ -27,7 +27,6 @@ static const struct acpi_device_id amba_id_list[] = {
>   	{"ARMHC503", 0}, /* ARM CoreSight Debug */
>   	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
>   	{"ARMHC97C", 0}, /* ARM CoreSight SoC-400 TMC, SoC-600 ETF/ETB */
> -	{"ARMHC9CA", 0}, /* ARM CoreSight CATU */
>   	{"", 0},
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 3949ded0d4fa..8fa035e5a0e8 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -7,6 +7,8 @@
>    * Author: Suzuki K Poulose <suzuki.poulose@arm.com>
>    */
>   
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>

minor nit: Please retain the alphabetic order.

>   #include <linux/amba/bus.h>
>   #include <linux/device.h>
>   #include <linux/dma-mapping.h>
> @@ -502,31 +504,25 @@ static const struct coresight_ops catu_ops = {
>   	.helper_ops = &catu_helper_ops,
>   };
>   
> -static int catu_probe(struct amba_device *adev, const struct amba_id *id)
> +static int __catu_probe(struct device *dev, struct resource *res)
>   {
>   	int ret = 0;
>   	u32 dma_mask;
> -	struct catu_drvdata *drvdata;
> +	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
>   	struct coresight_desc catu_desc;
>   	struct coresight_platform_data *pdata = NULL;
> -	struct device *dev = &adev->dev;
>   	void __iomem *base;
>   
>   	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
>   	if (!catu_desc.name)
>   		return -ENOMEM;
>   
> -	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> -
> -	dev_set_drvdata(dev, drvdata);
> -	base = devm_ioremap_resource(dev, &adev->res);
> -	if (IS_ERR(base)) {
> -		ret = PTR_ERR(base);
> -		goto out;
> +	if (res) {

We don't have a case where res == NULL and we shouldn't support that.

> +		base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(base)) {
> +			ret = PTR_ERR(base);
> +			goto out;
> +		}
>   	}
>   
>   	/* Setup dma mask for the device */
> @@ -567,19 +563,39 @@ static int catu_probe(struct amba_device *adev, const struct amba_id *id)
>   	drvdata->csdev = coresight_register(&catu_desc);
>   	if (IS_ERR(drvdata->csdev))
>   		ret = PTR_ERR(drvdata->csdev);
> -	else
> -		pm_runtime_put(&adev->dev);
>   out:
>   	return ret;
>   }
>   
> -static void catu_remove(struct amba_device *adev)
> +static int catu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct catu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	amba_set_drvdata(adev, drvdata);
> +	ret = __catu_probe(&adev->dev, &adev->res);
> +	if (!ret)
> +		pm_runtime_put(&adev->dev);
> +
> +	return ret;
> +}
> +
> +static void __catu_remove(struct device *dev)
>   {
> -	struct catu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
>   
>   	coresight_unregister(drvdata->csdev);
>   }
>   
> +static void catu_remove(struct amba_device *adev)
> +{
> +	__catu_remove(&adev->dev);
> +}
> +
>   static struct amba_id catu_ids[] = {
>   	CS_AMBA_ID(0x000bb9ee),
>   	{},
> @@ -598,13 +614,99 @@ static struct amba_driver catu_driver = {
>   	.id_table			= catu_ids,
>   };
>   
> +static int catu_platform_probe(struct platform_device *pdev)
> +{
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	struct catu_drvdata *drvdata;
> +	int ret = 0;
> +
> +	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> +	if (IS_ERR(drvdata->pclk))
> +		return -ENODEV;
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	dev_set_drvdata(&pdev->dev, drvdata);
> +	ret = __catu_probe(&pdev->dev, res);
> +	pm_runtime_put(&pdev->dev);
> +	if (ret) {
> +		pm_runtime_disable(&pdev->dev);
> +		if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

Here drvdata is guaranteed to be valid and the check is not required.

> +			clk_put(drvdata->pclk);
> +	}
> +
> +	return ret;
> +}
> +
> +static int catu_platform_remove(struct platform_device *pdev)
> +{
> +	struct catu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +
> +	if (WARN_ON(!drvdata))
> +		return -ENODEV;
> +
> +	__catu_remove(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

Same here. Rest looks fine.

Suzuki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
