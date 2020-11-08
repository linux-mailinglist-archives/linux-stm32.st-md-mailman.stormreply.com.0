Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0DF2AABDC
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 16:18:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7C1AC3FAE2;
	Sun,  8 Nov 2020 15:18:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C873AC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Nov 2020 15:18:35 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BECD206B2;
 Sun,  8 Nov 2020 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604848714;
 bh=0CKqtqq+aeOYU19z0fE06Ud/SoL1fEHH0qhlYS0YDvA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q9I7aJ5FbsgvzNIO+z+3NEbam63dMAi7KBjxsSj5vfVcm4uc9lcktJmnH7JHQ9noV
 q7Pip2DbokpPTkthZV87efexmfNYuhUWO2FYwR/Y2ZTu3Qj7d+rZ6NirYkDD7QQOAd
 6mnaOyVj4H/j+8PnbUxlJUOd0TwdrqqiOykqmhCU=
Date: Sun, 8 Nov 2020 15:18:35 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20201108151835.5d78ebca@archlinux>
In-Reply-To: <1604681846-31234-1-git-send-email-fabrice.gasnier@st.com>
References: <1604681846-31234-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: adapt clock duty
 cycle for proper operation
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

On Fri, 6 Nov 2020 17:57:26 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> For proper operation, STM32 ADC should be used with a clock duty cycle
> of 50%, in the range of 49% to 51%. Depending on the clock tree, divider
> can be used in case clock duty cycle is out of this range.
> In case clk_get_scaled_duty_cycle() returns an error, kindly apply a
> divider by default (don't make the probe fail).
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Hi Fabrice,

This sounds like it's a fix for a situation in which the device is not
currently working?  If so, please let me know a fixes tag.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc-core.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index cd870c0..d64a9e8 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -202,7 +202,7 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
>  {
>  	u32 ckmode, presc, val;
>  	unsigned long rate;
> -	int i, div;
> +	int i, div, duty;
>  
>  	/* stm32h7 bus clock is common for all ADC instances (mandatory) */
>  	if (!priv->bclk) {
> @@ -226,6 +226,11 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
>  			return -EINVAL;
>  		}
>  
> +		/* If duty is an error, kindly use at least /2 divider */
> +		duty = clk_get_scaled_duty_cycle(priv->aclk, 100);
> +		if (duty < 0)
> +			dev_warn(&pdev->dev, "adc clock duty: %d\n", duty);
> +
>  		for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
>  			ckmode = stm32h7_adc_ckmodes_spec[i].ckmode;
>  			presc = stm32h7_adc_ckmodes_spec[i].presc;
> @@ -234,6 +239,13 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
>  			if (ckmode)
>  				continue;
>  
> +			/*
> +			 * For proper operation, clock duty cycle range is 49%
> +			 * to 51%. Apply at least /2 prescaler otherwise.
> +			 */
> +			if (div == 1 && (duty < 49 || duty > 51))
> +				continue;
> +
>  			if ((rate / div) <= priv->max_clk_rate)
>  				goto out;
>  		}
> @@ -246,6 +258,10 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
>  		return -EINVAL;
>  	}
>  
> +	duty = clk_get_scaled_duty_cycle(priv->bclk, 100);
> +	if (duty < 0)
> +		dev_warn(&pdev->dev, "bus clock duty: %d\n", duty);
> +
>  	for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
>  		ckmode = stm32h7_adc_ckmodes_spec[i].ckmode;
>  		presc = stm32h7_adc_ckmodes_spec[i].presc;
> @@ -254,6 +270,9 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
>  		if (!ckmode)
>  			continue;
>  
> +		if (div == 1 && (duty < 49 || duty > 51))
> +			continue;
> +
>  		if ((rate / div) <= priv->max_clk_rate)
>  			goto out;
>  	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
