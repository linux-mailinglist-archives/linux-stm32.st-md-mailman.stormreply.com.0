Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119C648DE3
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Dec 2022 10:19:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0B2C65E6E;
	Sat, 10 Dec 2022 09:19:09 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A88ECC65E63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Dec 2022 09:19:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w0K-0003KC-Jh; Sat, 10 Dec 2022 10:18:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w0G-003YBp-5Q; Sat, 10 Dec 2022 10:18:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w0G-003yU4-Bx; Sat, 10 Dec 2022 10:18:40 +0100
Date: Sat, 10 Dec 2022 10:18:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/11] pwm: Allow .get_state to fail
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
Content-Type: multipart/mixed; boundary="===============1838959311539935522=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1838959311539935522==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nuqt3gnghpavk6fz"
Content-Disposition: inline


--nuqt3gnghpavk6fz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > In v1 Thierry had the concern:
> >=20
> > | That raises the question about what to do in these cases. If we return
> > | an error, that could potentially throw off consumers. So perhaps the
> > | closest would be to return a disabled PWM? Or perhaps it'd be up to t=
he
> > | consumer to provide some fallback configuration for invalidly configu=
red
> > | or unconfigured PWMs.
> >=20
> > .get_state() is only called in pwm_device_request on a pwm_state that a
> > consumer might see. Before my series a consumer might have seen a
> > partial modified pwm_state (because .get_state() might have modified
> > .period, then stumbled and returned silently). The last patch ensures
> > that this partial modification isn't given out to the consumer. Instead
> > they now see the same as if .get_state wasn't implemented at all.
>=20
> I'm wondering why we didn't see a compiler warning about mistyped function
> prototypes in some drivers.

I don't understand where you expected a warning. Care to elaborate?

> P.S. The series is good thing to do, thank you.

It's already too late for an ack, the series is already in Thierry's
tree.

Best regards
Uwe
=20
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nuqt3gnghpavk6fz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOUTt4ACgkQwfwUeK3K
7Amt4gf/VCswPgVD5w7pUM72SEpdjhw28hm2YCuu5RxYMTBVbGTdK9rYJjqmB2FI
ZOQHPgl36sDWhZEM55FY6oZxaGM3XttrjoTnFSk0MuNQmO70aWJtkS+OVmR4UgiR
vIXRy8KMRWEliVRK4dWubiXzQ3OZl1iEDzgc9c7bccEtcdABRG+Z0zLWDCiT8WMw
OzDx+FLvT792TNn4oEHONO3lJVeZ64MdM0VPguFtzbArXlpaJlQhlfhxYnvVxR1o
LkxC6uB5mWT1o1f3+yzw9GD0RJwspghVALqO+g7LoH0oinRso2oaExRDKS5Yt69Z
bmJURLsdOOyquJFcb6f1NqrKVb8fUw==
=nBk6
-----END PGP SIGNATURE-----

--nuqt3gnghpavk6fz--

--===============1838959311539935522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1838959311539935522==--
