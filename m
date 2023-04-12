Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4F76DFA79
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 17:41:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F320C69063;
	Wed, 12 Apr 2023 15:41:53 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68591C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 15:41:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmcbR-0004Pl-G6; Wed, 12 Apr 2023 17:41:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmcbQ-00Alqy-95; Wed, 12 Apr 2023 17:41:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmcbP-00CeEE-EN; Wed, 12 Apr 2023 17:41:43 +0200
Date: Wed, 12 Apr 2023 17:41:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <20230412154143.xvgtwnxxbljkysmq@pengutronix.de>
References: <20221213102707.1096345-1-olivier.moysan@foss.st.com>
 <20221213105128.74skjowy5v7dlaf6@pengutronix.de>
 <2ab70bb7-dbf1-5f19-8118-6cfd9b5dc278@foss.st.com>
 <20230117214337.vgvduhiltzczra6l@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230117214337.vgvduhiltzczra6l@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, William Breathitt Gray <william.gray@linaro.org>,
 Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============6291923775157242645=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6291923775157242645==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oe4jo4jds2sm7egs"
Content-Disposition: inline


--oe4jo4jds2sm7egs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Cc -=3D Benjamin Gaignard, their email address bounced]

On Tue, Jan 17, 2023 at 10:43:37PM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Dec 14, 2022 at 04:09:08PM +0100, Olivier MOYSAN wrote:
> > On 12/13/22 11:51, Uwe Kleine-K=F6nig wrote:
> > > Looking at drivers/counter/stm32-timer-cnt.c it does seem to work in
> > > slave mode, TISEL isn't touched though. So maybe this driver needs a
> > > similar fix?
>=20
> I want to come back to this question. I only checked lightly, but I
> guess the counter patch needs the same patch.

I cared for that one, now. See
https://lore.kernel.org/linux-iio/20230412153709.3557323-1-u.kleine-koenig@=
pengutronix.de

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--oe4jo4jds2sm7egs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ20TYACgkQj4D7WH0S
/k6qtwf/QK0kEk+EbOD5WlBpRKmlZNhihYGuNmq6A2mmmtZpwj66x3pyGdUqfYB4
ReJrigtlw+8v/59Z0xKVwER3O3QrdbTMwRfGvswGu+JFnn+fEh7roKokMzv1o5S5
oE8K92nKJ3OEHi6Pc2RxPZ+K17Sp6R/2rUZl+ulUM5d5CPtlGnJvewbRxbTe9kGF
/mQq8tWVivMlBI01VJCyzvorOFNEEWbRsgheey1YcHFvnaXLAWLwCIUhk8M+NXBp
iv82xDkskgru413rF4CkDYv2RAAM+tLLjmdj3SWlMEuc4kM9Ymo0Jb6+BjStdh9+
Pz/qbACMQhoCYL+47X9HW4G7ekH2JA==
=AL7P
-----END PGP SIGNATURE-----

--oe4jo4jds2sm7egs--

--===============6291923775157242645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6291923775157242645==--
