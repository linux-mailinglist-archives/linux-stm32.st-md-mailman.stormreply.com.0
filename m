Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50220757F73
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 16:29:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17A1EC6B442;
	Tue, 18 Jul 2023 14:29:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7737EC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 14:29:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qLlhd-0006wE-C5; Tue, 18 Jul 2023 16:29:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qLlhc-000OTD-NP; Tue, 18 Jul 2023 16:29:24 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qLlhc-000Ero-17;
 Tue, 18 Jul 2023 16:29:24 +0200
Message-ID: <d3df6f565421576bbf06140942593cd4d0af712e.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 18 Jul 2023 16:29:24 +0200
In-Reply-To: <ZLY_gER7FeEB07cw@orome>
References: <20230608-pwm-stm32-get-state-v1-1-db7e58a7461b@pengutronix.de>
 <ZLY_gER7FeEB07cw@orome>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Implement .get_state()
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

Hi Thierry,

On Di, 2023-07-18 at 09:30 +0200, Thierry Reding wrote:
> On Thu, Jun 08, 2023 at 04:06:02PM +0200, Philipp Zabel wrote:
> > Stop stm32_pwm_detect_channels() from disabling all channels and count
> > the number of enabled PWMs to keep the clock running. Implement the
> > &pwm_ops->get_state callback so drivers can inherit PWM state set by
> > the bootloader.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Make the necessary changes to allow inheriting PWM state set by the
> > bootloader, for example to avoid flickering with a pre-enabled PWM
> > backlight.
> > ---
> >  drivers/pwm/pwm-stm32.c | 75 ++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 59 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> > index 62e397aeb9aa..e0677c954bdf 100644
> > --- a/drivers/pwm/pwm-stm32.c
> > +++ b/drivers/pwm/pwm-stm32.c
> > @@ -52,6 +52,21 @@ static u32 active_channels(struct stm32_pwm *dev)
> >  	return ccer & TIM_CCER_CCXE;
> >  }
> >  
> > +static int read_ccrx(struct stm32_pwm *dev, int ch, u32 *value)
> > +{
> > +	switch (ch) {
> > +	case 0:
> > +		return regmap_read(dev->regmap, TIM_CCR1, value);
> > +	case 1:
> > +		return regmap_read(dev->regmap, TIM_CCR2, value);
> > +	case 2:
> > +		return regmap_read(dev->regmap, TIM_CCR3, value);
> > +	case 3:
> > +		return regmap_read(dev->regmap, TIM_CCR4, value);
> > +	}
> > +	return -EINVAL;
> > +}
> 
> Looking at the register definitions we should be able to replace this
> with a single line and parameterize based on channel.
> 
> I realize you probably just copied from write_ccrx(), but might as well
> improve this while at it. Could be a separate patch, though.
> 
> Also, ch should be unsigned int since it comes from pwm->hwpwm.

Thank you, I'll make both changes separately.

> >  static int write_ccrx(struct stm32_pwm *dev, int ch, u32 value)
> >  {
> >  	switch (ch) {
> > @@ -486,9 +501,40 @@ static int stm32_pwm_apply_locked(struct pwm_chip *chip, struct pwm_device *pwm,
> >  	return ret;
> >  }
> >  
> > +static int stm32_pwm_get_state(struct pwm_chip *chip,
> > +			       struct pwm_device *pwm, struct pwm_state *state)
> > +{
> > +	struct stm32_pwm *priv = to_stm32_pwm_dev(chip);
> > +	int ch = pwm->hwpwm;
> 
> This should reflect the type of pwm->hwpwm.

Ok.

> > +	unsigned long rate;
> > +	u32 ccer, psc, arr, ccr;
> > +	u64 dty, prd;
> > +	int ret;
> > +
> > +	ret = regmap_read(priv->regmap, TIM_CCER, &ccer);
> > +	if (ret)
> > +		return ret;
> > +
> > +	state->enabled = ccer & (TIM_CCER_CC1E << (ch * 4));
> > +	state->polarity = (ccer & (TIM_CCER_CC1P << (ch * 4))) ?
> > +			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
> > +	regmap_read(priv->regmap, TIM_PSC, &psc);
> > +	regmap_read(priv->regmap, TIM_ARR, &arr);
> 
> We should probably check regmap_read() consistently here.

Will do.

I'll also add locking so we can't PSC/ARR/CCRx in an in-between state.

> > +	read_ccrx(priv, ch, &ccr);
> > +	rate = clk_get_rate(priv->clk);
> > +
> > +	prd = (u64)NSEC_PER_SEC * (psc + 1) * (arr + 1);
> > +	state->period = DIV_ROUND_UP_ULL(prd, rate);
> > +	dty = (u64)NSEC_PER_SEC * (psc + 1) * ccr;
> > +	state->duty_cycle = DIV_ROUND_UP_ULL(dty, rate);
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct pwm_ops stm32pwm_ops = {
> >  	.owner = THIS_MODULE,
> >  	.apply = stm32_pwm_apply_locked,
> > +	.get_state = stm32_pwm_get_state,
> >  	.capture = IS_ENABLED(CONFIG_DMA_ENGINE) ? stm32_pwm_capture : NULL,
> >  };
> >  
> > @@ -579,30 +625,22 @@ static void stm32_pwm_detect_complementary(struct stm32_pwm *priv)
> >  	priv->have_complementary_output = (ccer != 0);
> >  }
> >  
> > -static int stm32_pwm_detect_channels(struct stm32_pwm *priv)
> > +static int stm32_pwm_detect_channels(struct stm32_pwm *priv, int *n_enabled)
> 
> unsigned int * for n_enabled.

Ok.

> >  {
> > -	u32 ccer;
> > -	int npwm = 0;
> > +	u32 ccer, ccer_backup;
> > +	int npwm;
> 
> Also make this and the return value unsigned int while at it. These can
> never be negative.

Thanks, I'll split this out into a separate patch.

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
