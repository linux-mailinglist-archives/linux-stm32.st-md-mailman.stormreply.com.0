Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACFA95203E
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 18:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B049C71289;
	Wed, 14 Aug 2024 16:42:57 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3377FCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 16:42:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkYrp1H7Wz6K9Gf;
 Thu, 15 Aug 2024 00:40:10 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id BE5E3140A90;
 Thu, 15 Aug 2024 00:42:48 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 17:42:48 +0100
Date: Wed, 14 Aug 2024 17:42:46 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240814174246.00007e4e@Huawei.com>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-3-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
 <20240812-cleanup-h-of-node-put-memory-v1-3-5065a8f361d2@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 3/9] memory: samsung: exynos5422-dmc: use
 scoped device node handling to simplify error paths
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

On Mon, 12 Aug 2024 15:33:57 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Trivial comments inline
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/memory/samsung/exynos5422-dmc.c | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
> index da7ecd921c72..d3ae4d95a3ba 100644
> --- a/drivers/memory/samsung/exynos5422-dmc.c
> +++ b/drivers/memory/samsung/exynos5422-dmc.c
> @@ -4,6 +4,7 @@
>   * Author: Lukasz Luba <l.luba@partner.samsung.com>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/devfreq.h>
>  #include <linux/devfreq-event.h>
> @@ -1176,10 +1177,10 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
>  {
>  	int ret = 0;
>  	int idx;
> -	struct device_node *np_ddr;

This would definitely benefit from a
struct device *dev = dmc->dev;

>  	u32 freq_mhz, clk_period_ps;
>  
> -	np_ddr = of_parse_phandle(dmc->dev->of_node, "device-handle", 0);
> +	struct device_node *np_ddr __free(device_node) = of_parse_phandle(dmc->dev->of_node,
> +									  "device-handle", 0);
Trivial. Maybe consider the wrap suggested in patch 1.
> +	struct device_node *np_ddr __free(device_node) =
		of_parse_phandle(dmc->dev->of_node, "device-handle", 0);

>  	if (!np_ddr) {
>  		dev_warn(dmc->dev, "could not find 'device-handle' in DT\n");
>  		return -EINVAL;
> @@ -1187,39 +1188,31 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
>  
>  	dmc->timing_row = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
>  					     sizeof(u32), GFP_KERNEL);
> -	if (!dmc->timing_row) {
> -		ret = -ENOMEM;
> -		goto put_node;
> -	}
> +	if (!dmc->timing_row)
> +		return -ENOMEM;
>  
>  	dmc->timing_data = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
>  					      sizeof(u32), GFP_KERNEL);
> -	if (!dmc->timing_data) {
> -		ret = -ENOMEM;
> -		goto put_node;
> -	}
> +	if (!dmc->timing_data)
> +		return -ENOMEM;
>  
>  	dmc->timing_power = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
>  					       sizeof(u32), GFP_KERNEL);
> -	if (!dmc->timing_power) {
> -		ret = -ENOMEM;
> -		goto put_node;
> -	}
> +	if (!dmc->timing_power)
> +		return -ENOMEM;
>  
>  	dmc->timings = of_lpddr3_get_ddr_timings(np_ddr, dmc->dev,
>  						 DDR_TYPE_LPDDR3,
>  						 &dmc->timings_arr_size);
>  	if (!dmc->timings) {
>  		dev_warn(dmc->dev, "could not get timings from DT\n");
> -		ret = -EINVAL;
> -		goto put_node;
> +		return -EINVAL;
>  	}
>  
>  	dmc->min_tck = of_lpddr3_get_min_tck(np_ddr, dmc->dev);
>  	if (!dmc->min_tck) {
>  		dev_warn(dmc->dev, "could not get tck from DT\n");
> -		ret = -EINVAL;
> -		goto put_node;
> +		return -EINVAL;
>  	}
>  
>  	/* Sorted array of OPPs with frequency ascending */
> @@ -1239,8 +1232,6 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
>  	dmc->bypass_timing_data = dmc->timing_data[idx - 1];
>  	dmc->bypass_timing_power = dmc->timing_power[idx - 1];
>  
> -put_node:
> -	of_node_put(np_ddr);
>  	return ret;
>  }
>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
