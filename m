Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C2649112
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Dec 2022 23:42:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBA43C65E6E;
	Sat, 10 Dec 2022 22:42:35 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6B9C65E63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Dec 2022 22:42:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p48Xi-0008S6-Bo; Sat, 10 Dec 2022 23:42:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p48Xe-003fjR-2X; Sat, 10 Dec 2022 23:41:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p48Xe-0046bD-4d; Sat, 10 Dec 2022 23:41:58 +0100
Date: Sat, 10 Dec 2022 23:41:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <20221210224154.733cd5qnrkpexq22@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
 <Y5TyrO5maz5VYic3@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <Y5TyrO5maz5VYic3@smile.fi.intel.com>
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
Content-Type: multipart/mixed; boundary="===============8840511018681328431=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8840511018681328431==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7qhswmbpkvtzgvtu"
Content-Disposition: inline


--7qhswmbpkvtzgvtu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Sat, Dec 10, 2022 at 10:57:16PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K=F6nig wrote:
>=20
> ...
>=20
> > > I'm wondering why we didn't see a compiler warning about mistyped fun=
ction
> > > prototypes in some drivers.
> >=20
> > I don't understand where you expected a warning. Care to elaborate?
>=20
> intel-lpss.c has the prototype that returns an int. IIRC it was like this

Do you mean drivers/mfd/intel-lpss.c? That one doesn't implement a PWM?!

And drivers/pwm/pwm-lpss.c is adapted by this series.

One of us is confused ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7qhswmbpkvtzgvtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOVCy8ACgkQwfwUeK3K
7Amqbgf7B9CvBJP4sV+MCHwNOkar+hN65y/IFZl8+KJEQzokHbdag/I7vBvxqm0q
cOWhTR13j1UZBW5bl06bB5K03JJLpAqFVemlvCMxww0G9e7f5gJ+UkkFy64Wg5eN
S9IGKBbgBZqZIpEpYNRSatcmsUacaV1aKHKYrOkgrkFno+a3jk9SGNUtdwvLyvwW
6rpJPqUEOQo4dqB3YPj/VZL13P7B92K3qIsBu0lxz20qstp5wjIpMF1Gsky+6Sf+
WgVSbrTrTjMwtDpEfb9/ZMXWohTWu0FeaTliafQxjCiNCIgmejFgLEdmalOZ4NXx
gh5E3k8VT1fe4RAogpC5ofieweL1YA==
=ikaL
-----END PGP SIGNATURE-----

--7qhswmbpkvtzgvtu--

--===============8840511018681328431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8840511018681328431==--
