Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B97B9C19
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 11:17:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F53FC6C831;
	Thu,  5 Oct 2023 09:17:43 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FFD0C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 09:17:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qoKTr-0004yM-Uh; Thu, 05 Oct 2023 11:17:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qoKTp-00BEVG-Mk; Thu, 05 Oct 2023 11:17:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qoKTp-009Nwv-Ca; Thu, 05 Oct 2023 11:17:13 +0200
Date: Thu, 5 Oct 2023 11:17:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>
Message-ID: <20231005091713.jgx5h2ss4oybdxq7@pengutronix.de>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
 <ZR50KCVNzhlLooLW@gofer.mess.org>
MIME-Version: 1.0
In-Reply-To: <ZR50KCVNzhlLooLW@gofer.mess.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============1434494200980376880=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1434494200980376880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x5d57cuv6lgyekgb"
Content-Disposition: inline


--x5d57cuv6lgyekgb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sean,

On Thu, Oct 05, 2023 at 09:30:32AM +0100, Sean Young wrote:
> On Wed, Oct 04, 2023 at 11:59:20AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> > > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > > index dc66e3405bf5..d9679ae5b2be 100644
> > > --- a/drivers/pwm/core.c
> > > +++ b/drivers/pwm/core.c
> > > @@ -505,7 +505,7 @@ int pwm_apply_state(struct pwm_device *pwm, const=
 struct pwm_state *state)
> > >  	 * is a bad idea. So make it explicit that calling this function mi=
ght
> > >  	 * sleep.
> > >  	 */
> > > -	might_sleep();
> > > +	might_sleep_if(pwm_can_sleep(pwm));
> > > =20
> > >  	if (!pwm || !state || !state->period ||
> > >  	    state->duty_cycle > state->period)
> >=20
> > I'd like to have a mechanism to catch drivers that missed to set
> > .can_sleep. The best idea I currently have for that is to disable
> > preemption if IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_can_sleep(pwm) while
> > .apply() is running.
>=20
> If we have pwm_apply_state_atomic(), then CONFIG_DEBUG_ATOMIC_SLEEP will
> catch them, but only in that code path of course.
>=20
> How about using non_block_start() and non_block_end() if can_sleep is
> not set?

TIL, looks like it was created for that task.

> > > diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> > > index b7c6045c5d08..b8b9392844e9 100644
> > > --- a/drivers/pwm/pwm-fsl-ftm.c
> > > +++ b/drivers/pwm/pwm-fsl-ftm.c
> > > @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *=
pdev)
> > > =20
> > >  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
> > >  	fpc->chip.dev =3D &pdev->dev;
> > > +	fpc->chip.can_sleep =3D true;
> >=20
> > Also I wonder if the distinction between atomic and sleeping
> > pwm_state_apply() should be more explicit. For GPIOs you have a sleeping
> > variant gpiod_set_value_cansleep() that allows to immediately determine
> > the intended context in the caller. This would allow that programming
> > a PWM stays a preemption point (if possible/desired) even if the
> > underlying hardware/driver is atomic. To not have to touch all consumer
> > drivers, maybe the pair for pwm should better be
> >=20
> > 	pwm_apply_state()
> > 	pwm_apply_state_atomic()
>=20
> Do we need pwm_config_atomic(), pwm_enable_atomic(), and pwm_disable_atom=
ic()
> too? These are just convenience functions, so we can probably do without =
them.

I'd like to get rid of these, so for now I'd keep them as is.

> > instead of a "cansleep" suffix for the sleeping variant? Or maybe it's
> > better to accept touching all consumer drivers to get semantics similar
> > to gpio? I couldn't decide quickly what I really like better here, so
> > that's your chance to comment and influence the outcome :-)
>=20
> If you expect to have more parameters for pwm_apply_state() then a flags
> argument makes sense.

Actually I don't want more parameters -- at least for this use case. I
could imagine another parameter for something like apply-immediately vs.
complete-current-period, but that's another topic.

> TBH I like the pwm_apply_state_atomic() option.

ok.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--x5d57cuv6lgyekgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUefxgACgkQj4D7WH0S
/k7aWAf+OxUfKBgEw3SVXriToMTyS73Uv7QeEY7QBZpX1vw08Ec0hP5Cww0L95e+
ppjZ4O7YXmKcbOwHiakO3lKrm4KgzdpGqt+GV4zaBiubE8Wk6OyNN+P0bMe4jS2l
uCOtDw9qDw8fSDGZsXTZTfGkdAUcGBnPR2gXJEF7avXghW4EWKmspE7+tS6d07Sl
ItOiLn/AyScHsTWq4irGhaTe0K+eaM/GO3blwSu38ar3Pt3JCu5PEOxcRextT+cq
f6eAObmnxL2JrR4M8szNwMEdm/1iRf0xUcAcpYs3biYbhq074kiN1X+NJ0dCtvCH
2P1yNSi9esnY8j6X9ZGw1FLJA3kj1A==
=bWrr
-----END PGP SIGNATURE-----

--x5d57cuv6lgyekgb--

--===============1434494200980376880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1434494200980376880==--
