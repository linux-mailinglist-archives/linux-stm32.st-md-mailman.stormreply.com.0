Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0766E8B2
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 22:43:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85A03C65E71;
	Tue, 17 Jan 2023 21:43:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5C16C65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 21:43:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pHtk7-00048K-3O; Tue, 17 Jan 2023 22:43:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pHtk5-006lhK-4N; Tue, 17 Jan 2023 22:43:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pHtk4-00DhUn-CH; Tue, 17 Jan 2023 22:43:40 +0100
Date: Tue, 17 Jan 2023 22:43:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <20230117214337.vgvduhiltzczra6l@pengutronix.de>
References: <20221213102707.1096345-1-olivier.moysan@foss.st.com>
 <20221213105128.74skjowy5v7dlaf6@pengutronix.de>
 <2ab70bb7-dbf1-5f19-8118-6cfd9b5dc278@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <2ab70bb7-dbf1-5f19-8118-6cfd9b5dc278@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 William Breathitt Gray <william.gray@linaro.org>, Lee Jones <lee@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: enforce settings for pwm
	capture
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
Content-Type: multipart/mixed; boundary="===============1032153207160197012=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1032153207160197012==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnrlbqkomeenntxh"
Content-Disposition: inline


--xnrlbqkomeenntxh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Dec 14, 2022 at 04:09:08PM +0100, Olivier MOYSAN wrote:
> Hello Uwe,
>=20
> On 12/13/22 11:51, Uwe Kleine-K=F6nig wrote:
> > Hello Olivier,
> >=20
> > [Cc: +=3D William Breathitt Gray, linux-iio@v.k.o]
> >=20
> > On Tue, Dec 13, 2022 at 11:27:07AM +0100, Olivier Moysan wrote:
> > > The PWM capture assumes that the input selector is set to default
> > > input and that the slave mode is disabled. Force reset state for
> > > TISEL and SMCR registers to match this requirement.
> >=20
> > When does the problem occur? Only if the bootloader changed that
> > setting? Regarding the urgency: With the current knowledge I'd say this
> > patch is material for the next merge window. Do you recommend
> > backporting to stable?
> >=20
>=20
> Yes, the PWM may not be in the default expected state, if the configurati=
on
> has been changed in the bootloader. This is not an actual case today, so
> this patch can wait the next merge window and there is no
> urgency to have it in stable.

Then I'd drop the fixes line.

> > > Note that slave mode disabling is not a pre-requisite by itself
> > > for capture mode, as hardware supports it for PWM capture.
> > > However, the current implementation of the driver does not
> > > allow slave mode for PWM capture. Setting slave mode for PWM
> > > capture results in wrong capture values.
> >=20
> > What is your usecase for PWM capture support? I didn't double check, but
> > I think you're the first contributor to PWM capture since 2018 (i.e. the
> > commit you're fixing).
> >=20
> > Did you check if the counter subsystem would solve your problems? If it
> > doesn't I assume William would like to hear about that.
> >=20
> > Looking at drivers/counter/stm32-timer-cnt.c it does seem to work in
> > slave mode, TISEL isn't touched though. So maybe this driver needs a
> > similar fix?

I want to come back to this question. I only checked lightly, but I
guess the counter patch needs the same patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xnrlbqkomeenntxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPHFoYACgkQwfwUeK3K
7Ana4wf/cy8/TezZWsDyRxH3u4x4x5iGUiJ52kMloAXFi4rQ9qrcH2Aclx/4v9Qr
weZ6nfN0VUu6UDQ7+U3dBoGnB79L2l7X6/nyJzNMGgF0U+yRHFTggARzfsM6xkdA
dtLJdy56dsYka+0eY2OySDmKIKDAnIO2mzbvsyls9WwgMIHO++ZGnO/L2Y3aiy+f
H4wQJyu+RZ/w4HJRVcJuJOf1AJrnbJn9gTYm/XhMPylTurSuFk2QVibWKk/IRDCW
JTcvM7Jwfhqv6TiAyZ/25rD0iOCllNWXQg69Aadl4UWHz1sMI9srUi7NkU2Innue
pmFgsVTv1k4F9mc1rcf+Awo3cOXDtg==
=TCRH
-----END PGP SIGNATURE-----

--xnrlbqkomeenntxh--

--===============1032153207160197012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1032153207160197012==--
