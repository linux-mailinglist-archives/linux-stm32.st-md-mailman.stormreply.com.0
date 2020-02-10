Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF415819B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2020 18:46:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B1ECC36B0B;
	Mon, 10 Feb 2020 17:46:08 +0000 (UTC)
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65801C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 17:46:07 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id i190so3809308ywc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c1zhLfQHfrUfvkp0MTuGkuwB8y82vgQU4IfRGdXFd5k=;
 b=bVqj8QgM5OlikSgs9Kf4RXNCDtoJmQ8E9efAXgds9jlaEE8+UbeRTMgRb5fstC1Mhx
 k/uub/bsuUK6xPR8j7coolX+ew3ilVxeZCq31NwF6TXcA2Hb+LoyfERWncfohs0bkU8V
 WzGgCq76QV9mI4MUzvzifjm9XDvYFWfdfASEavK/AQmrfXaLldxGckLWZfEVqzJb11wM
 ujgBmMnXoXLnfrsQx+fmI9MSue6BDkhA7xo4fdq/IwQomihaNVIb7irhAhenqAd3NMz3
 SW28jXWBvrBDX+ft5xVZrOB4r+LSEAuyLMsSsdwdOaWorFAzJR9abp4BwrzfMFfhAWt6
 u5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1zhLfQHfrUfvkp0MTuGkuwB8y82vgQU4IfRGdXFd5k=;
 b=BGmvcLVprT5qL0TpLOA3QyclvZ52Et1Bjh2X+fsHRQs44AwY3gY5EjIbl2ADVKpr77
 3TKy8kyoXkA00wFcbKOpcgEl5gpYxrjrn1Wq5u6cpBcnaPLHgrHSk5FmAG7lnxlVOsko
 gqujzyGhplRBV25myd4Ohi3mhhoi7WyD+mgXa7FqcAURML9V1L9UxPWPrum3HprTSAh2
 /P2DhgkR0+P9aoB1M2YifY5UWWbj3YygKHz1Wy413KkbgRHjb4iA4EvCT4JYbzr6nRy7
 R4nFitdQ2n6ELCDn98j+D+GMlpHH9M5UrokXPrN6S4ni1/DbpQBEqaif43iZ/JPdVRw6
 aCog==
X-Gm-Message-State: APjAAAUxMjnjbBVs1o7EeKpWw7BANHLr4jdK4Hv2f34mLZ7zXmAmu60u
 nN0dbdk7H+R0B2YJTGL+pXs=
X-Google-Smtp-Source: APXvYqylUh8O1JaCDocqRa9z5ZfVTr6cLqiL1RjJNIIGfFN2TwYqpRxHFKwWH3DBkxpkZ9FGw44sOg==
X-Received: by 2002:a0d:cb54:: with SMTP id n81mr1817971ywd.375.1581356766107; 
 Mon, 10 Feb 2020 09:46:06 -0800 (PST)
Received: from icarus (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id m62sm530815ywb.107.2020.02.10.09.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 09:46:05 -0800 (PST)
Date: Mon, 10 Feb 2020 12:45:50 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200210174550.GA4626@icarus>
References: <1581355198-30428-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581355198-30428-1-git-send-email-fabrice.gasnier@st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: add power
	management support
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

On Mon, Feb 10, 2020 at 06:19:58PM +0100, Fabrice Gasnier wrote:
> Add suspend/resume PM sleep ops. When going to low power, enforce the
> counter isn't active. Gracefully restore its state upon resume in case
> it's been left enabled prior to suspend.
> 
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
> Changes in v2:
> - Don't refuse to suspend in case the counter has been left enabled.
>   Gracefully disable it and restore its state upon resume.
> ---
>  drivers/counter/stm32-timer-cnt.c | 63 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index 3eafcce..50496f4 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -12,6 +12,7 @@
>  #include <linux/iio/types.h>

Unrelated to your patch but it caught my eye: are iio headers necessary
for this file? I suspect they are not needed since this driver does not
make use of the IIO interface.

William Breathitt Gray

>  #include <linux/mfd/stm32-timers.h>
>  #include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  
>  #define TIM_CCMR_CCXS	(BIT(8) | BIT(0))
> @@ -20,11 +21,20 @@
>  #define TIM_CCER_MASK	(TIM_CCER_CC1P | TIM_CCER_CC1NP | \
>  			 TIM_CCER_CC2P | TIM_CCER_CC2NP)
>  
> +struct stm32_timer_regs {
> +	u32 cr1;
> +	u32 cnt;
> +	u32 smcr;
> +	u32 arr;
> +};
> +
>  struct stm32_timer_cnt {
>  	struct counter_device counter;
>  	struct regmap *regmap;
>  	struct clk *clk;
>  	u32 ceiling;
> +	bool enabled;
> +	struct stm32_timer_regs bak;
>  };
>  
>  /**
> @@ -224,6 +234,9 @@ static ssize_t stm32_count_enable_write(struct counter_device *counter,
>  			clk_disable(priv->clk);
>  	}
>  
> +	/* Keep enabled state to properly handle low power states */
> +	priv->enabled = enable;
> +
>  	return len;
>  }
>  
> @@ -358,10 +371,59 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
>  	priv->counter.num_signals = ARRAY_SIZE(stm32_signals);
>  	priv->counter.priv = priv;
>  
> +	platform_set_drvdata(pdev, priv);
> +
>  	/* Register Counter device */
>  	return devm_counter_register(dev, &priv->counter);
>  }
>  
> +static int __maybe_unused stm32_timer_cnt_suspend(struct device *dev)
> +{
> +	struct stm32_timer_cnt *priv = dev_get_drvdata(dev);
> +
> +	/* Only take care of enabled counter: don't disturb other MFD child */
> +	if (priv->enabled) {
> +		/* Backup registers that may get lost in low power mode */
> +		regmap_read(priv->regmap, TIM_SMCR, &priv->bak.smcr);
> +		regmap_read(priv->regmap, TIM_ARR, &priv->bak.arr);
> +		regmap_read(priv->regmap, TIM_CNT, &priv->bak.cnt);
> +		regmap_read(priv->regmap, TIM_CR1, &priv->bak.cr1);
> +
> +		/* Disable the counter */
> +		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN, 0);
> +		clk_disable(priv->clk);
> +	}
> +
> +	return pinctrl_pm_select_sleep_state(dev);
> +}
> +
> +static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
> +{
> +	struct stm32_timer_cnt *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pinctrl_pm_select_default_state(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (priv->enabled) {
> +		clk_enable(priv->clk);
> +
> +		/* Restore registers that may have been lost */
> +		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
> +		regmap_write(priv->regmap, TIM_ARR, priv->bak.arr);
> +		regmap_write(priv->regmap, TIM_CNT, priv->bak.cnt);
> +
> +		/* Also re-enables the counter */
> +		regmap_write(priv->regmap, TIM_CR1, priv->bak.cr1);
> +	}
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
> +			 stm32_timer_cnt_resume);
> +
>  static const struct of_device_id stm32_timer_cnt_of_match[] = {
>  	{ .compatible = "st,stm32-timer-counter", },
>  	{},
> @@ -373,6 +435,7 @@ static struct platform_driver stm32_timer_cnt_driver = {
>  	.driver = {
>  		.name = "stm32-timer-counter",
>  		.of_match_table = stm32_timer_cnt_of_match,
> +		.pm = &stm32_timer_cnt_pm_ops,
>  	},
>  };
>  module_platform_driver(stm32_timer_cnt_driver);
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
