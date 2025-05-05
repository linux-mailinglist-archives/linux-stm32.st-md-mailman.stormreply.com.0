Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B6AA8D03
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 09:28:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A45AC78037;
	Mon,  5 May 2025 07:28:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87784CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 07:28:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 804321007;
 Mon,  5 May 2025 00:28:06 -0700 (PDT)
Received: from [10.163.53.144] (unknown [10.163.53.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AC4B3F58B;
 Mon,  5 May 2025 00:28:10 -0700 (PDT)
Message-ID: <08690315-ce0e-4b2e-b85e-d8b9a82f4b11@arm.com>
Date: Mon, 5 May 2025 12:58:06 +0530
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
 <20250423151726.372561-8-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423151726.372561-8-leo.yan@arm.com>
Subject: Re: [Linux-stm32] [PATCH v2 7/9] coresight: Consolidate clock
	enabling
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
> CoreSight drivers enable pclk and atclk conditionally.  For example,
> pclk is only enabled in the static probe, while atclk is an optional
> clock that it is enabled for both dynamic and static probes, if it is
> present.  In the current CoreSight drivers, these two clocks are
> initialized separately.  This causes complex and duplicate codes.

Agreed, it does cause complex and redundant code sequences.

> 
> This patch consolidates clock enabling into a central place.  It renames
> coresight_get_enable_apb_pclk() to coresight_get_enable_clocks() and
> encapsulates clock initialization logic:
> 
>  - If a clock is initialized successfully, its clock pointer is assigned
>    to the double pointer passed as an argument.
>  - If pclk is skipped for an AMBA device, or if atclk is not found, the
>    corresponding double pointer is set to NULL.  The function returns
>    Success (0) to guide callers can proceed with no error.
>  - Otherwise, an error number is returned for failures.
> 
> The function became complex, move it from the header to the CoreSight
> core layer and the symbol is exported.  Added comments for recording
> details.

Makes sense.

> 
> CoreSight drivers are refined so that clocks are initialized in one go.
> As a result, driver data no longer needs to be allocated separately in
> the static and dynamic probes.  Moved the allocation into a low-level
> function to avoid code duplication.

Makes sense.

> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c       | 30 ++++++++++------------------
>  drivers/hwtracing/coresight/coresight-core.c       | 45 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  | 29 +++++++++++----------------
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++----
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++-------
>  drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++++-------
>  drivers/hwtracing/coresight/coresight-replicator.c | 11 ++++-------
>  drivers/hwtracing/coresight/coresight-stm.c        |  9 +++------
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 30 ++++++++++------------------
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++++------
>  include/linux/coresight.h                          | 23 ++-------------------
>  11 files changed, 101 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index c0a51ab0312c..c63dee1ac997 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -508,14 +508,20 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  {
>  	int ret = 0;
>  	u32 dma_mask;
> -	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct catu_drvdata *drvdata;
>  	struct coresight_desc catu_desc;
>  	struct coresight_platform_data *pdata = NULL;
>  	void __iomem *base;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
>  	if (!catu_desc.name)
> @@ -571,14 +577,8 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  
>  static int catu_probe(struct amba_device *adev, const struct amba_id *id)
>  {
> -	struct catu_drvdata *drvdata;
>  	int ret;
>  
> -	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	amba_set_drvdata(adev, drvdata);
>  	ret = __catu_probe(&adev->dev, &adev->res);
>  	if (!ret)
>  		pm_runtime_put(&adev->dev);
> @@ -618,22 +618,12 @@ static struct amba_driver catu_driver = {
>  static int catu_platform_probe(struct platform_device *pdev)
>  {
>  	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	struct catu_drvdata *drvdata;
>  	int ret = 0;
>  
> -	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	ret = __catu_probe(&pdev->dev, res);
>  	pm_runtime_put(&pdev->dev);
>  	if (ret)
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..57ecf635fd54 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1645,6 +1645,51 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
>  }
>  EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
>  
> +/*
> + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> + * for the given device.
> + *
> + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> + * skip to get and enable the pclk for an AMBA device.
> + *
> + * atclk is an optional clock, it will be only enabled when it is existed.
> + * Otherwise, a NULL pointer will be returned to caller.
> + *
> + * Returns: '0' on Success; Error code otherwise.
> + */
> +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
> +				struct clk **atclk)

These arguments probably could be arranged better as pclk and atclk are
always contained inside 'xxx_drvdata' structure, which could be derived
from the 'dev' structure itself, if [dev|platform]_set_drvdata() always
ensured to be called earlier.

Currently there are only two instances where a NULL is being passed to
indicate that 'atclk' clock is not to be probed or enabled. Could not
individual clock requirements be passed in a flag argument instead ?

#define CORESIGHT_ENABLE_PCLK	0x1
#define CORESIGHT_ENABLE_ATCLK	0x2

coresight_get_enable_clocks(struct device *dev, unsigned long flags)

- atclk/pclk derived from drdvata which in turn from dev
- flags can be checked for pclk/atclk requirements

Even better - as atlck is the only optional clock here, it could just
have a boolean flag argument to indicate for atclk clock.

> +{
> +	WARN_ON(!pclk);
> +
> +	if (!dev_is_amba(dev)) {
> +		/*
> +		 * "apb_pclk" is the default clock name for an Arm Primecell
> +		 * peripheral, while "apb" is used only by the CTCU driver.
> +		 *
> +		 * For easier maintenance, CoreSight drivers should use
> +		 * "apb_pclk" as the programming clock name.
> +		 */
> +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +		if (IS_ERR(*pclk))
> +			*pclk = devm_clk_get_enabled(dev, "apb");
> +		if (IS_ERR(*pclk))
> +			return PTR_ERR(*pclk);
> +	} else {
> +		/* Don't enable pclk for an AMBA device */
> +		*pclk = NULL;
> +	}

Might be better to invert this conditional check as if (dev_is_amba(dev))
for better readability.

> +
> +	if (atclk) {
> +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +		if (IS_ERR(*atclk))
> +			return PTR_ERR(*atclk);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_enable_clocks);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>  MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 744b6f9b065e..481ffcbed534 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -562,10 +562,20 @@ static void debug_func_exit(void)
>  
>  static int __debug_probe(struct device *dev, struct resource *res)
>  {
> -	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct debug_drvdata *drvdata;
>  	void __iomem *base;
>  	int ret;
>  
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
> +	if (ret)
> +		return ret;
> +
>  	drvdata->cpu = coresight_get_cpu(dev);
>  	if (drvdata->cpu < 0)
>  		return drvdata->cpu;
> @@ -625,13 +635,6 @@ static int __debug_probe(struct device *dev, struct resource *res)
>  
>  static int debug_probe(struct amba_device *adev, const struct amba_id *id)
>  {
> -	struct debug_drvdata *drvdata;
> -
> -	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	amba_set_drvdata(adev, drvdata);
>  	return __debug_probe(&adev->dev, &adev->res);
>  }
>  
> @@ -690,18 +693,8 @@ static struct amba_driver debug_driver = {
>  static int debug_platform_probe(struct platform_device *pdev)
>  {
>  	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	struct debug_drvdata *drvdata;
>  	int ret = 0;
>  
> -	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index de279efe3405..75b5114ef652 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -188,7 +188,7 @@ static int ctcu_probe(struct platform_device *pdev)
>  	const struct ctcu_config *cfgs;
>  	struct ctcu_drvdata *drvdata;
>  	void __iomem *base;
> -	int i;
> +	int i, ret;
>  
>  	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
>  	if (!desc.name)
> @@ -207,9 +207,9 @@ static int ctcu_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->apb_clk))
> -		return PTR_ERR(drvdata->apb_clk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->apb_clk, NULL);
> +	if (ret)
> +		return ret;
>  
>  	cfgs = of_device_get_match_data(dev);
>  	if (cfgs) {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index ff4ac4b686c4..ba5d1a015140 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2145,13 +2145,14 @@ static int etm4_probe(struct device *dev)
>  	struct csdev_access access = { 0 };
>  	struct etm4_init_arg init_arg = { 0 };
>  	struct etm4_init_arg *delayed;
> +	int ret;
>  
>  	if (WARN_ON(!drvdata))
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
>  		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
> @@ -2235,10 +2236,6 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
>  	if (res) {
>  		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
>  		if (IS_ERR(drvdata->base))
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index ec6d3e656548..173fee3aaa6e 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -217,6 +217,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	struct coresight_platform_data *pdata = NULL;
>  	struct funnel_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
> +	int ret;
>  
>  	if (is_of_node(dev_fwnode(dev)) &&
>  	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
> @@ -230,13 +231,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Map the device base for dynamic-funnel, which has been
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 460af0f7b537..7250a2174145 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -223,6 +223,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	struct replicator_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
>  	void __iomem *base;
> +	int ret;
>  
>  	if (is_of_node(dev_fwnode(dev)) &&
>  	    of_device_is_compatible(dev->of_node, "arm,coresight-replicator"))
> @@ -237,13 +238,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Map the device base for dynamic-replicator, which has been
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index f13fbab4d7a2..89e90e7f54de 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -842,13 +842,10 @@ static int __stm_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	base = devm_ioremap_resource(dev, res);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 517850d39a0e..abb6294712f1 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -785,13 +785,19 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  	u32 devid;
>  	void __iomem *base;
>  	struct coresight_platform_data *pdata = NULL;
> -	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct tmc_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
>  	struct coresight_dev_list *dev_list = NULL;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	ret = -ENOMEM;
>  
> @@ -897,14 +903,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  
>  static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
>  {
> -	struct tmc_drvdata *drvdata;
>  	int ret;
>  
> -	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	amba_set_drvdata(adev, drvdata);
>  	ret = __tmc_probe(&adev->dev, &adev->res);
>  	if (!ret)
>  		pm_runtime_put(&adev->dev);
> @@ -981,18 +981,8 @@ static struct amba_driver tmc_driver = {
>  static int tmc_platform_probe(struct platform_device *pdev)
>  {
>  	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	struct tmc_drvdata *drvdata;
>  	int ret = 0;
>  
> -	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index cac1b5bba086..b3d0db0e53b9 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -132,6 +132,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>  	struct coresight_platform_data *pdata = NULL;
>  	struct tpiu_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
> +	int ret;
>  
>  	desc.name = coresight_alloc_device_name(&tpiu_devs, dev);
>  	if (!desc.name)
> @@ -143,13 +144,10 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>  
>  	spin_lock_init(&drvdata->spinlock);
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	/* Validity for the resource is already checked by the AMBA core */
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 26eb4a61b992..2b5f5ba6fe49 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -470,27 +470,6 @@ static inline bool is_coresight_device(void __iomem *base)
>  	return cid == CORESIGHT_CID;
>  }
>  
> -/*
> - * Attempt to find and enable "APB clock" for the given device
> - *
> - * Returns:
> - *
> - * clk   - Clock is found and enabled
> - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> - * ERROR - Clock is found but failed to enable
> - */
> -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> -{
> -	struct clk *pclk = NULL;
> -
> -	if (!dev_is_amba(dev)) {
> -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> -		if (IS_ERR(pclk))
> -			pclk = devm_clk_get_enabled(dev, "apb");
> -	}
> -
> -	return pclk;
> -}
>  
>  #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
>  
> @@ -722,4 +701,6 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>  			     struct platform_driver *pdev_drv);
>  int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>  			       struct coresight_device *sink);
> +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
> +				struct clk **atclk);
>  #endif		/* _LINUX_COREISGHT_H */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
