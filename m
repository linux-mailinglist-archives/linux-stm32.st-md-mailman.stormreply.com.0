Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A907555F8C5
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 09:23:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37C6BC5F1EE;
	Wed, 29 Jun 2022 07:23:22 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CD35C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 07:23:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6S2d-0005UO-4V; Wed, 29 Jun 2022 09:23:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6S2S-003M3c-Vk; Wed, 29 Jun 2022 09:23:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6S2V-001qeU-Nu; Wed, 29 Jun 2022 09:23:07 +0200
Date: Wed, 29 Jun 2022 09:23:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Message-ID: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
MIME-Version: 1.0
In-Reply-To: <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>, netdev@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 6/6] i2c: Make remove callback return void
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
Content-Type: multipart/mixed; boundary="===============7742112322277318997=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7742112322277318997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3yzpq2rgg2xm7tqn"
Content-Disposition: inline


--3yzpq2rgg2xm7tqn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[I dropped nearly all individuals from the Cc: list because various
bounces reported to be unhappy about the long (logical) line.]

On Wed, Jun 29, 2022 at 03:03:54PM +0800, Jeremy Kerr wrote:
> Looks good - just one minor change for the mctp-i2c driver, but only
> worthwhile if you end up re-rolling this series for other reasons:
>=20
> > -static int mctp_i2c_remove(struct i2c_client *client)
> > +static void mctp_i2c_remove(struct i2c_client *client)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0struct mctp_i2c_client *mcli =3D i2c_get_client=
data(client);
> > =A0=A0=A0=A0=A0=A0=A0=A0struct mctp_i2c_dev *midev =3D NULL, *tmp =3D N=
ULL;
> > @@ -1000,7 +1000,6 @@ static int mctp_i2c_remove(struct i2c_client *cli=
ent)
> > =A0=A0=A0=A0=A0=A0=A0=A0mctp_i2c_free_client(mcli);
> > =A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&driver_clients_lock);
> > =A0=A0=A0=A0=A0=A0=A0=A0/* Callers ignore return code */
> > -=A0=A0=A0=A0=A0=A0=A0return 0;
> > =A0}
>=20
> The comment there no longer makes much sense, I'd suggest removing that
> too.

Yeah, that was already pointed out to me in a private reply. It's
already fixed in

	https://git.pengutronix.de/cgit/ukl/linux/log/?h=3Di2c-remove-void

> Either way:
>=20
> Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Added to my tree, too.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3yzpq2rgg2xm7tqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK7/dUACgkQwfwUeK3K
7AnTJgf9GW2H7fk9/Je11PRlCnUOSZ1sz/49RHAm4xj66pI/hdRP++D8L5o7ntEU
Hl5hKosR36cUyX12ie+YQtiCRkjhLqUoJnPzJOtcXQNV7mlMt6ds2INSO4iHYtMa
b2UH+lLQ6K/DO0+1KquElKJhfBOKucYY1WQAVK4cfasBKMR4MtukcHAgcYClRYdj
Nvvy6bCjqr8M1+uqDTJUUR/d0rWYHxFKygYRUfK7YPpz57gaVgaR9Js9GDGkVFB4
qVL5x23NzgB/Djr1Ls1F6Z5eFMjbtVb+S1HDRsU+HJOYD6v1LkT2OFx9iFpme+8m
+4HHNR5pxKogz59u4YpP1pIb0MejhA==
=ibah
-----END PGP SIGNATURE-----

--3yzpq2rgg2xm7tqn--

--===============7742112322277318997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7742112322277318997==--
