Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E76347E0
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 21:17:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F39C640FF;
	Tue, 22 Nov 2022 20:17:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56256C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 20:17:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oxZhX-0006Qx-Bo; Tue, 22 Nov 2022 21:17:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oxZhR-005v1B-UM; Tue, 22 Nov 2022 21:16:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oxZhS-000s7U-3N; Tue, 22 Nov 2022 21:16:58 +0100
Date: Tue, 22 Nov 2022 21:16:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20221122201654.5rdaisqho33buibj@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221122185818.3740200d@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20221122185818.3740200d@jic23-huawei>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 linux-pm@vger.kernel.org, linux-actions@lists.infradead.org,
 Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 000/606] i2c: Complete conversion to
	i2c_probe_new
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
Content-Type: multipart/mixed; boundary="===============2347026471326868329=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2347026471326868329==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3mjk627u66tfbb3"
Content-Disposition: inline


--t3mjk627u66tfbb3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 06:58:18PM +0000, Jonathan Cameron wrote:
>=20
> Queued all of the below:
> with one tweaked as per your suggestion and the highlighted one dropped o=
n basis
> I was already carrying the equivalent - as you pointed out.
>=20
> I was already carrying the required dependency.
>=20
> Includes the IIO ones in staging.
>=20
> Thanks,
>=20
> Jonathan
>=20
> p.s. I perhaps foolishly did this in a highly manual way so as to
> also pick up Andy's RB.  So might have dropped one...

You could have done:

	H=3D$(git rev-parse @)
	b4 am -P 49-190 20221118224540.619276-1-uwe@kleine-koenig.org
	git am ...
	git filter-branch -f --msg-filter "grep -v 'Signed-off-by: Jonathan'; echo=
 'Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>'; echo '=
Signed-off-by: Jonathan Cameron <jic23@kernel.org>'" $H..

(untested, but you get the idea).

> Definitely would have been better as one patch per subsystem with
> a cover letter suitable for replies like Andy's to be picked up
> by b4.

Next time I will go for one series per subsystem which I like better
than one patch per subsystem.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t3mjk627u66tfbb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN9LjMACgkQwfwUeK3K
7An96wf/RMtsCSXVJy8BDrXiXMhey9OEm8p08ulRn0lKYlG54KR8nU/s77uuMjGS
99aUfUU56Abxk02DuBv6N5Bax8nlFyIlUgkfaYPP9iN1TkF5XiucQ0Se4/haYL4A
q11UqWIcKBS+5BL3K6Bl1Cqv4dPYpRvs99X3jlU6JmhFqJPPhPgAu0p74arSvLie
kN6wgOGVdCjZTRD+Z7FxfIQPZqvVo7anPAynyk7XfgTXMSAK80JPR2UeMfvQ7yr2
W28htsacTaJSnPOb1VIrhN8OytpxASYa120EJ8augNmBXC0IzvjosWI0LZnNljAU
izPd/d6lzDCP0Mz/LU9QCBYUR1jxuQ==
=KmMu
-----END PGP SIGNATURE-----

--t3mjk627u66tfbb3--

--===============2347026471326868329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2347026471326868329==--
