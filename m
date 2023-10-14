Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE797C9557
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 18:18:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E246C6B442;
	Sat, 14 Oct 2023 16:18:54 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 088EBC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 16:18:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 90552B80688;
 Sat, 14 Oct 2023 16:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB93C433C7;
 Sat, 14 Oct 2023 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697300332;
 bh=rcHe2IojBHzrFe/8C4CXM2Y34afpD5jZN4BNeTTGPSA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W11XEmFFSK0FSzKN3yrJEz3qYTacjYsL3JhaN6VQTF9mZFldTjlqSR6aoK1lti0w1
 MbJOPOpp+q29FZjYdEG/yl3VkUnQT9Tix6HA+DDLnR4K8+Lft+7FkcmbOW3jOiHQTZ
 WqP96eL7yigHTCNDOielAkp1WdcApJvCLCUp3SI2MOmFWvNEXzhafV8dL4s73rQqlY
 1Jz0TmAozrjQ10YVd9x1PagUkyf1LQpQwprGjCsD40n3F/vkD9gOf0DSrjXHqNdEDJ
 LZjJzFgHvMR6d9IA9EIr0mRWowuEkKf3A5watNXbKAH2jb/+TfxdkoVrisehlS7tVx
 EfRrx5CbuYgGA==
Date: Sat, 14 Oct 2023 17:19:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20231014171906.42459f40@jic23-huawei>
In-Reply-To: <20231006224440.442864-1-robh@kernel.org>
References: <20231006224440.442864-1-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: Use device_get_match_data()
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

On Fri,  6 Oct 2023 17:44:39 -0500
Rob Herring <robh@kernel.org> wrote:

> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out first as testing
to let 0-day see if it can find any issues that we missed.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc-core.c | 11 +++--------
>  drivers/iio/adc/twl6030-gpadc.c  | 10 ++++------
>  drivers/iio/dac/stm32-dac-core.c |  9 ++++-----
>  3 files changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index c19506b0aac8..616dd729666a 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -17,10 +17,11 @@
>  #include <linux/irqdomain.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> @@ -708,8 +709,6 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	struct stm32_adc_priv *priv;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = pdev->dev.of_node;
> -	const struct of_device_id *of_id;
> -
>  	struct resource *res;
>  	u32 max_rate;
>  	int ret;
> @@ -722,11 +721,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, &priv->common);
>  
> -	of_id = of_match_device(dev->driver->of_match_table, dev);
> -	if (!of_id)
> -		return -ENODEV;
> -
> -	priv->cfg = (const struct stm32_adc_priv_cfg *)of_id->data;
> +	priv->cfg = device_get_match_data(dev);
>  	priv->nb_adc_max = priv->cfg->num_adcs;
>  	spin_lock_init(&priv->common.lock);
>  
> diff --git a/drivers/iio/adc/twl6030-gpadc.c b/drivers/iio/adc/twl6030-gpadc.c
> index 224e9cb5e147..78bf55438b2c 100644
> --- a/drivers/iio/adc/twl6030-gpadc.c
> +++ b/drivers/iio/adc/twl6030-gpadc.c
> @@ -16,9 +16,10 @@
>   */
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/of_platform.h>
> +#include <linux/property.h>
>  #include <linux/mfd/twl.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -879,17 +880,14 @@ static int twl6030_gpadc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct twl6030_gpadc_data *gpadc;
>  	const struct twl6030_gpadc_platform_data *pdata;
> -	const struct of_device_id *match;
>  	struct iio_dev *indio_dev;
>  	int irq;
>  	int ret;
>  
> -	match = of_match_device(of_twl6030_match_tbl, dev);
> -	if (!match)
> +	pdata = device_get_match_data(&pdev->dev);
> +	if (!pdata)
>  		return -EINVAL;
>  
> -	pdata = match->data;
> -
>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
>  	if (!indio_dev)
>  		return -ENOMEM;
> diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
> index 15abe048729e..e150ac729154 100644
> --- a/drivers/iio/dac/stm32-dac-core.c
> +++ b/drivers/iio/dac/stm32-dac-core.c
> @@ -9,9 +9,12 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  
> @@ -94,16 +97,12 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	struct reset_control *rst;
>  	int ret;
>  
> -	if (!dev->of_node)
> -		return -ENODEV;
> -
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, &priv->common);
>  
> -	cfg = (const struct stm32_dac_cfg *)
> -		of_match_device(dev->driver->of_match_table, dev)->data;
> +	cfg = device_get_match_data(dev);
>  
>  	mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mmio))

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
