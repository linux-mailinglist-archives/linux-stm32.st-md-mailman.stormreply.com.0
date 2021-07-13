Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB73C6CE3
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 11:07:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97A4CC57B6F;
	Tue, 13 Jul 2021 09:07:55 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF36EC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 09:07:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3EOL-0005ka-Gm; Tue, 13 Jul 2021 11:07:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3EOJ-0006XN-9L; Tue, 13 Jul 2021 11:07:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3EOJ-0001PE-7i; Tue, 13 Jul 2021 11:07:47 +0200
Date: Tue, 13 Jul 2021 11:07:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Salah Triki <salah.triki@gmail.com>
Message-ID: <20210713090747.ragr5vuwrezhjmgl@pengutronix.de>
References: <20210712231910.GA1831270@pc>
 <20210713063053.qqttzxlopvpnadj3@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210713063053.qqttzxlopvpnadj3@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 mcoquelin.stm32@gmail.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] divide by 3*sizeof(u32) when computing
	array_size
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
Content-Type: multipart/mixed; boundary="===============5784159964872838045=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5784159964872838045==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyqa4oiecyo2qrwd"
Content-Disposition: inline


--pyqa4oiecyo2qrwd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again,

one more thing: If and when you resend a reworked patch, please start
the Subject with

	pwm: stm32:

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pyqa4oiecyo2qrwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDtV98ACgkQwfwUeK3K
7AkRwwgAmJ/1yynASv2Azd29sjKfOKK+gUPbIJiekzqV/FHJjaLBoKs4u49xE7RB
v8voj2ip4L34+1pzYW2p7JwLRPM7WZWwKmaRKJw4niU+ol8N4QMG3j6Uq9H3HixR
QGM6ugV8pXEV3+bevyCUjUwTX1sRQkUwONTHzC9onJBT+Lj6HK/dQUt02m/Xv59A
iy0yww3r9UxTV3Z6mVzKhT4WoiYOX9KbtM8RJNetFv4DqkF5OeSXxtxM3dykOoRf
DqG2nlMSH7VYOsiAa9sSRPQvh+gxljhB4RDPyOvr96R4X1tZlI1ljWIrc5rXsRrg
FMiejlQJYn9c/6EzSGs9hb1da6j1jQ==
=Knxe
-----END PGP SIGNATURE-----

--pyqa4oiecyo2qrwd--

--===============5784159964872838045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5784159964872838045==--
