Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF67F32FC10
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Mar 2021 17:50:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8404FC57B7C;
	Sat,  6 Mar 2021 16:50:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30AFCC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Mar 2021 16:49:59 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3932764FE9;
 Sat,  6 Mar 2021 16:49:56 +0000 (UTC)
Date: Sat, 6 Mar 2021 16:49:49 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210306164949.2d59b5ff@archlinux>
In-Reply-To: <YEAeyyJ+GH10ep7S@shinobu>
References: <1614793789-10346-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YEAeyyJ+GH10ep7S@shinobu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
 miss-alignment with reload register
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

On Thu, 4 Mar 2021 08:42:03 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> On Wed, Mar 03, 2021 at 06:49:49PM +0100, Fabrice Gasnier wrote:
> > Ceiling value may be miss-aligned with what's actually configured into the
> > ARR register. This is seen after probe as currently the ARR value is zero,
> > whereas ceiling value is set to the maximum. So:
> > - reading ceiling reports zero
> > - in case the counter gets enabled without any prior configuration,
> >   it won't count.
> > - in case the function gets set by the user 1st, (priv->ceiling) is used.
> > 
> > Fix it by getting rid of the cached "priv->ceiling" variable. Rather use
> > the ARR register value directly by using regmap read or write when needed.
> > There should be no drawback on performance as priv->ceiling isn't used in
> > performance critical path.
> > There's also no point in writing ARR while setting function (sms), so
> > it can be safely removed.
> > 
> > Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
Note, I've dropped the blank line here. Fixes is part of the tag block.
> > 
> > Suggested-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>  
> 
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

applied to the fixes-togreg branch of iio.git and marked for stable.
Given both this and previous are marked such they should get picked
up fine even without the clean cross reference.

Jonathan
> 
> > ---
> > Note: this applies on top of:
> > - "counter: stm32-timer-cnt: fix ceiling write max value"  
> 
> Note, if your patch requires prerequisite patches, please provide the
> `git patch-id --stable` patch ID for it; this helps make sure the
> patches are applied in the correct order. You can have `git
> format-patch` generate this automatically for you by using the `--base`
> option:
> https://git-scm.com/docs/git-format-patch#_base_tree_information
> 
> William Breathitt Gray
> 
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> > index 2295be3..75bc401 100644
> > --- a/drivers/counter/stm32-timer-cnt.c
> > +++ b/drivers/counter/stm32-timer-cnt.c
> > @@ -31,7 +31,6 @@ struct stm32_timer_cnt {
> >  	struct counter_device counter;
> >  	struct regmap *regmap;
> >  	struct clk *clk;
> > -	u32 ceiling;
> >  	u32 max_arr;
> >  	bool enabled;
> >  	struct stm32_timer_regs bak;
> > @@ -75,8 +74,10 @@ static int stm32_count_write(struct counter_device *counter,
> >  			     const unsigned long val)
> >  {
> >  	struct stm32_timer_cnt *const priv = counter->priv;
> > +	u32 ceiling;
> >  
> > -	if (val > priv->ceiling)
> > +	regmap_read(priv->regmap, TIM_ARR, &ceiling);
> > +	if (val > ceiling)
> >  		return -EINVAL;
> >  
> >  	return regmap_write(priv->regmap, TIM_CNT, val);
> > @@ -138,10 +139,6 @@ static int stm32_count_function_set(struct counter_device *counter,
> >  
> >  	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN, 0);
> >  
> > -	/* TIMx_ARR register shouldn't be buffered (ARPE=0) */
> > -	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
> > -	regmap_write(priv->regmap, TIM_ARR, priv->ceiling);
> > -
> >  	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
> >  
> >  	/* Make sure that registers are updated */
> > @@ -199,7 +196,6 @@ static ssize_t stm32_count_ceiling_write(struct counter_device *counter,
> >  	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
> >  	regmap_write(priv->regmap, TIM_ARR, ceiling);
> >  
> > -	priv->ceiling = ceiling;
> >  	return len;
> >  }
> >  
> > @@ -374,7 +370,6 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
> >  
> >  	priv->regmap = ddata->regmap;
> >  	priv->clk = ddata->clk;
> > -	priv->ceiling = ddata->max_arr;
> >  	priv->max_arr = ddata->max_arr;
> >  
> >  	priv->counter.name = dev_name(dev);
> > -- 
> > 2.7.4
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
