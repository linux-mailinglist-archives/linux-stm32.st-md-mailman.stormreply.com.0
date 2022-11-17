Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835C62DD43
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Nov 2022 14:52:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC176C65067;
	Thu, 17 Nov 2022 13:52:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 872C5C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Nov 2022 13:52:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovfJo-0000Qr-Dj; Thu, 17 Nov 2022 14:52:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovfJl-004rbn-KS; Thu, 17 Nov 2022 14:52:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ovfJl-00HIAj-TC; Thu, 17 Nov 2022 14:52:37 +0100
Date: Thu, 17 Nov 2022 14:52:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Brown <broonie@kernel.org>
Message-ID: <20221117135237.vqhe6z7aklindlgq@pengutronix.de>
References: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] pwm: Use regmap_clear_bits and
 regmap_set_bits where applicable
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
Content-Type: multipart/mixed; boundary="===============1356730807126630461=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1356730807126630461==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uocizgkpe6tjdrha"
Content-Disposition: inline


--uocizgkpe6tjdrha
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Nov 15, 2022 at 12:13:42PM +0100, Uwe Kleine-K=F6nig wrote:
> I recently learned a bit of coccinelle and triggered by Paul Cercueil's
> patch that replaces regmap_update_bits() by regmap_set_bits() and
> regmap_clear_bits() where applicable in the jz4740 pwm driver[1] I
> created a cocci patch for such calls.

Pointing to this series I asked broonie in irc if a conversion like that
would be suitable to do in the complete tree. He objected that doing
that mechanically is probably wrong. His explicit concern was that a
call to regmap_clear_bits() (or regmap_set_bits()) in a series of
regmap_update_bits() is more disturbing than helpful.

So I looked at the remaining calls to regmap_update_bits() in the
drivers I converted in this series:

 - pwm-fsl-ftm
   There are two calls left that set bits in a mask (these should stay
   as they are) and one:

        reg_polarity =3D 0;
        if (newstate->polarity =3D=3D PWM_POLARITY_INVERSED)
                reg_polarity =3D BIT(pwm->hwpwm);

        regmap_update_bits(fpc->regmap, FTM_POL, BIT(pwm->hwpwm), reg_polar=
ity);

   which could benefit from a conversion (though I expect that to be
   controversial).
   The converted calls are all independent of the remaining
   regmap_update_bits().

 - pwm-img
   No regmap_update_bits() calls left.

 - pwm-iqs620a
   There is one call left that does:

        return regmap_update_bits(iqs62x->regmap, IQS620_PWR_SETTINGS,
                                  IQS620_PWR_SETTINGS_PWM_OUT, 0xff);

   I think this is a bug because IQS620_PWR_SETTINGS_PWM_OUT is only
   0xf.

 - pwm-stm32-lp
   No regmap_update_bits() calls left.

 - pwm-stm32
   There are several calls left, some of them also near converted calls.
   My personal opinion is, that the conversion is fine anyhow.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uocizgkpe6tjdrha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN2PKIACgkQwfwUeK3K
7AlqZAf/ZtYi3tPx6cd+4w2HO3smbdvvDpnW9chGg2Iaf9U61i0HQzrUti+4KImB
AU5zo4Qc0Yyuuqmz2YnrSuKExmXJv4yQjaOBMHKSKSHbYAPawProevcyzZL5+Bnb
3aRtxCW/vF94syRo90sr/Of5TbBdM/QB6w4xHvHaA/TZRsqGfAUBKqr5pL929qJV
9RPGSJHE9fc22uZoWpmVIvwWb4W4T0P0QaiXFTaR2C6T2na7v7LhkAK+8ZZHoFNn
RVftY/myM61F6OLJLFwisxG7kTkE18PbjZmv0+cSKHsngDTKX2nMWg27ZPhMmzGV
RKxEb2BUVgow4yaQ2QYINNR9lHWVmw==
=nDY9
-----END PGP SIGNATURE-----

--uocizgkpe6tjdrha--

--===============1356730807126630461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1356730807126630461==--
