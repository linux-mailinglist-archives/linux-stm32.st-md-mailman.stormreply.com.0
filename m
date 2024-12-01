Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E15CA9DF59D
	for <lists+linux-stm32@lfdr.de>; Sun,  1 Dec 2024 13:55:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85C73C6B47E;
	Sun,  1 Dec 2024 12:55:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F07FC03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Dec 2024 12:55:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BFA05C578F;
 Sun,  1 Dec 2024 12:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29958C4CECF;
 Sun,  1 Dec 2024 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733057728;
 bh=+wExzTFQM8nAve73xnTS4Dc8Iv9ma5WmvnqKO14ZKkw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EjKm+X5TsDeRu2LYkynq7HbezMY9D1Jk2/dOPBpl6uEJBT1tzmMNhIhhegG+hJv9u
 DAlafUYOu0MoHnwTMutTGPsYZIWDeyxBl3jZ+wugs3WZlf8bfSnedW8Hfu2WhhnP3m
 ydKWaRVxMLcnw5rRpW808yU0ijQ0lwjfbxHIxiVQ2zEpecJoJibgbL6uVhEvA5mh48
 88Gx67Fa/PI26uGXTcEa6klm4/OUi+JKGe4OOkXcVoxdvU855bxs6YSyua9HY+6liM
 Ya8cgOu1xCPZem0yE9MDAc/GBg/VB3pDI8SevKl6WqwEmWU+MRc34/mMGfhNt0apLz
 fbFYs6Bhf9UkA==
Date: Sun, 1 Dec 2024 12:55:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Message-ID: <20241201125518.29373281@jic23-huawei>
In-Reply-To: <20241123220149.30655-1-jiashengjiangcool@gmail.com>
References: <20241123220149.30655-1-jiashengjiangcool@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 fabrice.gasnier@st.com, linux-iio@vger.kernel.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, dlechner@baylibre.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] iio: trigger: stm32-timer-trigger: Add
 check for clk_enable()
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

On Sat, 23 Nov 2024 22:01:49 +0000
Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:

> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Applied.

thanks,

Jonathan

> ---
> Changelog:
> 
> v4 -> v5:
> 
> 1. Add a default in the switch.
> 
> v3 -> v4:
> 
> 1. Place braces around the case body.
> 
> v2 -> v3:
> 
> 1. Use guard() to simplify the resulting code.
> 
> v1 -> v2:
> 
> 1. Remove unsuitable dev_err_probe().
> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 49 ++++++++++++++---------
>  1 file changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 0684329956d9..67528ec7d0a5 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -119,7 +119,7 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  			     unsigned int frequency)
>  {
>  	unsigned long long prd, div;
> -	int prescaler = 0;
> +	int prescaler = 0, ret;
>  	u32 ccer;
>  
>  	/* Period and prescaler values depends of clock rate */
> @@ -150,10 +150,12 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  	if (ccer & TIM_CCER_CCXE)
>  		return -EBUSY;
>  
> -	mutex_lock(&priv->lock);
> +	guard(mutex)(&priv->lock);
>  	if (!priv->enabled) {
>  		priv->enabled = true;
> -		clk_enable(priv->clk);
> +		ret = clk_enable(priv->clk);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	regmap_write(priv->regmap, TIM_PSC, prescaler);
> @@ -173,7 +175,6 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  
>  	/* Enable controller */
>  	regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> -	mutex_unlock(&priv->lock);
>  
>  	return 0;
>  }
> @@ -307,7 +308,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
>  	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
>  	struct iio_trigger *trig = to_iio_trigger(dev);
>  	u32 mask, shift, master_mode_max;
> -	int i;
> +	int i, ret;
>  
>  	if (stm32_timer_is_trgo2_name(trig->name)) {
>  		mask = TIM_CR2_MMS2;
> @@ -322,15 +323,16 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
>  	for (i = 0; i <= master_mode_max; i++) {
>  		if (!strncmp(master_mode_table[i], buf,
>  			     strlen(master_mode_table[i]))) {
> -			mutex_lock(&priv->lock);
> +			guard(mutex)(&priv->lock);
>  			if (!priv->enabled) {
>  				/* Clock should be enabled first */
>  				priv->enabled = true;
> -				clk_enable(priv->clk);
> +				ret = clk_enable(priv->clk);
> +				if (ret)
> +					return ret;
>  			}
>  			regmap_update_bits(priv->regmap, TIM_CR2, mask,
>  					   i << shift);
> -			mutex_unlock(&priv->lock);
>  			return len;
>  		}
>  	}
> @@ -482,6 +484,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				   int val, int val2, long mask)
>  {
>  	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
> +	int ret;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> @@ -491,12 +494,14 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  		/* fixed scale */
>  		return -EINVAL;
>  
> -	case IIO_CHAN_INFO_ENABLE:
> -		mutex_lock(&priv->lock);
> +	case IIO_CHAN_INFO_ENABLE: {
> +		guard(mutex)(&priv->lock);
>  		if (val) {
>  			if (!priv->enabled) {
>  				priv->enabled = true;
> -				clk_enable(priv->clk);
> +				ret = clk_enable(priv->clk);
> +				if (ret)
> +					return ret;
>  			}
>  			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>  		} else {
> @@ -506,11 +511,12 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				clk_disable(priv->clk);
>  			}
>  		}
> -		mutex_unlock(&priv->lock);
> +
>  		return 0;
>  	}
> -
> -	return -EINVAL;
> +	default:
> +		return -EINVAL;
> +	}
>  }
>  
>  static int stm32_counter_validate_trigger(struct iio_dev *indio_dev,
> @@ -601,7 +607,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>  				 unsigned int mode)
>  {
>  	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
> -	int sms = stm32_enable_mode2sms(mode);
> +	int sms = stm32_enable_mode2sms(mode), ret;
>  
>  	if (sms < 0)
>  		return sms;
> @@ -609,12 +615,15 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>  	 * Triggered mode sets CEN bit automatically by hardware. So, first
>  	 * enable counter clock, so it can use it. Keeps it in sync with CEN.
>  	 */
> -	mutex_lock(&priv->lock);
> -	if (sms == 6 && !priv->enabled) {
> -		clk_enable(priv->clk);
> -		priv->enabled = true;
> +	scoped_guard(mutex, &priv->lock) {
> +		if (sms == 6 && !priv->enabled) {
> +			ret = clk_enable(priv->clk);
> +			if (ret)
> +				return ret;
> +
> +			priv->enabled = true;
> +		}
>  	}
> -	mutex_unlock(&priv->lock);
>  
>  	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
