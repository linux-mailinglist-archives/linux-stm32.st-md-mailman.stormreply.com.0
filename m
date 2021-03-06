Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87E32FC07
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Mar 2021 17:47:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D6F9C57B7C;
	Sat,  6 Mar 2021 16:47:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34BCFC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Mar 2021 16:47:36 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0FAB64FE4;
 Sat,  6 Mar 2021 16:47:33 +0000 (UTC)
Date: Sat, 6 Mar 2021 16:47:30 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210306164730.61043167@archlinux>
In-Reply-To: <YD5SLrdttn+95M7N@shinobu>
References: <1614696235-24088-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YD5SLrdttn+95M7N@shinobu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mcoquelin.stm32@gmail.com, david@lechnology.com, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
	write max value
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

On Tue, 2 Mar 2021 23:56:46 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> On Tue, Mar 02, 2021 at 03:43:55PM +0100, Fabrice Gasnier wrote:
> > The ceiling value isn't checked before writing it into registers. The user
> > could write a value higher than the counter resolution (e.g. 16 or 32 bits
> > indicated by max_arr). This makes most significant bits to be truncated.
> > Fix it by checking the max_arr to report a range error [1] to the user.
> > 
> > Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
> > 
> > [1] https://lkml.org/lkml/2021/2/12/358
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>  
> 
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Applied to the fixes-togreg branch of iio.git and marked for stable.

thanks

Jonathan
> 
> Side question: if priv->ceiling is tracking the current ceiling
> configuration, would it make sense to change stm32_count_ceiling_read()
> to print the value of priv->ceiling instead of doing a regmap_read()
> call?
> 
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> > index ef2a974..2cf0c05 100644
> > --- a/drivers/counter/stm32-timer-cnt.c
> > +++ b/drivers/counter/stm32-timer-cnt.c
> > @@ -32,6 +32,7 @@ struct stm32_timer_cnt {
> >  	struct regmap *regmap;
> >  	struct clk *clk;
> >  	u32 ceiling;
> > +	u32 max_arr;
> >  	bool enabled;
> >  	struct stm32_timer_regs bak;
> >  };
> > @@ -185,6 +186,9 @@ static ssize_t stm32_count_ceiling_write(struct counter_device *counter,
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (ceiling > priv->max_arr)
> > +		return -ERANGE;
> > +
> >  	/* TIMx_ARR register shouldn't be buffered (ARPE=0) */
> >  	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
> >  	regmap_write(priv->regmap, TIM_ARR, ceiling);
> > @@ -360,6 +364,7 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
> >  	priv->regmap = ddata->regmap;
> >  	priv->clk = ddata->clk;
> >  	priv->ceiling = ddata->max_arr;
> > +	priv->max_arr = ddata->max_arr;
> >  
> >  	priv->counter.name = dev_name(dev);
> >  	priv->counter.parent = dev;
> > -- 
> > 2.7.4
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
