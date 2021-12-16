Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E74772B2
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 14:07:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37119C5F1D8;
	Thu, 16 Dec 2021 13:07:34 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE063C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 13:07:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxqTn-000443-EX; Thu, 16 Dec 2021 14:07:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxqTm-004r7E-CV; Thu, 16 Dec 2021 14:07:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxqTk-0004pe-Nu; Thu, 16 Dec 2021 14:07:24 +0100
Date: Thu, 16 Dec 2021 14:07:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20211216130724.qhragmcgtgvgwghq@pengutronix.de>
References: <20211215152535.41200-1-u.kleine-koenig@pengutronix.de>
 <CAL_JsqKW3XJ6n5CLg_BNEaASkUnXLM=J_XZW8M6i7sGPuZ8_9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKW3XJ6n5CLg_BNEaASkUnXLM=J_XZW8M6i7sGPuZ8_9A@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
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
Content-Type: multipart/mixed; boundary="===============7625356950130136668=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7625356950130136668==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jhcaijwvjxwchgmv"
Content-Disposition: inline


--jhcaijwvjxwchgmv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Wed, Dec 15, 2021 at 06:49:33PM -0600, Rob Herring wrote:
> > diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml=
 b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> > index 10b330d42901..5e4214d1613b 100644
> > --- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> > @@ -46,6 +46,19 @@ properties:
> >      minItems: 1
> >      maxItems: 7
> >
> > +  interrupts:
> > +    maxItems: 4
>=20
> Please test this against your dts change. It will fail.

I thought I did. Probably I missed the error message in the noise ...

> You need a 'minItems: 1' otherwise 4 interrupts are always required.

Will address your feedback in a v3. (I sent a v2 already that still
suffers from the issues you pointed out.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jhcaijwvjxwchgmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmG7OgkACgkQwfwUeK3K
7AnibgfzB3/gD2BwmKgOmJcvAR4QPHR88UgN0Z6Ru8KvgvK7xa2GJG2vz/YTHeNM
L6JKso+pJYelRYjEZlD9f3cExmphoDUCHtRun/wTyPtDebOh+Jj5moFmBNGlK7h+
zRpztk7ZERGLbJA4udGQ8JTtE6ualFH8i6/P9ZQQs6HzlnV0ylLPrO0jpJ2ma0+R
BlkVOYBI5XKEON7bmoTzhJdwKeFR+WvbiB3wNYea7vF+dpov5w2ZSxHPqPoxHF1z
kM2XY2wxBcq+A42ITWrlgc6phIsTIUN9WLlikd/+vk4NWhlfFoqDI11XL1lpsss+
ZbnUwITPw6N0sJ1A1bSOEP/MtpKM
=AtDJ
-----END PGP SIGNATURE-----

--jhcaijwvjxwchgmv--

--===============7625356950130136668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7625356950130136668==--
