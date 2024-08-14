Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B795202D
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 18:38:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3474C71289;
	Wed, 14 Aug 2024 16:38:44 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97F54CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 16:38:37 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkYlC4h9Mz6K6D2;
 Thu, 15 Aug 2024 00:35:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 3B165140C98;
 Thu, 15 Aug 2024 00:38:36 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 17:38:35 +0100
Date: Wed, 14 Aug 2024 17:38:34 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240814173834.000002c8@Huawei.com>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-1-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
 <20240812-cleanup-h-of-node-put-memory-v1-1-5065a8f361d2@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH 1/9] memory: atmel-ebi: use scoped device
 node handling to simplify error paths
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

On Mon, 12 Aug 2024 15:33:55 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi,

Comments inline.
> ---
>  drivers/memory/atmel-ebi.c | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
> index e8bb5f37f5cb..fcbfc2655d8d 100644
> --- a/drivers/memory/atmel-ebi.c
> +++ b/drivers/memory/atmel-ebi.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2013 Jean-Jacques Hiblot <jjhiblot@traphandler.com>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/mfd/syscon.h>
> @@ -517,7 +518,7 @@ static int atmel_ebi_dev_disable(struct atmel_ebi *ebi, struct device_node *np)
>  static int atmel_ebi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *child, *np = dev->of_node, *smc_np;
> +	struct device_node *child, *np = dev->of_node;
>  	struct atmel_ebi *ebi;
>  	int ret, reg_cells;
>  	struct clk *clk;
> @@ -541,30 +542,24 @@ static int atmel_ebi_probe(struct platform_device *pdev)
>  
>  	ebi->clk = clk;
>  
> -	smc_np = of_parse_phandle(dev->of_node, "atmel,smc", 0);
> +	struct device_node *smc_np __free(device_node) = of_parse_phandle(dev->of_node,
> +									  "atmel,smc", 0);
Trivial:
I'd line break this as
> +	struct device_node *smc_np __free(device_node) =
		of_parse_phandle(dev->of_node, "atmel,smc", 0);

>  
>  	ebi->smc.regmap = syscon_node_to_regmap(smc_np);
> -	if (IS_ERR(ebi->smc.regmap)) {
> -		ret = PTR_ERR(ebi->smc.regmap);
> -		goto put_node;
> -	}
> +	if (IS_ERR(ebi->smc.regmap))
> +		return PTR_ERR(ebi->smc.regmap);
>  
>  	ebi->smc.layout = atmel_hsmc_get_reg_layout(smc_np);
> -	if (IS_ERR(ebi->smc.layout)) {
> -		ret = PTR_ERR(ebi->smc.layout);
> -		goto put_node;
> -	}
> +	if (IS_ERR(ebi->smc.layout))
> +		return PTR_ERR(ebi->smc.layout);
>  
>  	ebi->smc.clk = of_clk_get(smc_np, 0);
>  	if (IS_ERR(ebi->smc.clk)) {
> -		if (PTR_ERR(ebi->smc.clk) != -ENOENT) {
> -			ret = PTR_ERR(ebi->smc.clk);
> -			goto put_node;
> -		}
> +		if (PTR_ERR(ebi->smc.clk) != -ENOENT)
> +			return PTR_ERR(ebi->smc.clk);
>  
>  		ebi->smc.clk = NULL;
>  	}
> -	of_node_put(smc_np);

The large change in scope is a bit inelegant as it now hangs on to
the smc_np much longer than before.

Maybe it's worth pulling out the modified code as a 
atem_eb_probe_smc(struct device_node *smc_np, struct atmel_ebi_smc *smc )

or something like with a struct_group to define the atmel_ebi_smc

That would keep the tight scope for the data and generally simplify it
a bit.

>  	ret = clk_prepare_enable(ebi->smc.clk);
>  	if (ret)
>  		return ret;
> @@ -615,10 +610,6 @@ static int atmel_ebi_probe(struct platform_device *pdev)
>  	}
>  
>  	return of_platform_populate(np, NULL, NULL, dev);
> -
> -put_node:
> -	of_node_put(smc_np);
> -	return ret;
>  }
>  
>  static __maybe_unused int atmel_ebi_resume(struct device *dev)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
