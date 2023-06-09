Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33954729CAA
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 16:22:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6E0AC65E70;
	Fri,  9 Jun 2023 14:22:00 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33A6FC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 14:22:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q7d01-0007ok-Tg; Fri, 09 Jun 2023 16:21:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q7d00-006Dw8-Nd; Fri, 09 Jun 2023 16:21:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q7d00-00CbtK-3b; Fri, 09 Jun 2023 16:21:56 +0200
Date: Fri, 9 Jun 2023 16:21:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20230609142155.h5fvn4fxdcleoznw@pengutronix.de>
References: <20230608-pwm-stm32-get-state-v1-1-db7e58a7461b@pengutronix.de>
 <dac9c545-fcbc-3aec-c341-abc62f551703@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <dac9c545-fcbc-3aec-c341-abc62f551703@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============6800379144911058431=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6800379144911058431==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wkz2lg5pii5fhdhh"
Content-Disposition: inline


--wkz2lg5pii5fhdhh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Fabrice,

On Fri, Jun 09, 2023 at 03:06:47PM +0200, Fabrice Gasnier wrote:
> On 6/8/23 16:06, Philipp Zabel wrote:
> > +static int stm32_pwm_get_state(struct pwm_chip *chip,
> > +			       struct pwm_device *pwm, struct pwm_state *state)
> > +{
> > +	struct stm32_pwm *priv =3D to_stm32_pwm_dev(chip);
> > +	int ch =3D pwm->hwpwm;
> > +	unsigned long rate;
> > +	u32 ccer, psc, arr, ccr;
> > +	u64 dty, prd;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(priv->regmap, TIM_CCER, &ccer);
> > +	if (ret)
> > +		return ret;
> > +
> > +	state->enabled =3D ccer & (TIM_CCER_CC1E << (ch * 4));
> > +	state->polarity =3D (ccer & (TIM_CCER_CC1P << (ch * 4))) ?
> > +			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
> > +	regmap_read(priv->regmap, TIM_PSC, &psc);
> > +	regmap_read(priv->regmap, TIM_ARR, &arr);
> > +	read_ccrx(priv, ch, &ccr);
> > +	rate =3D clk_get_rate(priv->clk);
> > +
> > +	prd =3D (u64)NSEC_PER_SEC * (psc + 1) * (arr + 1);
> > +	state->period =3D DIV_ROUND_UP_ULL(prd, rate);
> > +	dty =3D (u64)NSEC_PER_SEC * (psc + 1) * ccr;
> > +	state->duty_cycle =3D DIV_ROUND_UP_ULL(dty, rate);
>=20
> Just a question/thought, could it be worth to use DIV_ROUND_CLOSEST_ULL()=
 ?

No, round up is the right choice. The reason for that is that .apply()
rounds down in its divisions. If you use ROUND_CLOSEST here, reapplying
the result from .get_state() might not be idempotent.

> > +
> > +	return ret;
> > +}

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wkz2lg5pii5fhdhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSDNYMACgkQj4D7WH0S
/k7s5Af/RT0ZOdJvsT4ylvLPggQkwlMTUHV0alz7e2/4+uYnw8bv5kN9Ly38Mnm5
IKwDWxm5tRbuUNm658LqBYi4xXRnPdvkR3Sx18PE8KZsIkbjRcaizPk2UnkpIJKd
UWtztLyKTT5LUp2mn9WGjzUgC+eXW67uSY0/ChoWVANu9/J2bpbp2rpIz3l2vk30
jwdWMX61A7j5kS/XanteA7nKuFwI94MdzrfqCMSAW2w2YKS63RcA/aPr1tKtlPZv
77UHlviGhFPm7R4LrAaX3Swj2OIq3Lj7nREr9YUT5/vO+AULV9pX2nUvR9zAMVVw
y/4kR4atPgutjQ19zD+pfpXz/jlQGQ==
=yi3A
-----END PGP SIGNATURE-----

--wkz2lg5pii5fhdhh--

--===============6800379144911058431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6800379144911058431==--
