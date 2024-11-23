Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267B9D698F
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Nov 2024 16:08:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC187C6DD9F;
	Sat, 23 Nov 2024 15:08:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D204FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2024 15:08:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3CE55C48EF;
 Sat, 23 Nov 2024 15:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548DFC4CECD;
 Sat, 23 Nov 2024 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732374496;
 bh=mV0DYgkf1CnqnfVd7iq3ygJgMJskcY+V1ypQ6J1wbnU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kbSj3ip+kaRWJybPm0YerFXgRKWPbUxyNOlWqPF9hZucBq4TIwJ1pJODwn42DZBAQ
 kTUbAWtjGmM3e270KmKubkZ0b4a9JH6G+OEp8AKzbxeszA/zdjM4BKNqhALK5EzhUp
 /SpKx9XRX3e7ll2dFaIbyzx91/fs2BBy5u5p8MPR2ANlYnAvyljVsHP91nAYoAZOKK
 0SzQEYwyUKxMXGPMtzLtfMclJ+MYQcKh58QSZYfVOLthrvFWdahA2+eCXLpZOuJt8K
 3oSOkbKWFsoWWnpyteSqBaajD7mI9SFOC1GhoodDzggAsqQLG6hOoys32PtkqI3eJr
 gNCxUFVt5qjSA==
Date: Sat, 23 Nov 2024 15:08:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Message-ID: <20241123150808.1426c6f8@jic23-huawei>
In-Reply-To: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
References: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 fabrice.gasnier@st.com, linux-iio@vger.kernel.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, dlechner@baylibre.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] iio: trigger: stm32-timer-trigger: Add
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

On Mon, 11 Nov 2024 22:23:10 +0000
Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:

> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Hi Jiasheng,


Should definitely mention the changes to use guard() to simplify
the resulting code.

One minor comment on the code inline. Otherwise looks good to me.

Thanks,

Jonathan

> ---
> Changelog:
> 
> v3 -> v4:
> 
> 1. Place braces around the case body.
> 
> v2 -> v3:
> 
> 1. Simplify code with cleanup helpers.
> 
> v1 -> v2:
> 
> 1. Remove unsuitable dev_err_probe().

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
> @@ -506,9 +511,10 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				clk_disable(priv->clk);
>  			}
>  		}
> -		mutex_unlock(&priv->lock);
> +
>  		return 0;
>  	}
Add a default for reasons David mentioned and it also makes it visually clear
that we expect to get in here for other cases but they are all errors.
	default:
		return -EINVAL;
> +	}
>  
And drop this return as unreachable.

>  	return -EINVAL;
>  }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
