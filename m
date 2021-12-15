Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E792476094
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 19:20:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08364C5E2C5;
	Wed, 15 Dec 2021 18:20:32 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7285AC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 18:20:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxYt6-0003bp-Qa; Wed, 15 Dec 2021 19:20:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxYt5-004iJ4-Ot; Wed, 15 Dec 2021 19:20:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxYt4-0002Lk-0F; Wed, 15 Dec 2021 19:20:22 +0100
Date: Wed, 15 Dec 2021 19:20:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20211215182018.2ro7vt2qbgpbjzk5@pengutronix.de>
References: <20211215152535.41200-1-u.kleine-koenig@pengutronix.de>
 <4ecadf77-0fa7-80eb-7f1f-0404a236ce58@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <4ecadf77-0fa7-80eb-7f1f-0404a236ce58@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add timer interrupts
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
Content-Type: multipart/mixed; boundary="===============7002863716468517665=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7002863716468517665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opvr7lggvvkkqvsp"
Content-Disposition: inline


--opvr7lggvvkkqvsp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Fabrice,

On Wed, Dec 15, 2021 at 06:43:06PM +0100, Fabrice Gasnier wrote:
> On 12/15/21 4:25 PM, Uwe Kleine-K=F6nig wrote:
> >  .../bindings/mfd/st,stm32-timers.yaml         | 13 +++++++
> >  arch/arm/boot/dts/stm32mp151.dtsi             | 34 +++++++++++++++++++
> >  2 files changed, 47 insertions(+)

> Could you split dt-bindings into a separate patch ?

sure. I considered that before sending, but wasn't sure it's worth these
two little changes.

> I'm a bit curious... I don't see driver update here, to use the timer
> interrupts from the MFD, or child drivers.
> Do you have particular use case in mind ?

My usecase is the compare-capture functionality. The eventual goal is to
measure the frequency of rising edges on an input.

The current situation is that there is already a custom driver for the
i.MX25 SoC, the short-term goal is to replicate it's functionality on
stm32mp1. The long-term goal is to create a counter driver for both.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--opvr7lggvvkkqvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmG6Md8ACgkQwfwUeK3K
7AnN2gf/eCc8QIpUSnk3BE8640RpZPn+wN6Pyj8xi8INwOIOb5Owm1qyUfvoCfjG
20cu1ie53TJ3z0766QtkUAW6jIKyPcSDaskI+/tfaLIFcvmHXK7rrLQqxJw5i8My
OhpYvevX/fbUqVDAM1Z9VpJ6OEOrAA7aa8SguZ/Q7ModVaWewQDcC9fRZ5s/KzUm
G8oun/OJzHGyvbQIMQ1h1ff4KV28w32kFuju3lTf87VzKhTjG3IOj6K0ftlR5iWd
LgvVMnrqQYn6Ln/9V4omM8o+U6NUlxiDFTOmAAuqpldxLpku2OgD3t4C7+i06uU+
CCNyBTWvMUkdDPZGQBURpD4l+3+jIw==
=xGlQ
-----END PGP SIGNATURE-----

--opvr7lggvvkkqvsp--

--===============7002863716468517665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7002863716468517665==--
