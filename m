Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A626361F
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 20:36:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4154C3FAE2;
	Wed,  9 Sep 2020 18:36:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 806B9C36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 18:36:08 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B328120C09;
 Wed,  9 Sep 2020 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599676567;
 bh=ia9hTJyZgEKfRDINp42R4WNkVvq9pCYrEhY2mO62t5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=knGyXOGF7f7i/Ki2r7Ku7Scb0TISK5qGEPUfKpe9uiNoehhN5k559yVdz5F+H4eHA
 8xWDS0vile5v7kmyfpeZEJb92c6JNYqo1/kMaas25tZDZym8w0B4ccwCXITaydSann
 1bhIeZEsp06NKSEgL7v2PSAZOv+r3qOgET7c/hFk=
Date: Wed, 9 Sep 2020 19:36:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200909193600.41970d8c@archlinux>
In-Reply-To: <20200829064726.26268-8-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-amlogic@lists.infradead.org, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/18] iio: adc: stm32: Simplify with
	dev_err_probe()
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

On Sat, 29 Aug 2020 08:47:16 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
I don't have the thread to hand, but this tripped a warning next
and the patch was dropped as a result. See below.

Jonathan
> ---
> 
> Changes since v2:
> 1. Wrap dev_err_probe() lines at 80 character
> 
> Changes since v1:
> 1. Convert to devm_clk_get_optional
> 2. Update also stm32-dfsdm-core and stm32-dac-core.
> 3. Wrap around 100 characters (accepted by checkpatch).
> ---
>  drivers/iio/adc/stm32-adc-core.c   | 75 ++++++++++--------------------
>  drivers/iio/adc/stm32-adc.c        | 10 ++--
>  drivers/iio/adc/stm32-dfsdm-adc.c  | 10 ++--
>  drivers/iio/adc/stm32-dfsdm-core.c |  9 ++--
>  drivers/iio/dac/stm32-dac-core.c   |  5 +-
>  5 files changed, 35 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 0e2068ec068b..3f27b4817a42 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -582,11 +582,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  	priv->syscfg = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
>  	if (IS_ERR(priv->syscfg)) {
>  		ret = PTR_ERR(priv->syscfg);
> -		if (ret != -ENODEV) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "Can't probe syscfg: %d\n", ret);
> -			return ret;
> -		}
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret, "Can't probe syscfg\n");
> +
>  		priv->syscfg = NULL;
>  	}
>  
> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  		priv->booster = devm_regulator_get_optional(dev, "booster");
>  		if (IS_ERR(priv->booster)) {
>  			ret = PTR_ERR(priv->booster);
> -			if (ret != -ENODEV) {
> -				if (ret != -EPROBE_DEFER)
> -					dev_err(dev, "can't get booster %d\n",
> -						ret);
> -				return ret;
> -			}
> +			if (ret != -ENODEV)
> +				dev_err_probe(dev, ret, "can't get booster\n");

This tripped a warning and got the patch dropped because we no longer
return on error.

> +
>  			priv->booster = NULL;
>  		}
>  	}
> @@ -612,11 +607,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  		priv->vdd = devm_regulator_get_optional(dev, "vdd");
>  		if (IS_ERR(priv->vdd)) {
>  			ret = PTR_ERR(priv->vdd);
> -			if (ret != -ENODEV) {
> -				if (ret != -EPROBE_DEFER)
> -					dev_err(dev, "can't get vdd %d\n", ret);
> -				return ret;
> -			}
> +			if (ret != -ENODEV)
> +				return dev_err_probe(dev, ret, "can't get vdd\n");
> +
>  			priv->vdd = NULL;
>  		}
>  	}
> @@ -669,42 +662,24 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	priv->common.phys_base = res->start;
>  
>  	priv->vdda = devm_regulator_get(&pdev->dev, "vdda");
> -	if (IS_ERR(priv->vdda)) {
> -		ret = PTR_ERR(priv->vdda);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "vdda get failed, %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(priv->vdda))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->vdda),
> +				     "vdda get failed\n");
>  
>  	priv->vref = devm_regulator_get(&pdev->dev, "vref");
> -	if (IS_ERR(priv->vref)) {
> -		ret = PTR_ERR(priv->vref);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "vref get failed, %d\n", ret);
> -		return ret;
> -	}
> -
> -	priv->aclk = devm_clk_get(&pdev->dev, "adc");
> -	if (IS_ERR(priv->aclk)) {
> -		ret = PTR_ERR(priv->aclk);
> -		if (ret != -ENOENT) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Can't get 'adc' clock\n");
> -			return ret;
> -		}
> -		priv->aclk = NULL;
> -	}
> -
> -	priv->bclk = devm_clk_get(&pdev->dev, "bus");
> -	if (IS_ERR(priv->bclk)) {
> -		ret = PTR_ERR(priv->bclk);
> -		if (ret != -ENOENT) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Can't get 'bus' clock\n");
> -			return ret;
> -		}
> -		priv->bclk = NULL;
> -	}
> +	if (IS_ERR(priv->vref))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->vref),
> +				     "vref get failed\n");
> +
> +	priv->aclk = devm_clk_get_optional(&pdev->dev, "adc");
> +	if (IS_ERR(priv->aclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->aclk),
> +				     "Can't get 'adc' clock\n");
> +
> +	priv->bclk = devm_clk_get_optional(&pdev->dev, "bus");
> +	if (IS_ERR(priv->bclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->bclk),
> +				     "Can't get 'bus' clock\n");
>  
>  	ret = stm32_adc_core_switches_probe(dev, priv);
>  	if (ret)
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 3eb9ebe8372f..b3f31f147347 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1805,13 +1805,9 @@ static int stm32_adc_dma_request(struct device *dev, struct iio_dev *indio_dev)
>  	adc->dma_chan = dma_request_chan(dev, "rx");
>  	if (IS_ERR(adc->dma_chan)) {
>  		ret = PTR_ERR(adc->dma_chan);
> -		if (ret != -ENODEV) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev,
> -					"DMA channel request failed with %d\n",
> -					ret);
> -			return ret;
> -		}
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "DMA channel request failed with\n");
>  
>  		/* DMA is optional: fall back to IRQ mode */
>  		adc->dma_chan = NULL;
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 5e10fb4f3704..c7e0109315f8 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1473,13 +1473,9 @@ static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)
>  	/* Optionally request DMA */
>  	ret = stm32_dfsdm_dma_request(dev, indio_dev);
>  	if (ret) {
> -		if (ret != -ENODEV) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev,
> -					"DMA channel request failed with %d\n",
> -					ret);
> -			return ret;
> -		}
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "DMA channel request failed with\n");
>  
>  		dev_dbg(dev, "No DMA support\n");
>  		return 0;
> diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
> index 26e2011c5868..0b8bea88b011 100644
> --- a/drivers/iio/adc/stm32-dfsdm-core.c
> +++ b/drivers/iio/adc/stm32-dfsdm-core.c
> @@ -243,12 +243,9 @@ static int stm32_dfsdm_parse_of(struct platform_device *pdev,
>  	 * on use case.
>  	 */
>  	priv->clk = devm_clk_get(&pdev->dev, "dfsdm");
> -	if (IS_ERR(priv->clk)) {
> -		ret = PTR_ERR(priv->clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Failed to get clock (%d)\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
> +				     "Failed to get clock\n");
>  
>  	priv->aclk = devm_clk_get(&pdev->dev, "audio");
>  	if (IS_ERR(priv->aclk))
> diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
> index 7e5809ba0dee..906436780347 100644
> --- a/drivers/iio/dac/stm32-dac-core.c
> +++ b/drivers/iio/dac/stm32-dac-core.c
> @@ -150,10 +150,7 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	rst = devm_reset_control_get_optional_exclusive(dev, NULL);
>  	if (rst) {
>  		if (IS_ERR(rst)) {
> -			ret = PTR_ERR(rst);
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "reset get failed, %d\n", ret);
> -
> +			ret = dev_err_probe(dev, PTR_ERR(rst), "reset get failed\n");
>  			goto err_hw_stop;
>  		}
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
