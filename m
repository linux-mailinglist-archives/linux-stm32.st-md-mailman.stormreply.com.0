Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7283A47C0B6
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 14:23:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB11C5E2D4;
	Tue, 21 Dec 2021 13:23:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1275C5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 13:23:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mzf6e-0001mV-M1; Tue, 21 Dec 2021 14:23:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mzf6Z-005pOs-Vx; Tue, 21 Dec 2021 14:22:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mzf6Y-0004cW-MI; Tue, 21 Dec 2021 14:22:58 +0100
Date: Tue, 21 Dec 2021 14:22:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20211221132258.472t537373vto7bz@pengutronix.de>
References: <20211221104546.214066-1-u.kleine-koenig@pengutronix.de>
 <dadb79b2-ac21-1899-48b9-1c6723afb1b4@metafoo.de>
 <20211221113542.rl4aburbzzrgs3km@pengutronix.de>
 <65009237-7e61-21aa-60cd-b7f7e0bb2f91@metafoo.de>
MIME-Version: 1.0
In-Reply-To: <65009237-7e61-21aa-60cd-b7f7e0bb2f91@metafoo.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, linux-kernel@vger.kernel.org,
 David Lechner <david@lechnology.com>, linux-iio@vger.kernel.org,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] counter: Remove struct
	counter_device::priv
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
Content-Type: multipart/mixed; boundary="===============6785473143445768188=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6785473143445768188==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vzpyvvyijl5eeftp"
Content-Disposition: inline


--vzpyvvyijl5eeftp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 01:04:50PM +0100, Lars-Peter Clausen wrote:
> On 12/21/21 12:35 PM, Uwe Kleine-K=F6nig wrote:
> > On Tue, Dec 21, 2021 at 12:12:12PM +0100, Lars-Peter Clausen wrote:
> > > On 12/21/21 11:45 AM, Uwe Kleine-K=F6nig wrote:
> > > > similar to patch
> > > > https://lore.kernel.org/r/4bde7cbd9e43a5909208102094444219d3154466.=
1640072891.git.vilhelm.gray@gmail.com
> > > > the usage of struct counter_device::priv can be replaced by
> > > > container_of which improves type safety and code size.
> > > >=20
> > > > This series depends on above patch, converts the remaining drivers =
and
> > > > finally drops struct counter_device::priv.
> > > Not sure if this is such a good idea. struct counter_device should no=
t be
> > > embedded in the drivers state struct in the first place.
> > Just to mention it: My patch series didn't change this, this was already
> > broken before.
>=20
> I know, but this series has to be reverted when the framework is fixed.

All drivers have to be touched. With my patch series you have to modify
one function in each driver, without my patch you have touch nearly
every function.

*shrug*

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vzpyvvyijl5eeftp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHB1S8ACgkQwfwUeK3K
7AmdXwf8C/nqQs80YpTkc4NkxCBn5t8pVGv+QO/f/a3ZRQJQhBqVXCT9t21L2/Qn
qhAyte5adQCclwmGbNBF6yCbeaOcpPUnOKTLkGFSRwZmegufiplQ22mC0jPbR0En
kQ0/Gbipbw/bIpUqDfCF7FE+0n5dY/Vbb6vlaiqnKhAGS0mxC/9BKVEaK/m4OJ+Z
vybjLOuICI1O/c+NW67/y2yuzktrpAE4i8mOl/yRxV5WbRGB7qVJR6veB0weU4+v
c2lzI/l9AZGDGX6tzon+SYHrKg8FFzFlU9ivITHC6orIAuwj4Dx0nraqycQI94wu
vG9kWmiQUwVgW5zv0R3jDOsksS3lOg==
=xdQv
-----END PGP SIGNATURE-----

--vzpyvvyijl5eeftp--

--===============6785473143445768188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6785473143445768188==--
