Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0519D640CAF
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Dec 2022 18:57:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5FDDC65E62;
	Fri,  2 Dec 2022 17:57:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6206DC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Dec 2022 17:57:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p1AHk-0003dK-AZ; Fri, 02 Dec 2022 18:57:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p1AHh-001qqf-Ln; Fri, 02 Dec 2022 18:57:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p1AHg-0025zX-W2; Fri, 02 Dec 2022 18:57:13 +0100
Date: Fri, 2 Dec 2022 18:57:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20221202175712.tz6uwalr6d46r2ad@pengutronix.de>
References: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
 <20221115111347.3705732-5-u.kleine-koenig@pengutronix.de>
 <b474ef48-f77b-807b-ce12-f5a200459933@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <b474ef48-f77b-807b-ce12-f5a200459933@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] pwm: stm32-lp: Use regmap_clear_bits
 and regmap_set_bits where applicable
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
Content-Type: multipart/mixed; boundary="===============3270359215095566517=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3270359215095566517==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dnx7n762zixpg7wt"
Content-Disposition: inline


--dnx7n762zixpg7wt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 11:23:14AM +0100, Fabrice Gasnier wrote:
> On 11/15/22 12:13, Uwe Kleine-K=F6nig wrote:
> > Found using coccinelle and the following semantic patch:
> >=20
> > @@
> > expression map, reg, bits;
> > @@
> >=20
> > - regmap_update_bits(map, reg, bits, bits)
> > + regmap_set_bits(map, reg, bits)
> >=20
> > @@
> > expression map, reg, bits;
> > @@
> >=20
> > - regmap_update_bits(map, reg, bits, 0)
> > + regmap_clear_bits(map, reg, bits)
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/pwm/pwm-stm32-lp.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
> > index 3115abb3f52a..212bdc7d51ee 100644
> > --- a/drivers/pwm/pwm-stm32-lp.c
> > +++ b/drivers/pwm/pwm-stm32-lp.c
> > @@ -140,9 +140,8 @@ static int stm32_pwm_lp_apply(struct pwm_chip *chip=
, struct pwm_device *pwm,
> > =20
> >  	if (reenable) {
> >  		/* Start LP timer in continuous mode */
> > -		ret =3D regmap_update_bits(priv->regmap, STM32_LPTIM_CR,
> > -					 STM32_LPTIM_CNTSTRT,
> > -					 STM32_LPTIM_CNTSTRT);
> > +		ret =3D regmap_set_bits(priv->regmap, STM32_LPTIM_CR,
> > +				      STM32_LPTIM_CNTSTRT);
>=20
> Hi Uwe,
>=20
> One minor suggestion here: could fit into a single line.

That would make the line 89 chars long (counting tag as usual as 8). Up
to now there is no line longer than 78 chars. So I'd not join the two
lines.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dnx7n762zixpg7wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOKPHUACgkQwfwUeK3K
7AkThQf/azjMPUOcji5c6MwxyjUEpcAH+50ie5NEeDZGr3m9Cr/AMBErl9F15Yyu
yfmo4A/szg/Yn71jvCgRBY45yWImxAGPV4zW9UMK9vdh3skZuvqstmk8GRRDTtV3
0bHKIpvAuk1D7TqrA4sPVc05RkizDpDX0+CN97fDoZkFhBWSKCsz8bFRaBy1/6BH
UbydfZnnnza7qlem4O8Ux3iZqHBqETJfz1GHVOA8oP5akCYhHAH5CEimdXrDlHXM
netetHku4Sy64xsdICXmGb75Ey4/J+nbs7LoIwP7fXV2YnkuwYi+w0uR3Gs3kYuz
VoIVur7FA41pAqJznPx20g89ufZb+w==
=gDKC
-----END PGP SIGNATURE-----

--dnx7n762zixpg7wt--

--===============3270359215095566517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3270359215095566517==--
