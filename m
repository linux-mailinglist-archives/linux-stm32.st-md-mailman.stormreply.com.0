Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D57517CF07
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Mar 2020 16:21:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 262A7C36B0B;
	Sat,  7 Mar 2020 15:21:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF1E4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Mar 2020 15:21:35 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CCB020674;
 Sat,  7 Mar 2020 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583594494;
 bh=zXhA3RoLELcyY2UKL8bcqbSijN27udDZjliB55Zc+PM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eH3omeFiyPeHhZ9l62cNGCJmGil5/S2xcf4vhQoBUjPoOWVnsBYBk4gShULYCrSod
 IdEaczUOrw4cfLWzoM4VAiNV9Vswma2J6qsiaghim6DUNPRFrFW0JuMxPiGK9mCOBn
 vq8r9qma/eAE8YbYkWUXx3i6r9W5gPVV2ZZaRZ1o=
Date: Sat, 7 Mar 2020 15:21:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200307152127.404aba78@archlinux>
In-Reply-To: <1583247585-16698-3-git-send-email-fabrice.gasnier@st.com>
References: <1583247585-16698-1-git-send-email-fabrice.gasnier@st.com>
 <1583247585-16698-3-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] iio: trigger: stm32-timer: add power
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

On Tue, 3 Mar 2020 15:59:45 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Add suspend/resume PM sleep ops to stm32-timer-trigger driver.
> Register contents may be lost depending on low power modes.
> When going to low power, enforce the timer isn't active. Gracefully
> restore its state upon resume in case it's been left enabled prior to
> suspend.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Seems sensible. Applied,

Thanks,

Jonathan

> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 63 +++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 32e1249..37545a8 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -75,6 +75,15 @@ static const void *stm32h7_valids_table[][MAX_VALIDS] = {
>  	{ }, /* timer 17 */
>  };
>  
> +struct stm32_timer_trigger_regs {
> +	u32 cr1;
> +	u32 cr2;
> +	u32 psc;
> +	u32 arr;
> +	u32 cnt;
> +	u32 smcr;
> +};
> +
>  struct stm32_timer_trigger {
>  	struct device *dev;
>  	struct regmap *regmap;
> @@ -86,6 +95,7 @@ struct stm32_timer_trigger {
>  	bool has_trgo2;
>  	struct mutex lock; /* concurrent sysfs configuration */
>  	struct list_head tr_list;
> +	struct stm32_timer_trigger_regs bak;
>  };
>  
>  struct stm32_timer_trigger_cfg {
> @@ -812,6 +822,58 @@ static int stm32_timer_trigger_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int __maybe_unused stm32_timer_trigger_suspend(struct device *dev)
> +{
> +	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
> +
> +	/* Only take care of enabled timer: don't disturb other MFD child */
> +	if (priv->enabled) {
> +		/* Backup registers that may get lost in low power mode */
> +		regmap_read(priv->regmap, TIM_CR1, &priv->bak.cr1);
> +		regmap_read(priv->regmap, TIM_CR2, &priv->bak.cr2);
> +		regmap_read(priv->regmap, TIM_PSC, &priv->bak.psc);
> +		regmap_read(priv->regmap, TIM_ARR, &priv->bak.arr);
> +		regmap_read(priv->regmap, TIM_CNT, &priv->bak.cnt);
> +		regmap_read(priv->regmap, TIM_SMCR, &priv->bak.smcr);
> +
> +		/* Disable the timer */
> +		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN, 0);
> +		clk_disable(priv->clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused stm32_timer_trigger_resume(struct device *dev)
> +{
> +	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (priv->enabled) {
> +		ret = clk_enable(priv->clk);
> +		if (ret)
> +			return ret;
> +
> +		/* restore master/slave modes */
> +		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
> +		regmap_write(priv->regmap, TIM_CR2, priv->bak.cr2);
> +
> +		/* restore sampling_frequency (trgo / trgo2 triggers) */
> +		regmap_write(priv->regmap, TIM_PSC, priv->bak.psc);
> +		regmap_write(priv->regmap, TIM_ARR, priv->bak.arr);
> +		regmap_write(priv->regmap, TIM_CNT, priv->bak.cnt);
> +
> +		/* Also re-enables the timer */
> +		regmap_write(priv->regmap, TIM_CR1, priv->bak.cr1);
> +	}
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(stm32_timer_trigger_pm_ops,
> +			 stm32_timer_trigger_suspend,
> +			 stm32_timer_trigger_resume);
> +
>  static const struct stm32_timer_trigger_cfg stm32_timer_trg_cfg = {
>  	.valids_table = valids_table,
>  	.num_valids_table = ARRAY_SIZE(valids_table),
> @@ -840,6 +902,7 @@ static struct platform_driver stm32_timer_trigger_driver = {
>  	.driver = {
>  		.name = "stm32-timer-trigger",
>  		.of_match_table = stm32_trig_of_match,
> +		.pm = &stm32_timer_trigger_pm_ops,
>  	},
>  };
>  module_platform_driver(stm32_timer_trigger_driver);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
