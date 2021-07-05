Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 357663BBD5A
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 15:11:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E08E7C57B53;
	Mon,  5 Jul 2021 13:11:15 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6016C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 13:11:14 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m0ONV-0005gO-T9; Mon, 05 Jul 2021 15:11:13 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m0ONT-0003H1-QZ; Mon, 05 Jul 2021 15:11:11 +0200
Date: Mon, 5 Jul 2021 15:11:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20210705131111.4gb5x6ln5sfby3qf@pengutronix.de>
References: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: stm32-lp: Don't modify HW state
 in .remove callback
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
Content-Type: multipart/mixed; boundary="===============6778247147913311053=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6778247147913311053==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sqwdj2jqhghphm34"
Content-Disposition: inline


--sqwdj2jqhghphm34
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

this thread is marked as "Rejected" in patchwork without a word of you.
Did this happen on purpose? Assuming it did: I would welcome a word from
you in such a case. From my POV the patch set is still fine and should
be applied.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sqwdj2jqhghphm34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDjBOsACgkQwfwUeK3K
7AnxfQf/Ss/WERduvowZ7ewoAx+Efw5WQJwkbOQyRdrZf+J/QTg66MhyRKvOV33B
BT/9iI2SMJhE+fv9vUDeSuWWWN226otLWzkh9VA9Necs2UH9t1yNt78LxixsIZlh
3tPeO6Qde/3/pTdfGUdqRYbH+Iq50V3oJySZbaPFwhYsoFzoBrppnH1kYTpp8e5s
zSjpc9r84fBzjm9mQFrKZ7eqCw1r2jaja8B2jLAK0ub+VOCB6FieHMlbJfVkvwYQ
nQ+Jgs7NWXY5brCXGo5CgIbenv9IVPbAqZBLKn57j/gWhTr1HY/rsA2n9an6uBzD
khC0PA3oHMN4QFx8hXbJhb+98O7HzQ==
=6AOg
-----END PGP SIGNATURE-----

--sqwdj2jqhghphm34--

--===============6778247147913311053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6778247147913311053==--
