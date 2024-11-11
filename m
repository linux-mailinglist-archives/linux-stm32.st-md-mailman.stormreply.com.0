Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1FC9C4618
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 20:46:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4180FC78F67;
	Mon, 11 Nov 2024 19:46:06 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 648A9C78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 19:45:59 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-28896d9d9deso2271706fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 11:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731354358; x=1731959158;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M+UNXPvFiJYKdozi2bLmtL/MfRUPw96dDHh4Di4Qg/E=;
 b=bcly1IkqyoruLBkXASc1+T+LME3xSXhUYXtKFMt95rK4tsk13UtD4FnuSw2V0FkQiJ
 HhwLzlUmhQAClD2OvoNi4ZYcdBSZknIJ6pe0b0VTmTubSSJJ4EHp4oWJIaVXjmwGEFbT
 adGdJr01MFV2qyjvcPzi1eHYyyqinw8tvNvLmvLJwD7YHw6Vjo/EC3qw6xDMPxy8pWKr
 jJuQ/YaieemHcFUC9fow4KQ/GJNYmEEoD5F5A/8YfqwhUXkSPFppkCfOpQ0SiAKDZLPi
 uF0R7TtaHixZm7+6osF+7mzFb0LTe49MKZVeR60gb4KKghq9tce/sjVePcJ91oCSIzXS
 cE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731354358; x=1731959158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M+UNXPvFiJYKdozi2bLmtL/MfRUPw96dDHh4Di4Qg/E=;
 b=VKZNpV26iOIAIwHUlE8CSOagv6immGzzfRe9XO2PEaM2O7+SmWf8xWMe26S/mnx9e+
 R+zfIzZAu1oeV4B36i9x/WjA+n5g78bi87gwrpuoy5ajW1wEmg1+fXk1pb5zjwlnoQzW
 9CN8xXLNLhXrA4dj0DOmXavTPMMyg+TY1nQy5eUd9ViHgCHsc2FSeOaMmaq9DpYOBIY8
 xbDlksqcS4RaRttIut2DnQ/ht+eJ/HT/wPKqiP7YOgV8E9tU1l+/ZWE5wdmGHIT1bnK8
 wFxLnov+PcSJFwrfUwXdS3EiSIW2OVJPxIZusLfZFzgA9e7nbw3IqrluMrX91f8tZR2x
 dx+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVERkHOGEF7YsjaGqj2GbKoFqo+ZDhWAXwlZKU1yWhQNysG/rufyRugHFmIWXSomtpY9v296m/wJeXiZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwU0v2oLkLRrPw2dSIB6Oc/D8h/YCRUDjahQczzIxdJ26KGn3A/
 d5rGbkWVgH6wVedGBW8p18Ncxyj+tQDcu6TCh3oeN0H83rzlTwZFGYt6BZMbjFM=
X-Google-Smtp-Source: AGHT+IHzI2fm85aOJIz0hLFIb1FeDMozEBMTSyyRvlCuXW4txD+zMA10To4egPzgrYsuvVd5NCladQ==
X-Received: by 2002:a05:6870:7010:b0:287:b9:349 with SMTP id
 586e51a60fabf-295cd38c966mr165947fac.36.1731354358195; 
 Mon, 11 Nov 2024 11:45:58 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29546c8eb0fsm2940001fac.14.2024.11.11.11.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 11:45:56 -0800 (PST)
Message-ID: <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
Date: Mon, 11 Nov 2024 13:45:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>, jic23@kernel.org
References: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] iio: trigger: stm32-timer-trigger: Add
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

On 11/11/24 1:19 PM, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
> 
> v2 -> v3:
> 
> 1. Simplify code with cleanup helpers.
> 
> v1 -> v2:
> 
> 1. Remove unsuitable dev_err_probe().
> ---

...

> @@ -492,21 +495,25 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  		return -EINVAL;
>  
>  	case IIO_CHAN_INFO_ENABLE:
> -		mutex_lock(&priv->lock);
> -		if (val) {
> -			if (!priv->enabled) {
> -				priv->enabled = true;
> -				clk_enable(priv->clk);
> -			}
> -			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> -		} else {
> -			regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> -			if (priv->enabled) {
> -				priv->enabled = false;
> -				clk_disable(priv->clk);
> +
> +		scoped_guard(mutex, &priv->lock) {
> +			if (val) {
> +				if (!priv->enabled) {
> +					priv->enabled = true;
> +					ret = clk_enable(priv->clk);
> +					if (ret)
> +						return ret;
> +				}
> +				regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> +			} else {
> +				regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> +				if (priv->enabled) {
> +					priv->enabled = false;
> +					clk_disable(priv->clk);
> +				}
>  			}
>  		}
> -		mutex_unlock(&priv->lock);
> +		
>  		return 0;
>  	}


Another way to do this that avoids changing the indent
so much is placing braces around the case body like this.
This also avoids the compile error from using guard after
case directly.


 	case IIO_CHAN_INFO_ENABLE: {
		guard(mutex)(&priv->lock);

		if (val) {
			if (!priv->enabled) {
				priv->enabled = true;
				ret = clk_enable(priv->clk);
				if (ret)
					return ret;
			}
			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
		} else {
			regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
			if (priv->enabled) {
				priv->enabled = false;
				clk_disable(priv->clk);
			}
		}
		
 		return 0;
 	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
