Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7C42983C
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 22:42:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA68AC5C82E;
	Mon, 11 Oct 2021 20:42:39 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39190C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 20:42:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ma27j-0006Dn-4t; Mon, 11 Oct 2021 22:42:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ma27c-0003x4-Pt; Mon, 11 Oct 2021 22:42:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ma27c-0001bN-Nd; Mon, 11 Oct 2021 22:42:08 +0200
Date: Mon, 11 Oct 2021 22:42:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Jiri Slaby <jirislaby@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Peter Huewe <peterhuewe@gmx.de>, Thierry Reding <thierry.reding@gmail.com>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Message-ID: <20211011204207.zfmofwf4d6ga45ao@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-hwmon@vger.kernel.org, kernel@pengutronix.de,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 "Jason Gunthorpe linux-integrity @ vger . kernel . org" <jgg@ziepe.ca>,
 Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/13] Make some spi device drivers return
 zero in .remove()
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
Content-Type: multipart/mixed; boundary="===============2918967824262417884=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2918967824262417884==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4crg6rmgkslx3kie"
Content-Disposition: inline


--4crg6rmgkslx3kie
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Oct 11, 2021 at 03:27:41PM +0200, Uwe Kleine-K=F6nig wrote:
> this series is part of my new quest to make spi remove callbacks return
> void. Today they return an int, but the only result of returning a
> non-zero value is a warning message. So it's a bad idea to return an
> error code in the expectation that not freeing some resources is ok
> then. The same holds true for i2c and platform devices which benefit en
> passant for a few drivers.
>=20
> The patches in this series address some of the spi drivers that might
> return non-zero and adapt them accordingly to return zero instead. For
> most drivers it's just about not hiding the fact that they already
> return zero.
>=20
> Given that there are quite some more patches of this type to create
> before I can change the spi remove callback, I suggest the respecive
> subsystem maintainers pick up these patches. There are no
> interdependencies in this series.
>=20
> Uwe Kleine-K=F6nig (13):
>   drm/panel: s6e63m0: Make s6e63m0_remove() return void
>   hwmon: adt7x10: Make adt7x10_remove() return void
>   hwmon: max31722: Warn about failure to put device in stand-by in
>     .remove()
>   input: adxl34xx: Make adxl34x_remove() return void
>   input: touchscreen: tsc200x: Make tsc200x_remove() return void
>   media: cxd2880: Eliminate dead code
>   mfd: mc13xxx: Make mc13xxx_common_exit() return void
>   mfd: stmpe: Make stmpe_remove() return void
>   mfd: tps65912: Make tps65912_device_exit() return void
>   serial: max310x: Make max310x_remove() return void
>   serial: sc16is7xx: Make sc16is7xx_remove() return void
>   staging: fbtft: Make fbtft_remove_common() return void
>   tpm: st33zp24: Make st33zp24_remove() return void

I thought I would be a good enough programmer to not need build tests.
Obviously I was wrong and introduced build problems with the following
patches:

	input: touchscreen: tsc200x: Make tsc200x_remove() return void
	mfd: mc13xxx: Make mc13xxx_common_exit() return void
	serial: max310x: Make max310x_remove() return void
	serial: sc16is7xx: Make sc16is7xx_remove() return void

Please don't apply these (unless you also fix the trivial problems in
them). I will prepare a v2 soon.

Best regards and sorry for the inconvenience,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4crg6rmgkslx3kie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkoZsACgkQwfwUeK3K
7AkTugf9FW8u+Q+uOdqyv/dig5mZMoKZ01YqhMcNB1hLm+NpjtUVPs0yR3CgUTq2
lhQH+cy+0zeuFQEuyDRBXSLYHuSJJKVES8CBrpN960wFh6WaLLKLet8ri0sBJRe3
gakaZ/TcwPP4RwY/f1V4w/APWuU3or8dviF7hasfFR+D8tIMK+Wgi0LbdWMQIRHf
P9T60rK5sOnHH33Kksf5stqLxdk06MBHzwJV15PhzWc0TUQAmO+oG0FDfxq+C8tQ
8lXq6dtxtEMlzLhtLsBBHoUegGR/XbnKUmxT6kC0nO+G88xCYTO+BBjIGacAxhmQ
2mK/fRgMytsTSX41qXejUgp6TuoW+Q==
=mP11
-----END PGP SIGNATURE-----

--4crg6rmgkslx3kie--

--===============2918967824262417884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2918967824262417884==--
