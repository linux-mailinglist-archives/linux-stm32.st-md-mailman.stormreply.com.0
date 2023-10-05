Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9F7B9BD1
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 10:30:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F293C6C831;
	Thu,  5 Oct 2023 08:30:35 +0000 (UTC)
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D1AFC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 08:30:34 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id EFC201007F6; Thu,  5 Oct 2023 09:30:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1696494632; bh=yTqM0lOviMpVtY3gEC2fnjg+lpnZmaa/xqOOO1oFjzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hM4/6PU/BVCUmsjcFfLAZHOdsLJZBPi+IERfvAziz3nfnEK4C7KS4IvaOhQF74oUa
 pm/jySTmFQfMxdTKCSDifYiz+6AUgqHrAipeZA/gPtdfM+zALHVTx2Zc3etj0F8Uvj
 Z+6+P3UfUXB4S+dg6826xd+d4QJrSOPKQf4pOCA+1cpbIPfgjobt3K8v8W29gu2XFf
 EozsFhCZzdMkmYxxlZzWuHs3+awRG8hRctGYRXzu5lggSBZ9V8y5NfKjZIp5utFREo
 m8TSihVOCaoYFaigu8xqW/v53d8h8T2slqaY2mkHTgDaQkYnFk+bb6M8VNQI8mAzW8
 t0IV4IH911NYA==
Date: Thu, 5 Oct 2023 09:30:32 +0100
From: Sean Young <sean@mess.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZR50KCVNzhlLooLW@gofer.mess.org>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: make it possible to apply pwm
 changes in atomic context
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Uwe,

On Wed, Oct 04, 2023 at 11:59:20AM +0200, Uwe Kleine-K=F6nig wrote:
> On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index dc66e3405bf5..d9679ae5b2be 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -505,7 +505,7 @@ int pwm_apply_state(struct pwm_device *pwm, const s=
truct pwm_state *state)
> >  	 * is a bad idea. So make it explicit that calling this function might
> >  	 * sleep.
> >  	 */
> > -	might_sleep();
> > +	might_sleep_if(pwm_can_sleep(pwm));
> >  =

> >  	if (!pwm || !state || !state->period ||
> >  	    state->duty_cycle > state->period)
> =

> I'd like to have a mechanism to catch drivers that missed to set
> .can_sleep. The best idea I currently have for that is to disable
> preemption if IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_can_sleep(pwm) while
> .apply() is running.

If we have pwm_apply_state_atomic(), then CONFIG_DEBUG_ATOMIC_SLEEP will
catch them, but only in that code path of course.

How about using non_block_start() and non_block_end() if can_sleep is
not set?

> > diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> > index b7c6045c5d08..b8b9392844e9 100644
> > --- a/drivers/pwm/pwm-fsl-ftm.c
> > +++ b/drivers/pwm/pwm-fsl-ftm.c
> > @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *pd=
ev)
> >  =

> >  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
> >  	fpc->chip.dev =3D &pdev->dev;
> > +	fpc->chip.can_sleep =3D true;
> =

> As .apply() being callable in non-sleepable context only depends on
> .apply() I think a better place for this property is in struct pwm_ops.

That makes sense.

> Also I wonder if the distinction between atomic and sleeping
> pwm_state_apply() should be more explicit. For GPIOs you have a sleeping
> variant gpiod_set_value_cansleep() that allows to immediately determine
> the intended context in the caller. This would allow that programming
> a PWM stays a preemption point (if possible/desired) even if the
> underlying hardware/driver is atomic. To not have to touch all consumer
> drivers, maybe the pair for pwm should better be
> =

> 	pwm_apply_state()
> 	pwm_apply_state_atomic()

Do we need pwm_config_atomic(), pwm_enable_atomic(), and pwm_disable_atomic=
()
too? These are just convenience functions, so we can probably do without th=
em.

> instead of a "cansleep" suffix for the sleeping variant? Or maybe it's
> better to accept touching all consumer drivers to get semantics similar
> to gpio? I couldn't decide quickly what I really like better here, so
> that's your chance to comment and influence the outcome :-)

If you expect to have more parameters for pwm_apply_state() then a flags
argument makes sense.

TBH I like the pwm_apply_state_atomic() option.


Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
