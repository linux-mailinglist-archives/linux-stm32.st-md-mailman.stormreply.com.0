Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059A15FFC5
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Feb 2020 19:41:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A567C36B0B;
	Sat, 15 Feb 2020 18:41:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB75C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Feb 2020 18:41:41 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94AAC2072D;
 Sat, 15 Feb 2020 18:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581792100;
 bh=BjBazr4WmmuTjxM5m3H0niFodBZruveqbCGfq9sC65Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=djgmAQXjqo+MlqzTZc00spUUBrsvrHJZoZRFnHI9BzjfTLivfrp5FNipSdfQfqJLi
 BqANi0V7cfltMJT0voJbWwGrIDwFYflw/eT7iFq6/Z8C/njlTvZQT2zhYZc4DWPJlo
 m2oCHozWKKl/O/5UqGl+ElpKIcR14X8IyJDeTu7w=
Date: Sat, 15 Feb 2020 18:41:35 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200215184135.10af9907@archlinux>
In-Reply-To: <1581698795-437-1-git-send-email-fabrice.gasnier@st.com>
References: <1581698795-437-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: trigger: stm32-timer: disable master
 mode when stopping
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

On Fri, 14 Feb 2020 17:46:35 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Master mode should be disabled when stopping. This mainly impacts
> possible other use-case after timer has been stopped. Currently,
> master mode remains set (from start routine).
> 
> Fixes: 6fb34812c2a2 ("iio: stm32 trigger: Add support for TRGO2 triggers")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
I 'think' this is tangential to the other changes to this driver recently
and you seem to have prepared this against current mailine.

Hence applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 2e0d32a..2f82e8c 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -161,7 +161,8 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  	return 0;
>  }
>  
> -static void stm32_timer_stop(struct stm32_timer_trigger *priv)
> +static void stm32_timer_stop(struct stm32_timer_trigger *priv,
> +			     struct iio_trigger *trig)
>  {
>  	u32 ccer, cr1;
>  
> @@ -179,6 +180,12 @@ static void stm32_timer_stop(struct stm32_timer_trigger *priv)
>  	regmap_write(priv->regmap, TIM_PSC, 0);
>  	regmap_write(priv->regmap, TIM_ARR, 0);
>  
> +	/* Force disable master mode */
> +	if (stm32_timer_is_trgo2_name(trig->name))
> +		regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS2, 0);
> +	else
> +		regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS, 0);
> +
>  	/* Make sure that registers are updated */
>  	regmap_update_bits(priv->regmap, TIM_EGR, TIM_EGR_UG, TIM_EGR_UG);
>  }
> @@ -197,7 +204,7 @@ static ssize_t stm32_tt_store_frequency(struct device *dev,
>  		return ret;
>  
>  	if (freq == 0) {
> -		stm32_timer_stop(priv);
> +		stm32_timer_stop(priv, trig);
>  	} else {
>  		ret = stm32_timer_start(priv, trig, freq);
>  		if (ret)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
