Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14A4B8F91
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 18:43:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6A6AC5F1F2;
	Wed, 16 Feb 2022 17:43:42 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4483C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 17:43:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nKOKr-0002mV-1E; Wed, 16 Feb 2022 18:43:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nKOKn-00H0SM-3Z; Wed, 16 Feb 2022 18:43:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nKOKl-003bGa-LT; Wed, 16 Feb 2022 18:43:19 +0100
Date: Wed, 16 Feb 2022 18:43:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <20220216174319.rajioisll5b5pfpe@pengutronix.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-8-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
In-Reply-To: <20220216001803.637-8-LinoSanfilippo@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: alexandre.belloni@bootlin.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, s.hauer@pengutronix.de, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.torgue@foss.st.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2 7/9] serial: imx: remove redundant
 assignment in rs485_config
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
Content-Type: multipart/mixed; boundary="===============2169605555119724783=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2169605555119724783==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="da2lbr7flv5tn5tr"
Content-Disposition: inline


--da2lbr7flv5tn5tr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 01:18:01AM +0100, Lino Sanfilippo wrote:
> In uart_set_rs485_config() the serial core already assigns the passed
> serial_rs485 struct to the uart port.
>=20
> So remove the assignment in the drivers rs485_config() function to avoid
> reduncancy.
>=20
> Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--da2lbr7flv5tn5tr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmINN7QACgkQwfwUeK3K
7AlQGAf/ac6fGA3JlB+w+RAXYkZDqG//NDFsdlUzOp7B8hIJ80nDvlVkn9v/gp57
rMUw1/NgNSpn7hyc+3oy9WKurjdN9U2jBd9aIjas2NT5aWJv+AOOmere37nv5N0O
1PUkAm33WZ4vgu9ldLE3al/zvpxjJghaycEZx7+Udtgu7NjtnkMus8XqDQ1TEx6D
RaucYDkywS0Um62zqye+r9kHxEA9wBvdrsHPRf0cw0SpjU01SQ002+zfgpw0BZNh
R+Bmr8a/V6ays42x/njh9U5yNI/vJ4xWWMdZUfSz9u9UYTwArtJlh/hid7FQp6AK
e0RXvaXZKEdVXnU6KKl4m8SoamPP5g==
=S/7p
-----END PGP SIGNATURE-----

--da2lbr7flv5tn5tr--

--===============2169605555119724783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2169605555119724783==--
